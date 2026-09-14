import PureSFormal.Rogozhin.Table

/-!
# The fixed Cook deletion-eight tag system

This module specializes Cook's tag alphabet and production formulas to the
checked Rogozhin four-state, six-symbol table.  The alphabet order is the one
used by the unary cyclic-tag compiler: sixteen unindexed symbols, three
state-major indexed blocks of thirty-two symbols, then two dummy symbols.
-/

namespace PureSFormal.Cook

abbrev MachineState := Rogozhin46.State
abbrev MachineSymbol := Rogozhin46.Symbol
abbrev MachineDirection := Rogozhin46.Direction

/-- The three indexed Cook symbol families. -/
inductive Family where
  | H | L | R
  deriving DecidableEq, Repr

/-- Cook's one-based indices `1,...,8`. -/
inductive Index where
  | j1 | j2 | j3 | j4 | j5 | j6 | j7 | j8
  deriving DecidableEq, Repr

namespace Index

/-- The one-based numerical value of a Cook index. -/
def toNat : Index → Nat
  | .j1 => 1
  | .j2 => 2
  | .j3 => 3
  | .j4 => 4
  | .j5 => 5
  | .j6 => 6
  | .j7 => 7
  | .j8 => 8

/-- The first six Cook indices select the corresponding machine symbol. -/
def machineSymbol? : Index → Option MachineSymbol
  | .j1 => some .s0
  | .j2 => some .s1
  | .j3 => some .s2
  | .j4 => some .s3
  | .j5 => some .s4
  | .j6 => some .s5
  | .j7 => none
  | .j8 => none

@[simp] theorem toNat_j1 : toNat .j1 = 1 := rfl
@[simp] theorem toNat_j2 : toNat .j2 = 2 := rfl
@[simp] theorem toNat_j3 : toNat .j3 = 3 := rfl
@[simp] theorem toNat_j4 : toNat .j4 = 4 := rfl
@[simp] theorem toNat_j5 : toNat .j5 = 5 := rfl
@[simp] theorem toNat_j6 : toNat .j6 = 6 := rfl
@[simp] theorem toNat_j7 : toNat .j7 = 7 := rfl
@[simp] theorem toNat_j8 : toNat .j8 = 8 := rfl

theorem toNat_bounds (index : Index) :
    1 ≤ index.toNat ∧ index.toNat ≤ 8 := by
  cases index <;> decide

end Index

/-- The 114 symbols of the padded specialized Cook alphabet. -/
inductive TagSymbol where
  | head (state : MachineState)
  | left (state : MachineState)
  | right (state : MachineState)
  | rightStar (state : MachineState)
  | indexed (family : Family) (state : MachineState) (index : Index)
  | dummy1
  | dummy2
  deriving DecidableEq, Repr

/-- The complete one-based index enumeration. -/
def indices : List Index :=
  [.j1, .j2, .j3, .j4, .j5, .j6, .j7, .j8]

/-- One state-major block of indexed symbols. -/
def indexedBlock (family : Family) : List TagSymbol :=
  Rogozhin46.states.flatMap fun state =>
    indices.map fun index => .indexed family state index

/-- The 112 non-padding symbols in the required fixed order. -/
def structuredAlphabet : List TagSymbol :=
  Rogozhin46.states.map TagSymbol.head ++
  Rogozhin46.states.map TagSymbol.left ++
  Rogozhin46.states.map TagSymbol.right ++
  Rogozhin46.states.map TagSymbol.rightStar ++
  indexedBlock .H ++ indexedBlock .L ++ indexedBlock .R

/-- The exact padded 114-symbol alphabet. -/
def alphabet : List TagSymbol :=
  structuredAlphabet ++ [.dummy1, .dummy2]

@[simp]
theorem indices_length : indices.length = 8 := rfl

@[simp]
theorem indexedBlock_length (family : Family) :
    (indexedBlock family).length = 32 := by
  cases family <;> rfl

@[simp]
theorem structuredAlphabet_length : structuredAlphabet.length = 112 := rfl

@[simp]
theorem alphabet_length : alphabet.length = 114 := rfl

/-- Every index occurs in the complete index list. -/
theorem index_mem_indices (index : Index) : index ∈ indices := by
  cases index <;> decide

/-- Every constructor value occurs in the exact alphabet enumeration. -/
theorem symbol_mem_alphabet (symbol : TagSymbol) : symbol ∈ alphabet := by
  cases symbol with
  | head state => cases state <;> decide
  | left state => cases state <;> decide
  | right state => cases state <;> decide
  | rightStar state => cases state <;> decide
  | indexed family state index =>
      cases family <;> cases state <;> cases index <;> decide
  | dummy1 => decide
  | dummy2 => decide

/-- The ordered alphabet has no repeated symbol. -/
theorem alphabet_nodup : alphabet.Nodup := by
  decide

/-- Numeric value of a normalized Rogozhin tape symbol. -/
def machineSymbolValue : MachineSymbol → Nat
  | .s0 => 0
  | .s1 => 1
  | .s2 => 2
  | .s3 => 3
  | .s4 => 4
  | .s5 => 5

/-- Cook's one-based machine-symbol index. -/
def machineSymbolBar (symbol : MachineSymbol) : Nat :=
  machineSymbolValue symbol + 1

/-- The shift exponent `8(8-a_bar)` in Cook's transition productions. -/
def shiftExponent (written : MachineSymbol) : Nat :=
  8 * (8 - machineSymbolBar written)

theorem machineSymbolValue_le_five (symbol : MachineSymbol) :
    machineSymbolValue symbol ≤ 5 := by
  cases symbol <;> decide

theorem machineSymbolBar_bounds (symbol : MachineSymbol) :
    1 ≤ machineSymbolBar symbol ∧ machineSymbolBar symbol ≤ 6 := by
  cases symbol <;> decide

theorem shiftExponent_le_fifty_six (symbol : MachineSymbol) :
    shiftExponent symbol ≤ 56 := by
  cases symbol <;> decide

/-- Cook's three productions for one non-marker machine-table cell. -/
def machineProduction (family : Family) (state : MachineState)
    (indexValue : Nat) (read : MachineSymbol) : List TagSymbol :=
  match Rogozhin46.transition state read with
  | .halt => []
  | .step next written .left =>
      match family with
      | .H =>
          List.replicate (shiftExponent written) (.rightStar next) ++
          List.replicate indexValue (.head next)
      | .L => [.left next]
      | .R => List.replicate 64 (.right next)
  | .step next written .right =>
      match family with
      | .H =>
          List.replicate indexValue (.head next) ++
          List.replicate (shiftExponent written) (.left next)
      | .L => List.replicate 64 (.left next)
      | .R => [.right next]

/-- The period-one blank-tail marker production at Cook index seven. -/
def markerSevenProduction (family : Family) (state : MachineState) :
    List TagSymbol :=
  match family with
  | .H =>
      List.replicate 10 (.head state) ++ List.replicate 8 (.left state)
  | .L => List.replicate 8 (.left state)
  | .R => List.replicate 8 (.right state)

/-- The period-one blank-tail marker production at Cook index eight. -/
def markerEightProduction (family : Family) (state : MachineState) :
    List TagSymbol :=
  match family with
  | .H => List.replicate 11 (.head state)
  | .L => List.replicate 8 (.left state)
  | .R => List.replicate 8 (.right state)

/-- The total indexed production function for `j=1,...,8`. -/
def indexedProduction (family : Family) (state : MachineState) :
    Index → List TagSymbol
  | .j1 => machineProduction family state 1 .s0
  | .j2 => machineProduction family state 2 .s1
  | .j3 => machineProduction family state 3 .s2
  | .j4 => machineProduction family state 4 .s3
  | .j5 => machineProduction family state 5 .s4
  | .j6 => machineProduction family state 6 .s5
  | .j7 => markerSevenProduction family state
  | .j8 => markerEightProduction family state

/-- The exact total production function on all 114 symbols. -/
def production : TagSymbol → List TagSymbol
  | .head state =>
      indices.map fun index => .indexed .H state index
  | .left state =>
      indices.map fun index => .indexed .L state index
  | .right state =>
      indices.map fun index => .indexed .R state index
  | .rightStar state =>
      List.replicate 8 (.right state)
  | .indexed family state index =>
      indexedProduction family state index
  | .dummy1 => []
  | .dummy2 => []

@[simp]
theorem production_head (state : MachineState) :
    production (.head state) =
      indices.map fun index => .indexed .H state index := rfl

@[simp]
theorem production_left (state : MachineState) :
    production (.left state) =
      indices.map fun index => .indexed .L state index := rfl

@[simp]
theorem production_right (state : MachineState) :
    production (.right state) =
      indices.map fun index => .indexed .R state index := rfl

@[simp]
theorem production_rightStar (state : MachineState) :
    production (.rightStar state) = List.replicate 8 (.right state) := rfl

@[simp]
theorem production_indexed (family : Family) (state : MachineState)
    (index : Index) :
    production (.indexed family state index) =
      indexedProduction family state index := rfl

@[simp]
theorem production_dummy1 : production .dummy1 = [] := rfl

@[simp]
theorem production_dummy2 : production .dummy2 = [] := rfl

@[simp]
theorem indexedProduction_j1 (family : Family) (state : MachineState) :
    indexedProduction family state .j1 =
      machineProduction family state 1 .s0 := rfl

@[simp]
theorem indexedProduction_j2 (family : Family) (state : MachineState) :
    indexedProduction family state .j2 =
      machineProduction family state 2 .s1 := rfl

@[simp]
theorem indexedProduction_j3 (family : Family) (state : MachineState) :
    indexedProduction family state .j3 =
      machineProduction family state 3 .s2 := rfl

@[simp]
theorem indexedProduction_j4 (family : Family) (state : MachineState) :
    indexedProduction family state .j4 =
      machineProduction family state 4 .s3 := rfl

@[simp]
theorem indexedProduction_j5 (family : Family) (state : MachineState) :
    indexedProduction family state .j5 =
      machineProduction family state 5 .s4 := rfl

@[simp]
theorem indexedProduction_j6 (family : Family) (state : MachineState) :
    indexedProduction family state .j6 =
      machineProduction family state 6 .s5 := rfl

@[simp]
theorem indexedProduction_j7 (family : Family) (state : MachineState) :
    indexedProduction family state .j7 =
      markerSevenProduction family state := rfl

@[simp]
theorem indexedProduction_j8 (family : Family) (state : MachineState) :
    indexedProduction family state .j8 =
      markerEightProduction family state := rfl

/-- All three productions selected by Rogozhin's `(C,3)` halt cell are empty. -/
theorem indexedProduction_halt_C3 (family : Family) :
    indexedProduction family .C .j4 = [] := by
  cases family <;> rfl

/-- All three productions selected by Rogozhin's `(D,3)` halt cell are empty. -/
theorem indexedProduction_halt_D3 (family : Family) :
    indexedProduction family .D .j4 = [] := by
  cases family <;> rfl

/-- No other indexed production is empty. -/
theorem indexedProduction_eq_nil_iff
    (family : Family) (state : MachineState) (index : Index) :
    indexedProduction family state index = [] ↔
      (state = .C ∧ index = .j4) ∨ (state = .D ∧ index = .j4) := by
  cases family <;> cases state <;> cases index <;> decide

/-- A reflected production-table row. -/
structure ProductionEntry where
  lhs : TagSymbol
  rhs : List TagSymbol
  deriving DecidableEq, Repr

/-- Reflect all 114 total productions in alphabet order. -/
def productionTable : List ProductionEntry :=
  alphabet.map fun lhs => ⟨lhs, production lhs⟩

@[simp]
theorem productionTable_length : productionTable.length = 114 := rfl

/-- The reflected table has one row for every tag symbol. -/
theorem production_complete (symbol : TagSymbol) :
    ⟨symbol, production symbol⟩ ∈ productionTable := by
  exact Rogozhin46.mem_map_image _ (symbol_mem_alphabet symbol)

/-- A reflected row occurs exactly when its RHS agrees with `production`. -/
theorem productionEntry_mem_iff (entry : ProductionEntry) :
    entry ∈ productionTable ↔ entry.rhs = production entry.lhs := by
  constructor
  · intro hmem
    obtain ⟨symbol, _, heq⟩ :=
      Rogozhin46.exists_of_mem_map
        (fun lhs : TagSymbol => ProductionEntry.mk lhs (production lhs)) hmem
    rw [← heq]
  · intro hagree
    cases entry with
    | mk lhs rhs =>
        simp only at hagree
        subst rhs
        exact production_complete lhs

/-- Proposed RHS equality is reflected by membership in the finite table. -/
theorem production_eq_iff_mem (symbol : TagSymbol) (rhs : List TagSymbol) :
    production symbol = rhs ↔ ⟨symbol, rhs⟩ ∈ productionTable := by
  constructor
  · intro heq
    exact (productionEntry_mem_iff _).2 heq.symm
  · intro hmem
    exact ((productionEntry_mem_iff _).1 hmem).symm

/-- Every LHS has exactly one reflected RHS. -/
theorem production_unique (symbol : TagSymbol) :
    ∃ rhs : List TagSymbol,
      ⟨symbol, rhs⟩ ∈ productionTable ∧
      ∀ candidate : List TagSymbol,
        ⟨symbol, candidate⟩ ∈ productionTable → candidate = rhs := by
  refine ⟨production symbol, production_complete symbol, ?_⟩
  intro candidate hmem
  exact (productionEntry_mem_iff _).1 hmem

/-- No reflected production row is repeated. -/
theorem productionTable_nodup : productionTable.Nodup := by
  decide

/-- Every production RHS contains only symbols from the same 114 alphabet. -/
theorem production_rhs_closed (symbol rhsSymbol : TagSymbol)
    (_hmem : rhsSymbol ∈ production symbol) :
    rhsSymbol ∈ alphabet :=
  symbol_mem_alphabet rhsSymbol

/-- Every specialized production has at most 64 tag symbols. -/
theorem production_length_le_sixty_four (symbol : TagSymbol) :
    (production symbol).length ≤ 64 := by
  cases symbol with
  | head state => cases state <;> decide
  | left state => cases state <;> decide
  | right state => cases state <;> decide
  | rightStar state => cases state <;> decide
  | indexed family state index =>
      cases family <;> cases state <;> cases index <;> decide
  | dummy1 => decide
  | dummy2 => decide

/-- Exact aggregate number of tag symbols across all 114 RHS words. -/
theorem total_rhs_symbol_count :
    (productionTable.map fun entry => entry.rhs.length).sum = 2662 := by
  set_option maxRecDepth 10000 in
    decide

/-- Exactly eight productions are empty: six halt-family rows and two dummies. -/
theorem empty_production_count :
    (productionTable.filter fun entry => entry.rhs.isEmpty).length = 8 := by
  set_option maxRecDepth 10000 in
    decide

end PureSFormal.Cook
