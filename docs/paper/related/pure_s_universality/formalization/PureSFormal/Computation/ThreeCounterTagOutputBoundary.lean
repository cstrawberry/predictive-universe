import PureSFormal.Computation.ThreeCounterTag

/-!
# Three-counter output at tag boundaries

The canonical live boundary records the control label and all three counter
values.  Halting boundaries instead use the fixed pair `halt, sink`.  The
collision below occurs after two executed instructions of one fixed program,
from two running inputs with different resulting left counters.
-/

namespace PureSFormal.Computation.ThreeCounterTagOutputBoundary

open ThreeCounter ThreeCounterTag ThreeCounterTag.Numeric

/-- Count a literal symbol without assuming a well-formed word. -/
def symbolCount (symbol : Symbol) : List Symbol → Nat
  | [] => 0
  | first :: rest => (if first = symbol then 1 else 0) + symbolCount symbol rest

theorem symbolCount_append (symbol : Symbol) (first second : List Symbol) :
    symbolCount symbol (first ++ second) =
      symbolCount symbol first + symbolCount symbol second := by
  induction first with
  | nil => simp [symbolCount]
  | cons head tail ih => simp [symbolCount, ih, Nat.add_assoc]

theorem symbolCount_replicate (symbol repeated : Symbol) (count : Nat) :
    symbolCount symbol (List.replicate count repeated) =
      if repeated = symbol then count else 0 := by
  induction count with
  | zero => simp [symbolCount]
  | succ count ih =>
      by_cases same : repeated = symbol
      · subst repeated
        simp only [if_pos rfl] at ih
        simp [List.replicate_succ, symbolCount, ih, Nat.add_comm]
      · simp [List.replicate_succ, symbolCount, ih, same]

@[simp]
theorem dataSymbol_eq_iff (control : Nat) (first second : Register) :
    dataSymbol control first = dataSymbol control second ↔ first = second := by
  constructor
  · intro equal
    exact (payload_injective (CounterMachineTag.Symbol.first.inj equal)).2
  · intro equal
    subst second
    rfl

theorem header_data_count (program : Program) (control : Nat)
    (register : Register) :
    symbolCount (dataSymbol control register) (header program control) = 0 := by
  cases instruction : instructionAt program control <;>
    simp [header, instruction, symbolCount, dataSymbol]

theorem dataBlock_data_count (program : Program) (control : Nat)
    (queried register : Register) (value : Nat)
    (live : instructionLive (instructionAt program control) = true) :
    symbolCount (dataSymbol control queried)
        (dataBlock program control register value) =
      if register = queried then
        scale (instructionAt program control) register * CounterMachineTag.radix value
      else 0 := by
  simp [dataBlock, live, symbolCount_replicate]

/-- Live words retain exactly the scaled radix multiplicity of each register. -/
theorem encodeState_data_count (program : Program) (state : State)
    (running : state.status = .running)
    (live : instructionLive (instructionAt program state.control) = true)
    (register : Register) :
    symbolCount (dataSymbol state.control register) (encodeState program state) =
      scale (instructionAt program state.control) register *
        CounterMachineTag.radix (ThreeCounter.read state register) := by
  cases register <;>
    simp [encodeState, running, canonical, symbolCount_append,
      header_data_count, dataBlock_data_count program state.control _ _ _ live,
      ThreeCounter.read]

theorem scale_positive (instruction : Instruction) (register : Register) :
    0 < scale instruction register := by
  unfold scale
  split <;> decide

/-- Bounded repeated halving of a counter block's multiplicity. -/
def radixExponentAux : Nat → Nat → Nat
  | 0, _ => 0
  | fuel + 1, value =>
      if value ≤ 1 then 0 else radixExponentAux fuel (value / 2) + 1

theorem value_le_radix (value : Nat) : value ≤ CounterMachineTag.radix value := by
  induction value with
  | zero => exact Nat.zero_le _
  | succ value ih =>
      have positive : 0 < CounterMachineTag.radix value := Nat.pow_pos (by decide)
      rw [CounterMachineTag.radix_succ]
      calc
        value + 1 ≤ CounterMachineTag.radix value + 1 := Nat.add_le_add_right ih 1
        _ ≤ CounterMachineTag.radix value + CounterMachineTag.radix value :=
          Nat.add_le_add_left positive _
        _ = 2 * CounterMachineTag.radix value := (Nat.two_mul _).symm

theorem radixExponentAux_radix (value : Nat) :
    ∀ fuel, value ≤ fuel →
      radixExponentAux fuel (CounterMachineTag.radix value) = value := by
  induction value with
  | zero =>
      intro fuel _
      cases fuel <;> rfl
  | succ value ih =>
      intro fuel enough
      cases fuel with
      | zero => exact False.elim (Nat.not_succ_le_zero value enough)
      | succ fuel =>
          have positive : 0 < CounterMachineTag.radix value := Nat.pow_pos (by decide)
          have notSmall : ¬ CounterMachineTag.radix (value + 1) ≤ 1 := by
            rw [CounterMachineTag.radix_succ]
            have twoLe : 2 ≤ 2 * CounterMachineTag.radix value :=
              Nat.mul_le_mul_left 2 positive
            exact fun small => Nat.not_succ_le_self 1 (Nat.le_trans twoLe small)
          rw [radixExponentAux, if_neg notSmall, CounterMachineTag.radix_succ,
            Nat.mul_div_cancel_left _ (by decide)]
          rw [ih fuel (Nat.le_of_succ_le_succ enough)]

/-- Total radix readback, using the multiplicity itself as structural fuel. -/
def radixExponent (value : Nat) : Nat := radixExponentAux value value

theorem radixExponent_radix (value : Nat) :
    radixExponent (CounterMachineTag.radix value) = value :=
  radixExponentAux_radix value _ (value_le_radix value)

/-- Decode one counter multiplicity at a supplied control label. -/
def readCounter (program : Program) (control : Nat) (register : Register)
    (word : List Symbol) : Nat :=
  radixExponent (symbolCount (dataSymbol control register) word /
    scale (instructionAt program control) register)

/-- Counting, division by the fixed scale, and repeated halving recover the
original register exactly at every canonical live boundary. -/
theorem readCounter_encodeState (program : Program) (state : State)
    (running : state.status = .running)
    (live : instructionLive (instructionAt program state.control) = true)
    (register : Register) :
    readCounter program state.control register (encodeState program state) =
      ThreeCounter.read state register := by
  unfold readCounter
  rw [encodeState_data_count program state running live register]
  rw [Nat.mul_div_cancel_left _ (scale_positive _ _)]
  exact radixExponent_radix _

/-- Read a live source state from the canonical header and three multiplicities.
No rejection claim is made for words outside the canonical boundary language. -/
def readLive? (program : Program) (word : List Symbol) : Option State :=
  match word.head? with
  | some (.head control) =>
      if instructionLive (instructionAt program control) then
        some ⟨control, readCounter program control .left word,
          readCounter program control .right word,
          readCounter program control .scratch word, .running⟩
      else none
  | _ => none

theorem encodeState_live_head (program : Program) (state : State)
    (running : state.status = .running)
    (live : instructionLive (instructionAt program state.control) = true) :
    (encodeState program state).head? = some (.head state.control) := by
  cases instruction : instructionAt program state.control with
  | halt => simp [instruction, instructionLive] at live
  | increment register next =>
      simp [encodeState, running, canonical, header, instruction]
  | decrementJump register positive zeroNext =>
      simp [encodeState, running, canonical, header, instruction]

/-- Canonical live boundaries admit exact recovery of all five source fields. -/
theorem readLive?_encodeState (program : Program) (state : State)
    (running : state.status = .running)
    (live : instructionLive (instructionAt program state.control) = true) :
    readLive? program (encodeState program state) = some state := by
  rw [readLive?, encodeState_live_head program state running live]
  dsimp only
  rw [live]
  simp only [↓reduceIte]
  rw [readCounter_encodeState program state running live .left,
    readCounter_encodeState program state running live .right,
    readCounter_encodeState program state running live .scratch]
  cases state with
  | mk control left right scratch status =>
      cases running
      rfl

/-- The live-state encoder is injective on its explicit live boundary domain. -/
theorem encodeState_live_injective (program : Program) (first second : State)
    (firstRunning : first.status = .running)
    (secondRunning : second.status = .running)
    (firstLive : instructionLive (instructionAt program first.control) = true)
    (secondLive : instructionLive (instructionAt program second.control) = true)
    (encoded : encodeState program first = encodeState program second) :
    first = second := by
  have decoded := congrArg (readLive? program) encoded
  rw [readLive?_encodeState program first firstRunning firstLive,
    readLive?_encodeState program second secondRunning secondLive] at decoded
  exact Option.some.inj decoded

/-- Every raw readback has running status and a live instruction label. -/
theorem readLive?_status (program : Program) (word : List Symbol) (state : State)
    (found : readLive? program word = some state) :
    state.status = .running ∧
      instructionLive (instructionAt program state.control) = true := by
  unfold readLive? at found
  split at found
  · split at found
    · cases found
      exact ⟨rfl, ‹instructionLive (instructionAt program _) = true›⟩
    · cases found
  · cases found

/-- Validate the reconstructed state by equality with its entire canonical
encoding, so malformed words are rejected. -/
def decodeLive? (program : Program) (word : List Symbol) : Option State :=
  (readLive? program word).bind fun state =>
    if encodeState program state = word then some state else none

theorem decodeLive?_encodeState (program : Program) (state : State)
    (running : state.status = .running)
    (live : instructionLive (instructionAt program state.control) = true) :
    decodeLive? program (encodeState program state) = some state := by
  rw [decodeLive?, readLive?_encodeState program state running live]
  simp

/-- On every finite word, successful decoding certifies exact canonical
re-encoding as well as the source status and live instruction. -/
theorem decodeLive?_sound (program : Program) (word : List Symbol) (state : State)
    (found : decodeLive? program word = some state) :
    state.status = .running ∧
      instructionLive (instructionAt program state.control) = true ∧
      encodeState program state = word := by
  unfold decodeLive? at found
  cases parsed : readLive? program word with
  | none => rw [parsed] at found; cases found
  | some candidate =>
      rw [parsed] at found
      dsimp only [Option.bind] at found
      split at found
      · cases found
        have status := readLive?_status program word state parsed
        exact ⟨status.1, status.2, ‹encodeState program state = word›⟩
      · cases found

/-- The checked decoder accepts exactly the canonical live boundary words. -/
theorem decodeLive?_eq_some_iff (program : Program) (word : List Symbol)
    (state : State) :
    decodeLive? program word = some state ↔
      state.status = .running ∧
        instructionLive (instructionAt program state.control) = true ∧
        encodeState program state = word := by
  constructor
  · exact decodeLive?_sound program word state
  · rintro ⟨running, live, encoded⟩
    rw [← encoded]
    exact decodeLive?_encodeState program state running live

/-- Every source state with halted status has the same typed boundary word. -/
theorem encodeState_halted (program : Program) (state : State)
    (halted : state.status = .halted) :
    encodeState program state = [.halt, .sink] := by
  simp [encodeState, halted]

/-- Canonical boundaries at a halt instruction already discard the registers,
before the source status changes on its next transition. -/
theorem canonical_halt (program : Program) (control left right scratch : Nat)
    (halt : instructionAt program control = .halt) :
    canonical program control left right scratch = [.halt, .sink] := by
  simp [canonical, header, dataBlock, halt, instructionLive]

/-- One increment followed by an explicit halt. -/
def incrementThenHalt : Program := [.increment .left 1, .halt]

/-- Running inputs with the source left register as their only variable field. -/
def runningInput (value : Nat) : State := ⟨0, value, 0, 0, .running⟩

/-- The live inputs are distinguishable before their terminal data is erased. -/
theorem runningInput_encode_injective (first second : Nat)
    (encoded : encodeState incrementThenHalt (runningInput first) =
      encodeState incrementThenHalt (runningInput second)) :
    first = second := by
  have states := encodeState_live_injective incrementThenHalt
    (runningInput first) (runningInput second) rfl rfl rfl rfl encoded
  exact congrArg State.left states

/-- The complete halted source state after the two executed instructions. -/
def haltedOutput (value : Nat) : State := ⟨1, value + 1, 0, 0, .halted⟩

theorem run_two (value : Nat) :
    ThreeCounter.run incrementThenHalt 2 (runningInput value) =
      haltedOutput value := by
  rfl

theorem halted_output_left (value : Nat) :
    (ThreeCounter.run incrementThenHalt 2 (runningInput value)).left = value + 1 :=
  rfl

theorem halted_output_status (value : Nat) :
    (ThreeCounter.run incrementThenHalt 2 (runningInput value)).status = .halted :=
  rfl

/-- Distinct reachable left-counter outputs have identical typed encodings. -/
theorem reachable_halted_collision (first second : Nat) :
    encodeState incrementThenHalt
        (ThreeCounter.run incrementThenHalt 2 (runningInput first)) =
      encodeState incrementThenHalt
        (ThreeCounter.run incrementThenHalt 2 (runningInput second)) :=
  rfl

/-- Each input's actual typed tag execution reaches the same terminal pair. -/
theorem terminal_pair_reachable (value : Nat) :
    ∃ fuel,
      CounterMachineTag.tagIterate (production incrementThenHalt) fuel
          (encodeState incrementThenHalt (runningInput value)) = [.halt, .sink] := by
  obtain ⟨fuel, simulated⟩ := encodeState_run incrementThenHalt (runningInput value) 2
  exact ⟨fuel, simulated⟩

/-- Recovering the left output from the encoded terminal boundary is impossible
even for this fixed program and this family of two-step running inputs. -/
theorem no_halted_left_readback :
    ¬ ∃ decode : List Symbol → Nat,
      ∀ value,
        decode (encodeState incrementThenHalt
          (ThreeCounter.run incrementThenHalt 2 (runningInput value))) =
            (ThreeCounter.run incrementThenHalt 2 (runningInput value)).left := by
  rintro ⟨decode, correct⟩
  have first := correct 0
  have second := correct 1
  change decode [.halt, .sink] = 1 at first
  change decode [.halt, .sink] = 2 at second
  have impossible : 1 = 2 := first.symm.trans second
  cases impossible

/-- The same obstruction uses terms reached by actual tag iterations, rather
than arbitrary source states supplied to the boundary encoder. -/
theorem no_reachable_terminal_left_readback :
    ¬ ∃ decode : List Symbol → Nat,
      ∀ value fuel,
        CounterMachineTag.tagIterate (production incrementThenHalt) fuel
            (encodeState incrementThenHalt (runningInput value)) = [.halt, .sink] →
        decode
          (CounterMachineTag.tagIterate (production incrementThenHalt) fuel
            (encodeState incrementThenHalt (runningInput value))) = value + 1 := by
  rintro ⟨decode, correct⟩
  obtain ⟨firstFuel, firstRun⟩ := terminal_pair_reachable 0
  obtain ⟨secondFuel, secondRun⟩ := terminal_pair_reachable 1
  have first := correct 0 firstFuel firstRun
  have second := correct 1 secondFuel secondRun
  rw [firstRun] at first
  rw [secondRun] at second
  have impossible : 1 = 2 := first.symm.trans second
  cases impossible

/-- Numerical symbol enumeration preserves the terminal boundary collision. -/
theorem ordinary_boundary_collision (first second : Nat) :
    ordinaryInitialWord incrementThenHalt
        (ThreeCounter.run incrementThenHalt 2 (runningInput first)) =
      ordinaryInitialWord incrementThenHalt
        (ThreeCounter.run incrementThenHalt 2 (runningInput second)) :=
  rfl

/-- Re-encoding the two reached terminal source states as restricted-T2 jobs
also gives identical words. -/
theorem normalized_boundary_collision (first second : Nat) :
    (compileT2 incrementThenHalt
      (ThreeCounter.run incrementThenHalt 2 (runningInput first))).word =
    (compileT2 incrementThenHalt
      (ThreeCounter.run incrementThenHalt 2 (runningInput second))).word :=
  rfl

/-- No decoder can recover the distinct left outputs from these normalized
terminal boundary encodings. -/
theorem no_normalized_boundary_left_readback :
    ¬ ∃ decode : List Nat → Nat,
      ∀ value,
        decode (compileT2 incrementThenHalt
          (ThreeCounter.run incrementThenHalt 2 (runningInput value))).word =
            value + 1 := by
  rintro ⟨decode, correct⟩
  have first := correct 0
  have second := correct 1
  rw [normalized_boundary_collision 1 0] at second
  have impossible : 1 = 2 := first.symm.trans second
  cases impossible

end PureSFormal.Computation.ThreeCounterTagOutputBoundary
