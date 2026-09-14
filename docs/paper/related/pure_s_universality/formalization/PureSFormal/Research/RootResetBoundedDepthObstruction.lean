import PureSFormal.PureS.Reduction

/-!
# Fixed-depth term-only selection is insufficient

This module isolates a fixed-prefix lower bound for stateless term-only
selectors. It does not model traversal time or rule out a finite-state
root-reset walker that explores an unbounded portion of each finite input. It
proves only that no uniform fixed-depth root prefix can determine a selector
that is both sound and complete on all pure-S terms.
-/

namespace PureSFormal.Research.RootResetBoundedDepthObstruction

open PureSFormal.PureS

/-- Equality of node kinds at every depth strictly less than `depth`. Thus
`AgreeThrough 1` observes only the root, while at depth zero the payload is
deliberately hidden. -/
def AgreeThrough : Nat → Term → Term → Prop
  | 0, _, _ => True
  | _ + 1, .s, .s => True
  | depth + 1, .app firstFn firstArg, .app secondFn secondArg =>
      AgreeThrough depth firstFn secondFn ∧
        AgreeThrough depth firstArg secondArg
  | _ + 1, _, _ => False

theorem agreeThrough_refl (depth : Nat) (term : Term) :
    AgreeThrough depth term term := by
  induction depth generalizing term with
  | zero => trivial
  | succ depth ih =>
      cases term with
      | s => trivial
      | app fn arg => exact ⟨ih fn, ih arg⟩

/-- Place a payload below `depth` consecutive right edges while keeping every
ancestor at head arity one. -/
def buryRight : Nat → Term → Term
  | 0, payload => payload
  | depth + 1, payload => .app .s (buryRight depth payload)

/-- Payloads below the observation boundary are indistinguishable to a
fixed-depth prefix observer. -/
theorem buryRight_agree (depth : Nat) (first second : Term) :
    AgreeThrough depth (buryRight depth first) (buryRight depth second) := by
  induction depth with
  | zero => trivial
  | succ depth ih =>
      exact ⟨agreeThrough_refl depth .s, ih⟩

/-- The normal comparison term: a right-nested chain of unary applications
of `S`. -/
def normalTerm (depth : Nat) : Term := buryRight depth .s

/-- The reducible comparison term has one saturated redex immediately below
the same right-nested prefix. -/
def reducibleTerm (depth : Nat) : Term :=
  buryRight depth (Term.redex .s .s .s)

/-- The address of the hidden payload. -/
def payloadAddress (depth : Nat) : Address :=
  List.replicate depth .right

@[simp]
theorem subterm?_buryRight_payload (depth : Nat) (payload : Term) :
    (buryRight depth payload).subterm? (payloadAddress depth) =
      some payload := by
  induction depth with
  | zero => simp [buryRight, payloadAddress]
  | succ depth ih =>
      simpa only [buryRight, payloadAddress, List.replicate_succ,
        Term.subterm?] using ih

@[simp]
theorem replace?_buryRight_payload (depth : Nat)
    (payload replacement : Term) :
    (buryRight depth payload).replace? (payloadAddress depth) replacement =
      some (buryRight depth replacement) := by
  induction depth with
  | zero => simp [buryRight, payloadAddress]
  | succ depth ih =>
      simp only [buryRight, payloadAddress, List.replicate_succ,
        Term.replace?]
      have ih' :
          (buryRight depth payload).replace?
              (List.replicate depth Direction.right) replacement =
            some (buryRight depth replacement) := by
        simpa [payloadAddress] using ih
      rw [ih']
      rfl

/-- The hidden comparison redex contracts successfully at its literal
root-relative address. -/
theorem reducibleTerm_contracts (depth : Nat) :
    (reducibleTerm depth).contractAt? (payloadAddress depth) =
      some (buryRight depth (Term.contractum .s .s .s)) := by
  simp [Term.contractAt?, reducibleTerm]

/-- No selected subtree of the unary comparison chain is a root redex. -/
theorem normalTerm_subterm_contractRoot?_none (depth : Nat)
    (address : Address) (selected : Term)
    (selectedAt : (normalTerm depth).subterm? address = some selected) :
    selected.contractRoot? = none := by
  induction depth generalizing address selected with
  | zero =>
      cases address with
      | nil =>
          simp [normalTerm, buryRight, Term.subterm?] at selectedAt
          subst selected
          rfl
      | cons direction rest =>
          cases direction <;>
            simp [normalTerm, buryRight, Term.subterm?] at selectedAt
  | succ depth ih =>
      cases address with
      | nil =>
          simp [normalTerm, buryRight, Term.subterm?] at selectedAt
          subst selected
          rfl
      | cons direction rest =>
          cases direction with
          | left =>
              cases rest with
              | nil =>
                  simp [normalTerm, buryRight, Term.subterm?] at selectedAt
                  subst selected
                  rfl
              | cons next tail =>
                  cases next <;>
                    simp [normalTerm, buryRight, Term.subterm?] at selectedAt
          | right =>
              apply ih rest selected
              simpa [normalTerm, buryRight, Term.subterm?] using selectedAt

/-- The comparison chain containing only unary applications has no
contractible occurrence at any address. -/
theorem normalTerm_contractAt?_none (depth : Nat) (address : Address) :
    (normalTerm depth).contractAt? address = none := by
  unfold Term.contractAt?
  generalize selectedAt : (normalTerm depth).subterm? address = result
  cases result with
  | none => rfl
  | some selected =>
      simp only
      rw [normalTerm_subterm_contractRoot?_none depth address selected selectedAt]

/-- A term-only selector is sound when every returned address is an actual
pure-S redex occurrence. -/
def Sound (select : Term → Option Address) : Prop :=
  ∀ term address, select term = some address →
    ∃ target, term.contractAt? address = some target

/-- A term-only selector is redex-complete when it returns an address for
every term having at least one contractible occurrence. -/
def Complete (select : Term → Option Address) : Prop :=
  ∀ term, (∃ address target, term.contractAt? address = some target) →
    ∃ address, select term = some address

/-- The selector uses only a fixed-depth root prefix when equal visible
prefixes force equal answers. -/
def PrefixLocal (depth : Nat) (select : Term → Option Address) : Prop :=
  ∀ first second, AgreeThrough depth first second →
    select first = select second

/-- No fixed-depth term-only selector is simultaneously prefix-local, sound,
and complete. This is a worst-case fixed-prefix-locality obstruction for
stateless selectors on all pure-S terms. It does not constrain stateful
evaluators, exclude finite-state root-reset walkers with unbounded traversal,
or exclude a fixed-prefix-local selector on some particular encoded reachable
family. -/
theorem no_fixed_depth_sound_complete_selector
    (depth : Nat) (select : Term → Option Address)
    (locality : PrefixLocal depth select)
    (sound : Sound select)
    (complete : Complete select) : False := by
  have reducible :
      ∃ address target,
        (reducibleTerm depth).contractAt? address = some target :=
    ⟨payloadAddress depth,
      buryRight depth (Term.contractum .s .s .s),
      reducibleTerm_contracts depth⟩
  obtain ⟨address, selected⟩ := complete (reducibleTerm depth) reducible
  have indistinguishable :
      AgreeThrough depth (reducibleTerm depth) (normalTerm depth) :=
    buryRight_agree depth _ _
  have sameSelection := locality _ _ indistinguishable
  have normalSelected : select (normalTerm depth) = some address := by
    rw [← sameSelection]
    exact selected
  obtain ⟨target, contracts⟩ := sound (normalTerm depth) address normalSelected
  rw [normalTerm_contractAt?_none] at contracts
  contradiction

end PureSFormal.Research.RootResetBoundedDepthObstruction
