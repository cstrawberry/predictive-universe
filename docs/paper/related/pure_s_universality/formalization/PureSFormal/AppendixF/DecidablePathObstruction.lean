import PureSFormal.AppendixF.PathSearchPrograms
import PureSFormal.AppendixF.PathConcatenation

namespace PureSFormal.AppendixF.DecidablePathObstruction
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open CertificateSearch ComputabilityCertificates MaximalPaths
open FinitePathPrograms
set_option maxHeartbeats 1000000

theorem certificate_parts (cert : Nat) :
    ∃ ecert pcert gcert, cert = Term.pair ecert (Term.pair pcert gcert) := by
  refine ⟨(Term.unpair cert).1, (Term.unpair (Term.unpair cert).2).1,
    (Term.unpair (Term.unpair cert).2).2, ?_⟩
  rw [Term.pair_unpair, Term.pair_unpair]

/-- The F.2 search theorem. A zero endpoint answer means unavailable; a
    nonzero answer carries a maximal continuation whose acceptance is exactly
    answer = 2. The reachability promise makes certificate search total. -/
theorem search_decides [DecidableEq State] (a : Deterministic State) (source : Nat → Prop)
    (encoder : Nat → Term) (encoderEffective : PartialRecursive.Computable (fun x => (encoder x).code))
    (ending : Nat → Nat) (endingEffective : PartialRecursive.Computable ending)
    (sound : ∀ t, ending t.code ≠ 0 → ∃ path : Path t, path.Accepts a ↔ ending t.code = 2)
    (reaches : ∀ x, ∃ t, Steps (encoder x) t ∧ ending t.code ≠ 0)
    (exactness : Exact source encoder a) : DecidableSet source := by
  classical
  obtain ⟨ec⟩ := (computable_iff_certificate (fun x => (encoder x).code)).mp encoderEffective
  obtain ⟨gc⟩ := (computable_iff_certificate ending).mp endingEffective
  let answer : Nat → Nat := fun x => if source x then 1 else 0
  let certificate : Certificate answer := {
    check := PathSearchPrograms.check a ec gc
    output := PathSearchPrograms.output a ec gc
    total := by
      intro input
      obtain ⟨ecert, evalid⟩ := ec.total input
      have startSame : PathSearchPrograms.start ec ecert = encoder input := by
        rw [PathSearchPrograms.start, ec.agrees _ _ evalid, term_of_code]
      obtain ⟨target, reached, available⟩ := reaches input
      obtain ⟨terms, walk, endSame⟩ := steps_have_walk reached
      obtain ⟨gcert, gvalid⟩ := gc.total target.code
      let pcert := PrimitiveRecursiveListCode.encode (terms.map Term.code)
      have pathSame : PathSearchPrograms.path pcert = terms := decodePath_encode terms
      have lastSame : PathSearchPrograms.last ec ecert pcert = target := by
        rw [PathSearchPrograms.last, startSame, pathSame, endSame]
      refine ⟨Term.pair ecert (Term.pair pcert gcert),
        (PathSearchPrograms.check_correct a ec gc input ecert pcert gcert).mpr ⟨evalid, ?_, ?_, ?_⟩⟩
      · rw [startSame, pathSame]
        exact walk
      · rw [lastSame]
        exact gvalid
      · rw [gc.agrees _ _ gvalid]
        exact available
    agrees := by
      intro input cert checked
      obtain ⟨ecert, pcert, gcert, same⟩ := certificate_parts cert
      subst cert
      obtain ⟨evalid, walk, gvalid, available⟩ :=
        (PathSearchPrograms.check_correct a ec gc input ecert pcert gcert).mp checked
      have startSame : PathSearchPrograms.start ec ecert = encoder input := by
        rw [PathSearchPrograms.start, ec.agrees _ _ evalid, term_of_code]
      have endingSame := gc.agrees _ _ gvalid
      obtain ⟨continuation, continuationCorrect⟩ :=
        sound (PathSearchPrograms.last ec ecert pcert) (endingSame ▸ available)
      let whole := prependWalk (PathSearchPrograms.start ec ecert) (PathSearchPrograms.path pcert) walk continuation
      have wholeExact : source input ↔ whole.Accepts a := by
        have exactStart : ∀ path : Path (PathSearchPrograms.start ec ecert), source input ↔ path.Accepts a := by
          rw [startSame]
          exact exactness input
        exact exactStart whole
      have observed : whole.Accepts a ↔
          0 < PathSearchPrograms.hits a ec ecert pcert ∨ gc.output.eval₁ gcert = 2 := by
        have tailCorrect : continuation.Accepts a ↔ gc.output.eval₁ gcert = 2 := by
          rw [endingSame]
          exact continuationCorrect
        exact (prependWalk_accepts a _ _ walk continuation).trans
          (or_congr (observations_positive a _).symm tailCorrect)
      rw [PathSearchPrograms.output_correct]
      have equivalent := wholeExact.trans observed
      simp only [← equivalent]
      rfl
  }
  refine ⟨answer, certificate.computable, ?_⟩
  intro input
  simp [answer]

/-- Proposition F.2.1 in its algorithmic form, with ordinary computable
    encoders and endpoint algorithms and no bound on preprocessing length. -/
theorem decidable_path_obstruction [DecidableEq State] (a : Deterministic State) (source : Nat → Prop)
    (undecidable : ¬ DecidableSet source) (encoder : Nat → Term)
    (encoderEffective : PartialRecursive.Computable (fun x => (encoder x).code))
    (ending : Nat → Nat) (endingEffective : PartialRecursive.Computable ending)
    (sound : ∀ t, ending t.code ≠ 0 → ∃ path : Path t, path.Accepts a ↔ ending t.code = 2)
    (reaches : ∀ x, ∃ t, Steps (encoder x) t ∧ ending t.code ≠ 0) :
    ¬ Exact source encoder a := by
  intro exactness
  exact undecidable (search_decides a source encoder encoderEffective ending endingEffective sound reaches exactness)

end PureSFormal.AppendixF.DecidablePathObstruction
