import PureSFormal.AppendixF.CarrierRecognition

/-! The finite bottom-up carrier parser. Intermediate fields retain literal
constructor information; the observer transition is never inverted. -/
namespace PureSFormal.AppendixF.Carrier
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

structure ReaderState (State : Type) where
  value : State
  atom : Bool
  unary : Option State
  doubleS : Option State
  carrier : Option (Summary State)

def readerLeaf (a : Deterministic State) : ReaderState State :=
  ⟨a.leaf, true, none, none, none⟩

def readerBranch [DecidableEq State] (a : Deterministic State)
    (left right : ReaderState State) : ReaderState State where
  value := a.branch left.value right.value
  atom := false
  unary := if left.atom then some right.value else none
  doubleS := if left.atom then right.unary else none
  carrier := match left.unary, right.carrier with
    | some p, some rest => some (tagSummary a p rest)
    | _, _ => match left.doubleS, right.unary with
      | some u, some v => some (baseSummary a u v)
      | _, _ => none

def reader [DecidableEq State] (a : Deterministic State) : Term → ReaderState State
  | .s => readerLeaf a
  | .app left right => readerBranch a (reader a left) (reader a right)

@[simp] theorem reader_value [DecidableEq State] (a : Deterministic State) (t : Term) :
    (reader a t).value = a.eval t := by
  induction t with
  | s => rfl
  | app left right ihl ihr =>
    change a.branch (reader a left).value (reader a right).value = a.branch (a.eval left) (a.eval right)
    rw [ihl, ihr]

@[simp] theorem reader_atom [DecidableEq State] (a : Deterministic State) (t : Term) :
    (reader a t).atom = decide (t = .s) := by cases t <;> rfl

def unaryParameter (a : Deterministic State) : Term → Option State
  | .app .s u => some (a.eval u)
  | _ => none

def doubleParameter (a : Deterministic State) : Term → Option State
  | .app .s (.app .s u) => some (a.eval u)
  | _ => none

@[simp] theorem reader_unary [DecidableEq State] (a : Deterministic State) (t : Term) :
    (reader a t).unary = unaryParameter a t := by
  cases t with
  | s => rfl
  | app left right =>
    simp only [reader, readerBranch, reader_atom, reader_value]
    cases left <;> rfl

@[simp] theorem reader_double [DecidableEq State] (a : Deterministic State) (t : Term) :
    (reader a t).doubleS = doubleParameter a t := by
  cases t with
  | s => rfl
  | app left right =>
    simp only [reader, readerBranch, reader_atom, reader_unary]
    cases left with
    | s => cases right with
      | s => rfl
      | app fn arg => cases fn <;> rfl
    | app => rfl

theorem reader_carrier [DecidableEq State] (a : Deterministic State) (t : Term) :
    (reader a t).carrier = (parse t).map (summarize a) := by
  induction t with
  | s => rfl
  | app left right ihl ihr =>
    simp only [reader, readerBranch, reader_unary, reader_double, ihr]
    cases left with
    | s => rfl
    | app head p =>
      cases head with
      | app => rfl
      | s =>
        cases right with
        | s => cases p with
          | s => rfl
          | app fn u => cases fn <;> rfl
        | app fn v =>
          cases fn with
          | s => cases p with
            | s => rfl
            | app fn u => cases fn <;> rfl
          | app x y =>
            simp only [unaryParameter, doubleParameter, parse]
            cases found : parse (x ⊙ y ⊙ v) <;>
              simp only [found, Option.map_none, Option.map_some, summarize]
            cases p with
            | s => rfl
            | app fn u => cases fn <;> rfl

theorem reader_carrier_iff [DecidableEq State] (a : Deterministic State) (t : Term) (summary : Summary State) :
    (reader a t).carrier = some summary ↔
      ∃ code : Code, t = code.term ∧ summarize a code = summary := by
  rw [reader_carrier, Option.map_eq_some_iff]
  constructor
  · rintro ⟨code, parsed, same⟩
    exact ⟨code, parse_sound t code parsed, same⟩
  · rintro ⟨code, same, summaryEq⟩
    exact ⟨code, (parse_iff t code).mpr same, summaryEq⟩

end PureSFormal.AppendixF.Carrier
