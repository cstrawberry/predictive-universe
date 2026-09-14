import PureSFormal.PureS.Term

/-!
# Pure-S reduction

The sole mutation is the strict occurrence-root contraction

`(((S X) Y) Z)  ↦  (X Z) (Y Z)`.

`Step` closes that root rule under an arbitrary one-hole application context.
`contractAt?` is an executable address-level specification, and its soundness
theorem shows that every successful result is one `Step`.  Reduction is not
globally deterministic because a term may contain several redex occurrences;
it is deterministic once the occurrence address is fixed.
-/

namespace PureSFormal.PureS

namespace Term

/-- The left-hand side of the pure-S rule. -/
def redex (x y z : Term) : Term := .app (.app (.app .s x) y) z

/-- The right-hand side of the pure-S rule. -/
def contractum (x y z : Term) : Term := .app (.app x z) (.app y z)

/--
Contract only when the supplied term itself is exactly one saturated S redex.
In particular, this does not contract a redex hidden in the left child of a
term carrying an additional argument.
-/
def contractRoot? : Term → Option Term
  | .app (.app (.app .s x) y) z => some (contractum x y z)
  | _ => none

@[simp]
theorem contractRoot?_redex (x y z : Term) :
    (redex x y z).contractRoot? = some (contractum x y z) := rfl

/-- Contract the redex at exactly `address`, if that occurrence is a redex. -/
def contractAt? (term : Term) (address : Address) : Option Term :=
  match term.subterm? address with
  | none => none
  | some selected =>
      match selected.contractRoot? with
      | none => none
      | some replacement => term.replace? address replacement

end Term

/-- One contextual contraction of the pure-S rule. -/
def Step (source target : Term) : Prop :=
  ∃ ctx : Context, ∃ x y z : Term,
    source = ctx.plug (Term.redex x y z) ∧
    target = ctx.plug (Term.contractum x y z)

namespace Step

/-- The defining contraction at the root is one contextual step. -/
theorem root (x y z : Term) :
    Step (Term.redex x y z) (Term.contractum x y z) := by
  exact ⟨.hole, x, y, z, rfl, rfl⟩

/-- A one-step contraction remains one step inside any outer context. -/
theorem inContext {source target : Term} (h : Step source target) (outer : Context) :
    Step (outer.plug source) (outer.plug target) := by
  obtain ⟨inner, x, y, z, hsource, htarget⟩ := h
  refine ⟨outer.comp inner, x, y, z, ?_, ?_⟩
  · simp only [Context.plug_comp, hsource]
  · simp only [Context.plug_comp, htarget]

theorem appLeft {source target : Term} (h : Step source target) (arg : Term) :
    Step (.app source arg) (.app target arg) := by
  simpa only [Context.plug] using h.inContext (.appLeft .hole arg)

theorem appRight (fn : Term) {source target : Term} (h : Step source target) :
    Step (.app fn source) (.app fn target) := by
  simpa only [Context.plug] using h.inContext (.appRight fn .hole)

end Step

namespace Term

/-- A successful strict root contraction denotes the defining root step. -/
theorem contractRoot?_sound {source target : Term}
    (h : source.contractRoot? = some target) : Step source target := by
  cases source with
  | s =>
      simp [contractRoot?] at h
  | app fn z =>
      cases fn with
      | s =>
          simp [contractRoot?] at h
      | app fn₂ y =>
          cases fn₂ with
          | s =>
              simp [contractRoot?] at h
          | app head x =>
              cases head with
              | s =>
                  simp only [contractRoot?, Option.some.injEq] at h
                  subst target
                  exact Step.root x y z
              | app headFn headArg =>
                  simp [contractRoot?] at h

/-- Strict root contraction is deterministic. -/
theorem contractRoot?_deterministic
    {source target₁ target₂ : Term}
    (h₁ : source.contractRoot? = some target₁)
    (h₂ : source.contractRoot? = some target₂) :
    target₁ = target₂ := by
  rw [h₁] at h₂
  exact Option.some.inj h₂

/--
Replacement soundness for the root rule: expose a selected occurrence,
contract it at its own root, and fill the original surrounding context.
-/
theorem replace_root_step_sound
    {source selected replacement target : Term} {address : Address}
    (hselected : source.subterm? address = some selected)
    (hroot : selected.contractRoot? = some replacement)
    (hreplaced : source.replace? address replacement = some target) :
    Step source target := by
  obtain ⟨ctx, hplug, hreplace⟩ := context_of_subterm hselected
  have hlocal : Step selected replacement := contractRoot?_sound hroot
  have hlifted : Step (ctx.plug selected) (ctx.plug replacement) :=
    hlocal.inContext ctx
  have htarget : target = ctx.plug replacement := by
    have hs : some target = some (ctx.plug replacement) := by
      calc
        some target = source.replace? address replacement := hreplaced.symm
        _ = some (ctx.plug replacement) := hreplace replacement
    exact Option.some.inj hs
  simpa only [hplug, ← htarget] using hlifted

/-- Successful address contraction exposes lookup, root, and replacement witnesses. -/
theorem contractAt?_spec
    {source target : Term} {address : Address}
    (h : source.contractAt? address = some target) :
    ∃ selected replacement,
      source.subterm? address = some selected ∧
      selected.contractRoot? = some replacement ∧
      source.replace? address replacement = some target := by
  unfold contractAt? at h
  generalize hselected : source.subterm? address = selected? at h
  cases selected? with
  | none =>
      simp at h
  | some selected =>
      change (match selected.contractRoot? with
        | none => none
        | some replacement => source.replace? address replacement) = some target at h
      generalize hroot : selected.contractRoot? = replacement? at h
      cases replacement? with
      | none =>
          contradiction
      | some replacement =>
          exact ⟨selected, replacement, rfl, hroot, h⟩

/-- Every successful address-level contraction is one contextual S-step. -/
theorem contractAt?_sound
    {source target : Term} {address : Address}
    (h : source.contractAt? address = some target) :
    Step source target := by
  obtain ⟨selected, replacement, hselected, hroot, hreplaced⟩ :=
    contractAt?_spec h
  exact replace_root_step_sound hselected hroot hreplaced

/-- Address-level contraction is deterministic at a fixed occurrence. -/
theorem contractAt?_deterministic
    {source target₁ target₂ : Term} {address : Address}
    (h₁ : source.contractAt? address = some target₁)
    (h₂ : source.contractAt? address = some target₂) :
    target₁ = target₂ := by
  rw [h₁] at h₂
  exact Option.some.inj h₂

end Term

/-- The reflexive-transitive closure of contextual pure-S contraction. -/
inductive Steps : Term → Term → Prop where
  | refl (term : Term) : Steps term term
  | tail {source middle target : Term} :
      Steps source middle → Step middle target → Steps source target

namespace Steps

theorem single {source target : Term} (h : Step source target) :
    Steps source target := .tail (.refl source) h

theorem trans {source middle target : Term}
    (h₁ : Steps source middle) (h₂ : Steps middle target) :
    Steps source target := by
  induction h₂ with
  | refl => exact h₁
  | tail hprefix hlast ih => exact .tail ih hlast

/-- Multi-step reduction is closed under any fixed outer context. -/
theorem inContext {source target : Term} (h : Steps source target) (ctx : Context) :
    Steps (ctx.plug source) (ctx.plug target) := by
  induction h with
  | refl => exact .refl _
  | tail hprefix hlast ih => exact .tail ih (hlast.inContext ctx)

end Steps

end PureSFormal.PureS
