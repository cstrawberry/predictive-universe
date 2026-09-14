import PureSFormal.WeakPathUniversality

/-!
# Monomial-envelope source-horizon transfer for the selected pure-S path

The generic selected-path theorem already gives a cubic contraction bound in
the simulated cyclic-tag horizon.  This module isolates the exact arithmetic
composition needed by any source compiler whose cyclic-tag horizon has a
supplied monomial polynomial envelope. It does not postulate or formalize a
particular external Turing-machine-to-cyclic-tag compiler.
-/

namespace PureSFormal

namespace WeakPathPolynomialCost

open PureS WeakPathUniversality

/-- The finite contraction coefficient belonging to a fixed cyclic-tag
program and its canonical dispatcher. -/
def contractionCoefficient (program : CTS.Program) : Nat :=
  12 +
    (PureS.allActionLabels program |>.map fun label =>
      PureS.LocalResponse.completedCost program
        ((canonicalDispatcher program).route label) label).sum

/-- Any supplied monomial envelope
`horizon ≤ scale * (sourceTime + 1) ^ degree` composes directly with the
checked cubic pure-S checkpoint bound. Domination of an arbitrary polynomial
by such an envelope is not formalized here. -/
theorem checkpointTime_le_of_horizon_le_polynomial
    (program : CTS.Program) (bits : List Bool)
    (sourceTime scale degree horizon : Nat)
    (horizonBound :
      horizon ≤ scale * (sourceTime + 1) ^ degree) :
    (finiteCTSWeakPathUniversality program).checkpointTime bits horizon ≤
      contractionCoefficient program *
        (scale * (sourceTime + 1) ^ degree + 1) ^ 3 := by
  have checkpointBound :=
    finiteCTSCheckpointTime_le_explicit_cubic program bits horizon
  have successorBound :
      horizon + 1 ≤ scale * (sourceTime + 1) ^ degree + 1 :=
    Nat.add_le_add_right horizonBound 1
  have cubeBound :
      (horizon + 1) ^ 3 ≤
        (scale * (sourceTime + 1) ^ degree + 1) ^ 3 :=
    Nat.pow_le_pow_left successorBound 3
  simpa [contractionCoefficient] using
    Nat.le_trans checkpointBound
      (Nat.mul_le_mul_left (contractionCoefficient program) cubeBound)

/-- A quadratic-times-logarithmic cyclic-tag horizon bound composes to the
literal cubed envelope below. `logFactor` is supplied by the external source
compiler; this theorem neither defines nor estimates a logarithm. -/
theorem checkpointTime_le_of_horizon_le_quadratic_log
    (program : CTS.Program) (bits : List Bool)
    (sourceTime scale logFactor horizon : Nat)
    (horizonBound :
      horizon ≤ scale * (sourceTime + 1) ^ 2 * logFactor) :
    (finiteCTSWeakPathUniversality program).checkpointTime bits horizon ≤
      contractionCoefficient program *
        (scale * (sourceTime + 1) ^ 2 * logFactor + 1) ^ 3 := by
  have checkpointBound :=
    finiteCTSCheckpointTime_le_explicit_cubic program bits horizon
  have successorBound :
      horizon + 1 ≤
        scale * (sourceTime + 1) ^ 2 * logFactor + 1 :=
    Nat.add_le_add_right horizonBound 1
  have cubeBound :
      (horizon + 1) ^ 3 ≤
        (scale * (sourceTime + 1) ^ 2 * logFactor + 1) ^ 3 :=
    Nat.pow_le_pow_left successorBound 3
  simpa [contractionCoefficient] using
    Nat.le_trans checkpointBound
      (Nat.mul_le_mul_left (contractionCoefficient program) cubeBound)

/-- A supplied cubic cyclic-tag horizon envelope yields the literal
degree-nine checkpoint-contraction expression below.  In particular, this is
the polynomial envelope used after externally bounding a quadratic-times-log
horizon by a cubic one.  No logarithm estimate is proved here. -/
theorem checkpointTime_le_of_horizon_le_cubic
    (program : CTS.Program) (bits : List Bool)
    (sourceTime scale horizon : Nat)
    (horizonBound :
      horizon ≤ scale * (sourceTime + 1) ^ 3) :
    (finiteCTSWeakPathUniversality program).checkpointTime bits horizon ≤
      contractionCoefficient program *
        (scale * (sourceTime + 1) ^ 3 + 1) ^ 3 :=
  checkpointTime_le_of_horizon_le_polynomial
    program bits sourceTime scale 3 horizon horizonBound

/-- A cubic-times-logarithmic cyclic-tag horizon bound composes to the
literal cubed envelope below. `logFactor` is supplied by the external source
compiler; this theorem neither defines nor estimates a logarithm. -/
theorem checkpointTime_le_of_horizon_le_cubic_log
    (program : CTS.Program) (bits : List Bool)
    (sourceTime scale logFactor horizon : Nat)
    (horizonBound :
      horizon ≤ scale * (sourceTime + 1) ^ 3 * logFactor) :
    (finiteCTSWeakPathUniversality program).checkpointTime bits horizon ≤
      contractionCoefficient program *
        (scale * (sourceTime + 1) ^ 3 * logFactor + 1) ^ 3 := by
  have checkpointBound :=
    finiteCTSCheckpointTime_le_explicit_cubic program bits horizon
  have successorBound :
      horizon + 1 ≤
        scale * (sourceTime + 1) ^ 3 * logFactor + 1 :=
    Nat.add_le_add_right horizonBound 1
  have cubeBound :
      (horizon + 1) ^ 3 ≤
        (scale * (sourceTime + 1) ^ 3 * logFactor + 1) ^ 3 :=
    Nat.pow_le_pow_left successorBound 3
  simpa [contractionCoefficient] using
    Nat.le_trans checkpointBound
      (Nat.mul_le_mul_left (contractionCoefficient program) cubeBound)

/-- A degree-four cyclic-tag horizon envelope, sufficient to absorb an
`O(t^3 log t)` source simulation over natural-number costs, yields the
literal degree-twelve pure-S contraction envelope below. -/
theorem checkpointTime_le_of_horizon_le_quartic
    (program : CTS.Program) (bits : List Bool)
    (sourceTime scale horizon : Nat)
    (horizonBound :
      horizon ≤ scale * (sourceTime + 1) ^ 4) :
    (finiteCTSWeakPathUniversality program).checkpointTime bits horizon ≤
      contractionCoefficient program *
        (scale * (sourceTime + 1) ^ 4 + 1) ^ 3 :=
  checkpointTime_le_of_horizon_le_polynomial
    program bits sourceTime scale 4 horizon horizonBound

end WeakPathPolynomialCost

end PureSFormal
