import PureSFormal.PureS.Term
import PureSFormal.PureS.Reduction
import PureSFormal.CTS.Core

/-!
# Weak-path semantic interface

This module states what a weak-path realization must mean.  It deliberately
does not construct the scheduler, its cursor machine, the encoder, or the
checkpoint times.  An implementation must supply a contraction-only path
and prove that it is the projection of its operational scheduler.
-/

namespace PureSFormal.WeakPath

/--
An infinite sequence of pure-`S` terms in which every adjacent pair differs
by exactly one contextual contraction of `S X Y Z` to `X Z (Y Z)`.
-/
structure ReductionPath where
  term : Nat → PureS.Term
  contracts : ∀ n, PureS.Step (term n) (term (n + 1))

/-- A sequence of checkpoint indices is strictly increasing. -/
def StrictlyIncreasing (time : Nat → Nat) : Prop :=
  ∀ ⦃m n⦄, m < n → time m < time n

/-- `index` is one of the declared checkpoint contraction indices. -/
def IsCheckpoint (time : Nat → Nat) (index : Nat) : Prop :=
  ∃ horizon, time horizon = index

/-- The complete value reported at a recognized bare-term checkpoint. -/
abbrev DecodedCheckpoint (P : CTS.Program) := Nat × CTS.Config P

/--
A total observer of an unannotated pure-`S` term.  Failure is represented by
`none`; the observer receives neither a cursor nor scheduler control state.
-/
abbrev BareTermDecoder (P : CTS.Program) :=
  PureS.Term → Option (DecodedCheckpoint P)

/--
An abstract relation saying that a path is the term projection of a scheduler
run from an initial term.  The operational construction will instantiate this
relation; the semantic interface makes no scheduler representation choice.
-/
def SchedulerProjection (Scheduler : Type u) :=
  Scheduler → PureS.Term → ReductionPath → Prop

/--
The semantic weak-path contract for one CTS program and initial
configuration.

Besides requiring the exact value at every checkpoint, `acceptsOnly` makes
the checkpoint language exact: every successful decoder result identifies
its unique declared horizon and exact CTS configuration.  The derived
`rejectsOther` theorem then returns `none` after every other contraction
count.  Thus the contract cannot be witnessed by an always-failing decoder
or by an observer that accepts arbitrary intermediate reducts.
-/
structure Realizes
    (P : CTS.Program)
    {Scheduler : Type u}
    (projects : SchedulerProjection Scheduler)
    (scheduler : Scheduler)
    (initialTerm : PureS.Term)
    (initialConfig : CTS.Config P)
    (decoder : BareTermDecoder P)
    (path : ReductionPath)
    (checkpointTime : Nat → Nat) : Prop where
  startsAt : path.term 0 = initialTerm
  isProjection : projects scheduler initialTerm path
  checkpointZero : checkpointTime 0 = 0
  checkpointsIncrease : StrictlyIncreasing checkpointTime
  exactCheckpoint : ∀ horizon,
    decoder (path.term (checkpointTime horizon)) =
      some (horizon, CTS.iterate P horizon initialConfig)
  acceptsOnly : ∀ index horizon config,
    decoder (path.term index) = some (horizon, config) →
      index = checkpointTime horizon ∧
        config = CTS.iterate P horizon initialConfig

namespace Realizes

/-- A realization's decoder accepts its initial term with the exact horizon-zero value. -/
theorem decode_initial
    {P : CTS.Program}
    {Scheduler : Type u}
    {projects : SchedulerProjection Scheduler}
    {scheduler : Scheduler}
    {initialTerm : PureS.Term}
    {initialConfig : CTS.Config P}
    {decoder : BareTermDecoder P}
    {path : ReductionPath}
    {checkpointTime : Nat → Nat}
    (h : Realizes P projects scheduler initialTerm initialConfig decoder path
      checkpointTime) :
    decoder initialTerm = some (0, initialConfig) := by
  rw [← h.startsAt]
  calc
    decoder (path.term 0) = decoder (path.term (checkpointTime 0)) := by
      rw [h.checkpointZero]
    _ = some (0, CTS.iterate P 0 initialConfig) := h.exactCheckpoint 0
    _ = some (0, initialConfig) := rfl

/-- Every noncheckpoint contraction index is rejected by the total decoder. -/
theorem rejectsOther
    {P : CTS.Program}
    {Scheduler : Type u}
    {projects : SchedulerProjection Scheduler}
    {scheduler : Scheduler}
    {initialTerm : PureS.Term}
    {initialConfig : CTS.Config P}
    {decoder : BareTermDecoder P}
    {path : ReductionPath}
    {checkpointTime : Nat → Nat}
    (h : Realizes P projects scheduler initialTerm initialConfig decoder path
      checkpointTime)
    (index : Nat)
    (hindex : ¬IsCheckpoint checkpointTime index) :
    decoder (path.term index) = none := by
  cases hdecoded : decoder (path.term index) with
  | none => rfl
  | some decoded =>
      rcases decoded with ⟨horizon, config⟩
      have haccepted := h.acceptsOnly index horizon config hdecoded
      exact False.elim (hindex ⟨horizon, haccepted.1.symm⟩)

/--
Exact recognition: a decoder result occurs precisely at the checkpoint for
its reported horizon, and its configuration is the corresponding CTS iterate.
-/
theorem decode_eq_some_iff
    {P : CTS.Program}
    {Scheduler : Type u}
    {projects : SchedulerProjection Scheduler}
    {scheduler : Scheduler}
    {initialTerm : PureS.Term}
    {initialConfig : CTS.Config P}
    {decoder : BareTermDecoder P}
    {path : ReductionPath}
    {checkpointTime : Nat → Nat}
    (h : Realizes P projects scheduler initialTerm initialConfig decoder path
      checkpointTime)
    (index horizon : Nat) (config : CTS.Config P) :
    decoder (path.term index) = some (horizon, config) ↔
      index = checkpointTime horizon ∧
        config = CTS.iterate P horizon initialConfig := by
  constructor
  · intro hdecoded
    exact h.acceptsOnly index horizon config hdecoded
  · rintro ⟨rfl, rfl⟩
    exact h.exactCheckpoint horizon

end Realizes

/--
One fixed scheduler and one fixed bare-term decoder realize all binary inputs
of a finite CTS.  Only the encoder, projected path, and checkpoint indices
vary with the input word.
-/
structure UniformRealizes
    (P : CTS.Program)
    {Scheduler : Type u}
    (projects : SchedulerProjection Scheduler)
    (scheduler : Scheduler)
    (decoder : BareTermDecoder P) where
  encode : List Bool → PureS.Term
  path : List Bool → ReductionPath
  checkpointTime : List Bool → Nat → Nat
  realizes : ∀ word,
    Realizes P projects scheduler (encode word) (CTS.initial P word) decoder
      (path word) (checkpointTime word)

end PureSFormal.WeakPath
