import PureSFormal.RootResetChallenge
import PureSFormal.PureS.TermGrowth

/-! Cumulative fresh-root invocation bounds. Each summand is the stopping
time of the concrete selector contract on the current occurrence tree.
The finite controller's own coefficient is used throughout. -/
namespace PureSFormal.Research.RootResetCumulativeResources
open PureSFormal.PureS
open RootResetSelectorContract

def cumulative (contract : Contract) (terms : Nat → Term) : Nat → Nat
  | 0 => 0
  | count + 1 => cumulative contract terms count + contract.stoppingTime (terms count)

theorem cumulative_le_uniform (contract : Contract) (terms : Nat → Term)
    (count bound : Nat)
    (each : ∀ index, index < count → contract.stoppingTime (terms index) ≤ bound) :
    cumulative contract terms count ≤ count * bound := by
  induction count with
  | zero => simp [cumulative]
  | succ count ih =>
      have prefixSum := ih (fun index hi => each index (Nat.lt_trans hi (Nat.lt_succ_self count)))
      have last := each count (Nat.lt_succ_self count)
      simpa only [cumulative, Nat.succ_mul] using Nat.add_le_add prefixSum last

theorem path_cumulative_bound (contract : Contract) (path : WeakPath.ReductionPath)
    (count : Nat) :
    cumulative contract path.term count ≤
      count * contract.coefficient * (2 ^ count * (path.term 0).size + 1) := by
  apply Nat.le_trans (cumulative_le_uniform contract path.term count
    (contract.coefficient * (2 ^ count * (path.term 0).size + 1)) ?_)
  · simp [Nat.mul_assoc]
  · intro index hi
    have power : 2 ^ index ≤ 2 ^ count :=
      Nat.pow_le_pow_right (by decide : 0 < 2) (Nat.le_of_lt hi)
    have size : (path.term index).size ≤ 2 ^ count * (path.term 0).size :=
      Nat.le_trans (path.term_size_le_pow index)
        (Nat.mul_le_mul_right (path.term 0).size power)
    exact Nat.le_trans (contract.stoppingTime_le (path.term index))
      (Nat.mul_le_mul_left contract.coefficient (Nat.add_le_add_right size 1))

def sourcePath (source : RootResetChallenge.Source) : WeakPath.ReductionPath where
  term := RootResetChallenge.sourceTerm source
  contracts := Computation.DeterministicTapeRootResetOutput.termAt_step source

/-- The sum of the actual fixed endpoint's invocation lengths through `count`
contractions. Source padding and source-output encoding are unchanged. -/
def sourceMicroticks (source : RootResetChallenge.Source) (count : Nat) : Nat :=
  cumulative RootResetChallenge.UniversalContract (sourcePath source).term count

theorem source_cumulative_bound (source : RootResetChallenge.Source) (count : Nat) :
    sourceMicroticks source count ≤
      count * RootResetChallenge.UniversalContract.coefficient *
        (2 ^ count * (RootResetChallenge.encode source).size + 1) :=
  path_cumulative_bound RootResetChallenge.UniversalContract (sourcePath source) count

end PureSFormal.Research.RootResetCumulativeResources
