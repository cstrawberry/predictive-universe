import PureSFormal.Research.ClosedSetCertificateCompleteness

/-! The explicit finite tree automaton agrees with an actual finite,
read-only controller whenever its inspected run endpoint is stationary and
its accepting configurations are stationary. No size bound is used as a
regularity theorem. -/
namespace PureSFormal.Research.FiniteReadonlyTreeAutomaton
open PureSFormal.PureS FiniteController FiniteTreeAutomatonPowerset ClosedSetTreeAutomaton
open ClosedSetCertificateSoundness ClosedSetCertificateCompleteness

def observed (accept : Fin n → Bool) (configuration : Configuration (Fin n)) : Bool :=
  match configuration.control with
  | none => false
  | some q => accept q

theorem stationary_run (machine : Machine (Fin n)) (configuration : Configuration (Fin n))
    (fixed : step machine configuration = configuration) (ticks : Nat) :
    run machine ticks configuration = configuration := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => rw [run_succ, fixed, ih]

theorem negative_prefix (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (acceptingFixed : ∀ q, accept q = true → ∀ cursor,
      step machine ⟨some q, cursor⟩ = ⟨some q, cursor⟩)
    (initial : Configuration (Fin n)) (ticks : Nat)
    (negative : observed accept (run machine ticks initial) = false)
    (index : Nat) (bounded : index ≤ ticks) (q : Fin n)
    (state : (run machine index initial).control = some q) : accept q = false := by
  cases ready : accept q with
  | false => rfl
  | true =>
    have fixed : step machine (run machine index initial) = run machine index initial := by
      generalize actual : run machine index initial = configuration at *
      rcases configuration with ⟨control, cursor⟩
      change control = some q at state
      subst control
      exact acceptingFixed q ready cursor
    have same : run machine ticks initial = run machine index initial := by
      calc
        run machine ticks initial = run machine (index + (ticks - index)) initial :=
          congrArg (fun amount => run machine amount initial) (Nat.add_sub_of_le bounded).symm
        _ = run machine index initial := by
          rw [run_add]
          exact stationary_run machine _ fixed _
    rw [same] at negative
    simp only [observed, state, ready] at negative
    cases negative

theorem compiled_agrees (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (readOnly : ∀ configuration, mutationCount machine configuration = 0)
    (acceptingFixed : ∀ q, accept q = true → ∀ cursor,
      step machine ⟨some q, cursor⟩ = ⟨some q, cursor⟩)
    (start : Fin n) (source : Term) (ticks : Nat)
    (stable : step machine (run machine ticks ⟨some start, Cursor.atRoot source⟩) =
      run machine ticks ⟨some start, Cursor.atRoot source⟩) :
    (compiled machine accept start).accepts source = true ↔
      observed accept (run machine ticks ⟨some start, Cursor.atRoot source⟩) = true := by
  rw [compiled_accepts_iff_no_certificate]
  constructor
  · intro noCertificate
    cases ready : observed accept (run machine ticks ⟨some start, Cursor.atRoot source⟩) with
    | true => rfl
    | false =>
      exact False.elim (noCertificate (stabilized_negative_certificate machine accept start source ticks stable
        (negative_prefix machine accept acceptingFixed _ ticks ready)))
  · intro accepted certificate
    generalize current : (run machine ticks ⟨some start, Cursor.atRoot source⟩).control = runtime
    cases runtime with
    | none => simp only [observed, current] at accepted; cases accepted
    | some q =>
      have rejected := certificate_excludes_acceptance machine accept readOnly start source certificate ticks q current
      simp only [observed, current, rejected] at accepted
      cases accepted

theorem compiled_agrees_bool (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (readOnly : ∀ configuration, mutationCount machine configuration = 0)
    (acceptingFixed : ∀ q, accept q = true → ∀ cursor,
      step machine ⟨some q, cursor⟩ = ⟨some q, cursor⟩)
    (start : Fin n) (source : Term) (ticks : Nat)
    (stable : step machine (run machine ticks ⟨some start, Cursor.atRoot source⟩) =
      run machine ticks ⟨some start, Cursor.atRoot source⟩) :
    (compiled machine accept start).accepts source =
      observed accept (run machine ticks ⟨some start, Cursor.atRoot source⟩) := by
  have equivalence := compiled_agrees machine accept readOnly acceptingFixed start source ticks stable
  cases left : (compiled machine accept start).accepts source <;>
    cases right : observed accept (run machine ticks ⟨some start, Cursor.atRoot source⟩) <;> try rfl
  · have impossible := equivalence.mpr right; rw [left] at impossible; cases impossible
  · have impossible := equivalence.mp left; rw [right] at impossible; cases impossible

end PureSFormal.Research.FiniteReadonlyTreeAutomaton
