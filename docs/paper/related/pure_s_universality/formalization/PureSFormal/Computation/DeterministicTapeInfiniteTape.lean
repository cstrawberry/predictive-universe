import PureSFormal.Research.ProtectedTrieDeterministicCompiler

/-!
# Finite source windows represented on a two-sided infinite Boolean tape

The conventional configuration has an integer head and a total `Int → Bool`
tape, with false as the blank symbol. Its transition updates just the scanned
cell and moves by -1, 0, or 1. The finite source's origin is external proof
data; prepending a blank decreases it by one. Representation is pointwise,
so the bridge needs no function-extensionality or choice axiom.
-/

namespace PureSFormal.Computation.DeterministicTapeInfiniteTape

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open PureSFormal.Research.ProtectedTrieMachine

/-- Read a finite word on integer coordinates, blank outside its interval. -/
def tapeAt : List Bool → Int → Bool
  | [], _ => false
  | symbol :: rest, offset => if offset = 0 then symbol else tapeAt rest (offset - 1)

theorem tapeAt_negative (word : List Bool) (offset : Int) (negative : offset < 0) :
    tapeAt word offset = false := by
  induction word generalizing offset with
  | nil => rfl
  | cons symbol rest ih =>
      rw [tapeAt, if_neg (Int.ne_of_lt negative)]
      exact ih (offset - 1) (Int.lt_trans (Int.sub_lt_self offset (by decide : (0 : Int) < 1)) negative)

theorem tapeAt_after (word : List Bool) (offset : Int) (after : (word.length : Int) ≤ offset) :
    tapeAt word offset = false := by
  induction word generalizing offset with
  | nil => rfl
  | cons symbol rest ih =>
      have positive : (0 : Int) < offset := Int.lt_of_lt_of_le (Int.ofNat_succ_pos rest.length) after
      rw [tapeAt, if_neg (Int.ne_of_gt positive)]
      exact ih (offset - 1) (Int.le_sub_right_of_add_le after)

theorem tapeAt_blank_cons (word : List Bool) (offset : Int) :
    tapeAt (false :: word) (offset + 1) = tapeAt word offset := by
  rw [tapeAt]
  by_cases atBlank : offset + 1 = 0
  · have negative : offset < 0 := by
      change offset + 1 ≤ 0
      rw [atBlank]
      exact Int.le_refl 0
    rw [if_pos atBlank, tapeAt_negative word offset negative]
  · rw [if_neg atBlank, Int.add_sub_cancel]

theorem tapeAt_blank_append (word : List Bool) (offset : Int) :
    tapeAt (word ++ [false]) offset = tapeAt word offset := by
  induction word generalizing offset with
  | nil => simp only [List.nil_append, tapeAt, ite_self]
  | cons symbol rest ih =>
      simp only [List.cons_append, tapeAt]
      split
      · rfl
      · exact ih (offset - 1)

theorem scanned_exists (word : List Bool) (head : Nat) (valid : head < word.length) :
    ∃ symbol, word[head]? = some symbol ∧ tapeAt word (head : Int) = symbol := by
  induction word generalizing head with
  | nil => cases Nat.not_lt_zero head valid
  | cons symbol rest ih =>
      cases head with
      | zero => exact ⟨symbol, rfl, by simp only [Int.natCast_zero, tapeAt, if_pos rfl, if_true]⟩
      | succ head =>
          obtain ⟨found, read, agrees⟩ := ih head (Nat.lt_of_succ_lt_succ valid)
          refine ⟨found, read, ?_⟩
          rw [tapeAt, if_neg (Int.ne_of_gt (Int.ofNat_succ_pos head)), Int.natCast_succ, Int.add_sub_cancel]
          exact agrees

theorem replace_exists (word : List Bool) (head : Nat) (symbol : Bool) (valid : head < word.length) :
    ∃ written, replaceAt? word head symbol = some written := by
  induction word generalizing head with
  | nil => cases Nat.not_lt_zero head valid
  | cons first rest ih =>
      cases head with
      | zero => exact ⟨symbol :: rest, rfl⟩
      | succ head =>
          obtain ⟨written, replaced⟩ := ih head (Nat.lt_of_succ_lt_succ valid)
          exact ⟨first :: written, by rw [replaceAt?, replaced]; rfl⟩

theorem tapeAt_replace {word written : List Bool} {head : Nat} {symbol : Bool}
    (replaced : replaceAt? word head symbol = some written) (offset : Int) :
    tapeAt written offset = if offset = (head : Int) then symbol else tapeAt word offset := by
  induction word generalizing written head offset with
  | nil => cases replaced
  | cons first rest ih =>
      cases head with
      | zero =>
          change some (symbol :: rest) = some written at replaced
          cases replaced
          by_cases zero : offset = 0
          · simp only [tapeAt, zero, if_pos, Int.natCast_zero, if_true, if_false]
          · simp only [tapeAt, zero, if_neg, Int.natCast_zero, if_true, if_false]
      | succ head =>
          cases tailEq : replaceAt? rest head symbol with
          | none => rw [replaceAt?, tailEq] at replaced; cases replaced
          | some tail =>
              rw [replaceAt?, tailEq] at replaced
              cases replaced
              by_cases zero : offset = 0
              · subst offset
                simp only [tapeAt, if_pos rfl, if_neg (Int.ne_of_lt (Int.ofNat_succ_pos head)), if_true]
              · rw [tapeAt, if_neg zero, ih tailEq, tapeAt, if_neg zero]
                by_cases hit : offset = ((head + 1 : Nat) : Int)
                · rw [if_pos hit, if_pos (show offset - 1 = (head : Int) by rw [hit, Int.natCast_succ, Int.add_sub_cancel])]
                · have miss : offset - 1 ≠ (head : Int) := by
                    intro equal
                    apply hit
                    exact (Int.sub_add_cancel offset 1).symm.trans (congrArg (fun value : Int => value + 1) equal)
                  rw [if_neg hit, if_neg miss]

def window (origin : Int) (word : List Bool) (position : Int) : Bool := tapeAt word (position - origin)

def displacement : Direction → Int
  | .left => -1
  | .stay => 0
  | .right => 1

def movedOrigin (origin : Int) (head : Nat) : Direction → Int
  | .left => if head = 0 then origin - 1 else origin
  | .stay | .right => origin

theorem move_valid (word : List Bool) (head : Nat) (valid : head < word.length) (move : Direction) :
    (movePadded word head move).2 < (movePadded word head move).1.length := by
  cases move with
  | left =>
      cases head with
      | zero => exact Nat.zero_lt_succ _
      | succ head => exact Nat.lt_trans (Nat.lt_succ_self head) valid
  | stay => exact valid
  | right =>
      simp only [movePadded]
      split
      · assumption
      · simp only [List.length_append, List.length_cons, List.length_nil]
        exact Nat.succ_lt_succ valid

theorem move_head (origin : Int) (word : List Bool) (head : Nat) (move : Direction) :
    movedOrigin origin head move + ((movePadded word head move).2 : Int) =
      origin + (head : Int) + displacement move := by
  cases move with
  | left =>
      cases head with
      | zero => simp only [movedOrigin, if_pos rfl, if_true, movePadded, displacement, Int.natCast_zero, Int.add_zero]; rfl
      | succ head =>
          simp only [movedOrigin, Nat.succ_ne_zero, if_false, movePadded, displacement, Int.natCast_succ]
          change origin + (head : Int) = origin + ((head : Int) + 1) - 1
          rw [Int.add_sub_assoc, Int.add_sub_cancel]
  | stay => simp only [movedOrigin, movePadded, displacement, Int.add_zero]
  | right =>
      simp only [movePadded, movedOrigin, displacement]
      split <;> simp only [Int.natCast_succ, Int.add_assoc]

theorem move_tape (origin : Int) (word : List Bool) (head : Nat) (move : Direction) (position : Int) :
    window (movedOrigin origin head move) (movePadded word head move).1 position = window origin word position := by
  cases move with
  | left =>
      cases head with
      | zero =>
          simp only [movedOrigin, if_pos rfl, if_true, movePadded, window]
          rw [show position - (origin - 1) = (position - origin) + 1 by
            simp only [Int.sub_eq_add_neg, Int.neg_add, Int.neg_neg, Int.add_assoc], tapeAt_blank_cons]
      | succ head => simp only [movedOrigin, Nat.succ_ne_zero, if_false, movePadded]
  | stay => rfl
  | right =>
      simp only [movedOrigin, movePadded]
      split
      · rfl
      · exact tapeAt_blank_append word (position - origin)

namespace Infinite

/-- Conventional two-sided infinite tape configuration. -/
structure Config where
  state : Nat
  head : Int
  tape : Int → Bool

/-- Structural finite-table lookup, independent of finite-window stepping. -/
def lookup : List DeterministicTape.StateRow → Nat → Bool → Option Rule
  | [], _, _ => none
  | entry :: _, 0, symbol => if symbol then entry.onTrue else entry.onFalse
  | _ :: rest, state + 1, symbol => lookup rest state symbol

def write (tape : Int → Bool) (head : Int) (symbol : Bool) : Int → Bool :=
  fun position => if position = head then symbol else tape position

def apply (config : Config) (rule : Rule) : Config :=
  ⟨rule.nextState, config.head + displacement rule.move, write config.tape config.head rule.write⟩

def step? (machine : DeterministicTape.Machine) (config : Config) : Option Config :=
  (lookup machine.states config.state (config.tape config.head)).map (apply config)

def runFor? (machine : DeterministicTape.Machine) : Config → Nat → Option Config
  | config, 0 => some config
  | config, fuel + 1 => (step? machine config).bind (fun next => runFor? machine next fuel)

def initial (source : DeterministicTape.Instance) : Config :=
  ⟨source.initialState, 0, tapeAt source.input⟩

def Halts (source : DeterministicTape.Instance) : Prop :=
  ∃ fuel finalConfig, runFor? source.machine (initial source) fuel = some finalConfig ∧ step? source.machine finalConfig = none

end Infinite

/-- Exact pointwise representation with a valid finite-window head. -/
structure Represents (origin : Int) (row : DeterministicTape.Row) (config : Infinite.Config) : Prop where
  valid : row.head < row.tape.length
  state_eq : config.state = row.state
  head_eq : config.head = origin + (row.head : Int)
  tape_eq : ∀ position, config.tape position = window origin row.tape position

def embed (origin : Int) (row : DeterministicTape.Row) : Infinite.Config :=
  ⟨row.state, origin + (row.head : Int), window origin row.tape⟩

theorem embed_represents (origin : Int) (row : DeterministicTape.Row) (valid : row.head < row.tape.length) :
    Represents origin row (embed origin row) := ⟨valid, rfl, rfl, fun _ => rfl⟩

theorem lookup_agrees (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    Infinite.lookup machine.states state symbol = DeterministicTape.ruleAt? machine state symbol := by
  rcases machine with ⟨states⟩
  induction states generalizing state with
  | nil => cases state <;> rfl
  | cons entry rest ih =>
      cases state with
      | zero => rfl
      | succ state => exact ih state

theorem initial_represents (source : DeterministicTape.Instance) :
    Represents (-1) (DeterministicTape.initialRow source) (Infinite.initial source) := by
  refine ⟨?_, rfl, by rfl, ?_⟩
  · change 1 < (false :: source.input ++ [false]).length
    simp only [List.length_cons, List.length_append, List.length_nil]
    exact Nat.succ_lt_succ (Nat.zero_lt_succ source.input.length)
  · intro position
    change tapeAt source.input position = tapeAt (false :: (source.input ++ [false])) (position - (-1))
    rw [show position - (-1) = position + 1 by rw [Int.sub_eq_add_neg, Int.neg_neg], tapeAt_blank_cons, tapeAt_blank_append]

theorem Represents.scanned {origin : Int} {row : DeterministicTape.Row} {config : Infinite.Config}
    (represented : Represents origin row config) : scanned? row = some (config.tape config.head) := by
  obtain ⟨symbol, read, agrees⟩ := scanned_exists row.tape row.head represented.valid
  rw [represented.tape_eq, represented.head_eq]
  unfold window
  rw [show origin + (row.head : Int) - origin = (row.head : Int) by
    rw [Int.add_comm origin (row.head : Int), Int.add_sub_cancel], agrees]
  exact read

/-- The represented infinite tape is blank outside a finite integer interval. -/
theorem Represents.blank_outside {origin : Int} {row : DeterministicTape.Row} {config : Infinite.Config}
    (represented : Represents origin row config) (position : Int)
    (outside : position < origin ∨ origin + (row.tape.length : Int) ≤ position) : config.tape position = false := by
  rw [represented.tape_eq]
  cases outside with
  | inl before => exact tapeAt_negative row.tape (position - origin) (Int.sub_neg_of_lt before)
  | inr after => exact tapeAt_after row.tape (position - origin) (Int.le_sub_left_of_add_le after)

/-- A source write/move has exactly the conventional cell update and integer
head displacement, with the origin shifted only on a left boundary crossing. -/
theorem applyRule_represents {origin : Int} {row : DeterministicTape.Row} {config : Infinite.Config}
    (represented : Represents origin row config) (rule : Rule) :
    ∃ next, applyRule? row rule = some next ∧
      Represents (movedOrigin origin row.head rule.move) next (Infinite.apply config rule) := by
  obtain ⟨written, replaced⟩ := replace_exists row.tape row.head rule.write represented.valid
  let next : DeterministicTape.Row :=
    ⟨rule.nextState, (movePadded written row.head rule.move).2, (movePadded written row.head rule.move).1⟩
  refine ⟨next, ?_, ?_⟩
  · rw [applyRule?, replaced]
    rfl
  · refine ⟨?_, rfl, ?_, ?_⟩
    · apply move_valid
      rw [replaceAt?_length replaced]
      exact represented.valid
    · change config.head + displacement rule.move =
        movedOrigin origin row.head rule.move + ((movePadded written row.head rule.move).2 : Int)
      rw [represented.head_eq]
      exact (move_head origin written row.head rule.move).symm
    · intro position
      change Infinite.write config.tape config.head rule.write position =
        window (movedOrigin origin row.head rule.move) (movePadded written row.head rule.move).1 position
      rw [move_tape]
      unfold Infinite.write
      rw [represented.head_eq, represented.tape_eq]
      unfold window
      rw [tapeAt_replace replaced]
      by_cases hit : position = origin + (row.head : Int)
      · rw [if_pos hit, if_pos (show position - origin = (row.head : Int) by
          rw [hit, Int.add_comm origin (row.head : Int), Int.add_sub_cancel])]
      · have miss : position - origin ≠ (row.head : Int) := by
          intro equal
          apply hit
          exact (Int.sub_add_cancel position origin).symm.trans
            ((congrArg (fun value : Int => value + origin) equal).trans (Int.add_comm (row.head : Int) origin))
        rw [if_neg hit, if_neg miss]

theorem step_forward (machine : DeterministicTape.Machine)
    {origin : Int} {row next : DeterministicTape.Row} {config : Infinite.Config}
    (represented : Represents origin row config) (stepped : DeterministicTape.step? machine row = some next) :
    ∃ nextOrigin nextConfig, Infinite.step? machine config = some nextConfig ∧ Represents nextOrigin next nextConfig := by
  unfold DeterministicTape.step? at stepped
  rw [represented.scanned] at stepped
  change (DeterministicTape.ruleAt? machine row.state (config.tape config.head)).bind (applyRule? row) = some next at stepped
  cases ruleEq : DeterministicTape.ruleAt? machine row.state (config.tape config.head) with
  | none => rw [ruleEq] at stepped; cases stepped
  | some rule =>
      rw [ruleEq] at stepped
      change applyRule? row rule = some next at stepped
      obtain ⟨candidate, applied, nextRep⟩ := applyRule_represents represented rule
      have same : candidate = next := Option.some.inj (applied.symm.trans stepped)
      subst candidate
      refine ⟨movedOrigin origin row.head rule.move, Infinite.apply config rule, ?_, nextRep⟩
      rw [Infinite.step?, lookup_agrees, represented.state_eq, ruleEq]
      rfl

theorem step_backward (machine : DeterministicTape.Machine)
    {origin : Int} {row : DeterministicTape.Row} {config nextConfig : Infinite.Config}
    (represented : Represents origin row config) (stepped : Infinite.step? machine config = some nextConfig) :
    ∃ nextOrigin next, DeterministicTape.step? machine row = some next ∧ Represents nextOrigin next nextConfig := by
  rw [Infinite.step?, lookup_agrees, represented.state_eq] at stepped
  cases ruleEq : DeterministicTape.ruleAt? machine row.state (config.tape config.head) with
  | none => rw [ruleEq] at stepped; cases stepped
  | some rule =>
      rw [ruleEq] at stepped
      change some (Infinite.apply config rule) = some nextConfig at stepped
      cases stepped
      obtain ⟨next, applied, nextRep⟩ := applyRule_represents represented rule
      refine ⟨movedOrigin origin row.head rule.move, next, ?_, nextRep⟩
      rw [DeterministicTape.step?, represented.scanned]
      change (DeterministicTape.ruleAt? machine row.state (config.tape config.head)).bind (applyRule? row) = some next
      rw [ruleEq]
      exact applied

theorem undefined_step_iff (machine : DeterministicTape.Machine)
    {origin : Int} {row : DeterministicTape.Row} {config : Infinite.Config}
    (represented : Represents origin row config) :
    DeterministicTape.step? machine row = none ↔ Infinite.step? machine config = none := by
  constructor
  · intro halted
    cases targetStep : Infinite.step? machine config with
    | none => rfl
    | some nextConfig =>
        obtain ⟨_, next, sourceStep, _⟩ := step_backward machine represented targetStep
        rw [halted] at sourceStep
        cases sourceStep
  · intro halted
    cases sourceStep : DeterministicTape.step? machine row with
    | none => rfl
    | some next =>
        obtain ⟨_, nextConfig, targetStep, _⟩ := step_forward machine represented sourceStep
        rw [halted] at targetStep
        cases targetStep

theorem run_forward (machine : DeterministicTape.Machine) (fuel : Nat)
    {origin : Int} {row finalRow : DeterministicTape.Row} {config : Infinite.Config}
    (represented : Represents origin row config)
    (run : DeterministicTape.runFor? machine row fuel = some finalRow) :
    ∃ finalOrigin finalConfig, Infinite.runFor? machine config fuel = some finalConfig ∧
      Represents finalOrigin finalRow finalConfig := by
  induction fuel generalizing origin row config with
  | zero =>
      change some row = some finalRow at run
      cases run
      exact ⟨origin, config, rfl, represented⟩
  | succ fuel ih =>
      cases stepped : DeterministicTape.step? machine row with
      | none => rw [DeterministicTape.runFor?, stepped] at run; cases run
      | some next =>
          rw [DeterministicTape.runFor?, stepped] at run
          obtain ⟨nextOrigin, nextConfig, targetStep, nextRep⟩ := step_forward machine represented stepped
          obtain ⟨finalOrigin, finalConfig, rest, finalRep⟩ := ih nextRep run
          refine ⟨finalOrigin, finalConfig, ?_, finalRep⟩
          rw [Infinite.runFor?, targetStep]
          exact rest

theorem run_backward (machine : DeterministicTape.Machine) (fuel : Nat)
    {origin : Int} {row : DeterministicTape.Row} {config finalConfig : Infinite.Config}
    (represented : Represents origin row config)
    (run : Infinite.runFor? machine config fuel = some finalConfig) :
    ∃ finalOrigin finalRow, DeterministicTape.runFor? machine row fuel = some finalRow ∧
      Represents finalOrigin finalRow finalConfig := by
  induction fuel generalizing origin row config with
  | zero =>
      change some config = some finalConfig at run
      cases run
      exact ⟨origin, row, rfl, represented⟩
  | succ fuel ih =>
      cases stepped : Infinite.step? machine config with
      | none => rw [Infinite.runFor?, stepped] at run; cases run
      | some nextConfig =>
          rw [Infinite.runFor?, stepped] at run
          obtain ⟨nextOrigin, next, sourceStep, nextRep⟩ := step_backward machine represented stepped
          obtain ⟨finalOrigin, finalRow, rest, finalRep⟩ := ih nextRep run
          refine ⟨finalOrigin, finalRow, ?_, finalRep⟩
          rw [DeterministicTape.runFor?, sourceStep]
          exact rest

theorem halts_iff (source : DeterministicTape.Instance) : DeterministicTape.Halts source ↔ Infinite.Halts source := by
  constructor
  · rintro ⟨fuel, row, run, halted⟩
    obtain ⟨origin, config, targetRun, represented⟩ := run_forward source.machine fuel (initial_represents source) run
    exact ⟨fuel, config, targetRun, (undefined_step_iff source.machine represented).mp halted⟩
  · rintro ⟨fuel, config, run, halted⟩
    obtain ⟨origin, row, sourceRun, represented⟩ := run_backward source.machine fuel (initial_represents source) run
    exact ⟨fuel, row, sourceRun, (undefined_step_iff source.machine represented).mpr halted⟩

theorem step_preserves_valid (machine : DeterministicTape.Machine) (row next : DeterministicTape.Row)
    (valid : row.head < row.tape.length) (stepped : DeterministicTape.step? machine row = some next) :
    next.head < next.tape.length := by
  obtain ⟨_, _, _, represented⟩ := step_forward machine (embed_represents 0 row valid) stepped
  exact represented.valid

theorem run_preserves_valid (source : DeterministicTape.Instance) (fuel : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    row.head < row.tape.length := by
  obtain ⟨_, _, _, represented⟩ := run_forward source.machine fuel (initial_represents source) run
  exact represented.valid

/-- Exact terminal scanned-bit agreement with the conventional machine. -/
theorem returns_iff (source : DeterministicTape.Instance) (output : Bool) :
    (∃ fuel row, DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row ∧
      DeterministicTape.step? source.machine row = none ∧ scanned? row = some output) ↔
    (∃ fuel config, Infinite.runFor? source.machine (Infinite.initial source) fuel = some config ∧
      Infinite.step? source.machine config = none ∧ config.tape config.head = output) := by
  constructor
  · rintro ⟨fuel, row, run, halted, outputEq⟩
    obtain ⟨origin, config, targetRun, represented⟩ := run_forward source.machine fuel (initial_represents source) run
    exact ⟨fuel, config, targetRun, (undefined_step_iff source.machine represented).mp halted,
      Option.some.inj (represented.scanned.symm.trans outputEq)⟩
  · rintro ⟨fuel, config, run, halted, outputEq⟩
    obtain ⟨origin, row, sourceRun, represented⟩ := run_backward source.machine fuel (initial_represents source) run
    exact ⟨fuel, row, sourceRun, (undefined_step_iff source.machine represented).mpr halted,
      represented.scanned.trans (congrArg some outputEq)⟩

end PureSFormal.Computation.DeterministicTapeInfiniteTape
