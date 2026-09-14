import PureSFormal.Cook.CTS

set_option backward.isDefEq.respectTransparency false

/-!
# Semantic correctness of one Cook macroperiod

The proof separates a generic prefix-scanning theorem for any deletion-one
CTS from the two finite schedule facts of the fixed Cook compiler.  The first
114 phases consume one unary symbol and emit its production.  The remaining
798 phases consume seven unary symbols and have empty appendants.
-/

namespace PureSFormal.Cook

namespace Macroperiod

/-- Appendant bits emitted while a specified Boolean prefix is consumed. -/
def emitted (program : CTS.Program) :
    CTS.Phase program → List Bool → List Bool
  | _, [] => []
  | phase, false :: bits => emitted program (CTS.nextPhase program phase) bits
  | phase, true :: bits =>
      program.appendant phase ++
        emitted program (CTS.nextPhase program phase) bits

/-- Iteration may equivalently expose its first transition before the rest. -/
theorem iterate_succ_front (program : CTS.Program) (steps : Nat)
    (config : CTS.Config program) :
    CTS.iterate program (steps + 1) config =
      CTS.iterate program steps (CTS.absorbingStep program config) := by
  induction steps with
  | zero => rfl
  | succ steps ih =>
      change CTS.absorbingStep program
          (CTS.iterate program (steps + 1) config) =
        CTS.absorbingStep program
          (CTS.iterate program steps (CTS.absorbingStep program config))
      exact congrArg (CTS.absorbingStep program) ih

/-- The analogous front-exposure identity for phase iteration. -/
theorem iteratePhase_succ_front (program : CTS.Program) (steps : Nat)
    (phase : CTS.Phase program) :
    CTS.iteratePhase program (steps + 1) phase =
      CTS.iteratePhase program steps (CTS.nextPhase program phase) := by
  induction steps with
  | zero => rfl
  | succ steps ih =>
      change CTS.nextPhase program
          (CTS.iteratePhase program (steps + 1) phase) =
        CTS.nextPhase program
          (CTS.iteratePhase program steps (CTS.nextPhase program phase))
      exact congrArg (CTS.nextPhase program) ih

/--
Consuming an explicit prefix deletes it and appends exactly its chronological
emission sequence after the untouched suffix.
-/
theorem scanPrefix (program : CTS.Program) (phase : CTS.Phase program)
    (front suffix : List Bool) :
    CTS.iterate program front.length ⟨phase, front ++ suffix⟩ =
      ⟨CTS.iteratePhase program front.length phase,
        suffix ++ emitted program phase front⟩ := by
  induction front generalizing phase suffix with
  | nil =>
      simp only [List.length_nil, List.nil_append, CTS.iterate_zero,
        CTS.iteratePhase_zero, emitted, List.append_nil]
  | cons bit tail ih =>
      rw [List.length_cons, iterate_succ_front]
      rw [List.cons_append]
      cases bit with
      | false =>
          rw [CTS.absorbingStep_false]
          simpa only [CTS.advance, emitted, iteratePhase_succ_front] using
            ih (phase := CTS.nextPhase program phase) (suffix := suffix)
      | true =>
          rw [CTS.absorbingStep_true]
          simpa only [CTS.advance, List.append_assoc, emitted,
            iteratePhase_succ_front] using
            ih (phase := CTS.nextPhase program phase)
              (suffix := suffix ++ program.appendant phase)

/-- A false-only prefix emits no appendant bits. -/
theorem emitted_replicate_false (program : CTS.Program)
    (phase : CTS.Phase program) (count : Nat) :
    emitted program phase (List.replicate count false) = [] := by
  induction count generalizing phase with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, emitted, ih]

/-- False prefix bits merely advance the phase used by the remaining bits. -/
theorem emitted_false_prefix (program : CTS.Program)
    (phase : CTS.Phase program) (count : Nat) (bits : List Bool) :
    emitted program phase (List.replicate count false ++ bits) =
      emitted program (CTS.iteratePhase program count phase) bits := by
  induction count generalizing phase with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append, emitted,
        ih, iteratePhase_succ_front]

/-- Symbol-index phase inside the first, production-bearing block. -/
def productionPhase (symbol : TagSymbol) :
    CTS.Phase rogozhinCookProgram :=
  ⟨symbolIndex symbol, by
    exact Nat.lt_trans (symbolIndex_lt symbol) (by decide)⟩

/-- Advancing from zero by the symbol index reaches its production phase. -/
theorem iteratePhase_symbolIndex (symbol : TagSymbol) :
    CTS.iteratePhase rogozhinCookProgram (symbolIndex symbol)
      (CTS.zeroPhase rogozhinCookProgram) = productionPhase symbol := by
  apply Fin.ext
  rw [CTS.iteratePhase_val]
  change (0 + symbolIndex symbol) % 912 = symbolIndex symbol
  rw [Nat.zero_add, Nat.mod_eq_of_lt]
  exact Nat.lt_trans (symbolIndex_lt symbol) (by decide)

/-- The production-bearing appendant at a symbol's exact unary position. -/
theorem appendantAt_productionPhase (symbol : TagSymbol) :
    rogozhinCookProgram.appendant (productionPhase symbol) =
      binaryProduction symbol := by
  cases symbol with
  | head state => cases state <;> rfl
  | left state => cases state <;> rfl
  | right state => cases state <;> rfl
  | rightStar state => cases state <;> rfl
  | indexed family state index =>
      cases family <;> cases state <;> cases index <;> rfl
  | dummy1 => rfl
  | dummy2 => rfl

/-- A unary block emits exactly the compiled production of its symbol. -/
theorem emitted_oneHot (symbol : TagSymbol) :
    emitted rogozhinCookProgram (CTS.zeroPhase rogozhinCookProgram)
      (oneHot symbol) = binaryProduction symbol := by
  rw [oneHot, emitted_false_prefix]
  simp only [emitted, emitted_replicate_false, List.append_nil,
    iteratePhase_symbolIndex, appendantAt_productionPhase]

/-- Phase immediately after the 114 production-bearing phases. -/
def paddingStart : CTS.Phase rogozhinCookProgram :=
  CTS.iteratePhase rogozhinCookProgram alphabetSize
    (CTS.zeroPhase rogozhinCookProgram)

@[simp]
theorem paddingStart_val : paddingStart.val = 114 := by
  set_option maxRecDepth 10000 in
    rfl

/-- Every phase at or beyond row 114 has an empty fixed appendant. -/
theorem appendantAt_eq_nil_of_padding
    (phase : CTS.Phase rogozhinCookProgram)
    (hpadding : alphabetSize ≤ phase.val) :
    rogozhinCookProgram.appendant phase = [] := by
  set_option maxRecDepth 10000 in
    change appendantAt phase = []
    simp only [appendantAt, List.get_eq_getElem, ctsAppendants]
    rw [List.getElem_append_right]
    · exact List.getElem_replicate _
    · simpa only [productionAppendants_length, alphabetSize, Fin.coe_cast] using hpadding

/-- Before wraparound, offset `k` in padding has numerical phase `114+k`. -/
theorem padding_phase_val (offset : Nat) (hbound : offset < paddingPhases) :
    (CTS.iteratePhase rogozhinCookProgram offset paddingStart).val =
      alphabetSize + offset := by
  set_option maxRecDepth 10000 in
    rw [CTS.iteratePhase_val]
    change (114 + offset) % 912 = 114 + offset
    rw [Nat.mod_eq_of_lt]
    exact Nat.add_lt_add_left hbound 114

/-- Any prefix fitting in the 798 padding rows emits no bits. -/
theorem emitted_padding (offset : Nat) (bits : List Bool)
    (hbound : offset + bits.length ≤ paddingPhases) :
    emitted rogozhinCookProgram
      (CTS.iteratePhase rogozhinCookProgram offset paddingStart) bits = [] := by
  induction bits generalizing offset with
  | nil => rfl
  | cons bit bits ih =>
      simp only [List.length_cons] at hbound
      have hone : 1 ≤ bits.length + 1 :=
        Nat.succ_le_succ (Nat.zero_le bits.length)
      have hoffsetStep : offset + 1 ≤ offset + (bits.length + 1) :=
        Nat.add_le_add_left hone offset
      have hoffsetLe : offset + 1 ≤ paddingPhases :=
        Nat.le_trans hoffsetStep hbound
      have hoffsetLt : offset < paddingPhases :=
        Nat.add_one_le_iff.mp hoffsetLe
      have hphase := padding_phase_val offset hoffsetLt
      have happendant :
          rogozhinCookProgram.appendant
            (CTS.iteratePhase rogozhinCookProgram offset paddingStart) = [] := by
        apply appendantAt_eq_nil_of_padding
        rw [hphase]
        exact Nat.le_add_right alphabetSize offset
      have hnextBound : offset + 1 + bits.length ≤ paddingPhases := by
        simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hbound
      cases bit <;>
        simpa only [emitted, happendant, List.nil_append,
          CTS.iteratePhase_succ] using ih (offset + 1) hnextBound

/-- All 798 padding phases return the phase to zero. -/
theorem padding_returns_zero :
    CTS.iteratePhase rogozhinCookProgram paddingPhases paddingStart =
      CTS.zeroPhase rogozhinCookProgram := by
  apply Fin.ext
  rw [CTS.iteratePhase_val, paddingStart_val]
  rfl

/-- One production block consumes one unary symbol and appends its RHS code. -/
theorem run_production_block (symbol : TagSymbol) (suffix : List Bool) :
    CTS.iterate rogozhinCookProgram alphabetSize
      ⟨CTS.zeroPhase rogozhinCookProgram, oneHot symbol ++ suffix⟩ =
      ⟨paddingStart, suffix ++ binaryProduction symbol⟩ := by
  simpa only [oneHot_length, emitted_oneHot, paddingStart] using
    scanPrefix rogozhinCookProgram (CTS.zeroPhase rogozhinCookProgram)
      (oneHot symbol) suffix

/-- The padding block consumes exactly 798 supplied bits and appends nothing. -/
theorem run_padding_block (bits suffix : List Bool)
    (hlength : bits.length = paddingPhases) :
    CTS.iterate rogozhinCookProgram paddingPhases
      ⟨paddingStart, bits ++ suffix⟩ =
      ⟨CTS.zeroPhase rogozhinCookProgram, suffix⟩ := by
  have hemitted : emitted rogozhinCookProgram paddingStart bits = [] := by
    have hbound : 0 + bits.length ≤ paddingPhases := by
      rw [Nat.zero_add, hlength]
      exact Nat.le_refl paddingPhases
    simpa only [CTS.iteratePhase_zero] using emitted_padding 0 bits hbound
  simpa only [hlength, hemitted, List.append_nil, padding_returns_zero] using
    scanPrefix rogozhinCookProgram paddingStart bits suffix

/-- Unary encoding distributes constructively over tag-word append. -/
theorem encodeWord_append (left right : List TagSymbol) :
    encodeWord (left ++ right) = encodeWord left ++ encodeWord right := by
  induction left with
  | nil => rfl
  | cons symbol left ih =>
      simp only [List.cons_append, encodeWord_cons, ih, List.append_assoc]

/-- Partial deletion-eight Cook tag step; shorter words are completion cases. -/
def tagStep? : List TagSymbol → Option (List TagSymbol)
  | first :: _ :: _ :: _ :: _ :: _ :: _ :: _ :: rest =>
      some (rest ++ production first)
  | _ => none

/-- Total extension that leaves completed words unchanged. -/
def tagStep (word : List TagSymbol) : List TagSymbol :=
  match tagStep? word with
  | some next => next
  | none => word

@[simp]
theorem tagStep?_eight (first second third fourth fifth sixth seventh eighth :
    TagSymbol) (rest : List TagSymbol) :
    tagStep?
      (first :: second :: third :: fourth :: fifth :: sixth :: seventh ::
        eighth :: rest) = some (rest ++ production first) :=
  rfl

/-- Completion is exactly the case of fewer than eight tag symbols. -/
theorem tagStep?_eq_none_iff (word : List TagSymbol) :
    tagStep? word = none ↔ word.length < deletionNumber := by
  cases word with
  | nil => simp [tagStep?, deletionNumber]
  | cons first word =>
      cases word with
      | nil => simp [tagStep?, deletionNumber]
      | cons second word =>
          cases word with
          | nil => simp [tagStep?, deletionNumber]
          | cons third word =>
              cases word with
              | nil => simp [tagStep?, deletionNumber]
              | cons fourth word =>
                  cases word with
                  | nil => simp [tagStep?, deletionNumber]
                  | cons fifth word =>
                      cases word with
                      | nil => simp [tagStep?, deletionNumber]
                      | cons sixth word =>
                          cases word with
                          | nil => simp [tagStep?, deletionNumber]
                          | cons seventh word =>
                              cases word with
                              | nil => simp [tagStep?, deletionNumber]
                              | cons eighth rest =>
                                  simp [tagStep?, deletionNumber,
                                    Nat.add_assoc, Nat.add_comm,
                                    Nat.add_left_comm]

/-- Short completed words are fixed by the totalized tag transition. -/
theorem tagStep_eq_self_of_short {word : List TagSymbol}
    (hshort : word.length < deletionNumber) :
    tagStep word = word := by
  rw [tagStep]
  have hnone : tagStep? word = none :=
    (tagStep?_eq_none_iff word).2 hshort
  rw [hnone]

/--
The all-symbol eight-cell semantic core: one 912-phase CTS macroperiod is
exactly one deletion-eight Cook tag step.
-/
theorem macroperiod_eight
    (first second third fourth fifth sixth seventh eighth : TagSymbol)
    (rest : List TagSymbol) :
    CTS.iterate rogozhinCookProgram ctsPeriod
      (CTS.initial rogozhinCookProgram
        (encodeWord
          (first :: second :: third :: fourth :: fifth :: sixth :: seventh ::
            eighth :: rest))) =
      CTS.initial rogozhinCookProgram
        (encodeWord (rest ++ production first)) := by
  let seven : List TagSymbol :=
    [second, third, fourth, fifth, sixth, seventh, eighth]
  have hsevenLength : (encodeWord seven).length = paddingPhases := by
    rw [encodeWord_length]
    rfl
  have hencodedTail :
      encodeWord
          (second :: third :: fourth :: fifth :: sixth :: seventh ::
            eighth :: rest) =
        encodeWord seven ++ encodeWord rest := by
    change encodeWord (seven ++ rest) = _
    exact encodeWord_append seven rest
  change CTS.iterate rogozhinCookProgram (paddingPhases + alphabetSize)
      ⟨CTS.zeroPhase rogozhinCookProgram,
        oneHot first ++
          encodeWord
            (second :: third :: fourth :: fifth :: sixth :: seventh ::
              eighth :: rest)⟩ = _
  rw [CTS.iterate_add, hencodedTail,
    run_production_block first (encodeWord seven ++ encodeWord rest)]
  rw [List.append_assoc]
  rw [run_padding_block (encodeWord seven)
    (encodeWord rest ++ binaryProduction first) hsevenLength]
  rw [encodeWord_append]
  rfl

/-- Every successful partial tag step is simulated by one full CTS period. -/
theorem macroperiod_of_some {word next : List TagSymbol}
    (hstep : tagStep? word = some next) :
    CTS.iterate rogozhinCookProgram ctsPeriod
      (CTS.initial rogozhinCookProgram (encodeWord word)) =
      CTS.initial rogozhinCookProgram (encodeWord next) := by
  cases word with
  | nil => contradiction
  | cons first word =>
      cases word with
      | nil => contradiction
      | cons second word =>
          cases word with
          | nil => contradiction
          | cons third word =>
              cases word with
              | nil => contradiction
              | cons fourth word =>
                  cases word with
                  | nil => contradiction
                  | cons fifth word =>
                      cases word with
                      | nil => contradiction
                      | cons sixth word =>
                          cases word with
                          | nil => contradiction
                          | cons seventh word =>
                              cases word with
                              | nil => contradiction
                              | cons eighth rest =>
                                  simp only [tagStep?_eight,
                                    Option.some.injEq] at hstep
                                  subst next
                                  exact macroperiod_eight first second third
                                    fourth fifth sixth seventh eighth rest

/-- The requested all-word theorem under the exact length-eight precondition. -/
theorem macroperiod_of_length {word : List TagSymbol}
    (hlength : deletionNumber ≤ word.length) :
    CTS.iterate rogozhinCookProgram ctsPeriod
      (CTS.initial rogozhinCookProgram (encodeWord word)) =
      CTS.initial rogozhinCookProgram (encodeWord (tagStep word)) := by
  cases hstep : tagStep? word with
  | none =>
      have hshort : word.length < deletionNumber :=
        (tagStep?_eq_none_iff word).1 hstep
      exact (Nat.not_lt_of_ge hlength hshort).elim
  | some next =>
      simpa only [tagStep, hstep] using macroperiod_of_some hstep

/-- Every full 912-phase macroperiod returns to phase zero, for any dataword. -/
theorem macroperiod_phase_zero (data : List Bool) :
    (CTS.iterate rogozhinCookProgram ctsPeriod
      (CTS.initial rogozhinCookProgram data)).phase =
      CTS.zeroPhase rogozhinCookProgram := by
  change (CTS.iterate rogozhinCookProgram rogozhinCookProgram.period
    (CTS.initial rogozhinCookProgram data)).phase = _
  rw [CTS.iterate_phase, CTS.iteratePhase_period]
  rfl

/-- Empty tag data stays empty through the total absorbing CTS macroperiod. -/
theorem macroperiod_empty :
    CTS.iterate rogozhinCookProgram ctsPeriod
      (CTS.initial rogozhinCookProgram (encodeWord [])) =
      CTS.initial rogozhinCookProgram (encodeWord []) := by
  change CTS.iterate rogozhinCookProgram rogozhinCookProgram.period
      ⟨CTS.zeroPhase rogozhinCookProgram, []⟩ =
    ⟨CTS.zeroPhase rogozhinCookProgram, []⟩
  exact CTS.iterate_empty_period rogozhinCookProgram
    (CTS.zeroPhase rogozhinCookProgram)

end Macroperiod

end PureSFormal.Cook
