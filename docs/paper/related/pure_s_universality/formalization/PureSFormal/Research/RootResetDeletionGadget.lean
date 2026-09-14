import PureSFormal.PureS.CellSpine

/-!
# Root-reset deletion-progress gadget

This module studies a local deletion-progress gadget in isolation.
It neither alters the carrier and scheduler nor changes the
weak-path theorem.

The proposed constructor is `P_i = S S L_i`. Applied to a predecessor `W`,
its root contraction produces `S W (L_i W)`. The right child is then an
ordinary live-cell redex; contracting it produces `S W (S W (v_i W))`.

The module proves both exact occurrence contractions, supplies a total
structural parser for all three stages, proves the fresh and stable stages
disjoint, and gives a dedicated queue grammar in which the second contraction
preserves the already-deleted queue.

No theorem here constructs a root-reset selector or embeds the gadget in the
existing carrier invariant.
-/

namespace PureSFormal.Research.RootResetDeletionGadget

open PureSFormal.PureS

/-- The progress-aware live constructor `P_i = S S L_i`. -/
def progressLive (bit : Bool) : Term := .app b (live bit)

/-- The armed source `P_i W`, before deletion begins. -/
def source (bit : Bool) (predecessor : Term) : Term :=
  .app (progressLive bit) predecessor

/-- The first endpoint `S W (L_i W)`, with a visible right-child redex. -/
def fresh (bit : Bool) (predecessor : Term) : Term :=
  .app (.app .s predecessor) (.app (live bit) predecessor)

/-- The stable endpoint `S W (S W (v_i W))`. -/
def stable (bit : Bool) (predecessor : Term) : Term :=
  .app (.app .s predecessor)
    (.app (.app .s predecessor) (.app (valueTag bit) predecessor))

/-- The source contracts at the root to the fresh stage. -/
@[simp]
theorem contractAt?_source_root (bit : Bool) (predecessor : Term) :
    (source bit predecessor).contractAt? [] = some (fresh bit predecessor) := by
  rfl

/-- The fresh stage exposes the ordinary live-cell redex at address `R`. -/
@[simp]
theorem fresh_right_subterm (bit : Bool) (predecessor : Term) :
    (fresh bit predecessor).subterm? [.right] =
      some (.app (live bit) predecessor) := by
  rfl

/-- The selected right child is itself a strict root redex. -/
@[simp]
theorem fresh_right_contractRoot? (bit : Bool) (predecessor : Term) :
    (Term.app (live bit) predecessor).contractRoot? =
      some (Carrier.tombstone bit predecessor predecessor) := by
  rfl

/-- Contracting the fresh stage at `R` produces the stable stage. -/
@[simp]
theorem contractAt?_fresh_right (bit : Bool) (predecessor : Term) :
    (fresh bit predecessor).contractAt? [.right] =
      some (stable bit predecessor) := by
  rfl

/-- The first mutation is one contextual pure-S contraction. -/
theorem source_step_fresh (bit : Bool) (predecessor : Term) :
    Step (source bit predecessor) (fresh bit predecessor) :=
  Term.contractAt?_sound (contractAt?_source_root bit predecessor)

/-- The second mutation is one contextual pure-S contraction. -/
theorem fresh_step_stable (bit : Bool) (predecessor : Term) :
    Step (fresh bit predecessor) (stable bit predecessor) :=
  Term.contractAt?_sound (contractAt?_fresh_right bit predecessor)

/-- The complete local protocol contains exactly two S-contractions. -/
theorem source_stepsN_stable (bit : Bool) (predecessor : Term) :
    StepsN 2 (source bit predecessor) (stable bit predecessor) := by
  exact StepsN.tail (StepsN.single (source_step_fresh bit predecessor))
    (fresh_step_stable bit predecessor)

/-! ## Total structural recognition -/

/-- The three term-visible stages of the local protocol. -/
inductive Stage where
  | armed
  | fresh
  | stable
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Data recovered from one exact gadget root. -/
structure View where
  stage : Stage
  bit : Bool
  predecessor : Term
  deriving BEq, DecidableEq, Repr

/-- Reconstruct the exact bare term represented by a parsed view. -/
def View.term (view : View) : Term :=
  match view.stage with
  | .armed => source view.bit view.predecessor
  | .fresh => fresh view.bit view.predecessor
  | .stable => stable view.bit view.predecessor

/-- Recognize either reserved value tag. -/
def parseValueTag? (term : Term) : Option Bool :=
  if term = valueTag false then some false
  else if term = valueTag true then some true
  else none

/-- Recognize either ordinary live-cell constructor. -/
def parseLiveConstructor? (term : Term) : Option Bool :=
  if term = live false then some false
  else if term = live true then some true
  else none

@[simp]
theorem parseValueTag?_valueTag (bit : Bool) :
    parseValueTag? (valueTag bit) = some bit := by
  cases bit <;>
    simp [parseValueTag?, CellSpine.valueTag_true_ne_false,
      CellSpine.valueTag_false_ne_true]

@[simp]
theorem parseLiveConstructor?_live (bit : Bool) :
    parseLiveConstructor? (live bit) = some bit := by
  cases bit <;>
    simp [parseLiveConstructor?, live,
      CellSpine.valueTag_true_ne_false, CellSpine.valueTag_false_ne_true]

theorem parseValueTag?_sound {term : Term} {bit : Bool}
    (h : parseValueTag? term = some bit) : term = valueTag bit := by
  unfold parseValueTag? at h
  split at h
  next hfalse => cases h; exact hfalse
  next hfalse =>
    split at h
    next htrue => cases h; exact htrue
    next htrue => simp at h

theorem parseLiveConstructor?_sound {term : Term} {bit : Bool}
    (h : parseLiveConstructor? term = some bit) : term = live bit := by
  unfold parseLiveConstructor? at h
  split at h
  next hfalse => cases h; exact hfalse
  next hfalse =>
    split at h
    next htrue => cases h; exact htrue
    next htrue => simp at h

/-- Recognize the armed source and recover its predecessor. -/
def parseSource? : Term → Option View
  | .app (.app (.app .s .s) constructor) predecessor =>
      (parseLiveConstructor? constructor).map
        (fun bit => ⟨Stage.armed, bit, predecessor⟩)
  | _ => none

/-- Recognize the fresh stage and check its two predecessor copies. -/
def parseFresh? : Term → Option View
  | .app (.app .s predecessor) (.app constructor duplicate) =>
      if duplicate = predecessor then
        (parseLiveConstructor? constructor).map
          (fun bit => ⟨Stage.fresh, bit, predecessor⟩)
      else none
  | _ => none

/-- Recognize the stable stage and check all three predecessor copies. -/
def parseStable? : Term → Option View
  | .app (.app .s predecessor)
      (.app (.app .s duplicate₁) (.app tag duplicate₂)) =>
      if duplicate₁ = predecessor then
        if duplicate₂ = predecessor then
          (parseValueTag? tag).map
            (fun bit => ⟨Stage.stable, bit, predecessor⟩)
        else none
      else none
  | _ => none

/-- Total recognizer, trying the three disjoint public shapes in order. -/
def parse? (term : Term) : Option View :=
  match parseSource? term with
  | some view => some view
  | none =>
      match parseStable? term with
      | some view => some view
      | none => parseFresh? term

@[simp]
theorem parseSource?_source (bit : Bool) (predecessor : Term) :
    parseSource? (source bit predecessor) =
      some ⟨Stage.armed, bit, predecessor⟩ := by
  simp [parseSource?, source, progressLive, b]

@[simp]
theorem parseFresh?_fresh (bit : Bool) (predecessor : Term) :
    parseFresh? (fresh bit predecessor) =
      some ⟨Stage.fresh, bit, predecessor⟩ := by
  simp [parseFresh?, fresh]

@[simp]
theorem parseStable?_stable (bit : Bool) (predecessor : Term) :
    parseStable? (stable bit predecessor) =
      some ⟨Stage.stable, bit, predecessor⟩ := by
  simp [parseStable?, stable]

@[simp]
theorem parse?_source (bit : Bool) (predecessor : Term) :
    parse? (source bit predecessor) =
      some ⟨Stage.armed, bit, predecessor⟩ := by
  unfold parse?
  rw [parseSource?_source]

@[simp]
theorem parse?_fresh (bit : Bool) (predecessor : Term) :
    parse? (fresh bit predecessor) =
      some ⟨Stage.fresh, bit, predecessor⟩ := by
  unfold parse?
  rw [show parseSource? (fresh bit predecessor) = none by rfl]
  rw [show parseStable? (fresh bit predecessor) = none by rfl]
  exact parseFresh?_fresh bit predecessor

@[simp]
theorem parse?_stable (bit : Bool) (predecessor : Term) :
    parse? (stable bit predecessor) =
      some ⟨Stage.stable, bit, predecessor⟩ := by
  unfold parse?
  rw [show parseSource? (stable bit predecessor) = none by rfl]
  simp only
  rw [parseStable?_stable]

/-- Every successful source parse reconstructs its exact source term. -/
theorem parseSource?_sound {term : Term} {view : View}
    (h : parseSource? term = some view) : term = view.term := by
  cases term with
  | s => simp [parseSource?] at h
  | app fn predecessor =>
      cases fn with
      | s => simp [parseSource?] at h
      | app fn₁ constructor =>
          cases fn₁ with
          | s => simp [parseSource?] at h
          | app head fixed =>
              cases head with
              | app _ _ => simp [parseSource?] at h
              | s =>
                  cases fixed with
                  | app _ _ => simp [parseSource?] at h
                  | s =>
                      simp only [parseSource?] at h
                      generalize hc : parseLiveConstructor? constructor = parsed at h
                      cases parsed with
                      | none => simp at h
                      | some bit =>
                          cases h
                          have hconstructor := parseLiveConstructor?_sound hc
                          simp [View.term, source, progressLive, b, hconstructor]

/-- Every successful fresh parse reconstructs its exact fresh term. -/
theorem parseFresh?_sound {term : Term} {view : View}
    (h : parseFresh? term = some view) : term = view.term := by
  cases term with
  | s => simp [parseFresh?] at h
  | app fn right =>
      cases fn with
      | s => simp [parseFresh?] at h
      | app head predecessor =>
          cases head with
          | app _ _ => simp [parseFresh?] at h
          | s =>
              cases right with
              | s => simp [parseFresh?] at h
              | app constructor duplicate =>
                  simp only [parseFresh?] at h
                  split at h
                  next hduplicate =>
                    generalize hc : parseLiveConstructor? constructor = parsed at h
                    cases parsed with
                    | none => simp at h
                    | some bit =>
                        cases h
                        have hconstructor := parseLiveConstructor?_sound hc
                        simp [View.term, fresh, hconstructor, hduplicate]
                  next hduplicate => contradiction

/-- Every successful stable parse reconstructs its exact stable term. -/
theorem parseStable?_sound {term : Term} {view : View}
    (h : parseStable? term = some view) : term = view.term := by
  cases term with
  | s => simp [parseStable?] at h
  | app fn right =>
      cases fn with
      | s => simp [parseStable?] at h
      | app head predecessor =>
          cases head with
          | app _ _ => simp [parseStable?] at h
          | s =>
              cases right with
              | s => simp [parseStable?] at h
              | app rightFn rightArg =>
                  cases rightFn with
                  | s => simp [parseStable?] at h
                  | app rightHead duplicate₁ =>
                      cases rightHead with
                      | app _ _ => simp [parseStable?] at h
                      | s =>
                          cases rightArg with
                          | s => simp [parseStable?] at h
                          | app tag duplicate₂ =>
                              simp only [parseStable?] at h
                              split at h
                              next hduplicate₁ =>
                                split at h
                                next hduplicate₂ =>
                                  generalize hc : parseValueTag? tag = parsed at h
                                  cases parsed with
                                  | none => simp at h
                                  | some bit =>
                                      cases h
                                      have htag := parseValueTag?_sound hc
                                      simp [View.term, stable, htag, hduplicate₁,
                                        hduplicate₂]
                                next hduplicate₂ => contradiction
                              next hduplicate₁ => contradiction

/-- Every successful combined parse reconstructs the exact recognized term. -/
theorem parse?_sound {term : Term} {view : View}
    (h : parse? term = some view) : term = view.term := by
  unfold parse? at h
  generalize hs : parseSource? term = sourceResult at h
  cases sourceResult with
  | some sourceView =>
      cases h
      exact parseSource?_sound hs
  | none =>
      generalize ht : parseStable? term = stableResult at h
      cases stableResult with
      | some stableView =>
          cases h
          exact parseStable?_sound ht
      | none => exact parseFresh?_sound h

/-- Equal armed roots have the same structurally recoverable bit and predecessor. -/
theorem source_injective
    {firstBit secondBit : Bool} {firstPredecessor secondPredecessor : Term}
    (h : source firstBit firstPredecessor =
      source secondBit secondPredecessor) :
    firstBit = secondBit ∧ firstPredecessor = secondPredecessor := by
  have parsed := congrArg parse? h
  simp only [parse?_source, Option.some.injEq] at parsed
  exact ⟨congrArg View.bit parsed, congrArg View.predecessor parsed⟩

/-- Equal fresh roots have the same structurally recoverable bit and predecessor. -/
theorem fresh_injective
    {firstBit secondBit : Bool} {firstPredecessor secondPredecessor : Term}
    (h : fresh firstBit firstPredecessor =
      fresh secondBit secondPredecessor) :
    firstBit = secondBit ∧ firstPredecessor = secondPredecessor := by
  have parsed := congrArg parse? h
  simp only [parse?_fresh, Option.some.injEq] at parsed
  exact ⟨congrArg View.bit parsed, congrArg View.predecessor parsed⟩

/-- Equal stable roots have the same structurally recoverable bit and predecessor. -/
theorem stable_injective
    {firstBit secondBit : Bool} {firstPredecessor secondPredecessor : Term}
    (h : stable firstBit firstPredecessor =
      stable secondBit secondPredecessor) :
    firstBit = secondBit ∧ firstPredecessor = secondPredecessor := by
  have parsed := congrArg parse? h
  simp only [parse?_stable, Option.some.injEq] at parsed
  exact ⟨congrArg View.bit parsed, congrArg View.predecessor parsed⟩

/-! ## Isolated term-only selector -/

/--
Select the next local mutation from the exact parsed stage: root for an armed
cell, `R` for a fresh tombstone, and no mutation for a stable tombstone.

This is a total term-only function for this isolated gadget. Its parser uses
general structural equality to compare duplicated predecessors. No result in
this module realizes `select?` by a finite-state tree walker, proves a move
bound, or extends it to a complete carrier.
-/
def select? (term : Term) : Option Address := do
  let view ← parse? term
  match view.stage with
  | .armed => some []
  | .fresh => some [.right]
  | .stable => none

/-- Apply the locally selected address when one exists. -/
def selectedStep? (term : Term) : Option Term := do
  let address ← select? term
  term.contractAt? address

@[simp]
theorem select?_source (bit : Bool) (predecessor : Term) :
    select? (source bit predecessor) = some [] := by
  simp [select?]

@[simp]
theorem select?_fresh (bit : Bool) (predecessor : Term) :
    select? (fresh bit predecessor) = some [.right] := by
  simp [select?]

@[simp]
theorem select?_stable (bit : Bool) (predecessor : Term) :
    select? (stable bit predecessor) = none := by
  simp [select?]

/-- Applying the selected source address gives the fresh endpoint. -/
@[simp]
theorem selectedStep?_source (bit : Bool) (predecessor : Term) :
    selectedStep? (source bit predecessor) = some (fresh bit predecessor) := by
  simp [selectedStep?]

/-- Applying the selected fresh address gives the stable endpoint. -/
@[simp]
theorem selectedStep?_fresh (bit : Bool) (predecessor : Term) :
    selectedStep? (fresh bit predecessor) = some (stable bit predecessor) := by
  simp [selectedStep?]

/-- A stable endpoint exposes no further local gadget mutation. -/
@[simp]
theorem selectedStep?_stable (bit : Bool) (predecessor : Term) :
    selectedStep? (stable bit predecessor) = none := by
  simp [selectedStep?]

/-! ## Stage disjointness -/

@[simp]
theorem source_ne_fresh (sourceBit freshBit : Bool)
    (sourcePredecessor freshPredecessor : Term) :
    source sourceBit sourcePredecessor ≠ fresh freshBit freshPredecessor := by
  intro h
  have harity := congrArg Term.headArity h
  simp [source, progressLive, fresh, b] at harity

@[simp]
theorem source_ne_stable (sourceBit stableBit : Bool)
    (sourcePredecessor stablePredecessor : Term) :
    source sourceBit sourcePredecessor ≠ stable stableBit stablePredecessor := by
  intro h
  have harity := congrArg Term.headArity h
  simp [source, progressLive, stable, b] at harity

/-- Fresh and stable roots differ because their right children have arities 3 and 2. -/
@[simp]
theorem fresh_ne_stable (freshBit stableBit : Bool)
    (freshPredecessor stablePredecessor : Term) :
    fresh freshBit freshPredecessor ≠ stable stableBit stablePredecessor := by
  intro h
  have hright := congrArg
    (fun term => match term with
      | .app _ right => right.headArity
      | .s => 0) h
  simp [fresh, stable, live] at hright

/-! ## Dedicated queue grammar and parser -/

namespace ProgressSpine

/-- Queue meaning for exactly one local progress gadget. -/
inductive Decodes : Term → List Bool → Prop where
  | armed {predecessor : Term} {bits : List Bool} (bit : Bool)
      (inner : CellSpine.Decodes predecessor bits) :
      Decodes (source bit predecessor) (bits ++ [bit])
  | fresh {predecessor : Term} {bits : List Bool} (bit : Bool)
      (inner : CellSpine.Decodes predecessor bits) :
      Decodes (RootResetDeletionGadget.fresh bit predecessor) bits
  | stable {predecessor : Term} {bits : List Bool} (bit : Bool)
      (inner : CellSpine.Decodes predecessor bits) :
      Decodes (RootResetDeletionGadget.stable bit predecessor) bits

/-- Total parser/decoder for the exact local gadget language. -/
def decode? (term : Term) : Option (List Bool) := do
  let view ← RootResetDeletionGadget.parse? term
  let bits ← CellSpine.decode? view.predecessor
  match view.stage with
  | .armed => some (bits ++ [view.bit])
  | .fresh => some bits
  | .stable => some bits

@[simp]
theorem decode?_source (bit : Bool) (predecessor : Term) :
    decode? (source bit predecessor) =
      (CellSpine.decode? predecessor).map (fun bits => bits ++ [bit]) := by
  rw [show decode? (source bit predecessor) =
      (CellSpine.decode? predecessor).bind
        (fun bits => some (bits ++ [bit])) by simp [decode?]]
  cases CellSpine.decode? predecessor <;> rfl

@[simp]
theorem decode?_fresh (bit : Bool) (predecessor : Term) :
    decode? (RootResetDeletionGadget.fresh bit predecessor) =
      CellSpine.decode? predecessor := by
  simp [decode?]

@[simp]
theorem decode?_stable (bit : Bool) (predecessor : Term) :
    decode? (RootResetDeletionGadget.stable bit predecessor) =
      CellSpine.decode? predecessor := by
  simp [decode?]

/-- The second contraction preserves the already-deleted queue exactly. -/
theorem decode?_fresh_eq_stable (bit : Bool) (predecessor : Term) :
    decode? (RootResetDeletionGadget.fresh bit predecessor) =
      decode? (RootResetDeletionGadget.stable bit predecessor) := by
  simp

/-- Every successful dedicated decode has a declarative derivation. -/
theorem decode?_sound {term : Term} {bits : List Bool}
    (h : decode? term = some bits) : Decodes term bits := by
  unfold decode? at h
  generalize hp : RootResetDeletionGadget.parse? term = parsed at h
  cases parsed with
  | none => simp at h
  | some view =>
      generalize hd : CellSpine.decode? view.predecessor = decoded at h
      cases decoded with
      | none => simp [hd] at h
      | some predecessorBits =>
          have inner : CellSpine.Decodes view.predecessor predecessorBits :=
            CellSpine.decode?_sound hd
          have hterm := RootResetDeletionGadget.parse?_sound hp
          cases view with
          | mk stage bit predecessor =>
              cases stage with
              | armed =>
                  have heq : some (predecessorBits ++ [bit]) = some bits := by
                    simpa [hd] using h
                  have hbits : predecessorBits ++ [bit] = bits := by
                    exact Option.some.inj heq
                  subst bits
                  rw [hterm]
                  exact .armed bit inner
              | fresh =>
                  have heq : some predecessorBits = some bits := by
                    simpa [hd] using h
                  have hbits : predecessorBits = bits := by
                    exact Option.some.inj heq
                  subst bits
                  rw [hterm]
                  exact .fresh bit inner
              | stable =>
                  have heq : some predecessorBits = some bits := by
                    simpa [hd] using h
                  have hbits : predecessorBits = bits := by
                    exact Option.some.inj heq
                  subst bits
                  rw [hterm]
                  exact .stable bit inner

/-- Every declarative local gadget decodes to the same queue. -/
theorem decode?_complete {term : Term} {bits : List Bool}
    (h : Decodes term bits) : decode? term = some bits := by
  cases h with
  | armed bit inner =>
      rw [decode?_source, CellSpine.decode?_complete inner]
      rfl
  | fresh bit inner =>
      rw [decode?_fresh, CellSpine.decode?_complete inner]
  | stable bit inner =>
      rw [decode?_stable, CellSpine.decode?_complete inner]

/-- Executable and declarative meanings coincide on the local language. -/
theorem decode?_eq_some_iff (term : Term) (bits : List Bool) :
    decode? term = some bits ↔ Decodes term bits :=
  ⟨decode?_sound, decode?_complete⟩

/-- Fresh and stable endpoints carry exactly the predecessor's queue. -/
theorem fresh_stable_same_queue
    {predecessor : Term} {bits : List Bool} (bit : Bool)
    (inner : CellSpine.Decodes predecessor bits) :
    Decodes (RootResetDeletionGadget.fresh bit predecessor) bits ∧
      Decodes (RootResetDeletionGadget.stable bit predecessor) bits :=
  ⟨Decodes.fresh bit inner, Decodes.stable bit inner⟩

end ProgressSpine

end PureSFormal.Research.RootResetDeletionGadget
