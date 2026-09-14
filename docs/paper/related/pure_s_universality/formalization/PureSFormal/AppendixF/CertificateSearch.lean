import PureSFormal.AppendixF.NumericPrograms
import PureSFormal.AppendixF.MaximalPaths

namespace PureSFormal.AppendixF.CertificateSearch
open PureSFormal.PureS PureSFormal.Computation
open PartialRecursive

theorem firstZero_sound (test : Nat → Option Nat) (count start result : Nat)
    (found : Code.firstZero test count start = some result) : test result = some 0 := by
  induction count generalizing start with
  | zero => cases found
  | succ count ih =>
    cases tested : test start with
    | none => simp [Code.firstZero, tested] at found
    | some value =>
      cases value with
      | zero =>
        have same : start = result := by simpa [Code.firstZero, tested] using found
        exact same ▸ tested
      | succ value =>
        apply ih (start + 1)
        simpa only [Code.firstZero, tested] using found

theorem firstZero_exists (test : Nat → Nat) (count start : Nat)
    (witness : ∃ k, start ≤ k ∧ k < start + count ∧ test k = 0) :
    ∃ result, Code.firstZero (fun k => some (test k)) count start = some result := by
  induction count generalizing start with
  | zero => obtain ⟨k, low, high, _⟩ := witness; omega
  | succ count ih =>
    cases tested : test start with
    | zero => exact ⟨start, by simp only [Code.firstZero, tested]⟩
    | succ value =>
      obtain ⟨k, low, high, zero⟩ := witness
      have ne : k ≠ start := by intro same; subst k; omega
      obtain ⟨result, found⟩ := ih (start + 1) ⟨k, by omega, by omega, zero⟩
      exact ⟨result, by simpa only [Code.firstZero, tested] using found⟩

structure Certificate (function : Nat → Nat) where
  check : PRCode 2
  output : PRCode 1
  total : ∀ input, ∃ cert, check.eval₂ input cert = 0
  agrees : ∀ input cert, check.eval₂ input cert = 0 → output.eval₁ cert = function input

def Certificate.program (certificate : Certificate function) : Code 1 :=
  .composeUnary (.primitive certificate.output) (.minimize (.primitive certificate.check))

theorem Certificate.computes (certificate : Certificate function) :
    certificate.program.ComputesTotal function := by
  constructor
  · intro input
    obtain ⟨cert, valid⟩ := certificate.total input
    obtain ⟨result, found⟩ := firstZero_exists (certificate.check.eval₂ input) (cert + 1) 0
      ⟨cert, by omega, by omega, valid⟩
    have zero := firstZero_sound _ _ _ _ found
    have agrees := certificate.agrees input result (Option.some.inj zero)
    refine ⟨cert + 2, ?_⟩
    simp only [Certificate.program, Code.eval₁?, Code.eval?, Code.run?]
    change (do
      let middle ← Code.firstZero (fun k => some (certificate.check.eval₂ input k)) (cert + 1) 0
      some (certificate.output.eval₁ middle)) = some (function input)
    rw [found]
    exact congrArg some agrees
  · intro input fuel value evaluated
    cases fuel with
    | zero => cases evaluated
    | succ fuel =>
      cases fuel with
      | zero => cases evaluated
      | succ fuel =>
        simp only [Certificate.program, Code.eval₁?, Code.eval?, Code.run?] at evaluated
        change (do
          let middle ← Code.firstZero (fun k => some (certificate.check.eval₂ input k)) (fuel + 1) 0
          some (certificate.output.eval₁ middle)) = some value at evaluated
        cases found : Code.firstZero (fun k => some (certificate.check.eval₂ input k)) (fuel + 1) 0 with
        | none => simp only [found, Option.bind_none] at evaluated; cases evaluated
        | some cert =>
          have zero := firstZero_sound _ _ _ _ found
          have same : certificate.output.eval₁ cert = value := by simpa [found] using evaluated
          exact same.symm.trans (certificate.agrees input cert (Option.some.inj zero))

theorem Certificate.computable (certificate : Certificate function) : Computable function :=
  ⟨certificate.program, certificate.computes⟩

end PureSFormal.AppendixF.CertificateSearch
