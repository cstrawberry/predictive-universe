import PureSFormal.AppendixF.DecidablePathObstruction

namespace PureSFormal.AppendixF.PathFamilies
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open NumericPrograms MaximalPaths ComputabilityCertificates
set_option maxHeartbeats 1000000
attribute [-simp] PrimitiveRecursiveListCode.Program.eval_unary PrimitiveRecursiveListCode.Program.eval_binary

structure Analyzer (a : Deterministic State) where
  answer : Nat → Nat
  effective : PartialRecursive.Computable answer
  sound : ∀ t, answer t.code ≠ 0 → ∃ path : Path t, path.Accepts a ↔ answer t.code = 2

def chooseProgram : PRCode 1 := ifZero PRCode.cantorLeft PRCode.cantorRight PRCode.cantorLeft

theorem chooseProgram_correct (first second : Nat) :
    chooseProgram.eval₁ (Term.pair first second) = if first = 0 then second else first := by
  change chooseProgram.eval [Term.pair first second] = _
  simp only [chooseProgram, eval_ifZero]
  change (if PRCode.cantorLeft.eval₁ (Term.pair first second) = 0 then
    PRCode.cantorRight.eval₁ (Term.pair first second) else PRCode.cantorLeft.eval₁ (Term.pair first second)) = _
  rw [DeterministicTapeCode.eval₁_cantorLeft_eq_unpair_fst,
    DeterministicTapeCode.eval₁_cantorRight_eq_unpair_snd, Term.unpair_pair]

def Analyzer.orElse (first second : Analyzer a) : Analyzer a where
  answer input := if first.answer input = 0 then second.answer input else first.answer input
  effective := by
    have paired := computable_pair first.effective second.effective
    have composed := PartialRecursive.computable_comp
      (PartialRecursive.computable_of_primitiveRecursive
        (show PrimitiveRecursive chooseProgram.eval₁ from ⟨chooseProgram, fun _ => rfl⟩)) paired
    simpa only [chooseProgram_correct] using composed
  sound t active := by
    by_cases firstActive : first.answer t.code = 0
    · have secondActive : second.answer t.code ≠ 0 := by simpa only [firstActive, if_true] using active
      obtain ⟨path, correct⟩ := second.sound t secondActive
      exact ⟨path, by simpa only [firstActive, if_true] using correct⟩
    · obtain ⟨path, correct⟩ := first.sound t firstActive
      exact ⟨path, by simpa only [firstActive, if_false] using correct⟩

theorem orElse_available (first second : Analyzer a) (n : Nat) :
    (first.orElse second).answer n ≠ 0 ↔ first.answer n ≠ 0 ∨ second.answer n ≠ 0 := by
  by_cases active : first.answer n = 0 <;> simp [Analyzer.orElse, active]

def unavailable (a : Deterministic State) : Analyzer a where
  answer _ := 0
  effective := PartialRecursive.computable_of_primitiveRecursive (PrimitiveRecursive.constant 0)
  sound _ active := (active rfl).elim

def union (a : Deterministic State) : List (Analyzer a) → Analyzer a
  | [] => unavailable a
  | first :: rest => first.orElse (union a rest)

theorem union_available (a : Deterministic State) (families : List (Analyzer a)) (n : Nat) :
    (union a families).answer n ≠ 0 ↔ ∃ family ∈ families, family.answer n ≠ 0 := by
  induction families with
  | nil => simp [union, unavailable]
  | cons first rest ih =>
    rw [union, orElse_available, ih]
    simp only [List.mem_cons]
    constructor
    · intro h
      cases h with
      | inl h => exact ⟨first, Or.inl rfl, h⟩
      | inr h => obtain ⟨f, mem, h⟩ := h; exact ⟨f, Or.inr mem, h⟩
    · rintro ⟨f, mem, h⟩
      cases mem with
      | inl same => exact Or.inl (same ▸ h)
      | inr mem => exact Or.inr ⟨f, mem, h⟩

def normalProgram [DecidableEq State] (a : Deterministic State) : PRCode 1 :=
  ifZero (app1 NativeSuccessors.program PRCode.identity)
    (ifZero (app1 (FinitePathPrograms.observeProgram a) PRCode.identity) (lit 1) (lit 2)) (lit 0)

theorem successor_zero_iff (t : Term) : NativeSuccessors.program.eval₁ t.code = 0 ↔ NormalForm t := by
  rw [NativeSuccessors.program_correct]
  constructor
  · intro zero next native
    have member := (NativeSuccessors.successors_iff t next).mpr native
    have mapped : next.code ∈ (NativeSuccessors.successors t).map Term.code :=
      List.mem_map.mpr ⟨next, member, rfl⟩
    have decoded := congrArg PrimitiveRecursiveListCode.decode zero
    rw [PrimitiveRecursiveListCode.decode_encode] at decoded
    rw [show 0 = PrimitiveRecursiveListCode.encode [] from rfl,
      PrimitiveRecursiveListCode.decode_encode] at decoded
    rw [decoded] at mapped
    cases mapped
  · intro normal
    have empty : NativeSuccessors.successors t = [] := by
      cases eq : NativeSuccessors.successors t with
      | nil => rfl
      | cons first rest =>
        have native := (NativeSuccessors.successors_iff t first).mp (eq ▸ List.Mem.head rest)
        exact (normal first native).elim
    rw [empty]
    rfl

theorem normalProgram_value [DecidableEq State] (a : Deterministic State) (t : Term) :
    (normalProgram a).eval₁ t.code =
      if NativeSuccessors.program.eval₁ t.code = 0 then
        (if FinitePathPrograms.observed a t = 0 then 1 else 2) else 0 := by
  change (normalProgram a).eval [t.code] = _
  simp only [normalProgram, eval_ifZero, eval_app1, eval_lit]
  change (if NativeSuccessors.program.eval₁ t.code = 0 then
    (if (FinitePathPrograms.observeProgram a).eval₁ t.code = 0 then 1 else 2) else 0) = _
  rw [FinitePathPrograms.observeProgram_correct]

def normalAnalyzer [DecidableEq State] (a : Deterministic State) : Analyzer a where
  answer := (normalProgram a).eval₁
  effective := PartialRecursive.computable_of_primitiveRecursive ⟨normalProgram a, fun _ => rfl⟩
  sound t active := by
    have value := normalProgram_value a t
    have zero : NativeSuccessors.program.eval₁ t.code = 0 := by
      by_cases zero : NativeSuccessors.program.eval₁ t.code = 0
      · exact zero
      · rw [value, if_neg zero] at active
        exact (active rfl).elim
    let path : Path t := .finite [] t (.nil t) ((successor_zero_iff t).mp zero)
    refine ⟨path, ?_⟩
    rw [value, if_pos zero]
    change ((∃ u ∈ ([] : List Term), a.accepts u = true) ∨ a.accepts t = true) ↔ _
    cases accepted : a.accepts t <;> simp [FinitePathPrograms.observed, accepted]

theorem normal_available [DecidableEq State] (a : Deterministic State) (t : Term) :
    (normalAnalyzer a).answer t.code ≠ 0 ↔ NormalForm t := by
  change (normalProgram a).eval₁ t.code ≠ 0 ↔ _
  rw [normalProgram_value]
  by_cases zero : NativeSuccessors.program.eval₁ t.code = 0
  · have normal := (successor_zero_iff t).mp zero
    simp [zero, normal]
    split <;> decide
  · have notNormal : ¬ NormalForm t := fun h => zero ((successor_zero_iff t).mpr h)
    simp [zero, notNormal]

/-- F.2.1 with finite unions and the normal-form alternative included. -/
theorem finite_union_obstruction [DecidableEq State] (a : Deterministic State) (families : List (Analyzer a))
    (source : Nat → Prop) (undecidable : ¬ DecidableSet source) (encoder : Nat → Term)
    (effective : PartialRecursive.Computable (fun x => (encoder x).code))
    (reaches : ∀ x, ∃ t, Steps (encoder x) t ∧
      ((∃ family ∈ families, family.answer t.code ≠ 0) ∨ NormalForm t)) :
    ¬ Exact source encoder a := by
  let combined := (union a families).orElse (normalAnalyzer a)
  apply DecidablePathObstruction.decidable_path_obstruction a source undecidable encoder effective
    combined.answer combined.effective combined.sound
  intro x
  obtain ⟨t, reached, available⟩ := reaches x
  refine ⟨t, reached, ?_⟩
  exact (orElse_available _ _ _).mpr ((or_congr (union_available a families t.code)
    (normal_available a t)).mpr available)

end PureSFormal.AppendixF.PathFamilies
