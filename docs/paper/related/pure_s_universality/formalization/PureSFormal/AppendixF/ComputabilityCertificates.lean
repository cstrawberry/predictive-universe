import PureSFormal.AppendixF.GraphCertificates

namespace PureSFormal.AppendixF.ComputabilityCertificates
open PureSFormal.PureS PureSFormal.Computation PartialRecursive
open NumericPrograms CertificateSearch

def checkCode (p : Code 1) : PRCode 2 :=
  app3 (GraphCertificates.program p) (cell (.projection 0) (lit 0))
    (left (.projection 1)) (right (.projection 1))

theorem checkCode_correct (p : Code 1) (input cert : Nat) :
    (checkCode p).eval₂ input cert = 0 ↔
      (GraphCertificates.program p).eval [PrimitiveRecursiveListCode.encode [input],
        (Term.unpair cert).1, (Term.unpair cert).2] = 0 := by
  change (checkCode p).eval [input, cert] = 0 ↔ _
  simp only [checkCode, eval_app3, eval_cell, eval_lit, eval_left, eval_right,
    PrimitiveRecursiveListCode.Program.eval_projection]
  rfl

/-- Every existing closed computability program has finite primitive-checkable
    certificates. This direction prevents any restriction to a smaller model. -/
def ofCode (p : Code 1) (total : p.ComputesTotal function) : Certificate function where
  check := checkCode p
  output := PRCode.cantorLeft
  total input := by
    obtain ⟨fuel, ran⟩ := total.terminates input
    have graph := (CodeGraph.evaluates_iff_run p [input] (function input)).mpr ⟨fuel, ran⟩
    obtain ⟨cert, valid⟩ := (GraphCertificates.program_correct p [input] rfl (function input)).mp graph
    exact ⟨Term.pair (function input) cert, (checkCode_correct _ _ _).mpr
      (by simpa only [Term.unpair_pair] using valid)⟩
  agrees input cert valid := by
    have checked := (checkCode_correct _ _ _).mp valid
    have graph := (GraphCertificates.program_correct p [input] rfl _).mpr ⟨_, checked⟩
    obtain ⟨fuel, ran⟩ := (CodeGraph.evaluates_iff_run p [input] _).mp graph
    rw [DeterministicTapeCode.eval₁_cantorLeft_eq_unpair_fst]
    exact total.agrees input fuel _ ran

theorem computable_iff_certificate (function : Nat → Nat) :
    Computable function ↔ Nonempty (Certificate function) := by
  constructor
  · rintro ⟨p, total⟩; exact ⟨ofCode p total⟩
  · rintro ⟨certificate⟩; exact certificate.computable

def combineCheck (first : Certificate f) (second : Certificate g) : PRCode 2 :=
  add (app2 first.check (.projection 0) (left (.projection 1)))
    (app2 second.check (.projection 0) (right (.projection 1)))

theorem combineCheck_correct (first : Certificate f) (second : Certificate g) (input cert : Nat) :
    (combineCheck first second).eval₂ input cert = 0 ↔
      first.check.eval₂ input (Term.unpair cert).1 = 0 ∧ second.check.eval₂ input (Term.unpair cert).2 = 0 := by
  change (combineCheck first second).eval [input, cert] = 0 ↔ _
  simp only [combineCheck, eval_add, eval_app2, eval_left, eval_right,
    PrimitiveRecursiveListCode.Program.eval_projection, Nat.add_eq_zero_iff]
  rfl

def combine (first : Certificate f) (second : Certificate g) : Certificate (fun x => Term.pair (f x) (g x)) where
  check := combineCheck first second
  output := pair (app1 first.output PRCode.cantorLeft) (app1 second.output PRCode.cantorRight)
  total input := by
    obtain ⟨fcert, fvalid⟩ := first.total input
    obtain ⟨gcert, gvalid⟩ := second.total input
    exact ⟨Term.pair fcert gcert, (combineCheck_correct _ _ _ _).mpr
      (by simpa only [Term.unpair_pair] using And.intro fvalid gvalid)⟩
  agrees input cert valid := by
    obtain ⟨fvalid, gvalid⟩ := (combineCheck_correct _ _ _ _).mp valid
    change (pair (app1 first.output PRCode.cantorLeft) (app1 second.output PRCode.cantorRight)).eval [cert] = _
    rw [eval_pair, eval_app1, eval_app1]
    change Term.pair (first.output.eval₁ (PRCode.cantorLeft.eval₁ cert))
      (second.output.eval₁ (PRCode.cantorRight.eval₁ cert)) = _
    rw [DeterministicTapeCode.eval₁_cantorLeft_eq_unpair_fst,
      DeterministicTapeCode.eval₁_cantorRight_eq_unpair_snd, first.agrees _ _ fvalid, second.agrees _ _ gvalid]

theorem computable_pair (first : Computable f) (second : Computable g) :
    Computable (fun x => Term.pair (f x) (g x)) := by
  obtain ⟨fcert⟩ := (computable_iff_certificate f).mp first
  obtain ⟨gcert⟩ := (computable_iff_certificate g).mp second
  exact (combine fcert gcert).computable

end PureSFormal.AppendixF.ComputabilityCertificates
