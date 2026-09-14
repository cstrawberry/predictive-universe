import PureSFormal.AppendixF.IndexedCertificates

namespace PureSFormal.AppendixF.CodeGraph
open PureSFormal.Computation PartialRecursive
open CertificateSearch
set_option maxHeartbeats 1000000

def Evaluates : {arity : Nat} → Code arity → List Nat → Nat → Prop
  | _, .primitive p, input, result => p.eval input = result
  | _, .composeUnary outer inner, input, result =>
    ∃ middle, Evaluates inner input middle ∧ Evaluates outer [middle] result
  | arity, .minimize body, input, result =>
    Evaluates body (input.take arity ++ [result]) 0 ∧
      ∀ i, i < result → ∃ value, value ≠ 0 ∧ Evaluates body (input.take arity ++ [i]) value

theorem firstZero_before (test : Nat → Option Nat) (count start result : Nat)
    (found : Code.firstZero test count start = some result) :
    start ≤ result ∧ ∀ i, start ≤ i → i < result → ∃ value, value ≠ 0 ∧ test i = some value := by
  induction count generalizing start with
  | zero => cases found
  | succ count ih =>
    cases tested : test start with
    | none => simp [Code.firstZero, tested] at found
    | some value =>
      cases value with
      | zero =>
        have same : start = result := by simpa [Code.firstZero, tested] using found
        refine ⟨by omega, ?_⟩
        intro i low high
        omega
      | succ value =>
        have remaining : Code.firstZero test count (start + 1) = some result := by
          simpa only [Code.firstZero, tested] using found
        obtain ⟨low, before⟩ := ih _ remaining
        refine ⟨by omega, ?_⟩
        intro i bound high
        by_cases same : i = start
        · exact ⟨value + 1, by omega, same ▸ tested⟩
        · exact before i (by omega) high

theorem firstZero_complete (test : Nat → Option Nat) (result start count : Nat)
    (low : start ≤ result) (high : result < start + count) (zero : test result = some 0)
    (before : ∀ i, start ≤ i → i < result → ∃ value, value ≠ 0 ∧ test i = some value) :
    Code.firstZero test count start = some result := by
  induction count generalizing start with
  | zero => omega
  | succ count ih =>
    by_cases same : start = result
    · subst start
      simp only [Code.firstZero, zero]
    · obtain ⟨value, nonzero, tested⟩ := before start (Nat.le_refl _) (by omega)
      cases value with
      | zero => contradiction
      | succ value =>
        simp only [Code.firstZero, tested]
        exact ih (start + 1) (by omega) (by omega)
          (fun i hi => before i (by omega))

theorem finite_bound (predicate : Nat → Nat → Prop) (count : Nat)
    (monotone : ∀ first second i, first ≤ second → predicate first i → predicate second i)
    (witnesses : ∀ i, i < count → ∃ bound, predicate bound i) :
    ∃ bound, ∀ i, i < count → predicate bound i := by
  induction count with
  | zero => exact ⟨0, by intro i hi; omega⟩
  | succ count ih =>
    obtain ⟨bound, valid⟩ := ih (fun i hi => witnesses i (by omega))
    obtain ⟨last, lastValid⟩ := witnesses count (by omega)
    refine ⟨max bound last, ?_⟩
    intro i hi
    by_cases earlier : i < count
    · exact monotone _ _ _ (Nat.le_max_left _ _) (valid i earlier)
    · have same : i = count := by omega
      exact same ▸ monotone _ _ _ (Nat.le_max_right _ _) lastValid

theorem evaluates_iff_run (p : Code arity) (input : List Nat) (result : Nat) :
    Evaluates p input result ↔ ∃ fuel, p.eval? fuel input = some result := by
  induction p generalizing input result with
  | primitive p =>
    constructor
    · intro same
      exact ⟨0, congrArg some same⟩
    · rintro ⟨fuel, same⟩
      cases fuel <;> exact Option.some.inj same
  | composeUnary outer inner outerIH innerIH =>
    constructor
    · rintro ⟨middle, innerValid, outerValid⟩
      obtain ⟨infuel, innerRun⟩ := (innerIH _ _).mp innerValid
      obtain ⟨outfuel, outerRun⟩ := (outerIH _ _).mp outerValid
      have innerExtended := Code.eval?_monotone inner (Nat.le_max_left infuel outfuel) input innerRun
      have outerExtended := Code.eval?_monotone outer (Nat.le_max_right infuel outfuel) [middle] outerRun
      refine ⟨max infuel outfuel + 1, ?_⟩
      simp only [Code.eval?] at innerExtended outerExtended
      simp only [Code.eval?, Code.run?]
      rw [innerExtended]
      exact outerExtended
    · rintro ⟨fuel, ran⟩
      cases fuel with
      | zero => cases ran
      | succ fuel =>
        change (do let middle ← Code.eval? inner fuel input; Code.eval? outer fuel [middle]) = some result at ran
        cases first : Code.eval? inner fuel input with
        | none => simp [first] at ran
        | some middle =>
          refine ⟨middle, (innerIH _ _).mpr ⟨fuel, first⟩, (outerIH _ _).mpr ⟨fuel, ?_⟩⟩
          simpa [first] using ran
  | @minimize arity body bodyIH =>
    constructor
    · rintro ⟨atResult, before⟩
      let predicate := fun fuel i => ∃ value, body.eval? fuel (input.take arity ++ [i]) = some value ∧
        (if i = result then value = 0 else value ≠ 0)
      have witnesses : ∀ i, i < result + 1 → ∃ fuel, predicate fuel i := by
        intro i hi
        by_cases same : i = result
        · subst i
          obtain ⟨fuel, ran⟩ := (bodyIH _ _).mp atResult
          exact ⟨fuel, 0, ran, by simp⟩
        · obtain ⟨value, nonzero, graph⟩ := before i (by omega)
          obtain ⟨fuel, ran⟩ := (bodyIH _ _).mp graph
          exact ⟨fuel, value, ran, by simpa [same] using nonzero⟩
      obtain ⟨fuel, all⟩ := finite_bound predicate (result + 1)
        (by
          intro first second i mono valid
          obtain ⟨value, ran, property⟩ := valid
          exact ⟨value, Code.eval?_monotone body mono _ ran, property⟩) witnesses
      let bound := max fuel result
      have allExtended : ∀ i, i < result + 1 → predicate bound i := by
        intro i hi
        obtain ⟨value, ran, property⟩ := all i hi
        exact ⟨value, Code.eval?_monotone body (Nat.le_max_left _ _) _ ran, property⟩
      refine ⟨bound + 1, ?_⟩
      change Code.firstZero (fun i => body.eval? bound (input.take arity ++ [i])) (bound + 1) 0 = some result
      apply firstZero_complete _ result 0 _ (by omega) (by have := Nat.le_max_right fuel result; omega)
      · obtain ⟨value, ran, property⟩ := allExtended result (by omega)
        have same : value = 0 := by simpa using property
        exact same ▸ ran
      · intro i _ hi
        obtain ⟨value, ran, property⟩ := allExtended i (by omega)
        exact ⟨value, by simpa [show i ≠ result by omega] using property, ran⟩
    · rintro ⟨fuel, ran⟩
      cases fuel with
      | zero => cases ran
      | succ fuel =>
        change Code.firstZero (fun i => body.eval? fuel (input.take arity ++ [i])) (fuel + 1) 0 = some result at ran
        refine ⟨(bodyIH _ _).mpr ⟨fuel, firstZero_sound _ _ _ _ ran⟩, ?_⟩
        intro i hi
        obtain ⟨value, nonzero, bodyRan⟩ := (firstZero_before _ _ _ _ ran).2 i (by omega) hi
        exact ⟨value, nonzero, (bodyIH _ _).mpr ⟨fuel, bodyRan⟩⟩

end PureSFormal.AppendixF.CodeGraph
