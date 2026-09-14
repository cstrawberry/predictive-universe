import PureSFormal.PureS.Term

/-! An explicit, quotient-free powerset construction for binary tree
automata. States are finite Boolean vectors; neither function extensionality
nor a citation about tree-walking languages is used. -/
namespace PureSFormal.Research.FiniteTreeAutomatonPowerset
open PureSFormal.PureS

inductive Bits : Nat → Type where
  | nil : Bits 0
  | cons (head : Bool) (tail : Bits n) : Bits (n + 1)
  deriving DecidableEq, Repr

def Bits.get : {n : Nat} → Bits n → Fin n → Bool
  | 0, .nil, index => Fin.elim0 index
  | _ + 1, .cons head _, ⟨0, _⟩ => head
  | _ + 1, .cons _ tail, ⟨value + 1, bound⟩ =>
      tail.get ⟨value, Nat.lt_of_succ_lt_succ bound⟩

def Bits.tabulate : (n : Nat) → (Fin n → Bool) → Bits n
  | 0, _ => .nil
  | n + 1, f => .cons (f ⟨0, Nat.zero_lt_succ n⟩)
      (tabulate n (fun index => f index.succ))

theorem Bits.get_tabulate (n : Nat) (f : Fin n → Bool) (index : Fin n) :
    (Bits.tabulate n f).get index = f index := by
  induction n with
  | zero => exact Fin.elim0 index
  | succ n ih =>
    cases index with
    | mk value bound =>
      cases value with
      | zero => rfl
      | succ value =>
        exact ih _ _

theorem map_member {α β : Type} (f : α → β) {values : List α} {value : α}
    (member : value ∈ values) : f value ∈ values.map f := by
  induction member with
  | head => exact List.Mem.head _
  | tail _ _ ih => exact List.Mem.tail _ ih

def Bits.all : (n : Nat) → List (Bits n)
  | 0 => [.nil]
  | n + 1 => (all n).map (.cons false) ++ (all n).map (.cons true)

theorem Bits.mem_all (bits : Bits n) : bits ∈ Bits.all n := by
  induction bits with
  | nil => exact List.Mem.head _
  | cons head tail ih =>
    cases head
    · exact List.mem_append_left _ (map_member _ ih)
    · exact List.mem_append_right _ (map_member _ ih)

theorem Bits.all_length (n : Nat) : (Bits.all n).length = 2 ^ n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [Bits.all, List.length_append, List.length_map, ih, Nat.pow_succ]
    exact (Nat.mul_two _).symm

def anyIndex : (n : Nat) → (Fin n → Bool) → Bool
  | 0, _ => false
  | n + 1, test => test ⟨0, Nat.zero_lt_succ n⟩ ||
      anyIndex n (fun index => test index.succ)

theorem anyIndex_iff (n : Nat) (test : Fin n → Bool) :
    anyIndex n test = true ↔ ∃ index, test index = true := by
  induction n with
  | zero =>
    constructor
    · intro impossible; cases impossible
    · rintro ⟨index, _⟩; exact Fin.elim0 index
  | succ n ih =>
    change (_ || _) = true ↔ _
    rw [Bool.or_eq_true, ih]
    constructor
    · intro yes
      cases yes with
      | inl yes => exact ⟨_, yes⟩
      | inr yes => obtain ⟨index, yes⟩ := yes; exact ⟨index.succ, yes⟩
    · rintro ⟨⟨value, bound⟩, yes⟩
      cases value with
      | zero => exact Or.inl yes
      | succ value => exact Or.inr ⟨⟨value, Nat.lt_of_succ_lt_succ bound⟩, yes⟩

structure Nondeterministic (n : Nat) where
  leaf : Bits n
  branch : Fin n → Fin n → Bits n
  final : Bits n

inductive Run (automaton : Nondeterministic n) : Term → Fin n → Prop where
  | leaf {state} : automaton.leaf.get state = true → Run automaton .s state
  | branch {left right lstate rstate state} :
      Run automaton left lstate → Run automaton right rstate →
      (automaton.branch lstate rstate).get state = true →
      Run automaton (.app left right) state

def Nondeterministic.Accepts (automaton : Nondeterministic n) (source : Term) : Prop :=
  ∃ state, Run automaton source state ∧ automaton.final.get state = true

structure Deterministic (State : Type) where
  cover : List State
  covers : ∀ state, state ∈ cover
  leaf : State
  branch : State → State → State
  final : State → Bool

def Deterministic.eval (automaton : Deterministic State) : Term → State
  | .s => automaton.leaf
  | .app left right => automaton.branch (automaton.eval left) (automaton.eval right)

def Deterministic.accepts (automaton : Deterministic State) (source : Term) : Bool :=
  automaton.final (automaton.eval source)

def subsetBranch (automaton : Nondeterministic n) (left right : Bits n) : Bits n :=
  Bits.tabulate n (fun state => anyIndex n (fun lstate =>
    left.get lstate && anyIndex n (fun rstate =>
      right.get rstate && (automaton.branch lstate rstate).get state)))

theorem subsetBranch_iff (automaton : Nondeterministic n) (left right : Bits n)
    (state : Fin n) :
    (subsetBranch automaton left right).get state = true ↔
      ∃ lstate rstate, left.get lstate = true ∧ right.get rstate = true ∧
        (automaton.branch lstate rstate).get state = true := by
  rw [subsetBranch, Bits.get_tabulate, anyIndex_iff]
  constructor
  · rintro ⟨lstate, accepted⟩
    obtain ⟨leftYes, rest⟩ := (Bool.and_eq_true _ _).mp accepted
    obtain ⟨rstate, accepted⟩ := (anyIndex_iff _ _).mp rest
    obtain ⟨rightYes, nodeYes⟩ := (Bool.and_eq_true _ _).mp accepted
    exact ⟨lstate, rstate, leftYes, rightYes, nodeYes⟩
  · rintro ⟨lstate, rstate, leftYes, rightYes, nodeYes⟩
    exact ⟨lstate, (Bool.and_eq_true _ _).mpr ⟨leftYes,
      (anyIndex_iff _ _).mpr ⟨rstate, (Bool.and_eq_true _ _).mpr ⟨rightYes, nodeYes⟩⟩⟩⟩

def determinize (automaton : Nondeterministic n) : Deterministic (Bits n) where
  cover := Bits.all n
  covers := Bits.mem_all
  leaf := automaton.leaf
  branch := subsetBranch automaton
  final states := anyIndex n (fun state => states.get state && automaton.final.get state)

theorem determinize_eval_iff (automaton : Nondeterministic n) (source : Term)
    (state : Fin n) :
    ((determinize automaton).eval source).get state = true ↔ Run automaton source state := by
  induction source generalizing state with
  | s =>
    constructor
    · exact Run.leaf
    · intro actual; cases actual with | leaf yes => exact yes
  | app left right leftIH rightIH =>
    change (subsetBranch automaton ((determinize automaton).eval left)
      ((determinize automaton).eval right)).get state = true ↔ _
    rw [subsetBranch_iff]
    constructor
    · rintro ⟨lstate, rstate, leftYes, rightYes, nodeYes⟩
      exact Run.branch ((leftIH _).mp leftYes) ((rightIH _).mp rightYes) nodeYes
    · intro actual
      cases actual with
      | branch leftRun rightRun nodeYes =>
        exact ⟨_, _, (leftIH _).mpr leftRun, (rightIH _).mpr rightRun, nodeYes⟩

theorem determinize_accepts_iff (automaton : Nondeterministic n) (source : Term) :
    (determinize automaton).accepts source = true ↔ automaton.Accepts source := by
  change anyIndex n (fun state => ((determinize automaton).eval source).get state &&
    automaton.final.get state) = true ↔ _
  rw [anyIndex_iff]
  constructor
  · rintro ⟨state, yes⟩
    obtain ⟨runYes, finalYes⟩ := (Bool.and_eq_true _ _).mp yes
    exact ⟨state, (determinize_eval_iff _ _ _).mp runYes, finalYes⟩
  · rintro ⟨state, actual, finalYes⟩
    exact ⟨state, (Bool.and_eq_true _ _).mpr
      ⟨(determinize_eval_iff _ _ _).mpr actual, finalYes⟩⟩

def complement (automaton : Deterministic State) : Deterministic State :=
  { automaton with final := fun state => !(automaton.final state) }

theorem complement_eval (automaton : Deterministic State) (source : Term) :
    (complement automaton).eval source = automaton.eval source := by
  induction source with
  | s => rfl
  | app left right leftIH rightIH =>
    change automaton.branch ((complement automaton).eval left)
      ((complement automaton).eval right) = _
    rw [leftIH, rightIH]
    rfl

theorem complement_accepts_iff (automaton : Deterministic State) (source : Term) :
    (complement automaton).accepts source = true ↔ automaton.accepts source ≠ true := by
  change Bool.not (automaton.final ((complement automaton).eval source)) = true ↔ _
  rw [complement_eval]
  cases answered : automaton.accepts source <;> simp only [Deterministic.accepts] at answered
  · rw [answered]; decide
  · rw [answered]; decide

theorem complement_determinize_iff (automaton : Nondeterministic n) (source : Term) :
    (complement (determinize automaton)).accepts source = true ↔ ¬ automaton.Accepts source := by
  rw [complement_accepts_iff]
  exact not_congr (determinize_accepts_iff automaton source)

end PureSFormal.Research.FiniteTreeAutomatonPowerset
