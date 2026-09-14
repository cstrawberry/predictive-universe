import Std

/-!
# Binary deletion-one cyclic tag systems

This file contains the finite transition system used by the pure-`S`
construction.  Positivity of the period is data in `Program`; consequently
every phase successor, including its modular reduction, is total.

`ordinaryStep` is the usual partial deletion-one transition: it is undefined
on the empty dataword.  `absorbingStep` is the total extension used by the
outer dovetail.  On an empty dataword it still advances the cyclic phase, but
the dataword remains empty.
-/

namespace PureSFormal.CTS

/-- A finite nonempty cyclic table of binary appendants. -/
structure Program where
  period : Nat
  period_pos : 0 < period
  appendant : Fin period → List Bool

/-- A phase of `P` is an index into its finite appendant table. -/
abbrev Phase (P : Program) := Fin P.period

/-- The distinguished phase-zero index of a nonempty cyclic program. -/
def zeroPhase (P : Program) : Phase P :=
  ⟨0, P.period_pos⟩

/-- A cyclic-tag configuration consists of its current phase and dataword. -/
structure Config (P : Program) where
  phase : Phase P
  data : List Bool
deriving DecidableEq, Repr

/-- The phase-zero configuration carrying an input dataword. -/
def initial (P : Program) (data : List Bool) : Config P :=
  ⟨zeroPhase P, data⟩

@[simp]
theorem initial_phase (P : Program) (data : List Bool) :
    (initial P data).phase = zeroPhase P :=
  rfl

@[simp]
theorem initial_data (P : Program) (data : List Bool) :
    (initial P data).data = data :=
  rfl

/-- Advance one phase, reducing modulo the positive program period. -/
def nextPhase (P : Program) (q : Phase P) : Phase P :=
  ⟨(q.val + 1) % P.period, Nat.mod_lt _ P.period_pos⟩

@[simp]
theorem nextPhase_val (P : Program) (q : Phase P) :
    (nextPhase P q).val = (q.val + 1) % P.period :=
  rfl

/-- Build a successor configuration at the next cyclic phase. -/
def advance (P : Program) (q : Phase P) (data : List Bool) : Config P :=
  ⟨nextPhase P q, data⟩

@[simp]
theorem advance_phase (P : Program) (q : Phase P) (data : List Bool) :
    (advance P q data).phase = nextPhase P q :=
  rfl

@[simp]
theorem advance_data (P : Program) (q : Phase P) (data : List Bool) :
    (advance P q data).data = data :=
  rfl

/--
The ordinary deletion-one CTS transition.  A leading zero is deleted.  A
leading one is deleted and the current appendant is appended.  The transition
is undefined on the empty dataword.
-/
def ordinaryStep (P : Program) (c : Config P) : Option (Config P) :=
  match c.data with
  | [] => none
  | false :: tail => some (advance P c.phase tail)
  | true :: tail => some (advance P c.phase (tail ++ P.appendant c.phase))

@[simp]
theorem ordinaryStep_empty (P : Program) (q : Phase P) :
    ordinaryStep P ⟨q, []⟩ = none :=
  rfl

@[simp]
theorem ordinaryStep_false (P : Program) (q : Phase P)
    (tail : List Bool) :
    ordinaryStep P ⟨q, false :: tail⟩ = some (advance P q tail) :=
  rfl

@[simp]
theorem ordinaryStep_true (P : Program) (q : Phase P)
    (tail : List Bool) :
    ordinaryStep P ⟨q, true :: tail⟩ =
      some (advance P q (tail ++ P.appendant q)) :=
  rfl

theorem ordinaryStep_eq_none_iff (P : Program) (c : Config P) :
    ordinaryStep P c = none ↔ c.data = [] := by
  cases c with
  | mk q data =>
      cases data with
      | nil => simp
      | cons bit tail => cases bit <;> simp

theorem ordinaryStep_phase {P : Program} {c c' : Config P}
    (h : ordinaryStep P c = some c') :
    c'.phase = nextPhase P c.phase := by
  cases c with
  | mk q data =>
      cases data with
      | nil => simp at h
      | cons bit tail =>
          cases bit <;> simp at h
          · subst c'
            rfl
          · subst c'
            rfl

/--
The total absorbing-empty extension.  Empty data remains empty, while the
phase advances just as it does on every ordinary transition.
-/
def absorbingStep (P : Program) (c : Config P) : Config P :=
  match ordinaryStep P c with
  | some c' => c'
  | none => advance P c.phase []

@[simp]
theorem absorbingStep_empty (P : Program) (q : Phase P) :
    absorbingStep P ⟨q, []⟩ = advance P q [] :=
  rfl

@[simp]
theorem absorbingStep_false (P : Program) (q : Phase P)
    (tail : List Bool) :
    absorbingStep P ⟨q, false :: tail⟩ = advance P q tail :=
  rfl

@[simp]
theorem absorbingStep_true (P : Program) (q : Phase P)
    (tail : List Bool) :
    absorbingStep P ⟨q, true :: tail⟩ =
      advance P q (tail ++ P.appendant q) :=
  rfl

theorem absorbingStep_of_ordinaryStep {P : Program} {c c' : Config P}
    (h : ordinaryStep P c = some c') :
    absorbingStep P c = c' := by
  simp [absorbingStep, h]

@[simp]
theorem absorbingStep_phase (P : Program) (c : Config P) :
    (absorbingStep P c).phase = nextPhase P c.phase := by
  cases c with
  | mk q data =>
      cases data with
      | nil => rfl
      | cons bit tail => cases bit <;> rfl

theorem absorbingStep_data_eq_empty_of_empty {P : Program} {c : Config P}
    (h : c.data = []) :
    (absorbingStep P c).data = [] := by
  cases c with
  | mk q data =>
      simp only at h
      subst data
      rfl

/-- The `n`-fold iterate of the total absorbing transition. -/
def iterate (P : Program) : Nat → Config P → Config P
  | 0, c => c
  | n + 1, c => absorbingStep P (iterate P n c)

@[simp]
theorem iterate_zero (P : Program) (c : Config P) :
    iterate P 0 c = c :=
  rfl

@[simp]
theorem iterate_succ (P : Program) (n : Nat) (c : Config P) :
    iterate P (n + 1) c = absorbingStep P (iterate P n c) :=
  rfl

/-- The analogous `n`-fold iteration on phases alone. -/
def iteratePhase (P : Program) : Nat → Phase P → Phase P
  | 0, q => q
  | n + 1, q => nextPhase P (iteratePhase P n q)

@[simp]
theorem iteratePhase_zero (P : Program) (q : Phase P) :
    iteratePhase P 0 q = q :=
  rfl

@[simp]
theorem iteratePhase_succ (P : Program) (n : Nat) (q : Phase P) :
    iteratePhase P (n + 1) q = nextPhase P (iteratePhase P n q) :=
  rfl

@[simp]
theorem iteratePhase_val (P : Program) (n : Nat) (q : Phase P) :
    (iteratePhase P n q).val = (q.val + n) % P.period := by
  induction n with
  | zero => simp [iteratePhase, Nat.mod_eq_of_lt q.isLt]
  | succ n ih =>
      simp [iteratePhase, ih, Nat.add_assoc]

@[simp]
theorem iteratePhase_period (P : Program) (q : Phase P) :
    iteratePhase P P.period q = q := by
  apply Fin.ext
  simp [Nat.mod_eq_of_lt q.isLt]

@[simp]
theorem iterate_phase (P : Program) (n : Nat) (c : Config P) :
    (iterate P n c).phase = iteratePhase P n c.phase := by
  induction n with
  | zero => rfl
  | succ n ih => simp [iterate, iteratePhase, ih]

@[simp]
theorem iterate_phase_val (P : Program) (n : Nat) (c : Config P) :
    (iterate P n c).phase.val = (c.phase.val + n) % P.period := by
  simp

theorem iterate_empty (P : Program) (n : Nat) (q : Phase P) :
    iterate P n ⟨q, []⟩ = ⟨iteratePhase P n q, []⟩ := by
  induction n with
  | zero => rfl
  | succ n ih => simp [iterate, iteratePhase, ih, advance]

@[simp]
theorem iterate_empty_period (P : Program) (q : Phase P) :
    iterate P P.period ⟨q, []⟩ = ⟨q, []⟩ := by
  simp [iterate_empty]

@[simp]
theorem iterate_empty_data (P : Program) (n : Nat) (q : Phase P) :
    (iterate P n ⟨q, []⟩).data = [] := by
  rw [iterate_empty]

theorem iterate_add (P : Program) (m n : Nat) (c : Config P) :
    iterate P (m + n) c = iterate P m (iterate P n c) := by
  induction m with
  | zero => simp
  | succ m ih => simp [Nat.succ_add, iterate, ih]

end PureSFormal.CTS
