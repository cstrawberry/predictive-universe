import PureSFormal.Research.ProtectedTrieParser

/-!
# One protected-trie opening in an arbitrary protected field

This local Research module proves the exact parser delta of one canonical
six- or seven-contraction generator opening.  A `ProtectedFieldContext path`
is an arbitrary nest of already protected ancestors whose hole is the trie
field denoted by `path`; sibling and junk fields are completely unrestricted.

Every proper macro prefix leaves the complete `openedAt?` path set unchanged.
The final contraction exposes one protected node, so the path set changes by
exactly the singleton designated path.  The two literal children are the
generator at `nextPhase`.  Nothing here constructs or orders openings for an
arbitrary finite trie.
-/

namespace PureSFormal.Research.ProtectedTrieSingleOpening

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieParser

/-! ## Arbitrary accepted protected-field contexts -/

/--
A one-hole nest of literal protected nodes.  Its index is the abstract binary
trie path from the outer root to the hole.  All sibling and junk fields are
arbitrary finite pure-`S` terms.
-/
inductive ProtectedFieldContext : List Bool -> Type where
  | hole : ProtectedFieldContext []
  | left {path : List Bool} (inner : ProtectedFieldContext path)
      (right junk : Term) : ProtectedFieldContext (false :: path)
  | right {path : List Bool} (left junk : Term)
      (inner : ProtectedFieldContext path) :
      ProtectedFieldContext (true :: path)

namespace ProtectedFieldContext

/-- Fill the designated protected field. -/
def plug : {path : List Bool} -> ProtectedFieldContext path -> Term -> Term
  | _, .hole, focus => focus
  | _, .left inner sibling debris, focus =>
      protectedNode (plug (path := _) inner focus) sibling debris
  | _, .right sibling debris inner, focus =>
      protectedNode sibling (plug (path := _) inner focus) debris

/-- The literal application-tree address of the designated field. -/
def address : {path : List Bool} -> ProtectedFieldContext path -> Address
  | _, .hole => []
  | _, .left inner _ _ =>
      [.left, .right] ++ address (path := _) inner
  | _, .right _ _ inner =>
      [.right, .left, .right] ++ address (path := _) inner

/-- Extend the designated field to the left child of a new protected node. -/
def extendLeft : {path : List Bool} -> ProtectedFieldContext path ->
    Term -> Term -> ProtectedFieldContext (path ++ [false])
  | _, .hole, sibling, debris => .left .hole sibling debris
  | _, .left inner outerSibling outerDebris, sibling, debris =>
      .left (extendLeft (path := _) inner sibling debris)
        outerSibling outerDebris
  | _, .right outerSibling outerDebris inner, sibling, debris =>
      .right outerSibling outerDebris
        (extendLeft (path := _) inner sibling debris)

/-- Extend the designated field to the right child of a new protected node. -/
def extendRight : {path : List Bool} -> ProtectedFieldContext path ->
    Term -> Term -> ProtectedFieldContext (path ++ [true])
  | _, .hole, sibling, debris => .right sibling debris .hole
  | _, .left inner outerSibling outerDebris, sibling, debris =>
      .left (extendRight (path := _) inner sibling debris)
        outerSibling outerDebris
  | _, .right outerSibling outerDebris inner, sibling, debris =>
      .right outerSibling outerDebris
        (extendRight (path := _) inner sibling debris)

/-- Filling an extended left context is literal protected-node filling. -/
@[simp]
theorem plug_extendLeft {path : List Bool}
    (context : ProtectedFieldContext path) (focus sibling debris : Term) :
    (context.extendLeft sibling debris).plug focus =
      context.plug (protectedNode focus sibling debris) := by
  induction context with
  | hole => rfl
  | left inner outerSibling outerDebris ih =>
      simp only [extendLeft, plug, ih]
  | right outerSibling outerDebris inner ih =>
      simp only [extendLeft, plug, ih]

/-- Filling an extended right context is literal protected-node filling. -/
@[simp]
theorem plug_extendRight {path : List Bool}
    (context : ProtectedFieldContext path) (focus sibling debris : Term) :
    (context.extendRight sibling debris).plug focus =
      context.plug (protectedNode sibling focus debris) := by
  induction context with
  | hole => rfl
  | left inner outerSibling outerDebris ih =>
      simp only [extendRight, plug, ih]
  | right outerSibling outerDebris inner ih =>
      simp only [extendRight, plug, ih]

/-- The extended left field has the expected physical application address. -/
@[simp]
theorem address_extendLeft {path : List Bool}
    (context : ProtectedFieldContext path) (sibling debris : Term) :
    (context.extendLeft sibling debris).address =
      context.address ++ [.left, .right] := by
  induction context with
  | hole => rfl
  | left inner outerSibling outerDebris ih =>
      simpa only [extendLeft, address, List.append_assoc] using
        congrArg (fun suffix => [.left, .right] ++ suffix) ih
  | right outerSibling outerDebris inner ih =>
      simpa only [extendLeft, address, List.append_assoc] using
        congrArg (fun suffix => [.right, .left, .right] ++ suffix) ih

/-- The extended right field has the expected physical application address. -/
@[simp]
theorem address_extendRight {path : List Bool}
    (context : ProtectedFieldContext path) (sibling debris : Term) :
    (context.extendRight sibling debris).address =
      context.address ++ [.right, .left, .right] := by
  induction context with
  | hole => rfl
  | left inner outerSibling outerDebris ih =>
      simpa only [extendRight, address, List.append_assoc] using
        congrArg (fun suffix => [.left, .right] ++ suffix) ih
  | right outerSibling outerDebris inner ih =>
      simpa only [extendRight, address, List.append_assoc] using
        congrArg (fun suffix => [.right, .left, .right] ++ suffix) ih

/-- A local contraction lifts through every accepted protected-field nest. -/
theorem step {path : List Bool} (context : ProtectedFieldContext path)
    {source target : Term} (hstep : Step source target) :
    Step (context.plug source) (context.plug target) := by
  induction context with
  | hole => simpa only [plug] using hstep
  | left inner right junk ih =>
      simpa only [plug, protectedNode, passive] using
        Step.appLeft (Step.appRight (.s : Term) ih) (passive right junk)
  | right left junk inner ih =>
      simpa only [plug, protectedNode, passive] using
        Step.appRight (.app .s left)
          (Step.appLeft (Step.appRight (.s : Term) ih) junk)

/-- An exact local reduction lifts through every accepted protected-field nest. -/
theorem stepsN {path : List Bool} (context : ProtectedFieldContext path)
    {count : Nat} {source target : Term} (hsteps : StepsN count source target) :
    StepsN count (context.plug source) (context.plug target) := by
  induction context with
  | hole => simpa only [plug] using hsteps
  | left inner right junk ih =>
      simpa only [plug, protectedNode, passive] using
        StepsN.appLeft (StepsN.appRight (.s : Term) ih)
          (passive right junk)
  | right left junk inner ih =>
      simpa only [plug, protectedNode, passive] using
        StepsN.appRight (.app .s left)
          (StepsN.appLeft (StepsN.appRight (.s : Term) ih) junk)

/-- Lookup through the physical field address reduces to lookup in the focus. -/
theorem subterm?_plug_append {path : List Bool}
    (context : ProtectedFieldContext path) (focus : Term) (suffix : Address) :
    (context.plug focus).subterm? (context.address ++ suffix) =
      focus.subterm? suffix := by
  induction context with
  | hole => simp only [plug, address, List.nil_append]
  | left inner right junk ih =>
      simpa only [plug, address, protectedNode, passive, List.append_assoc,
        List.cons_append, List.nil_append, Term.subterm?] using ih
  | right left junk inner ih =>
      simpa only [plug, address, protectedNode, passive, List.append_assoc,
        List.cons_append, List.nil_append, Term.subterm?] using ih

/-- At its indexed abstract path, the outer parser sees exactly the focus root. -/
@[simp]
theorem openedAt?_plug_designated {path : List Bool}
    (context : ProtectedFieldContext path) (focus : Term) :
    openedAt? (context.plug focus) path = openedAt? focus [] := by
  induction context with
  | hole => simp only [plug]
  | left inner right junk ih =>
      simpa only [plug, openedAt?, parseProtected?_protectedNode] using ih
  | right left junk inner ih =>
      simpa only [plug, openedAt?, parseProtected?_protectedNode] using ih

/-- A syntactically unprotected root rejects every abstract path. -/
theorem openedAt?_false_of_parseProtected?_none {term : Term}
    (hparse : parseProtected? term = none) (query : List Bool) :
    openedAt? term query = false := by
  cases query with
  | nil => simp [openedAt?, hparse]
  | cons bit rest => cases bit <;> simp [openedAt?, hparse]

/--
Replacing one unprotected focus by another changes no accepted trie path,
even though the surrounding accepted ancestors, siblings, and junk are
arbitrary.
-/
theorem openedAt?_eq_of_parse_none {path : List Bool}
    (context : ProtectedFieldContext path) {first second : Term}
    (hfirst : parseProtected? first = none)
    (hsecond : parseProtected? second = none) (query : List Bool) :
    openedAt? (context.plug first) query =
      openedAt? (context.plug second) query := by
  induction context generalizing query with
  | hole =>
      simp only [plug]
      rw [openedAt?_false_of_parseProtected?_none hfirst query,
        openedAt?_false_of_parseProtected?_none hsecond query]
  | left inner right junk ih =>
      cases query with
      | nil => rfl
      | cons bit rest =>
          cases bit with
          | false =>
              simpa only [plug, openedAt?, parseProtected?_protectedNode] using
                ih rest
          | true => rfl
  | right left junk inner ih =>
      cases query with
      | nil => rfl
      | cons bit rest =>
          cases bit with
          | false => rfl
          | true =>
              simpa only [plug, openedAt?, parseProtected?_protectedNode] using
                ih rest

/--
Replacing an unprotected focus by one protected node with unprotected children
changes the complete parser range by exactly the singleton designated path.
-/
theorem openedAt?_singleton_delta {path : List Bool}
    (context : ProtectedFieldContext path) {before left right junk : Term}
    (hbefore : parseProtected? before = none)
    (hleft : parseProtected? left = none)
    (hright : parseProtected? right = none) (query : List Bool) :
    openedAt? (context.plug (protectedNode left right junk)) query = true <->
      openedAt? (context.plug before) query = true \/ query = path := by
  induction context generalizing query with
  | hole =>
      cases query with
      | nil => simp [plug, openedAt?, hbefore]
      | cons bit rest =>
          cases bit with
          | false =>
              simp [plug, openedAt?, hbefore,
                openedAt?_false_of_parseProtected?_none hleft rest]
          | true =>
              simp [plug, openedAt?, hbefore,
                openedAt?_false_of_parseProtected?_none hright rest]
  | left inner sibling junkField ih =>
      cases query with
      | nil => simp [plug, openedAt?]
      | cons bit rest =>
          cases bit with
          | false =>
              simpa only [plug, openedAt?, parseProtected?_protectedNode,
                List.cons.injEq, Bool.false_eq, true_and] using ih rest
          | true => simp [plug, openedAt?]
  | right sibling junkField inner ih =>
      cases query with
      | nil => simp [plug, openedAt?]
      | cons bit rest =>
          cases bit with
          | false => simp [plug, openedAt?]
          | true =>
              simpa only [plug, openedAt?, parseProtected?_protectedNode,
                List.cons.injEq, Bool.true_eq, true_and] using ih rest

/-- Declarative `OpenedAt` form of the exact singleton replacement delta. -/
theorem OpenedAt.singleton_delta {path : List Bool}
    (context : ProtectedFieldContext path) {before left right junk : Term}
    (hbefore : parseProtected? before = none)
    (hleft : parseProtected? left = none)
    (hright : parseProtected? right = none) (query : List Bool) :
    OpenedAt (context.plug (protectedNode left right junk)) query <->
      OpenedAt (context.plug before) query \/ query = path := by
  constructor
  · intro hopen
    rcases (context.openedAt?_singleton_delta hbefore hleft hright query).mp
        hopen.to_openedAt?_eq_true with hbeforeOpen | hpath
    · exact Or.inl (openedAt?_sound hbeforeOpen)
    · exact Or.inr hpath
  · intro h
    apply openedAt?_sound
    apply (context.openedAt?_singleton_delta hbefore hleft hright query).mpr
    cases h with
    | inl hbeforeOpen => exact Or.inl hbeforeOpen.to_openedAt?_eq_true
    | inr hpath => exact Or.inr hpath

end ProtectedFieldContext

/-! ## The literal six-step positive trace -/

/-- Source of the positive opening. -/
def positive0 (m n : Nat) : Term :=
  D (m + 1) (n + 2)

/-- Term after the first canonical positive contraction. -/
def positive1 (m n : Nat) : Term :=
  let q := .app (C m) (C (n + 2))
  .app (.app (.app .s (C (n + 2))) q) .s

/-- Term after the second canonical positive contraction. -/
def positive2 (m n : Nat) : Term :=
  .app (.app (C (n + 2)) .s) (openingChild m n)

/-- Term after the third canonical positive contraction. -/
def positive3 (m n : Nat) : Term :=
  .app (.app b (.app (C (n + 1)) .s)) (openingChild m n)

/-- Term after the fourth canonical positive contraction. -/
def positive4 (m n : Nat) : Term :=
  .app (.app .s (openingChild m n))
    (.app (.app (C (n + 1)) .s) (openingChild m n))

/-- Term after the fifth and last proper-prefix positive contraction. -/
def positive5 (m n : Nat) : Term :=
  .app (.app .s (openingChild m n))
    (.app (.app b (.app (C n) .s)) (openingChild m n))

theorem positive_step01 (m n : Nat) : Step (positive0 m n) (positive1 m n) := by
  simpa [positive0, positive1, D, C, b, Term.redex, Term.contractum] using
    Step.appLeft (Step.root (.s : Term) (C m) (C (n + 2))) (.s : Term)

theorem positive_step12 (m n : Nat) : Step (positive1 m n) (positive2 m n) := by
  simpa [positive1, positive2, openingChild, D, Term.redex,
    Term.contractum] using
    Step.root (C (n + 2)) (.app (C m) (C (n + 2))) (.s : Term)

theorem positive_step23 (m n : Nat) : Step (positive2 m n) (positive3 m n) := by
  simpa [positive2, positive3, openingChild, C, b, Term.redex,
    Term.contractum] using
    Step.appLeft (Step.root (.s : Term) (C (n + 1)) (.s : Term))
      (openingChild m n)

theorem positive_step34 (m n : Nat) : Step (positive3 m n) (positive4 m n) := by
  simpa [positive3, positive4, b, Term.redex, Term.contractum] using
    Step.root (.s : Term) (.app (C (n + 1)) .s) (openingChild m n)

theorem positive_step45 (m n : Nat) : Step (positive4 m n) (positive5 m n) := by
  have hlocal :
      Step
        (.app (.app (C (n + 1)) .s) (openingChild m n))
        (.app (.app b (.app (C n) .s)) (openingChild m n)) := by
    simpa [C, b, Term.redex, Term.contractum] using
      Step.appLeft (Step.root (.s : Term) (C n) (.s : Term))
        (openingChild m n)
  simpa [positive4, positive5] using
    Step.appRight (.app .s (openingChild m n)) hlocal

theorem positive_step5final (m n : Nat) :
    Step (positive5 m n) (opened m n) := by
  have hlocal :
      Step
        (.app (.app b (.app (C n) .s)) (openingChild m n))
        (passive (openingChild m n)
          (.app (.app (C n) .s) (openingChild m n))) := by
    simpa [passive, b, Term.redex, Term.contractum] using
      Step.root (.s : Term) (.app (C n) .s) (openingChild m n)
  simpa [positive5, opened, protectedNode, openingJunk] using!
    Step.appRight (.app .s (openingChild m n)) hlocal

/-- The six proper stages, indexed by their exact contraction count. -/
inductive PositiveProperStage where
  | zero | one | two | three | four | five
  deriving DecidableEq, Repr

namespace PositiveProperStage

/-- Number of contractions from the positive source to a proper stage. -/
def count : PositiveProperStage -> Nat
  | .zero => 0
  | .one => 1
  | .two => 2
  | .three => 3
  | .four => 4
  | .five => 5

end PositiveProperStage

/-- Literal term at a proper stage of the positive opening. -/
def positiveProperTerm (m n : Nat) : PositiveProperStage -> Term
  | .zero => positive0 m n
  | .one => positive1 m n
  | .two => positive2 m n
  | .three => positive3 m n
  | .four => positive4 m n
  | .five => positive5 m n

/-- Successor term of each proper stage; stage five advances to the endpoint. -/
def positiveProperNext (m n : Nat) : PositiveProperStage -> Term
  | .zero => positive1 m n
  | .one => positive2 m n
  | .two => positive3 m n
  | .three => positive4 m n
  | .four => positive5 m n
  | .five => opened m n

/-- Every adjacent edge of the displayed positive trace is one contraction. -/
theorem positiveProper_step (m n : Nat) (stage : PositiveProperStage) :
    Step (positiveProperTerm m n stage) (positiveProperNext m n stage) := by
  cases stage with
  | zero => exact positive_step01 m n
  | one => exact positive_step12 m n
  | two => exact positive_step23 m n
  | three => exact positive_step34 m n
  | four => exact positive_step45 m n
  | five => exact positive_step5final m n

/-- Every displayed proper stage is reached at its advertised exact count. -/
theorem positiveProper_reachable (m n : Nat) (stage : PositiveProperStage) :
    StepsN stage.count (positive0 m n) (positiveProperTerm m n stage) := by
  cases stage with
  | zero => exact .refl _
  | one => exact StepsN.single (positive_step01 m n)
  | two =>
      simpa [PositiveProperStage.count] using!
        StepsN.tail (StepsN.single (positive_step01 m n)) (positive_step12 m n)
  | three =>
      have h2 := StepsN.tail (StepsN.single (positive_step01 m n))
        (positive_step12 m n)
      simpa [PositiveProperStage.count] using!
        StepsN.tail h2 (positive_step23 m n)
  | four =>
      have h2 := StepsN.tail (StepsN.single (positive_step01 m n))
        (positive_step12 m n)
      have h3 := StepsN.tail h2 (positive_step23 m n)
      simpa [PositiveProperStage.count] using!
        StepsN.tail h3 (positive_step34 m n)
  | five =>
      have h2 := StepsN.tail (StepsN.single (positive_step01 m n))
        (positive_step12 m n)
      have h3 := StepsN.tail h2 (positive_step23 m n)
      have h4 := StepsN.tail h3 (positive_step34 m n)
      simpa [PositiveProperStage.count] using!
        StepsN.tail h4 (positive_step45 m n)

/-- No proper stage of the positive opening is itself a protected node. -/
theorem parseProtected?_positiveProperTerm_none (m n : Nat)
    (stage : PositiveProperStage) :
    parseProtected? (positiveProperTerm m n stage) = none := by
  cases stage <;>
    simp [positiveProperTerm, positive0, positive1, positive2, positive3,
      positive4, positive5, openingChild, D, C, b, parseProtected?]

/-- Every generated child is still syntactically unopened. -/
theorem parseProtected?_openingChild_none (m n : Nat) :
    parseProtected? (openingChild m n) = none := by
  cases m <;> rfl

/-! ## Six-step contextual prefix/delta theorem -/

/-- Every proper positive macro stage is reached inside the same field context. -/
theorem positiveProper_reachable_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat)
    (stage : PositiveProperStage) :
    StepsN stage.count (context.plug (positive0 m n))
      (context.plug (positiveProperTerm m n stage)) :=
  context.stepsN (positiveProper_reachable m n stage)

/-- Every adjacent positive macro edge lifts to the designated protected field. -/
theorem positiveProper_step_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat)
    (stage : PositiveProperStage) :
    Step (context.plug (positiveProperTerm m n stage))
      (context.plug (positiveProperNext m n stage)) :=
  context.step (positiveProper_step m n stage)

/-- Every proper positive prefix leaves the complete opened-path set unchanged. -/
theorem positiveProper_parser_stutter {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat)
    (stage : PositiveProperStage) (query : List Bool) :
    openedAt? (context.plug (positiveProperTerm m n stage)) query =
      openedAt? (context.plug (positive0 m n)) query := by
  apply context.openedAt?_eq_of_parse_none
  · exact parseProtected?_positiveProperTerm_none m n stage
  · exact parseProtected?_positiveProperTerm_none m n .zero

/-- Declarative form: every proper positive prefix preserves every old path exactly. -/
theorem positiveProper_openedAt_stutter {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat)
    (stage : PositiveProperStage) (query : List Bool) :
    OpenedAt (context.plug (positiveProperTerm m n stage)) query <->
      OpenedAt (context.plug (positive0 m n)) query := by
  constructor
  · intro hopen
    apply openedAt?_sound
    rw [← positiveProper_parser_stutter context m n stage query]
    exact hopen.to_openedAt?_eq_true
  · intro hopen
    apply openedAt?_sound
    rw [positiveProper_parser_stutter context m n stage query]
    exact hopen.to_openedAt?_eq_true

/-- In particular, no proper positive prefix opens the designated address. -/
theorem positiveProper_designated_stutter {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat)
    (stage : PositiveProperStage) :
    openedAt? (context.plug (positiveProperTerm m n stage)) path = false := by
  rw [context.openedAt?_plug_designated]
  exact ProtectedFieldContext.openedAt?_false_of_parseProtected?_none
    (parseProtected?_positiveProperTerm_none m n stage) []

/-- The last positive contraction alone exposes the designated protected node. -/
theorem positive_final_step_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    Step (context.plug (positive5 m n)) (context.plug (opened m n)) :=
  context.step (positive_step5final m n)

/--
Exact last-edge theorem: the final positive contraction adds only the
designated `OpenedAt` node to the parser range of its immediate predecessor.
-/
theorem positive_last_step_exact_delta {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    Step (context.plug (positive5 m n)) (context.plug (opened m n)) /\
      forall query,
        OpenedAt (context.plug (opened m n)) query <->
          OpenedAt (context.plug (positive5 m n)) query \/ query = path := by
  refine ⟨positive_final_step_in_field context m n, ?_⟩
  intro query
  simpa [opened] using!
    ProtectedFieldContext.OpenedAt.singleton_delta context
      (parseProtected?_positiveProperTerm_none m n .five)
      (parseProtected?_openingChild_none m n)
      (parseProtected?_openingChild_none m n) query

/-- The completed positive macro opens the designated address. -/
theorem positive_final_designated_open {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    openedAt? (context.plug (opened m n)) path = true := by
  rw [context.openedAt?_plug_designated]
  rfl

/-- The completed positive macro changes the parser range by exactly one path. -/
theorem positive_final_singleton_delta {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) (query : List Bool) :
    openedAt? (context.plug (opened m n)) query = true <->
      openedAt? (context.plug (positive0 m n)) query = true \/ query = path := by
  simpa [opened, positive0] using!
    context.openedAt?_singleton_delta
      (parseProtected?_positiveProperTerm_none m n .zero)
      (parseProtected?_openingChild_none m n)
      (parseProtected?_openingChild_none m n) query

/-- Declarative form of the exact one-node positive parser delta. -/
theorem positive_final_openedAt_singleton_delta {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) (query : List Bool) :
    OpenedAt (context.plug (opened m n)) query <->
      OpenedAt (context.plug (positive0 m n)) query \/ query = path := by
  constructor
  · intro hopen
    rcases (positive_final_singleton_delta context m n query).mp
        hopen.to_openedAt?_eq_true with hbefore | hpath
    · exact Or.inl (openedAt?_sound hbefore)
    · exact Or.inr hpath
  · intro h
    apply openedAt?_sound
    apply (positive_final_singleton_delta context m n query).mpr
    cases h with
    | inl hbefore => exact Or.inl hbefore.to_openedAt?_eq_true
    | inr hpath => exact Or.inr hpath

/-- The complete positive macro still has exact length six in every field. -/
theorem positive_open_six_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    StepsN 6 (context.plug (D (m + 1) (n + 2)))
      (context.plug (opened m n)) :=
  context.stepsN (D_succ_open_six m n)

/-- The final left child is literally the generator at the next phase. -/
theorem positive_final_left_child {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    (context.plug (opened m n)).subterm?
        (context.address ++ [.left, .right]) =
      some (D (nextPhase (m + 1, n + 2)).1
        (nextPhase (m + 1, n + 2)).2) := by
  rw [context.subterm?_plug_append]
  rfl

/-- The final right child is the second literal generator at the next phase. -/
theorem positive_final_right_child {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    (context.plug (opened m n)).subterm?
        (context.address ++ [.right, .left, .right]) =
      some (D (nextPhase (m + 1, n + 2)).1
        (nextPhase (m + 1, n + 2)).2) := by
  rw [context.subterm?_plug_append]
  rfl

/-- The completed target is also a frontier witness for its left child. -/
theorem positive_final_left_frontier {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    (context.extendLeft (openingChild m n) (openingJunk m n)).plug
        (D (nextPhase (m + 1, n + 2)).1
          (nextPhase (m + 1, n + 2)).2) =
      context.plug (opened m n) := by
  rw [context.plug_extendLeft]
  rfl

/-- The completed target is a distinct frontier witness for its right child. -/
theorem positive_final_right_frontier {path : List Bool}
    (context : ProtectedFieldContext path) (m n : Nat) :
    (context.extendRight (openingChild m n) (openingJunk m n)).plug
        (D (nextPhase (m + 1, n + 2)).1
          (nextPhase (m + 1, n + 2)).2) =
      context.plug (opened m n) := by
  rw [context.plug_extendRight]
  rfl

/-! ## The reset-plus-six-step zero trace -/

/-- The seven proper stages of the zero opening: source, then six positive stages. -/
inductive ZeroProperStage where
  | source
  | positive (stage : PositiveProperStage)
  deriving DecidableEq, Repr

namespace ZeroProperStage

/-- Exact contractions from the zero source to a proper stage. -/
def count : ZeroProperStage -> Nat
  | .source => 0
  | .positive stage => stage.count + 1

end ZeroProperStage

/-- Literal term at a proper stage of the seven-step zero opening. -/
def zeroProperTerm (n : Nat) : ZeroProperStage -> Term
  | .source => D 0 (n + 2)
  | .positive stage => positiveProperTerm (n + 2) (n + 1) stage

/-- Successor term of each proper zero stage. -/
def zeroProperNext (n : Nat) : ZeroProperStage -> Term
  | .source => positive0 (n + 2) (n + 1)
  | .positive stage => positiveProperNext (n + 2) (n + 1) stage

/-- Every adjacent edge of the displayed seven-step trace is one contraction. -/
theorem zeroProper_step (n : Nat) (stage : ZeroProperStage) :
    Step (zeroProperTerm n stage) (zeroProperNext n stage) := by
  cases stage with
  | source =>
      simpa [zeroProperTerm, zeroProperNext, positive0, D, C, b,
        Term.redex, Term.contractum, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm] using
          Step.appLeft (Step.root b b (C (n + 2))) (.s : Term)
  | positive stage =>
      exact positiveProper_step (n + 2) (n + 1) stage

/-- Every displayed proper zero stage is reached at its advertised exact count. -/
theorem zeroProper_reachable (n : Nat) (stage : ZeroProperStage) :
    StepsN stage.count (D 0 (n + 2)) (zeroProperTerm n stage) := by
  cases stage with
  | source => exact .refl _
  | positive stage =>
      have hreset := D_zero_reset_one (n + 2)
      have hpositive := positiveProper_reachable (n + 2) (n + 1) stage
      simpa [ZeroProperStage.count, positive0, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm] using! StepsN.trans hreset hpositive

/-- No proper stage of the zero opening is itself a protected node. -/
theorem parseProtected?_zeroProperTerm_none (n : Nat)
    (stage : ZeroProperStage) :
    parseProtected? (zeroProperTerm n stage) = none := by
  cases stage with
  | source => cases n <;> rfl
  | positive stage =>
      exact parseProtected?_positiveProperTerm_none (n + 2) (n + 1) stage

/-! ## Seven-step contextual prefix/delta theorem -/

/-- Every proper zero macro stage is reached inside the same field context. -/
theorem zeroProper_reachable_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat)
    (stage : ZeroProperStage) :
    StepsN stage.count (context.plug (D 0 (n + 2)))
      (context.plug (zeroProperTerm n stage)) :=
  context.stepsN (zeroProper_reachable n stage)

/-- Every adjacent zero macro edge lifts to the designated protected field. -/
theorem zeroProper_step_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat)
    (stage : ZeroProperStage) :
    Step (context.plug (zeroProperTerm n stage))
      (context.plug (zeroProperNext n stage)) :=
  context.step (zeroProper_step n stage)

/-- Every proper zero prefix leaves the complete opened-path set unchanged. -/
theorem zeroProper_parser_stutter {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat)
    (stage : ZeroProperStage) (query : List Bool) :
    openedAt? (context.plug (zeroProperTerm n stage)) query =
      openedAt? (context.plug (D 0 (n + 2))) query := by
  apply context.openedAt?_eq_of_parse_none
  · exact parseProtected?_zeroProperTerm_none n stage
  · exact parseProtected?_zeroProperTerm_none n .source

/-- Declarative form: every proper zero prefix preserves every old path exactly. -/
theorem zeroProper_openedAt_stutter {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat)
    (stage : ZeroProperStage) (query : List Bool) :
    OpenedAt (context.plug (zeroProperTerm n stage)) query <->
      OpenedAt (context.plug (D 0 (n + 2))) query := by
  constructor
  · intro hopen
    apply openedAt?_sound
    rw [← zeroProper_parser_stutter context n stage query]
    exact hopen.to_openedAt?_eq_true
  · intro hopen
    apply openedAt?_sound
    rw [zeroProper_parser_stutter context n stage query]
    exact hopen.to_openedAt?_eq_true

/-- In particular, no proper zero prefix opens the designated address. -/
theorem zeroProper_designated_stutter {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat)
    (stage : ZeroProperStage) :
    openedAt? (context.plug (zeroProperTerm n stage)) path = false := by
  rw [context.openedAt?_plug_designated]
  exact ProtectedFieldContext.openedAt?_false_of_parseProtected?_none
    (parseProtected?_zeroProperTerm_none n stage) []

/-- The last zero-branch contraction alone exposes the designated protected node. -/
theorem zero_final_step_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    Step (context.plug (positive5 (n + 2) (n + 1)))
      (context.plug (opened (n + 2) (n + 1))) :=
  context.step (positive_step5final (n + 2) (n + 1))

/--
Exact last-edge theorem for the seven-step branch: its final contraction adds
only the designated `OpenedAt` node to the immediate predecessor's range.
-/
theorem zero_last_step_exact_delta {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    Step (context.plug (positive5 (n + 2) (n + 1)))
        (context.plug (opened (n + 2) (n + 1))) /\
      forall query,
        OpenedAt (context.plug (opened (n + 2) (n + 1))) query <->
          OpenedAt (context.plug (positive5 (n + 2) (n + 1))) query \/
            query = path := by
  refine ⟨zero_final_step_in_field context n, ?_⟩
  intro query
  simpa [opened] using!
    ProtectedFieldContext.OpenedAt.singleton_delta context
      (parseProtected?_positiveProperTerm_none (n + 2) (n + 1) .five)
      (parseProtected?_openingChild_none (n + 2) (n + 1))
      (parseProtected?_openingChild_none (n + 2) (n + 1)) query

/-- The completed seven-step macro opens the designated address. -/
theorem zero_final_designated_open {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    openedAt? (context.plug (opened (n + 2) (n + 1))) path = true := by
  rw [context.openedAt?_plug_designated]
  rfl

/-- The completed seven-step macro changes the parser range by exactly one path. -/
theorem zero_final_singleton_delta {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) (query : List Bool) :
    openedAt? (context.plug (opened (n + 2) (n + 1))) query = true <->
      openedAt? (context.plug (D 0 (n + 2))) query = true \/ query = path := by
  simpa [opened, zeroProperTerm] using
    context.openedAt?_singleton_delta
      (parseProtected?_zeroProperTerm_none n .source)
      (parseProtected?_openingChild_none (n + 2) (n + 1))
      (parseProtected?_openingChild_none (n + 2) (n + 1)) query

/-- Declarative form of the exact one-node seven-step parser delta. -/
theorem zero_final_openedAt_singleton_delta {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) (query : List Bool) :
    OpenedAt (context.plug (opened (n + 2) (n + 1))) query <->
      OpenedAt (context.plug (D 0 (n + 2))) query \/ query = path := by
  constructor
  · intro hopen
    rcases (zero_final_singleton_delta context n query).mp
        hopen.to_openedAt?_eq_true with hbefore | hpath
    · exact Or.inl (openedAt?_sound hbefore)
    · exact Or.inr hpath
  · intro h
    apply openedAt?_sound
    apply (zero_final_singleton_delta context n query).mpr
    cases h with
    | inl hbefore => exact Or.inl hbefore.to_openedAt?_eq_true
    | inr hpath => exact Or.inr hpath

/-- The complete zero macro still has exact length seven in every field. -/
theorem zero_open_seven_in_field {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    StepsN 7 (context.plug (D 0 (n + 2)))
      (context.plug (opened (n + 2) (n + 1))) :=
  context.stepsN (D_zero_open_seven n)

/-- The final zero-branch left child is the generator at the next phase. -/
theorem zero_final_left_child {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    (context.plug (opened (n + 2) (n + 1))).subterm?
        (context.address ++ [.left, .right]) =
      some (D (nextPhase (0, n + 2)).1 (nextPhase (0, n + 2)).2) := by
  rw [context.subterm?_plug_append]
  simp [openingChild, Nat.add_assoc]

/-- The final zero-branch right child is the second generator at the next phase. -/
theorem zero_final_right_child {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    (context.plug (opened (n + 2) (n + 1))).subterm?
        (context.address ++ [.right, .left, .right]) =
      some (D (nextPhase (0, n + 2)).1 (nextPhase (0, n + 2)).2) := by
  rw [context.subterm?_plug_append]
  simp [openingChild, Nat.add_assoc]

/-- The seven-step target is a frontier witness for its left next-phase child. -/
theorem zero_final_left_frontier {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    (context.extendLeft (openingChild (n + 2) (n + 1))
        (openingJunk (n + 2) (n + 1))).plug
          (D (nextPhase (0, n + 2)).1 (nextPhase (0, n + 2)).2) =
      context.plug (opened (n + 2) (n + 1)) := by
  rw [context.plug_extendLeft]
  simp [openingChild, opened, Nat.add_assoc]

/-- The seven-step target is a distinct frontier witness for its right child. -/
theorem zero_final_right_frontier {path : List Bool}
    (context : ProtectedFieldContext path) (n : Nat) :
    (context.extendRight (openingChild (n + 2) (n + 1))
        (openingJunk (n + 2) (n + 1))).plug
          (D (nextPhase (0, n + 2)).1 (nextPhase (0, n + 2)).2) =
      context.plug (opened (n + 2) (n + 1)) := by
  rw [context.plug_extendRight]
  simp [openingChild, opened, Nat.add_assoc]

end PureSFormal.Research.ProtectedTrieSingleOpening
