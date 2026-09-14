import PureSFormal.Research.ProtectedTrieMachineCode

/-!
# Exact structural cost model for the literal-tableau verifier

This module assigns structural meters to the local tableau verifier.
The parser, canonical re-encoder, equality tests, state/tape
lookups, replacement, padded movement, and adjacent-row transition check all
have executable counted counterparts.  `ticks` counts constructor tests,
one-edge list traversals, and fixed-field operations.  `peak` counts the
largest explicit recursion/temporary-list allowance in the same evaluation.
These are the structural charges specified in Appendix C.9.1, not fully
charged primitive arithmetic or physical memory costs: `movePaddedM` assigns
a fixed charge to its head comparison, and `encodeTableauM` uses `rows.length`
without a separately metered length pass.
-/

namespace PureSFormal.Research.ProtectedTrieTableauExactCost

open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieMachineCode

structure Meter (alpha : Type) where
  value : alpha
  ticks : Nat
  peak : Nat
  deriving DecidableEq, Repr

/-- The generic `BEq` synthesized from a constructive `DecidableEq` is the
corresponding decision procedure, without appealing to `LawfulBEq`. -/
theorem decidableBEq_eq_true_iff {alpha : Type} [DecidableEq alpha]
    (left right : alpha) :
    @BEq.beq alpha (instBEqOfDecidableEq) left right = true <->
      left = right :=
  decide_eq_true_iff

theorem bitWordBEq_eq_true_iff (left right : BitWord) :
    (left == right) = true <-> left = right :=
  beq_iff_eq

def Meter.bump (result : Meter alpha) : Meter alpha :=
  ⟨result.value, result.ticks + 1, result.peak + 1⟩

/-! ## Counted finite-list and equality primitives -/

def lengthM {alpha : Type} : List alpha -> Meter Nat
  | [] => ⟨0, 1, 1⟩
  | _ :: xs =>
      let tail := lengthM xs
      ⟨tail.value + 1, tail.ticks + 1, tail.peak + 1⟩

@[simp] theorem lengthM_value {alpha : Type} (xs : List alpha) :
    (lengthM xs).value = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [lengthM, ih]

theorem lengthM_ticks (xs : List alpha) :
    (lengthM xs).ticks = xs.length + 1 := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [lengthM, ih, Nat.add_assoc, Nat.add_comm]

theorem lengthM_peak (xs : List alpha) :
    (lengthM xs).peak = xs.length + 1 := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [lengthM, ih, Nat.add_assoc, Nat.add_comm]

def getM? {alpha : Type} : List alpha -> Nat -> Meter (Option alpha)
  | [], _ => ⟨none, 1, 1⟩
  | x :: _, 0 => ⟨some x, 1, 1⟩
  | _ :: xs, index + 1 => (getM? xs index).bump

@[simp] theorem getM?_value {alpha : Type} (xs : List alpha) (index : Nat) :
    (getM? xs index).value = xs[index]? := by
  induction xs generalizing index with
  | nil => rfl
  | cons x xs ih =>
      cases index with
      | zero => rfl
      | succ index => simp [getM?, Meter.bump, ih]

theorem getM?_ticks_le {alpha : Type} (xs : List alpha) (index : Nat) :
    (getM? xs index).ticks <= xs.length + 1 := by
  induction xs generalizing index with
  | nil => simp [getM?]
  | cons x xs ih =>
      cases index with
      | zero => simp [getM?]
      | succ index =>
          change (getM? xs index).ticks + 1 ≤
            (xs.length + 1) + 1
          exact Nat.add_le_add_right (ih index) 1

theorem getM?_peak_le {alpha : Type} (xs : List alpha) (index : Nat) :
    (getM? xs index).peak <= xs.length + 1 := by
  induction xs generalizing index with
  | nil => simp [getM?]
  | cons x xs ih =>
      cases index with
      | zero => simp [getM?]
      | succ index =>
          change (getM? xs index).peak + 1 ≤
            (xs.length + 1) + 1
          exact Nat.add_le_add_right (ih index) 1

def replaceM? {alpha : Type} : List alpha -> Nat -> alpha ->
    Meter (Option (List alpha))
  | [], _, _ => ⟨none, 1, 1⟩
  | _ :: xs, 0, value => ⟨some (value :: xs), 1, 1⟩
  | x :: xs, index + 1, value =>
      let tail := replaceM? xs index value
      ⟨tail.value.map (List.cons x), tail.ticks + 1, tail.peak + 1⟩

@[simp] theorem replaceM?_value {alpha : Type} (xs : List alpha)
    (index : Nat) (value : alpha) :
    (replaceM? xs index value).value = replaceAt? xs index value := by
  induction xs generalizing index with
  | nil => rfl
  | cons x xs ih =>
      cases index with
      | zero => rfl
      | succ index => simp [replaceM?, replaceAt?, ih]

theorem replaceM?_ticks_le {alpha : Type} (xs : List alpha)
    (index : Nat) (value : alpha) :
    (replaceM? xs index value).ticks <= xs.length + 1 := by
  induction xs generalizing index with
  | nil => simp [replaceM?]
  | cons x xs ih =>
      cases index with
      | zero => simp [replaceM?]
      | succ index =>
          change (replaceM? xs index value).ticks + 1 ≤
            (xs.length + 1) + 1
          exact Nat.add_le_add_right (ih index) 1

theorem replaceM?_peak_le {alpha : Type} (xs : List alpha)
    (index : Nat) (value : alpha) :
    (replaceM? xs index value).peak <= xs.length + 1 := by
  induction xs generalizing index with
  | nil => simp [replaceM?]
  | cons x xs ih =>
      cases index with
      | zero => simp [replaceM?]
      | succ index =>
          change (replaceM? xs index value).peak + 1 ≤
            (xs.length + 1) + 1
          exact Nat.add_le_add_right (ih index) 1

def appendM {alpha : Type} : List alpha -> List alpha -> Meter (List alpha)
  | [], ys => ⟨ys, 1, 1⟩
  | x :: xs, ys =>
      let tail := appendM xs ys
      ⟨x :: tail.value, tail.ticks + 1, tail.peak + 1⟩

@[simp] theorem appendM_value {alpha : Type} (xs ys : List alpha) :
    (appendM xs ys).value = xs ++ ys := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [appendM, ih]

theorem appendM_ticks (xs ys : List alpha) :
    (appendM xs ys).ticks = xs.length + 1 := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [appendM, ih, Nat.add_assoc, Nat.add_comm]

theorem appendM_peak (xs ys : List alpha) :
    (appendM xs ys).peak = xs.length + 1 := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [appendM, ih, Nat.add_assoc, Nat.add_comm]

def natEqM : Nat -> Nat -> Meter Bool
  | 0, 0 => ⟨true, 1, 1⟩
  | 0, _ + 1 => ⟨false, 1, 1⟩
  | _ + 1, 0 => ⟨false, 1, 1⟩
  | left + 1, right + 1 => (natEqM left right).bump

@[simp] theorem natEqM_value (left right : Nat) :
    (natEqM left right).value = (left == right) := by
  induction left generalizing right with
  | zero => cases right <;> rfl
  | succ left ih =>
      cases right with
      | zero => rfl
      | succ right =>
          change (natEqM left right).value =
            (Nat.succ left == Nat.succ right)
          apply Bool.eq_iff_iff.mpr
          constructor
          · intro hrecursive
            have hbeq : (left == right) = true := by
              rw [← ih right]
              exact hrecursive
            exact (decidableBEq_eq_true_iff _ _).mpr
              (congrArg Nat.succ
                ((decidableBEq_eq_true_iff _ _).mp hbeq))
          · intro hsuccessor
            have hsame : left = right :=
              Nat.succ.inj
                ((decidableBEq_eq_true_iff _ _).mp hsuccessor)
            rw [ih right]
            exact (decidableBEq_eq_true_iff _ _).mpr hsame

theorem natEqM_ticks_le (left right : Nat) :
    (natEqM left right).ticks <= left + right + 1 := by
  induction left generalizing right with
  | zero => cases right <;> simp [natEqM]
  | succ left ih =>
      cases right with
      | zero => simp [natEqM]
      | succ right =>
          change (natEqM left right).ticks + 1 ≤
            (left + 1) + (right + 1) + 1
          have h := Nat.add_le_add_right (ih right) 1
          exact Nat.le_trans h (by
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
              Nat.le_succ (left + right + 2))

theorem natEqM_peak_le (left right : Nat) :
    (natEqM left right).peak <= left + right + 1 := by
  induction left generalizing right with
  | zero => cases right <;> simp [natEqM]
  | succ left ih =>
      cases right with
      | zero => simp [natEqM]
      | succ right =>
          change (natEqM left right).peak + 1 ≤
            (left + 1) + (right + 1) + 1
          have h := Nat.add_le_add_right (ih right) 1
          exact Nat.le_trans h (by
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
              Nat.le_succ (left + right + 2))

def bitsEqM : BitWord -> BitWord -> Meter Bool
  | [], [] => ⟨true, 1, 1⟩
  | [], _ :: _ => ⟨false, 1, 1⟩
  | _ :: _, [] => ⟨false, 1, 1⟩
  | x :: xs, y :: ys =>
      if x == y then
        let tail := bitsEqM xs ys
        ⟨tail.value, tail.ticks + 1, tail.peak + 1⟩
      else ⟨false, 1, 1⟩

@[simp] theorem bitsEqM_value (left right : BitWord) :
    (bitsEqM left right).value = (left == right) := by
  induction left generalizing right with
  | nil => cases right <;> rfl
  | cons x xs ih =>
      cases right with
      | nil => rfl
      | cons y ys =>
          cases hxy : (x == y) <;> simp [bitsEqM, hxy, ih]

theorem bitsEqM_ticks_le (left right : BitWord) :
    (bitsEqM left right).ticks <= left.length + 1 := by
  induction left generalizing right with
  | nil => cases right <;> simp [bitsEqM]
  | cons x xs ih =>
      cases right with
      | nil => simp [bitsEqM]
      | cons y ys =>
          cases hxy : (x == y) with
          | false => simp [bitsEqM, hxy]
          | true =>
              simp only [bitsEqM, hxy, if_pos, Meter.ticks,
                List.length_cons]
              change (bitsEqM xs ys).ticks + 1 ≤
                (xs.length + 1) + 1
              exact Nat.add_le_add_right (ih ys) 1

theorem bitsEqM_peak_le (left right : BitWord) :
    (bitsEqM left right).peak <= left.length + 1 := by
  induction left generalizing right with
  | nil => cases right <;> simp [bitsEqM]
  | cons x xs ih =>
      cases right with
      | nil => simp [bitsEqM]
      | cons y ys =>
          cases hxy : (x == y) with
          | false => simp [bitsEqM, hxy]
          | true =>
              simp only [bitsEqM, hxy, if_pos, Meter.peak,
                List.length_cons]
              change (bitsEqM xs ys).peak + 1 ≤
                (xs.length + 1) + 1
              exact Nat.add_le_add_right (ih ys) 1

def rowEqM (left right : Row) : Meter Bool :=
  let stateEq := natEqM left.state right.state
  let headEq := natEqM left.head right.head
  let tapeEq := bitsEqM left.tape right.tape
  ⟨stateEq.value && headEq.value && tapeEq.value,
    stateEq.ticks + headEq.ticks + tapeEq.ticks,
    max stateEq.peak (max headEq.peak tapeEq.peak)⟩

@[simp] theorem rowEqM_value (left right : Row) :
    (rowEqM left right).value = (left == right) := by
  cases left with
  | mk leftState leftHead leftTape =>
      cases right with
      | mk rightState rightHead rightTape =>
          simp only [rowEqM, natEqM_value, bitsEqM_value]
          apply Bool.eq_iff_iff.mpr
          simp only [Bool.and_eq_true, decidableBEq_eq_true_iff,
            bitWordBEq_eq_true_iff]
          constructor
          · rintro ⟨⟨hstate, hhead⟩, htape⟩
            cases hstate
            cases hhead
            cases htape
            rfl
          · intro hrow
            cases hrow
            exact ⟨⟨rfl, rfl⟩, rfl⟩

theorem rowEqM_ticks_le (left right : Row) :
    (rowEqM left right).ticks <=
      left.state + right.state + left.head + right.head +
        left.tape.length + 3 := by
  unfold rowEqM
  change (natEqM left.state right.state).ticks +
      (natEqM left.head right.head).ticks +
      (bitsEqM left.tape right.tape).ticks <= _
  have hstate := natEqM_ticks_le left.state right.state
  have hhead := natEqM_ticks_le left.head right.head
  have htape := bitsEqM_ticks_le left.tape right.tape
  have hsum := Nat.add_le_add (Nat.add_le_add hstate hhead) htape
  simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hsum

theorem rowEqM_peak_le (left right : Row) :
    (rowEqM left right).peak <=
      left.state + right.state + left.head + right.head +
        left.tape.length + 3 := by
  unfold rowEqM
  apply (Nat.max_le).2
  let stateBound := left.state + right.state + 1
  let headBound := left.head + right.head + 1
  let tapeBound := left.tape.length + 1
  have htotal : stateBound + headBound + tapeBound =
      left.state + right.state + left.head + right.head +
        left.tape.length + 3 := by
    simp [stateBound, headBound, tapeBound, Nat.add_assoc,
      Nat.add_comm, Nat.add_left_comm]
  refine ⟨Nat.le_trans (natEqM_peak_le _ _) (by
    change stateBound ≤ _
    rw [← htotal]
    simpa [Nat.add_assoc] using
      Nat.le_add_right stateBound (headBound + tapeBound)), ?_⟩
  apply (Nat.max_le).2
  constructor
  · exact Nat.le_trans (natEqM_peak_le _ _)
      (by
        change headBound ≤ _
        rw [← htotal]
        exact Nat.le_trans (Nat.le_add_left headBound stateBound)
          (Nat.le_add_right (stateBound + headBound) tapeBound))
  · exact Nat.le_trans (bitsEqM_peak_le _ _)
      (by
        change tapeBound ≤ _
        rw [← htotal]
        exact Nat.le_add_left tapeBound (stateBound + headBound))

/-! ## Counted source transition -/

def ruleAtM? (machine : Machine) (state : Nat) (symbol slot : Bool) :
    Meter (Option Rule) :=
  let found := getM? machine.states state
  match found.value with
  | none => ⟨none, found.ticks + 1, found.peak⟩
  | some stateRow =>
      ⟨occurrence (symbolCell stateRow symbol) slot,
        found.ticks + 2, found.peak⟩

@[simp] theorem ruleAtM?_value (machine : Machine) (state : Nat)
    (symbol slot : Bool) :
    (ruleAtM? machine state symbol slot).value =
      ruleAt? machine state symbol slot := by
  unfold ruleAtM? ruleAt?
  simp only [getM?_value]
  cases hget : machine.states[state]? <;> simp [hget]

theorem ruleAtM?_ticks_le (machine : Machine) (state : Nat)
    (symbol slot : Bool) :
    (ruleAtM? machine state symbol slot).ticks <=
      machine.states.length + 3 := by
  unfold ruleAtM?
  cases hget : (getM? machine.states state).value with
  | none =>
      simp only [hget]
      have h := Nat.add_le_add_right
        (getM?_ticks_le machine.states state) 1
      exact Nat.le_trans h (by
        exact Nat.le_succ (machine.states.length + 2))
  | some stateRow =>
      simp only [hget]
      simpa [Nat.add_assoc] using Nat.add_le_add_right
        (getM?_ticks_le machine.states state) 2

theorem ruleAtM?_peak_le (machine : Machine) (state : Nat)
    (symbol slot : Bool) :
    (ruleAtM? machine state symbol slot).peak <=
      machine.states.length + 1 := by
  unfold ruleAtM?
  cases hget : (getM? machine.states state).value <;>
    simp only [hget] <;>
    exact getM?_peak_le machine.states state

def movePaddedM (tape : BitWord) (head : Nat) (direction : Direction) :
    Meter (BitWord × Nat) :=
  match direction with
  | .left =>
      match head with
      | 0 => ⟨(false :: tape, 0), 2, 1⟩
      | previous + 1 => ⟨(tape, previous), 2, 1⟩
  | .stay => ⟨(tape, head), 1, 1⟩
  | .right =>
      let measuredLength := lengthM tape
      if head + 1 < measuredLength.value then
        ⟨(tape, head + 1), measuredLength.ticks + 2,
          measuredLength.peak⟩
      else
        let appended := appendM tape [false]
        ⟨(appended.value, head + 1),
          measuredLength.ticks + appended.ticks + 2,
          max measuredLength.peak appended.peak⟩

@[simp] theorem movePaddedM_value (tape : BitWord) (head : Nat)
    (direction : Direction) :
    (movePaddedM tape head direction).value =
      movePadded tape head direction := by
  cases direction with
  | left => cases head <;> rfl
  | stay => rfl
  | right =>
      unfold movePaddedM movePadded
      simp only [lengthM_value]
      split <;> simp [appendM_value]

theorem movePaddedM_ticks_le (tape : BitWord) (head : Nat)
    (direction : Direction) :
    (movePaddedM tape head direction).ticks <= 2 * tape.length + 4 := by
  cases direction with
  | left => cases head <;> simp [movePaddedM]
  | stay => simp [movePaddedM]
  | right =>
      unfold movePaddedM
      simp only [lengthM_value]
      split
      · simp only [lengthM_ticks]
        have hthree : 3 ≤ tape.length + 4 :=
          Nat.le_trans (Nat.le_add_left 3 tape.length)
            (Nat.le_succ (tape.length + 3))
        have h := Nat.add_le_add_left hthree tape.length
        simpa [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
          Nat.add_left_comm] using h
      · simp only [lengthM_ticks, appendM_ticks]
        simp [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
          Nat.add_left_comm]

theorem movePaddedM_peak_le (tape : BitWord) (head : Nat)
    (direction : Direction) :
    (movePaddedM tape head direction).peak <= tape.length + 1 := by
  cases direction with
  | left => cases head <;> simp [movePaddedM]
  | stay => simp [movePaddedM]
  | right =>
      unfold movePaddedM
      simp only [lengthM_value]
      split
      · simp only [lengthM_peak]
        exact Nat.le_refl _
      · simp only [lengthM_peak, appendM_peak]
        simp only [Nat.max_self]
        exact Nat.le_refl _

def applyRuleM? (row : Row) (rule : Rule) : Meter (Option Row) :=
  let written := replaceM? row.tape row.head rule.write
  match written.value with
  | none => ⟨none, written.ticks + 1, written.peak⟩
  | some tape =>
      let moved := movePaddedM tape row.head rule.move
      ⟨some { state := rule.nextState, head := moved.value.2,
              tape := moved.value.1 },
        written.ticks + moved.ticks + 2,
        max written.peak moved.peak⟩

@[simp] theorem applyRuleM?_value (row : Row) (rule : Rule) :
    (applyRuleM? row rule).value = applyRule? row rule := by
  unfold applyRuleM? applyRule?
  simp only [replaceM?_value]
  cases hwritten : replaceAt? row.tape row.head rule.write with
  | none => simp [hwritten]
  | some tape => simp [hwritten, movePaddedM_value]

theorem applyRuleM?_ticks_le (row : Row) (rule : Rule) :
    (applyRuleM? row rule).ticks <= 3 * row.tape.length + 7 := by
  unfold applyRuleM?
  cases hwritten : (replaceM? row.tape row.head rule.write).value
  · simp only [hwritten]
    have hreplace := replaceM?_ticks_le row.tape row.head rule.write
    have h := Nat.add_le_add_right hreplace 1
    exact Nat.le_trans h (by
      have heq : (row.tape.length + 2) +
          (2 * row.tape.length + 5) =
          3 * row.tape.length + 7 := by
        simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm]
      rw [← heq]
      exact Nat.le_add_right _ _)
  · rename_i tape
    simp only [hwritten]
    have hreplace := replaceM?_ticks_le row.tape row.head rule.write
    have hlen : tape.length = row.tape.length := by
      have hvalue := replaceM?_value row.tape row.head rule.write
      rw [hwritten] at hvalue
      exact replaceAt?_length hvalue.symm
    have hmove := movePaddedM_ticks_le tape row.head rule.move
    have hsum := Nat.add_le_add hreplace hmove
    have h := Nat.add_le_add_right hsum 2
    have heq : (row.tape.length + 1) +
        (2 * tape.length + 4) + 2 =
        3 * row.tape.length + 7 := by
      rw [hlen]
      simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm]
    rw [← heq]
    exact h

theorem applyRuleM?_peak_le (row : Row) (rule : Rule) :
    (applyRuleM? row rule).peak <= row.tape.length + 1 := by
  unfold applyRuleM?
  cases hwritten : (replaceM? row.tape row.head rule.write).value
  · simp only [hwritten]
    exact replaceM?_peak_le row.tape row.head rule.write
  · rename_i tape
    simp only [hwritten]
    apply (Nat.max_le).2
    refine ⟨replaceM?_peak_le row.tape row.head rule.write, ?_⟩
    have hvalue := replaceM?_value row.tape row.head rule.write
    rw [hwritten] at hvalue
    have hlen : tape.length = row.tape.length :=
      replaceAt?_length hvalue.symm
    simpa [hlen] using movePaddedM_peak_le tape row.head rule.move

def stepM? (machine : Machine) (row : Row) (slot : Bool) :
    Meter (Option Row) :=
  let scanned := getM? row.tape row.head
  match scanned.value with
  | none => ⟨none, scanned.ticks + 1, scanned.peak⟩
  | some symbol =>
      let selected := ruleAtM? machine row.state symbol slot
      match selected.value with
      | none => ⟨none, scanned.ticks + selected.ticks + 1,
          max scanned.peak selected.peak⟩
      | some rule =>
          let applied := applyRuleM? row rule
          ⟨applied.value, scanned.ticks + selected.ticks + applied.ticks + 1,
            max scanned.peak (max selected.peak applied.peak)⟩

@[simp] theorem stepM?_value (machine : Machine) (row : Row) (slot : Bool) :
    (stepM? machine row slot).value = step? machine row slot := by
  unfold stepM? step? scanned?
  simp only [getM?_value]
  cases hscan : row.tape[row.head]? with
  | none => simp [hscan]
  | some symbol =>
      simp only [hscan, Option.bind_some, ruleAtM?_value]
      cases hrule : ruleAt? machine row.state symbol slot with
      | none => simp [hrule]
      | some rule => simp [hrule, applyRuleM?_value]

theorem stepM?_ticks_le (machine : Machine) (row : Row) (slot : Bool) :
    (stepM? machine row slot).ticks <=
      machine.states.length + 4 * row.tape.length + 12 := by
  unfold stepM?
  cases hscan : (getM? row.tape row.head).value
  · simp only [hscan]
    have hs := getM?_ticks_le row.tape row.head
    have h := Nat.add_le_add_right hs 1
    exact Nat.le_trans h (by
      have heq : (row.tape.length + 2) +
          (machine.states.length + 3 * row.tape.length + 10) =
          machine.states.length + 4 * row.tape.length + 12 := by
        simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm]
      rw [← heq]
      exact Nat.le_add_right _ _)
  · rename_i symbol
    cases hrule : (ruleAtM? machine row.state symbol slot).value
    · simp only [hscan, hrule]
      have hs := getM?_ticks_le row.tape row.head
      have hr := ruleAtM?_ticks_le machine row.state symbol slot
      have h := Nat.add_le_add_right (Nat.add_le_add hs hr) 1
      exact Nat.le_trans h (by
        have heq : ((row.tape.length + 1) +
            (machine.states.length + 3) + 1) +
            (3 * row.tape.length + 7) =
            machine.states.length + 4 * row.tape.length + 12 := by
          simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
            Nat.add_comm, Nat.add_left_comm]
        rw [← heq]
        exact Nat.le_add_right _ _)
    · rename_i rule
      simp only [hscan, hrule]
      have hs := getM?_ticks_le row.tape row.head
      have hr := ruleAtM?_ticks_le machine row.state symbol slot
      have ha := applyRuleM?_ticks_le row rule
      have hsum := Nat.add_le_add (Nat.add_le_add hs hr) ha
      have h := Nat.add_le_add_right hsum 1
      have heq : (row.tape.length + 1) +
          (machine.states.length + 3) +
          (3 * row.tape.length + 7) + 1 =
          machine.states.length + 4 * row.tape.length + 12 := by
        simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm]
      rw [← heq]
      exact h

theorem stepM?_peak_le (machine : Machine) (row : Row) (slot : Bool) :
    (stepM? machine row slot).peak <=
      machine.states.length + row.tape.length + 2 := by
  let stateBound := machine.states.length + 1
  let tapeBound := row.tape.length + 1
  have htotal : stateBound + tapeBound =
      machine.states.length + row.tape.length + 2 := by
    simp [stateBound, tapeBound, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm]
  have hstatePad : stateBound ≤
      machine.states.length + row.tape.length + 2 := by
    rw [← htotal]
    exact Nat.le_add_right _ _
  have htapePad : tapeBound ≤
      machine.states.length + row.tape.length + 2 := by
    rw [← htotal]
    exact Nat.le_add_left _ _
  unfold stepM?
  cases hscan : (getM? row.tape row.head).value
  · simp only [hscan]
    exact Nat.le_trans (getM?_peak_le row.tape row.head) (by
      change tapeBound ≤ _
      exact htapePad)
  · rename_i symbol
    cases hrule : (ruleAtM? machine row.state symbol slot).value
    · simp only [hscan, hrule]
      apply (Nat.max_le).2
      constructor
      · exact Nat.le_trans (getM?_peak_le row.tape row.head) (by
          change tapeBound ≤ _
          exact htapePad)
      · exact Nat.le_trans
          (ruleAtM?_peak_le machine row.state symbol slot) (by
            change stateBound ≤ _
            exact hstatePad)
    · rename_i rule
      simp only [hscan, hrule]
      apply (Nat.max_le).2
      refine ⟨Nat.le_trans (getM?_peak_le row.tape row.head) (by
        change tapeBound ≤ _
        exact htapePad), ?_⟩
      apply (Nat.max_le).2
      constructor
      · exact Nat.le_trans
          (ruleAtM?_peak_le machine row.state symbol slot) (by
            change stateBound ≤ _
            exact hstatePad)
      · exact Nat.le_trans (applyRuleM?_peak_le row rule) (by
          change tapeBound ≤ _
          exact htapePad)

/-! ## Counted literal-tableau parser -/

def decodeNatM? : BitWord -> Meter (Option (Nat × BitWord))
  | [] => ⟨none, 1, 1⟩
  | false :: tail => ⟨some (0, tail), 1, 1⟩
  | true :: tail =>
      let parsed := decodeNatM? tail
      ⟨parsed.value.map (fun pair => (pair.1 + 1, pair.2)),
        parsed.ticks + 1, parsed.peak + 1⟩

@[simp] theorem decodeNatM?_value (payload : BitWord) :
    (decodeNatM? payload).value = decodeNat? payload := by
  induction payload with
  | nil => rfl
  | cons bit tail ih => cases bit <;> simp [decodeNatM?, decodeNat?, ih]

theorem decodeNatM?_ticks_le (payload : BitWord) :
    (decodeNatM? payload).ticks <= payload.length + 1 := by
  induction payload with
  | nil => simp [decodeNatM?]
  | cons bit tail ih =>
      cases bit with
      | false => simp [decodeNatM?]
      | true =>
          change (decodeNatM? tail).ticks + 1 ≤
            (tail.length + 1) + 1
          exact Nat.add_le_add_right ih 1

theorem decodeNatM?_peak_le (payload : BitWord) :
    (decodeNatM? payload).peak <= payload.length + 1 := by
  induction payload with
  | nil => simp [decodeNatM?]
  | cons bit tail ih =>
      cases bit with
      | false => simp [decodeNatM?]
      | true =>
          change (decodeNatM? tail).peak + 1 ≤
            (tail.length + 1) + 1
          exact Nat.add_le_add_right ih 1

theorem decodeNat?_tail_length_lt {payload tail : BitWord} {number : Nat}
    (hdecode : decodeNat? payload = some (number, tail)) :
    tail.length < payload.length := by
  induction payload generalizing number tail with
  | nil => simp [decodeNat?] at hdecode
  | cons bit payload ih =>
      cases bit with
      | false =>
          simp [decodeNat?] at hdecode
          rcases hdecode with ⟨rfl, rfl⟩
          exact Nat.lt_succ_self _
      | true =>
          unfold decodeNat? at hdecode
          cases htail : decodeNat? payload with
          | none => simp [htail] at hdecode
          | some pair =>
              rcases pair with ⟨next, suffix⟩
              simp [htail] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              have h := ih htail
              exact Nat.lt_trans h (Nat.lt_succ_self _)

def takeExactM? : Nat -> BitWord -> Meter (Option (BitWord × BitWord))
  | 0, bits => ⟨some ([], bits), 1, 1⟩
  | _ + 1, [] => ⟨none, 1, 1⟩
  | count + 1, bit :: bits =>
      let parsed := takeExactM? count bits
      ⟨parsed.value.map (fun pair => (bit :: pair.1, pair.2)),
        parsed.ticks + 1, parsed.peak + 1⟩

@[simp] theorem takeExactM?_value (count : Nat) (payload : BitWord) :
    (takeExactM? count payload).value = takeExact? count payload := by
  induction count generalizing payload with
  | zero => rfl
  | succ count ih =>
      cases payload with
      | nil => rfl
      | cons bit payload => simp [takeExactM?, takeExact?, ih]

theorem takeExactM?_ticks_le (count : Nat) (payload : BitWord) :
    (takeExactM? count payload).ticks <= payload.length + 1 := by
  induction count generalizing payload with
  | zero => simp [takeExactM?]
  | succ count ih =>
      cases payload with
      | nil => simp [takeExactM?]
      | cons bit payload =>
          change (takeExactM? count payload).ticks + 1 ≤
            (payload.length + 1) + 1
          exact Nat.add_le_add_right (ih payload) 1

theorem takeExactM?_peak_le (count : Nat) (payload : BitWord) :
    (takeExactM? count payload).peak <= payload.length + 1 := by
  induction count generalizing payload with
  | zero => simp [takeExactM?]
  | succ count ih =>
      cases payload with
      | nil => simp [takeExactM?]
      | cons bit payload =>
          change (takeExactM? count payload).peak + 1 ≤
            (payload.length + 1) + 1
          exact Nat.add_le_add_right (ih payload) 1

theorem takeExact?_tail_length_le {count : Nat} {payload front tail : BitWord}
    (hdecode : takeExact? count payload = some (front, tail)) :
    tail.length <= payload.length := by
  induction count generalizing payload front tail with
  | zero =>
      simp [takeExact?] at hdecode
      rcases hdecode with ⟨rfl, rfl⟩
      exact Nat.le_refl _
  | succ count ih =>
      cases payload with
      | nil => simp [takeExact?] at hdecode
      | cons bit payload =>
          unfold takeExact? at hdecode
          cases htail : takeExact? count payload with
          | none => simp [htail] at hdecode
          | some pair =>
              rcases pair with ⟨frontPart, suffix⟩
              simp [htail] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              have h := ih htail
              exact Nat.le_trans h (Nat.le_succ _)

def decodeBitsM? (payload : BitWord) :
    Meter (Option (BitWord × BitWord)) :=
  let lengthResult := decodeNatM? payload
  match lengthResult.value with
  | none => ⟨none, lengthResult.ticks + 1, lengthResult.peak⟩
  | some (count, tail) =>
      let taken := takeExactM? count tail
      ⟨taken.value, lengthResult.ticks + taken.ticks + 1,
        max lengthResult.peak taken.peak⟩

@[simp] theorem decodeBitsM?_value (payload : BitWord) :
    (decodeBitsM? payload).value = decodeBits? payload := by
  unfold decodeBitsM? decodeBits?
  simp only [decodeNatM?_value]
  cases hlength : decodeNat? payload with
  | none => simp [hlength]
  | some pair =>
      rcases pair with ⟨count, tail⟩
      simp [hlength, takeExactM?_value]

theorem decodeBitsM?_ticks_le (payload : BitWord) :
    (decodeBitsM? payload).ticks <= 2 * payload.length + 3 := by
  unfold decodeBitsM?
  cases hlength : (decodeNatM? payload).value with
  | none =>
      simp only [hlength]
      have h := decodeNatM?_ticks_le payload
      have hstep := Nat.add_le_add_right h 1
      exact Nat.le_trans hstep (by
        have heq : (payload.length + 2) + (payload.length + 1) =
            2 * payload.length + 3 := by
          simp [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
            Nat.add_left_comm]
        rw [← heq]
        exact Nat.le_add_right _ _)
  | some pair =>
      rcases pair with ⟨count, tail⟩
      simp only [hlength]
      have hn := decodeNatM?_ticks_le payload
      have ht := takeExactM?_ticks_le count tail
      have hsemantic : decodeNat? payload = some (count, tail) := by
        rw [← decodeNatM?_value]
        exact hlength
      have htail := decodeNat?_tail_length_lt hsemantic
      have htailLe : tail.length + 1 ≤ payload.length := htail
      have ht' := Nat.le_trans ht htailLe
      have hsum := Nat.add_le_add hn ht'
      have hstep := Nat.add_le_add_right hsum 1
      have heq : (payload.length + 1) + payload.length + 1 =
          2 * payload.length + 2 := by
        simp [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
          Nat.add_left_comm]
      rw [heq] at hstep
      exact Nat.le_trans hstep (Nat.le_succ _)

theorem decodeBitsM?_peak_le (payload : BitWord) :
    (decodeBitsM? payload).peak <= payload.length + 1 := by
  unfold decodeBitsM?
  cases hlength : (decodeNatM? payload).value with
  | none =>
      simp only [hlength]
      exact decodeNatM?_peak_le payload
  | some pair =>
      rcases pair with ⟨count, tail⟩
      simp only [hlength]
      apply (Nat.max_le).2
      refine ⟨decodeNatM?_peak_le payload, ?_⟩
      have hsemantic : decodeNat? payload = some (count, tail) := by
        rw [← decodeNatM?_value]
        exact hlength
      have htail := decodeNat?_tail_length_lt hsemantic
      have htailLe : tail.length + 1 ≤ payload.length := htail
      exact Nat.le_trans (takeExactM?_peak_le count tail)
        (Nat.le_trans htailLe (Nat.le_succ _))

def decodeRowM? (payload : BitWord) : Meter (Option (Row × BitWord)) :=
  let stateResult := decodeNatM? payload
  match stateResult.value with
  | none => ⟨none, stateResult.ticks + 1, stateResult.peak⟩
  | some (state, rest) =>
      let headResult := decodeNatM? rest
      match headResult.value with
      | none => ⟨none, stateResult.ticks + headResult.ticks + 1,
          max stateResult.peak headResult.peak⟩
      | some (head, rest) =>
          let tapeResult := decodeBitsM? rest
          ⟨tapeResult.value.map (fun pair =>
              (⟨state, head, pair.1⟩, pair.2)),
            stateResult.ticks + headResult.ticks + tapeResult.ticks + 1,
            max stateResult.peak (max headResult.peak tapeResult.peak)⟩

@[simp] theorem decodeRowM?_value (payload : BitWord) :
    (decodeRowM? payload).value = decodeRow? payload := by
  unfold decodeRowM? decodeRow?
  dsimp only [Meter.value]
  rw [decodeNatM?_value]
  cases decodeNat? payload with
  | none => rfl
  | some pair =>
      rcases pair with ⟨state, rest⟩
      dsimp only [Meter.value]
      rw [decodeNatM?_value]
      cases decodeNat? rest with
      | none => rfl
      | some pair =>
          rcases pair with ⟨head, tail⟩
          dsimp only [Meter.value]
          rw [decodeBitsM?_value]

def decodeRowsNM? : Nat -> BitWord ->
    Meter (Option (List Row × BitWord))
  | 0, payload => ⟨some ([], payload), 1, 1⟩
  | count + 1, payload =>
      let rowResult := decodeRowM? payload
      match rowResult.value with
      | none => ⟨none, rowResult.ticks + 1, rowResult.peak⟩
      | some (row, rest) =>
          let rowsResult := decodeRowsNM? count rest
          ⟨rowsResult.value.map (fun pair => (row :: pair.1, pair.2)),
            rowResult.ticks + rowsResult.ticks + 1,
            max rowResult.peak (rowsResult.peak + 1)⟩

@[simp] theorem decodeRowsNM?_value (count : Nat) (payload : BitWord) :
    (decodeRowsNM? count payload).value = decodeRowsN? count payload := by
  induction count generalizing payload with
  | zero => rfl
  | succ count ih =>
      unfold decodeRowsNM? decodeRowsN?
      dsimp only [Meter.value]
      rw [decodeRowM?_value]
      cases decodeRow? payload with
      | none => rfl
      | some pair =>
          rcases pair with ⟨row, rest⟩
          dsimp only [Meter.value]
          rw [ih rest]

def decodeTableauM? (payload : BitWord) : Meter (Option (List Row)) :=
  let countResult := decodeNatM? payload
  match countResult.value with
  | none => ⟨none, countResult.ticks + 1, countResult.peak⟩
  | some (count, rest) =>
      let rowsResult := decodeRowsNM? count rest
      match rowsResult.value with
      | none => ⟨none, countResult.ticks + rowsResult.ticks + 1,
          max countResult.peak rowsResult.peak⟩
      | some (rows, []) =>
          ⟨some rows, countResult.ticks + rowsResult.ticks + 1,
            max countResult.peak rowsResult.peak⟩
      | some (_, _ :: _) =>
          ⟨none, countResult.ticks + rowsResult.ticks + 1,
            max countResult.peak rowsResult.peak⟩

@[simp] theorem decodeTableauM?_value (payload : BitWord) :
    (decodeTableauM? payload).value = decodeTableau? payload := by
  unfold decodeTableauM? decodeTableau?
  dsimp only [Meter.value]
  rw [decodeNatM?_value]
  cases decodeNat? payload with
  | none => rfl
  | some pair =>
      rcases pair with ⟨count, rest⟩
      dsimp only [Meter.value]
      rw [decodeRowsNM?_value]
      cases decodeRowsN? count rest with
      | none => rfl
      | some pair =>
          rcases pair with ⟨rows, suffix⟩
          cases suffix <;> rfl

/-! ## Counted canonical encoder and initial-row construction -/

def encodeNatM : Nat -> Meter BitWord
  | 0 => ⟨[false], 1, 1⟩
  | number + 1 =>
      let tail := encodeNatM number
      ⟨true :: tail.value, tail.ticks + 1, tail.peak + 1⟩

@[simp] theorem encodeNatM_value (number : Nat) :
    (encodeNatM number).value = encodeNat number := by
  induction number with
  | zero => rfl
  | succ number ih => simp [encodeNatM, encodeNat, ih]

theorem encodeNatM_ticks (number : Nat) :
    (encodeNatM number).ticks = number + 1 := by
  induction number with
  | zero => rfl
  | succ number ih => simp [encodeNatM, ih, Nat.add_assoc, Nat.add_comm]

theorem encodeNatM_peak (number : Nat) :
    (encodeNatM number).peak = number + 1 := by
  induction number with
  | zero => rfl
  | succ number ih => simp [encodeNatM, ih, Nat.add_assoc, Nat.add_comm]

def encodeBitsM (bits : BitWord) : Meter BitWord :=
  let measuredLength := lengthM bits
  let prefixCode := encodeNatM measuredLength.value
  let joined := appendM prefixCode.value bits
  ⟨joined.value,
    measuredLength.ticks + prefixCode.ticks + joined.ticks + 1,
    max measuredLength.peak (max prefixCode.peak joined.peak)⟩

@[simp] theorem encodeBitsM_value (bits : BitWord) :
    (encodeBitsM bits).value = encodeBits bits := by
  simp [encodeBitsM, encodeBits]

theorem encodeBitsM_ticks_le (bits : BitWord) :
    (encodeBitsM bits).ticks <= 4 * bits.length + 5 := by
  unfold encodeBitsM
  simp only [lengthM_value, lengthM_ticks, encodeNatM_ticks,
    encodeNatM_value, appendM_ticks]
  have hlen : (encodeNat bits.length).length = bits.length + 1 := by
    induction bits.length with
    | zero => rfl
    | succ number ih => simp [encodeNat, ih]
  rw [hlen]
  have heq : (bits.length + 1) + (bits.length + 1) +
      (bits.length + 1 + 1) + 1 = 3 * bits.length + 5 := by
    simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
      Nat.add_comm, Nat.add_left_comm]
  rw [heq]
  have hpad := Nat.le_add_right (3 * bits.length + 5)
    bits.length
  have htarget : (3 * bits.length + 5) + bits.length =
      4 * bits.length + 5 := by
    simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
      Nat.add_comm, Nat.add_left_comm]
  rwa [htarget] at hpad

theorem encodeBitsM_peak_le (bits : BitWord) :
    (encodeBitsM bits).peak <= bits.length + 2 := by
  unfold encodeBitsM
  simp only [lengthM_value, lengthM_peak, encodeNatM_peak,
    encodeNatM_value, appendM_peak]
  have hlen : (encodeNat bits.length).length = bits.length + 1 := by
    induction bits.length with
    | zero => rfl
    | succ number ih => simp [encodeNat, ih]
  rw [hlen]
  simp

def encodeRowM (row : Row) : Meter BitWord :=
  let stateCode := encodeNatM row.state
  let headCode := encodeNatM row.head
  let tapeCode := encodeBitsM row.tape
  let headTape := appendM headCode.value tapeCode.value
  let all := appendM stateCode.value headTape.value
  ⟨all.value,
    stateCode.ticks + headCode.ticks + tapeCode.ticks +
      headTape.ticks + all.ticks + 1,
    max stateCode.peak (max headCode.peak
      (max tapeCode.peak (max headTape.peak all.peak)))⟩

@[simp] theorem encodeRowM_value (row : Row) :
    (encodeRowM row).value = encodeRow row := by
  simp [encodeRowM, encodeRow]

theorem encodeNat_length (number : Nat) :
    (encodeNat number).length = number + 1 := by
  induction number with
  | zero => rfl
  | succ number ih => simp [encodeNat, ih]

theorem encodeBits_length (bits : BitWord) :
    (encodeBits bits).length = 2 * bits.length + 1 := by
  simp [encodeBits, encodeNat_length]
  simp [Nat.two_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem encodeRow_length (row : Row) :
    (encodeRow row).length =
      row.state + row.head + 2 * row.tape.length + 3 := by
  simp [encodeRow, encodeNat_length, encodeBits_length]
  simp [Nat.two_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def encodeRowsM : List Row -> Meter BitWord
  | [] => ⟨[], 1, 1⟩
  | row :: rows =>
      let rowCode := encodeRowM row
      let rowsCode := encodeRowsM rows
      let joined := appendM rowCode.value rowsCode.value
      ⟨joined.value, rowCode.ticks + rowsCode.ticks + joined.ticks + 1,
        max rowCode.peak (max rowsCode.peak joined.peak)⟩

@[simp] theorem encodeRowsM_value (rows : List Row) :
    (encodeRowsM rows).value = encodeRowData rows := by
  induction rows with
  | nil => rfl
  | cons row rows ih => simp [encodeRowsM, encodeRowData, ih]

def encodeTableauM (rows : List Row) : Meter BitWord :=
  let countCode := encodeNatM rows.length
  let rowsCode := encodeRowsM rows
  let joined := appendM countCode.value rowsCode.value
  ⟨joined.value, countCode.ticks + rowsCode.ticks + joined.ticks + 1,
    max countCode.peak (max rowsCode.peak joined.peak)⟩

@[simp] theorem encodeTableauM_value (rows : List Row) :
    (encodeTableauM rows).value = encodeTableau rows := by
  simp [encodeTableauM, encodeTableau]

def initialRowM (source : Instance) : Meter Row :=
  let tail := appendM source.input [false]
  ⟨{ state := source.initialState, head := 1,
      tape := false :: tail.value },
    tail.ticks + 2, tail.peak + 1⟩

@[simp] theorem initialRowM_value (source : Instance) :
    (initialRowM source).value = initialRow source := by
  simp [initialRowM, initialRow]

theorem initialRowM_ticks (source : Instance) :
    (initialRowM source).ticks = source.input.length + 3 := by
  simp [initialRowM, appendM_ticks]

theorem initialRowM_peak (source : Instance) :
    (initialRowM source).peak = source.input.length + 2 := by
  simp [initialRowM, appendM_peak]

/-! ## Canonical-consumption lemmas for parser cost transfer -/

theorem decodeNat?_reconstruct {payload tail : BitWord} {number : Nat}
    (hdecode : decodeNat? payload = some (number, tail)) :
    payload = encodeNat number ++ tail := by
  induction payload generalizing number tail with
  | nil => simp [decodeNat?] at hdecode
  | cons bit payload ih =>
      cases bit with
      | false =>
          simp [decodeNat?] at hdecode
          rcases hdecode with ⟨rfl, rfl⟩
          rfl
      | true =>
          unfold decodeNat? at hdecode
          cases htail : decodeNat? payload with
          | none => simp [htail] at hdecode
          | some pair =>
              rcases pair with ⟨previous, suffix⟩
              simp [htail] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              simp only [encodeNat, List.cons_append, List.cons.injEq, true_and]
              exact ih htail

theorem takeExact?_reconstruct {count : Nat} {payload front tail : BitWord}
    (hdecode : takeExact? count payload = some (front, tail)) :
    payload = front ++ tail := by
  induction count generalizing payload front tail with
  | zero =>
      simp [takeExact?] at hdecode
      rcases hdecode with ⟨rfl, rfl⟩
      rfl
  | succ count ih =>
      cases payload with
      | nil => simp [takeExact?] at hdecode
      | cons bit payload =>
          unfold takeExact? at hdecode
          cases htail : takeExact? count payload with
          | none => simp [htail] at hdecode
          | some pair =>
              rcases pair with ⟨frontPart, suffix⟩
              simp [htail] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              simp only [List.cons_append, List.cons.injEq, true_and]
              exact ih htail

theorem takeExact?_front_length {count : Nat} {payload front tail : BitWord}
    (hdecode : takeExact? count payload = some (front, tail)) :
    front.length = count := by
  induction count generalizing payload front tail with
  | zero =>
      simp [takeExact?] at hdecode
      exact hdecode.1 ▸ rfl
  | succ count ih =>
      cases payload with
      | nil => simp [takeExact?] at hdecode
      | cons bit payload =>
          unfold takeExact? at hdecode
          cases htail : takeExact? count payload with
          | none => simp [htail] at hdecode
          | some pair =>
              rcases pair with ⟨frontPart, suffix⟩
              simp [htail] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              simp [ih htail]

theorem decodeBits?_reconstruct {payload field tail : BitWord}
    (hdecode : decodeBits? payload = some (field, tail)) :
    payload = encodeBits field ++ tail := by
  unfold decodeBits? at hdecode
  cases hlength : decodeNat? payload with
  | none => simp [hlength] at hdecode
  | some pair =>
      rcases pair with ⟨count, rest⟩
      simp only [hlength, Option.bind_some] at hdecode
      cases htaken : takeExact? count rest with
      | none => simp [htaken] at hdecode
      | some pair =>
          rcases pair with ⟨parsed, suffix⟩
          simp [htaken] at hdecode
          rcases hdecode with ⟨rfl, rfl⟩
          have hpayload := decodeNat?_reconstruct hlength
          have hrest := takeExact?_reconstruct htaken
          have hlengthField : count = parsed.length := by
            exact (takeExact?_front_length htaken).symm
          subst count
          simp [encodeBits, hpayload, hrest, List.append_assoc]

theorem decodeRow?_reconstruct {payload tail : BitWord} {row : Row}
    (hdecode : decodeRow? payload = some (row, tail)) :
    payload = encodeRow row ++ tail := by
  cases hstate : decodeNat? payload with
  | none => simp [decodeRow?, hstate] at hdecode
  | some statePair =>
      rcases statePair with ⟨state, restState⟩
      cases hhead : decodeNat? restState with
      | none => simp [decodeRow?, hstate, hhead] at hdecode
      | some headPair =>
          rcases headPair with ⟨head, restHead⟩
          cases htape : decodeBits? restHead with
          | none => simp [decodeRow?, hstate, hhead, htape] at hdecode
          | some tapePair =>
              rcases tapePair with ⟨tape, suffix⟩
              simp [decodeRow?, hstate, hhead, htape] at hdecode
              rcases hdecode with ⟨hrow, htail⟩
              cases hrow
              cases htail
              rw [decodeNat?_reconstruct hstate,
                decodeNat?_reconstruct hhead,
                decodeBits?_reconstruct htape]
              simp [encodeRow, List.append_assoc]

theorem decodeRowsN?_reconstruct {count : Nat} {payload tail : BitWord}
    {rows : List Row}
    (hdecode : decodeRowsN? count payload = some (rows, tail)) :
    payload = encodeRowData rows ++ tail := by
  induction count generalizing payload rows tail with
  | zero =>
      simp [decodeRowsN?] at hdecode
      rcases hdecode with ⟨rfl, rfl⟩
      rfl
  | succ count ih =>
      unfold decodeRowsN? at hdecode
      cases hrow : decodeRow? payload with
      | none => simp [hrow] at hdecode
      | some rowPair =>
          rcases rowPair with ⟨row, rest⟩
          simp only [hrow, Option.bind_some] at hdecode
          cases hrows : decodeRowsN? count rest with
          | none => simp [hrows] at hdecode
          | some rowsPair =>
              rcases rowsPair with ⟨parsedRows, suffix⟩
              simp [hrows] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              rw [decodeRow?_reconstruct hrow, ih hrows]
              simp [encodeRowData, List.append_assoc]

theorem decodeRowsN?_rows_length {count : Nat} {payload tail : BitWord}
    {rows : List Row}
    (hdecode : decodeRowsN? count payload = some (rows, tail)) :
    rows.length = count := by
  induction count generalizing payload rows tail with
  | zero =>
      simp [decodeRowsN?] at hdecode
      exact hdecode.1 ▸ rfl
  | succ count ih =>
      unfold decodeRowsN? at hdecode
      cases hrow : decodeRow? payload with
      | none => simp [hrow] at hdecode
      | some pair =>
          rcases pair with ⟨row, rest⟩
          simp only [hrow, Option.bind_some] at hdecode
          cases hrows : decodeRowsN? count rest with
          | none => simp [hrows] at hdecode
          | some pair =>
              rcases pair with ⟨tailRows, suffix⟩
              simp [hrows] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              simp [ih hrows]

theorem decodeTableau?_reconstruct {payload : BitWord} {rows : List Row}
    (hdecode : decodeTableau? payload = some rows) :
    payload = encodeTableau rows := by
  unfold decodeTableau? at hdecode
  cases hcount : decodeNat? payload with
  | none => simp [hcount] at hdecode
  | some countPair =>
      rcases countPair with ⟨count, rest⟩
      simp only [hcount, Option.bind_some] at hdecode
      cases hrows : decodeRowsN? count rest with
      | none => simp [hrows] at hdecode
      | some rowsPair =>
          rcases rowsPair with ⟨parsedRows, suffix⟩
          cases suffix with
          | cons bit suffix => simp [hrows] at hdecode
          | nil =>
              simp [hrows] at hdecode
              subst parsedRows
              have hcountRows : count = rows.length :=
                (decodeRowsN?_rows_length hrows).symm
              rw [decodeNat?_reconstruct hcount,
                decodeRowsN?_reconstruct hrows, hcountRows]
              simp [encodeTableau]

/-! ## The fully counted local verifier -/

def checkTraceM : Machine -> Row -> BitWord -> List Row -> Meter Bool
  | _, _, [], [] => ⟨true, 1, 1⟩
  | _, _, [], _ :: _ => ⟨false, 1, 1⟩
  | _, _, _ :: _, [] => ⟨false, 1, 1⟩
  | machine, row, slot :: history, next :: rows =>
      let stepped := stepM? machine row slot
      match stepped.value with
      | none => ⟨false, stepped.ticks + 1, stepped.peak⟩
      | some actual =>
          let equal := rowEqM actual next
          if equal.value then
            let tail := checkTraceM machine next history rows
            ⟨tail.value, stepped.ticks + equal.ticks + tail.ticks + 1,
              max stepped.peak (max equal.peak (tail.peak + 1))⟩
          else
            ⟨false, stepped.ticks + equal.ticks + 1,
              max stepped.peak equal.peak⟩

@[simp] theorem checkTraceM_value (machine : Machine) (row : Row)
    (history : BitWord) (rows : List Row) :
    (checkTraceM machine row history rows).value =
      checkTrace machine row history rows := by
  induction history generalizing row rows with
  | nil => cases rows <;> rfl
  | cons slot history ih =>
      cases rows with
      | nil => rfl
      | cons next rows =>
          unfold checkTraceM checkTrace
          dsimp only [Meter.value]
          rw [stepM?_value]
          cases step? machine row slot with
          | none => rfl
          | some actual =>
              dsimp only [Meter.value]
              rw [rowEqM_value]
              have hoption :
                  ((some actual : Option Row) == some next) =
                    (actual == next) := rfl
              rw [hoption]
              cases actual == next with
              | false =>
                  rw [if_neg]
                  · rfl
                  · intro h
                    cases h
              | true =>
                  rw [if_pos rfl]
                  rw [ih next rows]
                  rfl

def verifyRowsM (source : Instance) (history : BitWord) :
    List Row -> Meter Bool
  | [] => ⟨false, 1, 1⟩
  | row :: rows =>
      let expected := initialRowM source
      let equal := rowEqM row expected.value
      if equal.value then
        let trace := checkTraceM source.machine row history rows
        ⟨trace.value, expected.ticks + equal.ticks + trace.ticks + 1,
          max expected.peak (max equal.peak trace.peak)⟩
      else
        ⟨false, expected.ticks + equal.ticks + 1,
          max expected.peak equal.peak⟩

@[simp] theorem verifyRowsM_value (source : Instance) (history : BitWord)
    (rows : List Row) :
    (verifyRowsM source history rows).value =
      verifyRows source history rows := by
  cases rows with
  | nil => rfl
  | cons row rows =>
      unfold verifyRowsM verifyRows
      dsimp only [Meter.value]
      rw [initialRowM_value, rowEqM_value]
      cases row == initialRow source with
      | false =>
          rw [if_neg]
          · rfl
          · intro h
            cases h
      | true =>
          rw [if_pos rfl]
          rw [checkTraceM_value]
          rfl

def runLocalVerifier (source : Instance) (history payload : BitWord) :
    Meter Bool :=
  let parsed := decodeTableauM? payload
  match parsed.value with
  | none => ⟨false, parsed.ticks + 1, parsed.peak⟩
  | some rows =>
      let encoded := encodeTableauM rows
      let equal := bitsEqM payload encoded.value
      if equal.value then
        let checked := verifyRowsM source history rows
        ⟨checked.value,
          parsed.ticks + encoded.ticks + equal.ticks + checked.ticks + 1,
          max parsed.peak (max encoded.peak (max equal.peak checked.peak))⟩
      else
        ⟨false, parsed.ticks + encoded.ticks + equal.ticks + 1,
          max parsed.peak (max encoded.peak equal.peak)⟩

@[simp] theorem runLocalVerifier_value (source : Instance)
    (history payload : BitWord) :
    (runLocalVerifier source history payload).value =
      verify source history payload := by
  unfold runLocalVerifier verify
  dsimp only [Meter.value]
  rw [decodeTableauM?_value]
  cases decodeTableau? payload with
  | none => rfl
  | some rows =>
      dsimp only [Meter.value]
      rw [encodeTableauM_value, bitsEqM_value]
      cases payload == encodeTableau rows with
      | false =>
          rw [if_neg]
          · rfl
          · intro h
            cases h
      | true =>
          rw [if_pos rfl]
          rw [verifyRowsM_value]
          rfl

end PureSFormal.Research.ProtectedTrieTableauExactCost
