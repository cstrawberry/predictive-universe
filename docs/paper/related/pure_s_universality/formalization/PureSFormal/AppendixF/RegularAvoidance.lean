import PureSFormal.AppendixF.CarrierFeatures

/-! An explicit finite bottom-up automaton for the avoiding-occurrence language
in Proposition F.3.2, with no marks added to the native term. -/
namespace PureSFormal.AppendixF.Carrier
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
set_option maxHeartbeats 1000000

abbrev ReaderState.Tuple (State : Type) :=
  State × Bool × Option State × Option State × Option (Summary State)
def ReaderState.encode (r : ReaderState State) : ReaderState.Tuple State :=
  (r.value, r.atom, r.unary, r.doubleS, r.carrier)
def ReaderState.decode (t : ReaderState.Tuple State) : ReaderState State :=
  ⟨t.1, t.2.1, t.2.2.1, t.2.2.2.1, t.2.2.2.2⟩
theorem ReaderState.inverse (r : ReaderState State) : ReaderState.decode r.encode = r := by cases r; rfl

def ReaderState.enumeration [DecidableEq State] (a : Deterministic State) :
    FiniteTables.Enumeration (ReaderState State) := by
  let q : FiniteTables.Enumeration State := ⟨a.cover, a.covers⟩
  let optionQ := FiniteTables.optional q
  exact FiniteTables.transport (FiniteTables.product q (FiniteTables.product FiniteTables.boolean
    (FiniteTables.product optionQ (FiniteTables.product optionQ (FiniteTables.optional (Summary.enumeration a))))))
      ReaderState.encode ReaderState.decode ReaderState.inverse

abbrev TreeState (State : Type) := ReaderState State × (Observation State → Bool)

def treeStates [DecidableEq State] (a : Deterministic State) : FiniteTables.Enumeration (TreeState State) := by
  letI : DecidableEq (Observation State) := Observation.equality a
  exact FiniteTables.product (ReaderState.enumeration a)
    (FiniteTables.functions (Observation.enumeration a) FiniteTables.boolean false)

def treeLeaf (a : Deterministic State) : TreeState State := (readerLeaf a, fun _ => false)

def treeBranch [DecidableEq State] (a : Deterministic State) (left right : TreeState State) : TreeState State :=
  (readerBranch a left.1 right.1, fun o => rootFeature a left.1 right.1 o ||
    featureImage a (Observation.liftLeft a right.1.value) left.2 o ||
    featureImage a (Observation.liftRight a left.1.value) right.2 o)

def Observation.future [DecidableEq State] (a : Deterministic State) (o : Observation State) : Bool :=
  FiniteOrbit.acceptsWithin (Observation.next a) (Observation.accepts a)
    (Observation.enumeration a).values.length o

theorem Observation.future_iff [DecidableEq State] (a : Deterministic State) (c : Configuration) :
    Observation.future a (observation a c) = true ↔ Observes a c :=
  eventuallyAccepts_correct a c

def treeFinal [DecidableEq State] (a : Deterministic State) (s : TreeState State) : Bool :=
  (Observation.enumeration a).values.any (fun o => s.2 o && !(Observation.future a o))

def avoidanceAutomaton [DecidableEq State] (a : Deterministic State) : Deterministic (TreeState State) where
  cover := (treeStates a).values
  covers := (treeStates a).covers
  leaf := treeLeaf a
  branch := treeBranch a
  final := treeFinal a

theorem avoidanceAutomaton_eval [DecidableEq State] (a : Deterministic State) (t : Term) :
    (avoidanceAutomaton a).eval t = (reader a t, features a t) := by
  induction t with
  | s => rfl
  | app left right ihl ihr =>
    change treeBranch a ((avoidanceAutomaton a).eval left) ((avoidanceAutomaton a).eval right) = _
    rw [ihl, ihr]
    simp only [treeBranch, reader_value, reader, features]

theorem bool_not_true (b : Bool) : (!b) = true ↔ ¬ b = true := by cases b <;> simp

/-- Effective regular recognition of precisely the avoiding carrier occurrences. -/
theorem avoidanceAutomaton_correct [DecidableEq State] (a : Deterministic State) (t : Term) :
    (avoidanceAutomaton a).accepts t = true ↔ Avoiding a t := by
  unfold Deterministic.accepts
  rw [avoidanceAutomaton_eval]
  change treeFinal a (reader a t, features a t) = true ↔ _
  simp only [treeFinal, List.any_eq_true, Bool.and_eq_true, bool_not_true]
  constructor
  · rintro ⟨o, _, member, avoids⟩
    obtain ⟨c, termEq, obsEq⟩ := (features_iff a t o).mp member
    refine ⟨c, termEq, ?_⟩
    intro observes
    apply avoids
    rw [← obsEq]
    exact (Observation.future_iff a c).mpr observes
  · rintro ⟨c, termEq, avoids⟩
    refine ⟨observation a c, (Observation.enumeration a).covers _,
      (features_iff a t _).mpr ⟨c, termEq, rfl⟩, ?_⟩
    exact fun yes => avoids ((Observation.future_iff a c).mp yes)

/-- Proposition F.3.2's disjointness and one-step continuation for the literal
finite automaton, together with complete coverage of globally avoiding pairs. -/
theorem regular_avoidance [DecidableEq State] (a : Deterministic State) :
    (∀ t, (avoidanceAutomaton a).accepts t = true → a.accepts t ≠ true) ∧
    (∀ t, (avoidanceAutomaton a).accepts t = true →
      ∃ next, Step t next ∧ (avoidanceAutomaton a).accepts next = true) ∧
    (∀ (left right : Code) (context : Context),
      (∀ target, Steps (context.plug (.app left.term right.term)) target → a.accepts target ≠ true) →
      (avoidanceAutomaton a).accepts (context.plug (.app left.term right.term)) = true) := by
  constructor
  · intro t yes
    exact avoiding_disjoint a t ((avoidanceAutomaton_correct a t).mp yes)
  constructor
  · intro t yes
    obtain ⟨next, step, avoids⟩ := avoiding_continues a t ((avoidanceAutomaton_correct a t).mp yes)
    exact ⟨next, step, (avoidanceAutomaton_correct a next).mpr avoids⟩
  · intro left right context avoids
    exact (avoidanceAutomaton_correct a _).mpr (avoiding_covers a _ left right context rfl avoids)

end PureSFormal.AppendixF.Carrier
