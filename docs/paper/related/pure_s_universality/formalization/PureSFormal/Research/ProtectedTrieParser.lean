import PureSFormal.Research.ProtectedTrieAlgebra

/-!
# Protected-trie parser monotonicity

This local Research module formalizes the exact protected-node parser used by
the protected binary-trie proposal.  Its principal result is deliberately
evaluation-order independent: an opened path remains opened after an arbitrary
contextual pure-`S` contraction, and hence after any finite reduction.

The proof first decomposes a step out of an application and then out of the
passive records `S left right`.  Since those records have only two head-spine
arguments, every step is strictly inside one of their fields.
-/

namespace PureSFormal.Research.ProtectedTrieParser

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra

/-! ## Contextual-step inversion -/

/-- A step from an application is either at its root or in exactly one child. -/
theorem step_app_cases {fn arg target : Term}
    (h : Step (.app fn arg) target) :
    (exists x y z,
      .app fn arg = Term.redex x y z /\
      target = Term.contractum x y z) \/
    (exists fn', Step fn fn' /\ target = .app fn' arg) \/
    (exists arg', Step arg arg' /\ target = .app fn arg') := by
  rcases h with ⟨ctx, x, y, z, hsource, htarget⟩
  cases ctx with
  | hole =>
      exact Or.inl ⟨x, y, z, hsource, htarget⟩
  | appLeft ctx right =>
      injection hsource with hfn harg
      refine Or.inr (Or.inl ⟨ctx.plug (Term.contractum x y z), ?_, ?_⟩)
      · exact ⟨ctx, x, y, z, hfn, rfl⟩
      · simpa only [harg] using! htarget
  | appRight left ctx =>
      injection hsource with hfn harg
      refine Or.inr (Or.inr ⟨ctx.plug (Term.contractum x y z), ?_, ?_⟩)
      · exact ⟨ctx, x, y, z, harg, rfl⟩
      · simpa only [hfn] using! htarget

/-- The leaf `S` has no contextual redex occurrence. -/
theorem not_step_s (target : Term) : ¬ Step .s target := by
  intro h
  rcases h with ⟨ctx, x, y, z, hsource, _⟩
  cases ctx <;> cases hsource

/-- A passive two-field record can step only inside one of its fields. -/
theorem passive_step_cases {left right target : Term}
    (h : Step (passive left right) target) :
    (exists left', Step left left' /\ target = passive left' right) \/
    (exists right', Step right right' /\ target = passive left right') := by
  rcases step_app_cases h with hroot | hchildren
  · rcases hroot with ⟨x, y, z, hsource, _⟩
    have harity := congrArg Term.headArity hsource
    simp [passive, Term.redex] at harity
  · rcases hchildren with hleftSpine | hright
    · rcases hleftSpine with ⟨spine', hspine, htarget⟩
      rcases step_app_cases hspine with hroot | hchildren
      · rcases hroot with ⟨x, y, z, hsource, _⟩
        have harity := congrArg Term.headArity hsource
        simp [Term.redex] at harity
      · rcases hchildren with hhead | hleft
        · rcases hhead with ⟨head', hhead, _⟩
          exact False.elim (not_step_s head' hhead)
        · rcases hleft with ⟨left', hleft, hspineTarget⟩
          refine Or.inl ⟨left', hleft, ?_⟩
          simp only [passive] at htarget ⊢
          simpa only [hspineTarget] using htarget
    · rcases hright with ⟨right', hright, htarget⟩
      exact Or.inr ⟨right', hright, by simpa [passive] using htarget⟩

/-- A protected node can step only inside its left, right, or junk field. -/
theorem protectedNode_step_cases {left right junk target : Term}
    (h : Step (protectedNode left right junk) target) :
    (exists left',
      Step left left' /\ target = protectedNode left' right junk) \/
    (exists right',
      Step right right' /\ target = protectedNode left right' junk) \/
    (exists junk',
      Step junk junk' /\ target = protectedNode left right junk') := by
  rcases passive_step_cases h with hleft | htail
  · rcases hleft with ⟨left', hleft, htarget⟩
    exact Or.inl ⟨left', hleft, by simpa [protectedNode] using htarget⟩
  · rcases htail with ⟨tail', htail, htarget⟩
    rcases passive_step_cases htail with hright | hjunk
    · rcases hright with ⟨right', hright, htailTarget⟩
      refine Or.inr (Or.inl ⟨right', hright, ?_⟩)
      simpa [protectedNode, htailTarget] using htarget
    · rcases hjunk with ⟨junk', hjunk, htailTarget⟩
      refine Or.inr (Or.inr ⟨junk', hjunk, ?_⟩)
      simpa [protectedNode, htailTarget] using htarget

/-! ## Exact protected-node parsing -/

/-- The three literal fields returned by the protected-node parser. -/
structure ProtectedView where
  left : Term
  right : Term
  junk : Term
  deriving BEq, DecidableEq, Repr

/-- Reconstruct the protected node represented by a parsed view. -/
def ProtectedView.term (view : ProtectedView) : Term :=
  protectedNode view.left view.right view.junk

/--
Recognize exactly the raw application shape `S left (S right junk)`.  No
reduction, global scan, or head-spine normalization is performed.
-/
def parseProtected? : Term -> Option ProtectedView
  | .app (.app .s left) (.app (.app .s right) junk) =>
      some ⟨left, right, junk⟩
  | _ => none

@[simp]
theorem parseProtected?_protectedNode (left right junk : Term) :
    parseProtected? (protectedNode left right junk) =
      some ⟨left, right, junk⟩ :=
  rfl

/-- Every successful parse reconstructs the input term literally. -/
theorem parseProtected?_sound {term : Term} {view : ProtectedView}
    (h : parseProtected? term = some view) :
    term = view.term := by
  cases term with
  | s => simp [parseProtected?] at h
  | app fn arg =>
      cases fn with
      | s => simp [parseProtected?] at h
      | app head left =>
          cases head with
          | app headFn headArg => simp [parseProtected?] at h
          | s =>
              cases arg with
              | s => simp [parseProtected?] at h
              | app tailFn junk =>
                  cases tailFn with
                  | s => simp [parseProtected?] at h
                  | app tailHead right =>
                      cases tailHead with
                      | app tailHeadFn tailHeadArg =>
                          simp [parseProtected?] at h
                      | s =>
                          simp only [parseProtected?, Option.some.injEq] at h
                          subst view
                          rfl

/-- Parsing a reconstructed view returns that same view. -/
@[simp]
theorem parseProtected?_view_term (view : ProtectedView) :
    parseProtected? view.term = some view := by
  cases view
  rfl

/-- Exactness of the protected-node parser. -/
theorem parseProtected?_eq_some_iff {term : Term} {view : ProtectedView} :
    parseProtected? term = some view <-> term = view.term := by
  constructor
  · exact parseProtected?_sound
  · intro h
    rw [h]
    exact parseProtected?_view_term view

/-- A declarative opened-path predicate for the protected binary trie. -/
inductive OpenedAt : Term -> List Bool -> Prop where
  | here (left right junk : Term) :
      OpenedAt (protectedNode left right junk) []
  | downLeft {left : Term} (right junk : Term) {path : List Bool} :
      OpenedAt left path ->
      OpenedAt (protectedNode left right junk) (false :: path)
  | downRight (left : Term) {right : Term} (junk : Term) {path : List Bool} :
      OpenedAt right path ->
      OpenedAt (protectedNode left right junk) (true :: path)

/-- Executable exact parser for a single root-relative binary path. -/
def openedAt? (term : Term) : List Bool -> Bool
  | [] => (parseProtected? term).isSome
  | false :: path =>
      match parseProtected? term with
      | none => false
      | some view => openedAt? view.left path
  | true :: path =>
      match parseProtected? term with
      | none => false
      | some view => openedAt? view.right path

/-- Declaratively opened paths are accepted by the executable parser. -/
theorem OpenedAt.to_openedAt?_eq_true {term : Term} {path : List Bool}
    (h : OpenedAt term path) : openedAt? term path = true := by
  induction h with
  | here => rfl
  | downLeft right junk h ih =>
      simpa only [openedAt?, parseProtected?_protectedNode] using ih
  | downRight left junk h ih =>
      simpa only [openedAt?, parseProtected?_protectedNode] using ih

/-- Every accepted executable path has a literal declarative derivation. -/
theorem openedAt?_sound {term : Term} {path : List Bool}
    (h : openedAt? term path = true) : OpenedAt term path := by
  induction path generalizing term with
  | nil =>
      cases hparse : parseProtected? term with
      | none => simp [openedAt?, hparse] at h
      | some view =>
          have hterm : term = view.term := parseProtected?_sound hparse
          cases view with
          | mk left right junk =>
              rw [hterm]
              exact .here left right junk
  | cons bit path ih =>
      cases bit with
      | false =>
          cases hparse : parseProtected? term with
          | none => simp [openedAt?, hparse] at h
          | some view =>
              have hchild : OpenedAt view.left path := by
                apply ih
                simpa only [openedAt?, hparse] using h
              have hterm : term = view.term := parseProtected?_sound hparse
              cases view with
              | mk left right junk =>
                  rw [hterm]
                  exact .downLeft right junk hchild
      | true =>
          cases hparse : parseProtected? term with
          | none => simp [openedAt?, hparse] at h
          | some view =>
              have hchild : OpenedAt view.right path := by
                apply ih
                simpa only [openedAt?, hparse] using h
              have hterm : term = view.term := parseProtected?_sound hparse
              cases view with
              | mk left right junk =>
                  rw [hterm]
                  exact .downRight left junk hchild

/-- The executable and declarative protected-path parsers agree exactly. -/
theorem openedAt?_eq_true_iff {term : Term} {path : List Bool} :
    openedAt? term path = true <-> OpenedAt term path :=
  ⟨openedAt?_sound, fun h => h.to_openedAt?_eq_true⟩

/-! ## Universal reduction monotonicity -/

/--
Every contextual pure-`S` contraction preserves every already opened path.
The contracted redex may occur anywhere in the three protected fields.
-/
theorem OpenedAt.step_mono {source target : Term} {path : List Bool}
    (hopen : OpenedAt source path) (hstep : Step source target) :
    OpenedAt target path := by
  induction hopen generalizing target with
  | here left right junk =>
      rcases protectedNode_step_cases hstep with hleft | hrest
      · rcases hleft with ⟨left', hleft, htarget⟩
        rw [htarget]
        exact .here left' right junk
      · rcases hrest with hright | hjunk
        · rcases hright with ⟨right', hright, htarget⟩
          rw [htarget]
          exact .here left right' junk
        · rcases hjunk with ⟨junk', hjunk, htarget⟩
          rw [htarget]
          exact .here left right junk'
  | downLeft right junk hopen ih =>
      rcases protectedNode_step_cases hstep with hleft | hrest
      · rcases hleft with ⟨left', hleft, htarget⟩
        rw [htarget]
        exact .downLeft right junk (ih hleft)
      · rcases hrest with hright | hjunk
        · rcases hright with ⟨right', hright, htarget⟩
          rw [htarget]
          exact .downLeft right' junk hopen
        · rcases hjunk with ⟨junk', hjunk, htarget⟩
          rw [htarget]
          exact .downLeft right junk' hopen
  | downRight left junk hopen ih =>
      rcases protectedNode_step_cases hstep with hleft | hrest
      · rcases hleft with ⟨left', hleft, htarget⟩
        rw [htarget]
        exact .downRight left' junk hopen
      · rcases hrest with hright | hjunk
        · rcases hright with ⟨right', hright, htarget⟩
          rw [htarget]
          exact .downRight left junk (ih hright)
        · rcases hjunk with ⟨junk', hjunk, htarget⟩
          rw [htarget]
          exact .downRight left junk' hopen

/-- Executable one-step all-redex monotonicity. -/
theorem openedAt?_step_mono {source target : Term} {path : List Bool}
    (hopen : openedAt? source path = true) (hstep : Step source target) :
    openedAt? target path = true :=
  (OpenedAt.step_mono (openedAt?_sound hopen) hstep).to_openedAt?_eq_true

/-- Every finite reduction preserves every already opened path. -/
theorem OpenedAt.steps_mono {source target : Term} {path : List Bool}
    (hopen : OpenedAt source path) (hsteps : Steps source target) :
    OpenedAt target path := by
  induction hsteps with
  | refl => exact hopen
  | tail hprefix hlast ih => exact ih.step_mono hlast

/-- Executable reflexive-transitive all-redex monotonicity. -/
theorem openedAt?_steps_mono {source target : Term} {path : List Bool}
    (hopen : openedAt? source path = true) (hsteps : Steps source target) :
    openedAt? target path = true :=
  (OpenedAt.steps_mono (openedAt?_sound hopen) hsteps).to_openedAt?_eq_true

/-! ## Frozen outer anchor -/

/-- A term is step-normal when it has no contextual pure-`S` contraction. -/
def StepNormal (term : Term) : Prop :=
  forall target, Not (Step term target)

/-- The literal `S` leaf is step-normal. -/
theorem stepNormal_s : StepNormal .s :=
  not_step_s

/-- The inert two-field outer header `S seed body`. -/
def header (seed body : Term) : Term :=
  passive seed body

/-- A step cannot alter a step-normal header seed. -/
theorem header_step_preserves {seed body target : Term}
    (hseed : StepNormal seed) (hstep : Step (header seed body) target) :
    exists body', Step body body' /\ target = header seed body' := by
  rcases passive_step_cases hstep with hleft | hright
  · rcases hleft with ⟨seed', hseedStep, _⟩
    exact False.elim (hseed seed' hseedStep)
  · rcases hright with ⟨body', hbodyStep, htarget⟩
    exact ⟨body', hbodyStep, by simpa [header] using htarget⟩

/-- A finite reduction preserves a step-normal seed and acts only on the body. -/
theorem header_steps_preserves {seed body target : Term}
    (hseed : StepNormal seed) (hsteps : Steps (header seed body) target) :
    exists body', Steps body body' /\ target = header seed body' := by
  induction hsteps with
  | refl => exact ⟨body, .refl body, rfl⟩
  | tail hprefix hlast ih =>
      rcases ih with ⟨body', hbodySteps, hmiddle⟩
      rw [hmiddle] at hlast
      rcases header_step_preserves hseed hlast with
        ⟨body'', hbodyStep, htarget⟩
      exact ⟨body'', .tail hbodySteps hbodyStep, htarget⟩

/-- The two literal fields returned by the anchored-header parser. -/
structure HeaderView where
  seed : Term
  body : Term
  deriving BEq, DecidableEq, Repr

/-- Parse exactly an outer inert header `S seed body`. -/
def parseHeader? : Term -> Option HeaderView
  | .app (.app .s seed) body => some ⟨seed, body⟩
  | _ => none

@[simp]
theorem parseHeader?_header (seed body : Term) :
    parseHeader? (header seed body) = some ⟨seed, body⟩ :=
  rfl

/-- Every successful outer-header parse reconstructs its input literally. -/
theorem parseHeader?_sound {term : Term} {view : HeaderView}
    (h : parseHeader? term = some view) :
    term = header view.seed view.body := by
  cases term with
  | s => simp [parseHeader?] at h
  | app fn body =>
      cases fn with
      | s => simp [parseHeader?] at h
      | app head seed =>
          cases head with
          | app headFn headArg => simp [parseHeader?] at h
          | s =>
              simp only [parseHeader?, Option.some.injEq] at h
              subst view
              rfl

/-- Exactness of the anchored-header parser. -/
theorem parseHeader?_eq_some_iff {term : Term} {view : HeaderView} :
    parseHeader? term = some view <->
      term = header view.seed view.body := by
  constructor
  · exact parseHeader?_sound
  · intro h
    rw [h]
    cases view
    rfl

/-- An anchored parser inspects protected paths only in the body field. -/
def anchoredOpenedAt? (term : Term) (path : List Bool) : Bool :=
  match parseHeader? term with
  | none => false
  | some view => openedAt? view.body path

@[simp]
theorem anchoredOpenedAt?_header (seed body : Term) (path : List Bool) :
    anchoredOpenedAt? (header seed body) path = openedAt? body path :=
  rfl

/-- Below an exact header, the anchored executable parser is declaratively exact. -/
theorem anchoredOpenedAt?_eq_true_iff {seed body : Term} {path : List Bool} :
    anchoredOpenedAt? (header seed body) path = true <->
      OpenedAt body path :=
  openedAt?_eq_true_iff

/-- One arbitrary contraction preserves every path accepted below a frozen anchor. -/
theorem anchoredOpenedAt?_step_mono {seed body target : Term}
    {path : List Bool} (hseed : StepNormal seed)
    (hopen : anchoredOpenedAt? (header seed body) path = true)
    (hstep : Step (header seed body) target) :
    anchoredOpenedAt? target path = true := by
  rcases header_step_preserves hseed hstep with
    ⟨body', hbodyStep, htarget⟩
  rw [htarget, anchoredOpenedAt?_header]
  exact openedAt?_step_mono hopen hbodyStep

/-- Finite-reduction monotonicity for the exact anchored parser. -/
theorem anchoredOpenedAt?_steps_mono {seed body target : Term}
    {path : List Bool} (hseed : StepNormal seed)
    (hopen : anchoredOpenedAt? (header seed body) path = true)
    (hsteps : Steps (header seed body) target) :
    anchoredOpenedAt? target path = true := by
  rcases header_steps_preserves hseed hsteps with
    ⟨body', hbodySteps, htarget⟩
  rw [htarget, anchoredOpenedAt?_header]
  exact openedAt?_steps_mono hopen hbodySteps

end PureSFormal.Research.ProtectedTrieParser
