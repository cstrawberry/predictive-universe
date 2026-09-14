import PureSFormal.Cook.PassClassification

/-!
# Total direct decoder for Cook--Minsky registered boundaries

This module implements the executable inverse omitted from
`PassClassification`.  It decodes canonical and directional-arrival tag
words, inverts the 114-bit one-hot Cook encoding, and exposes the phase- and
horizon-gated CTS boundary decoder used by the paper-level `Pass_R`.

Periodic-tail arrival words intentionally omit the scanned blank and the
approached empty side.  Their total inverse therefore returns the canonical
finite-window representative with current symbol `s4` and that side empty.
On `BoundaryValid` registered words this normalization is the identity.
-/

namespace PureSFormal.Cook
open PassClassification

def symbolOfDigitWeight? : Nat → Option MachineSymbol
  | 7 => some .s0
  | 6 => some .s1
  | 5 => some .s2
  | 4 => some .s3
  | 3 => some .s4
  | 2 => some .s5
  | _ => none

@[simp] theorem symbolOfDigitWeight?_digitWeight (symbol : MachineSymbol) :
    symbolOfDigitWeight? (digitWeight symbol) = some symbol := by
  cases symbol <;> rfl

def symbolOfHeadCount? : Nat → Option MachineSymbol
  | 8 => some .s0
  | 7 => some .s1
  | 6 => some .s2
  | 5 => some .s3
  | 4 => some .s4
  | 3 => some .s5
  | _ => none

@[simp] theorem symbolOfHeadCount?_canonical (symbol : MachineSymbol) :
    symbolOfHeadCount? (8 - machineSymbolValue symbol) = some symbol := by
  cases symbol <;> rfl

def decodeRightCounter? (count : Nat) : Option (List MachineSymbol) :=
  if _hzero : count = 0 then
    some []
  else if count % 8 = 0 then
    let units := count / 8
    let digit := units % 8
    match symbolOfDigitWeight? digit with
    | none => none
    | some symbol =>
        match decodeRightCounter? (units - digit) with
        | none => none
        | some rest => some (symbol :: rest)
  else none
termination_by count
decreasing_by
  exact Nat.lt_of_le_of_lt (Nat.sub_le _ _)
    (Nat.div_lt_self (Nat.zero_lt_of_ne_zero _hzero) (by decide))

def decodeLeftCounter? (count : Nat) : Option (List MachineSymbol) :=
  if count = 8 then
    some []
  else if _hzero : count = 0 then
    none
  else if count % 8 = 0 then
    let units := count / 8
    let digit := units % 8
    match symbolOfDigitWeight? digit with
    | none => none
    | some symbol =>
        match decodeLeftCounter? (units - digit) with
        | none => none
        | some rest => some (symbol :: rest)
  else none
termination_by count
decreasing_by
  exact Nat.lt_of_le_of_lt (Nat.sub_le _ _)
    (Nat.div_lt_self (Nat.zero_lt_of_ne_zero _hzero) (by decide))

theorem decodeRightCounter?_rightCounter (side : List MachineSymbol) :
    decodeRightCounter? (rightCounter side) = some side := by
  induction side with
  | nil =>
      change decodeRightCounter? 0 = some []
      rw [decodeRightCounter?]
      rfl
  | cons symbol rest ih =>
      rw [decodeRightCounter?]
      have hne : rightCounter (symbol :: rest) ≠ 0 := by
        change 8 * (digitWeight symbol + rightCounter rest) ≠ 0
        apply Nat.ne_of_gt
        exact Nat.mul_pos (by decide)
          (Nat.add_pos_left
            (Nat.lt_of_lt_of_le (by decide : 0 < 2)
              (digitWeight_bounds symbol).1) _)
      rw [dif_neg hne]
      rw [if_pos (rightCounter_mod_radix (symbol :: rest))]
      rw [rightCounter_div_radix]
      change
        (match symbolOfDigitWeight?
            ((digitWeight symbol + rightCounter rest) % 8) with
          | none => none
          | some decoded =>
              match decodeRightCounter?
                  (digitWeight symbol + rightCounter rest -
                    (digitWeight symbol + rightCounter rest) % 8) with
              | none => none
              | some decodedRest => some (decoded :: decodedRest)) =
          some (symbol :: rest)
      have hlt := (digitWeight_bounds symbol).2
      have hmod : (digitWeight symbol + rightCounter rest) % 8 =
          digitWeight symbol := by
        calc
          _ = (digitWeight symbol % 8 + rightCounter rest % 8) % 8 :=
            Nat.add_mod _ _ _
          _ = digitWeight symbol % 8 := by
            rw [rightCounter_mod_radix]
            simp
          _ = digitWeight symbol :=
            Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt hlt (by decide))
      rw [hmod, symbolOfDigitWeight?_digitWeight]
      have hsub : digitWeight symbol + rightCounter rest -
          digitWeight symbol = rightCounter rest := by
        exact Nat.add_sub_cancel_left _ _
      rw [hsub, ih]

theorem decodeLeftCounter?_leftCounter (side : List MachineSymbol) :
    decodeLeftCounter? (leftCounter side) = some side := by
  induction side with
  | nil =>
      change decodeLeftCounter? 8 = some []
      rw [decodeLeftCounter?]
      rfl
  | cons symbol rest ih =>
      rw [decodeLeftCounter?]
      have hne8 : leftCounter (symbol :: rest) ≠ 8 := by
        change 8 * (digitWeight symbol + leftCounter rest) ≠ 8
        have hsum : 1 < digitWeight symbol + leftCounter rest :=
          Nat.lt_of_lt_of_le (by decide : 1 < 2)
            (Nat.le_trans (digitWeight_bounds symbol).1
              (Nat.le_add_right _ _))
        intro heq
        have hfactor : digitWeight symbol + leftCounter rest = 1 :=
          Nat.eq_of_mul_eq_mul_left (by decide : 0 < 8) (by
            simpa only [Nat.mul_one] using heq)
        exact (Nat.ne_of_gt hsum) hfactor
      rw [if_neg hne8]
      have hne0 : leftCounter (symbol :: rest) ≠ 0 := by
        change 8 * (digitWeight symbol + leftCounter rest) ≠ 0
        apply Nat.ne_of_gt
        exact Nat.mul_pos (by decide)
          (Nat.add_pos_left
            (Nat.lt_of_lt_of_le (by decide : 0 < 2)
              (digitWeight_bounds symbol).1) _)
      rw [dif_neg hne0]
      rw [if_pos (leftCounter_mod_radix (symbol :: rest))]
      rw [leftCounter_div_radix]
      change
        (match symbolOfDigitWeight?
            ((digitWeight symbol + leftCounter rest) % 8) with
          | none => none
          | some decoded =>
              match decodeLeftCounter?
                  (digitWeight symbol + leftCounter rest -
                    (digitWeight symbol + leftCounter rest) % 8) with
              | none => none
              | some decodedRest => some (decoded :: decodedRest)) =
          some (symbol :: rest)
      have hlt := (digitWeight_bounds symbol).2
      have hmod : (digitWeight symbol + leftCounter rest) % 8 =
          digitWeight symbol := by
        calc
          _ = (digitWeight symbol % 8 + leftCounter rest % 8) % 8 :=
            Nat.add_mod _ _ _
          _ = digitWeight symbol % 8 := by
            rw [leftCounter_mod_radix]
            simp
          _ = digitWeight symbol :=
            Nat.mod_eq_of_lt (Nat.lt_of_le_of_lt hlt (by decide))
      rw [hmod, symbolOfDigitWeight?_digitWeight]
      have hsub : digitWeight symbol + leftCounter rest -
          digitWeight symbol = leftCounter rest := by
        exact Nat.add_sub_cancel_left _ _
      rw [hsub, ih]

theorem regularLeftArrivalExponent_mod (config : MachineConfig) :
    regularLeftArrivalExponent config % 8 = digitWeight config.current := by
  unfold regularLeftArrivalExponent
  have hlt : digitWeight config.current < 8 :=
    Nat.lt_of_le_of_lt (digitWeight_bounds config.current).2 (by decide)
  calc
    _ = (digitWeight config.current % 8 + leftCounter config.left % 8) % 8 :=
      Nat.add_mod _ _ _
    _ = digitWeight config.current % 8 := by
      rw [leftCounter_mod_radix]
      simp
    _ = digitWeight config.current := Nat.mod_eq_of_lt hlt

theorem regularRightArrivalExponent_mod (config : MachineConfig) :
    regularRightArrivalExponent config % 8 = digitWeight config.current := by
  unfold regularRightArrivalExponent
  have hlt : digitWeight config.current < 8 :=
    Nat.lt_of_le_of_lt (digitWeight_bounds config.current).2 (by decide)
  calc
    _ = (digitWeight config.current % 8 + rightCounter config.right % 8) % 8 :=
      Nat.add_mod _ _ _
    _ = digitWeight config.current % 8 := by
      rw [rightCounter_mod_radix]
      simp
    _ = digitWeight config.current := Nat.mod_eq_of_lt hlt

def decodeLeftArrivalExponent? (count : Nat) :
    Option (MachineSymbol × List MachineSymbol) := do
  let current ← symbolOfDigitWeight? (count % 8)
  let left ← decodeLeftCounter? (count - count % 8)
  some (current, left)

def decodeRightArrivalExponent? (count : Nat) :
    Option (MachineSymbol × List MachineSymbol) := do
  let current ← symbolOfDigitWeight? (count % 8)
  let right ← decodeRightCounter? (count - count % 8)
  some (current, right)

theorem decodeLeftArrivalExponent?_regular (config : MachineConfig) :
    decodeLeftArrivalExponent? (regularLeftArrivalExponent config) =
      some (config.current, config.left) := by
  unfold decodeLeftArrivalExponent?
  rw [regularLeftArrivalExponent_mod,
    symbolOfDigitWeight?_digitWeight]
  have hsub : regularLeftArrivalExponent config - digitWeight config.current =
      leftCounter config.left := by
    exact Nat.add_sub_cancel_left _ _
  rw [hsub, decodeLeftCounter?_leftCounter]
  rfl

theorem decodeRightArrivalExponent?_regular (config : MachineConfig) :
    decodeRightArrivalExponent? (regularRightArrivalExponent config) =
      some (config.current, config.right) := by
  unfold decodeRightArrivalExponent?
  rw [regularRightArrivalExponent_mod,
    symbolOfDigitWeight?_digitWeight]
  have hsub : regularRightArrivalExponent config - digitWeight config.current =
      rightCounter config.right := by
    exact Nat.add_sub_cancel_left _ _
  rw [hsub, decodeRightCounter?_rightCounter]
  rfl

def parseRunWord? (word : List TagSymbol) : Option (MachineState × RunCounts) :=
  match word with
  | .head state :: _ =>
      let counts : RunCounts :=
        ⟨word.count (.head state), word.count (.left state),
          word.count (.right state)⟩
      if word = runWord state counts then some (state, counts) else none
  | _ => none

theorem count_replicate_tag (needle value : TagSymbol) (n : Nat) :
    (List.replicate n value).count needle =
      if value = needle then n else 0 := by
  induction n with
  | zero =>
      by_cases h : value = needle <;> simp [h]
  | succ n ih =>
      rw [List.replicate_succ, List.count_cons, ih]
      by_cases h : value = needle
      · subst value
        simp only [beq_self_eq_true, if_pos, Nat.add_comm,
          Nat.succ_eq_add_one]
      · have hbeq : (value == needle) ≠ true := by
          intro heq
          exact h (beq_iff_eq.mp heq)
        simp [h, hbeq]

theorem parseRunWord?_runWord (state : MachineState) (counts : RunCounts)
    (h : 0 < counts.head) :
    parseRunWord? (runWord state counts) = some (state, counts) := by
  cases counts with
  | mk head left right =>
      cases head with
      | zero => simp at h
      | succ head =>
          simp only [runWord, List.replicate_succ, List.cons_append,
            parseRunWord?, List.count_cons, List.count_append,
            count_replicate_tag]
          simp
          rw [List.replicate_succ]
          rfl

def decodeCanonicalRaw? (word : List TagSymbol) : Option MachineConfig := do
  let (state, counts) ← parseRunWord? word
  let current ← symbolOfHeadCount? counts.head
  let left ← decodeLeftCounter? counts.left
  let right ← decodeRightCounter? counts.right
  some ⟨state, current, left, right⟩

def decodeCanonical? (word : List TagSymbol) : Option MachineConfig :=
  match decodeCanonicalRaw? word with
  | none => none
  | some config =>
      if word = canonicalWord config then some config else none

theorem canonicalCounts_head_pos (config : MachineConfig) :
    0 < (canonicalCounts config).head := by
  change 0 < 8 - machineSymbolValue config.current
  cases config.current <;> decide

theorem decodeCanonicalRaw?_canonicalWord (config : MachineConfig) :
    decodeCanonicalRaw? (canonicalWord config) = some config := by
  unfold decodeCanonicalRaw? canonicalWord
  rw [parseRunWord?_runWord config.state (canonicalCounts config)
    (canonicalCounts_head_pos config)]
  cases config with
  | mk state current left right =>
      change
        (do
          let decodedCurrent ←
            symbolOfHeadCount? (8 - machineSymbolValue current)
          let decodedLeft ← decodeLeftCounter? (leftCounter left)
          let decodedRight ← decodeRightCounter? (rightCounter right)
          some (Rogozhin46.Config.mk state decodedCurrent
            decodedLeft decodedRight)) =
        some (Rogozhin46.Config.mk state current left right)
      rw [symbolOfHeadCount?_canonical,
        decodeLeftCounter?_leftCounter, decodeRightCounter?_rightCounter]
      rfl

@[simp]
theorem decodeCanonical?_canonicalWord (config : MachineConfig) :
    decodeCanonical? (canonicalWord config) = some config := by
  simp [decodeCanonical?, decodeCanonicalRaw?_canonicalWord]

theorem decodeCanonical?_sound {word : List TagSymbol}
    {config : MachineConfig} (hdecode : decodeCanonical? word = some config) :
    word = canonicalWord config := by
  unfold decodeCanonical? at hdecode
  cases hraw : decodeCanonicalRaw? word with
  | none =>
      simp only [hraw] at hdecode
      cases hdecode
  | some candidate =>
      simp only [hraw] at hdecode
      by_cases hword : word = canonicalWord candidate
      · rw [if_pos hword] at hdecode
        have hc : candidate = config := Option.some.inj hdecode
        simpa [hc] using hword
      · rw [if_neg hword] at hdecode
        cases hdecode

theorem decodeCanonical?_eq_some_iff (word : List TagSymbol)
    (config : MachineConfig) :
    decodeCanonical? word = some config ↔ word = canonicalWord config := by
  constructor
  · exact decodeCanonical?_sound
  · intro hword
    rw [hword]
    exact decodeCanonical?_canonicalWord config

theorem canonicalWord_injective {first second : MachineConfig}
    (heq : canonicalWord first = canonicalWord second) : first = second := by
  have hfirst := decodeCanonical?_canonicalWord first
  rw [heq, decodeCanonical?_canonicalWord] at hfirst
  exact (Option.some.inj hfirst).symm

structure DecodedArrival where
  direction : ArrivalDirection
  origin : ArrivalOrigin
  config : MachineConfig
  deriving DecidableEq, Repr

def decodeArrivalCounts? (state : MachineState) (counts : RunCounts) :
    Option DecodedArrival := do
  let direction ← arrivalOnlySelector counts
  match direction with
  | .left =>
      let right ← decodeRightCounter? counts.right
      if counts.left = 1 then
        some ⟨.left, .periodicTail,
          Rogozhin46.Config.mk state .s4 [] right⟩
      else do
        let (current, left) ← decodeLeftArrivalExponent? counts.left
        some ⟨.left, .representedCell,
          Rogozhin46.Config.mk state current left right⟩
  | .right =>
      let left ← decodeLeftCounter? counts.left
      if counts.right = 0 then
        some ⟨.right, .periodicTail,
          Rogozhin46.Config.mk state .s4 left []⟩
      else do
        let (current, right) ← decodeRightArrivalExponent? counts.right
        some ⟨.right, .representedCell,
          Rogozhin46.Config.mk state current left right⟩

def decodeArrivalRaw? (word : List TagSymbol) : Option DecodedArrival := do
  let (state, counts) ← parseRunWord? word
  decodeArrivalCounts? state counts

def decodeArrival? (word : List TagSymbol) : Option DecodedArrival :=
  match decodeArrivalRaw? word with
  | none => none
  | some decoded =>
      if word = arrivalWord decoded.direction decoded.origin decoded.config then
        some decoded
      else none

/-- Periodic markers carry no explicit current/approached-side payload. -/
def normalizeArrivalConfig (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) : MachineConfig :=
  match direction, origin with
  | .left, .periodicTail =>
      Rogozhin46.Config.mk config.state .s4 [] config.right
  | .right, .periodicTail =>
      Rogozhin46.Config.mk config.state .s4 config.left []
  | _, .representedCell => config

@[simp]
theorem arrivalWord_normalize (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    arrivalWord direction origin
        (normalizeArrivalConfig direction origin config) =
      arrivalWord direction origin config := by
  cases direction <;> cases origin <;> rfl

theorem digitWeight_ne_zero (symbol : MachineSymbol) :
    digitWeight symbol ≠ 0 := by
  cases symbol <;> decide

@[simp]
theorem arrivalOnlySelector_arrivalCounts (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    arrivalOnlySelector (arrivalCounts direction origin config) =
      some direction := by
  cases direction with
  | left =>
      cases origin with
      | periodicTail => simp [arrivalOnlySelector, arrivalCounts]
      | representedCell =>
          unfold arrivalOnlySelector
          rw [if_pos (by rfl)]
          rw [if_neg]
          · simp only [arrivalCounts]
            rw [regularLeftArrivalExponent_mod]
            exact digitWeight_ne_zero config.current
  | right =>
      cases origin <;>
        simp [arrivalOnlySelector, arrivalCounts, leftCounter_mod_radix]

theorem arrivalCounts_head_pos (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    0 < (arrivalCounts direction origin config).head := by
  cases direction <;> cases origin <;> exact Nat.zero_lt_succ 0

theorem regularLeftArrivalExponent_ne_one (config : MachineConfig) :
    regularLeftArrivalExponent config ≠ 1 := by
  unfold regularLeftArrivalExponent
  have hdigit := (digitWeight_bounds config.current).1
  apply Nat.ne_of_gt
  exact Nat.lt_of_lt_of_le (by decide : 1 < 2)
    (Nat.le_trans hdigit (Nat.le_add_right _ _))

theorem regularRightArrivalExponent_ne_zero (config : MachineConfig) :
    regularRightArrivalExponent config ≠ 0 := by
  unfold regularRightArrivalExponent
  have hdigit := (digitWeight_bounds config.current).1
  apply Nat.ne_of_gt
  exact Nat.lt_of_lt_of_le (by decide : 0 < 2)
    (Nat.le_trans hdigit (Nat.le_add_right _ _))

theorem decodeArrivalRaw?_arrivalWord (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    decodeArrivalRaw? (arrivalWord direction origin config) =
      some ⟨direction, origin,
        normalizeArrivalConfig direction origin config⟩ := by
  unfold decodeArrivalRaw? arrivalWord
  rw [parseRunWord?_runWord config.state
    (arrivalCounts direction origin config)
    (arrivalCounts_head_pos direction origin config)]
  change decodeArrivalCounts? config.state
      (arrivalCounts direction origin config) = _
  cases direction with
  | left =>
      cases origin with
      | periodicTail =>
          cases config with
          | mk state current left right =>
              unfold decodeArrivalCounts?
              rw [arrivalOnlySelector_arrivalCounts]
              change
                (do
                  let decodedRight ← decodeRightCounter? (rightCounter right)
                  some (DecodedArrival.mk ArrivalDirection.left
                    ArrivalOrigin.periodicTail
                    (Rogozhin46.Config.mk state .s4 [] decodedRight))) =
                  some (DecodedArrival.mk ArrivalDirection.left
                    ArrivalOrigin.periodicTail
                    (Rogozhin46.Config.mk state .s4 [] right))
              rw [decodeRightCounter?_rightCounter]
              rfl
      | representedCell =>
          cases config with
          | mk state current left right =>
              unfold decodeArrivalCounts?
              rw [arrivalOnlySelector_arrivalCounts]
              change
                (do
                  let decodedRight ← decodeRightCounter? (rightCounter right)
                  if regularLeftArrivalExponent
                      ⟨state, current, left, right⟩ = 1 then
                    some (DecodedArrival.mk ArrivalDirection.left
                      ArrivalOrigin.periodicTail
                      (Rogozhin46.Config.mk state .s4 [] decodedRight))
                  else do
                    let (decodedCurrent, decodedLeft) ←
                      decodeLeftArrivalExponent?
                        (regularLeftArrivalExponent
                          ⟨state, current, left, right⟩)
                    some (DecodedArrival.mk ArrivalDirection.left
                      ArrivalOrigin.representedCell
                      (Rogozhin46.Config.mk state decodedCurrent decodedLeft
                        decodedRight))) =
                  some (DecodedArrival.mk ArrivalDirection.left
                    ArrivalOrigin.representedCell
                    (Rogozhin46.Config.mk state current left right))
              rw [decodeRightCounter?_rightCounter]
              change
                (if regularLeftArrivalExponent
                    ⟨state, current, left, right⟩ = 1 then
                  some (DecodedArrival.mk ArrivalDirection.left
                    ArrivalOrigin.periodicTail
                    (Rogozhin46.Config.mk state .s4 [] right))
                else do
                  let (decodedCurrent, decodedLeft) ←
                    decodeLeftArrivalExponent?
                      (regularLeftArrivalExponent
                        ⟨state, current, left, right⟩)
                  some (DecodedArrival.mk ArrivalDirection.left
                    ArrivalOrigin.representedCell
                    (Rogozhin46.Config.mk state decodedCurrent decodedLeft
                      right))) =
                  some (DecodedArrival.mk ArrivalDirection.left
                    ArrivalOrigin.representedCell
                    (Rogozhin46.Config.mk state current left right))
              rw [if_neg (regularLeftArrivalExponent_ne_one
                ⟨state, current, left, right⟩)]
              rw [decodeLeftArrivalExponent?_regular]
              rfl
  | right =>
      cases origin with
      | periodicTail =>
          cases config with
          | mk state current left right =>
              unfold decodeArrivalCounts?
              rw [arrivalOnlySelector_arrivalCounts]
              change
                (do
                  let decodedLeft ← decodeLeftCounter? (leftCounter left)
                  some (DecodedArrival.mk ArrivalDirection.right
                    ArrivalOrigin.periodicTail
                    (Rogozhin46.Config.mk state .s4 decodedLeft []))) =
                  some (DecodedArrival.mk ArrivalDirection.right
                    ArrivalOrigin.periodicTail
                    (Rogozhin46.Config.mk state .s4 left []))
              rw [decodeLeftCounter?_leftCounter]
              rfl
      | representedCell =>
          cases config with
          | mk state current left right =>
              unfold decodeArrivalCounts?
              rw [arrivalOnlySelector_arrivalCounts]
              change
                (do
                  let decodedLeft ← decodeLeftCounter? (leftCounter left)
                  if regularRightArrivalExponent
                      ⟨state, current, left, right⟩ = 0 then
                    some (DecodedArrival.mk ArrivalDirection.right
                      ArrivalOrigin.periodicTail
                      (Rogozhin46.Config.mk state .s4 decodedLeft []))
                  else do
                    let (decodedCurrent, decodedRight) ←
                      decodeRightArrivalExponent?
                        (regularRightArrivalExponent
                          ⟨state, current, left, right⟩)
                    some (DecodedArrival.mk ArrivalDirection.right
                      ArrivalOrigin.representedCell
                      (Rogozhin46.Config.mk state decodedCurrent decodedLeft
                        decodedRight))) =
                  some (DecodedArrival.mk ArrivalDirection.right
                    ArrivalOrigin.representedCell
                    (Rogozhin46.Config.mk state current left right))
              rw [decodeLeftCounter?_leftCounter]
              change
                (if regularRightArrivalExponent
                    ⟨state, current, left, right⟩ = 0 then
                  some (DecodedArrival.mk ArrivalDirection.right
                    ArrivalOrigin.periodicTail
                    (Rogozhin46.Config.mk state .s4 left []))
                else do
                  let (decodedCurrent, decodedRight) ←
                    decodeRightArrivalExponent?
                      (regularRightArrivalExponent
                        ⟨state, current, left, right⟩)
                  some (DecodedArrival.mk ArrivalDirection.right
                    ArrivalOrigin.representedCell
                    (Rogozhin46.Config.mk state decodedCurrent left
                      decodedRight))) =
                  some (DecodedArrival.mk ArrivalDirection.right
                    ArrivalOrigin.representedCell
                    (Rogozhin46.Config.mk state current left right))
              rw [if_neg (regularRightArrivalExponent_ne_zero
                ⟨state, current, left, right⟩)]
              rw [decodeRightArrivalExponent?_regular]
              rfl

@[simp]
theorem decodeArrival?_arrivalWord (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    decodeArrival? (arrivalWord direction origin config) =
      some ⟨direction, origin,
        normalizeArrivalConfig direction origin config⟩ := by
  simp [decodeArrival?, decodeArrivalRaw?_arrivalWord,
    arrivalWord_normalize]

theorem decodeArrival?_sound {word : List TagSymbol}
    {decoded : DecodedArrival}
    (hdecode : decodeArrival? word = some decoded) :
    word = arrivalWord decoded.direction decoded.origin decoded.config := by
  unfold decodeArrival? at hdecode
  cases hraw : decodeArrivalRaw? word with
  | none =>
      simp only [hraw] at hdecode
      cases hdecode
  | some candidate =>
      simp only [hraw] at hdecode
      by_cases hword : word = arrivalWord candidate.direction candidate.origin
          candidate.config
      · rw [if_pos hword] at hdecode
        have hc : candidate = decoded := Option.some.inj hdecode
        simpa [hc] using hword
      · rw [if_neg hword] at hdecode
        cases hdecode

theorem arrivalWord_normalized_unique
    {direction₁ direction₂ : ArrivalDirection}
    {origin₁ origin₂ : ArrivalOrigin} {config₁ config₂ : MachineConfig}
    (heq : arrivalWord direction₁ origin₁ config₁ =
      arrivalWord direction₂ origin₂ config₂) :
    direction₁ = direction₂ ∧ origin₁ = origin₂ ∧
      normalizeArrivalConfig direction₁ origin₁ config₁ =
        normalizeArrivalConfig direction₂ origin₂ config₂ := by
  have hfirst := decodeArrival?_arrivalWord direction₁ origin₁ config₁
  rw [heq, decodeArrival?_arrivalWord] at hfirst
  have hall :
      (DecodedArrival.mk direction₂ origin₂
        (normalizeArrivalConfig direction₂ origin₂ config₂)) =
        DecodedArrival.mk direction₁ origin₁
          (normalizeArrivalConfig direction₁ origin₁ config₁) :=
    Option.some.inj hfirst
  exact ⟨(congrArg DecodedArrival.direction hall).symm,
    (congrArg DecodedArrival.origin hall).symm,
    (congrArg DecodedArrival.config hall).symm⟩

theorem normalizeArrivalConfig_of_boundaryValid
    (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (config : MachineConfig) (hvalid : BoundaryValid direction origin config) :
    normalizeArrivalConfig direction origin config = config := by
  cases direction with
  | left =>
      cases origin with
      | representedCell => rfl
      | periodicTail =>
          rcases hvalid with ⟨hcurrent, hleft, _⟩
          cases config with
          | mk state current left right =>
              simp only at hcurrent hleft
              subst current
              subst left
              rfl
  | right =>
      cases origin with
      | representedCell => rfl
      | periodicTail =>
          rcases hvalid with ⟨hcurrent, hright, _⟩
          cases config with
          | mk state current left right =>
              simp only at hcurrent hright
              subst current
              subst right
              rfl

theorem decodeArrival?_validArrivalWord (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig)
    (hvalid : BoundaryValid direction origin config) :
    decodeArrival? (arrivalWord direction origin config) =
      some ⟨direction, origin, config⟩ := by
  rw [decodeArrival?_arrivalWord,
    normalizeArrivalConfig_of_boundaryValid direction origin config hvalid]

theorem arrivalWord_valid_unique
    {direction₁ direction₂ : ArrivalDirection}
    {origin₁ origin₂ : ArrivalOrigin} {config₁ config₂ : MachineConfig}
    (hvalid₁ : BoundaryValid direction₁ origin₁ config₁)
    (hvalid₂ : BoundaryValid direction₂ origin₂ config₂)
    (heq : arrivalWord direction₁ origin₁ config₁ =
      arrivalWord direction₂ origin₂ config₂) :
    direction₁ = direction₂ ∧ origin₁ = origin₂ ∧ config₁ = config₂ := by
  obtain ⟨hdirection, horigin, hconfig⟩ :=
    arrivalWord_normalized_unique heq
  rw [normalizeArrivalConfig_of_boundaryValid direction₁ origin₁ config₁
      hvalid₁,
    normalizeArrivalConfig_of_boundaryValid direction₂ origin₂ config₂
      hvalid₂] at hconfig
  exact ⟨hdirection, horigin, hconfig⟩

theorem decodeArrival?_is_readable {word : List TagSymbol}
    {decoded : DecodedArrival} (hdecode : decodeArrival? word = some decoded) :
    ArrivalReadable word := by
  exact ⟨decoded.direction, decoded.origin, decoded.config,
    decodeArrival?_sound hdecode⟩

theorem arrivalReadable_iff_decodeArrival?_isSome (word : List TagSymbol) :
    ArrivalReadable word ↔ ∃ decoded, decodeArrival? word = some decoded := by
  constructor
  · rintro ⟨direction, origin, config, rfl⟩
    exact ⟨⟨direction, origin,
        normalizeArrivalConfig direction origin config⟩,
      decodeArrival?_arrivalWord direction origin config⟩
  · rintro ⟨decoded, hdecode⟩
    exact decodeArrival?_is_readable hdecode

def decodeOneHotRaw? (block : List Bool) : Option TagSymbol :=
  alphabet[block.findIdx (fun bit => bit)]?

def decodeOneHot? (block : List Bool) : Option TagSymbol :=
  match decodeOneHotRaw? block with
  | none => none
  | some symbol => if block = oneHot symbol then some symbol else none

theorem oneHot_findIdx (symbol : TagSymbol) :
    (oneHot symbol).findIdx (fun bit => bit) = symbolIndex symbol := by
  have hfalse : ∀ n : Nat,
      (List.replicate n false).findIdx (fun bit => bit) = n := by
    intro n
    induction n with
    | zero => rfl
    | succ n ih => simp [List.replicate_succ, List.findIdx_cons, ih]
  unfold oneHot
  rw [List.findIdx_append]
  rw [hfalse]
  simp [List.findIdx_cons]

theorem decodeOneHotRaw?_oneHot (symbol : TagSymbol) :
    decodeOneHotRaw? (oneHot symbol) = some symbol := by
  unfold decodeOneHotRaw?
  rw [oneHot_findIdx, alphabet_getElem?_symbolIndex]

@[simp]
theorem decodeOneHot?_oneHot (symbol : TagSymbol) :
    decodeOneHot? (oneHot symbol) = some symbol := by
  simp [decodeOneHot?, decodeOneHotRaw?_oneHot]

theorem decodeOneHot?_sound {block : List Bool} {symbol : TagSymbol}
    (hdecode : decodeOneHot? block = some symbol) :
    block = oneHot symbol := by
  unfold decodeOneHot? at hdecode
  cases hraw : decodeOneHotRaw? block with
  | none =>
      simp only [hraw] at hdecode
      cases hdecode
  | some candidate =>
      simp only [hraw] at hdecode
      by_cases hblock : block = oneHot candidate
      · rw [if_pos hblock] at hdecode
        have hc : candidate = symbol := Option.some.inj hdecode
        simpa [hc] using hblock
      · rw [if_neg hblock] at hdecode
        cases hdecode

def decodeWordRaw? (bits : List Bool) : Option (List TagSymbol) :=
  if _hnil : bits = [] then some []
  else if bits.length < alphabetSize then none
  else do
    let symbol ← decodeOneHot? (bits.take alphabetSize)
    let rest ← decodeWordRaw? (bits.drop alphabetSize)
    some (symbol :: rest)
termination_by bits.length
decreasing_by
  rw [List.length_drop]
  exact Nat.sub_lt (List.length_pos_iff.mpr _hnil) (by decide)

def decodeWord? (bits : List Bool) : Option (List TagSymbol) :=
  match decodeWordRaw? bits with
  | none => none
  | some word => if bits = encodeWord word then some word else none

theorem take_length_append {alpha : Type} (front suffix : List alpha) :
    (front ++ suffix).take front.length = front := by
  induction front with
  | nil => rfl
  | cons head tail ih =>
      simp only [List.cons_append, List.length_cons, List.take_succ_cons, ih]

theorem drop_length_append {alpha : Type} (front suffix : List alpha) :
    (front ++ suffix).drop front.length = suffix := by
  induction front with
  | nil => rfl
  | cons head tail ih =>
      simp only [List.cons_append, List.length_cons, List.drop_succ_cons, ih]

theorem take_encodeWord_cons (symbol : TagSymbol) (word : List TagSymbol) :
    (encodeWord (symbol :: word)).take alphabetSize = oneHot symbol := by
  rw [encodeWord_cons]
  have htake := take_length_append (oneHot symbol) (encodeWord word)
  rw [oneHot_length] at htake
  exact htake

theorem drop_encodeWord_cons (symbol : TagSymbol) (word : List TagSymbol) :
    (encodeWord (symbol :: word)).drop alphabetSize = encodeWord word := by
  rw [encodeWord_cons]
  have hdrop := drop_length_append (oneHot symbol) (encodeWord word)
  rw [oneHot_length] at hdrop
  exact hdrop

theorem encodeWord_cons_ne_nil (symbol : TagSymbol) (word : List TagSymbol) :
    encodeWord (symbol :: word) ≠ [] := by
  apply List.ne_nil_of_length_pos
  rw [encodeWord_length]
  exact Nat.mul_pos (by decide) (Nat.succ_pos _)

theorem encodeWord_cons_length_not_short (symbol : TagSymbol)
    (word : List TagSymbol) :
    ¬ (encodeWord (symbol :: word)).length < alphabetSize := by
  rw [encodeWord_cons, List.length_append, oneHot_length]
  exact Nat.not_lt_of_ge (Nat.le_add_right _ _)

theorem decodeWordRaw?_encodeWord (word : List TagSymbol) :
    decodeWordRaw? (encodeWord word) = some word := by
  induction word with
  | nil => simp [decodeWordRaw?]
  | cons symbol word ih =>
      rw [decodeWordRaw?]
      rw [dif_neg (encodeWord_cons_ne_nil symbol word)]
      rw [if_neg (encodeWord_cons_length_not_short symbol word)]
      rw [take_encodeWord_cons, decodeOneHot?_oneHot,
        drop_encodeWord_cons, ih]
      rfl

@[simp]
theorem decodeWord?_encodeWord (word : List TagSymbol) :
    decodeWord? (encodeWord word) = some word := by
  simp [decodeWord?, decodeWordRaw?_encodeWord]

theorem decodeWord?_sound {bits : List Bool} {word : List TagSymbol}
    (hdecode : decodeWord? bits = some word) : bits = encodeWord word := by
  unfold decodeWord? at hdecode
  cases hraw : decodeWordRaw? bits with
  | none =>
      simp only [hraw] at hdecode
      cases hdecode
  | some candidate =>
      simp only [hraw] at hdecode
      by_cases hbits : bits = encodeWord candidate
      · rw [if_pos hbits] at hdecode
        have hc : candidate = word := Option.some.inj hdecode
        simpa [hc] using hbits
      · rw [if_neg hbits] at hdecode
        cases hdecode

@[simp]
theorem rogozhinCookProgram_zeroPhase_val :
    (CTS.zeroPhase rogozhinCookProgram).val = 0 := rfl

def passDecode? (horizon : Nat)
    (snapshot : CTS.Config rogozhinCookProgram) : Option MachineConfig :=
  if snapshot.phase.val = 0 then do
    let word ← decodeWord? snapshot.data
    if horizon = 0 then
      decodeCanonical? word
    else
      match decodeArrival? word with
      | none => none
      | some decoded => some decoded.config
  else none

@[simp]
theorem passDecode?_canonical (config : MachineConfig) :
    passDecode? 0
      (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord config))) =
      some config := by
  unfold passDecode?
  rw [if_pos (by rfl)]
  change
    (do
      let word ← decodeWord? (encodeWord (canonicalWord config))
      decodeCanonical? word) = some config
  rw [decodeWord?_encodeWord]
  exact decodeCanonical?_canonicalWord config

theorem passDecode?_arrival (horizon : Nat) (hpositive : 0 < horizon)
    (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (config : MachineConfig) :
    passDecode? horizon
      (CTS.initial rogozhinCookProgram
        (encodeWord (arrivalWord direction origin config))) =
      some (normalizeArrivalConfig direction origin config) := by
  have hne : horizon ≠ 0 := Nat.ne_of_gt hpositive
  unfold passDecode?
  rw [if_pos (by rfl)]
  change
    (do
      let word ←
        decodeWord? (encodeWord (arrivalWord direction origin config))
      if horizon = 0 then decodeCanonical? word
      else
        match decodeArrival? word with
        | none => none
        | some decoded => some decoded.config) = _
  rw [decodeWord?_encodeWord]
  change
    (if horizon = 0 then
      decodeCanonical? (arrivalWord direction origin config)
    else
      match decodeArrival? (arrivalWord direction origin config) with
      | none => none
      | some decoded => some decoded.config) = _
  rw [if_neg hne]
  rw [decodeArrival?_arrivalWord]

theorem passDecode?_validArrival (horizon : Nat) (hpositive : 0 < horizon)
    (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (config : MachineConfig) (hvalid : BoundaryValid direction origin config) :
    passDecode? horizon
      (CTS.initial rogozhinCookProgram
        (encodeWord (arrivalWord direction origin config))) = some config := by
  rw [passDecode?_arrival horizon hpositive direction origin config]
  rw [normalizeArrivalConfig_of_boundaryValid direction origin config hvalid]

theorem passDecode?_of_phase_ne_zero (horizon : Nat)
    (snapshot : CTS.Config rogozhinCookProgram)
    (hphase : snapshot.phase.val ≠ 0) :
    passDecode? horizon snapshot = none := by
  simp [passDecode?, hphase]

theorem decodeArrival?_canonicalWord (config : MachineConfig) :
    decodeArrival? (canonicalWord config) = none := by
  cases hdecode : decodeArrival? (canonicalWord config) with
  | none => rfl
  | some decoded =>
      have hreadable := decodeArrival?_is_readable hdecode
      exact (canonical_notArrivalReadable config hreadable).elim

theorem decodeCanonical?_arrivalWord (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    decodeCanonical? (arrivalWord direction origin config) = none := by
  cases hdecode : decodeCanonical? (arrivalWord direction origin config) with
  | none => rfl
  | some decoded =>
      have hcanonical := decodeCanonical?_sound hdecode
      have hnot := canonical_notArrivalReadable decoded
      apply False.elim
      apply hnot
      exact ⟨direction, origin, config, hcanonical.symm⟩

theorem passDecode?_positive_canonical_none (horizon : Nat)
    (hpositive : 0 < horizon) (config : MachineConfig) :
    passDecode? horizon
      (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord config))) =
      none := by
  have hne : horizon ≠ 0 := Nat.ne_of_gt hpositive
  unfold passDecode?
  rw [if_pos (by rfl)]
  change
    (do
      let word ← decodeWord? (encodeWord (canonicalWord config))
      if horizon = 0 then decodeCanonical? word
      else
        match decodeArrival? word with
        | none => none
        | some decoded => some decoded.config) = none
  rw [decodeWord?_encodeWord]
  change
    (if horizon = 0 then decodeCanonical? (canonicalWord config)
    else
      match decodeArrival? (canonicalWord config) with
      | none => none
      | some decoded => some decoded.config) = none
  rw [if_neg hne, decodeArrival?_canonicalWord]

theorem passDecode?_zero_arrival_none (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    passDecode? 0
      (CTS.initial rogozhinCookProgram
        (encodeWord (arrivalWord direction origin config))) = none := by
  unfold passDecode?
  rw [if_pos (by rfl)]
  change
    (do
      let word ← decodeWord? (encodeWord (arrivalWord direction origin config))
      decodeCanonical? word) = none
  rw [decodeWord?_encodeWord]
  exact decodeCanonical?_arrivalWord direction origin config

theorem passDecode?_sound {horizon : Nat}
    {snapshot : CTS.Config rogozhinCookProgram} {config : MachineConfig}
    (hdecode : passDecode? horizon snapshot = some config) :
    snapshot.phase.val = 0 ∧
      ∃ word,
        decodeWord? snapshot.data = some word ∧
          ((horizon = 0 ∧ word = canonicalWord config) ∨
            (0 < horizon ∧ ∃ decoded,
              decodeArrival? word = some decoded ∧
                decoded.config = config)) := by
  unfold passDecode? at hdecode
  by_cases hphase : snapshot.phase.val = 0
  · rw [if_pos hphase] at hdecode
    cases hword : decodeWord? snapshot.data with
    | none =>
        simp [instMonadOption, Option.bind, hword] at hdecode
    | some word =>
        simp only [Bind.bind, instMonadOption, Option.bind, hword] at hdecode
        by_cases hhorizon : horizon = 0
        · rw [if_pos hhorizon] at hdecode
          exact ⟨hphase, word, rfl, .inl
            ⟨hhorizon, decodeCanonical?_sound hdecode⟩⟩
        · rw [if_neg hhorizon] at hdecode
          cases harrival : decodeArrival? word with
          | none => simp [harrival] at hdecode
          | some decoded =>
              rw [harrival] at hdecode
              exact ⟨hphase, word, rfl, .inr
                ⟨Nat.pos_of_ne_zero hhorizon, decoded, harrival,
                  Option.some.inj hdecode⟩⟩
  · rw [if_neg hphase] at hdecode
    cases hdecode

end PureSFormal.Cook
