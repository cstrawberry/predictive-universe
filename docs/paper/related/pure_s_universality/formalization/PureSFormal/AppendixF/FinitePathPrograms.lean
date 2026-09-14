import PureSFormal.AppendixF.PrimitiveMembership
import PureSFormal.AppendixF.MaximalPaths

namespace PureSFormal.AppendixF.FinitePathPrograms
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program NumericPrograms PrimitiveMembership
set_option maxHeartbeats 1000000
attribute [-simp] PrimitiveRecursiveListCode.Program.eval_unary PrimitiveRecursiveListCode.Program.eval_binary

def endpoint (start : Term) : List Term → Term
  | [] => start
  | next :: rest => endpoint next rest
def faults (start : Term) : List Term → Nat
  | [] => 0
  | next :: rest => fault start next + faults next rest
def Walk (start : Term) : List Term → Prop
  | [] => True
  | next :: rest => Step start next ∧ Walk next rest

theorem faults_zero (start : Term) (path : List Term) : faults start path = 0 ↔ Walk start path := by
  induction path generalizing start with
  | nil => simp [faults, Walk]
  | cons next rest ih => simp only [faults, Nat.add_eq_zero_iff, fault_zero, ih, Walk]

def observed (a : Deterministic State) (t : Term) : Nat := if a.accepts t then 1 else 0
def observations (a : Deterministic State) : List Term → Nat
  | [] => 0
  | first :: rest => observed a first + observations a rest

theorem observed_positive (a : Deterministic State) (t : Term) :
    0 < observed a t ↔ a.accepts t = true := by
  cases h : a.accepts t <;> simp [observed, h]

theorem observations_positive (a : Deterministic State) (path : List Term) :
    0 < observations a path ↔ ∃ t ∈ path, a.accepts t = true := by
  induction path with
  | nil => simp [observations]
  | cons first rest ih =>
    simp only [observations, Nat.add_pos_iff_pos_or_pos, observed_positive, ih, List.mem_cons]
    constructor
    · intro h
      cases h with
      | inl h => exact ⟨first, Or.inl rfl, h⟩
      | inr h => obtain ⟨t, mem, accepted⟩ := h; exact ⟨t, Or.inr mem, accepted⟩
    · rintro ⟨t, mem, accepted⟩
      cases mem with
      | inl same => exact Or.inl (same ▸ accepted)
      | inr mem => exact Or.inr ⟨t, mem, accepted⟩

def observeProgram [DecidableEq State] (a : Deterministic State) : PRCode 1 :=
  AutomatonComputability.observeProgram a (fun q => if a.final q then 1 else 0)

theorem observeProgram_correct [DecidableEq State] (a : Deterministic State) (t : Term) :
    (observeProgram a).eval₁ t.code = observed a t := AutomatonComputability.observeProgram_correct _ _ _

def pack (t : Term) (bad hits : Nat) := Term.pair t.code (Term.pair bad hits)

def stepProgram [DecidableEq State] (a : Deterministic State) : PRCode 2 :=
  pair (.projection 1) (pair
    (add (left (right (.projection 0)))
      (app2 PrimitiveMembership.stepProgram (left (.projection 0)) (.projection 1)))
    (add (right (right (.projection 0))) (app1 (observeProgram a) (.projection 1))))

theorem stepProgram_correct [DecidableEq State] (a : Deterministic State) (current next : Term) (bad hits : Nat) :
    (stepProgram a).eval₂ (pack current bad hits) next.code =
      pack next (bad + fault current next) (hits + observed a next) := by
  change (stepProgram a).eval [pack current bad hits, next.code] = _
  simp [stepProgram, pack, eval_projection, PrimitiveMembership.stepProgram_correct, observeProgram_correct]

theorem fold_correct [DecidableEq State] (a : Deterministic State) (path : List Term)
    (current : Term) (bad hits : Nat) :
    (path.map Term.code).foldl (stepProgram a).eval₂ (pack current bad hits) =
      pack (endpoint current path) (bad + faults current path) (hits + observations a path) := by
  induction path generalizing current bad hits with
  | nil => simp [endpoint, faults, observations]
  | cons next rest ih =>
    rw [List.map_cons, List.foldl_cons, stepProgram_correct, ih]
    simp only [endpoint, faults, observations, Nat.add_assoc]

def program [DecidableEq State] (a : Deterministic State) : PRCode 2 :=
  app2 (fold (stepProgram a)) (.projection 1)
    (pair (.projection 0) (pair (lit 0) (app1 (observeProgram a) (.projection 0))))

theorem program_correct [DecidableEq State] (a : Deterministic State) (start : Term) (path : List Term) :
    (program a).eval₂ start.code (encode (path.map Term.code)) =
      pack (endpoint start path) (faults start path) (observations a (start :: path)) := by
  change (program a).eval [start.code, encode (path.map Term.code)] = _
  simp only [program, eval_app2, eval_pair, eval_lit, eval_app1, eval_projection]
  change (fold (stepProgram a)).eval₂ (encode (path.map Term.code))
    (pack start 0 ((observeProgram a).eval₁ start.code)) = _
  rw [observeProgram_correct, eval_fold_encode, fold_correct]
  simp only [Nat.zero_add, observations]

def term (code : Nat) : Term := (Term.decodeCode? code).getD .s
theorem term_code (n : Nat) : (term n).code = n := by
  obtain ⟨t, found⟩ := Term.exists_decodeCode?_eq_some n
  have code := Term.code_eq_of_decodeCode?_eq_some found
  simpa only [term, found, Option.getD_some] using code
theorem term_of_code (t : Term) : term t.code = t := by simp only [term, Term.decodeCode?_code, Option.getD_some]

def decodePath (number : Nat) : List Term := (decode number).map term
theorem decodePath_code (number : Nat) : encode ((decodePath number).map Term.code) = number := by
  simp [decodePath, List.map_map, Function.comp_def, term_code, PrimitiveRecursiveListCode.encode_decode]
theorem decodePath_encode (path : List Term) : decodePath (encode (path.map Term.code)) = path := by
  simp [decodePath, PrimitiveRecursiveListCode.decode_encode, List.map_map, Function.comp_def, term_of_code]

theorem program_numeric [DecidableEq State] (a : Deterministic State) (start path : Nat) :
    (program a).eval₂ start path = pack (endpoint (term start) (decodePath path))
      (faults (term start) (decodePath path)) (observations a (term start :: decodePath path)) := by
  have correct := program_correct a (term start) (decodePath path)
  simpa only [term_code, decodePath_code] using correct

theorem endpoint_append (start : Term) (first second : List Term) :
    endpoint start (first ++ second) = endpoint (endpoint start first) second := by
  induction first generalizing start with
  | nil => rfl
  | cons t rest ih => exact ih t

theorem walk_append (start : Term) (first second : List Term) :
    Walk start (first ++ second) ↔ Walk start first ∧ Walk (endpoint start first) second := by
  induction first generalizing start with
  | nil => simp [Walk, endpoint]
  | cons t rest ih =>
    simp only [List.cons_append, Walk, ih, endpoint, and_assoc]

theorem steps_have_walk {start last : Term} (reachable : Steps start last) :
    ∃ path, Walk start path ∧ endpoint start path = last := by
  induction reachable with
  | refl => exact ⟨[], trivial, rfl⟩
  | @tail before last segment edge ih =>
    obtain ⟨path, valid, same⟩ := ih
    refine ⟨path ++ [last], (walk_append _ _ _).mpr ⟨valid, ?_⟩, ?_⟩
    · exact ⟨same ▸ edge, trivial⟩
    · rw [endpoint_append]
      rfl

end PureSFormal.AppendixF.FinitePathPrograms
