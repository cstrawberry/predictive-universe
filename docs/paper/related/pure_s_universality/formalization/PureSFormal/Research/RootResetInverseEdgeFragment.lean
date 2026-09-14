import PureSFormal.Research.RootResetCarrierNonemptyRows

/-!
# Bounded inverse-edge fragments with exact failure return

Each compiled fragment tests incoming directions along a fixed reversed
address, climbs to the candidate ancestor, and runs a bounded pattern test.
Every mismatch returns to the exact origin. Success certifies the matching
ancestor, the forward path back to the origin, and the exact depth decrease.
All rows use local observations and cursor moves only.
-/

namespace PureSFormal.Research.RootResetInverseEdgeFragment
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment

def down : Direction → Primitive
  | .left => .L
  | .right => .R

def chooseIncoming (side : Direction) (yes no : Code) : Code :=
  match side with
  | .left => .observeIncoming no yes no
  | .right => .observeIncoming no no yes

def backCode : Address → Pattern → Code → Code → Code
  | [], pattern, yes, no => ProbeCompiler.compile pattern yes no
  | side :: rest, pattern, yes, no =>
      chooseIncoming side (.move .U (backCode rest pattern yes (.move (down side) no))) no

def backResult : Address → Pattern → Cursor → Option Cursor
  | [], pattern, origin => if pattern.matchesBool origin.focus then some origin else none
  | .left :: rest, pattern, ⟨focus, .left sibling :: parents⟩ =>
      backResult rest pattern ⟨.app focus sibling, parents⟩
  | .right :: rest, pattern, ⟨focus, .right sibling :: parents⟩ =>
      backResult rest pattern ⟨.app sibling focus, parents⟩
  | _ :: _, _, _ => none

def backTicks : Address → Pattern → Cursor → Nat
  | [], pattern, origin => ProbeCompiler.probeCost pattern origin.focus
  | .left :: rest, pattern, ⟨focus, .left sibling :: parents⟩ =>
      2 + backTicks rest pattern ⟨.app focus sibling, parents⟩ +
        if (backResult rest pattern ⟨.app focus sibling, parents⟩).isSome then 0 else 1
  | .right :: rest, pattern, ⟨focus, .right sibling :: parents⟩ =>
      2 + backTicks rest pattern ⟨.app sibling focus, parents⟩ +
        if (backResult rest pattern ⟨.app sibling focus, parents⟩).isSome then 0 else 1
  | _ :: _, _, _ => 1

def selected (result : Option Cursor) (yes no : Code) : Code := if result.isSome then yes else no

theorem choose_yes_mem (side : Direction) (yes no : Code) : yes ∈ (chooseIncoming side yes no).nodes := by
  cases side <;> simp [chooseIncoming, ProbeCompiler.Control.nodes]

theorem choose_no_mem (side : Direction) (yes no : Code) : no ∈ (chooseIncoming side yes no).nodes := by
  cases side <;> simp [chooseIncoming, ProbeCompiler.Control.nodes]

theorem back_runs (address : Address) (pattern : Pattern) (yes no whole : Code) (origin : Cursor)
    (included : ∀ pc, pc ∈ (backCode address pattern yes no).nodes → pc ∈ whole.nodes) :
    ∃ member : selected (backResult address pattern origin) yes no ∈ whole.nodes,
      run (RootResetPatternFragment.machine whole) (backTicks address pattern origin)
        ⟨some ⟨backCode address pattern yes no, included _ (ProbeCompiler.Control.self_mem_nodes _)⟩, origin⟩ =
        ⟨some ⟨selected (backResult address pattern origin) yes no, member⟩,
          (backResult address pattern origin).getD origin⟩ := by
  induction address generalizing no origin with
  | nil =>
      obtain ⟨member, execution⟩ := RootResetPatternFragment.compile_runs pattern yes no whole origin included
      cases matched : pattern.matchesBool origin.focus <;>
        simp only [backResult, backTicks, matched, Bool.false_eq_true, ↓reduceIte,
          Option.isSome_none, Option.isSome_some, selected, Option.getD_none, Option.getD_some] at member execution ⊢ <;>
        exact ⟨member, execution⟩
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases parents with
      | nil =>
          have noMember := included no (choose_no_mem side _ no)
          cases side <;> exact ⟨noMember, rfl⟩
      | cons frame parents =>
          cases frame with
          | left sibling =>
              cases side with
              | right => exact ⟨included no (choose_no_mem .right _ no), rfl⟩
              | left =>
                  have childMember : backCode rest pattern yes (.move .L no) ∈ whole.nodes :=
                    included _ (nodes_trans (choose_yes_mem .left _ no)
                      (List.Mem.tail _ (ProbeCompiler.Control.self_mem_nodes _)))
                  obtain ⟨member, innerRun⟩ := ih (.move .L no) ⟨.app focus sibling, parents⟩
                    (fun pc member => nodes_trans childMember member)
                  have startRun : run (RootResetPatternFragment.machine whole) 2
                      ⟨some ⟨backCode (.left :: rest) pattern yes no,
                        included _ (ProbeCompiler.Control.self_mem_nodes _)⟩, ⟨focus, .left sibling :: parents⟩⟩ =
                      ⟨some ⟨backCode rest pattern yes (.move .L no), childMember⟩,
                        ⟨.app focus sibling, parents⟩⟩ := rfl
                  cases resultEq : backResult rest pattern ⟨.app focus sibling, parents⟩ with
                  | some ancestor =>
                      simp only [selected, resultEq, Option.isSome_some, ↓reduceIte, Option.getD_some] at member innerRun
                      simp only [backResult, selected, resultEq, Option.isSome_some, ↓reduceIte,
                        Option.getD_some, backTicks, Nat.add_zero]
                      refine ⟨member, ?_⟩
                      rw [run_add, startRun]
                      exact innerRun
                  | none =>
                      simp only [selected, resultEq, Option.isSome_none, Bool.false_eq_true, ↓reduceIte,
                        Option.getD_none] at member innerRun
                      have noMember : no ∈ whole.nodes := nodes_trans member (List.Mem.tail _ (ProbeCompiler.Control.self_mem_nodes _))
                      simp only [backResult, selected, resultEq, Option.isSome_none, Bool.false_eq_true, ↓reduceIte,
                        Option.getD_none, backTicks]
                      refine ⟨noMember, ?_⟩
                      rw [run_add, run_add, startRun, innerRun]
                      rfl
          | right sibling =>
              cases side with
              | left => exact ⟨included no (choose_no_mem .left _ no), rfl⟩
              | right =>
                  have childMember : backCode rest pattern yes (.move .R no) ∈ whole.nodes :=
                    included _ (nodes_trans (choose_yes_mem .right _ no)
                      (List.Mem.tail _ (ProbeCompiler.Control.self_mem_nodes _)))
                  obtain ⟨member, innerRun⟩ := ih (.move .R no) ⟨.app sibling focus, parents⟩
                    (fun pc member => nodes_trans childMember member)
                  have startRun : run (RootResetPatternFragment.machine whole) 2
                      ⟨some ⟨backCode (.right :: rest) pattern yes no,
                        included _ (ProbeCompiler.Control.self_mem_nodes _)⟩, ⟨focus, .right sibling :: parents⟩⟩ =
                      ⟨some ⟨backCode rest pattern yes (.move .R no), childMember⟩,
                        ⟨.app sibling focus, parents⟩⟩ := rfl
                  cases resultEq : backResult rest pattern ⟨.app sibling focus, parents⟩ with
                  | some ancestor =>
                      simp only [selected, resultEq, Option.isSome_some, ↓reduceIte, Option.getD_some] at member innerRun
                      simp only [backResult, selected, resultEq, Option.isSome_some, ↓reduceIte,
                        Option.getD_some, backTicks, Nat.add_zero]
                      refine ⟨member, ?_⟩
                      rw [run_add, startRun]
                      exact innerRun
                  | none =>
                      simp only [selected, resultEq, Option.isSome_none, Bool.false_eq_true, ↓reduceIte,
                        Option.getD_none] at member innerRun
                      have noMember : no ∈ whole.nodes := nodes_trans member (List.Mem.tail _ (ProbeCompiler.Control.self_mem_nodes _))
                      simp only [backResult, selected, resultEq, Option.isSome_none, Bool.false_eq_true, ↓reduceIte,
                        Option.getD_none, backTicks]
                      refine ⟨noMember, ?_⟩
                      rw [run_add, run_add, startRun, innerRun]
                      rfl

theorem back_readOnly (address : Address) (pattern : Pattern) (yes no : Code)
    (yesSafe : yes.NoRdx) (noSafe : no.NoRdx) : (backCode address pattern yes no).NoRdx := by
  induction address generalizing no with
  | nil => exact ProbeCompiler.compile_noRdx pattern yesSafe noSafe
  | cons side rest ih =>
      cases side with
      | left => exact ⟨noSafe, ih (.move .L no) noSafe, noSafe⟩
      | right => exact ⟨noSafe, noSafe, ih (.move .R no) noSafe⟩

def bound (address : Address) (pattern : Pattern) : Nat :=
  3 * address.length + ProbeCompiler.executionBound pattern

theorem tick_step_bound (count extra : Nat) (extraBound : extra ≤ 1) (rest : Address) (pattern : Pattern)
    (innerBound : count ≤ bound rest pattern) : 2 + count + extra ≤ bound (.left :: rest) pattern := by
  have combined := Nat.add_le_add (Nat.add_le_add_left innerBound 2) extraBound
  simpa only [bound, List.length_cons, Nat.mul_add, Nat.mul_one, show 3 = 2 + 1 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined

theorem tick_miss_bound (rest : Address) (pattern : Pattern) : 1 ≤ bound (.left :: rest) pattern := by
  exact Nat.le_trans (by decide : 1 ≤ 3)
    (Nat.le_trans (Nat.mul_le_mul_left 3 (Nat.succ_le_succ (Nat.zero_le _))) (Nat.le_add_right _ _))

theorem backTicks_bound (address : Address) (pattern : Pattern) (origin : Cursor) :
    backTicks address pattern origin ≤ bound address pattern := by
  induction address generalizing origin with
  | nil =>
      simpa only [backTicks, bound, List.length_nil, Nat.mul_zero, Nat.zero_add] using
        Nat.le_of_lt (ProbeCompiler.probeCost_lt_executionBound pattern origin.focus)
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases parents with
      | nil => cases side <;> exact tick_miss_bound rest pattern
      | cons frame parents =>
          cases frame with
          | left sibling =>
              cases side with
              | right => exact tick_miss_bound rest pattern
              | left =>
                  apply tick_step_bound _ _ _ rest pattern (ih ⟨.app focus sibling, parents⟩)
                  split <;> decide
          | right sibling =>
              cases side with
              | left => exact tick_miss_bound rest pattern
              | right =>
                  apply tick_step_bound _ _ _ rest pattern (ih ⟨.app sibling focus, parents⟩)
                  split <;> decide

theorem backResult_matches (address : Address) (pattern : Pattern) (origin ancestor : Cursor)
    (found : backResult address pattern origin = some ancestor) : pattern.matchesBool ancestor.focus = true := by
  induction address generalizing origin with
  | nil =>
      cases matched : pattern.matchesBool origin.focus with
      | false =>
          simp only [backResult, matched, Bool.false_eq_true, ↓reduceIte] at found
          cases found
      | true =>
          have equal : origin = ancestor := Option.some.inj (by simpa only [backResult, matched, ↓reduceIte] using found)
          subst origin
          exact matched
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases parents with
      | nil => cases side <;> cases found
      | cons frame parents =>
          cases frame with
          | left sibling => cases side with
            | left => exact ih ⟨.app focus sibling, parents⟩ found
            | right => cases found
          | right sibling => cases side with
            | left => cases found
            | right => exact ih ⟨.app sibling focus, parents⟩ found

theorem backResult_depth (address : Address) (pattern : Pattern) (origin ancestor : Cursor)
    (found : backResult address pattern origin = some ancestor) :
    origin.parents.length = address.length + ancestor.parents.length := by
  induction address generalizing origin with
  | nil =>
      cases matched : pattern.matchesBool origin.focus with
      | false =>
          simp only [backResult, matched, Bool.false_eq_true, ↓reduceIte] at found
          cases found
      | true =>
          have equal : origin = ancestor := Option.some.inj (by simpa only [backResult, matched, ↓reduceIte] using found)
          subst origin
          exact (Nat.zero_add _).symm
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases parents with
      | nil => cases side <;> cases found
      | cons frame parents =>
          cases frame with
          | left sibling => cases side with
            | left =>
                have inner := ih ⟨.app focus sibling, parents⟩ found
                simpa only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! congrArg Nat.succ inner
            | right => cases found
          | right sibling => cases side with
            | left => cases found
            | right =>
                have inner := ih ⟨.app sibling focus, parents⟩ found
                simpa only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! congrArg Nat.succ inner

theorem backResult_depth_lt (address : Address) (pattern : Pattern) (origin ancestor : Cursor)
    (proper : address ≠ []) (found : backResult address pattern origin = some ancestor) :
    ancestor.parents.length < origin.parents.length := by
  rw [backResult_depth address pattern origin ancestor found]
  cases address with
  | nil => exact False.elim (proper rfl)
  | cons side rest =>
      simpa only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using!
        Nat.lt_succ_of_le (Nat.le_add_left ancestor.parents.length rest.length)

theorem backResult_erase (address : Address) (pattern : Pattern) (origin ancestor : Cursor)
    (found : backResult address pattern origin = some ancestor) : ancestor.erase = origin.erase := by
  induction address generalizing origin with
  | nil =>
      cases matched : pattern.matchesBool origin.focus with
      | false =>
          simp only [backResult, matched, Bool.false_eq_true, ↓reduceIte] at found
          cases found
      | true =>
          have equal : origin = ancestor := Option.some.inj (by simpa only [backResult, matched, ↓reduceIte] using found)
          subst origin
          rfl
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases parents with
      | nil => cases side <;> cases found
      | cons frame parents =>
          cases frame with
          | left sibling => cases side with
            | left => exact ih ⟨.app focus sibling, parents⟩ found
            | right => cases found
          | right sibling => cases side with
            | left => cases found
            | right => exact ih ⟨.app sibling focus, parents⟩ found

theorem follow_append (first second : Address) (origin : Cursor) :
    RootResetEdgeFragment.follow (first ++ second) origin =
      (RootResetEdgeFragment.follow first origin).bind (RootResetEdgeFragment.follow second) := by
  induction first generalizing origin with
  | nil => rfl
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases focus with
      | s => cases side <;> rfl
      | app fn arg =>
          cases side with
          | left => exact ih ⟨fn, .left arg :: parents⟩
          | right => exact ih ⟨arg, .right fn :: parents⟩

theorem backResult_follow (address : Address) (pattern : Pattern) (origin ancestor : Cursor)
    (found : backResult address pattern origin = some ancestor) :
    RootResetEdgeFragment.follow address.reverse ancestor = some origin := by
  induction address generalizing origin with
  | nil =>
      have matched := backResult_matches [] pattern origin ancestor found
      cases first : pattern.matchesBool origin.focus with
      | false =>
          simp only [backResult, first, Bool.false_eq_true, ↓reduceIte] at found
          cases found
      | true =>
          have equal : origin = ancestor := Option.some.inj (by simpa only [backResult, first, ↓reduceIte] using found)
          subst origin
          rfl
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases parents with
      | nil => cases side <;> cases found
      | cons frame parents =>
          cases frame with
          | left sibling => cases side with
            | left =>
                rw [List.reverse_cons, follow_append, ih ⟨.app focus sibling, parents⟩ found]
                rfl
            | right => cases found
          | right sibling => cases side with
            | left => cases found
            | right =>
                rw [List.reverse_cons, follow_append, ih ⟨.app sibling focus, parents⟩ found]
                rfl

theorem backResult_complete (address : Address) (pattern : Pattern) (origin endpoint : Cursor)
    (followed : RootResetEdgeFragment.follow address.reverse origin = some endpoint)
    (matched : pattern.matchesBool origin.focus = true) :
    backResult address pattern endpoint = some origin := by
  induction address generalizing endpoint with
  | nil =>
      have equal : origin = endpoint := Option.some.inj followed
      subst endpoint
      simp only [backResult, matched, ↓reduceIte]
  | cons side rest ih =>
      rw [List.reverse_cons, follow_append] at followed
      cases intermediateEq : RootResetEdgeFragment.follow rest.reverse origin with
      | none =>
          rw [intermediateEq] at followed
          cases followed
      | some middle =>
          rw [intermediateEq] at followed
          have inner := ih middle intermediateEq
          rcases middle with ⟨focus, parents⟩
          cases focus with
          | s => cases side <;> cases followed
          | app fn arg =>
              cases side with
              | left =>
                  have endpointEq : ⟨fn, ParentFrame.left arg :: parents⟩ = endpoint := Option.some.inj followed
                  subst endpoint
                  exact inner
              | right =>
                  have endpointEq : ⟨arg, ParentFrame.right fn :: parents⟩ = endpoint := Option.some.inj followed
                  subst endpoint
                  exact inner

end PureSFormal.Research.RootResetInverseEdgeFragment


