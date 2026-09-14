import Std

/-! Explicit finite enumerations of functions, products and observation sets.
No classical choice is used to obtain an executable decision table. -/
namespace PureSFormal.AppendixF.FiniteTables

structure Enumeration (Value : Type) where
  values : List Value
  covers : ∀ value, value ∈ values

def assignments [DecidableEq A] (fallback : B) (codomain : List B) : List A → List (A → B)
  | [] => [fun _ => fallback]
  | a :: rest => codomain.flatMap (fun b =>
      (assignments fallback codomain rest).map (fun f x => if x = a then b else f x))

theorem assignments_complete [DecidableEq A] (fallback : B) (codomain : Enumeration B)
    (domain : List A) (f : A → B) :
    ∃ g, g ∈ assignments fallback codomain.values domain ∧
      ∀ x, x ∈ domain → g x = f x := by
  induction domain with
  | nil => exact ⟨fun _ => fallback, by simp [assignments], by simp⟩
  | cons a rest ih =>
    obtain ⟨g, member, agrees⟩ := ih
    refine ⟨fun x => if x = a then f a else g x, ?_, ?_⟩
    · apply List.mem_flatMap.mpr
      exact ⟨f a, codomain.covers _, List.mem_map.mpr ⟨g, member, rfl⟩⟩
    · intro x mem
      by_cases same : x = a
      · simp [same]
      · simpa only [if_neg same] using agrees x ((List.mem_cons.mp mem).resolve_left same)

def functions [DecidableEq A] (domain : Enumeration A) (codomain : Enumeration B)
    (fallback : B) : Enumeration (A → B) where
  values := assignments fallback codomain.values domain.values
  covers f := by
    obtain ⟨g, member, agrees⟩ := assignments_complete fallback codomain domain.values f
    have same : g = f := funext (fun x => agrees x (domain.covers x))
    exact same ▸ member

def functionEquality [DecidableEq B] (domain : Enumeration A) (f g : A → B) :
    Decidable (f = g) :=
  if h : ∀ x ∈ domain.values, f x = g x then
    isTrue (funext (fun x => h x (domain.covers x)))
  else isFalse (fun same => h (fun _ _ => congrFun same _))

def product (left : Enumeration A) (right : Enumeration B) : Enumeration (A × B) where
  values := left.values.flatMap (fun a => right.values.map (fun b => (a, b)))
  covers value := List.mem_flatMap.mpr ⟨value.1, left.covers _,
    List.mem_map.mpr ⟨value.2, right.covers _, rfl⟩⟩

def boolean : Enumeration Bool where
  values := [false, true]
  covers b := by cases b <;> simp

def optional (base : Enumeration A) : Enumeration (Option A) where
  values := none :: base.values.map some
  covers value := by
    cases value with
    | none => exact List.Mem.head _
    | some a => exact List.Mem.tail _ (List.mem_map.mpr ⟨a, base.covers a, rfl⟩)

def transport (enumeration : Enumeration B) (encode : A → B) (decode : B → A)
    (inverse : ∀ a, decode (encode a) = a) : Enumeration A where
  values := enumeration.values.map decode
  covers a := List.mem_map.mpr ⟨encode a, enumeration.covers _, inverse a⟩

def equality [DecidableEq B] (encode : A → B) (decode : B → A)
    (inverse : ∀ a, decode (encode a) = a) (a b : A) : Decidable (a = b) :=
  if h : encode a = encode b then
    isTrue ((inverse a).symm.trans ((congrArg decode h).trans (inverse b)))
  else isFalse (fun h' => h (congrArg encode h'))

end PureSFormal.AppendixF.FiniteTables
