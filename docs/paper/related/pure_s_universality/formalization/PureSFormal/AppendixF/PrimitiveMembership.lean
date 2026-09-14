import PureSFormal.AppendixF.NativeSuccessors
import PureSFormal.AppendixF.IndexedCertificates

namespace PureSFormal.AppendixF.PrimitiveMembership
open PureSFormal.PureS PureSFormal.Computation
open PrimitiveRecursiveListCode (encode decode)
open PrimitiveRecursiveListCode.Program NumericPrograms
set_option maxHeartbeats 1000000
attribute [-simp] PrimitiveRecursiveListCode.Program.eval_unary PrimitiveRecursiveListCode.Program.eval_binary

def count (needle : Nat) : List Nat → Nat
  | [] => 0
  | first :: rest => (if needle = first then 1 else 0) + count needle rest

theorem count_zero_iff (needle : Nat) (xs : List Nat) : count needle xs = 0 ↔ needle ∉ xs := by
  induction xs with
  | nil => simp [count]
  | cons first rest ih =>
    by_cases same : needle = first <;> simp [count, same, ih]

def countStep : PRCode 3 := add (.projection 1) (eqn (.projection 0) (.projection 2))

theorem countStep_correct (needle acc value : Nat) :
    countStep.eval [needle, acc, value] = acc + if needle = value then 1 else 0 := by
  simp [countStep, eval_projection]

theorem count_fold (needle acc : Nat) (xs : List Nat) :
    xs.foldl (fun state item => countStep.eval [needle, state, item]) acc = acc + count needle xs := by
  induction xs generalizing acc with
  | nil => simp [count]
  | cons first rest ih =>
    rw [List.foldl_cons, countStep_correct, ih, count]
    omega

def countProgram : PRCode 2 := app3 (foldWithParameter countStep) (.projection 1) (.projection 0) (lit 0)

theorem countProgram_correct (needle listCode : Nat) :
    countProgram.eval₂ needle listCode = count needle (decode listCode) := by
  change countProgram.eval [needle, listCode] = _
  simp [countProgram, eval_projection, eval_foldWithParameter, count_fold]

def stepProgram : PRCode 2 := ifZero (app2 countProgram (.projection 1)
  (app1 NativeSuccessors.program (.projection 0))) (lit 1) (lit 0)

def fault (source target : Term) : Nat :=
  if target.code ∈ (NativeSuccessors.successors source).map Term.code then 0 else 1

theorem fault_zero (source target : Term) : fault source target = 0 ↔ Step source target := by
  rw [← NativeSuccessors.successors_iff]
  have member : target.code ∈ (NativeSuccessors.successors source).map Term.code ↔
      target ∈ NativeSuccessors.successors source := by
    constructor
    · rintro mem
      obtain ⟨t, tm, equal⟩ := List.mem_map.mp mem
      exact (Term.code_injective equal) ▸ tm
    · intro mem; exact List.mem_map.mpr ⟨target, mem, rfl⟩
  simp [fault, member]

theorem stepProgram_correct (source target : Term) : stepProgram.eval₂ source.code target.code = fault source target := by
  change stepProgram.eval [source.code, target.code] = _
  simp only [stepProgram, eval_ifZero, eval_app2, eval_app1, eval_lit, eval_projection]
  change (if countProgram.eval₂ target.code (NativeSuccessors.program.eval₁ source.code) = 0 then 1 else 0) = _
  rw [NativeSuccessors.program_correct, countProgram_correct, PrimitiveRecursiveListCode.decode_encode]
  simp only [count_zero_iff]
  by_cases present : target.code ∈ (NativeSuccessors.successors source).map Term.code <;> simp [fault, present]

end PureSFormal.AppendixF.PrimitiveMembership
