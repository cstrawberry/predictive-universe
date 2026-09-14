import PureSFormal.Computation.SigmaOne
import PureSFormal.Rogozhin.Machine

/-!
# Concrete fixed-machine endpoints

This file records two fully checked configurations of the exact Rogozhin
table: one is halted immediately, and one runs forever while extending a
one-sided zero trail. They give an unconditional executable reduction of
the decidable exponentially initialized bounded-run matrix. This is not a
reduction of the existentially quantified predicate; that stronger result
requires a universal input compiler for the fixed machine.
-/

namespace PureSFormal.Computation

namespace RogozhinConcrete

/-- A printed halting cell of the exact table. -/
def haltedConfig : Rogozhin46.Config :=
  ⟨.C, .s3, [], []⟩

/-- The simple left-moving nonhalting ray after `length` transitions. -/
def loopConfig (length : Nat) : Rogozhin46.Config :=
  ⟨.B, .s4, [], List.replicate length .s0⟩

/-- Initial point of the nonhalting ray. -/
def loopingConfig : Rogozhin46.Config := loopConfig 0

@[simp]
theorem haltedConfig_halted : Rogozhin46.Halted haltedConfig := rfl

@[simp]
theorem loopConfig_not_halted (length : Nat) :
    ¬Rogozhin46.Halted (loopConfig length) := by
  intro impossible
  cases impossible

/-- One exact table transition extends the zero trail by one cell. -/
theorem absorbingStep_loopConfig (length : Nat) :
    Rogozhin46.absorbingStep (loopConfig length) =
      loopConfig (length + 1) := by
  rfl

/-- Exact closed form of every iterate on the nonhalting ray. -/
theorem iterate_loopingConfig (horizon : Nat) :
    Rogozhin46.iterate horizon loopingConfig = loopConfig horizon := by
  induction horizon with
  | zero => rfl
  | succ horizon ih =>
      rw [Rogozhin46.iterate_succ, ih, absorbingStep_loopConfig]

/-- The exhibited ray never reaches either halting cell. -/
theorem loopingConfig_not_eventuallyHalts :
    ¬Rogozhin46.EventuallyHalts loopingConfig := by
  rintro ⟨horizon, hhalted⟩
  rw [iterate_loopingConfig] at hhalted
  exact loopConfig_not_halted horizon hhalted

/-- Compile a Boolean decision to a halted or certified nonhalting config. -/
def compileBool (decision : Bool) : Rogozhin46.Config :=
  if decision then haltedConfig else loopingConfig

/-- Boolean compilation has exact eventual-halting semantics. -/
theorem compileBool_correct (decision : Bool) :
    decision = true ↔ Rogozhin46.EventuallyHalts (compileBool decision) := by
  cases decision with
  | false =>
      simp [compileBool, loopingConfig_not_eventuallyHalts]
  | true =>
      simp [compileBool, Rogozhin46.eventuallyHalts_of_halted]

/-- One instance of the decidable exponentially initialized bounded-run
matrix. -/
structure MatrixInput where
  formula : BoundedSigmaOne.Formula
  input : Nat
  witness : Nat
  deriving DecidableEq, Repr

/-- Truth of the total bounded matrix, before existential quantification. -/
def MatrixAccepts (job : MatrixInput) : Prop :=
  BoundedSigmaOne.eval job.formula job.input job.witness = true

/-- Executable compilation of a bounded matrix instance. -/
def compileMatrix (job : MatrixInput) : Rogozhin46.Config :=
  compileBool (BoundedSigmaOne.eval job.formula job.input job.witness)

/-- Exact reduction of the bounded matrix to the fixed-machine halt event. -/
theorem compileMatrix_correct (job : MatrixInput) :
    MatrixAccepts job ↔
      Rogozhin46.EventuallyHalts (compileMatrix job) :=
  compileBool_correct _

theorem matrix_reduces_to_rogozhin :
    ManyOneReduces MatrixAccepts Rogozhin46.EventuallyHalts :=
  ⟨compileMatrix, compileMatrix_correct⟩

end RogozhinConcrete

end PureSFormal.Computation
