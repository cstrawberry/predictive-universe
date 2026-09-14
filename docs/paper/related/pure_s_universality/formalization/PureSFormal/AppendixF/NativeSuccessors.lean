import PureSFormal.AppendixF.PrimitiveTreeFold
import PureSFormal.AppendixF.NumericPrograms
import PureSFormal.DefinitionAgreement

namespace PureSFormal.AppendixF.NativeSuccessors
open PureSFormal.PureS PureSFormal.Computation
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program NumericPrograms
set_option maxHeartbeats 1000000
attribute [-simp] PrimitiveRecursiveListCode.Program.eval_unary PrimitiveRecursiveListCode.Program.eval_binary
local infixl:70 " ⊙ " => Term.app

def atRoot : Term → List Term
  | .app (.app (.app .s x) y) z => [Term.contractum x y z]
  | _ => []

def successors : Term → List Term
  | .s => []
  | .app l r => atRoot (l ⊙ r) ++ (successors l).map (fun t => t ⊙ r) ++
    (successors r).map (fun t => l ⊙ t)

theorem root_sound (t u : Term) (member : u ∈ atRoot t) : Step t u := by
  cases t with
  | s => cases member
  | app l z =>
    cases l with
    | s => cases member
    | app ll y =>
      cases ll with
      | s => cases member
      | app lll x =>
        cases lll with
        | s =>
          have same := List.mem_singleton.mp member
          exact same ▸ Step.root x y z
        | app a b => cases member

theorem successors_iff (t u : Term) : u ∈ successors t ↔ Step t u := by
  constructor
  · intro member
    induction t generalizing u with
    | s => cases member
    | app l r ihl ihr =>
      simp only [successors, List.mem_append, List.mem_map] at member
      cases member with
      | inl first =>
        cases first with
        | inl root => exact root_sound _ _ root
        | inr sub =>
          obtain ⟨v, mem, same⟩ := sub
          exact same ▸ Step.appLeft (ihl v mem) r
      | inr sub =>
        obtain ⟨v, mem, same⟩ := sub
        exact same ▸ Step.appRight l (ihr v mem)
  · intro native
    have textbook := (step_iff_textbookStep _ _).mp native
    clear native
    induction textbook with
    | contract x y z => simp only [successors, atRoot, List.mem_append, List.mem_singleton]; exact Or.inl (Or.inl rfl)
    | @appLeft t u edge r ih =>
      apply List.mem_append_left
      apply List.mem_append_right
      exact List.mem_map.mpr ⟨u, ih, rfl⟩
    | @appRight l t u edge ih =>
      apply List.mem_append_right
      exact List.mem_map.mpr ⟨u, ih, rfl⟩

def lchild (p : PRCode arity) := left (pred p)
def rchild (p : PRCode arity) := right (pred p)

def rootProgram : PRCode 1 :=
  let t := PRCode.identity
  let l := lchild t
  let ll := lchild l
  let lll := lchild ll
  let x := rchild ll
  let y := rchild l
  let z := rchild t
  ifZero t (lit 0) (ifZero l (lit 0) (ifZero ll (lit 0)
    (ifZero lll (cell (cell (cell x z) (cell y z)) (lit 0)) (lit 0))))

theorem rootProgram_correct (t : Term) : rootProgram.eval₁ t.code = encode ((atRoot t).map Term.code) := by
  cases t with
  | s => rfl
  | app l z =>
    cases l with
    | s => simp [PRCode.eval₁, rootProgram, lchild, rchild, PRCode.identity, eval_projection, Term.code, atRoot]
    | app ll y =>
      cases ll with
      | s => simp [PRCode.eval₁, rootProgram, lchild, rchild, PRCode.identity, eval_projection, Term.code, atRoot]
      | app lll x =>
        cases lll with
        | s =>
          simp [PRCode.eval₁, rootProgram, lchild, rchild, PRCode.identity, eval_projection,
            Term.code, Term.contractum, atRoot, PrimitiveRecursiveListCode.encode_cons]
        | app a b =>
          simp [PRCode.eval₁, rootProgram, lchild, rchild, PRCode.identity, eval_projection, Term.code, atRoot]

def mapLeft : PRCode 2 := mapWithParameter (cell (.projection 1) (.projection 0))
def mapRight : PRCode 2 := mapWithParameter (cell (.projection 0) (.projection 1))

theorem mapLeft_correct (r : Term) (xs : List Term) :
    mapLeft.eval₂ r.code (encode (xs.map Term.code)) = encode ((xs.map (fun t => t ⊙ r)).map Term.code) := by
  rw [mapLeft, eval_mapWithParameter, PrimitiveRecursiveListCode.decode_encode]
  simp only [List.map_map]
  congr 1
  apply List.map_congr_left
  intro t _
  simp [PRCode.eval₂, eval_projection, Term.code]

theorem mapRight_correct (l : Term) (xs : List Term) :
    mapRight.eval₂ l.code (encode (xs.map Term.code)) = encode ((xs.map (fun t => l ⊙ t)).map Term.code) := by
  rw [mapRight, eval_mapWithParameter, PrimitiveRecursiveListCode.decode_encode]
  simp only [List.map_map]
  congr 1
  apply List.map_congr_left
  intro t _
  simp [PRCode.eval₂, eval_projection, Term.code]

def packed (t : Term) := Term.pair t.code (encode ((successors t).map Term.code))

def branchProgram : PRCode 2 :=
  let l := left (.projection 0)
  let r := left (.projection 1)
  let code := cell l r
  pair code (app2 append (app2 append (app1 rootProgram code)
    (app2 mapLeft r (right (.projection 0)))) (app2 mapRight l (right (.projection 1))))

theorem branchProgram_correct (l r : Term) : branchProgram.eval₂ (packed l) (packed r) = packed (l ⊙ r) := by
  change branchProgram.eval [packed l, packed r] = _
  simp [branchProgram, packed, eval_projection]
  change Term.pair (l ⊙ r).code (append.eval₂
    (append.eval₂ (rootProgram.eval₁ (l ⊙ r).code)
      (mapLeft.eval₂ r.code (encode ((successors l).map Term.code))))
    (mapRight.eval₂ l.code (encode ((successors r).map Term.code)))) = _
  rw [rootProgram_correct, mapLeft_correct, mapRight_correct]
  simp only [eval_append, PrimitiveRecursiveListCode.decode_encode, successors, List.map_append, Term.code_app]

def program : PRCode 1 := app1 PRCode.cantorRight (PrimitiveTreeFold.program 0 branchProgram)

theorem fold_correct (t : Term) : PrimitiveTreeFold.value 0 branchProgram t = packed t := by
  induction t with
  | s => rfl
  | app l r ihl ihr =>
    change branchProgram.eval₂ _ _ = _
    rw [ihl, ihr, branchProgram_correct]

theorem program_correct (t : Term) : program.eval₁ t.code = encode ((successors t).map Term.code) := by
  change PRCode.cantorRight.eval₁ ((PrimitiveTreeFold.program 0 branchProgram).eval₁ t.code) = _
  rw [PrimitiveTreeFold.program_correct, fold_correct, DeterministicTapeCode.eval₁_cantorRight_eq_unpair_snd]
  exact congrArg Prod.snd (Term.unpair_pair _ _)

end PureSFormal.AppendixF.NativeSuccessors
