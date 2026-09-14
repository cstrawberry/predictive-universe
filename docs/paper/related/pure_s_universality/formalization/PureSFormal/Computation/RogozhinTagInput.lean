import PureSFormal.Rogozhin.Machine

/-!
# Executable Rogozhin T2-tag input codec

Rogozhin's fixed four-state machine simulates a restricted class `T2` of
two-tag systems.  This file formalizes that source syntax, its total dynamics,
and the initial-tape formula printed in Section 8 of the primary construction.
The result is an executable compiler into the exact normalized `Rogozhin46`
configuration type.

This file intentionally does not assert that the fixed machine simulates the
tag dynamics.  That unbounded three-sweep invariant, and an explicit compiler
from the independent counter source to `T2`, are outside this module's scope.
-/

namespace PureSFormal.Computation

namespace RogozhinTagInput

/-- A zero-based tag-symbol label. -/
abbrev Label := Nat

/-- A finite table of productions; the halting label is the table length. -/
structure Program where
  productions : List (List Label)
  deriving DecidableEq, Repr

/-- One restricted-tag job. -/
structure Job where
  program : Program
  word : List Label
  deriving DecidableEq, Repr

/-- Number of nonhalting tag symbols. -/
def symbolCount (program : Program) : Nat :=
  program.productions.length

/-- The last nonhalting symbol, whose required production is two copies. -/
def distinguished (program : Program) : Label :=
  symbolCount program - 1

/-- The tag-system halting symbol. -/
def haltLabel (program : Program) : Label :=
  symbolCount program

/-- Out-of-range production lookup returns the empty word. -/
def productionAt (program : Program) (label : Label) : List Label :=
  program.productions.getD label []

/-- All labels in a word lie in the alphabet including the halting symbol. -/
def LabelsValid (program : Program) (word : List Label) : Prop :=
  ∀ label, label ∈ word → label ≤ haltLabel program

/--
The restricted class printed by Rogozhin: every nondistinguished production
starts with two distinguished symbols and a nonempty suffix, while the
distinguished production is exactly a double copy.
-/
def IsT2 (program : Program) : Prop :=
  0 < symbolCount program ∧
  productionAt program (distinguished program) =
    [distinguished program, distinguished program] ∧
  ∀ label, label < distinguished program →
    ∃ suffix : List Label,
      suffix ≠ [] ∧
      productionAt program label =
        distinguished program :: distinguished program :: suffix ∧
      LabelsValid program suffix

/-- One deletion-two tag step; short words and the halting head stop. -/
def step? (program : Program) : List Label → Option (List Label)
  | first :: _second :: rest =>
      if first = haltLabel program then none
      else some (rest ++ productionAt program first)
  | _ => none

/-- Absorbing total extension of the restricted tag dynamics. -/
def absorbingStep (program : Program) (word : List Label) : List Label :=
  match step? program word with
  | none => word
  | some next => next

/-- Total bounded tag iteration. -/
def iterate (program : Program) : Nat → List Label → List Label
  | 0, word => word
  | horizon + 1, word =>
      absorbingStep program (iterate program horizon word)

@[simp]
theorem iterate_zero (program : Program) (word : List Label) :
    iterate program 0 word = word := rfl

@[simp]
theorem iterate_succ (program : Program) (horizon : Nat)
    (word : List Label) :
    iterate program (horizon + 1) word =
      absorbingStep program (iterate program horizon word) := rfl

/-- Syntactic stopping predicate of deletion-two dynamics. -/
def Halted (program : Program) (word : List Label) : Prop :=
  step? program word = none

instance (program : Program) (word : List Label) :
    Decidable (Halted program word) :=
  inferInstanceAs (Decidable (step? program word = none))

/-- Eventual stopping for a restricted tag job. -/
def EventuallyHalts (job : Job) : Prop :=
  ∃ horizon, Halted job.program
    (iterate job.program horizon job.word)

/-! ## Section-8 initial-tape formula -/

/-- Weight `N_(label+1)`, with `N_1 = 1` and `N_(k+1)=N_k+2m_k`. -/
def weight (program : Program) : Label → Nat
  | 0 => 1
  | label + 1 =>
      weight program label + 2 * (productionAt program label).length

/-- Every printed unary weight is positive. -/
theorem weight_is_succ (program : Program) (label : Label) :
    ∃ predecessor, weight program label = predecessor + 1 := by
  induction label with
  | zero => exact ⟨0, rfl⟩
  | succ label ih =>
      obtain ⟨predecessor, hweight⟩ := ih
      refine ⟨predecessor +
        2 * (productionAt program label).length, ?_⟩
      rw [weight, hweight, Nat.add_assoc]
      rw [Nat.add_comm 1 (2 * (productionAt program label).length)]
      rw [← Nat.add_assoc]

/-- A run of Rogozhin's printed symbol `1`, normalized as symbol zero. -/
def ones (length : Nat) : List Rogozhin46.Symbol :=
  List.replicate length .s0

/-- Encode the exponent sequence occurring after the leading `b1`. -/
def exponentCode : List Nat → List Rogozhin46.Symbol
  | [] => []
  | exponent :: rest =>
      .s1 :: (ones exponent ++
        rest.flatMap fun next => [.s1, .s1] ++ ones next)

/-- Exponents in one printed production code, in their tape order. -/
def productionExponents (program : Program) (label : Label) : List Nat :=
  let payload := (productionAt program label).drop 2
  let reversedPayload := payload.reverse.map (weight program)
  reversedPayload ++ [
    weight program (distinguished program),
    weight program (distinguished program) - weight program label]

/--
Printed code `P_i`: leading `b1`, reversed production payload, two copies of
the distinguished weight, and the final weight difference.
-/
def productionCode (program : Program) (label : Label) :
    List Rogozhin46.Symbol :=
  [.s1, .s0] ++ exponentCode (productionExponents program label)

/-- Printed additional separator code `P_0 = b`. -/
def separatorCode : List Rogozhin46.Symbol := [.s1]

/-- Printed halting-symbol code `P_(n+1) = b-left b`. -/
def haltingCode : List Rogozhin46.Symbol := [.s3, .s1]

/--
The finite nonblank program region `P_(n+1) P_n ... P_1 P_0`.
-/
def programCode (program : Program) : List Rogozhin46.Symbol :=
  haltingCode ++
    (List.range (symbolCount program)).reverse.flatMap
      (productionCode program) ++
    separatorCode

/-- Suffix after the first encoded data symbol, inserting the mark `c`. -/
def dataTail (program : Program) : List Label → List Rogozhin46.Symbol
  | [] => []
  | label :: rest =>
      .s5 :: (ones (weight program label) ++ dataTail program rest)

/-- Printed data code `S = 1^Nr c 1^Ns c ... c 1^Nw`. -/
def dataCode (program : Program) : List Label → List Rogozhin46.Symbol
  | [] => []
  | label :: rest =>
      ones (weight program label) ++ dataTail program rest

/--
Compile the printed finite nonblank tape window. The head scans the first
symbol of `S` in state `q_1` (`A`). An empty data word is mapped to the blank
cell, though well-formed universal inputs are nonempty.
-/
def compile (job : Job) : Rogozhin46.Config :=
  let left := (programCode job.program).reverse
  match dataCode job.program job.word with
  | [] => ⟨.A, .s4, left, []⟩
  | current :: right => ⟨.A, current, left, right⟩

/-- Reconstruct the represented finite tape from left to right. -/
def finiteTape (config : Rogozhin46.Config) : List Rogozhin46.Symbol :=
  config.left.reverse ++ config.current :: config.right

/-- History-free split visible at a candidate initial boundary. -/
def splitInitialBoundary (config : Rogozhin46.Config) :
    Option (List Rogozhin46.Symbol × List Rogozhin46.Symbol) :=
  if config.state = .A ∧ config.current = .s0 then
    some (config.left.reverse, config.current :: config.right)
  else none

/-- Every nonempty data encoding starts with normalized symbol zero. -/
theorem dataCode_head (program : Program) (label : Label)
    (rest : List Label) :
    ∃ tail, dataCode program (label :: rest) = .s0 :: tail := by
  unfold dataCode
  unfold ones
  change ∃ tail,
    List.replicate (weight program label) Rogozhin46.Symbol.s0 ++
      dataTail program rest = .s0 :: tail
  obtain ⟨predecessor, hweight⟩ := weight_is_succ program label
  rw [hweight]
  refine ⟨List.replicate predecessor Rogozhin46.Symbol.s0 ++
    dataTail program rest, ?_⟩
  rfl

/-- Compiled nonempty jobs have the exact printed control/head boundary. -/
theorem compile_nonempty_shape (program : Program) (label : Label)
    (rest : List Label) :
    ∃ right,
      compile ⟨program, label :: rest⟩ =
        ⟨.A, .s0, (programCode program).reverse, right⟩ := by
  obtain ⟨tail, htail⟩ := dataCode_head program label rest
  refine ⟨tail, ?_⟩
  unfold compile
  rw [htail]

/-- The history-free boundary split recovers both literal encoded regions. -/
theorem split_compile_nonempty (program : Program) (label : Label)
    (rest : List Label) :
    splitInitialBoundary (compile ⟨program, label :: rest⟩) =
      some (programCode program, dataCode program (label :: rest)) := by
  obtain ⟨tail, htail⟩ := dataCode_head program label rest
  unfold compile
  rw [htail]
  unfold splitInitialBoundary
  simp

/-- Full finite-tape reconstruction agrees with the printed concatenation. -/
theorem finiteTape_compile_nonempty (program : Program) (label : Label)
    (rest : List Label) :
    finiteTape (compile ⟨program, label :: rest⟩) =
      programCode program ++ dataCode program (label :: rest) := by
  obtain ⟨tail, htail⟩ := dataCode_head program label rest
  unfold compile
  rw [htail]
  unfold finiteTape
  simp

/-- Horizon zero is literally the compiled Section-8 boundary. -/
theorem iterate_compile_zero (job : Job) :
    Rogozhin46.iterate 0 (compile job) = compile job := rfl

end RogozhinTagInput

end PureSFormal.Computation
