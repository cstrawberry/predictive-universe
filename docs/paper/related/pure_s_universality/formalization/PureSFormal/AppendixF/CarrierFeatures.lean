import PureSFormal.AppendixF.CarrierTreeReader
import PureSFormal.AppendixF.CarrierAvoidance

/-! Finite occurrence features preserve the whole context of every possible
carrier pair. Feature membership is a Boolean function on a finite domain. -/
namespace PureSFormal.AppendixF.Carrier
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000
set_option maxRecDepth 10000

def Observation.eqb [DecidableEq State] (a : Deterministic State) (left right : Observation State) : Bool :=
  @decide (left = right) (Observation.equality a left right)

theorem Observation.eqb_iff [DecidableEq State] (a : Deterministic State) (left right : Observation State) :
    Observation.eqb a left right = true ↔ left = right := by
  letI : DecidableEq (Observation State) := Observation.equality a
  exact decide_eq_true_iff

def Observation.liftLeft (a : Deterministic State) (right : State) (o : Observation State) : Observation State :=
  {o with context := fun z => a.branch (o.context z) right}

def Observation.liftRight (a : Deterministic State) (left : State) (o : Observation State) : Observation State :=
  {o with context := fun z => a.branch left (o.context z)}

def featureImage [DecidableEq State] (a : Deterministic State) (f : Observation State → Observation State)
    (set : Observation State → Bool) (o : Observation State) : Bool :=
  (Observation.enumeration a).values.any (fun prior => set prior && Observation.eqb a (f prior) o)

theorem featureImage_iff [DecidableEq State] (a : Deterministic State) (f : Observation State → Observation State)
    (set : Observation State → Bool) (o : Observation State) :
    featureImage a f set o = true ↔ ∃ prior, set prior = true ∧ f prior = o := by
  simp only [featureImage, List.any_eq_true, Bool.and_eq_true, Observation.eqb_iff]
  constructor
  · rintro ⟨prior, _, yes, same⟩; exact ⟨prior, yes, same⟩
  · rintro ⟨prior, yes, same⟩; exact ⟨prior, (Observation.enumeration a).covers _, yes, same⟩

def rootFeature [DecidableEq State] (a : Deterministic State) (left right : ReaderState State)
    (o : Observation State) : Bool :=
  match left.carrier, right.carrier with
  | some l, some r => Observation.eqb a ⟨l, r, id⟩ o
  | _, _ => false

theorem rootFeature_iff [DecidableEq State] (a : Deterministic State) (left right : ReaderState State)
    (o : Observation State) :
    rootFeature a left right o = true ↔
      ∃ l r, left.carrier = some l ∧ right.carrier = some r ∧ (Observation.mk l r id) = o := by
  cases l : left.carrier <;> cases r : right.carrier <;>
    simp [rootFeature, l, r, Observation.eqb_iff]

def features [DecidableEq State] (a : Deterministic State) : Term → Observation State → Bool
  | .s, _ => false
  | .app left right, o =>
      rootFeature a (reader a left) (reader a right) o ||
      featureImage a (Observation.liftLeft a (a.eval right)) (features a left) o ||
      featureImage a (Observation.liftRight a (a.eval left)) (features a right) o

def Configuration.extendLeft (c : Configuration) (right : Term) : Configuration :=
  {c with context := .appLeft c.context right}
def Configuration.extendRight (left : Term) (c : Configuration) : Configuration :=
  {c with context := .appRight left c.context}

theorem extendLeft_observation [DecidableEq State] (a : Deterministic State) (c : Configuration) (right : Term) :
    observation a (c.extendLeft right) = Observation.liftLeft a (a.eval right) (observation a c) := rfl
theorem extendRight_observation [DecidableEq State] (a : Deterministic State) (left : Term) (c : Configuration) :
    observation a (c.extendRight left) = Observation.liftRight a (a.eval left) (observation a c) := rfl

theorem Configuration.term_ne_s (c : Configuration) : c.term ≠ .s := by
  cases c with
  | mk left right context => cases context <;> intro impossible <;> cases impossible

theorem features_iff [DecidableEq State] (a : Deterministic State) (term : Term) (o : Observation State) :
    features a term o = true ↔ ∃ c : Configuration, c.term = term ∧ observation a c = o := by
  induction term generalizing o with
  | s =>
    constructor
    · intro impossible; cases impossible
    · rintro ⟨c, same, _⟩; exact (c.term_ne_s same).elim
  | app left right ihl ihr =>
    simp only [features, Bool.or_eq_true, featureImage_iff, rootFeature_iff]
    constructor
    · intro feature
      rcases feature with root | inRight
      · cases root with
        | inl root =>
          obtain ⟨l, r, lparsed, rparsed, same⟩ := root
          obtain ⟨lcode, leq, lsummary⟩ := (reader_carrier_iff a left l).mp lparsed
          obtain ⟨rcode, req, rsummary⟩ := (reader_carrier_iff a right r).mp rparsed
          refine ⟨⟨lcode, rcode, .hole⟩, ?_, ?_⟩
          · change lcode.term ⊙ rcode.term = left ⊙ right
            rw [leq, req]
          · change (Observation.mk (summarize a lcode) (summarize a rcode) id) = o
            rw [lsummary, rsummary]
            exact same
        | inr inLeft =>
          obtain ⟨prior, feature, same⟩ := inLeft
          obtain ⟨c, termEq, obsEq⟩ := (ihl prior).mp feature
          refine ⟨c.extendLeft right, ?_, ?_⟩
          · exact congrArg (fun t => t ⊙ right) termEq
          · rw [extendLeft_observation, obsEq]
            exact same
      · obtain ⟨prior, feature, same⟩ := inRight
        obtain ⟨c, termEq, obsEq⟩ := (ihr prior).mp feature
        refine ⟨c.extendRight left, ?_, ?_⟩
        · exact congrArg (Term.app left) termEq
        · rw [extendRight_observation, obsEq]
          exact same
    · rintro ⟨c, termEq, obsEq⟩
      cases c with
      | mk lcode rcode context =>
        cases context with
        | hole =>
          have pair := Term.app.inj termEq
          refine Or.inl (Or.inl ⟨summarize a lcode, summarize a rcode, ?_, ?_, obsEq⟩)
          · exact (reader_carrier_iff a left _).mpr ⟨lcode, pair.1.symm, rfl⟩
          · exact (reader_carrier_iff a right _).mpr ⟨rcode, pair.2.symm, rfl⟩
        | appLeft inner sibling =>
          have pair := Term.app.inj termEq
          let prior : Configuration := ⟨lcode, rcode, inner⟩
          refine Or.inl (Or.inr ⟨observation a prior, (ihl _).mpr ⟨prior, pair.1, rfl⟩, ?_⟩)
          rw [← pair.2]
          exact obsEq
        | appRight sibling inner =>
          have pair := Term.app.inj termEq
          let prior : Configuration := ⟨lcode, rcode, inner⟩
          refine Or.inr ⟨observation a prior, (ihr _).mpr ⟨prior, pair.2, rfl⟩, ?_⟩
          rw [← pair.1]
          exact obsEq

end PureSFormal.AppendixF.Carrier
