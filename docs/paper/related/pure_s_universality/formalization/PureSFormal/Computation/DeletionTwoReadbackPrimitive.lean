import PureSFormal.Computation.DeletionTwoT2Readback
import PureSFormal.PureS.ParserTerminalPrimitive

/-!
# Primitive inverse of pair-padding normalization

The table contributes only its unary row count. Comparisons inspect unary
constructors and stop when that bound is exhausted. Aligned parsing removes
whole delay pairs. The second attempt handles a leading unmatched delay and
discards the logically consumed source symbol. Both attempts, including late
failure, are charged. Returned labels and surviving tails share immutable
input references; every new list cell is allocated explicitly.
-/

namespace PureSFormal.Computation.DeletionTwoReadbackPrimitive

open PureS.ParserPrimitiveMachine PureS.ParserTerminalPrimitive
open RogozhinTagInput DeletionTwoT2Normalizer DeletionTwoT2Readback

def atMost : Nat → Nat → Result Bool
  | 0, _ => ⟨true, 1⟩
  | .succ _, 0 => ⟨false, 2⟩
  | .succ value, .succ limit =>
      let rest := atMost value limit
      ⟨rest.value, rest.operations + 4⟩

theorem atMost_value (value limit : Nat) :
    (atMost value limit).value = true ↔ value ≤ limit := by
  induction value generalizing limit with
  | zero => exact ⟨fun _ => Nat.zero_le _, fun _ => rfl⟩
  | succ value ih =>
      cases limit with
      | zero =>
          constructor
          · intro impossible
            cases impossible
          · intro impossible
            exact False.elim (Nat.not_succ_le_zero _ impossible)
      | succ limit => exact (ih limit).trans Nat.succ_le_succ_iff.symm

theorem atMost_operations_le (value limit : Nat) :
    (atMost value limit).operations ≤ 4 * limit + 2 := by
  induction limit generalizing value with
  | zero =>
      cases value with
      | zero => exact (by decide : 1 ≤ 2)
      | succ value => exact Nat.le_refl _
  | succ limit ih =>
      cases value with
      | zero => exact Nat.le_trans (by decide : 1 ≤ 2) (Nat.le_add_left _ _)
      | succ value =>
          simpa only [atMost, Nat.mul_succ, Nat.add_assoc, Nat.add_comm,
            Nat.add_left_comm] using Nat.add_le_add_right (ih value) 4

def rename (delay target label : Nat) : Result Nat :=
  let equal := equalIndex target label
  ⟨if equal.value then delay else label, equal.operations + 1⟩

theorem rename_value (delay target label : Nat) :
    (rename delay target label).value = if label = target then delay else label := by
  change (if (equalIndex target label).value then delay else label) =
    if label = target then delay else label
  by_cases same : target = label
  · rw [(equalIndex_value target label).mpr same, if_pos same.symm]
    rfl
  · have rejected : (equalIndex target label).value = false := by
      cases found : (equalIndex target label).value with
      | false => rfl
      | true => exact False.elim (same ((equalIndex_value _ _).mp found))
    have different : label ≠ target := fun equal => same equal.symm
    rw [rejected]
    simp only [Bool.false_eq_true, if_false, if_neg different]

theorem rename_operations_le (delay target label : Nat) :
    (rename delay target label).operations ≤ 4 * target + 3 := by
  exact Nat.add_le_add_right (equalIndex_operations_le target label) 1

def prepend (label : Nat) : Option (List Nat) → Result (Option (List Nat))
  | none => ⟨none, 2⟩
  | some rest => ⟨some (label :: rest), 4⟩

theorem prepend_value (label : Nat) (parsed : Option (List Nat)) :
    (prepend label parsed).value = parsed.map (List.cons label) := by
  cases parsed <;> rfl

theorem prepend_operations_le (label : Nat) (parsed : Option (List Nat)) :
    (prepend label parsed).operations ≤ 4 := by
  cases parsed with
  | none => exact (by decide : 2 ≤ 4)
  | some rest => exact Nat.le_refl _

theorem pairInduction {α : Type} {motive : List α → Prop}
    (nil : motive []) (singleton : ∀ first, motive [first])
    (cons_cons : ∀ first second tail,
      motive tail → motive (second :: tail) → motive (first :: second :: tail)) :
    ∀ word, motive word
  | [] => nil
  | [first] => singleton first
  | first :: second :: tail => cons_cons first second tail
      (pairInduction nil singleton cons_cons tail)
      (pairInduction nil singleton cons_cons (second :: tail))

def aligned (delay target : Nat) : List Nat → Result (Option (List Nat))
  | [] => ⟨some [], 3⟩
  | first :: rest =>
      let firstDelay := equalIndex delay first
      if firstDelay.value then
        match rest with
        | [] => ⟨none, firstDelay.operations + 6⟩
        | second :: tail =>
            let secondDelay := equalIndex delay second
            if secondDelay.value then
              let parsed := aligned delay target tail
              ⟨parsed.value, firstDelay.operations + secondDelay.operations + parsed.operations + 8⟩
            else ⟨none, firstDelay.operations + secondDelay.operations + 9⟩
      else
        let allowed := atMost first target
        if allowed.value then
          let label := rename delay target first
          let parsed := aligned delay target rest
          let result := prepend label.value parsed.value
          ⟨result.value, firstDelay.operations + allowed.operations + label.operations +
            parsed.operations + result.operations + 5⟩
        else ⟨none, firstDelay.operations + allowed.operations + 6⟩

theorem aligned_value (program : Program) (word : List Nat) :
    (aligned (delayLabel program) (targetHaltLabel program) word).value =
      decodeAligned? program word := by
  induction word using pairInduction with
  | nil => rfl
  | singleton first =>
      rw [aligned, decodeAligned?_cons]
      simp only [equalIndex_value, atMost_value]
      by_cases delay : first = delayLabel program
      · simp only [if_pos delay.symm, if_pos delay]
      · have different : delayLabel program ≠ first := fun equal => delay equal.symm
        simp only [if_neg different, if_neg delay]
        by_cases bounded : first ≤ targetHaltLabel program
        · simp only [if_pos bounded]
          change some ((rename (delayLabel program) (targetHaltLabel program) first).value :: []) = _
          rw [rename_value]
          rfl
        · simp only [if_neg bounded]
  | cons_cons first second tail ihTail ihRest =>
      rw [aligned, decodeAligned?_cons]
      simp only [equalIndex_value, atMost_value]
      by_cases delay : first = delayLabel program
      · simp only [if_pos delay.symm, if_pos delay]
        by_cases delaySecond : second = delayLabel program
        · simp only [if_pos delaySecond.symm, if_pos delaySecond]
          exact ihTail
        · have different : delayLabel program ≠ second := fun equal => delaySecond equal.symm
          simp only [if_neg different, if_neg delaySecond]
      · have different : delayLabel program ≠ first := fun equal => delay equal.symm
        simp only [if_neg different, if_neg delay]
        by_cases bounded : first ≤ targetHaltLabel program
        · simp only [if_pos bounded]
          change (prepend (rename (delayLabel program) (targetHaltLabel program) first).value
            (aligned (delayLabel program) (targetHaltLabel program) (second :: tail)).value).value = _
          rw [prepend_value, rename_value, ihRest]
          rfl
        · simp only [if_neg bounded]

def coefficient (delay target : Nat) : Nat := 8 * delay + 8 * target + 32

theorem coefficient_data (delay target : Nat) :
    4 * delay + 8 * target + 16 ≤ coefficient delay target := by
  exact Nat.add_le_add (Nat.add_le_add
    (Nat.mul_le_mul_right delay (by decide : 4 ≤ 8)) (Nat.le_refl _)) (by decide)

theorem coefficient_pair (delay target : Nat) :
    8 * delay + 12 ≤ coefficient delay target := by
  have bound := Nat.add_le_add (Nat.le_refl (8 * delay))
    (Nat.le_trans (by decide : 12 ≤ 32) (Nat.le_add_left 32 (8 * target)))
  simpa only [coefficient, Nat.add_assoc] using bound

theorem coefficient_single (delay target : Nat) :
    4 * delay + 8 ≤ coefficient delay target := by
  have bound := Nat.add_le_add
    (Nat.mul_le_mul_right delay (by decide : 4 ≤ 8)) (by decide : 8 ≤ 12)
  exact Nat.le_trans bound (coefficient_pair delay target)

theorem coefficient_failure (delay target : Nat) :
    4 * delay + 4 * target + 10 ≤ coefficient delay target := by
  have bound := Nat.add_le_add (Nat.add_le_add (Nat.le_refl (4 * delay))
    (Nat.mul_le_mul_right target (by decide : 4 ≤ 8))) (by decide : 10 ≤ 16)
  exact Nat.le_trans bound (coefficient_data delay target)

theorem aligned_operations_le (delay target : Nat) (word : List Nat) :
    (aligned delay target word).operations ≤ coefficient delay target * word.length + 3 := by
  have successBound (first : Nat) (rest : List Nat)
      (restBound : (aligned delay target rest).operations ≤ coefficient delay target * rest.length + 3) :
      (equalIndex delay first).operations + (atMost first target).operations +
        (rename delay target first).operations + (aligned delay target rest).operations +
        (prepend (rename delay target first).value (aligned delay target rest).value).operations + 5 ≤
          coefficient delay target * (rest.length + 1) + 3 := by
    have counted := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
      (Nat.add_le_add (equalIndex_operations_le delay first) (atMost_operations_le first target))
      (rename_operations_le delay target first)) restBound)
      (prepend_operations_le (rename delay target first).value
        (aligned delay target rest).value)) 5
    have enlarged := Nat.add_le_add_left
      (Nat.add_le_add_right (coefficient_data delay target) 3)
      (coefficient delay target * rest.length)
    apply Nat.le_trans counted
    simpa only [Nat.mul_add, Nat.mul_one, show 8 * target = 4 * target + 4 * target by
      rw [← Nat.add_mul],
      show 16 = 2 + 2 + 3 + 4 + 5 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using enlarged
  have failureBound (first : Nat) (rest : List Nat) :
      (equalIndex delay first).operations + (atMost first target).operations + 6 ≤
        coefficient delay target * (rest.length + 1) + 3 := by
    have counted := Nat.add_le_add_right
      (Nat.add_le_add (equalIndex_operations_le delay first) (atMost_operations_le first target)) 6
    have localBound : (4 * delay + 2) + (4 * target + 2) + 6 ≤ coefficient delay target := by
      simpa only [show 10 = 2 + 2 + 6 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using coefficient_failure delay target
    have enlarged : coefficient delay target ≤
        coefficient delay target * (rest.length + 1) + 3 :=
      Nat.le_trans (Nat.le_add_left _ (coefficient delay target * rest.length))
        (Nat.le_add_right _ 3)
    exact Nat.le_trans (Nat.le_trans counted localBound)
      (by simpa only [Nat.mul_add, Nat.mul_one] using enlarged)
  induction word using pairInduction with
  | nil => exact Nat.le_refl _
  | singleton first =>
      rw [aligned]
      split
      · have bound := Nat.add_le_add_right (equalIndex_operations_le delay first) 6
        have localBound : (4 * delay + 2) + 6 ≤ coefficient delay target :=
          coefficient_single delay target
        exact Nat.le_trans (Nat.le_trans bound localBound)
          (by simpa only [List.length_cons, List.length_nil, Nat.zero_add, Nat.mul_one] using
            Nat.le_add_right (coefficient delay target) 3)
      · dsimp only
        split
        · exact successBound first [] (Nat.le_refl _)
        · exact failureBound first []
  | cons_cons first second tail ihTail ihRest =>
      rw [aligned]
      split
      · dsimp only
        split
        · have counted := Nat.add_le_add_right (Nat.add_le_add
            (Nat.add_le_add (equalIndex_operations_le delay first)
              (equalIndex_operations_le delay second)) ihTail) 8
          have oneStep := Nat.add_le_add_left
            (Nat.add_le_add_right (coefficient_pair delay target) 3)
            (coefficient delay target * tail.length)
          have bound : (4 * delay + 2) + (4 * delay + 2) +
              (coefficient delay target * tail.length + 3) + 8 ≤
                coefficient delay target * (tail.length + 1) + 3 := by
            simpa only [Nat.mul_add, Nat.mul_one, show 8 * delay = 4 * delay + 4 * delay by
              rw [← Nat.add_mul],
              show 12 = 2 + 2 + 8 by rfl,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using oneStep
          exact Nat.le_trans (Nat.le_trans counted bound)
            (Nat.add_le_add_right (Nat.mul_le_mul_left _ (Nat.le_succ _)) 3)
        · have counted := Nat.add_le_add_right (Nat.add_le_add
            (equalIndex_operations_le delay first) (equalIndex_operations_le delay second)) 9
          have budget := Nat.add_le_add_right (coefficient_pair delay target) 1
          have localBound : (4 * delay + 2) + (4 * delay + 2) + 9 ≤
              coefficient delay target + 1 := by
            simpa only [show 8 * delay = 4 * delay + 4 * delay by rw [← Nat.add_mul],
              show 9 = 8 + 1 by rfl, show 12 = 2 + 2 + 8 by rfl,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using budget
          have enlarged := Nat.add_le_add
            (Nat.le_mul_of_pos_right (coefficient delay target)
              (Nat.succ_pos (second :: tail).length)) (by decide : 1 ≤ 3)
          exact Nat.le_trans (Nat.le_trans counted localBound) enlarged
      · dsimp only
        split
        · exact successBound first (second :: tail) ihRest
        · exact failureBound first (second :: tail)

def trim : Option (List Nat) → Result (Option (List Nat))
  | none => ⟨none, 2⟩
  | some [] => ⟨some [], 4⟩
  | some (_ :: rest) => ⟨some rest, 5⟩

theorem trim_value (parsed : Option (List Nat)) :
    (trim parsed).value = parsed.map List.tail := by
  cases parsed with
  | none => rfl
  | some word => cases word <;> rfl

theorem trim_operations_le (parsed : Option (List Nat)) : (trim parsed).operations ≤ 5 := by
  cases parsed with
  | none => exact (by decide : 2 ≤ 5)
  | some word =>
      cases word with
      | nil => exact (by decide : 4 ≤ 5)
      | cons first rest => exact Nat.le_refl _

def wordPrepared (delay target : Nat) (word : List Nat) : Result (Option (List Nat)) :=
  let parsed := aligned delay target word
  match parsed.value with
  | accepted@(some _) => ⟨accepted, parsed.operations + 1⟩
  | none =>
      match word with
      | [] => ⟨none, parsed.operations + 3⟩
      | first :: rest =>
          let isDelay := equalIndex delay first
          if isDelay.value then
            let retried := aligned delay target rest
            let trimmed := trim retried.value
            ⟨trimmed.value, parsed.operations + isDelay.operations + retried.operations +
              trimmed.operations + 5⟩
          else ⟨none, parsed.operations + isDelay.operations + 6⟩

theorem wordPrepared_value (program : Program) (word : List Nat) :
    (wordPrepared (delayLabel program) (targetHaltLabel program) word).value =
      decodeWord? program word := by
  rw [wordPrepared.eq_def]
  dsimp only
  rw [aligned_value, decodeWord?.eq_def]
  cases parsed : decodeAligned? program word with
  | some output => rfl
  | none =>
      cases word with
      | nil => rfl
      | cons first rest =>
          dsimp only
          simp only [equalIndex_value]
          by_cases delay : first = delayLabel program
          · simp only [if_pos delay.symm, if_pos delay]
            rw [trim_value, aligned_value]
          · have different : delayLabel program ≠ first := fun equal => delay equal.symm
            simp only [if_neg different, if_neg delay]

theorem wordPrepared_operations_le (delay target : Nat) (word : List Nat) :
    (wordPrepared delay target word).operations ≤
      (2 * coefficient delay target + 4 * delay + 24) * (word.length + 1) := by
  have ceiling (length : Nat) :
      coefficient delay target * length + coefficient delay target * length + 4 * delay + 24 ≤
        (2 * coefficient delay target + 4 * delay + 24) * (length + 1) := by
    have linear : 4 * delay + 24 ≤ (4 * delay + 24) * (length + 1) :=
      Nat.le_mul_of_pos_right _ (Nat.succ_pos length)
    have repeated := Nat.add_le_add_right
      (Nat.add_le_add
        (Nat.mul_le_mul_left (coefficient delay target) (Nat.le_succ length))
        (Nat.mul_le_mul_left (coefficient delay target) (Nat.le_succ length)))
      (4 * delay + 24)
    have finalBound := Nat.add_le_add_left linear
      (coefficient delay target * (length + 1) + coefficient delay target * (length + 1))
    apply Nat.le_trans (by simpa only [Nat.add_assoc] using repeated)
    simpa only [show 2 * coefficient delay target =
        coefficient delay target + coefficient delay target by rw [Nat.two_mul],
      Nat.add_mul, Nat.add_assoc] using finalBound
  have firstBound := aligned_operations_le delay target word
  have minimum : coefficient delay target * word.length + 4 ≤
      coefficient delay target * word.length + coefficient delay target * word.length + 4 * delay + 24 := by
    have rightBound : 4 ≤ coefficient delay target * word.length + (4 * delay + 24) :=
      Nat.le_trans (by decide : 4 ≤ 24)
        (Nat.le_trans (Nat.le_add_left 24 (4 * delay)) (Nat.le_add_left _ _))
    simpa only [Nat.add_assoc] using Nat.add_le_add_left rightBound
      (coefficient delay target * word.length)
  rw [wordPrepared.eq_def]
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_right firstBound 1)
      (Nat.le_trans minimum (ceiling word.length))
  · cases word with
    | nil =>
        change 3 + 3 ≤ _
        have large : 6 ≤ 2 * coefficient delay target + 4 * delay + 24 :=
          Nat.le_trans (by decide : 6 ≤ 24) (Nat.le_add_left _ _)
        simpa only [List.length_nil, Nat.zero_add, Nat.mul_one] using large
    | cons first rest =>
        dsimp only
        split
        · have retryBound := Nat.le_trans (aligned_operations_le delay target rest)
            (Nat.add_le_add_right (Nat.mul_le_mul_left _
              (Nat.le_succ rest.length)) 3)
          have counted := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add
            (Nat.add_le_add firstBound (equalIndex_operations_le delay first)) retryBound)
            (trim_operations_le (aligned delay target rest).value)) 5
          have small : 3 + 2 + 3 + 5 + 5 ≤ 24 := by decide
          have localBound := Nat.add_le_add_left small
            (coefficient delay target * (first :: rest).length +
              coefficient delay target * (first :: rest).length + 4 * delay)
          apply Nat.le_trans counted
          apply Nat.le_trans _ (ceiling (first :: rest).length)
          simpa only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using localBound
        · have counted := Nat.add_le_add_right
            (Nat.add_le_add firstBound (equalIndex_operations_le delay first)) 6
          have small : 3 + 2 + 6 ≤ coefficient delay target * (first :: rest).length + 24 :=
            Nat.le_trans (by decide : 3 + 2 + 6 ≤ 24) (Nat.le_add_left _ _)
          have localBound := Nat.add_le_add_left small
            (coefficient delay target * (first :: rest).length + 4 * delay)
          apply Nat.le_trans counted
          apply Nat.le_trans _ (ceiling (first :: rest).length)
          simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using localBound

def rowCount {α : Type} : List α → Result Nat
  | [] => ⟨0, 2⟩
  | _ :: rest =>
      let counted := rowCount rest
      ⟨Nat.succ counted.value, counted.operations + 3⟩

theorem rowCount_value {α : Type} (rows : List α) : (rowCount rows).value = rows.length := by
  induction rows with
  | nil => rfl
  | cons row rest ih => simp only [rowCount, ih, List.length_cons]

theorem rowCount_operations {α : Type} (rows : List α) :
    (rowCount rows).operations = 3 * rows.length + 2 := by
  induction rows with
  | nil => rfl
  | cons row rest ih =>
      simp only [rowCount, ih, List.length_cons, Nat.mul_succ,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def parse (program : Program) (word : List Nat) : Result (Option (List Nat)) :=
  let count := rowCount program.productions
  let parsed := wordPrepared count.value (Nat.succ count.value) word
  ⟨parsed.value, count.operations + parsed.operations + 2⟩

theorem parse_value (program : Program) (word : List Nat) :
    (parse program word).value = decodeWord? program word := by
  rw [parse, rowCount_value]
  exact wordPrepared_value program word

theorem parse_operations_le (program : Program) (word : List Nat) :
    (parse program word).operations ≤
      192 * (program.productions.length + 1) * (word.length + 1) := by
  let count := program.productions.length
  have constantBound (constant : Nat) : constant ≤ constant * (count + 1) :=
    Nat.le_mul_of_pos_right _ (Nat.succ_pos count)
  have linearBound (constant : Nat) : constant * count ≤ constant * (count + 1) :=
    Nat.mul_le_mul_left _ (Nat.le_succ count)
  have grammarBound : coefficient count (count + 1) ≤ 48 * (count + 1) := by
    have bound := Nat.add_le_add (Nat.add_le_add (linearBound 8) (Nat.le_refl (8 * (count + 1))))
      (constantBound 32)
    simpa only [coefficient, show 48 = 8 + 8 + 32 by rfl, Nat.add_mul] using bound
  have parserBound : 2 * coefficient count (count + 1) + 4 * count + 24 ≤ 124 * (count + 1) := by
    have bound := Nat.add_le_add
      (Nat.add_le_add (Nat.mul_le_mul_left 2 grammarBound) (linearBound 4)) (constantBound 24)
    simpa only [show 124 = 2 * 48 + 4 + 24 by rfl, Nat.add_mul, Nat.mul_assoc] using bound
  have preparationBound : 3 * count + 4 ≤ 7 * (count + 1) := by
    simpa only [show 7 = 3 + 4 by rfl, Nat.add_mul] using
      Nat.add_le_add (linearBound 3) (constantBound 4)
  have decoded := Nat.le_trans (wordPrepared_operations_le count (count + 1) word)
    (Nat.mul_le_mul_right (word.length + 1) parserBound)
  have prepared := Nat.le_trans preparationBound
    (Nat.le_mul_of_pos_right (7 * (count + 1)) (Nat.succ_pos word.length))
  have counted := Nat.add_le_add prepared decoded
  have enlarged := Nat.mul_le_mul_right (word.length + 1)
    (Nat.mul_le_mul_right (count + 1) (by decide : 7 + 124 ≤ 192))
  rw [parse, rowCount_value, rowCount_operations]
  apply Nat.le_trans _ (by simpa only [Nat.add_mul] using enlarged)
  simpa only [show 4 = 2 + 2 by rfl, count, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm] using counted

theorem decodeAligned_length_le (program : Program) (word output : List Nat)
    (accepted : decodeAligned? program word = some output) :
    output.length ≤ word.length := by
  induction word using pairInduction generalizing output with
  | nil =>
      cases accepted
      exact Nat.le_refl _
  | singleton first =>
      rw [decodeAligned?_cons] at accepted
      split at accepted
      · cases accepted
      · split at accepted
        · cases accepted
          exact Nat.le_refl _
        · cases accepted
  | cons_cons first second tail ihTail ihRest =>
      rw [decodeAligned?_cons] at accepted
      split at accepted
      · dsimp only at accepted
        split at accepted
        · exact Nat.le_trans (ihTail output accepted)
            (Nat.le_trans (Nat.le_succ _) (Nat.le_succ _))
        · cases accepted
      · split at accepted
        · cases parsed : decodeAligned? program (second :: tail) with
          | none => rw [parsed] at accepted; cases accepted
          | some rest =>
              rw [parsed] at accepted
              cases accepted
              exact Nat.succ_le_succ (ihRest rest parsed)
        · cases accepted

theorem decodeWord_length_le (program : Program) (word output : List Nat)
    (accepted : decodeWord? program word = some output) :
    output.length ≤ word.length := by
  rw [decodeWord?.eq_def] at accepted
  cases firstParse : decodeAligned? program word with
  | some result =>
      rw [firstParse] at accepted
      cases accepted
      exact decodeAligned_length_le program word _ firstParse
  | none =>
      rw [firstParse] at accepted
      cases word with
      | nil => cases accepted
      | cons first rest =>
          dsimp only at accepted
          split at accepted
          · cases retried : decodeAligned? program rest with
            | none => rw [retried] at accepted; cases accepted
            | some result =>
                rw [retried] at accepted
                cases accepted
                have tailLength : result.tail.length ≤ result.length := by
                  rw [List.length_tail]
                  exact Nat.sub_le _ _
                exact Nat.le_trans tailLength
                  (Nat.le_trans (decodeAligned_length_le program rest result retried) (Nat.le_succ _))
          · cases accepted

theorem parse_length_le (program : Program) (word output : List Nat)
    (accepted : (parse program word).value = some output) :
    output.length ≤ word.length :=
  decodeWord_length_le program word output ((parse_value program word).symm.trans accepted)

end PureSFormal.Computation.DeletionTwoReadbackPrimitive
