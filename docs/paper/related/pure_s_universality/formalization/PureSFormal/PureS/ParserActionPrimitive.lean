import PureSFormal.PureS.ParserPrimitiveMachine
import PureSFormal.PureS.ActionParser

/-!
# Primitive selected-action parsing

The argument collector follows the application spine once and allocates one
list cell per argument. The history test traverses the list and an immutable
unary expected count together, stopping at their first length mismatch.
The fixed expected count belongs to the precompiled action grammar.

All returned argument subtrees are shared references. No history or accumulator
subtree is traversed. The only term equality compares the leading fixed
argument with the closed constant b. Costs use ParserPrimitiveMachine's
constructor/reference/list model, with unary successor inspection for counts.
-/

namespace PureSFormal.PureS.ParserActionPrimitive

open ParserPrimitiveMachine

def collect (term : Term) (arguments : List Term) : Result (List Term) :=
  match term with
  | .s => ⟨arguments, 1⟩
  | .app fn arg =>
      let rest := collect fn (arg :: arguments)
      ⟨rest.value, 4 + rest.operations⟩

theorem collect_value (term : Term) (arguments : List Term) :
    (collect term arguments).value = term.spineArgs ++ arguments := by
  induction term generalizing arguments with
  | s => rfl
  | app fn arg ih =>
      simpa only [collect, Term.spineArgs, List.append_assoc,
        List.cons_append, List.nil_append] using ih (arg :: arguments)

theorem collect_operations (term : Term) (arguments : List Term) :
    (collect term arguments).operations = 4 * term.headArity + 1 := by
  induction term generalizing arguments with
  | s => rfl
  | app fn arg ih =>
      simp only [collect, ih, Term.headArity, Nat.succ_eq_add_one, Nat.mul_add, Nat.mul_one]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def sameLength : List Term → Nat → Result Bool
  | [], 0 => ⟨true, 2⟩
  | [], .succ _ => ⟨false, 2⟩
  | _ :: _, 0 => ⟨false, 2⟩
  | _ :: rest, .succ count =>
      let inner := sameLength rest count
      ⟨inner.value, 4 + inner.operations⟩

theorem sameLength_value (arguments : List Term) (expected : Nat) :
    (sameLength arguments expected).value = true ↔ arguments.length = expected := by
  induction arguments generalizing expected with
  | nil =>
      cases expected with
      | zero => exact ⟨fun _ => rfl, fun _ => rfl⟩
      | succ expected => constructor <;> intro impossible <;> cases impossible
  | cons first rest ih =>
      cases expected with
      | zero => constructor <;> intro impossible <;> cases impossible
      | succ expected =>
          change (sameLength rest expected).value = true ↔
            Nat.succ rest.length = Nat.succ expected
          exact (ih expected).trans ⟨congrArg Nat.succ, Nat.succ.inj⟩

theorem sameLength_operations_le (arguments : List Term) (expected : Nat) :
    (sameLength arguments expected).operations ≤ 4 * arguments.length + 2 := by
  induction arguments generalizing expected with
  | nil => cases expected <;> exact Nat.le_refl _
  | cons first rest ih =>
      cases expected with
      | zero => exact Nat.le_add_left _ _
      | succ expected =>
          have restBound := Nat.add_le_add_left (ih expected) 4
          simpa only [sameLength, List.length_cons, Nat.mul_add, Nat.mul_one,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using restBound

def parseSpine (expected : Nat) : List Term → Result (Option ActionParser.ParsedAction)
  | [] => ⟨none, 2⟩
  | _ :: [] => ⟨none, 5⟩
  | fixed :: accumulator :: histories =>
      let prefixCheck := equal fixed b
      if prefixCheck.value then
        let count := sameLength histories expected
        if count.value then
          ⟨some ⟨accumulator, histories⟩, 6 + prefixCheck.operations + 1 + count.operations + 3⟩
        else
          ⟨none, 6 + prefixCheck.operations + 1 + count.operations + 2⟩
      else
        ⟨none, 6 + prefixCheck.operations + 2⟩

theorem parseSpine_value (expected : Nat) (arguments : List Term) :
    (parseSpine expected arguments).value = ActionParser.parseSpine? expected arguments := by
  cases arguments with
  | nil => rfl
  | cons fixed rest =>
      cases rest with
      | nil => rfl
      | cons accumulator histories =>
          simp only [parseSpine, ActionParser.parseSpine?, equal_value, sameLength_value]
          split <;> simp_all only [Result.value, ↓reduceIte] <;>
            split <;> simp_all only [Result.value, ↓reduceIte]

def weight : List Term → Nat
  | [] => 0
  | first :: rest => first.size + weight rest

theorem length_le_weight (arguments : List Term) : arguments.length ≤ weight arguments := by
  induction arguments with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      have combined := Nat.add_le_add (Nat.succ_le_of_lt first.size_pos) ih
      simpa only [List.length_cons, weight, Nat.add_comm 1] using combined

theorem weight_append (first second : List Term) :
    weight (first ++ second) = weight first + weight second := by
  induction first with
  | nil => simp only [List.nil_append, weight, Nat.zero_add]
  | cons term rest ih => simp only [List.cons_append, weight, ih, Nat.add_assoc]

theorem weight_spineArgs_le (term : Term) : weight term.spineArgs ≤ term.size := by
  induction term with
  | s => exact Nat.zero_le _
  | app fn arg ih =>
      simp only [Term.spineArgs, weight_append, weight, Nat.add_zero, Term.size]
      exact Nat.le_trans (Nat.add_le_add_right ih _) (Nat.le_add_right _ 1)

theorem headArity_le_size (term : Term) : term.headArity ≤ term.size := by
  rw [Term.headArity_eq_spineArgs_length]
  exact Nat.le_trans (length_le_weight _) (weight_spineArgs_le term)

theorem parseSpine_operations_le (expected : Nat) (arguments : List Term) :
    (parseSpine expected arguments).operations ≤ 32 * (weight arguments + 1) := by
  cases arguments with
  | nil => exact (by decide : 2 ≤ 32)
  | cons fixed rest =>
      cases rest with
      | nil =>
          exact Nat.le_trans (by decide : 5 ≤ 32)
            (by simpa only [Nat.mul_one] using
              Nat.mul_le_mul_left 32 (Nat.le_add_left 1 (weight [fixed])))
      | cons accumulator histories =>
          have prefixCheck := equal_operations_le fixed b
          have count := sameLength_operations_le histories expected
          have historiesBound := length_le_weight histories
          have common : 6 + (equal fixed b).operations + 1 +
              (sameLength histories expected).operations + 3 ≤
                32 * (weight (fixed :: accumulator :: histories) + 1) := by
            have comparisons := Nat.add_le_add_right
              (Nat.add_le_add (Nat.add_le_add_right (Nat.add_le_add_left prefixCheck 6) 1) count) 3
            calc
              _ ≤ 6 + 4 * (fixed.size + b.size) + 1 + (4 * histories.length + 2) + 3 :=
                comparisons
              _ = 4 * fixed.size + 4 * histories.length + 24 := by
                change 6 + 4 * (fixed.size + 3) + 1 + (4 * histories.length + 2) + 3 = _
                rw [show 24 = 6 + 12 + 1 + 2 + 3 by rfl]
                simp only [Nat.mul_add, Nat.reduceMul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
              _ ≤ 32 * fixed.size + 32 * weight histories + 32 := by
                apply Nat.add_le_add
                · exact Nat.add_le_add
                    (Nat.mul_le_mul_right fixed.size (by decide : 4 ≤ 32))
                    (Nat.le_trans (Nat.mul_le_mul_left 4 historiesBound)
                      (Nat.mul_le_mul_right (weight histories) (by decide : 4 ≤ 32)))
                · decide
              _ ≤ 32 * (weight (fixed :: accumulator :: histories) + 1) := by
                have bound := Nat.mul_le_mul_left 32
                  (Nat.add_le_add_right
                    (Nat.add_le_add_left (Nat.le_add_left (weight histories) accumulator.size)
                      fixed.size) 1)
                simpa only [weight, Nat.mul_add, Nat.mul_one, Nat.add_assoc] using bound
          simp only [parseSpine]
          split
          · split
            · exact common
            · exact Nat.le_trans (Nat.add_le_add_left (by decide : 2 ≤ 3) _) common
          · have first := Nat.add_le_add
              (Nat.le_add_right (6 + (equal fixed b).operations) 1) (by decide : 2 ≤ 3)
            have second := Nat.add_le_add_right
              (Nat.le_add_right (6 + (equal fixed b).operations + 1)
                (sameLength histories expected).operations) 3
            exact Nat.le_trans first (Nat.le_trans second common)

def parse (expected : Nat) (term : Term) : Result (Option ActionParser.ParsedAction) :=
  let arguments := collect term []
  let parsed := parseSpine expected arguments.value
  ⟨parsed.value, 1 + arguments.operations + parsed.operations⟩

theorem parse_value (expected : Nat) (term : Term) :
    (parse expected term).value = ActionParser.parseSpine? expected term.spineArgs := by
  simp only [parse, collect_value, List.append_nil, parseSpine_value]

theorem parse_program_value (program : CTS.Program) (label : ActionLabel program) (term : Term) :
    (parse (ActionParser.historyCount program label) term).value =
      ActionParser.parse program label term := parse_value _ term

theorem parse_operations_le (expected : Nat) (term : Term) :
    (parse expected term).operations ≤ 36 * (term.size + 1) := by
  simp only [parse, collect_value, List.append_nil, collect_operations]
  have first := Nat.add_le_add_right (Nat.mul_le_mul_left 4 (headArity_le_size term)) 1
  have second := Nat.le_trans (parseSpine_operations_le expected term.spineArgs)
    (Nat.mul_le_mul_left 32 (Nat.add_le_add_right (weight_spineArgs_le term) 1))
  have combined := Nat.add_le_add (Nat.add_le_add_left first 1) second
  calc
    _ ≤ 1 + (4 * term.size + 1) + 32 * (term.size + 1) := combined
    _ ≤ 36 * (term.size + 1) := by
      have ceiling := Nat.add_le_add_left (by decide : 34 ≤ 36) (36 * term.size)
      simpa only [show 36 = 4 + 32 by rfl, Nat.add_mul, Nat.mul_add,
        Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm,
        show 34 = 1 + 1 + 32 by rfl,
        ← Nat.add_assoc] using ceiling

end PureSFormal.PureS.ParserActionPrimitive

