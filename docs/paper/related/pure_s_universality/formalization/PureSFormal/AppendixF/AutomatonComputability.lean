import PureSFormal.AppendixF.PrimitiveTreeFold
import PureSFormal.Research.FiniteTreeAutomatonPowerset

namespace PureSFormal.AppendixF.AutomatonComputability
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program
set_option maxHeartbeats 1000000

def index [DecidableEq State] (state : State) : List State → Nat
  | [] => 0
  | first :: rest => if state = first then 0 else index state rest + 1

theorem lookup_index [DecidableEq State] (states : List State) (state : State)
    (member : state ∈ states) (f : State → Nat) :
    (states.map f).getD (index state states) 0 = f state := by
  induction states with
  | nil => cases member
  | cons first rest ih =>
    by_cases same : state = first
    · subst state
      simp [index]
    · simp only [index, if_neg same, List.map_cons, List.getD_cons_succ]
      exact ih ((List.mem_cons.mp member).resolve_left same)

def tableProgram (values : List Nat) : PRCode 1 :=
  PRCode.composeBinary lookup (PRCode.constant 1 (encode values)) PRCode.identity

theorem tableProgram_correct (values : List Nat) (n : Nat) :
    (tableProgram values).eval₁ n = values.getD n 0 := by
  rw [tableProgram, eval₁_composeBinary, eval₁_constant, PRCode.eval_identity,
    eval_lookup, PrimitiveRecursiveListCode.decode_encode]

def stateCode [DecidableEq State] (a : Deterministic State) (q : State) := index q a.cover

def branchProgram [DecidableEq State] (a : Deterministic State) : PRCode 2 :=
  let rows := a.cover.map (fun left => encode (a.cover.map (fun right => stateCode a (a.branch left right))))
  PRCode.composeBinary lookup
    (PRCode.composeUnary (tableProgram rows) (.projection 0)) (.projection 1)

theorem branchProgram_correct [DecidableEq State] (a : Deterministic State) (left right : State) :
    (branchProgram a).eval₂ (stateCode a left) (stateCode a right) = stateCode a (a.branch left right) := by
  rw [branchProgram, eval₂_composeBinary, eval₂_composeUnary, eval₂_projection_zero,
    eval₂_projection_one, tableProgram_correct]
  simp only [stateCode]
  rw [lookup_index _ _ (a.covers left), eval_lookup,
    PrimitiveRecursiveListCode.decode_encode, lookup_index _ _ (a.covers right)]

def stateProgram [DecidableEq State] (a : Deterministic State) : PRCode 1 :=
  PrimitiveTreeFold.program (stateCode a a.leaf) (branchProgram a)

theorem value_correct [DecidableEq State] (a : Deterministic State) (t : Term) :
    PrimitiveTreeFold.value (stateCode a a.leaf) (branchProgram a) t = stateCode a (a.eval t) := by
  induction t with
  | s => rfl
  | app l r ihl ihr =>
    change (branchProgram a).eval₂ _ _ = _
    rw [ihl, ihr, branchProgram_correct]
    rfl

theorem stateProgram_correct [DecidableEq State] (a : Deterministic State) (t : Term) :
    (stateProgram a).eval₁ t.code = stateCode a (a.eval t) :=
  (PrimitiveTreeFold.program_correct _ _ _).trans (value_correct a t)

def observeProgram [DecidableEq State] (a : Deterministic State) (observes : State → Nat) : PRCode 1 :=
  PRCode.composeUnary (tableProgram (a.cover.map observes)) (stateProgram a)

theorem observeProgram_correct [DecidableEq State] (a : Deterministic State)
    (observes : State → Nat) (t : Term) :
    (observeProgram a observes).eval₁ t.code = observes (a.eval t) := by
  rw [observeProgram, eval₁_composeUnary, stateProgram_correct, tableProgram_correct]
  exact lookup_index _ _ (a.covers (a.eval t)) observes

/-- Any fixed finite state table, even one obtained nonuniformly, gives a
    closed decision program after composition with a computable encoder. -/
theorem computable_observation [DecidableEq State] (a : Deterministic State)
    (observes : State → Nat) (payload : Nat → Term)
    (effective : PartialRecursive.Computable (fun x => (payload x).code)) :
    PartialRecursive.Computable (fun x => observes (a.eval (payload x))) := by
  have composed := PartialRecursive.computable_comp
    (PartialRecursive.computable_of_primitiveRecursive
      (show PrimitiveRecursive (observeProgram a observes).eval₁ from ⟨_, fun _ => rfl⟩)) effective
  simpa only [observeProgram_correct] using composed

end PureSFormal.AppendixF.AutomatonComputability
