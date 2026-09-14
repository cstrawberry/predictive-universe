import PureSFormal.Research.FiniteTreeAutomatonEnumeration
import PureSFormal.PureS.FiniteController

/-! Finite local certificates for a closed set of nonaccepting configurations.
The up-edge requirements of both children are checked by the parent. The
complemented powerset automaton therefore has an entirely explicit transition
table schema; semantic connection with actual runs is kept separate. -/
namespace PureSFormal.Research.ClosedSetTreeAutomaton
open PureSFormal.PureS FiniteController FiniteTreeAutomatonPowerset

def allIndex : (n : Nat) → (Fin n → Bool) → Bool
  | 0, _ => true
  | n + 1, test => test ⟨0, Nat.zero_lt_succ n⟩ &&
      allIndex n (fun index => test index.succ)

theorem allIndex_iff (n : Nat) (test : Fin n → Bool) :
    allIndex n test = true ↔ ∀ index, test index = true := by
  induction n with
  | zero => exact ⟨fun _ index => Fin.elim0 index, fun _ => rfl⟩
  | succ n ih =>
    change (_ && _) = true ↔ _
    rw [Bool.and_eq_true, ih]
    constructor
    · rintro ⟨first, rest⟩ ⟨value, bound⟩
      cases value with
      | zero => exact first
      | succ value => exact rest ⟨value, Nat.lt_of_succ_lt_succ bound⟩
    · intro every
      exact ⟨every _, fun index => every index.succ⟩

structure Boundary (n : Nat) where
  node : Probe.NodeKind
  incoming : Probe.Incoming
  marked : Bits n
  deriving DecidableEq, Repr

def Boundary.cover (n : Nat) : List (Boundary n) :=
  [Probe.NodeKind.s, .app].flatMap (fun node =>
    [Probe.Incoming.root, .left, .right].flatMap (fun incoming =>
      (Bits.all n).map (fun marked => ⟨node, incoming, marked⟩)))

theorem flatMap_member {α β : Type} (f : α → List β) {values : List α}
    {value : α} {result : β} (member : value ∈ values) (inside : result ∈ f value) :
    result ∈ values.flatMap f := by
  induction member with
  | head => exact List.mem_append_left _ inside
  | tail _ _ ih => exact List.mem_append_right _ ih

theorem Boundary.mem_cover (state : Boundary n) : state ∈ Boundary.cover n := by
  rcases state with ⟨node, incoming, marked⟩
  apply flatMap_member (value := node)
  · cases node <;> simp only [List.mem_cons, List.mem_singleton, true_or, or_true]
  · apply flatMap_member (value := incoming)
    · cases incoming <;> simp only [List.mem_cons, List.mem_singleton, true_or, or_true]
    · exact map_member _ (Bits.mem_all marked)

def rootClosed (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (state : Boundary n) (left right : Bits n) : Bool :=
  allIndex n (fun q => if state.marked.get q then
    Bool.not (accept q) &&
      (match machine.transition q state.node state.incoming with
      | .stay next => state.marked.get next
      | .exec .L next => match state.node with | .s => true | .app => left.get next
      | .exec .R next => match state.node with | .s => true | .app => right.get next
      | .exec .U _ => true
      | .exec .Rdx _ => true
      | .reject => true)
    else true)

def upClosed (machine : Machine (Fin n)) (child parent : Boundary n) : Bool :=
  allIndex n (fun q => if child.marked.get q then
    match machine.transition q child.node child.incoming with
    | .exec .U next => parent.marked.get next
    | _ => true
    else true)

def emptyBits (n : Nat) : Bits n := Bits.tabulate n (fun _ => false)

def leafCheck (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (state : Boundary n) : Bool :=
  match state.node with
  | .s => rootClosed machine accept state (emptyBits n) (emptyBits n)
  | .app => false

def branchCheck (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (left right state : Boundary n) : Bool :=
  match state.node, left.incoming, right.incoming with
  | .app, .left, .right =>
      rootClosed machine accept state left.marked right.marked &&
        upClosed machine left state && upClosed machine right state
  | _, _, _ => false

def finalCheck (start : Fin n) (state : Boundary n) : Bool :=
  match state.incoming with
  | .root => state.marked.get start
  | _ => false

def certificateAutomaton (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (start : Fin n) : FiniteTreeAutomatonEnumeration.Automaton (Boundary n) where
  cover := Boundary.cover n
  covers := Boundary.mem_cover
  leaf := leafCheck machine accept
  branch := branchCheck machine accept
  final := finalCheck start

inductive Decoration (n : Nat) : Term → Type where
  | leaf (marked : Bits n) : Decoration n .s
  | branch (marked : Bits n) (left : Decoration n l) (right : Decoration n r) :
      Decoration n (.app l r)

def Decoration.boundary (decoration : Decoration n source) (incoming : Probe.Incoming) : Boundary n :=
  match decoration with
  | .leaf marked => ⟨.s, incoming, marked⟩
  | .branch marked _ _ => ⟨.app, incoming, marked⟩

theorem Decoration.boundary_incoming (decoration : Decoration n source) (incoming : Probe.Incoming) :
    (decoration.boundary incoming).incoming = incoming := by
  cases decoration <;> rfl

def Decoration.Valid (machine : Machine (Fin n)) (accept : Fin n → Bool) :
    {source : Term} → Decoration n source → Probe.Incoming → Prop
  | _, decoration@(.leaf _), incoming => leafCheck machine accept (decoration.boundary incoming) = true
  | _, decoration@(.branch _ left right), incoming =>
      left.Valid machine accept .left ∧ right.Valid machine accept .right ∧
        branchCheck machine accept (left.boundary .left) (right.boundary .right)
          (decoration.boundary incoming) = true

def Certificate (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (start : Fin n) (source : Term) : Prop :=
  ∃ decoration : Decoration n source,
    decoration.Valid machine accept .root ∧
      (decoration.boundary .root).marked.get start = true

theorem leafCheck_node (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (state : Boundary n) (passed : leafCheck machine accept state = true) : state.node = .s := by
  cases kind : state.node with
  | s => rfl
  | app => simp only [leafCheck, kind] at passed; cases passed

theorem branchCheck_shape (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (left right state : Boundary n) (passed : branchCheck machine accept left right state = true) :
    state.node = .app ∧ left.incoming = .left ∧ right.incoming = .right := by
  cases kind : state.node <;> cases lside : left.incoming <;> cases rside : right.incoming <;>
    simp only [branchCheck, kind, lside, rside] at passed
  all_goals try cases passed
  exact ⟨rfl, rfl, rfl⟩

theorem certificate_run_iff (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (start : Fin n) (source : Term) (state : Boundary n) :
    FiniteTreeAutomatonEnumeration.Run (certificateAutomaton machine accept start) source state ↔
      ∃ decoration : Decoration n source,
        decoration.boundary state.incoming = state ∧ decoration.Valid machine accept state.incoming := by
  induction source generalizing state with
  | s =>
    constructor
    · intro actual
      cases actual with
      | leaf passed =>
        have kind := leafCheck_node machine accept state passed
        refine ⟨.leaf state.marked, ?_, ?_⟩
        · rcases state with ⟨node, incoming, marked⟩; cases kind; rfl
        · change leafCheck machine accept ⟨.s, state.incoming, state.marked⟩ = true
          have equal : (⟨.s, state.incoming, state.marked⟩ : Boundary n) = state := by
            rcases state with ⟨node, incoming, marked⟩; cases kind; rfl
          rw [equal]; exact passed
    · rintro ⟨decoration, equal, valid⟩
      cases decoration with
      | leaf marked =>
        apply FiniteTreeAutomatonEnumeration.Run.leaf
        change leafCheck machine accept state = true
        rw [← equal]
        exact valid
  | app left right leftIH rightIH =>
    constructor
    · intro actual
      cases actual with
      | @branch _ _ lstate rstate _ leftRun rightRun passed =>
        obtain ⟨ldec, lequal, lvalid⟩ := (leftIH _).mp leftRun
        obtain ⟨rdec, requal, rvalid⟩ := (rightIH _).mp rightRun
        obtain ⟨kind, lside, rside⟩ := branchCheck_shape machine accept lstate rstate state passed
        rw [lside] at lequal lvalid
        rw [rside] at requal rvalid
        have equal : (Decoration.branch state.marked ldec rdec).boundary state.incoming = state := by
          rcases state with ⟨node, incoming, marked⟩; cases kind; rfl
        refine ⟨.branch state.marked ldec rdec, equal, lvalid, rvalid, ?_⟩
        rw [lequal, requal, equal]
        exact passed
    · rintro ⟨decoration, equal, valid⟩
      cases decoration with
      | branch marked ldec rdec =>
        obtain ⟨lvalid, rvalid, passed⟩ := valid
        apply FiniteTreeAutomatonEnumeration.Run.branch
          ((leftIH (ldec.boundary .left)).mpr ⟨ldec,
            by rw [Decoration.boundary_incoming],
            by simpa only [Decoration.boundary_incoming] using lvalid⟩)
          ((rightIH (rdec.boundary .right)).mpr ⟨rdec,
            by rw [Decoration.boundary_incoming],
            by simpa only [Decoration.boundary_incoming] using rvalid⟩)
        change branchCheck machine accept _ _ state = true
        rw [← equal]
        exact passed

theorem certificate_accepts_iff (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (start : Fin n) (source : Term) :
    (certificateAutomaton machine accept start).Accepts source ↔ Certificate machine accept start source := by
  constructor
  · rintro ⟨state, actual, accepted⟩
    obtain ⟨decoration, equal, valid⟩ := (certificate_run_iff _ _ _ _ _).mp actual
    have side : state.incoming = .root := by
      cases side : state.incoming with
      | root => rfl
      | left => change finalCheck start state = true at accepted; simp only [finalCheck, side] at accepted; cases accepted
      | right => change finalCheck start state = true at accepted; simp only [finalCheck, side] at accepted; cases accepted
    rw [side] at equal valid
    refine ⟨decoration, valid, ?_⟩
    rw [equal]
    change finalCheck start state = true at accepted
    simpa only [finalCheck, side] using accepted
  · rintro ⟨decoration, valid, marked⟩
    refine ⟨decoration.boundary .root, (certificate_run_iff _ _ _ _ _).mpr ⟨decoration, ?_, ?_⟩, ?_⟩
    · cases decoration <;> rfl
    · cases decoration <;> exact valid
    · change finalCheck start (decoration.boundary .root) = true
      cases decoration <;> exact marked

def compiled (machine : Machine (Fin n)) (accept : Fin n → Bool) (start : Fin n) :=
  complement (FiniteTreeAutomatonEnumeration.deterministic (certificateAutomaton machine accept start))

theorem compiled_accepts_iff_no_certificate (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (start : Fin n) (source : Term) :
    (compiled machine accept start).accepts source = true ↔ ¬ Certificate machine accept start source := by
  exact (FiniteTreeAutomatonEnumeration.complement_accepts_iff _ _).trans
    (not_congr (certificate_accepts_iff _ _ _ _))

end PureSFormal.Research.ClosedSetTreeAutomaton
