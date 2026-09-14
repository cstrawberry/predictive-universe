import PureSFormal.Rogozhin.Machine
import PureSFormal.Cook.HaltCleanup
import PureSFormal.Cook.HaltCleanupFirstEmpty
import PureSFormal.Cook.TagTrajectory

/-!
# Cook--Minsky pass arithmetic and registered boundaries

This module isolates the all-input components of Appendix B.4.1 that can be
proved directly from the executable Rogozhin table and the specialized Cook
productions: complete-sweep semantics, arbitrary-length radix counters,
registered canonical/arrival endpoints, and their relation to one machine
transition.  Arrival encodings retain whether a newly scanned blank came
from an explicit finite-window cell or from an implicit periodic tail.
-/

namespace PureSFormal.Cook

namespace PassClassification

abbrev MachineConfig := Rogozhin46.Config

/-- Cook's radix. -/
def radix : Nat := 8

/-- Digit `E(a)=7-a` used by both side counters. -/
def digitWeight (symbol : MachineSymbol) : Nat :=
  7 - machineSymbolValue symbol

theorem digitWeight_bounds (symbol : MachineSymbol) :
    2 ≤ digitWeight symbol ∧ digitWeight symbol ≤ 7 := by
  cases symbol <;> decide

/-- The left counter `Lambda`, written recursively from nearest cell first. -/
def leftCounter : List MachineSymbol → Nat
  | [] => 8
  | symbol :: rest => 8 * (digitWeight symbol + leftCounter rest)

/-- The right counter `P`, written recursively from nearest cell first. -/
def rightCounter : List MachineSymbol → Nat
  | [] => 0
  | symbol :: rest => 8 * (digitWeight symbol + rightCounter rest)

@[simp]
theorem leftCounter_nil : leftCounter [] = 8 := rfl

@[simp]
theorem leftCounter_cons (symbol : MachineSymbol)
    (rest : List MachineSymbol) :
    leftCounter (symbol :: rest) =
      8 * (digitWeight symbol + leftCounter rest) := rfl

@[simp]
theorem rightCounter_nil : rightCounter [] = 0 := rfl

@[simp]
theorem rightCounter_cons (symbol : MachineSymbol)
    (rest : List MachineSymbol) :
    rightCounter (symbol :: rest) =
      8 * (digitWeight symbol + rightCounter rest) := rfl

/-- Both registered counters have a zero low radix digit. -/
@[simp]
theorem leftCounter_mod_radix (side : List MachineSymbol) :
    leftCounter side % 8 = 0 := by
  cases side <;> simp only [leftCounter, Nat.mul_mod_right]

@[simp]
theorem rightCounter_mod_radix (side : List MachineSymbol) :
    rightCounter side % 8 = 0 := by
  cases side <;> simp only [rightCounter, Nat.zero_mod, Nat.mul_mod_right]

/-- Exact approached-left-side quotient, including the periodic-tail base. -/
@[simp]
theorem leftCounter_div_radix :
    ∀ side : List MachineSymbol,
      leftCounter side / 8 =
        match side with
        | [] => 1
        | symbol :: rest => digitWeight symbol + leftCounter rest
  | [] => by decide
  | symbol :: rest => by
      rw [leftCounter_cons, Nat.mul_comm 8,
        Nat.mul_div_left _ (by decide : 0 < 8)]

/-- Exact approached-right-side quotient, including the implicit-tail base. -/
@[simp]
theorem rightCounter_div_radix :
    ∀ side : List MachineSymbol,
      rightCounter side / 8 =
        match side with
        | [] => 0
        | symbol :: rest => digitWeight symbol + rightCounter rest
  | [] => rfl
  | symbol :: rest => by
      rw [rightCounter_cons, Nat.mul_comm 8,
        Nat.mul_div_left _ (by decide : 0 < 8)]

/-- One compact `H/L/R` run-count triple. -/
structure RunCounts where
  head : Nat
  left : Nat
  right : Nat
  deriving DecidableEq, Repr

/-- Materialize a pure run triple over one machine-state label. -/
def runWord (state : MachineState) (counts : RunCounts) : List TagSymbol :=
  List.replicate counts.head (.head state) ++
  List.replicate counts.left (.left state) ++
  List.replicate counts.right (.right state)

/-- Canonical boundary counts `K(i,c;B;D)`. -/
def canonicalCounts (config : MachineConfig) : RunCounts :=
  ⟨8 - machineSymbolValue config.current,
   leftCounter config.left,
   rightCounter config.right⟩

/-- Canonical boundary word. -/
def canonicalWord (config : MachineConfig) : List TagSymbol :=
  runWord config.state (canonicalCounts config)

/-- The two directional arrival classes. -/
inductive ArrivalDirection where
  | left | right
  deriving DecidableEq, Repr

/-- Whether the approached blank came from the periodic tail or from an
explicit finite-window cell.  The distinction affects the arrival exponent
although both cases decode to the same finite-window configuration. -/
inductive ArrivalOrigin where
  | periodicTail
  | representedCell
  deriving DecidableEq, Repr

/-- Counts at the first different pure endpoint of a left-moving pass. -/
def leftEndpointCounts (source : MachineConfig)
    (written : MachineSymbol) : RunCounts :=
  ⟨1, leftCounter source.left / 8,
    8 * (digitWeight written + rightCounter source.right)⟩

/-- Counts at the first different pure endpoint of a right-moving pass. -/
def rightEndpointCounts (source : MachineConfig)
    (written : MachineSymbol) : RunCounts :=
  ⟨1, 8 * (leftCounter source.left + digitWeight written),
    rightCounter source.right / 8⟩

def leftEndpointWord (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) : List TagSymbol :=
  runWord next (leftEndpointCounts source written)

def rightEndpointWord (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) : List TagSymbol :=
  runWord next (rightEndpointCounts source written)

/-- Exponent accepted by the regular left-arrival decoder clause. -/
def regularLeftArrivalExponent (config : MachineConfig) : Nat :=
  digitWeight config.current + leftCounter config.left

/-- Exponent accepted by the regular right-arrival decoder clause. -/
def regularRightArrivalExponent (config : MachineConfig) : Nat :=
  digitWeight config.current + rightCounter config.right

/-- A registered arrival word.  Periodic-tail endpoints use exponents `1`
and `0`; explicitly represented blanks use their ordinary radix digits. -/
def arrivalCounts (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (config : MachineConfig) : RunCounts :=
  match direction, origin with
  | .left, .periodicTail => ⟨1, 1, rightCounter config.right⟩
  | .left, .representedCell =>
      ⟨1, regularLeftArrivalExponent config, rightCounter config.right⟩
  | .right, .periodicTail => ⟨1, leftCounter config.left, 0⟩
  | .right, .representedCell =>
      ⟨1, leftCounter config.left, regularRightArrivalExponent config⟩

def arrivalWord (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (config : MachineConfig) : List TagSymbol :=
  runWord config.state (arrivalCounts direction origin config)

/-- Origin of a left arrival is determined by whether the approached source
side contained an explicit cell. -/
def leftOrigin (source : MachineConfig) : ArrivalOrigin :=
  match source.left with
  | [] => .periodicTail
  | _ :: _ => .representedCell

/-- Origin of a right arrival is determined by whether the approached source
side contained an explicit cell. -/
def rightOrigin (source : MachineConfig) : ArrivalOrigin :=
  match source.right with
  | [] => .periodicTail
  | _ :: _ => .representedCell

/-- D5L: the displayed endpoint counts are exactly a registered left-arrival
encoding of the finite-window machine successor. -/
theorem leftEndpoint_is_arrival (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol) :
    leftEndpointWord source next written =
      arrivalWord .left (leftOrigin source)
        (Rogozhin46.applyTransition source next written .left) := by
  apply congrArg (runWord next)
  cases source with
  | mk state current left right =>
      cases left with
      | nil =>
          simp only [leftEndpointCounts, arrivalCounts, leftOrigin,
            Rogozhin46.applyTransition, Rogozhin46.popSide,
            leftCounter_div_radix, rightCounter_cons]
      | cons scanned rest =>
          cases scanned <;>
            simp only [leftEndpointCounts, arrivalCounts, leftOrigin,
              Rogozhin46.applyTransition, Rogozhin46.popSide,
              leftCounter_div_radix, regularLeftArrivalExponent,
              rightCounter_cons]

/-- D5R: the displayed endpoint counts are exactly a registered right-arrival
encoding of the finite-window machine successor. -/
theorem rightEndpoint_is_arrival (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol) :
    rightEndpointWord source next written =
      arrivalWord .right (rightOrigin source)
        (Rogozhin46.applyTransition source next written .right) := by
  apply congrArg (runWord next)
  cases source with
  | mk state current left right =>
      cases right with
      | nil =>
          simp only [rightEndpointCounts, arrivalCounts, rightOrigin,
            Rogozhin46.applyTransition, Rogozhin46.popSide,
            rightCounter_div_radix, leftCounter_cons, Nat.add_comm]
      | cons scanned rest =>
          cases scanned <;>
            simp only [rightEndpointCounts, arrivalCounts, rightOrigin,
              Rogozhin46.applyTransition, Rogozhin46.popSide,
              rightCounter_div_radix, regularRightArrivalExponent,
              leftCounter_cons, Nat.add_comm]

/-- A machine move changes the finite-window configuration: a left move
strictly grows the represented right side. -/
theorem applyTransition_left_ne (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol) :
    Rogozhin46.applyTransition source next written .left ≠ source := by
  intro heq
  have hright := congrArg (fun config : MachineConfig => config.right.length) heq
  cases source with
  | mk state current left right =>
      simp only [Rogozhin46.applyTransition] at hright
      cases left <;> simp only [Rogozhin46.popSide, List.length_cons] at hright
      · exact (Nat.ne_of_lt (Nat.lt_succ_self right.length)) hright.symm
      · exact (Nat.ne_of_lt (Nat.lt_succ_self right.length)) hright.symm

/-- A right move changes the finite-window configuration: it strictly grows
the represented left side. -/
theorem applyTransition_right_ne (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol) :
    Rogozhin46.applyTransition source next written .right ≠ source := by
  intro heq
  have hleft := congrArg (fun config : MachineConfig => config.left.length) heq
  cases source with
  | mk state current left right =>
      simp only [Rogozhin46.applyTransition] at hleft
      cases right <;> simp only [Rogozhin46.popSide, List.length_cons] at hleft
      · exact (Nat.ne_of_lt (Nat.lt_succ_self left.length)) hleft.symm
      · exact (Nat.ne_of_lt (Nat.lt_succ_self left.length)) hleft.symm

/-- Direction of the registered endpoint selected by a nonhalting command. -/
def endpointDirection : Rogozhin46.Direction → ArrivalDirection
  | .left => .left
  | .right => .right

/-- Exact classified endpoint for a reflected nonhalting table command. -/
def expectedEndpoint (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) : Rogozhin46.Direction → List TagSymbol
  | .left => leftEndpointWord source next written
  | .right => rightEndpointWord source next written

/-- The expected endpoint decodes structurally as the exact machine successor
and is nonstuttering. -/
theorem expectedEndpoint_classification
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction) :
    expectedEndpoint source next written direction =
      arrivalWord (endpointDirection direction)
        (match direction with
         | .left => leftOrigin source
         | .right => rightOrigin source)
        (Rogozhin46.applyTransition source next written direction) ∧
    Rogozhin46.applyTransition source next written direction ≠ source := by
  cases direction with
  | left => exact ⟨leftEndpoint_is_arrival source next written,
      applyTransition_left_ne source next written⟩
  | right => exact ⟨rightEndpoint_is_arrival source next written,
      applyTransition_right_ne source next written⟩

/-- Classification specialized to an actual reflected nonhalting table cell. -/
theorem table_command_endpoint
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    Rogozhin46.step? source =
        some (Rogozhin46.applyTransition source next written direction) ∧
    expectedEndpoint source next written direction =
      arrivalWord (endpointDirection direction)
        (match direction with
         | .left => leftOrigin source
         | .right => rightOrigin source)
        (Rogozhin46.applyTransition source next written direction) ∧
    Rogozhin46.applyTransition source next written direction ≠ source := by
  cases direction with
  | left =>
      exact ⟨Rogozhin46.step?_eq_some_applyTransition
          source next written .left hcommand,
        expectedEndpoint_classification source next written .left⟩
  | right =>
      exact ⟨Rogozhin46.step?_eq_some_applyTransition
          source next written .right hcommand,
        expectedEndpoint_classification source next written .right⟩

/-- History-free direction selector on a readable run-count triple.  At head
exponent one, a zero low left digit is a right arrival and a nonzero low left
digit is a left arrival. -/
def arrivalOnlySelector (counts : RunCounts) : Option ArrivalDirection :=
  if counts.head = 1 then
    if counts.left % 8 = 0 then some .right else some .left
  else none

theorem leftEndpoint_low_digit_ne_zero (source : MachineConfig)
    (written : MachineSymbol) :
    (leftEndpointCounts source written).left % 8 ≠ 0 := by
  cases source with
  | mk state current left right =>
      cases left with
      | nil =>
          simp [leftEndpointCounts, leftCounter]
      | cons scanned rest =>
          simp only [leftEndpointCounts, leftCounter_div_radix]
          have hbounds := digitWeight_bounds scanned
          have hlt : digitWeight scanned < 8 :=
            Nat.lt_of_le_of_lt hbounds.2 (by decide)
          simp only [Nat.add_mod, leftCounter_mod_radix, Nat.add_zero,
            Nat.mod_eq_of_lt hlt]
          exact Nat.ne_of_gt
            (Nat.lt_of_lt_of_le (by decide : 0 < 2) hbounds.1)

@[simp]
theorem rightEndpoint_low_digit_zero (source : MachineConfig)
    (written : MachineSymbol) :
    (rightEndpointCounts source written).left % 8 = 0 := by
  simp only [rightEndpointCounts, Nat.mul_mod_right]

/-- The arrival-only selector identifies both endpoint families without
history, and its decoded configuration is nonstuttering by the preceding
classification theorem. -/
theorem arrivalOnlySelector_endpoint (source : MachineConfig)
    (written : MachineSymbol) (direction : Rogozhin46.Direction) :
    arrivalOnlySelector
      (match direction with
       | .left => leftEndpointCounts source written
       | .right => rightEndpointCounts source written) =
      some (endpointDirection direction) := by
  cases direction with
  | left =>
      unfold arrivalOnlySelector
      rw [if_pos (by rfl),
        if_neg (leftEndpoint_low_digit_ne_zero source written)]
      rfl
  | right =>
      unfold arrivalOnlySelector
      rw [if_pos (by rfl),
        if_pos (rightEndpoint_low_digit_zero source written)]
      rfl

/-! ## Certified halt-boundary decomposition -/

/-- Quotient units of the two radix counters. -/
def leftUnits : List MachineSymbol → Nat
  | [] => 1
  | symbol :: rest => digitWeight symbol + leftCounter rest

def rightUnits : List MachineSymbol → Nat
  | [] => 0
  | symbol :: rest => digitWeight symbol + rightCounter rest

@[simp] theorem leftUnits_nil : leftUnits [] = 1 := rfl
@[simp] theorem rightUnits_nil : rightUnits [] = 0 := rfl

@[simp]
theorem leftCounter_eq_radix_mul_units (side : List MachineSymbol) :
    leftCounter side = 8 * leftUnits side := by
  cases side <;> rfl

@[simp]
theorem rightCounter_eq_radix_mul_units (side : List MachineSymbol) :
    rightCounter side = 8 * rightUnits side := by
  cases side <;> rfl

theorem leftUnits_pos (side : List MachineSymbol) : 0 < leftUnits side := by
  cases side with
  | nil => exact Nat.zero_lt_succ 0
  | cons symbol rest =>
      have hweight := (digitWeight_bounds symbol).1
      have hweightPos : 0 < digitWeight symbol :=
        Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1) hweight
      exact Nat.add_pos_left hweightPos (leftCounter rest)

theorem leftCounter_ge_eight (side : List MachineSymbol) :
    8 ≤ leftCounter side := by
  rw [leftCounter_eq_radix_mul_units]
  have hscaled := Nat.mul_le_mul_left 8 (leftUnits_pos side)
  exact hscaled

theorem rightCounter_ge_sixteen (symbol : MachineSymbol)
    (rest : List MachineSymbol) :
    16 ≤ rightCounter (symbol :: rest) := by
  rw [rightCounter_cons]
  have hweight := (digitWeight_bounds symbol).1
  have hsum : 2 ≤ digitWeight symbol + rightCounter rest :=
    Nat.le_trans hweight
      (Nat.le_add_right (digitWeight symbol) (rightCounter rest))
  exact Nat.mul_le_mul_left 8 hsum

/-- Family-only version of a pure run word. -/
def runFamilies (counts : RunCounts) : List Family :=
  List.replicate counts.head .H ++
  List.replicate counts.left .L ++
  List.replicate counts.right .R

@[simp]
theorem runFamilies_length (counts : RunCounts) :
    (runFamilies counts).length = counts.head + counts.left + counts.right := by
  simp [runFamilies, Nat.add_assoc]

/-- Materialization factors through the family-only run list. -/
theorem runWord_eq_map_unindexed (state : HaltCleanup.HaltState)
    (counts : RunCounts) :
    runWord state.toMachineState counts =
      (runFamilies counts).map (HaltCleanup.unindexed state) := by
  cases state <;> cases counts <;>
    simp [runWord, runFamilies, HaltCleanup.unindexed]

/-- The three halt-boundary count forms; directional forms use the regular
arrival digit because the scanned symbol is `3`, never the tail blank `4`. -/
def haltBoundaryCounts (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) : RunCounts :=
  match form with
  | .canonical => canonicalCounts config
  | .leftArrival =>
      ⟨1, regularLeftArrivalExponent config, rightCounter config.right⟩
  | .rightArrival =>
      ⟨1, leftCounter config.left, regularRightArrivalExponent config⟩

def haltBoundaryWord (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) : List TagSymbol :=
  runWord config.state (haltBoundaryCounts form config)

@[simp]
theorem runWord_length (state : MachineState) (counts : RunCounts) :
    (runWord state counts).length =
      counts.head + counts.left + counts.right := by
  simp [runWord, Nat.add_assoc]

private theorem add_rotate (n left right : Nat) :
    n + left + right = left + right + n := by
  rw [Nat.add_comm n left, Nat.add_assoc,
    Nat.add_comm n right, ← Nat.add_assoc]

private theorem one_front_rotate (n left right : Nat) :
    1 + (n + left) + right = left + right + n.succ := by
  calc
    1 + (n + left) + right = (n + left) + right + 1 :=
      add_rotate 1 (n + left) right
    _ = (left + right + n) + 1 :=
      congrArg (fun value => value + 1) (add_rotate n left right)
    _ = left + right + n.succ := by
      rw [Nat.succ_eq_add_one, Nat.add_assoc]

private theorem one_middle_rotate (n left right : Nat) :
    1 + left + (n + right) = left + right + n.succ := by
  calc
    1 + left + (n + right) = (left + (n + right)) + 1 :=
      add_rotate 1 left (n + right)
    _ = (left + (right + n)) + 1 := by
      rw [Nat.add_comm n right]
    _ = (left + right + n) + 1 := by
      rw [← Nat.add_assoc left right n]
    _ = left + right + n.succ := by
      rw [Nat.succ_eq_add_one, Nat.add_assoc]

/-- Every registered codec form has the same length residue, namely the
canonical head exponent `8-c`. -/
theorem haltBoundaryWord_length (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) :
    (haltBoundaryWord form config).length =
      8 * (leftUnits config.left + rightUnits config.right) +
        (8 - machineSymbolValue config.current) := by
  rw [haltBoundaryWord, runWord_length]
  cases config with
  | mk state current left right =>
      cases current <;> cases form <;>
        simp only [haltBoundaryCounts, canonicalCounts,
          regularLeftArrivalExponent, regularRightArrivalExponent,
          digitWeight, machineSymbolValue, leftCounter_eq_radix_mul_units,
          rightCounter_eq_radix_mul_units, Nat.mul_add, Nat.reduceSub] <;>
        first
        | exact add_rotate _ _ _
        | exact one_front_rotate _ _ _
        | exact one_middle_rotate _ _ _

/-- Five terminal families prescribed by H3. -/
def terminalFamilies (form : HaltCleanup.BoundaryForm)
    (right : List MachineSymbol) : List Family :=
  match right, form with
  | [], .rightArrival => [.L, .R, .R, .R, .R]
  | [], _ => List.replicate 5 .L
  | _ :: _, _ => List.replicate 5 .R

@[simp]
theorem terminalFamilies_length (form : HaltCleanup.BoundaryForm)
    (right : List MachineSymbol) :
    (terminalFamilies form right).length = 5 := by
  cases right <;> cases form <;> rfl

/-- Prefix obtained by reserving the exact five terminal families. -/
def haltPrefixFamilies (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) : List Family :=
  let counts := haltBoundaryCounts form config
  match config.right, form with
  | [], .rightArrival =>
      List.replicate counts.head .H ++
        List.replicate (counts.left - 1) .L
  | [], _ =>
      List.replicate counts.head .H ++
        List.replicate (counts.left - 5) .L
  | _ :: _, _ =>
      List.replicate counts.head .H ++
        List.replicate counts.left .L ++
        List.replicate (counts.right - 5) .R

theorem replicate_split_last (value : α) {count suffix : Nat}
    (hle : suffix ≤ count) :
    List.replicate count value =
      List.replicate (count - suffix) value ++
        List.replicate suffix value := by
  rw [List.replicate_append_replicate, Nat.sub_add_cancel hle]

/-- A halt boundary has the exact five-family terminal suffix used by
`HaltCleanup.Certified`. -/
theorem haltBoundaryFamilies_split (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) (hcurrent : config.current = .s3) :
    runFamilies (haltBoundaryCounts form config) =
      haltPrefixFamilies form config ++ terminalFamilies form config.right := by
  cases config with
  | mk state current left right =>
      simp only at hcurrent
      subst current
      cases right with
      | nil =>
          cases form with
          | canonical =>
              have hleft : 5 ≤ leftCounter left :=
                Nat.le_trans (by decide : 5 ≤ 8) (leftCounter_ge_eight left)
              have hsplit := replicate_split_last (value := Family.L) hleft
              simpa [haltBoundaryCounts, haltPrefixFamilies, terminalFamilies,
                canonicalCounts, runFamilies, rightUnits_nil,
                List.append_assoc] using hsplit
          | leftArrival =>
              have hleft :
                  5 ≤ regularLeftArrivalExponent
                    ⟨state, .s3, left, []⟩ := by
                change 5 ≤ 4 + leftCounter left
                have hcounter := leftCounter_ge_eight left
                exact Nat.le_trans (by decide : 5 ≤ 4 + 8)
                  (Nat.add_le_add_left hcounter 4)
              have hsplit := replicate_split_last (value := Family.L) hleft
              simpa [haltBoundaryCounts, haltPrefixFamilies, terminalFamilies,
                regularLeftArrivalExponent, digitWeight, runFamilies,
                rightUnits_nil, List.append_assoc] using hsplit
          | rightArrival =>
              have hleft : 1 ≤ leftCounter left :=
                Nat.le_trans (by decide : 1 ≤ 8) (leftCounter_ge_eight left)
              have hsplit := replicate_split_last (value := Family.L) hleft
              have happended := congrArg
                (fun middle : List Family =>
                  List.replicate 1 .H ++ middle ++ List.replicate 4 .R)
                hsplit
              simpa [haltBoundaryCounts, haltPrefixFamilies, terminalFamilies,
                regularRightArrivalExponent, digitWeight, runFamilies,
                List.append_assoc] using! happended
      | cons rightHead rightTail =>
          have hrightBase := rightCounter_ge_sixteen rightHead rightTail
          cases form with
          | canonical =>
              have hright : 5 ≤ rightCounter (rightHead :: rightTail) :=
                Nat.le_trans (by decide : 5 ≤ 16) hrightBase
              have hsplit := replicate_split_last (value := Family.R) hright
              simpa [haltBoundaryCounts, haltPrefixFamilies, terminalFamilies,
                canonicalCounts, runFamilies, List.append_assoc] using hsplit
          | leftArrival =>
              have hright : 5 ≤ rightCounter (rightHead :: rightTail) :=
                Nat.le_trans (by decide : 5 ≤ 16) hrightBase
              have hsplit := replicate_split_last (value := Family.R) hright
              simpa [haltBoundaryCounts, haltPrefixFamilies, terminalFamilies,
                regularLeftArrivalExponent, digitWeight, runFamilies,
                List.append_assoc] using hsplit
          | rightArrival =>
              have hright : 5 ≤ regularRightArrivalExponent
                  ⟨state, .s3, left, rightHead :: rightTail⟩ := by
                change 5 ≤ 4 + rightCounter (rightHead :: rightTail)
                exact Nat.le_trans (by decide : 5 ≤ 4 + 16)
                  (Nat.add_le_add_left hrightBase 4)
              have hsplit := replicate_split_last (value := Family.R) hright
              simpa [haltBoundaryCounts, haltPrefixFamilies, terminalFamilies,
                regularRightArrivalExponent, digitWeight, runFamilies,
                List.append_assoc] using hsplit

/-- The halt prefix has exactly a whole number of deletion-eight blocks. -/
theorem haltPrefixFamilies_length (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) (hcurrent : config.current = .s3) :
    (haltPrefixFamilies form config).length =
      8 * (leftUnits config.left + rightUnits config.right) := by
  have hsplit := congrArg List.length
    (haltBoundaryFamilies_split form config hcurrent)
  rw [runFamilies_length, List.length_append,
    terminalFamilies_length] at hsplit
  have hboundary := haltBoundaryWord_length form config
  rw [haltBoundaryWord, runWord_length, hcurrent] at hboundary
  simp only [machineSymbolValue] at hboundary
  apply Nat.add_right_cancel (m := 5)
  exact hsplit.symm.trans hboundary

theorem haltPrefixFamilies_nonempty (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) (hcurrent : config.current = .s3) :
    haltPrefixFamilies form config ≠ [] := by
  intro hempty
  have hlength := haltPrefixFamilies_length form config hcurrent
  rw [hempty, List.length_nil] at hlength
  have hunits : 0 < leftUnits config.left + rightUnits config.right :=
    Nat.add_pos_left (leftUnits_pos config.left) (rightUnits config.right)
  have hproduct : 0 < 8 *
      (leftUnits config.left + rightUnits config.right) :=
    Nat.mul_pos (Nat.zero_lt_succ 7) hunits
  exact (Nat.ne_of_gt hproduct) hlength.symm

/-- Families contained in one explicit cleanup block. -/
def blockFamilies (block : HaltCleanup.FamilyBlock) : List Family :=
  [block.first, block.second, block.third, block.fourth,
   block.fifth, block.sixth, block.seventh, block.eighth]

def blocksFamilies : List HaltCleanup.FamilyBlock → List Family
  | [] => []
  | block :: blocks => blockFamilies block ++ blocksFamilies blocks

@[simp]
theorem blocksFamilies_length (blocks : List HaltCleanup.FamilyBlock) :
    (blocksFamilies blocks).length = 8 * blocks.length := by
  induction blocks with
  | nil => rfl
  | cons block blocks ih =>
      simp only [blocksFamilies, blockFamilies, List.length_append,
        List.length_cons, List.length_nil, ih, Nat.mul_succ, Nat.one_add]
      simp only [← Nat.add_assoc, Nat.reduceAdd]
      exact Nat.add_comm _ _

/-- Pack a family list of an explicitly known whole-block length.  The block
count is retained, so no quotient or choice principle enters the witness. -/
theorem exists_blocks_of_length (families : List Family) (blockCount : Nat)
    (hlength : families.length = 8 * blockCount) :
    ∃ blocks : List HaltCleanup.FamilyBlock,
      blocksFamilies blocks = families ∧ blocks.length = blockCount := by
  induction blockCount generalizing families with
  | zero =>
      cases families with
      | nil => exact ⟨[], rfl, rfl⟩
      | cons first rest =>
          simp only [List.length_cons, Nat.mul_zero] at hlength
          exact (Nat.noConfusion hlength)
  | succ blockCount ih =>
      have hge : 8 ≤ families.length := by
        rw [hlength]
        exact Nat.mul_le_mul_left 8 (Nat.zero_lt_succ blockCount)
      cases families with
      | nil => exact ((by decide : ¬ 8 ≤ 0) hge).elim
      | cons first families =>
          cases families with
          | nil => exact ((by decide : ¬ 8 ≤ 1) hge).elim
          | cons second families =>
              cases families with
              | nil => exact ((by decide : ¬ 8 ≤ 2) hge).elim
              | cons third families =>
                  cases families with
                  | nil => exact ((by decide : ¬ 8 ≤ 3) hge).elim
                  | cons fourth families =>
                      cases families with
                      | nil => exact ((by decide : ¬ 8 ≤ 4) hge).elim
                      | cons fifth families =>
                          cases families with
                          | nil => exact ((by decide : ¬ 8 ≤ 5) hge).elim
                          | cons sixth families =>
                              cases families with
                              | nil => exact ((by decide : ¬ 8 ≤ 6) hge).elim
                              | cons seventh families =>
                                  cases families with
                                  | nil => exact ((by decide : ¬ 8 ≤ 7) hge).elim
                                  | cons eighth rest =>
                                      have hlistLength :
                                          (first :: second :: third :: fourth ::
                                            fifth :: sixth :: seventh ::
                                            eighth :: rest).length =
                                            rest.length + 8 := by
                                        simp only [List.length_cons]
                                      rw [hlistLength, Nat.mul_succ] at hlength
                                      have hrest : rest.length =
                                          8 * blockCount :=
                                        Nat.add_right_cancel hlength
                                      obtain ⟨blocks, hblocks, hcount⟩ :=
                                        ih rest hrest
                                      let block : HaltCleanup.FamilyBlock :=
                                        ⟨first, second, third, fourth, fifth,
                                          sixth, seventh, eighth⟩
                                      refine ⟨block :: blocks, ?_, ?_⟩
                                      · change blockFamilies block ++
                                          blocksFamilies blocks = _
                                        rw [hblocks]
                                        simp only [block, blockFamilies]
                                        rfl
                                      · simp only [List.length_cons, hcount]

/-- Materializing packed families is exactly `HaltCleanup.blocksWord`. -/
theorem blocksWord_eq_map_unindexed (state : HaltCleanup.HaltState)
    (blocks : List HaltCleanup.FamilyBlock) :
    HaltCleanup.blocksWord state blocks =
      (blocksFamilies blocks).map (HaltCleanup.unindexed state) := by
  induction blocks with
  | nil => rfl
  | cons block blocks ih =>
      cases block
      simp [HaltCleanup.blocksWord, HaltCleanup.FamilyBlock.word,
        blocksFamilies, blockFamilies, ih]

/-- The cleanup certificate's terminal tag word is the materialization of
the five terminal families. -/
theorem terminalWord_eq_map_unindexed (state : HaltCleanup.HaltState)
    (form : HaltCleanup.BoundaryForm) (left right : List MachineSymbol)
    (blocks : List HaltCleanup.FamilyBlock) (hblocks : blocks ≠ []) :
    (HaltCleanup.Certified.mk state form left right blocks hblocks).terminalWord =
      (terminalFamilies form right).map (HaltCleanup.unindexed state) := by
  cases right <;> cases form <;> cases state <;> rfl

/-- A codec boundary together with the exact cleanup certificate consumed by
`HaltCleanup.certified_cleanup`. -/
structure CleanupBridge (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) where
  certificate : HaltCleanup.Certified
  state_eq : certificate.state.toMachineState = config.state
  form_eq : certificate.form = form
  left_eq : certificate.leftSide = config.left
  right_eq : certificate.rightSide = config.right
  word_eq : certificate.word = haltBoundaryWord form config

/-- Every halt pair in the exact table, at every registered codec form and
with arbitrary finite side counters, produces the H2/H3 cleanup certificate. -/
theorem cleanupBridge_of_halted (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) (hhalted : Rogozhin46.Halted config) :
    Nonempty (CleanupBridge form config) := by
  have hpairs := (Rogozhin46.halted_iff config).1 hhalted
  rcases hpairs with hC | hD
  · rcases hC with ⟨hstate, hcurrent⟩
    let state : HaltCleanup.HaltState := .C
    have hprefix := haltPrefixFamilies_length form config hcurrent
    obtain ⟨blocks, hblocksFamilies, hblocksCount⟩ :=
      exists_blocks_of_length (haltPrefixFamilies form config)
        (leftUnits config.left + rightUnits config.right) hprefix
    have hblocks : blocks ≠ [] := by
      intro hempty
      have := haltPrefixFamilies_nonempty form config hcurrent
      apply this
      rw [← hblocksFamilies, hempty]
      rfl
    let certificate : HaltCleanup.Certified :=
      ⟨state, form, config.left, config.right, blocks, hblocks⟩
    refine ⟨⟨certificate, ?_, rfl, rfl, rfl, ?_⟩⟩
    · simpa only [certificate, state] using! hstate.symm
    · unfold HaltCleanup.Certified.word haltBoundaryWord certificate
      rw [blocksWord_eq_map_unindexed, hblocksFamilies,
        terminalWord_eq_map_unindexed]
      rw [← List.map_append, ← haltBoundaryFamilies_split form config hcurrent]
      rw [hstate]
      simpa only [state] using!
        (runWord_eq_map_unindexed state (haltBoundaryCounts form config)).symm

  · rcases hD with ⟨hstate, hcurrent⟩
    let state : HaltCleanup.HaltState := .D
    have hprefix := haltPrefixFamilies_length form config hcurrent
    obtain ⟨blocks, hblocksFamilies, hblocksCount⟩ :=
      exists_blocks_of_length (haltPrefixFamilies form config)
        (leftUnits config.left + rightUnits config.right) hprefix
    have hblocks : blocks ≠ [] := by
      intro hempty
      have := haltPrefixFamilies_nonempty form config hcurrent
      apply this
      rw [← hblocksFamilies, hempty]
      rfl
    let certificate : HaltCleanup.Certified :=
      ⟨state, form, config.left, config.right, blocks, hblocks⟩
    refine ⟨⟨certificate, ?_, rfl, rfl, rfl, ?_⟩⟩
    · simpa only [certificate, state] using! hstate.symm
    · unfold HaltCleanup.Certified.word haltBoundaryWord certificate
      rw [blocksWord_eq_map_unindexed, hblocksFamilies,
        terminalWord_eq_map_unindexed]
      rw [← List.map_append, ← haltBoundaryFamilies_split form config hcurrent]
      rw [hstate]
      simpa only [state] using!
        (runWord_eq_map_unindexed state (haltBoundaryCounts form config)).symm

/-- Exact halting-pair characterization by availability of the cleanup
certificate bridge, for each of the three registered boundary codecs. -/
theorem cleanupBridge_iff_halted (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) :
    Nonempty (CleanupBridge form config) ↔ Rogozhin46.Halted config := by
  constructor
  · rintro ⟨bridge⟩
    have hlength := congrArg List.length bridge.word_eq
    rw [HaltCleanup.Certified.word_length,
      haltBoundaryWord_length] at hlength
    have hcurrent : config.current = .s3 := by
      have hmod := congrArg (fun length => length % 8) hlength
      cases hsymbol : config.current <;>
        simp only [hsymbol, machineSymbolValue, Nat.add_mod,
          Nat.mul_mod_right, Nat.zero_add, Nat.reduceMod,
          Nat.reduceSub] at hmod ⊢
      · exact ((by decide : (5 : Nat) ≠ 0) hmod).elim
      · exact ((by decide : (5 : Nat) ≠ 7) hmod).elim
      · exact ((by decide : (5 : Nat) ≠ 6) hmod).elim
      · exact ((by decide : (5 : Nat) ≠ 4) hmod).elim
      · exact ((by decide : (5 : Nat) ≠ 3) hmod).elim
    have hstate : config.state = .C ∨ config.state = .D := by
      cases hcertificate : bridge.certificate.state with
      | C =>
          left
          have := bridge.state_eq
          rw [hcertificate] at this
          exact this.symm
      | D =>
          right
          have := bridge.state_eq
          rw [hcertificate] at this
          exact this.symm
    rw [Rogozhin46.halted_iff]
    cases hstate with
    | inl hC => exact Or.inl ⟨hC, hcurrent⟩
    | inr hD => exact Or.inr ⟨hD, hcurrent⟩
  · exact cleanupBridge_of_halted form config

/-! ## Fixed CTS endpoint for every registered halting boundary -/

/-- Number of deletion-eight cleanup steps forced by a registered boundary
word. -/
def boundaryCleanupTagSteps (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) : Nat :=
  2 * ((haltBoundaryWord form config).length / 8) + 1

/-- Exact deletion-one CTS horizon measured from the registered halting
boundary: all tag cleanup macroperiods, followed by the 570-step residue
consumption. -/
def boundaryCleanupHorizon (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) : Nat :=
  912 * boundaryCleanupTagSteps form config + 570

@[simp]
theorem boundaryCleanupHorizon_formula (form : HaltCleanup.BoundaryForm)
    (config : MachineConfig) :
    boundaryCleanupHorizon form config =
      912 * (2 * ((haltBoundaryWord form config).length / 8) + 1) + 570 :=
  rfl

/-- One endpoint theorem joining the exact halting-pair classification, the
912-phase unary macroperiod lift, and the exact cleanup horizon.  It also
retains the kernel-checked fact that no point in the final 569-step residue
segment is empty. -/
theorem halted_iff_corrected_cleanup_endpoint
    (form : HaltCleanup.BoundaryForm) (config : MachineConfig) :
    Rogozhin46.Halted config ↔
      ∃ _bridge : CleanupBridge form config,
        CTS.iterate rogozhinCookProgram
            (boundaryCleanupHorizon form config)
            (CTS.initial rogozhinCookProgram
              (encodeWord (haltBoundaryWord form config))) =
          ⟨HaltCleanup.residueEndPhase, []⟩ ∧
        ∀ steps : Nat, steps < 570 →
          (CTS.iterate rogozhinCookProgram
            (912 * boundaryCleanupTagSteps form config + steps)
            (CTS.initial rogozhinCookProgram
              (encodeWord (haltBoundaryWord form config)))).data ≠ [] := by
  constructor
  · intro hhalted
    rcases cleanupBridge_of_halted form config hhalted with ⟨bridge⟩
    refine ⟨bridge, ?_, ?_⟩
    · simpa only [boundaryCleanupHorizon,
        HaltCleanup.fullCleanupHorizon, bridge.word_eq] using!
        HaltCleanup.certified_empties_at_full_horizon bridge.certificate
    · intro steps hsteps
      simpa only [boundaryCleanupTagSteps, HaltCleanup.cleanupTagSteps,
        ctsPeriod, bridge.word_eq] using
        HaltCleanup.certified_nonempty_during_residue_cleanup
          bridge.certificate steps hsteps
  · rintro ⟨bridge, endpoint, nonempty⟩
    exact (cleanupBridge_iff_halted form config).1 ⟨bridge⟩

/-! ## Exact complete-sweep semantics (P0a--P0b) -/

/-- Letters selected at offsets `0,8,16,...` of one old sweep. -/
def selectedEveryEight : List TagSymbol → List TagSymbol
  | first :: _ :: _ :: _ :: _ :: _ :: _ :: _ :: rest =>
      first :: selectedEveryEight rest
  | _ => []

/-- The final old suffix of length strictly below eight. -/
def sweepRemainder : List TagSymbol → List TagSymbol
  | _ :: _ :: _ :: _ :: _ :: _ :: _ :: _ :: rest =>
      sweepRemainder rest
  | rest => rest

/-- Number of complete old eight-symbol blocks. -/
def sweepBlockCount : List TagSymbol → Nat
  | _ :: _ :: _ :: _ :: _ :: _ :: _ :: _ :: rest =>
      sweepBlockCount rest + 1
  | _ => 0

/-- Chronological payload selected during one complete old sweep. -/
def sweepPayload (word : List TagSymbol) : List TagSymbol :=
  (selectedEveryEight word).flatMap production

/-- Structural certificate for a complete sweep with an already appended
payload.  Its recursive constructor is exactly P0a. -/
inductive SweepFrom :
    List TagSymbol → List TagSymbol → Nat → List TagSymbol → Prop where
  | done {old payload : List TagSymbol} (hshort : old.length < 8) :
      SweepFrom old payload 0 (old ++ payload)
  | step {first second third fourth fifth sixth seventh eighth : TagSymbol}
      {rest payload target : List TagSymbol} {steps : Nat} :
      SweepFrom rest (payload ++ production first) steps target →
      SweepFrom
        (first :: second :: third :: fourth :: fifth :: sixth :: seventh ::
          eighth :: rest)
        payload (steps + 1) target

namespace SweepFrom

/-- Every complete-sweep certificate is an actual exactly counted deletion-8
tag trajectory. -/
theorem toTagStepsN {old payload target : List TagSymbol} {steps : Nat}
    (trace : SweepFrom old payload steps target) :
    HaltCleanup.TagStepsN steps (old ++ payload) target := by
  induction trace with
  | done hshort => exact .zero _
  | @step first second third fourth fifth sixth seventh eighth rest payload
      target steps trace ih =>
      have hone : HaltCleanup.TagStep
          ((first :: second :: third :: fourth :: fifth :: sixth :: seventh ::
            eighth :: rest) ++ payload)
          (rest ++ (payload ++ production first)) := by
        unfold HaltCleanup.TagStep
        simp only [List.cons_append, Macroperiod.tagStep?_eight,
          List.append_assoc]
      exact .succ hone ih

/-- The step count in every complete-sweep certificate is exactly
`floor(length/8)`. -/
theorem steps_eq_div {old payload target : List TagSymbol} {steps : Nat}
    (trace : SweepFrom old payload steps target) :
    steps = old.length / 8 := by
  induction trace with
  | done hshort =>
      rw [Nat.div_eq_of_lt hshort]
  | @step first second third fourth fifth sixth seventh eighth rest payload
      target steps trace ih =>
      simp only [List.length_cons]
      rw [Nat.add_mul_div_left rest.length 1 (by decide : 0 < 8)]
      exact congrArg (fun value => value + 1) ih

end SweepFrom

/-- Explicit P0b target, retaining the old suffix and chronological payload. -/
theorem complete_sweep_exact :
    ∀ old payload,
      SweepFrom old payload (sweepBlockCount old)
        (sweepRemainder old ++ payload ++ sweepPayload old)
  | [], payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done (old := []) (payload := payload) (by decide))
  | first :: [], payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done (old := [first]) (payload := payload)
          (by simp only [List.length_cons, List.length_nil]; decide))
  | first :: second :: [], payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done (old := [first, second]) (payload := payload)
          (by simp only [List.length_cons, List.length_nil]; decide))
  | first :: second :: third :: [], payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done (old := [first, second, third]) (payload := payload)
          (by simp only [List.length_cons, List.length_nil]; decide))
  | first :: second :: third :: fourth :: [], payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done (old := [first, second, third, fourth])
          (payload := payload)
          (by simp only [List.length_cons, List.length_nil]; decide))
  | first :: second :: third :: fourth :: fifth :: [], payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done (old := [first, second, third, fourth, fifth])
          (payload := payload)
          (by simp only [List.length_cons, List.length_nil]; decide))
  | first :: second :: third :: fourth :: fifth :: sixth :: [], payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done
          (old := [first, second, third, fourth, fifth, sixth])
          (payload := payload)
          (by simp only [List.length_cons, List.length_nil]; decide))
  | first :: second :: third :: fourth :: fifth :: sixth :: seventh :: [],
      payload => by
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_nil, List.nil_append,
        List.append_nil] using
        (SweepFrom.done
          (old := [first, second, third, fourth, fifth, sixth, seventh])
          (payload := payload)
          (by simp only [List.length_cons, List.length_nil]; decide))
  | first :: second :: third :: fourth :: fifth :: sixth :: seventh ::
      eighth :: rest, payload => by
      have ih := complete_sweep_exact rest (payload ++ production first)
      simpa only [sweepBlockCount, sweepRemainder, sweepPayload,
        selectedEveryEight, List.flatMap_cons, List.append_assoc] using
        (SweepFrom.step ih)

/-- Executable P0b equality as an exactly counted tag trajectory. -/
theorem complete_sweep_exact_tagSteps (word : List TagSymbol) :
    HaltCleanup.TagStepsN (word.length / 8) word
      (sweepRemainder word ++ sweepPayload word) := by
  have trace := complete_sweep_exact word []
  have hcount := trace.steps_eq_div
  rw [← hcount]
  simpa only [List.append_nil] using trace.toTagStepsN

/-- P0b as a kernel-checked existence theorem: exactly `floor(m/8)` tag
steps execute one complete sweep of the original `m`-symbol word. -/
theorem complete_sweep_reaches (word : List TagSymbol) :
    ∃ target,
      HaltCleanup.TagStepsN (word.length / 8) word target :=
  ⟨sweepRemainder word ++ sweepPayload word,
    complete_sweep_exact_tagSteps word⟩

/-! ## The arbitrary-radix one-run calculation (P0c--P0e) -/

/-- Bounded radix-eight offsets and digits. -/
inductive Octal where
  | d0 | d1 | d2 | d3 | d4 | d5 | d6 | d7
  deriving DecidableEq, Repr

namespace Octal

def val : Octal → Nat
  | .d0 => 0 | .d1 => 1 | .d2 => 2 | .d3 => 3
  | .d4 => 4 | .d5 => 5 | .d6 => 6 | .d7 => 7

/-- Least selected position in a run beginning at this entry offset. -/
def firstGap : Octal → Nat
  | .d0 => 0 | .d1 => 7 | .d2 => 6 | .d3 => 5
  | .d4 => 4 | .d5 => 3 | .d6 => 2 | .d7 => 1

theorem val_lt_eight (digit : Octal) : digit.val < 8 := by
  cases digit <;> decide

theorem firstGap_lt_eight (offset : Octal) : offset.firstGap < 8 := by
  cases offset <;> decide

end Octal

/-- P0c specialized to the bounded entry offset of one run. -/
def selectedCount (offset : Octal) (length : Nat) : Nat :=
  (offset.val + length + 7) / 8 - (offset.val + 7) / 8

private theorem two_add_sub_one (higher : Nat) :
    2 + higher - 1 = higher + 1 := by
  have htwo : 2 + higher = 1 + (higher + 1) := by
    change (1 + 1) + higher = 1 + (higher + 1)
    rw [Nat.add_assoc, Nat.add_comm 1 higher]
  rw [htwo, Nat.add_sub_cancel_left]

/-- P0e: an arbitrary exponent contributes its quotient plus one bounded
carry determined solely by its low digit and entry offset. -/
theorem selectedCount_digit_decomposition
    (offset digit : Octal) (higher : Nat) :
    selectedCount offset (digit.val + 8 * higher) =
      higher + if offset.firstGap < digit.val then 1 else 0 := by
  unfold selectedCount
  rw [show offset.val + (digit.val + 8 * higher) + 7 =
      (offset.val + digit.val + 7) + 8 * higher by
    calc
      offset.val + (digit.val + 8 * higher) + 7 =
          (offset.val + digit.val) + 8 * higher + 7 := by
        rw [← Nat.add_assoc offset.val digit.val (8 * higher)]
      _ = 8 * higher + (offset.val + digit.val) + 7 := by
        rw [Nat.add_comm (offset.val + digit.val) (8 * higher)]
      _ = (offset.val + digit.val) + 7 + 8 * higher := by
        rw [Nat.add_comm (8 * higher) (offset.val + digit.val),
          Nat.add_assoc, Nat.add_comm (8 * higher) 7,
          ← Nat.add_assoc]]
  rw [Nat.mul_comm 8 higher,
    Nat.add_mul_div_right (offset.val + digit.val + 7) higher
      (by decide : 0 < 8)]
  cases offset <;> cases digit <;>
    simp only [Octal.val, Octal.firstGap] <;> simp
  all_goals first
    | exact Nat.add_sub_cancel_left 1 higher
    | exact Nat.add_comm 1 higher
    | exact two_add_sub_one higher

/-! ## Multi-sweep boundary specification -/

/-- Relational domain of the history-free arrival-only decoder. -/
def ArrivalReadable (word : List TagSymbol) : Prop :=
  ∃ direction origin config,
    word = arrivalWord direction origin config

/-- A positive operational arrival with no earlier readable arrival. -/
structure FirstArrival (source : MachineConfig)
    (endpoint : List TagSymbol) where
  steps : Nat
  steps_pos : 0 < steps
  reaches : HaltCleanup.TagStepsN steps (canonicalWord source) endpoint
  readable : ArrivalReadable endpoint
  first : ∀ {earlier : Nat} {word : List TagSymbol},
    0 < earlier → earlier < steps →
    HaltCleanup.TagStepsN earlier (canonicalWord source) word →
    ¬ ArrivalReadable word

/-- The exact all-input next-boundary proposition generated by one reflected
nonhalting table command.  Its endpoint and decoder classification are fully
defined above; proving this proposition for every source is the powered-block
family-control induction, not a finite table lookup. -/
def ExpectedFirstArrival (source : MachineConfig) : Prop :=
  match Rogozhin46.transition source.state source.current with
  | .halt => True
  | .step next written direction =>
      Nonempty
        (FirstArrival source (expectedEndpoint source next written direction))

/-- Once the operational first-arrival witness is supplied, its value,
direction, and nonstuttering property are forced by the kernel-checked codec
and endpoint arithmetic. -/
theorem firstArrival_expected_classification
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction)
    (witness : FirstArrival source
      (expectedEndpoint source next written direction)) :
    ∃ steps,
      0 < steps ∧
      HaltCleanup.TagStepsN steps (canonicalWord source)
        (expectedEndpoint source next written direction) ∧
      expectedEndpoint source next written direction =
        arrivalWord (endpointDirection direction)
          (match direction with
           | .left => leftOrigin source
           | .right => rightOrigin source)
          (Rogozhin46.applyTransition source next written direction) ∧
      Rogozhin46.applyTransition source next written direction ≠ source := by
  cases direction with
  | left =>
      have hclassified := table_command_endpoint source next written .left hcommand
      exact ⟨witness.steps, witness.steps_pos, witness.reaches,
        hclassified.2.1, hclassified.2.2⟩
  | right =>
      have hclassified := table_command_endpoint source next written .right hcommand
      exact ⟨witness.steps, witness.steps_pos, witness.reaches,
        hclassified.2.1, hclassified.2.2⟩

/-! ## Exact powered-block pass induction -/

/-- A rotated run of equal symbols: the first block is shortened by the
bounded current-symbol offset and every later block has length eight. -/
def rotatedWord (current : MachineSymbol) : List TagSymbol → List TagSymbol
  | [] => []
  | first :: rest =>
      List.replicate (8 - machineSymbolValue current) first ++
        rest.flatMap (List.replicate 8)

theorem rotatedWord_step (current : MachineSymbol)
    (first second : TagSymbol) (rest payload : List TagSymbol) :
    HaltCleanup.TagStep
      (rotatedWord current (first :: second :: rest) ++ payload)
      (rotatedWord current (second :: rest) ++ payload ++ production first) := by
  cases current <;>
    simp [rotatedWord, HaltCleanup.TagStep, Macroperiod.tagStep?_eight,
      machineSymbolValue, List.append_assoc]

theorem rotatedWord_single_step (current : MachineSymbol)
    (first : TagSymbol) (payload : List TagSymbol)
    (hlength : machineSymbolValue current ≤ payload.length) :
    HaltCleanup.TagStep
      (rotatedWord current [first] ++ payload)
      (payload.drop (machineSymbolValue current) ++ production first) := by
  cases current with
  | s0 =>
      simp [rotatedWord, machineSymbolValue, HaltCleanup.TagStep,
        Macroperiod.tagStep?_eight]
  | s1 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a rest =>
          simp [rotatedWord, machineSymbolValue, HaltCleanup.TagStep,
            Macroperiod.tagStep?_eight]
  | s2 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b rest =>
              simp [rotatedWord, machineSymbolValue, HaltCleanup.TagStep,
                Macroperiod.tagStep?_eight]
  | s3 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c rest =>
                  simp [rotatedWord, machineSymbolValue, HaltCleanup.TagStep,
                    Macroperiod.tagStep?_eight]
  | s4 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c payload =>
                  cases payload with
                  | nil => simp [machineSymbolValue] at hlength
                  | cons d rest =>
                      simp [rotatedWord, machineSymbolValue,
                        HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | s5 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c payload =>
                  cases payload with
                  | nil => simp [machineSymbolValue] at hlength
                  | cons d payload =>
                      cases payload with
                      | nil => simp [machineSymbolValue] at hlength
                      | cons e rest =>
                          simp [rotatedWord, machineSymbolValue,
                            HaltCleanup.TagStep,
                            Macroperiod.tagStep?_eight]

/-- Constructive drop-through-append lemma used instead of the library
version whose current implementation has a forbidden quotient dependency. -/
theorem drop_append_of_le_length_clean {left right : List α} {count : Nat}
    (hlength : count ≤ left.length) :
    (left ++ right).drop count = left.drop count ++ right := by
  induction count generalizing left with
  | zero => rfl
  | succ count ih =>
      cases left with
      | nil => exact (Nat.not_succ_le_zero count hlength).elim
      | cons first rest =>
          simp only [List.length_cons] at hlength
          simp only [List.cons_append, List.drop_succ_cons]
          exact ih (Nat.le_of_succ_le_succ hlength)

theorem rotatedWord_scan_aux (current : MachineSymbol) :
    ∀ (symbols : List TagSymbol) (payload : List TagSymbol),
      symbols ≠ [] →
      machineSymbolValue current ≤ payload.length →
      HaltCleanup.TagStepsN symbols.length
        (rotatedWord current symbols ++ payload)
        (payload.drop (machineSymbolValue current) ++
          symbols.flatMap production)
  | [], payload, hnonempty, hlength => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength => by
      have hone := rotatedWord_single_step current first payload hlength
      have hchain := HaltCleanup.TagStepsN.succ hone
        (HaltCleanup.TagStepsN.zero
          (payload.drop (machineSymbolValue current) ++ production first))
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using hchain
  | first :: second :: rest, payload, hnonempty, hlength => by
      have hone := rotatedWord_step current first second rest payload
      have hlength' : machineSymbolValue current ≤
          (payload ++ production first).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length (production first).length)
      have hrest := rotatedWord_scan_aux current (second :: rest)
        (payload ++ production first) (List.cons_ne_nil second rest) hlength'
      have hrest' : HaltCleanup.TagStepsN (second :: rest).length
          ((rotatedWord current (second :: rest) ++ payload) ++ production first)
          ((payload ++ production first).drop (machineSymbolValue current) ++
            (second :: rest).flatMap production) := by
        simpa only [List.append_assoc] using hrest
      have hchain := HaltCleanup.TagStepsN.succ hone hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength, List.append_assoc] using hchain

theorem rotatedWord_scan (current : MachineSymbol)
    (first second : TagSymbol) (rest : List TagSymbol)
    (hproduction : (production first).length = 8) :
    HaltCleanup.TagStepsN (first :: second :: rest).length
      (rotatedWord current (first :: second :: rest))
      ((production first).drop (machineSymbolValue current) ++
        (second :: rest).flatMap production) := by
  have hone := rotatedWord_step current first second rest []
  have hvalue : machineSymbolValue current ≤ 8 :=
    Nat.le_trans (machineSymbolValue_le_five current) (by decide)
  have hpayload : machineSymbolValue current ≤
      (production first).length := by
    rw [hproduction]
    exact hvalue
  have hrest := rotatedWord_scan_aux current (second :: rest)
    (production first) (List.cons_ne_nil second rest) hpayload
  have hrest' : HaltCleanup.TagStepsN (second :: rest).length
      (rotatedWord current (second :: rest) ++ [] ++ production first)
      ((production first).drop (machineSymbolValue current) ++
        (second :: rest).flatMap production) := by
    simpa only [List.append_nil] using hrest
  have hchain := HaltCleanup.TagStepsN.succ hone hrest'
  simpa only [List.length_cons, List.append_nil] using hchain

def generationSymbols (config : MachineConfig) : List TagSymbol :=
  .head config.state ::
    List.replicate (leftUnits config.left) (.left config.state) ++
    List.replicate (rightUnits config.right) (.right config.state)

theorem rotatedWord_generationSymbols (config : MachineConfig) :
    rotatedWord config.current (generationSymbols config) =
      canonicalWord config := by
  cases config with
  | mk state current left right =>
      unfold generationSymbols canonicalWord canonicalCounts runWord
      simp only [Rogozhin46.Config.state, Rogozhin46.Config.current,
        Rogozhin46.Config.left, Rogozhin46.Config.right,
        RunCounts.head, RunCounts.left, RunCounts.right,
        leftCounter_eq_radix_mul_units,
        rightCounter_eq_radix_mul_units]
      change
        List.replicate (8 - machineSymbolValue current) (TagSymbol.head state) ++
          (List.replicate (leftUnits left) (TagSymbol.left state) ++
            List.replicate (rightUnits right) (TagSymbol.right state)).flatMap
              (List.replicate 8) =
        List.replicate (8 - machineSymbolValue current) (TagSymbol.head state) ++
          List.replicate (8 * leftUnits left) (TagSymbol.left state) ++
          List.replicate (8 * rightUnits right) (TagSymbol.right state)
      simp only [canonicalCounts, runWord, List.flatMap_replicate,
        List.flatMap_append, List.flatMap_replicate]
      rw [List.flatten_replicate_replicate,
        List.flatten_replicate_replicate]
      rw [Nat.mul_comm (leftUnits left) 8,
        Nat.mul_comm (rightUnits right) 8]
      rw [List.append_assoc]

/-- One-based Cook index selected by the current machine symbol. -/
def selectedIndex : MachineSymbol → Index
  | .s0 => .j1
  | .s1 => .j2
  | .s2 => .j3
  | .s3 => .j4
  | .s4 => .j5
  | .s5 => .j6

def indexedRow (family : Family) (state : MachineState) : List TagSymbol :=
  indices.map fun index => .indexed family state index

/-- Rotated sequence of complete indexed rows. -/
def indexedRowsWord (current : MachineSymbol) (state : MachineState) :
    List Family → List TagSymbol
  | [] => []
  | first :: rest =>
      (indexedRow first state).drop (machineSymbolValue current) ++
        rest.flatMap fun family => indexedRow family state

theorem indexedRowsWord_step (current : MachineSymbol) (state : MachineState)
    (first second : Family) (rest : List Family) (payload : List TagSymbol) :
    HaltCleanup.TagStep
      (indexedRowsWord current state (first :: second :: rest) ++ payload)
      (indexedRowsWord current state (second :: rest) ++ payload ++
        production (.indexed first state (selectedIndex current))) := by
  cases current <;>
    simp [indexedRowsWord, indexedRow, indices, selectedIndex,
      machineSymbolValue,
      HaltCleanup.TagStep, Macroperiod.tagStep?_eight, List.append_assoc]

theorem indexedRowsWord_single_step (current : MachineSymbol)
    (state : MachineState) (first : Family) (payload : List TagSymbol)
    (hlength : machineSymbolValue current ≤ payload.length) :
    HaltCleanup.TagStep
      (indexedRowsWord current state [first] ++ payload)
      (payload.drop (machineSymbolValue current) ++
        production (.indexed first state (selectedIndex current))) := by
  cases current with
  | s0 =>
      simp [indexedRowsWord, indexedRow, indices, selectedIndex,
        machineSymbolValue, HaltCleanup.TagStep,
        Macroperiod.tagStep?_eight]
  | s1 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a rest =>
          simp [indexedRowsWord, indexedRow, indices, selectedIndex,
            machineSymbolValue, HaltCleanup.TagStep,
            Macroperiod.tagStep?_eight]
  | s2 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b rest =>
              simp [indexedRowsWord, indexedRow, indices, selectedIndex,
                machineSymbolValue, HaltCleanup.TagStep,
                Macroperiod.tagStep?_eight]
  | s3 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c rest =>
                  simp [indexedRowsWord, indexedRow, indices, selectedIndex,
                    machineSymbolValue, HaltCleanup.TagStep,
                    Macroperiod.tagStep?_eight]
  | s4 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c payload =>
                  cases payload with
                  | nil => simp [machineSymbolValue] at hlength
                  | cons d rest =>
                      simp [indexedRowsWord, indexedRow, indices,
                        selectedIndex, machineSymbolValue,
                        HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | s5 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c payload =>
                  cases payload with
                  | nil => simp [machineSymbolValue] at hlength
                  | cons d payload =>
                      cases payload with
                      | nil => simp [machineSymbolValue] at hlength
                      | cons e rest =>
                          simp [indexedRowsWord, indexedRow, indices,
                            selectedIndex, machineSymbolValue,
                            HaltCleanup.TagStep,
                            Macroperiod.tagStep?_eight]

theorem indexedRowsWord_scan_aux (current : MachineSymbol)
    (state : MachineState) :
    ∀ (families : List Family) (payload : List TagSymbol),
      families ≠ [] →
      machineSymbolValue current ≤ payload.length →
      HaltCleanup.TagStepsN families.length
        (indexedRowsWord current state families ++ payload)
        (payload.drop (machineSymbolValue current) ++
          families.flatMap fun family =>
            production (.indexed family state (selectedIndex current)))
  | [], payload, hnonempty, hlength => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength => by
      have hone := indexedRowsWord_single_step current state first payload hlength
      have hchain := HaltCleanup.TagStepsN.succ hone
        (HaltCleanup.TagStepsN.zero
          (payload.drop (machineSymbolValue current) ++
            production (.indexed first state (selectedIndex current))))
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using hchain
  | first :: second :: rest, payload, hnonempty, hlength => by
      have hone := indexedRowsWord_step current state first second rest payload
      have hlength' : machineSymbolValue current ≤
          (payload ++ production
            (.indexed first state (selectedIndex current))).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length
            (production (.indexed first state (selectedIndex current))).length)
      have hrest := indexedRowsWord_scan_aux current state (second :: rest)
        (payload ++ production (.indexed first state (selectedIndex current)))
        (List.cons_ne_nil second rest) hlength'
      have hrest' : HaltCleanup.TagStepsN (second :: rest).length
          ((indexedRowsWord current state (second :: rest) ++ payload) ++
            production (.indexed first state (selectedIndex current)))
          ((payload ++ production
              (.indexed first state (selectedIndex current))).drop
                (machineSymbolValue current) ++
            (second :: rest).flatMap fun family =>
              production (.indexed family state (selectedIndex current))) := by
        simpa only [List.append_assoc] using hrest
      have hchain := HaltCleanup.TagStepsN.succ hone hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hchain

def generationFamilies (config : MachineConfig) : List Family :=
  .H :: List.replicate (leftUnits config.left) .L ++
    List.replicate (rightUnits config.right) .R

def unindexedSymbol (state : MachineState) : Family → TagSymbol
  | .H => .head state
  | .L => .left state
  | .R => .right state

theorem generationSymbols_eq_map (config : MachineConfig) :
    generationSymbols config =
      (generationFamilies config).map (unindexedSymbol config.state) := by
  cases config with
  | mk state current left right =>
      simp [generationSymbols, generationFamilies, unindexedSymbol,
        List.map_append]

theorem first_generation_target (config : MachineConfig) :
    (production (.head config.state)).drop
          (machineSymbolValue config.current) ++
        ((generationFamilies config).tail).flatMap (fun family =>
          production (unindexedSymbol config.state family)) =
      indexedRowsWord config.current config.state
        (generationFamilies config) := by
  cases config with
  | mk state current left right =>
      simp [generationFamilies, indexedRowsWord, indexedRow,
        unindexedSymbol, List.flatMap_append,
        List.flatMap_replicate]

theorem canonical_to_indexed_rows (config : MachineConfig) :
    HaltCleanup.TagStepsN (generationFamilies config).length
      (canonicalWord config)
      (indexedRowsWord config.current config.state
        (generationFamilies config)) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      let restFamilies : List Family :=
        List.replicate count .L ++
          List.replicate (rightUnits config.right) .R
      have hfamilies : generationFamilies config = .H :: .L :: restFamilies := by
        rw [generationFamilies, hcount, List.replicate_succ]
        simp only [restFamilies, List.cons_append]
      have hsymbols : generationSymbols config =
          .head config.state :: .left config.state ::
            restFamilies.map (unindexedSymbol config.state) := by
        rw [generationSymbols_eq_map, hfamilies]
        rfl
      have hheadLength : (production (.head config.state)).length = 8 := by
        simp only [production_head, List.length_map, indices_length]
      have trace := rotatedWord_scan config.current
        (.head config.state) (.left config.state)
        (restFamilies.map (unindexedSymbol config.state)) hheadLength
      rw [← hsymbols, rotatedWord_generationSymbols config] at trace
      have htarget := first_generation_target config
      rw [hfamilies] at htarget
      rw [hfamilies]
      rw [← htarget]
      simpa only [hsymbols, List.length_map, List.tail_cons,
        List.flatMap_map, Function.comp_apply, unindexedSymbol,
        List.flatMap_cons, List.length_cons] using trace

theorem indexedRowsWord_scan_of_le (current : MachineSymbol)
    (state : MachineState) (first second : Family) (rest : List Family)
    (hproduction : machineSymbolValue current ≤
      (production (.indexed first state (selectedIndex current))).length) :
    HaltCleanup.TagStepsN (first :: second :: rest).length
      (indexedRowsWord current state (first :: second :: rest))
      ((production (.indexed first state (selectedIndex current))).drop
          (machineSymbolValue current) ++
        (second :: rest).flatMap fun family =>
          production (.indexed family state (selectedIndex current))) := by
  have hone := indexedRowsWord_step current state first second rest []
  have hrest := indexedRowsWord_scan_aux current state (second :: rest)
    (production (.indexed first state (selectedIndex current)))
    (List.cons_ne_nil second rest) hproduction
  have hrest' : HaltCleanup.TagStepsN (second :: rest).length
      (indexedRowsWord current state (second :: rest) ++ [] ++
        production (.indexed first state (selectedIndex current)))
      ((production (.indexed first state (selectedIndex current))).drop
          (machineSymbolValue current) ++
        (second :: rest).flatMap fun family =>
          production (.indexed family state (selectedIndex current))) := by
    simpa only [List.append_nil] using hrest
  have hchain := HaltCleanup.TagStepsN.succ hone hrest'
  simpa only [List.length_cons, List.append_nil] using hchain

theorem selectedIndexed_eq_machineProduction (family : Family)
    (state : MachineState) (current : MachineSymbol) :
    production (.indexed family state (selectedIndex current)) =
      machineProduction family state (machineSymbolValue current + 1)
        current := by
  cases current <;> rfl

theorem selectedHeadProduction_long_enough
    (state next : MachineState) (current written : MachineSymbol)
    (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition state current =
      .step next written direction) :
    machineSymbolValue current ≤
      (production (.indexed .H state (selectedIndex current))).length := by
  rw [selectedIndexed_eq_machineProduction]
  simp only [machineProduction, hcommand]
  cases direction <;> cases current <;> cases written <;>
    simp [shiftExponent, machineSymbolBar, machineSymbolValue]

def selectedProductionWord (config : MachineConfig) : List TagSymbol :=
  (production (.indexed .H config.state
      (selectedIndex config.current))).drop
        (machineSymbolValue config.current) ++
    ((generationFamilies config).tail).flatMap fun family =>
      production (.indexed family config.state
        (selectedIndex config.current))

theorem indexed_rows_to_selected_productions
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    HaltCleanup.TagStepsN (generationFamilies source).length
      (indexedRowsWord source.current source.state
        (generationFamilies source))
      (selectedProductionWord source) := by
  have hpos := leftUnits_pos source.left
  cases hcount : leftUnits source.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      let restFamilies : List Family :=
        List.replicate count .L ++
          List.replicate (rightUnits source.right) .R
      have hfamilies : generationFamilies source = .H :: .L :: restFamilies := by
        rw [generationFamilies, hcount, List.replicate_succ]
        simp only [restFamilies, List.cons_append]
      have hlong := selectedHeadProduction_long_enough source.state next
        source.current written direction hcommand
      have trace := indexedRowsWord_scan_of_le source.current source.state
        .H .L restFamilies hlong
      rw [hfamilies]
      rw [selectedProductionWord, hfamilies]
      simpa only [List.tail_cons] using trace

/-- Intermediate left-moving output before the final right-star cleanup. -/
def leftPrecleanupWord (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) : List TagSymbol :=
  List.replicate
      (shiftExponent written - machineSymbolValue source.current)
      (.rightStar next) ++
    List.replicate (machineSymbolValue source.current + 1) (.head next) ++
    List.replicate (leftUnits source.left) (.left next) ++
    List.replicate (rightUnits source.right * 64) (.right next)

theorem replicate_add_clean (left right : Nat) (value : α) :
    List.replicate (left + right) value =
      List.replicate left value ++ List.replicate right value := by
  induction left with
  | zero => simp only [Nat.zero_add, List.replicate_zero, List.nil_append]
  | succ left ih =>
      rw [Nat.succ_add, List.replicate_succ, List.replicate_succ,
        List.cons_append, ih]

theorem rightCounter_div_eq_units (side : List MachineSymbol) :
    rightCounter side / 8 = rightUnits side := by
  simpa only [rightUnits] using rightCounter_div_radix side

theorem leftCounter_div_eq_units (side : List MachineSymbol) :
    leftCounter side / 8 = leftUnits side := by
  simpa only [leftUnits] using leftCounter_div_radix side

theorem sixtyfour_mul (value : Nat) :
    64 * value = 8 * (8 * value) := by
  rw [show 64 = 8 * 8 by rfl, Nat.mul_assoc]

theorem selectedHeadPayload_directional
    (state next : MachineState) (current written : MachineSymbol)
    (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition state current =
      .step next written direction) :
    (production (.indexed .H state (selectedIndex current))).drop
        (machineSymbolValue current) =
      match direction with
      | .left =>
          List.replicate
              (shiftExponent written - machineSymbolValue current)
              (.rightStar next) ++
            List.replicate (machineSymbolValue current + 1) (.head next)
      | .right =>
          [.head next] ++
            List.replicate (shiftExponent written) (.left next) := by
  rw [selectedIndexed_eq_machineProduction]
  simp only [machineProduction, hcommand]
  cases direction <;> cases current <;> cases written <;>
    simp [shiftExponent, machineSymbolBar, machineSymbolValue]

theorem selectedLeftPayload_directional
    (state next : MachineState) (current written : MachineSymbol)
    (direction : Rogozhin46.Direction) (count : Nat)
    (hcommand : Rogozhin46.transition state current =
      .step next written direction) :
    (List.replicate count .L).flatMap (fun family =>
      production (.indexed family state (selectedIndex current))) =
      match direction with
      | .left => List.replicate count (.left next)
      | .right => List.replicate (count * 64) (.left next) := by
  rw [List.flatMap_replicate, selectedIndexed_eq_machineProduction]
  simp only [machineProduction, hcommand]
  cases direction with
  | left =>
      change (List.replicate count
        (List.replicate 1 (TagSymbol.left next))).flatten = _
      rw [List.flatten_replicate_replicate, Nat.mul_one]
  | right =>
      rw [List.flatten_replicate_replicate]

theorem selectedRightPayload_directional
    (state next : MachineState) (current written : MachineSymbol)
    (direction : Rogozhin46.Direction) (count : Nat)
    (hcommand : Rogozhin46.transition state current =
      .step next written direction) :
    (List.replicate count .R).flatMap (fun family =>
      production (.indexed family state (selectedIndex current))) =
      match direction with
      | .left => List.replicate (count * 64) (.right next)
      | .right => List.replicate count (.right next) := by
  rw [List.flatMap_replicate, selectedIndexed_eq_machineProduction]
  simp only [machineProduction, hcommand]
  cases direction with
  | left =>
      rw [List.flatten_replicate_replicate]
  | right =>
      change (List.replicate count
        (List.replicate 1 (TagSymbol.right next))).flatten = _
      rw [List.flatten_replicate_replicate, Nat.mul_one]

theorem selectedProductionWord_directional
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    selectedProductionWord source =
      match direction with
      | .left => leftPrecleanupWord source next written
      | .right => rightEndpointWord source next written := by
  cases source with
  | mk state current left right =>
      simp only [selectedProductionWord, generationFamilies,
        Rogozhin46.Config.state, Rogozhin46.Config.current,
        Rogozhin46.Config.left, Rogozhin46.Config.right]
      have htailExpanded :
          (Family.H :: List.replicate (leftUnits left) Family.L ++
            List.replicate (rightUnits right) Family.R).tail =
              List.replicate (leftUnits left) Family.L ++
                List.replicate (rightUnits right) Family.R := rfl
      rw [htailExpanded, List.flatMap_append]
      rw [selectedHeadPayload_directional state next current written
          direction hcommand,
        selectedLeftPayload_directional state next current written
          direction (leftUnits left) hcommand,
        selectedRightPayload_directional state next current written
          direction (rightUnits right) hcommand]
      cases direction with
      | left =>
          simp only [leftPrecleanupWord, Rogozhin46.Config.current,
            Rogozhin46.Config.left, Rogozhin46.Config.right,
            List.append_assoc]
      | right =>
          unfold rightEndpointWord rightEndpointCounts runWord
          simp only [Rogozhin46.Config.current, Rogozhin46.Config.left,
            Rogozhin46.Config.right, rightCounter_div_eq_units,
            leftCounter_eq_radix_mul_units, digitWeight]
          rw [show [TagSymbol.head next] =
              List.replicate 1 (TagSymbol.head next) by rfl]
          rw [List.append_assoc
            (List.replicate 1 (TagSymbol.head next))
            (List.replicate (shiftExponent written) (TagSymbol.left next))
            (List.replicate (leftUnits left * 64) (TagSymbol.left next) ++
              List.replicate (rightUnits right) (TagSymbol.right next))]
          rw [← List.append_assoc
            (List.replicate (shiftExponent written) (TagSymbol.left next))
            (List.replicate (leftUnits left * 64) (TagSymbol.left next))
            (List.replicate (rightUnits right) (TagSymbol.right next))]
          rw [← replicate_add_clean]
          have hexponent :
              shiftExponent written + leftUnits left * 64 =
                8 * (8 * leftUnits left +
                  (7 - machineSymbolValue written)) := by
            cases written <;>
              simp [shiftExponent, machineSymbolBar, machineSymbolValue,
                Nat.mul_add, Nat.add_comm, Nat.add_left_comm,
                Nat.add_assoc, Nat.mul_comm, sixtyfour_mul]
          rw [hexponent, List.append_assoc]

def leftCleanupPayload (source : MachineConfig) (next : MachineState) :
    List TagSymbol :=
  List.replicate (machineSymbolValue source.current + 1) (.head next) ++
    List.replicate (leftUnits source.left) (.left next) ++
    List.replicate (rightUnits source.right * 64) (.right next)

theorem leftPrecleanup_eq_rotated
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) :
    leftPrecleanupWord source next written =
      rotatedWord source.current
          (List.replicate (digitWeight written) (.rightStar next)) ++
        leftCleanupPayload source next := by
  cases source with
  | mk state current left right =>
      cases current <;> cases written <;>
        simp [leftPrecleanupWord, leftCleanupPayload, rotatedWord,
          digitWeight, shiftExponent, machineSymbolBar,
          machineSymbolValue, List.append_assoc]

theorem leftCleanupPayload_drop (source : MachineConfig)
    (next : MachineState) :
    (leftCleanupPayload source next).drop
        (machineSymbolValue source.current) =
      [.head next] ++
        List.replicate (leftUnits source.left) (.left next) ++
        List.replicate (rightUnits source.right * 64) (.right next) := by
  cases source with
  | mk state current left right =>
      cases current <;>
        simp [leftCleanupPayload, machineSymbolValue, List.append_assoc]

theorem rightStar_replicate_payload (count : Nat) (state : MachineState) :
    (List.replicate count (.rightStar state)).flatMap production =
      List.replicate (count * 8) (.right state) := by
  rw [List.flatMap_replicate, production_rightStar,
    List.flatten_replicate_replicate]

theorem left_cleanup_target (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) :
    (leftCleanupPayload source next).drop
          (machineSymbolValue source.current) ++
        (List.replicate (digitWeight written) (.rightStar next)).flatMap
          production =
      leftEndpointWord source next written := by
  rw [leftCleanupPayload_drop, rightStar_replicate_payload]
  unfold leftEndpointWord leftEndpointCounts runWord
  simp only [leftCounter_div_eq_units, rightCounter_eq_radix_mul_units,
    Rogozhin46.Config.left, Rogozhin46.Config.right]
  rw [show [TagSymbol.head next] =
      List.replicate 1 (TagSymbol.head next) by rfl]
  rw [List.append_assoc
    (List.replicate 1 (TagSymbol.head next))
    (List.replicate (leftUnits source.left) (TagSymbol.left next))
    (List.replicate (rightUnits source.right * 64) (TagSymbol.right next))]
  rw [List.append_assoc
    (List.replicate 1 (TagSymbol.head next))
    (List.replicate (leftUnits source.left) (TagSymbol.left next) ++
      List.replicate (rightUnits source.right * 64) (TagSymbol.right next))
    (List.replicate (digitWeight written * 8) (TagSymbol.right next))]
  rw [List.append_assoc
    (List.replicate (leftUnits source.left) (TagSymbol.left next))
    (List.replicate (rightUnits source.right * 64) (TagSymbol.right next))
    (List.replicate (digitWeight written * 8) (TagSymbol.right next))]
  rw [← replicate_add_clean]
  have hexponent :
      rightUnits source.right * 64 + digitWeight written * 8 =
        8 * (digitWeight written + 8 * rightUnits source.right) := by
    cases written <;>
      simp [digitWeight, machineSymbolValue, sixtyfour_mul,
        Nat.mul_add, Nat.add_comm, Nat.add_left_comm,
        Nat.add_assoc, Nat.mul_comm]
  rw [hexponent, List.append_assoc]

theorem left_precleanup_to_endpoint
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) :
    HaltCleanup.TagStepsN (digitWeight written)
      (leftPrecleanupWord source next written)
      (leftEndpointWord source next written) := by
  have hnonempty :
      List.replicate (digitWeight written) (TagSymbol.rightStar next) ≠ [] := by
    intro hempty
    have hlength := congrArg List.length hempty
    simp only [List.length_replicate, List.length_nil] at hlength
    have hpositive := (digitWeight_bounds written).1
    exact (Nat.ne_of_gt
      (Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1) hpositive)) hlength
  have hlength : machineSymbolValue source.current ≤
      (leftCleanupPayload source next).length := by
    unfold leftCleanupPayload
    simp only [List.length_append, List.length_replicate]
    have hfirst : machineSymbolValue source.current ≤
        machineSymbolValue source.current + 1 :=
      Nat.le_add_right _ 1
    rw [Nat.add_assoc]
    exact Nat.le_trans hfirst
      (Nat.le_add_right (machineSymbolValue source.current + 1)
        (leftUnits source.left + rightUnits source.right * 64))
  have trace := rotatedWord_scan_aux source.current
    (List.replicate (digitWeight written) (.rightStar next))
    (leftCleanupPayload source next) hnonempty hlength
  rw [← leftPrecleanup_eq_rotated source next written] at trace
  rw [left_cleanup_target source next written] at trace
  simpa only [List.length_replicate] using trace

@[simp]
theorem generationFamilies_length (config : MachineConfig) :
    (generationFamilies config).length =
      1 + leftUnits config.left + rightUnits config.right := by
  simp only [generationFamilies, List.length_cons, List.length_append,
    List.length_replicate]
  exact congrArg (fun value => value + rightUnits config.right)
    (Nat.add_comm (leftUnits config.left) 1)

theorem one_add_one_add (value : Nat) :
    1 + (1 + value) = 2 + value := by
  rw [show 2 = 1 + 1 by rfl, Nat.add_assoc]

/-- Exact number of deletion-eight transitions from a canonical boundary to
the first directional endpoint. -/
def firstArrivalTime (source : MachineConfig) (written : MachineSymbol) :
    Rogozhin46.Direction → Nat
  | .left =>
      digitWeight written +
        ((generationFamilies source).length +
          (generationFamilies source).length)
  | .right =>
      (generationFamilies source).length +
        (generationFamilies source).length

theorem firstArrivalTime_formula (source : MachineConfig)
    (written : MachineSymbol) (direction : Rogozhin46.Direction) :
    firstArrivalTime source written direction =
      2 * leftUnits source.left + 2 * rightUnits source.right + 2 +
        match direction with
        | .left => digitWeight written
        | .right => 0 := by
  cases direction <;>
    simp [firstArrivalTime, generationFamilies_length,
      Nat.two_mul, Nat.mul_add, Nat.add_comm, Nat.add_left_comm,
      Nat.add_assoc] <;>
    exact one_add_one_add _

theorem firstArrivalTime_pos (source : MachineConfig)
    (written : MachineSymbol) (direction : Rogozhin46.Direction) :
    0 < firstArrivalTime source written direction := by
  cases direction with
  | left =>
      unfold firstArrivalTime
      exact Nat.add_pos_left
        (Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1)
          (digitWeight_bounds written).1) _
  | right =>
      unfold firstArrivalTime
      have hlength : 0 < (generationFamilies source).length := by
        rw [generationFamilies_length, Nat.add_assoc]
        exact Nat.add_pos_left (Nat.zero_lt_succ 0) _
      exact Nat.add_pos_left hlength _

/-- The exact reflected table action reaches its classified arrival endpoint
at the closed-form time above. -/
theorem canonical_reaches_expected_endpoint
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    HaltCleanup.TagStepsN (firstArrivalTime source written direction)
      (canonicalWord source)
      (expectedEndpoint source next written direction) := by
  have first := canonical_to_indexed_rows source
  have second := indexed_rows_to_selected_productions source next written
    direction hcommand
  have both := HaltCleanup.TagStepsN.append first second
  have hselected := selectedProductionWord_directional source next written
    direction hcommand
  cases direction with
  | right =>
      rw [hselected] at both
      simpa only [firstArrivalTime, expectedEndpoint] using both
  | left =>
      rw [hselected] at both
      have cleanup := left_precleanup_to_endpoint source next written
      have all := HaltCleanup.TagStepsN.append both cleanup
      simpa only [firstArrivalTime, expectedEndpoint] using all

/-! ### Proper-prefix exclusion -/

def ContainsIndexed (word : List TagSymbol) : Prop :=
  ∃ family state index, TagSymbol.indexed family state index ∈ word

def ContainsRightStar (word : List TagSymbol) : Prop :=
  ∃ state, TagSymbol.rightStar state ∈ word

theorem containsIndexed_append_left {left right : List TagSymbol}
    (hcontains : ContainsIndexed left) :
    ContainsIndexed (left ++ right) := by
  rcases hcontains with ⟨family, state, index, hmem⟩
  exact ⟨family, state, index, List.mem_append_left right hmem⟩

theorem containsIndexed_append_right {left right : List TagSymbol}
    (hcontains : ContainsIndexed right) :
    ContainsIndexed (left ++ right) := by
  rcases hcontains with ⟨family, state, index, hmem⟩
  exact ⟨family, state, index, List.mem_append_right left hmem⟩

theorem containsRightStar_append_left {left right : List TagSymbol}
    (hcontains : ContainsRightStar left) :
    ContainsRightStar (left ++ right) := by
  rcases hcontains with ⟨state, hmem⟩
  exact ⟨state, List.mem_append_left right hmem⟩

theorem arrivalWord_not_containsIndexed (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    ¬ ContainsIndexed (arrivalWord direction origin config) := by
  rintro ⟨family, state, index, hmem⟩
  cases direction <;> cases origin <;>
    simp [arrivalWord, runWord, arrivalCounts] at hmem

theorem arrivalWord_not_containsRightStar (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    ¬ ContainsRightStar (arrivalWord direction origin config) := by
  rintro ⟨state, hmem⟩
  cases direction <;> cases origin <;>
    simp [arrivalWord, runWord, arrivalCounts] at hmem

theorem not_arrivalReadable_of_containsIndexed {word : List TagSymbol}
    (hcontains : ContainsIndexed word) : ¬ ArrivalReadable word := by
  rintro ⟨direction, origin, config, heq⟩
  rw [heq] at hcontains
  exact arrivalWord_not_containsIndexed direction origin config hcontains

theorem not_arrivalReadable_of_containsRightStar {word : List TagSymbol}
    (hcontains : ContainsRightStar word) : ¬ ArrivalReadable word := by
  rintro ⟨direction, origin, config, heq⟩
  rw [heq] at hcontains
  exact arrivalWord_not_containsRightStar direction origin config hcontains

/-- A positive exact trajectory annotated with the fact that every proper
positive prefix endpoint satisfies `property`. -/
inductive ProperTagSteps (property : List TagSymbol → Prop) :
    Nat → List TagSymbol → List TagSymbol → Prop where
  | one {source target : List TagSymbol} :
      HaltCleanup.TagStep source target →
      ProperTagSteps property 1 source target
  | more {source middle target : List TagSymbol} {steps : Nat} :
      HaltCleanup.TagStep source middle →
      property middle →
      ProperTagSteps property steps middle target →
      ProperTagSteps property (steps + 1) source target

namespace ProperTagSteps

theorem toTagStepsN {property : List TagSymbol → Prop}
    {steps : Nat} {source target : List TagSymbol}
    (trace : ProperTagSteps property steps source target) :
    HaltCleanup.TagStepsN steps source target := by
  induction trace with
  | one first =>
      exact .succ first (.zero _)
  | @more source middle target steps first propertyMiddle rest ih =>
      exact .succ first ih

theorem tagStep_target_unique {source first second : List TagSymbol}
    (hfirst : HaltCleanup.TagStep source first)
    (hsecond : HaltCleanup.TagStep source second) : first = second := by
  unfold HaltCleanup.TagStep at hfirst hsecond
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

theorem proper_prefix {property : List TagSymbol → Prop}
    {steps : Nat} {source target : List TagSymbol}
    (trace : ProperTagSteps property steps source target) :
    ∀ {earlier : Nat} {word : List TagSymbol},
      0 < earlier → earlier < steps →
      HaltCleanup.TagStepsN earlier source word → property word := by
  induction trace with
  | one first =>
      intro earlier word hpositive hlt prefixTrace
      cases earlier with
      | zero => exact (Nat.lt_irrefl 0 hpositive).elim
      | succ earlier =>
          have : earlier < 0 :=
            Nat.succ_lt_succ_iff.mp hlt
          exact (Nat.not_lt_zero earlier this).elim
  | @more source middle target properSteps first propertyMiddle rest ih =>
      intro earlier word hpositive hlt prefixTrace
      cases earlier with
      | zero => exact (Nat.lt_irrefl 0 hpositive).elim
      | succ earlier =>
          cases prefixTrace with
          | @succ _ prefixMiddle _ prefixSteps prefixFirst prefixRest =>
              have hmiddle : prefixMiddle = middle :=
                tagStep_target_unique prefixFirst first
              subst prefixMiddle
              cases earlier with
              | zero =>
                  cases prefixRest
                  exact propertyMiddle
              | succ earlier =>
                  have hltRest : earlier + 1 < properSteps := by
                    exact Nat.succ_lt_succ_iff.mp hlt
                  have hpositiveRest : 0 < earlier + 1 :=
                    Nat.zero_lt_succ earlier
                  exact ih hpositiveRest hltRest prefixRest

end ProperTagSteps

theorem production_unindexed_containsIndexed (state : MachineState)
    (family : Family) :
    ContainsIndexed (production (unindexedSymbol state family)) := by
  refine ⟨family, state, .j1, ?_⟩
  cases family <;> simp [unindexedSymbol, indices]

theorem rotatedWord_scan_aux_proper (current : MachineSymbol) :
    ∀ (symbols : List TagSymbol) (payload : List TagSymbol),
      symbols ≠ [] →
      machineSymbolValue current ≤ payload.length →
      (∀ symbol, symbol ∈ symbols → ContainsIndexed (production symbol)) →
      ProperTagSteps ContainsIndexed symbols.length
        (rotatedWord current symbols ++ payload)
        (payload.drop (machineSymbolValue current) ++
          symbols.flatMap production)
  | [], payload, hnonempty, hlength, hall => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength, hall => by
      have hone := rotatedWord_single_step current first payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (ProperTagSteps.one (property := ContainsIndexed) hone)
  | first :: second :: rest, payload, hnonempty, hlength, hall => by
      have hone := rotatedWord_step current first second rest payload
      have hmiddle : ContainsIndexed
          (rotatedWord current (second :: rest) ++ payload ++
            production first) :=
        containsIndexed_append_right (hall first (.head _))
      have hlength' : machineSymbolValue current ≤
          (payload ++ production first).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length (production first).length)
      have hallRest : ∀ symbol, symbol ∈ second :: rest →
          ContainsIndexed (production symbol) := by
        intro symbol hmem
        exact hall symbol (.tail first hmem)
      have hrest := rotatedWord_scan_aux_proper current (second :: rest)
        (payload ++ production first) (List.cons_ne_nil second rest)
        hlength' hallRest
      have hrest' : ProperTagSteps ContainsIndexed (second :: rest).length
          ((rotatedWord current (second :: rest) ++ payload) ++
            production first)
          ((payload ++ production first).drop
              (machineSymbolValue current) ++
            (second :: rest).flatMap production) := by
        simpa only [List.append_assoc] using hrest
      have hproper := ProperTagSteps.more hone hmiddle hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hproper

theorem canonical_scan_proper (config : MachineConfig) :
    ProperTagSteps ContainsIndexed (generationFamilies config).length
      (canonicalWord config)
      (indexedRowsWord config.current config.state
        (generationFamilies config)) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      let restFamilies : List Family :=
        List.replicate count .L ++
          List.replicate (rightUnits config.right) .R
      have hfamilies : generationFamilies config = .H :: .L :: restFamilies := by
        rw [generationFamilies, hcount, List.replicate_succ]
        simp only [restFamilies, List.cons_append]
      have hsymbols : generationSymbols config =
          .head config.state :: .left config.state ::
            restFamilies.map (unindexedSymbol config.state) := by
        rw [generationSymbols_eq_map, hfamilies]
        rfl
      have hindexed : ∀ symbol,
          symbol ∈ (.head config.state :: .left config.state ::
            restFamilies.map (unindexedSymbol config.state)) →
          ContainsIndexed (production symbol) := by
        intro symbol hmem
        simp only [List.mem_cons] at hmem
        rcases hmem with rfl | hmem
        · exact production_unindexed_containsIndexed config.state .H
        · rcases hmem with rfl | hmem
          · exact production_unindexed_containsIndexed config.state .L
          · obtain ⟨family, hfamily, heq⟩ :=
              Rogozhin46.exists_of_mem_map
                (unindexedSymbol config.state) hmem
            rw [← heq]
            exact production_unindexed_containsIndexed config.state family
      have hheadLength : machineSymbolValue config.current ≤
          (production (.head config.state)).length := by
        simp only [production_head, List.length_map, indices_length]
        exact Nat.le_trans (machineSymbolValue_le_five config.current)
          (by decide)
      have hone := rotatedWord_step config.current
        (.head config.state) (.left config.state)
        (restFamilies.map (unindexedSymbol config.state)) []
      have hmiddle : ContainsIndexed
          (rotatedWord config.current
              (.left config.state ::
                restFamilies.map (unindexedSymbol config.state)) ++ [] ++
            production (.head config.state)) :=
        containsIndexed_append_right
          (production_unindexed_containsIndexed config.state .H)
      have hallRest : ∀ symbol,
          symbol ∈ (.left config.state ::
            restFamilies.map (unindexedSymbol config.state)) →
          ContainsIndexed (production symbol) := by
        intro symbol hmem
        exact hindexed symbol (.tail _ hmem)
      have hrest := rotatedWord_scan_aux_proper config.current
        (.left config.state ::
          restFamilies.map (unindexedSymbol config.state))
        (production (.head config.state)) (List.cons_ne_nil _ _)
        hheadLength hallRest
      have hrest' : ProperTagSteps ContainsIndexed
          (.left config.state ::
            restFamilies.map (unindexedSymbol config.state)).length
          (rotatedWord config.current
              (.left config.state ::
                restFamilies.map (unindexedSymbol config.state)) ++ [] ++
            production (.head config.state))
          ((production (.head config.state)).drop
              (machineSymbolValue config.current) ++
            (.left config.state ::
              restFamilies.map (unindexedSymbol config.state)).flatMap
                production) := by
        simpa only [List.append_nil] using hrest
      have hproper := ProperTagSteps.more hone hmiddle hrest'
      rw [← hsymbols, rotatedWord_generationSymbols config] at hproper
      rw [hfamilies]
      have htarget := first_generation_target config
      rw [hfamilies] at htarget
      rw [← htarget]
      simpa only [hsymbols, List.length_map, List.length_cons,
        List.tail_cons, List.flatMap_map, Function.comp_apply,
        unindexedSymbol, List.flatMap_cons, List.append_nil] using hproper

theorem selectedIndex_mem_indexedRow_drop (current : MachineSymbol)
    (state : MachineState) (family : Family) :
    TagSymbol.indexed family state (selectedIndex current) ∈
      (indexedRow family state).drop (machineSymbolValue current) := by
  cases current with
  | s0 =>
      change TagSymbol.indexed family state .j1 ∈
        [TagSymbol.indexed family state .j1,
         TagSymbol.indexed family state .j2,
         TagSymbol.indexed family state .j3,
         TagSymbol.indexed family state .j4,
         TagSymbol.indexed family state .j5,
         TagSymbol.indexed family state .j6,
         TagSymbol.indexed family state .j7,
         TagSymbol.indexed family state .j8]
      exact .head _
  | s1 =>
      change TagSymbol.indexed family state .j2 ∈
        [TagSymbol.indexed family state .j2,
         TagSymbol.indexed family state .j3,
         TagSymbol.indexed family state .j4,
         TagSymbol.indexed family state .j5,
         TagSymbol.indexed family state .j6,
         TagSymbol.indexed family state .j7,
         TagSymbol.indexed family state .j8]
      exact .head _
  | s2 =>
      change TagSymbol.indexed family state .j3 ∈
        [TagSymbol.indexed family state .j3,
         TagSymbol.indexed family state .j4,
         TagSymbol.indexed family state .j5,
         TagSymbol.indexed family state .j6,
         TagSymbol.indexed family state .j7,
         TagSymbol.indexed family state .j8]
      exact .head _
  | s3 =>
      change TagSymbol.indexed family state .j4 ∈
        [TagSymbol.indexed family state .j4,
         TagSymbol.indexed family state .j5,
         TagSymbol.indexed family state .j6,
         TagSymbol.indexed family state .j7,
         TagSymbol.indexed family state .j8]
      exact .head _
  | s4 =>
      change TagSymbol.indexed family state .j5 ∈
        [TagSymbol.indexed family state .j5,
         TagSymbol.indexed family state .j6,
         TagSymbol.indexed family state .j7,
         TagSymbol.indexed family state .j8]
      exact .head _
  | s5 =>
      change TagSymbol.indexed family state .j6 ∈
        [TagSymbol.indexed family state .j6,
         TagSymbol.indexed family state .j7,
         TagSymbol.indexed family state .j8]
      exact .head _

theorem indexedRowsWord_containsIndexed (current : MachineSymbol)
    (state : MachineState) (first : Family) (rest : List Family) :
    ContainsIndexed (indexedRowsWord current state (first :: rest)) := by
  refine ⟨first, state, selectedIndex current, ?_⟩
  change TagSymbol.indexed first state (selectedIndex current) ∈
    (indexedRow first state).drop (machineSymbolValue current) ++
      rest.flatMap fun family => indexedRow family state
  exact List.mem_append_left _
    (selectedIndex_mem_indexedRow_drop current state first)

theorem indexedRowsWord_scan_aux_proper (current : MachineSymbol)
    (state : MachineState) :
    ∀ (families : List Family) (payload : List TagSymbol),
      families ≠ [] →
      machineSymbolValue current ≤ payload.length →
      ProperTagSteps ContainsIndexed families.length
        (indexedRowsWord current state families ++ payload)
        (payload.drop (machineSymbolValue current) ++
          families.flatMap fun family =>
            production (.indexed family state (selectedIndex current)))
  | [], payload, hnonempty, hlength => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength => by
      have hone := indexedRowsWord_single_step current state first payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (ProperTagSteps.one (property := ContainsIndexed) hone)
  | first :: second :: rest, payload, hnonempty, hlength => by
      have hone := indexedRowsWord_step current state first second rest payload
      have hmiddle : ContainsIndexed
          (indexedRowsWord current state (second :: rest) ++ payload ++
            production (.indexed first state (selectedIndex current))) :=
        containsIndexed_append_left
          (containsIndexed_append_left
            (indexedRowsWord_containsIndexed current state second rest))
      have hlength' : machineSymbolValue current ≤
          (payload ++ production
            (.indexed first state (selectedIndex current))).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length
            (production (.indexed first state (selectedIndex current))).length)
      have hrest := indexedRowsWord_scan_aux_proper current state
        (second :: rest)
        (payload ++ production (.indexed first state (selectedIndex current)))
        (List.cons_ne_nil second rest) hlength'
      have hrest' : ProperTagSteps ContainsIndexed (second :: rest).length
          ((indexedRowsWord current state (second :: rest) ++ payload) ++
            production (.indexed first state (selectedIndex current)))
          ((payload ++ production
              (.indexed first state (selectedIndex current))).drop
                (machineSymbolValue current) ++
            (second :: rest).flatMap fun family =>
              production (.indexed family state (selectedIndex current))) := by
        simpa only [List.append_assoc] using hrest
      have hproper := ProperTagSteps.more hone hmiddle hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hproper

theorem indexed_scan_proper
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    ProperTagSteps ContainsIndexed (generationFamilies source).length
      (indexedRowsWord source.current source.state
        (generationFamilies source))
      (selectedProductionWord source) := by
  have hpos := leftUnits_pos source.left
  cases hcount : leftUnits source.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      let restFamilies : List Family :=
        List.replicate count .L ++
          List.replicate (rightUnits source.right) .R
      have hfamilies : generationFamilies source = .H :: .L :: restFamilies := by
        rw [generationFamilies, hcount, List.replicate_succ]
        simp only [restFamilies, List.cons_append]
      have hlong := selectedHeadProduction_long_enough source.state next
        source.current written direction hcommand
      have hone := indexedRowsWord_step source.current source.state
        .H .L restFamilies []
      have hmiddle : ContainsIndexed
          (indexedRowsWord source.current source.state (.L :: restFamilies) ++
            [] ++ production
              (.indexed .H source.state (selectedIndex source.current))) :=
        containsIndexed_append_left
          (containsIndexed_append_left
            (indexedRowsWord_containsIndexed source.current source.state
              .L restFamilies))
      have hrest := indexedRowsWord_scan_aux_proper source.current source.state
        (.L :: restFamilies)
        (production (.indexed .H source.state (selectedIndex source.current)))
        (List.cons_ne_nil _ _) hlong
      have hrest' : ProperTagSteps ContainsIndexed (.L :: restFamilies).length
          (indexedRowsWord source.current source.state (.L :: restFamilies) ++
            [] ++ production
              (.indexed .H source.state (selectedIndex source.current)))
          ((production
              (.indexed .H source.state (selectedIndex source.current))).drop
                (machineSymbolValue source.current) ++
            (.L :: restFamilies).flatMap fun family =>
              production (.indexed family source.state
                (selectedIndex source.current))) := by
        simpa only [List.append_nil] using hrest
      have hproper := ProperTagSteps.more hone hmiddle hrest'
      rw [hfamilies]
      rw [selectedProductionWord, hfamilies]
      simpa only [List.tail_cons, List.append_nil] using! hproper

theorem rotatedWord_rightStar_contains (current : MachineSymbol)
    (state : MachineState) (rest payload : List TagSymbol) :
    ContainsRightStar
      (rotatedWord current (.rightStar state :: rest) ++ payload) := by
  refine ⟨state, ?_⟩
  cases current <;>
    change TagSymbol.rightStar state ∈
      (TagSymbol.rightStar state :: _) <;>
    exact .head _

theorem rightStarList_scan_proper (current : MachineSymbol)
    (state : MachineState) :
    ∀ (symbols : List TagSymbol) (payload : List TagSymbol),
      symbols ≠ [] →
      (∀ symbol, symbol ∈ symbols → symbol = .rightStar state) →
      machineSymbolValue current ≤ payload.length →
      ProperTagSteps ContainsRightStar symbols.length
        (rotatedWord current symbols ++ payload)
        (payload.drop (machineSymbolValue current) ++
          symbols.flatMap production)
  | [], payload, hnonempty, hall, hlength => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hall, hlength => by
      have hfirst := hall first (.head _)
      subst first
      have hone := rotatedWord_single_step current (.rightStar state)
        payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (ProperTagSteps.one (property := ContainsRightStar) hone)
  | first :: second :: rest, payload, hnonempty, hall, hlength => by
      have hfirst := hall first (.head _)
      have hsecond := hall second (.tail first (.head _))
      have hone := rotatedWord_step current first second rest payload
      have hmiddle : ContainsRightStar
          (rotatedWord current (second :: rest) ++ payload ++
            production first) := by
        rw [hsecond]
        exact containsRightStar_append_left
          (rotatedWord_rightStar_contains current state rest payload)
      have hlength' : machineSymbolValue current ≤
          (payload ++ production first).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length
            (production first).length)
      have hallRest : ∀ symbol, symbol ∈ second :: rest →
          symbol = .rightStar state := by
        intro symbol hmem
        exact hall symbol (.tail first hmem)
      have hrest := rightStarList_scan_proper current state
        (second :: rest)
        (payload ++ production first)
        (List.cons_ne_nil _ _) hallRest hlength'
      have hrest' : ProperTagSteps ContainsRightStar
          (second :: rest).length
          ((rotatedWord current (second :: rest) ++ payload) ++
            production first)
          ((payload ++ production first).drop
              (machineSymbolValue current) ++
            (second :: rest).flatMap production) := by
        simpa only [List.append_assoc] using hrest
      have hproper := ProperTagSteps.more hone hmiddle hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hproper

theorem eq_of_mem_replicate_clean {count : Nat} {value found : α}
    (hmem : found ∈ List.replicate count value) : found = value := by
  induction count with
  | zero => cases hmem
  | succ count ih =>
      rw [List.replicate_succ] at hmem
      cases hmem with
      | head => rfl
      | tail _ htail => exact ih htail

theorem left_cleanup_proper_clean (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol) :
    ProperTagSteps ContainsRightStar (digitWeight written)
      (leftPrecleanupWord source next written)
      (leftEndpointWord source next written) := by
  have hpositive : 0 < digitWeight written :=
    Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1)
      (digitWeight_bounds written).1
  have hnonempty :
      List.replicate (digitWeight written) (TagSymbol.rightStar next) ≠ [] := by
    intro hempty
    have hlengthEq := congrArg List.length hempty
    simp only [List.length_replicate, List.length_nil] at hlengthEq
    exact (Nat.ne_of_gt hpositive) hlengthEq
  have hall : ∀ symbol,
      symbol ∈ List.replicate (digitWeight written)
        (TagSymbol.rightStar next) →
      symbol = TagSymbol.rightStar next := by
    intro symbol hmem
    exact eq_of_mem_replicate_clean hmem
  have hlength : machineSymbolValue source.current ≤
      (leftCleanupPayload source next).length := by
    unfold leftCleanupPayload
    simp only [List.length_append, List.length_replicate]
    have hfirst : machineSymbolValue source.current ≤
        machineSymbolValue source.current + 1 :=
      Nat.le_add_right _ 1
    rw [Nat.add_assoc]
    exact Nat.le_trans hfirst
      (Nat.le_add_right (machineSymbolValue source.current + 1)
        (leftUnits source.left + rightUnits source.right * 64))
  have hproper := rightStarList_scan_proper source.current next
    (List.replicate (digitWeight written) (TagSymbol.rightStar next))
    (leftCleanupPayload source next) hnonempty hall hlength
  rw [← leftPrecleanup_eq_rotated source next written] at hproper
  rw [left_cleanup_target source next written] at hproper
  simpa only [List.length_replicate] using hproper

theorem generationIndexed_containsIndexed (config : MachineConfig) :
    ContainsIndexed
      (indexedRowsWord config.current config.state
        (generationFamilies config)) := by
  change ContainsIndexed
    (indexedRowsWord config.current config.state
      (.H :: List.replicate (leftUnits config.left) .L ++
        List.replicate (rightUnits config.right) .R))
  exact indexedRowsWord_containsIndexed config.current config.state .H _

theorem leftPrecleanup_containsRightStar (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol) :
    ContainsRightStar (leftPrecleanupWord source next written) := by
  rw [leftPrecleanup_eq_rotated]
  cases written with
  | s0 =>
      change ContainsRightStar
        (rotatedWord source.current
          (TagSymbol.rightStar next :: List.replicate 6
            (TagSymbol.rightStar next)) ++ leftCleanupPayload source next)
      exact rotatedWord_rightStar_contains source.current next _ _
  | s1 =>
      change ContainsRightStar
        (rotatedWord source.current
          (TagSymbol.rightStar next :: List.replicate 5
            (TagSymbol.rightStar next)) ++ leftCleanupPayload source next)
      exact rotatedWord_rightStar_contains source.current next _ _
  | s2 =>
      change ContainsRightStar
        (rotatedWord source.current
          (TagSymbol.rightStar next :: List.replicate 4
            (TagSymbol.rightStar next)) ++ leftCleanupPayload source next)
      exact rotatedWord_rightStar_contains source.current next _ _
  | s3 =>
      change ContainsRightStar
        (rotatedWord source.current
          (TagSymbol.rightStar next :: List.replicate 3
            (TagSymbol.rightStar next)) ++ leftCleanupPayload source next)
      exact rotatedWord_rightStar_contains source.current next _ _
  | s4 =>
      change ContainsRightStar
        (rotatedWord source.current
          (TagSymbol.rightStar next :: List.replicate 2
            (TagSymbol.rightStar next)) ++ leftCleanupPayload source next)
      exact rotatedWord_rightStar_contains source.current next _ _
  | s5 =>
      change ContainsRightStar
        (rotatedWord source.current
          (TagSymbol.rightStar next :: List.replicate 1
            (TagSymbol.rightStar next)) ++ leftCleanupPayload source next)
      exact rotatedWord_rightStar_contains source.current next _ _

/-- Every positive prefix before the end of the two family sweeps contains an
indexed Cook symbol and is therefore not a registered arrival. -/
theorem two_scans_prefix_containsIndexed
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction)
    {earlier : Nat} {word : List TagSymbol}
    (hpositive : 0 < earlier)
    (hlt : earlier <
      (generationFamilies source).length +
        (generationFamilies source).length)
    (prefixTrace : HaltCleanup.TagStepsN earlier
      (canonicalWord source) word) :
    ContainsIndexed word := by
  let count := (generationFamilies source).length
  have firstProper := canonical_scan_proper source
  have firstTrace := firstProper.toTagStepsN
  have secondProper := indexed_scan_proper source next written direction hcommand
  have secondTrace := secondProper.toTagStepsN
  by_cases hearlier : earlier < count
  · exact firstProper.proper_prefix hpositive hearlier prefixTrace
  · have hle : count ≤ earlier := Nat.le_of_not_gt hearlier
    obtain ⟨offset, hoffset⟩ := Nat.exists_eq_add_of_le hle
    subst earlier
    cases offset with
    | zero =>
        have heq := TagTrajectory.steps_deterministic prefixTrace firstTrace
        rw [heq]
        exact generationIndexed_containsIndexed source
    | succ offset =>
        have hoffsetLt : offset + 1 < count := by
          have hcancel : count + (offset + 1) < count + count := hlt
          exact Nat.lt_of_add_lt_add_left hcancel
        have offsetTrace := TagTrajectory.run_prefix_of_steps
          (Nat.le_of_lt hoffsetLt) secondTrace
        have hcontains := secondProper.proper_prefix
          (Nat.zero_lt_succ offset) hoffsetLt offsetTrace
        have combined := HaltCleanup.TagStepsN.append firstTrace offsetTrace
        rw [Nat.add_comm (offset + 1) count] at combined
        have heq := TagTrajectory.steps_deterministic prefixTrace combined
        rw [heq]
        exact hcontains

theorem left_full_prefix_notArrivalReadable
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written .left)
    {earlier : Nat} {word : List TagSymbol}
    (hpositive : 0 < earlier)
    (hlt : earlier < firstArrivalTime source written .left)
    (prefixTrace : HaltCleanup.TagStepsN earlier
      (canonicalWord source) word) :
    ¬ ArrivalReadable word := by
  let count := (generationFamilies source).length
  let base := count + count
  by_cases hearlier : earlier < base
  · exact not_arrivalReadable_of_containsIndexed
      (two_scans_prefix_containsIndexed source next written .left hcommand
        hpositive hearlier prefixTrace)
  · have hle : base ≤ earlier := Nat.le_of_not_gt hearlier
    obtain ⟨offset, hoffset⟩ := Nat.exists_eq_add_of_le hle
    subst earlier
    have firstTrace := (canonical_scan_proper source).toTagStepsN
    have secondTrace :=
      (indexed_scan_proper source next written .left hcommand).toTagStepsN
    have both := HaltCleanup.TagStepsN.append firstTrace secondTrace
    have hselected := selectedProductionWord_directional source next written
      .left hcommand
    rw [hselected] at both
    cases offset with
    | zero =>
        have heq := TagTrajectory.steps_deterministic prefixTrace both
        rw [heq]
        exact not_arrivalReadable_of_containsRightStar
          (leftPrecleanup_containsRightStar source next written)
    | succ offset =>
        have hoffsetLt : offset + 1 < digitWeight written := by
          have hbound : base + (offset + 1) <
              base + digitWeight written := by
            simpa only [firstArrivalTime, base, count,
              Nat.add_comm (digitWeight written)
                ((generationFamilies source).length +
                  (generationFamilies source).length)] using hlt
          exact Nat.lt_of_add_lt_add_left hbound
        have cleanupProper := left_cleanup_proper_clean source next written
        have cleanupTrace := cleanupProper.toTagStepsN
        have offsetTrace := TagTrajectory.run_prefix_of_steps
          (Nat.le_of_lt hoffsetLt) cleanupTrace
        have hcontains := cleanupProper.proper_prefix
          (Nat.zero_lt_succ offset) hoffsetLt offsetTrace
        have combined := HaltCleanup.TagStepsN.append both offsetTrace
        rw [Nat.add_comm (offset + 1) base] at combined
        have heq := TagTrajectory.steps_deterministic prefixTrace combined
        rw [heq]
        exact not_arrivalReadable_of_containsRightStar hcontains

/-- Exact first readable arrival from every canonical nonhalting boundary. -/
def canonical_firstArrival
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    FirstArrival source (expectedEndpoint source next written direction) := by
  refine
    { steps := firstArrivalTime source written direction
      steps_pos := firstArrivalTime_pos source written direction
      reaches := canonical_reaches_expected_endpoint source next written
        direction hcommand
      readable := ?_
      first := ?_ }
  · have hclassified :=
      expectedEndpoint_classification source next written direction
    cases direction with
    | left =>
        exact ⟨.left, leftOrigin source,
          Rogozhin46.applyTransition source next written .left,
          hclassified.1⟩
    | right =>
        exact ⟨.right, rightOrigin source,
          Rogozhin46.applyTransition source next written .right,
          hclassified.1⟩
  · intro earlier word hpositive hlt prefixTrace
    cases direction with
    | right =>
        apply not_arrivalReadable_of_containsIndexed
        apply two_scans_prefix_containsIndexed source next written .right
          hcommand hpositive
        · simpa only [firstArrivalTime] using hlt
        · exact prefixTrace
    | left =>
        exact left_full_prefix_notArrivalReadable source next written hcommand
          hpositive hlt prefixTrace

/-- The multi-sweep pass obligation is closed for all reflected table cells. -/
theorem expectedFirstArrival_all (source : MachineConfig) :
    ExpectedFirstArrival source := by
  unfold ExpectedFirstArrival
  cases htransition : Rogozhin46.transition source.state source.current with
  | halt => trivial
  | step next written direction =>
      exact ⟨canonical_firstArrival source next written direction htransition⟩
/-- One selected leading symbol, followed by the bounded low digit of the
next family and then complete eight-symbol blocks. -/
def mixedFrontWord (current : MachineSymbol) (first filler : TagSymbol)
    (rest : List TagSymbol) : List TagSymbol :=
  first :: List.replicate (digitWeight current) filler ++
    rest.flatMap (List.replicate 8)

theorem one_add_digitWeight (current : MachineSymbol) :
    1 + digitWeight current = 8 - machineSymbolValue current := by
  cases current <;> decide

theorem mixedFrontWord_step (current : MachineSymbol)
    (first filler second : TagSymbol) (rest : List TagSymbol) :
    HaltCleanup.TagStep
      (mixedFrontWord current first filler (second :: rest))
      (rotatedWord current (second :: rest) ++ production first) := by
  cases current <;>
    simp [mixedFrontWord, digitWeight, machineSymbolValue, rotatedWord,
      HaltCleanup.TagStep, Macroperiod.tagStep?_eight]

theorem mixedFrontWord_scan (current : MachineSymbol)
    (first filler second : TagSymbol) (rest : List TagSymbol)
    (hproduction : machineSymbolValue current ≤ (production first).length) :
    HaltCleanup.TagStepsN ((second :: rest).length + 1)
      (mixedFrontWord current first filler (second :: rest))
      ((production first).drop (machineSymbolValue current) ++
        (second :: rest).flatMap production) := by
  have hone := mixedFrontWord_step current first filler second rest
  have hrest := rotatedWord_scan_aux current (second :: rest)
    (production first) (List.cons_ne_nil _ _) hproduction
  exact HaltCleanup.TagStepsN.succ hone hrest

theorem leftRepresentedWord_eq_mixed (config : MachineConfig) :
    arrivalWord .left .representedCell config =
      mixedFrontWord config.current (.head config.state) (.left config.state)
        ((List.replicate (leftUnits config.left) (.left config.state)) ++
          List.replicate (rightUnits config.right) (.right config.state)) := by
  cases config with
  | mk state current left right =>
      unfold arrivalWord arrivalCounts runWord regularLeftArrivalExponent
        mixedFrontWord
      simp only [Rogozhin46.Config.state, Rogozhin46.Config.current,
        Rogozhin46.Config.left, Rogozhin46.Config.right, RunCounts.head,
        RunCounts.left, RunCounts.right, List.replicate_one,
        leftCounter_eq_radix_mul_units,
        rightCounter_eq_radix_mul_units, List.flatMap_append,
        List.flatMap_replicate]
      rw [List.flatten_replicate_replicate,
        List.flatten_replicate_replicate]
      rw [Nat.mul_comm (leftUnits left) 8,
        Nat.mul_comm (rightUnits right) 8]
      simp only [List.cons_append, List.singleton_append]
      rw [replicate_add_clean, List.append_assoc]
      simp only [List.nil_append, List.append_assoc]

theorem left_represented_to_indexed (config : MachineConfig) :
    HaltCleanup.TagStepsN (generationFamilies config).length
      (arrivalWord .left .representedCell config)
      (indexedRowsWord config.current config.state
        (generationFamilies config)) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      let restFamilies : List Family :=
        List.replicate count .L ++
          List.replicate (rightUnits config.right) .R
      let restSymbols : List TagSymbol :=
        List.replicate count (.left config.state) ++
          List.replicate (rightUnits config.right) (.right config.state)
      have hfamilies : generationFamilies config = .H :: .L :: restFamilies := by
        rw [generationFamilies, hcount, List.replicate_succ]
        simp only [restFamilies, List.cons_append]
      have hsymbols :
          List.replicate (leftUnits config.left) (.left config.state) ++
            List.replicate (rightUnits config.right) (.right config.state) =
          .left config.state :: restSymbols := by
        rw [hcount, List.replicate_succ]
        simp only [restSymbols, List.cons_append]
      have hheadLength : machineSymbolValue config.current ≤
          (production (.head config.state)).length := by
        simp only [production_head, List.length_map, indices_length]
        exact Nat.le_trans (machineSymbolValue_le_five config.current)
          (by decide)
      have trace := mixedFrontWord_scan config.current
        (.head config.state) (.left config.state) (.left config.state)
        restSymbols hheadLength
      rw [← hsymbols] at trace
      rw [← leftRepresentedWord_eq_mixed config] at trace
      have htarget := first_generation_target config
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [hsymbols, restSymbols, restFamilies, List.length_cons,
        List.length_append, List.length_replicate, List.flatMap_cons,
        List.flatMap_append, List.flatMap_replicate,
        List.flatten_replicate_replicate, unindexedSymbol,
        List.tail_cons, Nat.add_assoc] using trace

/-! A low digit may occur after any number of complete blocks.  The next
lemmas move the one-symbol cursor through those blocks without arithmetic
automation. -/

def segmentedWord (current : MachineSymbol) (first : TagSymbol)
    (before : List TagSymbol) (filler : TagSymbol)
    (after : List TagSymbol) : List TagSymbol :=
  first :: before.flatMap (List.replicate 8) ++
    List.replicate (digitWeight current) filler ++
    after.flatMap (List.replicate 8)

def bridgeWord (current : MachineSymbol) (before : List TagSymbol)
    (filler : TagSymbol) (after payload : List TagSymbol) : List TagSymbol :=
  match before with
  | [] => List.replicate (digitWeight current) filler ++
      after.flatMap (List.replicate 8) ++ payload
  | first :: rest =>
      first :: rest.flatMap (List.replicate 8) ++
        List.replicate (digitWeight current) filler ++
        after.flatMap (List.replicate 8) ++ payload

theorem segmentedWord_step (current : MachineSymbol) (first second : TagSymbol)
    (rest : List TagSymbol) (filler : TagSymbol) (after : List TagSymbol) :
    HaltCleanup.TagStep
      (segmentedWord current first (second :: rest) filler after)
      (bridgeWord current (second :: rest) filler after (production first)) := by
  cases current <;>
    simp [segmentedWord, bridgeWord, digitWeight, machineSymbolValue,
      HaltCleanup.TagStep, Macroperiod.tagStep?_eight, List.append_assoc]

theorem bridgeWord_step_more (current : MachineSymbol)
    (first second : TagSymbol) (rest : List TagSymbol) (filler : TagSymbol)
    (after payload : List TagSymbol) :
    HaltCleanup.TagStep
      (bridgeWord current (first :: second :: rest) filler after payload)
      (bridgeWord current (second :: rest) filler after
        (payload ++ production first)) := by
  cases current <;>
    simp [bridgeWord, digitWeight, machineSymbolValue,
      HaltCleanup.TagStep, Macroperiod.tagStep?_eight, List.append_assoc]

theorem bridgeWord_step_last_after (current : MachineSymbol)
    (first filler next : TagSymbol) (rest payload : List TagSymbol) :
    HaltCleanup.TagStep
      (bridgeWord current [first] filler (next :: rest) payload)
      (rotatedWord current (next :: rest) ++ payload ++ production first) := by
  cases current <;>
    simp [bridgeWord, rotatedWord, digitWeight, machineSymbolValue,
      HaltCleanup.TagStep, Macroperiod.tagStep?_eight, List.append_assoc]

theorem mixedFrontWord_single_step (current : MachineSymbol)
    (first filler : TagSymbol) (payload : List TagSymbol)
    (hlength : machineSymbolValue current ≤ payload.length) :
    HaltCleanup.TagStep
      (mixedFrontWord current first filler [] ++ payload)
      (payload.drop (machineSymbolValue current) ++ production first) := by
  cases current with
  | s0 =>
      simp [mixedFrontWord, digitWeight, machineSymbolValue,
        HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | s1 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a rest =>
          simp [mixedFrontWord, digitWeight, machineSymbolValue,
            HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | s2 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b rest =>
              simp [mixedFrontWord, digitWeight, machineSymbolValue,
                HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | s3 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c rest =>
                  simp [mixedFrontWord, digitWeight, machineSymbolValue,
                    HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | s4 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c payload =>
                  cases payload with
                  | nil => simp [machineSymbolValue] at hlength
                  | cons d rest =>
                      simp [mixedFrontWord, digitWeight, machineSymbolValue,
                        HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | s5 =>
      cases payload with
      | nil => simp [machineSymbolValue] at hlength
      | cons a payload =>
          cases payload with
          | nil => simp [machineSymbolValue] at hlength
          | cons b payload =>
              cases payload with
              | nil => simp [machineSymbolValue] at hlength
              | cons c payload =>
                  cases payload with
                  | nil => simp [machineSymbolValue] at hlength
                  | cons d payload =>
                      cases payload with
                      | nil => simp [machineSymbolValue] at hlength
                      | cons e rest =>
                          simp [mixedFrontWord, digitWeight,
                            machineSymbolValue, HaltCleanup.TagStep,
                            Macroperiod.tagStep?_eight]

theorem bridgeWord_step_last_empty (current : MachineSymbol)
    (first filler : TagSymbol) (payload : List TagSymbol)
    (hlength : machineSymbolValue current ≤ payload.length) :
    HaltCleanup.TagStep
      (bridgeWord current [first] filler [] payload)
      (payload.drop (machineSymbolValue current) ++ production first) := by
  simpa [bridgeWord, mixedFrontWord] using
    (mixedFrontWord_single_step current first filler payload hlength)

theorem bridgeWord_scan (current : MachineSymbol) (filler : TagSymbol) :
    ∀ (before after payload : List TagSymbol),
      before ≠ [] →
      machineSymbolValue current ≤ payload.length →
      HaltCleanup.TagStepsN before.length
        (bridgeWord current before filler after payload)
        (match after with
         | [] => payload.drop (machineSymbolValue current) ++
             before.flatMap production
         | next :: rest => rotatedWord current (next :: rest) ++ payload ++
             before.flatMap production)
  | [], after, payload, hnonempty, hlength => (hnonempty rfl).elim
  | first :: [], [], payload, hnonempty, hlength => by
      have hone := bridgeWord_step_last_empty current first filler payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (HaltCleanup.TagStepsN.succ hone
          (HaltCleanup.TagStepsN.zero _))
  | first :: [], next :: rest, payload, hnonempty, hlength => by
      have hone := bridgeWord_step_last_after current first filler next rest payload
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (HaltCleanup.TagStepsN.succ hone
          (HaltCleanup.TagStepsN.zero _))
  | first :: second :: rest, after, payload, hnonempty, hlength => by
      have hone := bridgeWord_step_more current first second rest filler after payload
      have hlength' : machineSymbolValue current ≤
          (payload ++ production first).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length (production first).length)
      have hrest := bridgeWord_scan current filler (second :: rest) after
        (payload ++ production first) (List.cons_ne_nil _ _) hlength'
      have hchain := HaltCleanup.TagStepsN.succ hone hrest
      cases after with
      | nil =>
          simpa only [List.length_cons, List.flatMap_cons,
            drop_append_of_le_length_clean hlength,
            List.append_assoc] using hchain
      | cons next afterRest =>
          simpa only [List.length_cons, List.flatMap_cons,
            List.append_assoc] using hchain

theorem segmentedWord_scan (current : MachineSymbol) (first : TagSymbol)
    (before : List TagSymbol) (filler : TagSymbol) (after : List TagSymbol)
    (hbefore : before ≠ [])
    (hproduction : machineSymbolValue current ≤ (production first).length) :
    HaltCleanup.TagStepsN (before.length + 1 + after.length)
      (segmentedWord current first before filler after)
      ((production first).drop (machineSymbolValue current) ++
        before.flatMap production ++ after.flatMap production) := by
  cases before with
  | nil => exact (hbefore rfl).elim
  | cons second rest =>
      have hone := segmentedWord_step current first second rest filler after
      have hbridge := bridgeWord_scan current filler (second :: rest) after
        (production first) (List.cons_ne_nil _ _) hproduction
      have hprefix := HaltCleanup.TagStepsN.succ hone hbridge
      cases after with
      | nil =>
          simpa only [List.length_cons, List.length_nil, Nat.add_zero,
            List.flatMap_cons, List.flatMap_nil, List.append_nil,
            Nat.add_assoc] using hprefix
      | cons next afterRest =>
          have hafterLength : machineSymbolValue current ≤
              ((production first) ++
                (second :: rest).flatMap production).length := by
            rw [List.length_append]
            exact Nat.le_trans hproduction
              (Nat.le_add_right (production first).length
                ((second :: rest).flatMap production).length)
          have hafter := rotatedWord_scan_aux current (next :: afterRest)
            ((production first) ++ (second :: rest).flatMap production)
            (List.cons_ne_nil _ _) hafterLength
          have hprefix' : HaltCleanup.TagStepsN ((second :: rest).length + 1)
              (segmentedWord current first (second :: rest) filler
                (next :: afterRest))
              (rotatedWord current (next :: afterRest) ++
                ((production first) ++
                  (second :: rest).flatMap production)) := by
            simpa only [List.append_assoc] using hprefix
          have hcombined := HaltCleanup.TagStepsN.append hprefix' hafter
          rw [Nat.add_comm (next :: afterRest).length
            ((second :: rest).length + 1)] at hcombined
          simpa only [List.length_cons, List.flatMap_cons,
            drop_append_of_le_length_clean hproduction,
            List.append_assoc, Nat.add_assoc] using hcombined

theorem rightRepresentedWord_eq_segmented (config : MachineConfig) :
    arrivalWord .right .representedCell config =
      segmentedWord config.current (.head config.state)
        (List.replicate (leftUnits config.left) (.left config.state))
        (.right config.state)
        (List.replicate (rightUnits config.right) (.right config.state)) := by
  cases config with
  | mk state current left right =>
      unfold arrivalWord arrivalCounts runWord regularRightArrivalExponent
        segmentedWord
      simp only [Rogozhin46.Config.state, Rogozhin46.Config.current,
        Rogozhin46.Config.left, Rogozhin46.Config.right, RunCounts.head,
        RunCounts.left, RunCounts.right, List.replicate_one,
        leftCounter_eq_radix_mul_units,
        rightCounter_eq_radix_mul_units, List.flatMap_replicate]
      rw [List.flatten_replicate_replicate,
        List.flatten_replicate_replicate]
      rw [Nat.mul_comm (leftUnits left) 8,
        Nat.mul_comm (rightUnits right) 8]
      simp only [List.cons_append, List.singleton_append, List.nil_append]
      rw [replicate_add_clean]
      simp only [List.append_assoc]

theorem right_represented_to_indexed (config : MachineConfig) :
    HaltCleanup.TagStepsN (generationFamilies config).length
      (arrivalWord .right .representedCell config)
      (indexedRowsWord config.current config.state
        (generationFamilies config)) := by
  have hleftNonempty :
      List.replicate (leftUnits config.left)
        (TagSymbol.left config.state) ≠ [] := by
    intro hempty
    have hlength := congrArg List.length hempty
    simp only [List.length_replicate, List.length_nil] at hlength
    exact (Nat.ne_of_gt (leftUnits_pos config.left)) hlength
  have hheadLength : machineSymbolValue config.current ≤
      (production (.head config.state)).length := by
    simp only [production_head, List.length_map, indices_length]
    exact Nat.le_trans (machineSymbolValue_le_five config.current)
      (by decide)
  have trace := segmentedWord_scan config.current (.head config.state)
    (List.replicate (leftUnits config.left) (.left config.state))
    (.right config.state)
    (List.replicate (rightUnits config.right) (.right config.state))
    hleftNonempty hheadLength
  rw [← rightRepresentedWord_eq_segmented config] at trace
  have htail :
      (List.replicate (leftUnits config.left)
          (TagSymbol.left config.state)).flatMap production ++
        (List.replicate (rightUnits config.right)
          (TagSymbol.right config.state)).flatMap production =
      ((generationFamilies config).tail).flatMap
        (fun family => production (unindexedSymbol config.state family)) := by
    cases config with
    | mk state current left right =>
        simp [generationFamilies, unindexedSymbol, List.flatMap_append,
          List.flatMap_replicate]
  have htarget := first_generation_target config
  rw [List.append_assoc] at trace
  rw [htail, htarget] at trace
  simpa only [generationFamilies, List.length_cons, List.length_append,
    List.length_replicate, Nat.add_assoc] using trace

namespace ProperTagSteps

theorem map_property {firstProperty secondProperty : List TagSymbol → Prop}
    (hmap : ∀ word, firstProperty word → secondProperty word)
    {steps : Nat} {source target : List TagSymbol}
    (trace : ProperTagSteps firstProperty steps source target) :
    ProperTagSteps secondProperty steps source target := by
  induction trace with
  | one first => exact .one first
  | more first middle rest ih => exact .more first (hmap _ middle) ih

theorem append_proper {property : List TagSymbol → Prop}
    {firstSteps secondSteps : Nat}
    {source middle target : List TagSymbol}
    (first : ProperTagSteps property firstSteps source middle)
    (hmiddle : property middle)
    (second : ProperTagSteps property secondSteps middle target) :
    ProperTagSteps property (secondSteps + firstSteps) source target := by
  induction first with
  | one firstStep =>
      simpa only [Nat.add_comm secondSteps 1] using
        (ProperTagSteps.more firstStep hmiddle second)
  | @more source next middle restSteps firstStep hnext rest ih =>
      have htail := ih hmiddle second
      have hall := ProperTagSteps.more firstStep hnext htail
      simpa only [Nat.add_assoc] using hall

end ProperTagSteps

/-! ### Terminal arrival exclusion -/

/-- Every complete indexed halt row contains its first indexed symbol. -/
theorem haltRow_containsIndexed (state : HaltCleanup.HaltState)
    (family : Family) :
    ContainsIndexed (HaltCleanup.row state family) := by
  refine ⟨family, state.toMachineState, .j1, ?_⟩
  cases state <;> cases family <;> simp [HaltCleanup.row, indices]

/-- Every five-symbol halt-row suffix contains its `j=4` indexed symbol. -/
theorem haltRowSuffixFive_containsIndexed (state : HaltCleanup.HaltState)
    (family : Family) :
    ContainsIndexed (HaltCleanup.rowSuffixFive state family) := by
  refine ⟨family, state.toMachineState, .j4, ?_⟩
  cases state <;> cases family <;> simp [HaltCleanup.rowSuffixFive]

/-- During the first halted cleanup sweep, every proper positive endpoint
contains one of the complete indexed rows already appended by that sweep. -/
theorem haltFirstSweep_proper (state : HaltCleanup.HaltState)
    (first : HaltCleanup.FamilyBlock) :
    ∀ (rest : List HaltCleanup.FamilyBlock) (suffix : List TagSymbol),
      ProperTagSteps ContainsIndexed (rest.length + 1)
        (HaltCleanup.blocksWord state (first :: rest) ++ suffix)
        (suffix ++ HaltCleanup.rowsWord state
          (HaltCleanup.selectedFamilies (first :: rest)))
  | [], suffix => by
      have step := HaltCleanup.TagStepsN.block_step state first suffix
      simpa [HaltCleanup.blocksWord, HaltCleanup.selectedFamilies,
        HaltCleanup.rowsWord] using
        (ProperTagSteps.one (property := ContainsIndexed) step)
  | next :: rest, suffix => by
      have step := HaltCleanup.TagStepsN.block_step state first
        (HaltCleanup.blocksWord state (next :: rest) ++ suffix)
      have middleContains : ContainsIndexed
          ((HaltCleanup.blocksWord state (next :: rest) ++ suffix) ++
            HaltCleanup.row state first.first) :=
        containsIndexed_append_right
          (haltRow_containsIndexed state first.first)
      have remaining := haltFirstSweep_proper state next rest
        (suffix ++ HaltCleanup.row state first.first)
      have remaining' : ProperTagSteps ContainsIndexed (rest.length + 1)
          ((HaltCleanup.blocksWord state (next :: rest) ++ suffix) ++
            HaltCleanup.row state first.first)
          ((suffix ++ HaltCleanup.row state first.first) ++
            HaltCleanup.rowsWord state
              (HaltCleanup.selectedFamilies (next :: rest))) := by
        simpa only [List.append_assoc] using remaining
      have combined := ProperTagSteps.more step middleContains remaining'
      simpa only [HaltCleanup.blocksWord, HaltCleanup.selectedFamilies,
        HaltCleanup.rowsWord, List.length_cons, List.append_assoc] using! combined

/-- Draining a nonempty sequence of indexed rows preserves an indexed
five-symbol suffix at every proper positive endpoint. -/
theorem haltDrainRows_proper (state : HaltCleanup.HaltState)
    (first next : Family) :
    ∀ (rest : List Family) (tail : List TagSymbol),
      ∃ last : Family,
        ProperTagSteps ContainsIndexed (rest.length + 1)
          (HaltCleanup.rowSuffixFive state first ++
            HaltCleanup.rowsWord state (next :: rest) ++ tail)
          (HaltCleanup.rowSuffixFive state last ++ tail)
  | [], tail => by
      refine ⟨next, ?_⟩
      have step := HaltCleanup.TagStepsN.rowSuffix_step state first next tail
      simpa [HaltCleanup.rowsWord] using
        (ProperTagSteps.one (property := ContainsIndexed) step)
  | later :: rest, tail => by
      have step := HaltCleanup.TagStepsN.rowSuffix_step state first next
        (HaltCleanup.rowsWord state (later :: rest) ++ tail)
      have middleContains : ContainsIndexed
          (HaltCleanup.rowSuffixFive state next ++
            HaltCleanup.rowsWord state (later :: rest) ++ tail) :=
        containsIndexed_append_left
          (containsIndexed_append_left
            (haltRowSuffixFive_containsIndexed state next))
      obtain ⟨last, remaining⟩ :=
        haltDrainRows_proper state next later rest tail
      refine ⟨last, ?_⟩
      have combined := ProperTagSteps.more step middleContains remaining
      simpa only [HaltCleanup.rowsWord, List.length_cons,
        List.append_assoc] using combined

/-- The second halted cleanup sweep retains indexed syntax at every proper
positive endpoint and exposes one final indexed row suffix. -/
theorem haltSecondSweep_proper (certificate : HaltCleanup.Certified)
    (first : Family) (rest : List Family) :
    ∃ last : Family,
      ProperTagSteps ContainsIndexed (rest.length + 1)
        (certificate.terminalWord ++
          HaltCleanup.rowsWord certificate.state (first :: rest))
        (HaltCleanup.rowSuffixFive certificate.state last ++
          HaltCleanup.row certificate.state certificate.terminalFamily) := by
  cases rest with
  | nil =>
      refine ⟨first, ?_⟩
      have step := HaltCleanup.TagStepsN.terminal_step certificate first []
      simpa only [HaltCleanup.rowsWord, List.nil_append, List.append_nil] using!
        (ProperTagSteps.one (property := ContainsIndexed) step)
  | cons next rest =>
      have step := HaltCleanup.TagStepsN.terminal_step certificate first
        (next :: rest)
      have middleContains : ContainsIndexed
          ((HaltCleanup.rowSuffixFive certificate.state first ++
            HaltCleanup.rowsWord certificate.state (next :: rest)) ++
            HaltCleanup.row certificate.state certificate.terminalFamily) :=
        containsIndexed_append_left
          (containsIndexed_append_left
            (haltRowSuffixFive_containsIndexed certificate.state first))
      obtain ⟨last, remaining⟩ := haltDrainRows_proper certificate.state
        first next rest
        (HaltCleanup.row certificate.state certificate.terminalFamily)
      refine ⟨last, ?_⟩
      have combined := ProperTagSteps.more step middleContains remaining
      simpa only [List.length_cons, List.append_assoc] using combined

/-- The exact arbitrary-side halt cleanup has indexed syntax at every proper
positive deletion-eight boundary. -/
theorem certified_cleanup_proper (certificate : HaltCleanup.Certified) :
    ProperTagSteps ContainsIndexed
      (HaltCleanup.cleanupTagSteps certificate)
      certificate.word certificate.residue := by
  cases blocksEq : certificate.blocks with
  | nil => exact (certificate.blocks_nonempty blocksEq).elim
  | cons first rest =>
      have firstSweep := haltFirstSweep_proper certificate.state first rest
        certificate.terminalWord
      have firstSweep' : ProperTagSteps ContainsIndexed (rest.length + 1)
          certificate.word
          (certificate.terminalWord ++
            HaltCleanup.rowsWord certificate.state
              (HaltCleanup.selectedFamilies certificate.blocks)) := by
        simpa only [HaltCleanup.Certified.word, blocksEq] using firstSweep
      have firstEndpoint : ContainsIndexed
          (certificate.terminalWord ++
            HaltCleanup.rowsWord certificate.state
              (HaltCleanup.selectedFamilies certificate.blocks)) := by
        rw [blocksEq]
        apply containsIndexed_append_right
        apply containsIndexed_append_left
        exact haltRow_containsIndexed certificate.state first.first
      obtain ⟨last, secondSweep⟩ := haltSecondSweep_proper certificate
        first.first (HaltCleanup.selectedFamilies rest)
      have secondSweep' : ProperTagSteps ContainsIndexed (rest.length + 1)
          (certificate.terminalWord ++
            HaltCleanup.rowsWord certificate.state
              (HaltCleanup.selectedFamilies certificate.blocks))
          (HaltCleanup.rowSuffixFive certificate.state last ++
            HaltCleanup.row certificate.state certificate.terminalFamily) := by
        simpa only [blocksEq, HaltCleanup.selectedFamilies,
          List.length_map] using! secondSweep
      have firstTwo := ProperTagSteps.append_proper firstSweep'
        firstEndpoint secondSweep'
      have secondEndpoint : ContainsIndexed
          (HaltCleanup.rowSuffixFive certificate.state last ++
            HaltCleanup.row certificate.state certificate.terminalFamily) :=
        containsIndexed_append_left
          (haltRowSuffixFive_containsIndexed certificate.state last)
      have finalStep : ProperTagSteps ContainsIndexed 1
          (HaltCleanup.rowSuffixFive certificate.state last ++
            HaltCleanup.row certificate.state certificate.terminalFamily)
          certificate.residue :=
        ProperTagSteps.one
          (HaltCleanup.TagStepsN.thirdSweep certificate last)
      have full := ProperTagSteps.append_proper firstTwo secondEndpoint finalStep
      simp only [HaltCleanup.cleanupTagSteps,
        HaltCleanup.Certified.word_length_div_eight,
        HaltCleanup.Certified.sweepCount, blocksEq, List.length_cons]
      simpa only [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm] using full

/-- Every positive totalized deletion-eight iterate of a certified halting
boundary contains an indexed Cook symbol.  After enabled cleanup terminates,
the totalized runner remains at the five-symbol indexed residue. -/
theorem haltCleanup_run_containsIndexed
    (certificate : HaltCleanup.Certified) (steps : Nat)
    (positive : 0 < steps) :
    ContainsIndexed (TagTrajectory.run steps certificate.word) := by
  let total := HaltCleanup.cleanupTagSteps certificate
  by_cases before : steps < total
  · have prefixTrace := TagTrajectory.run_prefix_of_steps
      (Nat.le_of_lt before) (HaltCleanup.TagStepsN.certified_cleanup certificate)
    exact (certified_cleanup_proper certificate).proper_prefix
      positive before prefixTrace
  · have totalLe : total ≤ steps := Nat.le_of_not_gt before
    obtain ⟨later, stepsEq⟩ := Nat.exists_eq_add_of_le totalLe
    have endpoint := TagTrajectory.eq_run_of_steps
      (HaltCleanup.TagStepsN.certified_cleanup certificate)
    have endpoint' : certificate.residue =
        TagTrajectory.run total certificate.word := by
      simpa only [total, HaltCleanup.cleanupTagSteps] using endpoint
    have residueShort : certificate.residue.length < 8 := by
      rw [HaltCleanup.Certified.residue_length]
      decide
    rw [stepsEq, Nat.add_comm, TagTrajectory.run_add, ← endpoint',
      TagTrajectory.run_of_short residueShort]
    exact haltRowSuffixFive_containsIndexed certificate.state
      certificate.terminalFamily

/-- No positive cleanup iterate of a certified halting boundary is a
registered directional Rogozhin arrival. -/
theorem haltCleanup_run_notArrivalReadable
    (certificate : HaltCleanup.Certified) (steps : Nat)
    (positive : 0 < steps) :
    ¬ ArrivalReadable (TagTrajectory.run steps certificate.word) :=
  not_arrivalReadable_of_containsIndexed
    (haltCleanup_run_containsIndexed certificate steps positive)

theorem bridgeWord_contains_payload (current : MachineSymbol)
    (first : TagSymbol) (rest : List TagSymbol) (filler : TagSymbol)
    (after payload : List TagSymbol) (hpayload : ContainsIndexed payload) :
    ContainsIndexed
      (bridgeWord current (first :: rest) filler after payload) := by
  let frontPart : List TagSymbol :=
    first :: rest.flatMap (List.replicate 8) ++
      List.replicate (digitWeight current) filler ++
      after.flatMap (List.replicate 8)
  have hcontains : ContainsIndexed (frontPart ++ payload) :=
    containsIndexed_append_right hpayload
  simpa only [bridgeWord, frontPart, List.append_assoc] using hcontains

theorem bridgeWord_scan_proper (current : MachineSymbol)
    (filler : TagSymbol) :
    ∀ (before after payload : List TagSymbol),
      before ≠ [] →
      machineSymbolValue current ≤ payload.length →
      ContainsIndexed payload →
      ProperTagSteps ContainsIndexed before.length
        (bridgeWord current before filler after payload)
        (match after with
         | [] => payload.drop (machineSymbolValue current) ++
             before.flatMap production
         | next :: rest => rotatedWord current (next :: rest) ++ payload ++
             before.flatMap production)
  | [], after, payload, hnonempty, hlength, hpayload =>
      (hnonempty rfl).elim
  | first :: [], [], payload, hnonempty, hlength, hpayload => by
      have hone := bridgeWord_step_last_empty current first filler payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (ProperTagSteps.one (property := ContainsIndexed) hone)
  | first :: [], next :: rest, payload, hnonempty, hlength, hpayload => by
      have hone := bridgeWord_step_last_after current first filler next rest payload
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (ProperTagSteps.one (property := ContainsIndexed) hone)
  | first :: second :: rest, after, payload, hnonempty, hlength, hpayload => by
      have hone := bridgeWord_step_more current first second rest filler after payload
      have hmiddle : ContainsIndexed
          (bridgeWord current (second :: rest) filler after
            (payload ++ production first)) :=
        bridgeWord_contains_payload current second rest filler after
          (payload ++ production first)
          (containsIndexed_append_left hpayload)
      have hlength' : machineSymbolValue current ≤
          (payload ++ production first).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length (production first).length)
      have hrest := bridgeWord_scan_proper current filler (second :: rest)
        after (payload ++ production first) (List.cons_ne_nil _ _)
        hlength' (containsIndexed_append_left hpayload)
      have hproper := ProperTagSteps.more hone hmiddle hrest
      cases after with
      | nil =>
          simpa only [List.length_cons, List.flatMap_cons,
            drop_append_of_le_length_clean hlength,
            List.append_assoc] using hproper
      | cons next afterRest =>
          simpa only [List.length_cons, List.flatMap_cons,
            List.append_assoc] using hproper

theorem segmentedWord_scan_proper (current : MachineSymbol)
    (first : TagSymbol) (before : List TagSymbol) (filler : TagSymbol)
    (after : List TagSymbol) (hbefore : before ≠ [])
    (hproduction : machineSymbolValue current ≤ (production first).length)
    (hfirstIndexed : ContainsIndexed (production first))
    (hafterIndexed : ∀ symbol, symbol ∈ after →
      ContainsIndexed (production symbol)) :
    ProperTagSteps ContainsIndexed (before.length + 1 + after.length)
      (segmentedWord current first before filler after)
      ((production first).drop (machineSymbolValue current) ++
        before.flatMap production ++ after.flatMap production) := by
  cases before with
  | nil => exact (hbefore rfl).elim
  | cons second rest =>
      have hone := segmentedWord_step current first second rest filler after
      have hmiddle : ContainsIndexed
          (bridgeWord current (second :: rest) filler after
            (production first)) :=
        bridgeWord_contains_payload current second rest filler after
          (production first) hfirstIndexed
      have hbridge := bridgeWord_scan_proper current filler (second :: rest)
        after (production first) (List.cons_ne_nil _ _) hproduction
        hfirstIndexed
      have hprefix := ProperTagSteps.more hone hmiddle hbridge
      cases after with
      | nil =>
          simpa only [List.length_cons, List.length_nil, Nat.add_zero,
            List.flatMap_cons, List.flatMap_nil, List.append_nil,
            Nat.add_assoc] using hprefix
      | cons next afterRest =>
          have hafterLength : machineSymbolValue current ≤
              ((production first) ++
                (second :: rest).flatMap production).length := by
            rw [List.length_append]
            exact Nat.le_trans hproduction
              (Nat.le_add_right (production first).length
                ((second :: rest).flatMap production).length)
          have hallAfter : ∀ symbol, symbol ∈ next :: afterRest →
              ContainsIndexed (production symbol) := by
            intro symbol hmem
            exact hafterIndexed symbol hmem
          have hafter := rotatedWord_scan_aux_proper current
            (next :: afterRest)
            ((production first) ++ (second :: rest).flatMap production)
            (List.cons_ne_nil _ _) hafterLength hallAfter
          have hboundary : ContainsIndexed
              (rotatedWord current (next :: afterRest) ++
                ((production first) ++
                  (second :: rest).flatMap production)) :=
            containsIndexed_append_right
              (containsIndexed_append_left hfirstIndexed)
          have hprefix' : ProperTagSteps ContainsIndexed
              ((second :: rest).length + 1)
              (segmentedWord current first (second :: rest) filler
                (next :: afterRest))
              (rotatedWord current (next :: afterRest) ++
                ((production first) ++
                  (second :: rest).flatMap production)) := by
            simpa only [List.append_assoc] using hprefix
          have hcombined := ProperTagSteps.append_proper hprefix'
            hboundary hafter
          rw [Nat.add_comm (next :: afterRest).length
            ((second :: rest).length + 1)] at hcombined
          simpa only [List.length_cons, List.flatMap_cons,
            drop_append_of_le_length_clean hproduction,
            List.append_assoc, Nat.add_assoc] using hcombined

theorem mixedFrontWord_scan_proper (current : MachineSymbol)
    (first filler second : TagSymbol) (rest : List TagSymbol)
    (hproduction : machineSymbolValue current ≤ (production first).length)
    (hfirstIndexed : ContainsIndexed (production first))
    (hrestIndexed : ∀ symbol, symbol ∈ second :: rest →
      ContainsIndexed (production symbol)) :
    ProperTagSteps ContainsIndexed ((second :: rest).length + 1)
      (mixedFrontWord current first filler (second :: rest))
      ((production first).drop (machineSymbolValue current) ++
        (second :: rest).flatMap production) := by
  have hone := mixedFrontWord_step current first filler second rest
  have hmiddle : ContainsIndexed
      (rotatedWord current (second :: rest) ++ production first) :=
    containsIndexed_append_right hfirstIndexed
  have hrest := rotatedWord_scan_aux_proper current (second :: rest)
    (production first) (List.cons_ne_nil _ _) hproduction hrestIndexed
  exact ProperTagSteps.more hone hmiddle hrest

theorem left_represented_scan_proper (config : MachineConfig) :
    ProperTagSteps ContainsIndexed (generationFamilies config).length
      (arrivalWord .left .representedCell config)
      (indexedRowsWord config.current config.state
        (generationFamilies config)) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      let restFamilies : List Family :=
        List.replicate count .L ++
          List.replicate (rightUnits config.right) .R
      let restSymbols : List TagSymbol :=
        List.replicate count (.left config.state) ++
          List.replicate (rightUnits config.right) (.right config.state)
      have hfamilies : generationFamilies config = .H :: .L :: restFamilies := by
        rw [generationFamilies, hcount, List.replicate_succ]
        simp only [restFamilies, List.cons_append]
      have hsymbols :
          List.replicate (leftUnits config.left) (.left config.state) ++
            List.replicate (rightUnits config.right) (.right config.state) =
          .left config.state :: restSymbols := by
        rw [hcount, List.replicate_succ]
        simp only [restSymbols, List.cons_append]
      have hheadLength : machineSymbolValue config.current ≤
          (production (.head config.state)).length := by
        simp only [production_head, List.length_map, indices_length]
        exact Nat.le_trans (machineSymbolValue_le_five config.current)
          (by decide)
      have hrestIndexed : ∀ symbol,
          symbol ∈ .left config.state :: restSymbols →
          ContainsIndexed (production symbol) := by
        intro symbol hmem
        simp only [List.mem_cons] at hmem
        rcases hmem with rfl | hmem
        · exact production_unindexed_containsIndexed config.state .L
        · simp only [restSymbols, List.mem_append,
            List.mem_replicate] at hmem
          rcases hmem with ⟨_, rfl⟩ | ⟨_, rfl⟩
          · exact production_unindexed_containsIndexed config.state .L
          · exact production_unindexed_containsIndexed config.state .R
      have trace := mixedFrontWord_scan_proper config.current
        (.head config.state) (.left config.state) (.left config.state)
        restSymbols hheadLength
        (production_unindexed_containsIndexed config.state .H)
        hrestIndexed
      rw [← hsymbols] at trace
      rw [← leftRepresentedWord_eq_mixed config] at trace
      have htarget := first_generation_target config
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [hsymbols, restSymbols, restFamilies, List.length_cons,
        List.length_append, List.length_replicate, List.flatMap_cons,
        List.flatMap_append, List.flatMap_replicate,
        List.flatten_replicate_replicate, unindexedSymbol,
        List.tail_cons, Nat.add_assoc] using trace

theorem right_represented_scan_proper (config : MachineConfig) :
    ProperTagSteps ContainsIndexed (generationFamilies config).length
      (arrivalWord .right .representedCell config)
      (indexedRowsWord config.current config.state
        (generationFamilies config)) := by
  have hleftNonempty :
      List.replicate (leftUnits config.left)
        (TagSymbol.left config.state) ≠ [] := by
    intro hempty
    have hlength := congrArg List.length hempty
    simp only [List.length_replicate, List.length_nil] at hlength
    exact (Nat.ne_of_gt (leftUnits_pos config.left)) hlength
  have hheadLength : machineSymbolValue config.current ≤
      (production (.head config.state)).length := by
    simp only [production_head, List.length_map, indices_length]
    exact Nat.le_trans (machineSymbolValue_le_five config.current)
      (by decide)
  have hafterIndexed : ∀ symbol,
      symbol ∈ List.replicate (rightUnits config.right)
        (TagSymbol.right config.state) →
      ContainsIndexed (production symbol) := by
    intro symbol hmem
    have heq := eq_of_mem_replicate_clean hmem
    rw [heq]
    exact production_unindexed_containsIndexed config.state .R
  have trace := segmentedWord_scan_proper config.current (.head config.state)
    (List.replicate (leftUnits config.left) (.left config.state))
    (.right config.state)
    (List.replicate (rightUnits config.right) (.right config.state))
    hleftNonempty hheadLength
    (production_unindexed_containsIndexed config.state .H) hafterIndexed
  rw [← rightRepresentedWord_eq_segmented config] at trace
  have htail :
      (List.replicate (leftUnits config.left)
          (TagSymbol.left config.state)).flatMap production ++
        (List.replicate (rightUnits config.right)
          (TagSymbol.right config.state)).flatMap production =
      ((generationFamilies config).tail).flatMap
        (fun family => production (unindexedSymbol config.state family)) := by
    cases config with
    | mk state current left right =>
        simp [generationFamilies, unindexedSymbol, List.flatMap_append,
          List.flatMap_replicate]
  have htarget := first_generation_target config
  rw [List.append_assoc] at trace
  rw [htail, htarget] at trace
  simpa only [generationFamilies, List.length_cons, List.length_append,
    List.length_replicate, Nat.add_assoc] using trace

theorem proper_notArrival_of_indexed {steps : Nat}
    {source target : List TagSymbol}
    (trace : ProperTagSteps ContainsIndexed steps source target) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word) steps source target :=
  trace.map_property fun _ hcontains =>
    not_arrivalReadable_of_containsIndexed hcontains

theorem proper_notArrival_of_rightStar {steps : Nat}
    {source target : List TagSymbol}
    (trace : ProperTagSteps ContainsRightStar steps source target) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word) steps source target :=
  trace.map_property fun _ hcontains =>
    not_arrivalReadable_of_containsRightStar hcontains

/-- Any certified first unindexed sweep can be extended through the reflected
ordinary selector and, for a left move, through the `R*` cleanup. -/
theorem transition_proper_from_first_sweep
    (start : List TagSymbol) (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol)
    (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction)
    (first : ProperTagSteps ContainsIndexed
      (generationFamilies source).length start
      (indexedRowsWord source.current source.state
        (generationFamilies source))) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word)
      (firstArrivalTime source written direction) start
      (expectedEndpoint source next written direction) := by
  have firstQ := proper_notArrival_of_indexed first
  have secondIndexed := indexed_scan_proper source next written direction hcommand
  have secondQ := proper_notArrival_of_indexed secondIndexed
  have hindexed : ¬ ArrivalReadable
      (indexedRowsWord source.current source.state
        (generationFamilies source)) :=
    not_arrivalReadable_of_containsIndexed
      (generationIndexed_containsIndexed source)
  have both := ProperTagSteps.append_proper firstQ hindexed secondQ
  have hselected := selectedProductionWord_directional source next written
    direction hcommand
  cases direction with
  | right =>
      rw [hselected] at both
      simpa only [firstArrivalTime, expectedEndpoint] using both
  | left =>
      rw [hselected] at both
      have cleanupQ := proper_notArrival_of_rightStar
        (left_cleanup_proper_clean source next written)
      have hprecleanup : ¬ ArrivalReadable
          (leftPrecleanupWord source next written) :=
        not_arrivalReadable_of_containsRightStar
          (leftPrecleanup_containsRightStar source next written)
      have all := ProperTagSteps.append_proper both hprecleanup cleanupQ
      simpa only [firstArrivalTime, expectedEndpoint] using all

theorem canonical_transition_proper
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word)
      (firstArrivalTime source written direction)
      (canonicalWord source)
      (expectedEndpoint source next written direction) :=
  transition_proper_from_first_sweep (canonicalWord source) source next
    written direction hcommand (canonical_scan_proper source)

theorem left_represented_transition_proper
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word)
      (firstArrivalTime source written direction)
      (arrivalWord .left .representedCell source)
      (expectedEndpoint source next written direction) :=
  transition_proper_from_first_sweep
    (arrivalWord .left .representedCell source) source next written direction
    hcommand (left_represented_scan_proper source)

theorem right_represented_transition_proper
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (direction : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written direction) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word)
      (firstArrivalTime source written direction)
      (arrivalWord .right .representedCell source)
      (expectedEndpoint source next written direction) :=
  transition_proper_from_first_sweep
    (arrivalWord .right .representedCell source) source next written direction
    hcommand (right_represented_scan_proper source)

/-! ### Periodic-tail marker restoration -/

inductive MarkerOffset where
  | six | seven
  deriving DecidableEq, Repr

def markerDrop : MarkerOffset → Nat
  | .six => 6
  | .seven => 7

def markerKeep : MarkerOffset → Nat
  | .six => 2
  | .seven => 1

def markerIndex : MarkerOffset → Index
  | .six => .j7
  | .seven => .j8

def markerRotated (offset : MarkerOffset) : List TagSymbol → List TagSymbol
  | [] => []
  | first :: rest =>
      List.replicate (markerKeep offset) first ++
        rest.flatMap (List.replicate 8)

def markerRows (offset : MarkerOffset) (state : MachineState) :
    List Family → List TagSymbol
  | [] => []
  | first :: rest =>
      (indexedRow first state).drop (markerDrop offset) ++
        rest.flatMap fun family => indexedRow family state

theorem markerRotated_step (offset : MarkerOffset)
    (first second : TagSymbol) (rest payload : List TagSymbol) :
    HaltCleanup.TagStep
      (markerRotated offset (first :: second :: rest) ++ payload)
      (markerRotated offset (second :: rest) ++ payload ++ production first) := by
  cases offset <;>
    simp [markerRotated, markerKeep, HaltCleanup.TagStep,
      Macroperiod.tagStep?_eight, List.append_assoc]

theorem markerRotated_single_step (offset : MarkerOffset)
    (first : TagSymbol) (payload : List TagSymbol)
    (hlength : markerDrop offset ≤ payload.length) :
    HaltCleanup.TagStep
      (markerRotated offset [first] ++ payload)
      (payload.drop (markerDrop offset) ++ production first) := by
  cases offset with
  | six =>
      cases payload with
      | nil => simp [markerDrop] at hlength
      | cons a payload =>
        cases payload with
        | nil => simp [markerDrop] at hlength
        | cons b payload =>
          cases payload with
          | nil => simp [markerDrop] at hlength
          | cons c payload =>
            cases payload with
            | nil => simp [markerDrop] at hlength
            | cons d payload =>
              cases payload with
              | nil => simp [markerDrop] at hlength
              | cons e payload =>
                cases payload with
                | nil => simp [markerDrop] at hlength
                | cons f rest =>
                    simp [markerRotated, markerKeep, markerDrop,
                      HaltCleanup.TagStep, Macroperiod.tagStep?_eight]
  | seven =>
      cases payload with
      | nil => simp [markerDrop] at hlength
      | cons a payload =>
        cases payload with
        | nil => simp [markerDrop] at hlength
        | cons b payload =>
          cases payload with
          | nil => simp [markerDrop] at hlength
          | cons c payload =>
            cases payload with
            | nil => simp [markerDrop] at hlength
            | cons d payload =>
              cases payload with
              | nil => simp [markerDrop] at hlength
              | cons e payload =>
                cases payload with
                | nil => simp [markerDrop] at hlength
                | cons f payload =>
                  cases payload with
                  | nil => simp [markerDrop] at hlength
                  | cons g rest =>
                      simp [markerRotated, markerKeep, markerDrop,
                        HaltCleanup.TagStep, Macroperiod.tagStep?_eight]

theorem markerRotated_scan_aux (offset : MarkerOffset) :
    ∀ (symbols : List TagSymbol) (payload : List TagSymbol),
      symbols ≠ [] →
      markerDrop offset ≤ payload.length →
      HaltCleanup.TagStepsN symbols.length
        (markerRotated offset symbols ++ payload)
        (payload.drop (markerDrop offset) ++ symbols.flatMap production)
  | [], payload, hnonempty, hlength => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength => by
      have hone := markerRotated_single_step offset first payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (HaltCleanup.TagStepsN.succ hone (HaltCleanup.TagStepsN.zero _))
  | first :: second :: rest, payload, hnonempty, hlength => by
      have hone := markerRotated_step offset first second rest payload
      have hlength' : markerDrop offset ≤
          (payload ++ production first).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length (production first).length)
      have hrest := markerRotated_scan_aux offset (second :: rest)
        (payload ++ production first) (List.cons_ne_nil _ _) hlength'
      have hrest' : HaltCleanup.TagStepsN (second :: rest).length
          ((markerRotated offset (second :: rest) ++ payload) ++
            production first)
          ((payload ++ production first).drop (markerDrop offset) ++
            (second :: rest).flatMap production) := by
        simpa only [List.append_assoc] using hrest
      have hchain := HaltCleanup.TagStepsN.succ hone hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hchain

theorem markerRows_step (offset : MarkerOffset) (state : MachineState)
    (first second : Family) (rest : List Family)
    (payload : List TagSymbol) :
    HaltCleanup.TagStep
      (markerRows offset state (first :: second :: rest) ++ payload)
      (markerRows offset state (second :: rest) ++ payload ++
        production (.indexed first state (markerIndex offset))) := by
  cases offset <;> cases first <;>
    simp [markerRows, markerDrop, markerIndex, indexedRow, indices,
      HaltCleanup.TagStep, Macroperiod.tagStep?_eight, List.append_assoc]

theorem markerRows_single_step (offset : MarkerOffset) (state : MachineState)
    (first : Family) (payload : List TagSymbol)
    (hlength : markerDrop offset ≤ payload.length) :
    HaltCleanup.TagStep
      (markerRows offset state [first] ++ payload)
      (payload.drop (markerDrop offset) ++
        production (.indexed first state (markerIndex offset))) := by
  cases offset with
  | six =>
      cases payload with
      | nil => simp [markerDrop] at hlength
      | cons a payload =>
        cases payload with
        | nil => simp [markerDrop] at hlength
        | cons b payload =>
          cases payload with
          | nil => simp [markerDrop] at hlength
          | cons c payload =>
            cases payload with
            | nil => simp [markerDrop] at hlength
            | cons d payload =>
              cases payload with
              | nil => simp [markerDrop] at hlength
              | cons e payload =>
                cases payload with
                | nil => simp [markerDrop] at hlength
                | cons f rest =>
                    cases first <;>
                      simp [markerRows, markerDrop, markerIndex, indexedRow,
                        indices, HaltCleanup.TagStep,
                        Macroperiod.tagStep?_eight]
  | seven =>
      cases payload with
      | nil => simp [markerDrop] at hlength
      | cons a payload =>
        cases payload with
        | nil => simp [markerDrop] at hlength
        | cons b payload =>
          cases payload with
          | nil => simp [markerDrop] at hlength
          | cons c payload =>
            cases payload with
            | nil => simp [markerDrop] at hlength
            | cons d payload =>
              cases payload with
              | nil => simp [markerDrop] at hlength
              | cons e payload =>
                cases payload with
                | nil => simp [markerDrop] at hlength
                | cons f payload =>
                  cases payload with
                  | nil => simp [markerDrop] at hlength
                  | cons g rest =>
                      cases first <;>
                        simp [markerRows, markerDrop, markerIndex, indexedRow,
                          indices, HaltCleanup.TagStep,
                          Macroperiod.tagStep?_eight]

theorem markerRows_scan_aux (offset : MarkerOffset) (state : MachineState) :
    ∀ (families : List Family) (payload : List TagSymbol),
      families ≠ [] →
      markerDrop offset ≤ payload.length →
      HaltCleanup.TagStepsN families.length
        (markerRows offset state families ++ payload)
        (payload.drop (markerDrop offset) ++
          families.flatMap fun family =>
            production (.indexed family state (markerIndex offset)))
  | [], payload, hnonempty, hlength => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength => by
      have hone := markerRows_single_step offset state first payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (HaltCleanup.TagStepsN.succ hone (HaltCleanup.TagStepsN.zero _))
  | first :: second :: rest, payload, hnonempty, hlength => by
      have hone := markerRows_step offset state first second rest payload
      have hlength' : markerDrop offset ≤
          (payload ++ production
            (.indexed first state (markerIndex offset))).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length
            (production (.indexed first state (markerIndex offset))).length)
      have hrest := markerRows_scan_aux offset state (second :: rest)
        (payload ++ production (.indexed first state (markerIndex offset)))
        (List.cons_ne_nil _ _) hlength'
      have hrest' : HaltCleanup.TagStepsN (second :: rest).length
          ((markerRows offset state (second :: rest) ++ payload) ++
            production (.indexed first state (markerIndex offset)))
          ((payload ++ production
              (.indexed first state (markerIndex offset))).drop
                (markerDrop offset) ++
            (second :: rest).flatMap fun family =>
              production (.indexed family state (markerIndex offset))) := by
        simpa only [List.append_assoc] using hrest
      have hchain := HaltCleanup.TagStepsN.succ hone hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hchain

theorem markerRotated_scan (offset : MarkerOffset)
    (first second : TagSymbol) (rest : List TagSymbol)
    (hlength : markerDrop offset ≤ (production first).length) :
    HaltCleanup.TagStepsN (first :: second :: rest).length
      (markerRotated offset (first :: second :: rest))
      ((production first).drop (markerDrop offset) ++
        (second :: rest).flatMap production) := by
  have hone := markerRotated_step offset first second rest []
  have hrest := markerRotated_scan_aux offset (second :: rest)
    (production first) (List.cons_ne_nil _ _) hlength
  have hrest' : HaltCleanup.TagStepsN (second :: rest).length
      (markerRotated offset (second :: rest) ++ [] ++ production first)
      ((production first).drop (markerDrop offset) ++
        (second :: rest).flatMap production) := by
    simpa only [List.append_nil] using hrest
  have hchain := HaltCleanup.TagStepsN.succ hone hrest'
  simpa only [List.length_cons, List.append_nil] using hchain

theorem markerRows_scan (offset : MarkerOffset) (state : MachineState)
    (first second : Family) (rest : List Family)
    (hlength : markerDrop offset ≤
      (production (.indexed first state (markerIndex offset))).length) :
    HaltCleanup.TagStepsN (first :: second :: rest).length
      (markerRows offset state (first :: second :: rest))
      ((production (.indexed first state (markerIndex offset))).drop
          (markerDrop offset) ++
        (second :: rest).flatMap fun family =>
          production (.indexed family state (markerIndex offset))) := by
  have hone := markerRows_step offset state first second rest []
  have hrest := markerRows_scan_aux offset state (second :: rest)
    (production (.indexed first state (markerIndex offset)))
    (List.cons_ne_nil _ _) hlength
  have hrest' : HaltCleanup.TagStepsN (second :: rest).length
      (markerRows offset state (second :: rest) ++ [] ++
        production (.indexed first state (markerIndex offset)))
      ((production (.indexed first state (markerIndex offset))).drop
          (markerDrop offset) ++
        (second :: rest).flatMap fun family =>
          production (.indexed family state (markerIndex offset))) := by
    simpa only [List.append_nil] using hrest
  have hchain := HaltCleanup.TagStepsN.succ hone hrest'
  simpa only [List.length_cons, List.append_nil] using hchain

def rightMarkerFamilies (config : MachineConfig) : List Family :=
  .H :: List.replicate (leftUnits config.left) .L

def rightMarkerSymbols (config : MachineConfig) : List TagSymbol :=
  .head config.state ::
    List.replicate (leftUnits config.left) (.left config.state)

theorem rightPeriodicWord_eq_markerRotated (config : MachineConfig)
    (hcurrent : config.current = .s4) (hright : config.right = []) :
    arrivalWord .right .periodicTail config =
      markerRotated .seven (rightMarkerSymbols config) := by
  cases config with
  | mk state current left right =>
      simp only at hcurrent hright
      subst current
      subst right
      simp [arrivalWord, arrivalCounts, runWord, rightMarkerSymbols,
        markerRotated, markerKeep, leftCounter_eq_radix_mul_units,
        List.flatMap_replicate, List.flatten_replicate_replicate,
        Nat.mul_comm]
      change List.replicate (8 * leftUnits left) (TagSymbol.left state) =
        (List.replicate (leftUnits left)
          (List.replicate 8 (TagSymbol.left state))).flatten
      rw [List.flatten_replicate_replicate,
        Nat.mul_comm (leftUnits left) 8]

theorem rightMarker_first_target (config : MachineConfig) :
    (production (.head config.state)).drop (markerDrop .seven) ++
      (rightMarkerSymbols config).tail.flatMap production =
    markerRows .seven config.state (rightMarkerFamilies config) := by
  cases config with
  | mk state current left right =>
      simp [rightMarkerSymbols, rightMarkerFamilies, markerRows, markerDrop,
        indexedRow, indices, List.flatMap_replicate]

theorem right_periodic_to_markerRows (config : MachineConfig)
    (hcurrent : config.current = .s4) (hright : config.right = []) :
    HaltCleanup.TagStepsN (rightMarkerFamilies config).length
      (arrivalWord .right .periodicTail config)
      (markerRows .seven config.state (rightMarkerFamilies config)) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      have hsymbols : rightMarkerSymbols config =
          .head config.state :: .left config.state ::
            List.replicate count (.left config.state) := by
        rw [rightMarkerSymbols, hcount, List.replicate_succ]
      have hfamilies : rightMarkerFamilies config =
          .H :: .L :: List.replicate count .L := by
        rw [rightMarkerFamilies, hcount, List.replicate_succ]
      have hlength : markerDrop .seven ≤
          (production (.head config.state)).length := by
        simp [markerDrop]
      have trace := markerRotated_scan .seven (.head config.state)
        (.left config.state) (List.replicate count (.left config.state))
        hlength
      rw [← hsymbols, ← rightPeriodicWord_eq_markerRotated config
        hcurrent hright] at trace
      have htarget := rightMarker_first_target config
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [hsymbols, List.length_cons, List.length_replicate,
        List.tail_cons, List.flatMap_cons] using trace

theorem rightMarker_second_target (config : MachineConfig)
    (hcurrent : config.current = .s4) (hright : config.right = []) :
    (production (.indexed .H config.state (markerIndex .seven))).drop
          (markerDrop .seven) ++
        (rightMarkerFamilies config).tail.flatMap (fun family =>
          production (.indexed family config.state (markerIndex .seven))) =
      canonicalWord config := by
  cases config with
  | mk state current left right =>
      simp only at hcurrent hright
      subst current
      subst right
      simp [rightMarkerFamilies, markerIndex, markerDrop, production,
        indexedProduction, markerEightProduction, canonicalWord,
        canonicalCounts, runWord, machineSymbolValue,
        leftCounter_eq_radix_mul_units, rightCounter,
        List.flatMap_replicate, List.flatten_replicate_replicate,
        Nat.mul_comm, List.append_assoc]
      change (List.replicate (leftUnits left)
          (List.replicate 8 (TagSymbol.left state))).flatten =
        List.replicate (8 * leftUnits left) (TagSymbol.left state)
      rw [List.flatten_replicate_replicate,
        Nat.mul_comm (leftUnits left) 8]

theorem right_markerRows_to_canonical (config : MachineConfig)
    (hcurrent : config.current = .s4) (hright : config.right = []) :
    HaltCleanup.TagStepsN (rightMarkerFamilies config).length
      (markerRows .seven config.state (rightMarkerFamilies config))
      (canonicalWord config) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      have hfamilies : rightMarkerFamilies config =
          .H :: .L :: List.replicate count .L := by
        rw [rightMarkerFamilies, hcount, List.replicate_succ]
      have hlength : markerDrop .seven ≤
          (production (.indexed .H config.state (markerIndex .seven))).length := by
        simp [markerDrop, markerIndex, production, indexedProduction,
          markerEightProduction]
      have trace := markerRows_scan .seven config.state .H .L
        (List.replicate count .L) hlength
      have htarget := rightMarker_second_target config hcurrent hright
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [List.length_cons, List.length_replicate,
        List.tail_cons, List.flatMap_cons] using trace

def leftMarkerFamilies (config : MachineConfig) : List Family :=
  .H :: List.replicate (rightUnits config.right) .R

def leftMarkerTailSymbols (config : MachineConfig) : List TagSymbol :=
  List.replicate (rightUnits config.right) (.right config.state)

def leftMarkerStart (state : MachineState)
    (tailSymbols : List TagSymbol) : List TagSymbol :=
  .head state :: .left state ::
    tailSymbols.flatMap (List.replicate 8)

theorem leftPeriodicWord_eq_markerStart (config : MachineConfig)
    (hcurrent : config.current = .s4) (hleft : config.left = []) :
    arrivalWord .left .periodicTail config =
      leftMarkerStart config.state (leftMarkerTailSymbols config) := by
  cases config with
  | mk state current left right =>
      simp only at hcurrent hleft
      subst current
      subst left
      simp [arrivalWord, arrivalCounts, runWord, leftMarkerStart,
        leftMarkerTailSymbols, rightCounter_eq_radix_mul_units,
        List.flatMap_replicate, List.flatten_replicate_replicate,
        Nat.mul_comm]
      change List.replicate (8 * rightUnits right) (TagSymbol.right state) =
        (List.replicate (rightUnits right)
          (List.replicate 8 (TagSymbol.right state))).flatten
      rw [List.flatten_replicate_replicate,
        Nat.mul_comm (rightUnits right) 8]

theorem leftMarkerStart_step (state : MachineState)
    (first : TagSymbol) (rest : List TagSymbol) :
    HaltCleanup.TagStep
      (leftMarkerStart state (first :: rest))
      (markerRotated .six (first :: rest) ++ production (.head state)) := by
  simp [leftMarkerStart, markerRotated, markerKeep,
    HaltCleanup.TagStep, Macroperiod.tagStep?_eight]

theorem leftMarker_first_target (config : MachineConfig) :
    (production (.head config.state)).drop (markerDrop .six) ++
      (leftMarkerTailSymbols config).flatMap production =
    markerRows .six config.state (leftMarkerFamilies config) := by
  cases config with
  | mk state current left right =>
      simp [leftMarkerTailSymbols, leftMarkerFamilies, markerRows, markerDrop,
        indexedRow, indices, List.flatMap_replicate]

theorem left_periodic_to_markerRows (config : MachineConfig)
    (hcurrent : config.current = .s4) (hleft : config.left = [])
    (hright : config.right ≠ []) :
    HaltCleanup.TagStepsN (leftMarkerFamilies config).length
      (arrivalWord .left .periodicTail config)
      (markerRows .six config.state (leftMarkerFamilies config)) := by
  cases hcount : rightUnits config.right with
  | zero =>
      cases hrightList : config.right with
      | nil => exact (hright hrightList).elim
      | cons symbol rest =>
          rw [hrightList] at hcount
          simp only [rightUnits] at hcount
          have hpositive := (digitWeight_bounds symbol).1
          have : 0 < digitWeight symbol + rightCounter rest :=
            Nat.add_pos_left
              (Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1) hpositive) _
          rw [hcount] at this
          exact (Nat.lt_irrefl 0 this).elim
  | succ count =>
      have htail : leftMarkerTailSymbols config =
          .right config.state ::
            List.replicate count (.right config.state) := by
        rw [leftMarkerTailSymbols, hcount, List.replicate_succ]
      have hfamilies : leftMarkerFamilies config =
          .H :: .R :: List.replicate count .R := by
        rw [leftMarkerFamilies, hcount, List.replicate_succ]
      have hone := leftMarkerStart_step config.state (.right config.state)
        (List.replicate count (.right config.state))
      have hlength : markerDrop .six ≤
          (production (.head config.state)).length := by
        simp [markerDrop]
      have hrest := markerRotated_scan_aux .six
        (.right config.state :: List.replicate count (.right config.state))
        (production (.head config.state)) (List.cons_ne_nil _ _) hlength
      have trace := HaltCleanup.TagStepsN.succ hone hrest
      rw [← htail, ← leftPeriodicWord_eq_markerStart config
        hcurrent hleft] at trace
      have htarget := leftMarker_first_target config
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [htail, List.length_cons, List.length_replicate,
        List.flatMap_cons] using trace

theorem leftMarker_second_target (config : MachineConfig)
    (hcurrent : config.current = .s4) (hleft : config.left = []) :
    (production (.indexed .H config.state (markerIndex .six))).drop
          (markerDrop .six) ++
        (leftMarkerFamilies config).tail.flatMap (fun family =>
          production (.indexed family config.state (markerIndex .six))) =
      canonicalWord config := by
  cases config with
  | mk state current left right =>
      simp only at hcurrent hleft
      subst current
      subst left
      simp [leftMarkerFamilies, markerIndex, markerDrop, production,
        indexedProduction, markerSevenProduction, canonicalWord,
        canonicalCounts, runWord, machineSymbolValue, leftCounter,
        rightCounter_eq_radix_mul_units, List.flatMap_replicate,
        List.flatten_replicate_replicate, Nat.mul_comm, List.append_assoc]
      change (List.replicate (rightUnits right)
          (List.replicate 8 (TagSymbol.right state))).flatten =
        List.replicate (8 * rightUnits right) (TagSymbol.right state)
      rw [List.flatten_replicate_replicate,
        Nat.mul_comm (rightUnits right) 8]

theorem left_markerRows_to_canonical (config : MachineConfig)
    (hcurrent : config.current = .s4) (hleft : config.left = [])
    (hright : config.right ≠ []) :
    HaltCleanup.TagStepsN (leftMarkerFamilies config).length
      (markerRows .six config.state (leftMarkerFamilies config))
      (canonicalWord config) := by
  cases hcount : rightUnits config.right with
  | zero =>
      cases hrightList : config.right with
      | nil => exact (hright hrightList).elim
      | cons symbol rest =>
          rw [hrightList] at hcount
          simp only [rightUnits] at hcount
          have hpositive := (digitWeight_bounds symbol).1
          have : 0 < digitWeight symbol + rightCounter rest :=
            Nat.add_pos_left
              (Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1) hpositive) _
          rw [hcount] at this
          exact (Nat.lt_irrefl 0 this).elim
  | succ count =>
      have hfamilies : leftMarkerFamilies config =
          .H :: .R :: List.replicate count .R := by
        rw [leftMarkerFamilies, hcount, List.replicate_succ]
      have hlength : markerDrop .six ≤
          (production (.indexed .H config.state (markerIndex .six))).length := by
        simp [markerDrop, markerIndex, production, indexedProduction,
          markerSevenProduction]
      have trace := markerRows_scan .six config.state .H .R
        (List.replicate count .R) hlength
      have htarget := leftMarker_second_target config hcurrent hleft
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [List.length_cons, List.length_replicate,
        List.tail_cons, List.flatMap_cons] using trace

theorem markerRotated_scan_aux_proper (offset : MarkerOffset) :
    ∀ (symbols : List TagSymbol) (payload : List TagSymbol),
      symbols ≠ [] →
      markerDrop offset ≤ payload.length →
      (∀ symbol, symbol ∈ symbols →
        ContainsIndexed (production symbol)) →
      ProperTagSteps ContainsIndexed symbols.length
        (markerRotated offset symbols ++ payload)
        (payload.drop (markerDrop offset) ++ symbols.flatMap production)
  | [], payload, hnonempty, hlength, hall => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength, hall => by
      have hone := markerRotated_single_step offset first payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (ProperTagSteps.one (property := ContainsIndexed) hone)
  | first :: second :: rest, payload, hnonempty, hlength, hall => by
      have hone := markerRotated_step offset first second rest payload
      have hmiddle : ContainsIndexed
          (markerRotated offset (second :: rest) ++ payload ++
            production first) :=
        containsIndexed_append_right (hall first (.head _))
      have hlength' : markerDrop offset ≤
          (payload ++ production first).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length (production first).length)
      have hallRest : ∀ symbol, symbol ∈ second :: rest →
          ContainsIndexed (production symbol) := by
        intro symbol hmem
        exact hall symbol (.tail first hmem)
      have hrest := markerRotated_scan_aux_proper offset (second :: rest)
        (payload ++ production first) (List.cons_ne_nil _ _) hlength'
        hallRest
      have hrest' : ProperTagSteps ContainsIndexed (second :: rest).length
          ((markerRotated offset (second :: rest) ++ payload) ++
            production first)
          ((payload ++ production first).drop (markerDrop offset) ++
            (second :: rest).flatMap production) := by
        simpa only [List.append_assoc] using hrest
      have hproper := ProperTagSteps.more hone hmiddle hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hproper

theorem markerRotated_scan_proper (offset : MarkerOffset)
    (first second : TagSymbol) (rest : List TagSymbol)
    (hlength : markerDrop offset ≤ (production first).length)
    (hall : ∀ symbol, symbol ∈ first :: second :: rest →
      ContainsIndexed (production symbol)) :
    ProperTagSteps ContainsIndexed (first :: second :: rest).length
      (markerRotated offset (first :: second :: rest))
      ((production first).drop (markerDrop offset) ++
        (second :: rest).flatMap production) := by
  have hone := markerRotated_step offset first second rest []
  have hmiddle : ContainsIndexed
      (markerRotated offset (second :: rest) ++ [] ++ production first) :=
    containsIndexed_append_right (hall first (.head _))
  have hallRest : ∀ symbol, symbol ∈ second :: rest →
      ContainsIndexed (production symbol) := by
    intro symbol hmem
    exact hall symbol (.tail first hmem)
  have hrest := markerRotated_scan_aux_proper offset (second :: rest)
    (production first) (List.cons_ne_nil _ _) hlength hallRest
  have hrest' : ProperTagSteps ContainsIndexed (second :: rest).length
      (markerRotated offset (second :: rest) ++ [] ++ production first)
      ((production first).drop (markerDrop offset) ++
        (second :: rest).flatMap production) := by
    simpa only [List.append_nil] using hrest
  have hproper := ProperTagSteps.more hone hmiddle hrest'
  simpa only [List.length_cons, List.append_nil] using hproper

theorem markerRows_containsIndexed (offset : MarkerOffset)
    (state : MachineState) (first : Family) (rest : List Family) :
    ContainsIndexed (markerRows offset state (first :: rest)) := by
  refine ⟨first, state, markerIndex offset, ?_⟩
  cases offset <;> cases first <;>
    change TagSymbol.indexed _ state _ ∈ _ <;>
    exact .head _

theorem markerRows_scan_aux_proper (offset : MarkerOffset)
    (state : MachineState) :
    ∀ (families : List Family) (payload : List TagSymbol),
      families ≠ [] →
      markerDrop offset ≤ payload.length →
      ProperTagSteps ContainsIndexed families.length
        (markerRows offset state families ++ payload)
        (payload.drop (markerDrop offset) ++
          families.flatMap fun family =>
            production (.indexed family state (markerIndex offset)))
  | [], payload, hnonempty, hlength => (hnonempty rfl).elim
  | first :: [], payload, hnonempty, hlength => by
      have hone := markerRows_single_step offset state first payload hlength
      simpa only [List.length_cons, List.length_nil, List.flatMap_cons,
        List.flatMap_nil, List.append_nil] using
        (ProperTagSteps.one (property := ContainsIndexed) hone)
  | first :: second :: rest, payload, hnonempty, hlength => by
      have hone := markerRows_step offset state first second rest payload
      have hmiddle : ContainsIndexed
          (markerRows offset state (second :: rest) ++ payload ++
            production (.indexed first state (markerIndex offset))) :=
        containsIndexed_append_left
          (containsIndexed_append_left
            (markerRows_containsIndexed offset state second rest))
      have hlength' : markerDrop offset ≤
          (payload ++ production
            (.indexed first state (markerIndex offset))).length := by
        rw [List.length_append]
        exact Nat.le_trans hlength
          (Nat.le_add_right payload.length
            (production (.indexed first state (markerIndex offset))).length)
      have hrest := markerRows_scan_aux_proper offset state (second :: rest)
        (payload ++ production (.indexed first state (markerIndex offset)))
        (List.cons_ne_nil _ _) hlength'
      have hrest' : ProperTagSteps ContainsIndexed (second :: rest).length
          ((markerRows offset state (second :: rest) ++ payload) ++
            production (.indexed first state (markerIndex offset)))
          ((payload ++ production
              (.indexed first state (markerIndex offset))).drop
                (markerDrop offset) ++
            (second :: rest).flatMap fun family =>
              production (.indexed family state (markerIndex offset))) := by
        simpa only [List.append_assoc] using hrest
      have hproper := ProperTagSteps.more hone hmiddle hrest'
      simpa only [List.length_cons, List.flatMap_cons,
        drop_append_of_le_length_clean hlength,
        List.append_assoc] using hproper

theorem markerRows_scan_proper (offset : MarkerOffset)
    (state : MachineState) (first second : Family) (rest : List Family)
    (hlength : markerDrop offset ≤
      (production (.indexed first state (markerIndex offset))).length) :
    ProperTagSteps ContainsIndexed (first :: second :: rest).length
      (markerRows offset state (first :: second :: rest))
      ((production (.indexed first state (markerIndex offset))).drop
          (markerDrop offset) ++
        (second :: rest).flatMap fun family =>
          production (.indexed family state (markerIndex offset))) := by
  have hone := markerRows_step offset state first second rest []
  have hmiddle : ContainsIndexed
      (markerRows offset state (second :: rest) ++ [] ++
        production (.indexed first state (markerIndex offset))) :=
    by
      simpa only [List.append_nil] using
        (containsIndexed_append_left
          (right := production (.indexed first state (markerIndex offset)))
          (markerRows_containsIndexed offset state second rest))
  have hrest := markerRows_scan_aux_proper offset state (second :: rest)
    (production (.indexed first state (markerIndex offset)))
    (List.cons_ne_nil _ _) hlength
  have hrest' : ProperTagSteps ContainsIndexed (second :: rest).length
      (markerRows offset state (second :: rest) ++ [] ++
        production (.indexed first state (markerIndex offset)))
      ((production (.indexed first state (markerIndex offset))).drop
          (markerDrop offset) ++
        (second :: rest).flatMap fun family =>
          production (.indexed family state (markerIndex offset))) := by
    simpa only [List.append_nil] using hrest
  have hproper := ProperTagSteps.more hone hmiddle hrest'
  simpa only [List.length_cons, List.append_nil] using hproper

theorem right_periodic_first_proper (config : MachineConfig)
    (hcurrent : config.current = .s4) (hright : config.right = []) :
    ProperTagSteps ContainsIndexed (rightMarkerFamilies config).length
      (arrivalWord .right .periodicTail config)
      (markerRows .seven config.state (rightMarkerFamilies config)) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      have hsymbols : rightMarkerSymbols config =
          .head config.state :: .left config.state ::
            List.replicate count (.left config.state) := by
        rw [rightMarkerSymbols, hcount, List.replicate_succ]
      have hfamilies : rightMarkerFamilies config =
          .H :: .L :: List.replicate count .L := by
        rw [rightMarkerFamilies, hcount, List.replicate_succ]
      have hlength : markerDrop .seven ≤
          (production (.head config.state)).length := by
        simp [markerDrop]
      have hall : ∀ symbol,
          symbol ∈ .head config.state :: .left config.state ::
            List.replicate count (.left config.state) →
          ContainsIndexed (production symbol) := by
        intro symbol hmem
        simp only [List.mem_cons, List.mem_replicate] at hmem
        rcases hmem with rfl | rfl | ⟨_, rfl⟩
        · exact production_unindexed_containsIndexed config.state .H
        · exact production_unindexed_containsIndexed config.state .L
        · exact production_unindexed_containsIndexed config.state .L
      have trace := markerRotated_scan_proper .seven (.head config.state)
        (.left config.state) (List.replicate count (.left config.state))
        hlength hall
      rw [← hsymbols, ← rightPeriodicWord_eq_markerRotated config
        hcurrent hright] at trace
      have htarget := rightMarker_first_target config
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [hsymbols, List.length_cons, List.length_replicate,
        List.tail_cons, List.flatMap_cons] using trace

theorem right_periodic_second_proper (config : MachineConfig)
    (hcurrent : config.current = .s4) (hright : config.right = []) :
    ProperTagSteps ContainsIndexed (rightMarkerFamilies config).length
      (markerRows .seven config.state (rightMarkerFamilies config))
      (canonicalWord config) := by
  have hpos := leftUnits_pos config.left
  cases hcount : leftUnits config.left with
  | zero =>
      rw [hcount] at hpos
      exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      have hfamilies : rightMarkerFamilies config =
          .H :: .L :: List.replicate count .L := by
        rw [rightMarkerFamilies, hcount, List.replicate_succ]
      have hlength : markerDrop .seven ≤
          (production (.indexed .H config.state (markerIndex .seven))).length := by
        simp [markerDrop, markerIndex, production, indexedProduction,
          markerEightProduction]
      have trace := markerRows_scan_proper .seven config.state .H .L
        (List.replicate count .L) hlength
      have htarget := rightMarker_second_target config hcurrent hright
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [List.length_cons, List.length_replicate,
        List.tail_cons, List.flatMap_cons] using trace

theorem left_periodic_first_proper (config : MachineConfig)
    (hcurrent : config.current = .s4) (hleft : config.left = [])
    (hright : config.right ≠ []) :
    ProperTagSteps ContainsIndexed (leftMarkerFamilies config).length
      (arrivalWord .left .periodicTail config)
      (markerRows .six config.state (leftMarkerFamilies config)) := by
  cases hcount : rightUnits config.right with
  | zero =>
      cases hrightList : config.right with
      | nil => exact (hright hrightList).elim
      | cons symbol rest =>
          rw [hrightList] at hcount
          simp only [rightUnits] at hcount
          have hpositive := (digitWeight_bounds symbol).1
          have hpos : 0 < digitWeight symbol + rightCounter rest :=
            Nat.add_pos_left
              (Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1) hpositive) _
          rw [hcount] at hpos
          exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      have htail : leftMarkerTailSymbols config =
          .right config.state ::
            List.replicate count (.right config.state) := by
        rw [leftMarkerTailSymbols, hcount, List.replicate_succ]
      have hfamilies : leftMarkerFamilies config =
          .H :: .R :: List.replicate count .R := by
        rw [leftMarkerFamilies, hcount, List.replicate_succ]
      have hone := leftMarkerStart_step config.state (.right config.state)
        (List.replicate count (.right config.state))
      have hmiddle : ContainsIndexed
          (markerRotated .six
              (.right config.state ::
                List.replicate count (.right config.state)) ++
            production (.head config.state)) :=
        containsIndexed_append_right
          (production_unindexed_containsIndexed config.state .H)
      have hlength : markerDrop .six ≤
          (production (.head config.state)).length := by
        simp [markerDrop]
      have hall : ∀ symbol,
          symbol ∈ .right config.state ::
            List.replicate count (.right config.state) →
          ContainsIndexed (production symbol) := by
        intro symbol hmem
        simp only [List.mem_cons, List.mem_replicate] at hmem
        rcases hmem with rfl | ⟨_, rfl⟩
        · exact production_unindexed_containsIndexed config.state .R
        · exact production_unindexed_containsIndexed config.state .R
      have hrest := markerRotated_scan_aux_proper .six
        (.right config.state :: List.replicate count (.right config.state))
        (production (.head config.state)) (List.cons_ne_nil _ _) hlength hall
      have trace := ProperTagSteps.more hone hmiddle hrest
      rw [← htail, ← leftPeriodicWord_eq_markerStart config
        hcurrent hleft] at trace
      have htarget := leftMarker_first_target config
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [htail, List.length_cons, List.length_replicate,
        List.flatMap_cons] using trace

theorem left_periodic_second_proper (config : MachineConfig)
    (hcurrent : config.current = .s4) (hleft : config.left = [])
    (hright : config.right ≠ []) :
    ProperTagSteps ContainsIndexed (leftMarkerFamilies config).length
      (markerRows .six config.state (leftMarkerFamilies config))
      (canonicalWord config) := by
  cases hcount : rightUnits config.right with
  | zero =>
      cases hrightList : config.right with
      | nil => exact (hright hrightList).elim
      | cons symbol rest =>
          rw [hrightList] at hcount
          simp only [rightUnits] at hcount
          have hpositive := (digitWeight_bounds symbol).1
          have hpos : 0 < digitWeight symbol + rightCounter rest :=
            Nat.add_pos_left
              (Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1) hpositive) _
          rw [hcount] at hpos
          exact (Nat.lt_irrefl 0 hpos).elim
  | succ count =>
      have hfamilies : leftMarkerFamilies config =
          .H :: .R :: List.replicate count .R := by
        rw [leftMarkerFamilies, hcount, List.replicate_succ]
      have hlength : markerDrop .six ≤
          (production (.indexed .H config.state (markerIndex .six))).length := by
        simp [markerDrop, markerIndex, production, indexedProduction,
          markerSevenProduction]
      have trace := markerRows_scan_proper .six config.state .H .R
        (List.replicate count .R) hlength
      have htarget := leftMarker_second_target config hcurrent hleft
      rw [hfamilies] at htarget
      rw [hfamilies, ← htarget]
      simpa only [List.length_cons, List.length_replicate,
        List.tail_cons, List.flatMap_cons] using trace

theorem replicate_starts_two {count : Nat} (value : α)
    (htwo : 2 ≤ count) :
    ∃ rest, List.replicate count value = value :: value :: rest := by
  cases count with
  | zero => exact (Nat.not_succ_le_zero 1 htwo).elim
  | succ count =>
      cases count with
      | zero =>
          have hone : 1 ≤ 0 := Nat.succ_le_succ_iff.mp htwo
          exact (Nat.not_succ_le_zero 0 hone).elim
      | succ rest => exact ⟨List.replicate rest value, rfl⟩

theorem canonicalWord_starts_two_heads (config : MachineConfig) :
    ∃ rest,
      canonicalWord config =
        .head config.state :: .head config.state :: rest := by
  cases config with
  | mk state current left right =>
      have htwo : 2 ≤
          (canonicalCounts ⟨state, current, left, right⟩).head := by
        change 2 ≤ 8 - machineSymbolValue current
        cases current <;> decide
      obtain ⟨headRest, hhead⟩ :=
        replicate_starts_two (TagSymbol.head state) htwo
      refine ⟨headRest ++
          List.replicate
            (canonicalCounts ⟨state, current, left, right⟩).left (.left state) ++
          List.replicate
            (canonicalCounts ⟨state, current, left, right⟩).right
              (.right state), ?_⟩
      unfold canonicalWord runWord
      rw [hhead]
      rfl

theorem arrivalLeftCount_pos (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    0 < (arrivalCounts direction origin config).left := by
  cases direction with
  | left =>
      cases origin with
      | periodicTail => exact Nat.zero_lt_succ 0
      | representedCell =>
          unfold arrivalCounts regularLeftArrivalExponent
          exact Nat.add_pos_left
            (Nat.lt_of_lt_of_le (Nat.zero_lt_succ 1)
              (digitWeight_bounds config.current).1) _
  | right =>
      cases origin <;> unfold arrivalCounts
      · exact Nat.lt_of_lt_of_le (by decide : 0 < 8)
          (leftCounter_ge_eight config.left)
      · exact Nat.lt_of_lt_of_le (by decide : 0 < 8)
          (leftCounter_ge_eight config.left)

theorem arrivalWord_starts_head_left (direction : ArrivalDirection)
    (origin : ArrivalOrigin) (config : MachineConfig) :
    ∃ rest,
      arrivalWord direction origin config =
        .head config.state :: .left config.state :: rest := by
  have hpositive := arrivalLeftCount_pos direction origin config
  cases hcount : (arrivalCounts direction origin config).left with
  | zero =>
      rw [hcount] at hpositive
      exact (Nat.lt_irrefl 0 hpositive).elim
  | succ count =>
      refine ⟨List.replicate count (.left config.state) ++
          List.replicate (arrivalCounts direction origin config).right
            (.right config.state), ?_⟩
      unfold arrivalWord runWord
      have hhead : (arrivalCounts direction origin config).head = 1 := by
        cases direction <;> cases origin <;> rfl
      rw [hhead, hcount]
      rfl

theorem canonical_notArrivalReadable (config : MachineConfig) :
    ¬ ArrivalReadable (canonicalWord config) := by
  rintro ⟨direction, origin, decoded, heq⟩
  obtain ⟨canonicalRest, hcanonical⟩ := canonicalWord_starts_two_heads config
  obtain ⟨arrivalRest, harrival⟩ :=
    arrivalWord_starts_head_left direction origin decoded
  rw [hcanonical, harrival] at heq
  have hsecond := List.cons.inj (List.cons.inj heq).2
  exact TagSymbol.noConfusion hsecond.1

def markerRestoreTime (direction : ArrivalDirection)
    (config : MachineConfig) : Nat :=
  match direction with
  | .left => (leftMarkerFamilies config).length * 2
  | .right => (rightMarkerFamilies config).length * 2

theorem right_periodic_restoration_proper (config : MachineConfig)
    (hcurrent : config.current = .s4) (hright : config.right = []) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word)
      (markerRestoreTime .right config)
      (arrivalWord .right .periodicTail config)
      (canonicalWord config) := by
  have firstIndexed := right_periodic_first_proper config hcurrent hright
  have secondIndexed := right_periodic_second_proper config hcurrent hright
  have firstQ := proper_notArrival_of_indexed firstIndexed
  have secondQ := proper_notArrival_of_indexed secondIndexed
  have hmiddle : ¬ ArrivalReadable
      (markerRows .seven config.state (rightMarkerFamilies config)) :=
    not_arrivalReadable_of_containsIndexed
      (markerRows_containsIndexed .seven config.state .H
        (List.replicate (leftUnits config.left) .L))
  have combined := ProperTagSteps.append_proper firstQ hmiddle secondQ
  simpa only [markerRestoreTime, Nat.mul_two,
    Nat.add_comm] using combined

theorem left_periodic_restoration_proper (config : MachineConfig)
    (hcurrent : config.current = .s4) (hleft : config.left = [])
    (hright : config.right ≠ []) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word)
      (markerRestoreTime .left config)
      (arrivalWord .left .periodicTail config)
      (canonicalWord config) := by
  have firstIndexed := left_periodic_first_proper config hcurrent hleft hright
  have secondIndexed := left_periodic_second_proper config hcurrent hleft hright
  have firstQ := proper_notArrival_of_indexed firstIndexed
  have secondQ := proper_notArrival_of_indexed secondIndexed
  have hmiddle : ¬ ArrivalReadable
      (markerRows .six config.state (leftMarkerFamilies config)) :=
    not_arrivalReadable_of_containsIndexed
      (markerRows_containsIndexed .six config.state .H
        (List.replicate (rightUnits config.right) .R))
  have combined := ProperTagSteps.append_proper firstQ hmiddle secondQ
  simpa only [markerRestoreTime, Nat.mul_two,
    Nat.add_comm] using combined

/-! ### Continuous registered-boundary dynamics -/

def BoundaryValid (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (config : MachineConfig) : Prop :=
  match direction, origin with
  | .left, .representedCell => config.right ≠ []
  | .right, .representedCell => config.left ≠ []
  | .left, .periodicTail =>
      config.current = .s4 ∧ config.left = [] ∧ config.right ≠ []
  | .right, .periodicTail =>
      config.current = .s4 ∧ config.right = [] ∧ config.left ≠ []

/-- A registered start carries the exact decoded configuration.  Direction
and origin remain explicit on arrival starts, including the periodic marker
cases that first restore a canonical duplicate. -/
inductive RegisteredBoundary (config : MachineConfig) where
  | canonical : RegisteredBoundary config
  | arrival (direction : ArrivalDirection) (origin : ArrivalOrigin)
      (valid : BoundaryValid direction origin config) :
      RegisteredBoundary config

def registeredWord (config : MachineConfig) :
    RegisteredBoundary config → List TagSymbol
  | .canonical => canonicalWord config
  | .arrival direction origin _ => arrivalWord direction origin config

def boundaryTransitionTime {config : MachineConfig}
    (start : RegisteredBoundary config) (written : MachineSymbol)
    (move : Rogozhin46.Direction) : Nat :=
  firstArrivalTime config written move +
    match start with
    | .canonical => 0
    | .arrival _ .representedCell _ => 0
    | .arrival direction .periodicTail _ => markerRestoreTime direction config

theorem boundaryTransitionTime_pos {config : MachineConfig}
    (start : RegisteredBoundary config) (written : MachineSymbol)
    (move : Rogozhin46.Direction) :
    0 < boundaryTransitionTime start written move := by
  unfold boundaryTransitionTime
  exact Nat.add_pos_left (firstArrivalTime_pos config written move) _

theorem boundary_transition_proper
    (source : MachineConfig) (start : RegisteredBoundary source)
    (next : MachineState) (written : MachineSymbol)
    (move : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written move) :
    ProperTagSteps (fun word => ¬ ArrivalReadable word)
      (boundaryTransitionTime start written move)
      (registeredWord source start)
      (expectedEndpoint source next written move) := by
  cases start with
  | canonical =>
      simpa only [boundaryTransitionTime, registeredWord, Nat.add_zero] using
        (canonical_transition_proper source next written move hcommand)
  | arrival previousDirection origin valid =>
      cases previousDirection with
      | left =>
          cases origin with
          | representedCell =>
              simpa only [boundaryTransitionTime, registeredWord,
                Nat.add_zero] using
                (left_represented_transition_proper source next written move
                  hcommand)
          | periodicTail =>
              rcases valid with ⟨hcurrent, hleft, hright⟩
              have restore := left_periodic_restoration_proper source
                hcurrent hleft hright
              have transition := canonical_transition_proper source next
                written move hcommand
              have combined := ProperTagSteps.append_proper restore
                (canonical_notArrivalReadable source) transition
              simpa only [boundaryTransitionTime, registeredWord] using combined
      | right =>
          cases origin with
          | representedCell =>
              simpa only [boundaryTransitionTime, registeredWord,
                Nat.add_zero] using
                (right_represented_transition_proper source next written move
                  hcommand)
          | periodicTail =>
              rcases valid with ⟨hcurrent, hright, hleft⟩
              have restore := right_periodic_restoration_proper source
                hcurrent hright
              have transition := canonical_transition_proper source next
                written move hcommand
              have combined := ProperTagSteps.append_proper restore
                (canonical_notArrivalReadable source) transition
              simpa only [boundaryTransitionTime, registeredWord] using combined

structure NextReadableArrival (start endpoint : List TagSymbol) where
  steps : Nat
  steps_pos : 0 < steps
  reaches : HaltCleanup.TagStepsN steps start endpoint
  readable : ArrivalReadable endpoint
  first : ∀ {earlier : Nat} {word : List TagSymbol},
    0 < earlier → earlier < steps →
    HaltCleanup.TagStepsN earlier start word →
    ¬ ArrivalReadable word

def nextReadableArrival_of_proper
    {steps : Nat} {start endpoint : List TagSymbol}
    (hpositive : 0 < steps)
    (proper : ProperTagSteps (fun word => ¬ ArrivalReadable word)
      steps start endpoint)
    (hreadable : ArrivalReadable endpoint) :
    NextReadableArrival start endpoint :=
  { steps := steps
    steps_pos := hpositive
    reaches := proper.toTagStepsN
    readable := hreadable
    first := fun hpositiveEarlier hlt trace =>
      proper.proper_prefix hpositiveEarlier hlt trace }

theorem applyTransition_boundaryValid
    (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (move : Rogozhin46.Direction) :
    BoundaryValid (endpointDirection move)
      (match move with
       | .left => leftOrigin source
       | .right => rightOrigin source)
      (Rogozhin46.applyTransition source next written move) := by
  cases source with
  | mk state current left right =>
      cases move with
      | left =>
          cases left with
          | nil =>
              exact ⟨rfl, rfl, List.cons_ne_nil _ _⟩
          | cons scanned rest =>
              exact List.cons_ne_nil _ _
      | right =>
          cases right with
          | nil =>
              exact ⟨rfl, rfl, List.cons_ne_nil _ _⟩
          | cons scanned rest =>
              exact List.cons_ne_nil _ _

def successorBoundary (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (move : Rogozhin46.Direction) :
    RegisteredBoundary
      (Rogozhin46.applyTransition source next written move) :=
  .arrival (endpointDirection move)
    (match move with
     | .left => leftOrigin source
     | .right => rightOrigin source)
    (applyTransition_boundaryValid source next written move)

theorem successorBoundary_word (source : MachineConfig)
    (next : MachineState) (written : MachineSymbol)
    (move : Rogozhin46.Direction) :
    registeredWord (Rogozhin46.applyTransition source next written move)
        (successorBoundary source next written move) =
      expectedEndpoint source next written move := by
  unfold successorBoundary registeredWord
  exact (expectedEndpoint_classification source next written move).1.symm

/-- From canonical, represented-arrival, or periodic-arrival input, the exact
first later arrival is the encoded Rogozhin successor.  Periodic starts skip
their canonical duplicate inside this theorem. -/
def registered_nextArrival
    (source : MachineConfig) (start : RegisteredBoundary source)
    (next : MachineState) (written : MachineSymbol)
    (move : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written move) :
    NextReadableArrival (registeredWord source start)
      (registeredWord (Rogozhin46.applyTransition source next written move)
        (successorBoundary source next written move)) := by
  have proper := boundary_transition_proper source start next written move
    hcommand
  rw [← successorBoundary_word source next written move] at proper
  refine nextReadableArrival_of_proper
    (boundaryTransitionTime_pos start written move) proper ?_
  unfold successorBoundary registeredWord
  cases move with
  | left =>
      exact ⟨.left, leftOrigin source,
        Rogozhin46.applyTransition source next written .left, rfl⟩
  | right =>
      exact ⟨.right, rightOrigin source,
        Rogozhin46.applyTransition source next written .right, rfl⟩

structure RegisteredMachineStep (source : MachineConfig)
    (start : RegisteredBoundary source) where
  nextConfig : MachineConfig
  nextBoundary : RegisteredBoundary nextConfig
  machineStep : Rogozhin46.step? source = some nextConfig
  arrival : NextReadableArrival (registeredWord source start)
    (registeredWord nextConfig nextBoundary)

def registeredMachineStep_of_command
    (source : MachineConfig) (start : RegisteredBoundary source)
    (next : MachineState) (written : MachineSymbol)
    (move : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition source.state source.current =
      .step next written move) :
    RegisteredMachineStep source start :=
  { nextConfig := Rogozhin46.applyTransition source next written move
    nextBoundary := successorBoundary source next written move
    machineStep := Rogozhin46.step?_eq_some_applyTransition source next written
      move hcommand
    arrival := registered_nextArrival source start next written move hcommand }

/-! ### Accumulated registered trajectories -/

/-- An exact finite prefix of the continuous boundary trajectory.  The final
configuration is tied to the corresponding Rogozhin iterate, while
`tagTrace` records the accumulated deletion-eight execution time. -/
structure RegisteredPath (initial : MachineConfig)
    (initialBoundary : RegisteredBoundary initial)
    (machineSteps : Nat) where
  config : MachineConfig
  boundary : RegisteredBoundary config
  tagSteps : Nat
  config_eq : config = Rogozhin46.iterate machineSteps initial
  tagTrace : HaltCleanup.TagStepsN tagSteps
    (registeredWord initial initialBoundary)
    (registeredWord config boundary)
  tagSteps_ge : machineSteps ≤ tagSteps

namespace RegisteredPath

def zero (initial : MachineConfig)
    (initialBoundary : RegisteredBoundary initial) :
    RegisteredPath initial initialBoundary 0 :=
  { config := initial
    boundary := initialBoundary
    tagSteps := 0
    config_eq := rfl
    tagTrace := .zero _
    tagSteps_ge := Nat.zero_le 0 }

def extend {initial : MachineConfig}
    {initialBoundary : RegisteredBoundary initial} {machineSteps : Nat}
    (path : RegisteredPath initial initialBoundary machineSteps)
    (next : MachineState) (written : MachineSymbol)
    (move : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition path.config.state path.config.current =
      .step next written move) :
    RegisteredPath initial initialBoundary (machineSteps + 1) := by
  let step := registeredMachineStep_of_command path.config path.boundary
    next written move hcommand
  refine
    { config := step.nextConfig
      boundary := step.nextBoundary
      tagSteps := step.arrival.steps + path.tagSteps
      config_eq := ?_
      tagTrace := HaltCleanup.TagStepsN.append path.tagTrace
        step.arrival.reaches
      tagSteps_ge := ?_ }
  · rw [Rogozhin46.iterate_succ, ← path.config_eq,
      Rogozhin46.absorbingStep_of_step? step.machineStep]
  · have hone : 1 ≤ step.arrival.steps := step.arrival.steps_pos
    have hadd := Nat.add_le_add hone path.tagSteps_ge
    simpa only [Nat.add_comm machineSteps 1] using hadd

end RegisteredPath

/-- Every finite prefix on which all earlier machine configurations are
nonhalting has an exact registered boundary path. -/
theorem exists_registeredPath_of_running
    (initial : MachineConfig) (initialBoundary : RegisteredBoundary initial) :
    ∀ machineSteps : Nat,
      (∀ earlier, earlier < machineSteps →
        ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial)) →
      Nonempty (RegisteredPath initial initialBoundary machineSteps)
  | 0, running => ⟨RegisteredPath.zero initial initialBoundary⟩
  | machineSteps + 1, running => by
      have runningPrefix : ∀ earlier, earlier < machineSteps →
          ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial) := by
        intro earlier hlt
        exact running earlier
          (Nat.lt_trans hlt (Nat.lt_succ_self machineSteps))
      obtain ⟨path⟩ := exists_registeredPath_of_running initial
        initialBoundary machineSteps runningPrefix
      have hnot : ¬ Rogozhin46.Halted path.config := by
        rw [path.config_eq]
        exact running machineSteps (Nat.lt_succ_self machineSteps)
      cases hcommand : Rogozhin46.transition path.config.state
          path.config.current with
      | halt => exact (hnot hcommand).elim
      | step next written move =>
          exact ⟨path.extend next written move hcommand⟩

theorem registeredWord_ne_nil (config : MachineConfig)
    (boundary : RegisteredBoundary config) :
    registeredWord config boundary ≠ [] := by
  cases boundary with
  | canonical =>
      obtain ⟨rest, hstart⟩ := canonicalWord_starts_two_heads config
      rw [registeredWord, hstart]
      exact List.cons_ne_nil _ _
  | arrival direction origin valid =>
      obtain ⟨rest, hstart⟩ :=
        arrivalWord_starts_head_left direction origin config
      rw [registeredWord, hstart]
      exact List.cons_ne_nil _ _

theorem registeredEncodeWord_ne_nil (config : MachineConfig)
    (boundary : RegisteredBoundary config) :
    encodeWord (registeredWord config boundary) ≠ [] := by
  intro hempty
  have hlength := encodeWord_length (registeredWord config boundary)
  rw [hempty, List.length_nil] at hlength
  have hwordPositive : 0 < (registeredWord config boundary).length :=
    List.length_pos_iff.mpr (registeredWord_ne_nil config boundary)
  have hencodedPositive : 0 <
      alphabetSize * (registeredWord config boundary).length :=
    Nat.mul_pos (by decide : 0 < alphabetSize) hwordPositive
  exact (Nat.ne_of_gt hencodedPositive) hlength.symm

def registeredBoundaryForm {config : MachineConfig} :
    RegisteredBoundary config → HaltCleanup.BoundaryForm
  | .canonical => .canonical
  | .arrival .left _ _ => .leftArrival
  | .arrival .right _ _ => .rightArrival

theorem halted_current_eq_s3 {config : MachineConfig}
    (hhalted : Rogozhin46.Halted config) : config.current = .s3 := by
  rcases (Rogozhin46.halted_iff config).1 hhalted with hC | hD
  · exact hC.2
  · exact hD.2

theorem registeredWord_eq_haltBoundaryWord_of_halted
    (config : MachineConfig) (boundary : RegisteredBoundary config)
    (hhalted : Rogozhin46.Halted config) :
    registeredWord config boundary =
      haltBoundaryWord (registeredBoundaryForm boundary) config := by
  cases boundary with
  | canonical => rfl
  | arrival direction origin valid =>
      cases direction with
      | left =>
          cases origin with
          | representedCell => rfl
          | periodicTail =>
              have hcurrent := valid.1
              have hs3 := halted_current_eq_s3 hhalted
              have himpossible : Rogozhin46.Symbol.s4 = .s3 :=
                hcurrent.symm.trans hs3
              cases himpossible
      | right =>
          cases origin with
          | representedCell => rfl
          | periodicTail =>
              have hcurrent := valid.1
              have hs3 := halted_current_eq_s3 hhalted
              have himpossible : Rogozhin46.Symbol.s4 = .s3 :=
                hcurrent.symm.trans hs3
              cases himpossible

/-- A finite registered path whose endpoint is a halting Rogozhin pair. -/
structure HaltingReach (initial : MachineConfig)
    (initialBoundary : RegisteredBoundary initial) where
  machineSteps : Nat
  path : RegisteredPath initial initialBoundary machineSteps
  halted : Rogozhin46.Halted path.config

def HaltingReach.atStart (initial : MachineConfig)
    (initialBoundary : RegisteredBoundary initial)
    (hhalted : Rogozhin46.Halted initial) :
    HaltingReach initial initialBoundary :=
  { machineSteps := 0
    path := RegisteredPath.zero initial initialBoundary
    halted := hhalted }

def HaltingReach.prependCommand
    (initial : MachineConfig) (initialBoundary : RegisteredBoundary initial)
    (next : MachineState) (written : MachineSymbol)
    (move : Rogozhin46.Direction)
    (hcommand : Rogozhin46.transition initial.state initial.current =
      .step next written move)
    (later : HaltingReach
      (Rogozhin46.applyTransition initial next written move)
      (successorBoundary initial next written move)) :
    HaltingReach initial initialBoundary := by
  let first := registeredMachineStep_of_command initial initialBoundary
    next written move hcommand
  let laterPath := later.path
  have hiterateOne : Rogozhin46.iterate 1 initial = first.nextConfig := by
    rw [Rogozhin46.iterate_succ, Rogozhin46.iterate_zero,
      Rogozhin46.absorbingStep_of_step? first.machineStep]
  let combinedPath : RegisteredPath initial initialBoundary
      (later.machineSteps + 1) :=
    { config := laterPath.config
      boundary := laterPath.boundary
      tagSteps := laterPath.tagSteps + first.arrival.steps
      config_eq := by
        calc
          laterPath.config = Rogozhin46.iterate later.machineSteps
              first.nextConfig := laterPath.config_eq
          _ = Rogozhin46.iterate later.machineSteps
              (Rogozhin46.iterate 1 initial) :=
                congrArg (Rogozhin46.iterate later.machineSteps)
                  hiterateOne.symm
          _ = Rogozhin46.iterate (later.machineSteps + 1) initial :=
                (Rogozhin46.iterate_add later.machineSteps 1 initial).symm
      tagTrace := HaltCleanup.TagStepsN.append first.arrival.reaches
        laterPath.tagTrace
      tagSteps_ge := by
        have hone : 1 ≤ first.arrival.steps := first.arrival.steps_pos
        exact Nat.add_le_add laterPath.tagSteps_ge hone }
  exact
    { machineSteps := later.machineSteps + 1
      path := combinedPath
      halted := later.halted }

/-- Any bounded witness that the absorbing Rogozhin iterate is halted yields
an exact finite registered reach to a halted boundary, stopping immediately
if the starting configuration is already halted. -/
theorem haltingReach_of_iterate_halted :
    ∀ (horizon : Nat) (initial : MachineConfig)
      (initialBoundary : RegisteredBoundary initial),
      Rogozhin46.Halted (Rogozhin46.iterate horizon initial) →
      Nonempty (HaltingReach initial initialBoundary)
  | 0, initial, initialBoundary, hhalted =>
      ⟨HaltingReach.atStart initial initialBoundary hhalted⟩
  | horizon + 1, initial, initialBoundary, hhalted => by
      by_cases hnow : Rogozhin46.Halted initial
      · exact ⟨HaltingReach.atStart initial initialBoundary hnow⟩
      · cases hcommand : Rogozhin46.transition initial.state initial.current with
        | halt => exact (hnow hcommand).elim
        | step next written move =>
            let successor :=
              Rogozhin46.applyTransition initial next written move
            have hstep : Rogozhin46.step? initial = some successor :=
              Rogozhin46.step?_eq_some_applyTransition initial next written
                move hcommand
            have hone : Rogozhin46.iterate 1 initial = successor := by
              rw [Rogozhin46.iterate_succ, Rogozhin46.iterate_zero,
                Rogozhin46.absorbingStep_of_step? hstep]
            have hlater : Rogozhin46.Halted
                (Rogozhin46.iterate horizon successor) := by
              rw [← hone, ← Rogozhin46.iterate_add horizon 1 initial]
              exact hhalted
            obtain ⟨later⟩ := haltingReach_of_iterate_halted horizon successor
              (successorBoundary initial next written move) hlater
            exact ⟨later.prependCommand initial initialBoundary next written
              move hcommand⟩

theorem haltingReach_of_eventuallyHalts
    (initial : MachineConfig) (initialBoundary : RegisteredBoundary initial)
    (heventual : Rogozhin46.EventuallyHalts initial) :
    Nonempty (HaltingReach initial initialBoundary) := by
  obtain ⟨horizon, hhalted⟩ := heventual
  exact haltingReach_of_iterate_halted horizon initial initialBoundary hhalted

theorem RegisteredPath.endpoint_is_iterate
    {initial : MachineConfig} {initialBoundary : RegisteredBoundary initial}
    {machineSteps : Nat}
    (path : RegisteredPath initial initialBoundary machineSteps) :
    path.config = Rogozhin46.iterate machineSteps initial :=
  path.config_eq

theorem RegisteredPath.boundary_data_ne_nil
    {initial : MachineConfig} {initialBoundary : RegisteredBoundary initial}
    {machineSteps : Nat}
    (path : RegisteredPath initial initialBoundary machineSteps) :
    (CTS.initial rogozhinCookProgram
      (encodeWord (registeredWord path.config path.boundary))).data ≠ [] := by
  simpa only [CTS.initial_data] using
    (registeredEncodeWord_ne_nil path.config path.boundary)

/-- The exact halted-boundary time followed by the full cleanup horizon
is the first empty CTS dataword.  The prefix part uses the accumulated
all-machine-step trace; the suffix uses the certified cleanup theorem. -/
theorem HaltingReach.firstEmpty
    {initial : MachineConfig} {initialBoundary : RegisteredBoundary initial}
    (reach : HaltingReach initial initialBoundary) :
    ∃ ticks,
      (CTS.iterate rogozhinCookProgram ticks
        (CTS.initial rogozhinCookProgram
          (encodeWord (registeredWord initial initialBoundary)))).data = [] ∧
      ∀ earlier, earlier < ticks →
        (CTS.iterate rogozhinCookProgram earlier
          (CTS.initial rogozhinCookProgram
            (encodeWord (registeredWord initial initialBoundary)))).data ≠ [] := by
  let form := registeredBoundaryForm reach.path.boundary
  obtain ⟨bridge⟩ := cleanupBridge_of_halted form reach.path.config
    reach.halted
  have hregistered := registeredWord_eq_haltBoundaryWord_of_halted
    reach.path.config reach.path.boundary reach.halted
  have hword : registeredWord reach.path.config reach.path.boundary =
      bridge.certificate.word :=
    hregistered.trans bridge.word_eq.symm
  let kappa := ctsPeriod * reach.path.tagSteps
  have atBoundary :
      CTS.iterate rogozhinCookProgram kappa
          (CTS.initial rogozhinCookProgram
            (encodeWord (registeredWord initial initialBoundary))) =
        CTS.initial rogozhinCookProgram
          (encodeWord bridge.certificate.word) := by
    have lifted := reach.path.tagTrace.toCTS
    rw [hword] at lifted
    exact lifted
  refine ⟨HaltCleanup.fullCleanupHorizon bridge.certificate + kappa,
    ?_, ?_⟩
  · have endpoint := bridge.certificate.empties_after_boundary atBoundary
    have hdata := congrArg
      (fun config : CTS.Config rogozhinCookProgram => config.data) endpoint
    exact hdata
  · intro earlier hbefore
    by_cases beforeBoundary : earlier < kappa
    · exact reach.path.tagTrace.cts_data_ne_nil_before earlier beforeBoundary
    · have boundaryLe : kappa ≤ earlier := Nat.le_of_not_gt beforeBoundary
      obtain ⟨relative, hearlier⟩ := Nat.exists_eq_add_of_le boundaryLe
      have relativeBefore : relative <
          HaltCleanup.fullCleanupHorizon bridge.certificate := by
        rw [hearlier, Nat.add_comm
          (HaltCleanup.fullCleanupHorizon bridge.certificate) kappa] at hbefore
        exact Nat.lt_of_add_lt_add_left hbefore
      have hnonempty :=
        bridge.certificate.nonempty_after_boundary_before_fullCleanup
          atBoundary relative relativeBefore
      rw [hearlier, Nat.add_comm kappa relative]
      exact hnonempty

/-- Constructive bounded search: either a halted iterate occurs below the
bound, or every iterate below it is running. -/
theorem haltedBefore_or_running (initial : MachineConfig) :
    ∀ bound : Nat,
      (∃ earlier, earlier < bound ∧
        Rogozhin46.Halted (Rogozhin46.iterate earlier initial)) ∨
      (∀ earlier, earlier < bound →
        ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial))
  | 0 => Or.inr fun earlier hlt => (Nat.not_lt_zero earlier hlt).elim
  | bound + 1 => by
      cases haltedBefore_or_running initial bound with
      | inl found =>
          rcases found with ⟨earlier, hlt, hhalted⟩
          exact Or.inl ⟨earlier,
            Nat.lt_trans hlt (Nat.lt_succ_self bound), hhalted⟩
      | inr running =>
          by_cases hlast :
              Rogozhin46.Halted (Rogozhin46.iterate bound initial)
          · exact Or.inl ⟨bound, Nat.lt_succ_self bound, hlast⟩
          · apply Or.inr
            intro earlier hlt
            have hle : earlier ≤ bound := Nat.le_of_lt_succ hlt
            cases Nat.lt_or_eq_of_le hle with
            | inl hstrict => exact running earlier hstrict
            | inr heq =>
                subst earlier
                exact hlast

/-- The fixed Cook CTS reaches an empty dataword from a registered encoding
if and only if the represented Rogozhin configuration eventually halts. -/
theorem eventuallyHalts_iff_exists_cts_empty
    (initial : MachineConfig) (initialBoundary : RegisteredBoundary initial) :
    Rogozhin46.EventuallyHalts initial ↔
      ∃ ticks,
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram
            (encodeWord (registeredWord initial initialBoundary)))).data = [] := by
  constructor
  · intro heventual
    obtain ⟨reach⟩ := haltingReach_of_eventuallyHalts initial
      initialBoundary heventual
    obtain ⟨ticks, hempty, hfirst⟩ := reach.firstEmpty
    exact ⟨ticks, hempty⟩
  · rintro ⟨ticks, hempty⟩
    cases haltedBefore_or_running initial (ticks + 1) with
    | inl found =>
      obtain ⟨earlier, hlt, hhalted⟩ := found
      exact ⟨earlier, hhalted⟩
    | inr running =>
      obtain ⟨path⟩ := exists_registeredPath_of_running initial
        initialBoundary (ticks + 1) running
      have htag : ticks < path.tagSteps :=
        Nat.lt_of_succ_le path.tagSteps_ge
      have hperiod : 1 ≤ ctsPeriod := by decide
      have hscale : path.tagSteps ≤ ctsPeriod * path.tagSteps := by
        have := Nat.mul_le_mul_right path.tagSteps hperiod
        simpa only [Nat.one_mul] using this
      have hbefore : ticks < ctsPeriod * path.tagSteps :=
        Nat.lt_of_lt_of_le htag hscale
      have hnonempty := path.tagTrace.cts_data_ne_nil_before ticks hbefore
      exact (hnonempty hempty).elim

/-- Equivalent first-event formulation: the exhibited horizon is empty and
every strictly earlier CTS dataword is nonempty. -/
theorem eventuallyHalts_iff_exists_first_cts_empty
    (initial : MachineConfig) (initialBoundary : RegisteredBoundary initial) :
    Rogozhin46.EventuallyHalts initial ↔
      ∃ ticks,
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram
            (encodeWord (registeredWord initial initialBoundary)))).data = [] ∧
        ∀ earlier, earlier < ticks →
          (CTS.iterate rogozhinCookProgram earlier
            (CTS.initial rogozhinCookProgram
              (encodeWord (registeredWord initial initialBoundary)))).data ≠ [] := by
  constructor
  · intro heventual
    obtain ⟨reach⟩ := haltingReach_of_eventuallyHalts initial
      initialBoundary heventual
    exact reach.firstEmpty
  · rintro ⟨ticks, hempty, hfirst⟩
    exact (eventuallyHalts_iff_exists_cts_empty initial initialBoundary).2
      ⟨ticks, hempty⟩

/-- Canonical specialization used by the fixed input compiler. -/
theorem canonical_eventuallyHalts_iff_exists_cts_empty
    (initial : MachineConfig) :
    Rogozhin46.EventuallyHalts initial ↔
      ∃ ticks,
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram
            (encodeWord (canonicalWord initial)))).data = [] := by
  simpa only [registeredWord] using
    (eventuallyHalts_iff_exists_cts_empty initial
      (RegisteredBoundary.canonical : RegisteredBoundary initial))

theorem canonical_eventuallyHalts_iff_exists_first_cts_empty
    (initial : MachineConfig) :
    Rogozhin46.EventuallyHalts initial ↔
      ∃ ticks,
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram
            (encodeWord (canonicalWord initial)))).data = [] ∧
        ∀ earlier, earlier < ticks →
          (CTS.iterate rogozhinCookProgram earlier
            (CTS.initial rogozhinCookProgram
              (encodeWord (canonicalWord initial)))).data ≠ [] := by
  simpa only [registeredWord] using
    (eventuallyHalts_iff_exists_first_cts_empty initial
      (RegisteredBoundary.canonical : RegisteredBoundary initial))

end PassClassification

end PureSFormal.Cook
