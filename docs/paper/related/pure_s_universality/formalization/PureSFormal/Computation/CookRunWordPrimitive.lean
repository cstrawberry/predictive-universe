import PureSFormal.Computation.CookCounterPrimitive

/-!
# Primitive Cook run-word parsing

Comparisons of machine states, families, and indices inspect two nullary
constructors and select a Boolean result. Tag comparison also reads the
fields of matching tag constructors. List counts build unary naturals; run
reconstruction allocates prefixes onto shared suffixes. Every count pass and
the final full-word equality check is included in the operation total.
-/

namespace PureSFormal.Computation.CookRunWordPrimitive

open PureS PureS.ParserPrimitiveMachine Cook Cook.PassClassification

def sameState (first second : MachineState) : Result Bool := ⟨decide (first = second), 3⟩
def sameFamily (first second : Family) : Result Bool := ⟨decide (first = second), 3⟩
def sameIndex (first second : Index) : Result Bool := ⟨decide (first = second), 3⟩

def sameTag : TagSymbol → TagSymbol → Result Bool
  | .head first, .head second
  | .left first, .left second
  | .right first, .right second
  | .rightStar first, .rightStar second =>
      let same := sameState first second
      ⟨same.value, same.operations + 5⟩
  | .indexed family state index, .indexed otherFamily otherState otherIndex =>
      let first := sameFamily family otherFamily
      if first.value then
        let second := sameState state otherState
        if second.value then
          let third := sameIndex index otherIndex
          ⟨third.value, first.operations + second.operations + third.operations + 11⟩
        else ⟨false, first.operations + second.operations + 11⟩
      else ⟨false, first.operations + 10⟩
  | .dummy1, .dummy1
  | .dummy2, .dummy2 => ⟨true, 3⟩
  | _, _ => ⟨false, 3⟩

theorem sameTag_value (first second : TagSymbol) : (sameTag first second).value = true ↔ first = second := by
  cases first <;> cases second <;> simp [sameTag, sameState, sameFamily, sameIndex]
  all_goals try split
  all_goals try split
  all_goals simp_all

theorem sameTag_operations_le (first second : TagSymbol) : (sameTag first second).operations ≤ 20 := by
  cases first <;> cases second <;> simp only [sameTag, sameState, sameFamily, sameIndex, apply_ite]
  all_goals try decide
  rename_i family state index otherFamily otherState otherIndex
  by_cases hf : family = otherFamily <;> by_cases hs : state = otherState <;> simp [hf, hs]

def countTag (needle : TagSymbol) : List TagSymbol → Result Nat
  | [] => ⟨0, 2⟩
  | first :: rest =>
      let same := sameTag first needle
      let inner := countTag needle rest
      if same.value then ⟨.succ inner.value, same.operations + inner.operations + 5⟩
      else ⟨inner.value, same.operations + inner.operations + 4⟩

theorem countTag_value (needle : TagSymbol) (word : List TagSymbol) :
    (countTag needle word).value = word.count needle := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      unfold countTag
      dsimp only
      rw [List.count_cons]
      by_cases same : first = needle
      · subst first
        rw [if_pos ((sameTag_value _ _).mpr rfl), if_pos (beq_self_eq_true needle)]
        exact congrArg Nat.succ ih
      · have different : (first == needle) ≠ true := fun accepted => same (beq_iff_eq.mp accepted)
        rw [if_neg (fun accepted => same ((sameTag_value _ _).mp accepted)), if_neg different]
        exact ih

theorem countTag_le_length (needle : TagSymbol) (word : List TagSymbol) :
    (countTag needle word).value ≤ word.length := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      unfold countTag
      dsimp only
      split
      · exact Nat.succ_le_succ ih
      · exact Nat.le_trans ih (Nat.le_succ _)

theorem countTag_operations_le (needle : TagSymbol) (word : List TagSymbol) :
    (countTag needle word).operations ≤ 25 * word.length + 2 := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      have bound := Nat.add_le_add_right (Nat.add_le_add (sameTag_operations_le first needle) ih) 5
      have full : (sameTag first needle).operations + (countTag needle rest).operations + 5 ≤
          25 * (first :: rest).length + 2 := by
        simpa only [List.length_cons, Nat.mul_succ, show 25 = 20 + 5 by rfl,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
      unfold countTag
      dsimp only
      split
      · exact full
      · exact Nat.le_trans (Nat.add_le_add_left (by decide : 4 ≤ 5) _) full

def equalTags : List TagSymbol → List TagSymbol → Result Bool
  | [], [] => ⟨true, 2⟩
  | [], _ :: _ => ⟨false, 2⟩
  | _ :: _, [] => ⟨false, 2⟩
  | first :: rest, second :: tail =>
      let same := sameTag first second
      if same.value then
        let inner := equalTags rest tail
        ⟨inner.value, same.operations + inner.operations + 7⟩
      else ⟨false, same.operations + 5⟩

theorem equalTags_value (first second : List TagSymbol) :
    (equalTags first second).value = true ↔ first = second := by
  induction first generalizing second with
  | nil => cases second <;> simp [equalTags]
  | cons tag rest ih =>
      cases second with
      | nil => simp [equalTags]
      | cons other tail =>
          simp only [equalTags, sameTag_value, List.cons.injEq]
          by_cases same : tag = other <;> simp [same, ih]

theorem equalTags_operations_le (first second : List TagSymbol) :
    (equalTags first second).operations ≤ 27 * first.length + 2 := by
  induction first generalizing second with
  | nil => cases second <;> exact Nat.le_refl _
  | cons tag rest ih =>
      cases second with
      | nil => exact Nat.le_add_left _ _
      | cons other tail =>
          have full := Nat.add_le_add_right (Nat.add_le_add (sameTag_operations_le tag other) (ih tail)) 7
          have bound : (sameTag tag other).operations + (equalTags rest tail).operations + 7 ≤
              27 * (tag :: rest).length + 2 := by
            simpa only [List.length_cons, Nat.mul_succ, show 27 = 20 + 7 by rfl,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using full
          unfold equalTags
          dsimp only
          split
          · exact bound
          · exact Nat.le_trans
              (Nat.add_le_add (Nat.le_add_right _ _) (by decide : 5 ≤ 7)) bound

def replicateOnto (symbol : TagSymbol) (suffix : List TagSymbol) : Nat → Result (List TagSymbol)
  | 0 => ⟨suffix, 1⟩
  | .succ count =>
      let inner := replicateOnto symbol suffix count
      ⟨symbol :: inner.value, inner.operations + 3⟩

theorem replicateOnto_value (symbol : TagSymbol) (suffix : List TagSymbol) (count : Nat) :
    (replicateOnto symbol suffix count).value = List.replicate count symbol ++ suffix := by
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (List.cons symbol) ih

theorem replicateOnto_operations (symbol : TagSymbol) (suffix : List TagSymbol) (count : Nat) :
    (replicateOnto symbol suffix count).operations = 3 * count + 1 := by
  induction count with
  | zero => rfl
  | succ count ih =>
      change (replicateOnto symbol suffix count).operations + 3 = 3 * count.succ + 1
      rw [ih, Nat.mul_succ]

def encode (state : MachineState) (counts : RunCounts) : Result (List TagSymbol) :=
  let right := replicateOnto (.right state) [] counts.right
  let left := replicateOnto (.left state) right.value counts.left
  let head := replicateOnto (.head state) left.value counts.head
  ⟨head.value, right.operations + left.operations + head.operations + 7⟩

theorem encode_value (state : MachineState) (counts : RunCounts) :
    (encode state counts).value = runWord state counts := by
  unfold encode
  dsimp only
  rw [replicateOnto_value, replicateOnto_value, replicateOnto_value]
  simp only [runWord, List.append_nil, List.append_assoc]

theorem encode_operations (state : MachineState) (counts : RunCounts) :
    (encode state counts).operations = 3 * (counts.head + counts.left + counts.right) + 10 := by
  unfold encode
  dsimp only
  rw [replicateOnto_operations, replicateOnto_operations, replicateOnto_operations]
  simp only [Nat.mul_add, show 10 = 1 + 1 + 1 + 7 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def parseBody (state : MachineState) (word : List TagSymbol) :
    Result (Option (MachineState × RunCounts)) :=
  let head := countTag (.head state) word
  let left := countTag (.left state) word
  let right := countTag (.right state) word
  let counts : RunCounts := ⟨head.value, left.value, right.value⟩
  let reconstructed := encode state counts
  let same := equalTags word reconstructed.value
  if same.value then
    ⟨some (state, counts),
      head.operations + left.operations + right.operations + reconstructed.operations + same.operations + 7⟩
  else
    ⟨none,
      head.operations + left.operations + right.operations + reconstructed.operations + same.operations + 6⟩

def parse (word : List TagSymbol) : Result (Option (MachineState × RunCounts)) :=
  match word with
  | [] => ⟨none, 2⟩
  | .head state :: _ =>
      let inner := parseBody state word
      ⟨inner.value, inner.operations + 4⟩
  | _ :: _ => ⟨none, 4⟩

theorem parseBody_value (state : MachineState) (word : List TagSymbol) :
    (parseBody state word).value =
      let counts : RunCounts :=
        ⟨word.count (.head state), word.count (.left state), word.count (.right state)⟩
      if word = runWord state counts then some (state, counts) else none := by
  unfold parseBody
  dsimp only
  rw [countTag_value, countTag_value, countTag_value, encode_value]
  by_cases same : word = runWord state
      ⟨word.count (.head state), word.count (.left state), word.count (.right state)⟩
  · rw [if_pos ((equalTags_value _ _).mpr same), if_pos same]
  · rw [if_neg (fun accepted => same ((equalTags_value _ _).mp accepted)), if_neg same]

theorem parse_value (word : List TagSymbol) : (parse word).value = Cook.parseRunWord? word := by
  cases word with
  | nil => rfl
  | cons first rest =>
      cases first <;> try rfl
      exact parseBody_value _ _

theorem parseBody_counts_le (state : MachineState) (word : List TagSymbol)
    (answer : MachineState × RunCounts) (accepted : (parseBody state word).value = some answer) :
    answer.2.head ≤ word.length ∧ answer.2.left ≤ word.length ∧ answer.2.right ≤ word.length := by
  unfold parseBody at accepted
  dsimp only at accepted
  split at accepted
  · cases Option.some.inj accepted
    exact ⟨countTag_le_length _ _, countTag_le_length _ _, countTag_le_length _ _⟩
  · contradiction

theorem parse_counts_le (word : List TagSymbol) (answer : MachineState × RunCounts)
    (accepted : (parse word).value = some answer) :
    answer.2.head ≤ word.length ∧ answer.2.left ≤ word.length ∧ answer.2.right ≤ word.length := by
  cases word with
  | nil => contradiction
  | cons first rest =>
      cases first <;> try contradiction
      exact parseBody_counts_le _ _ _ accepted

theorem parseBody_operations_le (state : MachineState) (word : List TagSymbol) :
    (parseBody state word).operations ≤ 111 * word.length + 25 := by
  let counts : RunCounts :=
    ⟨(countTag (.head state) word).value, (countTag (.left state) word).value,
      (countTag (.right state) word).value⟩
  have totalCount : counts.head + counts.left + counts.right ≤
      word.length + word.length + word.length :=
    Nat.add_le_add (Nat.add_le_add (countTag_le_length _ _) (countTag_le_length _ _))
      (countTag_le_length _ _)
  have reconstruction : (encode state counts).operations ≤ 9 * word.length + 10 := by
    rw [encode_operations]
    have bound := Nat.add_le_add_right (Nat.mul_le_mul_left 3 totalCount) 10
    simpa only [Nat.mul_add, ← Nat.add_mul] using bound
  have full := Nat.add_le_add_right
    (Nat.add_le_add
      (Nat.add_le_add
        (Nat.add_le_add (Nat.add_le_add (countTag_operations_le (.head state) word)
          (countTag_operations_le (.left state) word))
          (countTag_operations_le (.right state) word)) reconstruction)
      (equalTags_operations_le word (encode state counts).value)) 7
  have bound :
      (countTag (.head state) word).operations + (countTag (.left state) word).operations +
        (countTag (.right state) word).operations + (encode state counts).operations +
        (equalTags word (encode state counts).value).operations + 7 ≤ 111 * word.length + 25 := by
    apply Nat.le_trans full
    have arithmetic (n : Nat) :
        (25 * n + 2 + (25 * n + 2) + (25 * n + 2) + (9 * n + 10) + (27 * n + 2) + 7) =
          111 * n + 25 := by
      calc
        _ = (25 + 25 + 25 + 9 + 27) * n + (2 + 2 + 2 + 10 + 2 + 7) := by
          simp only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        _ = _ := rfl
    rw [arithmetic]
    exact Nat.le_refl _
  unfold parseBody
  dsimp only
  split
  · exact bound
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 6 ≤ 7) _) bound

theorem parse_operations_le (word : List TagSymbol) :
    (parse word).operations ≤ 128 * (word.length + 1) := by
  have full : 111 * word.length + 25 + 4 ≤ 128 * (word.length + 1) := by
    have bound := Nat.add_le_add (Nat.mul_le_mul_right word.length (by decide : 111 ≤ 128))
      (by decide : 25 + 4 ≤ 128)
    simpa only [Nat.mul_add, Nat.mul_one, Nat.add_assoc] using bound
  cases word with
  | nil => exact (by decide : 2 ≤ 128)
  | cons first rest =>
      cases first
      case head state =>
        exact Nat.le_trans (Nat.add_le_add_right (parseBody_operations_le _ _) 4) full
      all_goals
        change 4 ≤ 128 * (List.length (_ :: rest) + 1)
        exact Nat.le_trans (by decide : 4 ≤ 128)
          (Nat.le_mul_of_pos_right 128 (Nat.succ_pos _))

end PureSFormal.Computation.CookRunWordPrimitive
