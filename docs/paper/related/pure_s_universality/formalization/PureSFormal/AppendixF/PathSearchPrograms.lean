import PureSFormal.AppendixF.FinitePathPrograms
import PureSFormal.AppendixF.ComputabilityCertificates

namespace PureSFormal.AppendixF.PathSearchPrograms
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open NumericPrograms CertificateSearch
set_option maxHeartbeats 1000000
attribute [-simp] PrimitiveRecursiveListCode.Program.eval_unary PrimitiveRecursiveListCode.Program.eval_binary

theorem eval_p0 (a b : Nat) : (PRCode.projection (0 : Fin 2)).eval [a,b] = a := rfl
theorem eval_p1 (a b : Nat) : (PRCode.projection (1 : Fin 2)).eval [a,b] = b := rfl
theorem eval_identity (a : Nat) : PRCode.identity.eval [a] = a := rfl

def start (encoder : Certificate f) (ecert : Nat) := FinitePathPrograms.term (encoder.output.eval₁ ecert)
def path (pcert : Nat) := FinitePathPrograms.decodePath pcert
def last (encoder : Certificate f) (ecert pcert : Nat) := FinitePathPrograms.endpoint (start encoder ecert) (path pcert)
def hits (a : Deterministic State) (encoder : Certificate f) (ecert pcert : Nat) :=
  FinitePathPrograms.observations a (start encoder ecert :: path pcert)

def summary [DecidableEq State] (a : Deterministic State) (encoder : Certificate f) (cert : PRCode arity) :=
  app2 (FinitePathPrograms.program a) (app1 encoder.output (left cert)) (left (right cert))

theorem summary_correct [DecidableEq State] (a : Deterministic State) (encoder : Certificate f)
    (cert : PRCode arity) (args : List Nat) (ecert pcert gcert : Nat)
    (code : cert.eval args = Term.pair ecert (Term.pair pcert gcert)) :
    (summary a encoder cert).eval args = FinitePathPrograms.pack (last encoder ecert pcert)
      (FinitePathPrograms.faults (start encoder ecert) (path pcert)) (hits a encoder ecert pcert) := by
  simp only [summary, eval_app2, eval_app1, eval_left, eval_right, code, Term.unpair_pair]
  exact FinitePathPrograms.program_numeric a _ _

def check [DecidableEq State] (a : Deterministic State) (encoder : Certificate f) (ending : Certificate g) : PRCode 2 :=
  let cert : PRCode 2 := .projection 1
  let state := summary a encoder cert
  add (add (add (app2 encoder.check (.projection 0) (left cert)) (left (right state)))
    (app2 ending.check (left state) (right (right cert))))
    (ifZero (app1 ending.output (right (right cert))) (lit 1) (lit 0))

theorem check_correct [DecidableEq State] (a : Deterministic State) (encoder : Certificate f) (ending : Certificate g)
    (input ecert pcert gcert : Nat) :
    (check a encoder ending).eval₂ input (Term.pair ecert (Term.pair pcert gcert)) = 0 ↔
      encoder.check.eval₂ input ecert = 0 ∧
      FinitePathPrograms.Walk (start encoder ecert) (path pcert) ∧
      ending.check.eval₂ (last encoder ecert pcert).code gcert = 0 ∧ ending.output.eval₁ gcert ≠ 0 := by
  change (check a encoder ending).eval [input, Term.pair ecert (Term.pair pcert gcert)] = 0 ↔ _
  simp only [check, eval_add, Nat.add_eq_zero_iff, eval_app2, eval_left, eval_right,
    eval_ifZero, eval_app1, eval_lit]
  rw [summary_correct a encoder (.projection 1) _ ecert pcert gcert rfl]
  simp only [eval_p0, eval_p1, FinitePathPrograms.pack, Term.unpair_pair, FinitePathPrograms.faults_zero]
  by_cases active : ending.output.eval₁ gcert = 0 <;> simp [active, and_assoc]

def output [DecidableEq State] (a : Deterministic State) (encoder : Certificate f) (ending : Certificate g) : PRCode 1 :=
  pos (add (right (right (summary a encoder PRCode.identity)))
    (eqn (app1 ending.output (right (right PRCode.identity))) (lit 2)))

theorem output_correct [DecidableEq State] (a : Deterministic State) (encoder : Certificate f) (ending : Certificate g)
    (ecert pcert gcert : Nat) :
    (output a encoder ending).eval₁ (Term.pair ecert (Term.pair pcert gcert)) =
      if 0 < hits a encoder ecert pcert ∨ ending.output.eval₁ gcert = 2 then 1 else 0 := by
  change (output a encoder ending).eval [Term.pair ecert (Term.pair pcert gcert)] = _
  simp only [output, eval_pos, eval_add, eval_right, eval_eqn, eval_app1, eval_lit]
  rw [summary_correct a encoder PRCode.identity _ ecert pcert gcert rfl]
  simp only [eval_identity, FinitePathPrograms.pack, Term.unpair_pair]
  by_cases seen : 0 < hits a encoder ecert pcert
  · have nonzero : hits a encoder ecert pcert ≠ 0 := by omega
    simp [seen, nonzero]
  · have zero : hits a encoder ecert pcert = 0 := by omega
    by_cases accepted : ending.output.eval₁ gcert = 2 <;> simp [seen, zero, accepted]

end PureSFormal.AppendixF.PathSearchPrograms
