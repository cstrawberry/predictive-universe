import PureSFormal.Computation.SourceChronologyOrdinaryTag

/-!
# Coherent finite chronology through deletion-two normalization

The local normalization progress theorem supplies existential positive
durations. We retain those durations in one finite-trace specification.
The existence proof uses induction in `Prop`, without a choice axiom. It does
not define a global executable clock by extracting those witnesses.
-/

namespace PureSFormal.Computation.SourceChronologyNormalizedTag

open RogozhinTagInput DeletionTwoT2Normalizer RogozhinT2Simulation
open DeterministicTapeCookTrajectoryReadback
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open ThreeCounterTag ThreeCounterTag.Numeric
open SourceChronologyOrdinaryTag

/-- An operationally coherent normalized trace. Values beyond `horizon`
have no specified meaning. Every successor stores a positive actual duration. -/
structure Prefix (program : Program) (word : List Label) (horizon : Nat) where
  time : Nat → Nat
  state : Nat → QueueState
  time_zero : time 0 = 0
  target_eq : ∀ k, k ≤ horizon → (state k).targetWord program =
    RogozhinTagInput.iterate (normalizeProgram program) (time k) (normalizeWord program word)
  source_eq : ∀ k, k ≤ horizon → (state k).sourceView = RogozhinTagInput.iterate program k word
  valid : ∀ k, k ≤ horizon → DeletionTwoT2Readback.TokensValid program (state k).tokens
  advances : ∀ k, k < horizon → ∃ duration,
    0 < duration ∧ time (k + 1) = time k + duration ∧
    (state k).iterate program duration = state (k + 1)

theorem Prefix.strict {program : Program} {word : List Label} {horizon : Nat}
    (trace : Prefix program word horizon) (first second : Nat)
    (ordered : first < second) (bounded : second ≤ horizon) :
    trace.time first < trace.time second := by
  induction second with
  | zero => exact False.elim (Nat.not_lt_zero first ordered)
  | succ second ih =>
      obtain ⟨duration, positive, nextTime, _⟩ := trace.advances second (Nat.lt_of_lt_of_le (Nat.lt_succ_self second) bounded)
      have nextLt : trace.time second < trace.time (second + 1) := by
        rw [nextTime]
        exact Nat.lt_add_of_pos_right positive
      cases Nat.eq_or_lt_of_le (Nat.le_of_lt_succ ordered) with
      | inl same => simpa only [same] using nextLt
      | inr before => exact Nat.lt_trans (ih before (Nat.le_trans (Nat.le_succ second) bounded)) nextLt

/-- Pointwise extension; this is ordinary executable data manipulation. -/
def appendValue {α : Type} (horizon : Nat) (old : Nat → α) (next : α) (k : Nat) : α :=
  if k ≤ horizon then old k else next

/-- A single finite trace retains all local positive progress witnesses. -/
theorem exists_prefix (program : Program) (word : List Label)
    (productions : DeletionTwoT2Readback.ProductionsValid program)
    (trajectory : ∀ k, Boundary program (RogozhinTagInput.iterate program k word))
    (horizon : Nat) (before : NonhaltingBefore program word horizon) :
    Nonempty (Prefix program word horizon) := by
  induction horizon with
  | zero =>
      let initial : QueueState := ⟨.aligned, dataTokens word ++ [Token.pad]⟩
      refine ⟨⟨fun _ => 0, fun _ => initial, rfl, ?_, ?_, ?_, ?_⟩⟩
      · intro k bounded
        have same : k = 0 := Nat.eq_zero_of_le_zero bounded
        subst k
        exact targetOf_initialTokens program word
      · intro k bounded
        have same : k = 0 := Nat.eq_zero_of_le_zero bounded
        subst k
        exact sourceOf_initialTokens word
      · intro k _
        exact DeletionTwoT2Readback.tokensValid_initial program word (trajectory 0).labels
      · intro k impossible
        exact False.elim (Nat.not_lt_zero k impossible)
  | succ horizon ih =>
      obtain ⟨trace⟩ := ih (nonhaltingBefore_mono before (Nat.le_succ horizon))
      have sourceEq := trace.source_eq horizon (Nat.le_refl horizon)
      have targetEq := trace.target_eq horizon (Nat.le_refl horizon)
      have boundary : Boundary program (trace.state horizon).sourceView := sourceEq ▸ trajectory horizon
      have live : ¬ Halted program (trace.state horizon).sourceView := by
        rw [sourceEq]
        exact before horizon (Nat.lt_succ_self horizon)
      obtain ⟨duration, next, positive, advanced, nextSource⟩ :=
        (trace.state horizon).advances_finitely program boundary live
      let represented : Represents program word
          (RogozhinTagInput.iterate (normalizeProgram program) (trace.time horizon)
            (normalizeWord program word)) := ⟨horizon, trace.state horizon, sourceEq, targetEq⟩
      let followed := represented.steps trajectory duration
      have followedState : followed.state = next := by
        rw [Represents.steps_state]
        exact advanced
      have nextTarget : next.targetWord program = RogozhinTagInput.iterate (normalizeProgram program)
          (trace.time horizon + duration) (normalizeWord program word) := by
        have followedTarget := followed.target_eq
        rw [followedState, frontIterate_eq_iterate] at followedTarget
        exact followedTarget.trans (tagIterate_add _ _ _ _).symm
      have nextSourceEq : next.sourceView = RogozhinTagInput.iterate program (horizon + 1) word := by
        rw [nextSource, sourceEq]
        rfl
      have nextValid : DeletionTwoT2Readback.TokensValid program next.tokens := by
        rw [← advanced]
        exact tokensValid_iterate program productions duration _ (trace.valid horizon (Nat.le_refl horizon))
      refine ⟨⟨appendValue horizon trace.time (trace.time horizon + duration),
        appendValue horizon trace.state next, ?_, ?_, ?_, ?_, ?_⟩⟩
      · simp only [appendValue, Nat.zero_le, if_true, trace.time_zero]
      · intro k bounded
        by_cases old : k ≤ horizon
        · simpa only [appendValue, old, if_true] using trace.target_eq k old
        · simpa only [appendValue, old, if_false] using nextTarget
      · intro k bounded
        by_cases old : k ≤ horizon
        · simpa only [appendValue, old, if_true] using trace.source_eq k old
        · have same : k = horizon + 1 := Nat.le_antisymm bounded (Nat.lt_of_not_ge old)
          subst k
          simpa only [appendValue, Nat.not_succ_le_self, if_false] using nextSourceEq
      · intro k bounded
        by_cases old : k ≤ horizon
        · simpa only [appendValue, old, if_true] using trace.valid k old
        · simpa only [appendValue, old, if_false] using nextValid
      · intro k bounded
        have old : k ≤ horizon := Nat.le_of_lt_succ bounded
        cases Nat.eq_or_lt_of_le old with
        | inl same =>
            subst k
            refine ⟨duration, positive, ?_, ?_⟩
            · simp only [appendValue, Nat.le_refl, if_true, Nat.not_succ_le_self, if_false]
            · simpa only [appendValue, Nat.le_refl, if_true, Nat.not_succ_le_self, if_false] using advanced
        | inr earlier =>
            obtain ⟨elapsed, pos, timeEq, stateEq⟩ := trace.advances k earlier
            have nextOld : k + 1 ≤ horizon := earlier
            exact ⟨elapsed, pos,
              by simpa only [appendValue, old, nextOld, if_true] using timeEq,
              by simpa only [appendValue, old, nextOld, if_true] using stateEq⟩

theorem Prefix.decodes {program : Program} {word : List Label} {horizon : Nat}
    (trace : Prefix program word horizon) (k : Nat) (bounded : k ≤ horizon) :
    DeletionTwoT2Readback.decodeWord? program
      (RogozhinTagInput.iterate (normalizeProgram program) (trace.time k) (normalizeWord program word)) =
      some (RogozhinTagInput.iterate program k word) := by
  rw [← trace.target_eq k bounded,
    DeletionTwoT2Readback.decodeWord?_targetWord program _ (trace.valid k bounded),
    trace.source_eq k bounded]

theorem Prefix.nonhaltingBefore {program : Program} {word : List Label} {horizon : Nat}
    (trace : Prefix program word horizon)
    (trajectory : ∀ k, Boundary program (RogozhinTagInput.iterate program k word))
    (wellFormed : WellFormed (normalizeProgram program) (normalizeWord program word))
    (k : Nat) (bounded : k ≤ horizon)
    (live : ¬ Halted program (RogozhinTagInput.iterate program k word)) :
    NonhaltingBefore (normalizeProgram program) (normalizeWord program word) (trace.time k) := by
  let represented : Represents program word
      (RogozhinTagInput.iterate (normalizeProgram program) (trace.time k) (normalizeWord program word)) :=
    ⟨k, trace.state k, trace.source_eq k bounded, trace.target_eq k bounded⟩
  apply nonhaltingBefore_of_endpoint
  intro halted
  have head := (wellFormed.iterate (trace.time k)).halted_iff_head.mp halted
  rw [normalize_haltLabel] at head
  exact live (represented_halt_reflects program word trajectory represented head)

/-- Primitive program used by the padded source compilation. -/
def sourceProgram (source : DeterministicTape.Instance) : ThreeCounter.Program :=
  DeterministicTapeThreeCounterCompiler.Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine

def sourceInitial (source : DeterministicTape.Instance) : ThreeCounter.State :=
  DeterministicTapeThreeCounterCompiler.Execution.compileInitial (DeterministicTapeStatePadding.pad source)

def sourceWord (source : DeterministicTape.Instance) : List Label :=
  Numeric.encodeWord (sourceProgram source) (encodeState (sourceProgram source) (sourceInitial source))

abbrev SourcePrefix (source : DeterministicTape.Instance) (horizon : Nat) :=
  Prefix (ordinaryProgram (sourceProgram source)) (sourceWord source) (sourceOrdinaryTime source horizon)

/-- This clock is executable from the supplied finite trace. Existence of
that trace is proved propositionally below, without choosing a global trace. -/
def SourcePrefix.sourceTime {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (fuel : Nat) : Nat :=
  trace.time (sourceOrdinaryTime source fuel)

theorem SourcePrefix.sourceTime_zero {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) : trace.sourceTime 0 = 0 :=
  trace.time_zero

theorem sourceOrdinaryTime_live (source : DeterministicTape.Instance)
    (fuel : Nat) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    ¬ Halted (ordinaryProgram (sourceProgram source))
      (RogozhinTagInput.iterate (ordinaryProgram (sourceProgram source)) (sourceOrdinaryTime source fuel)
        (sourceWord source)) := by
  have runningLive := DeterministicTapePrimitiveChronology.padded_sourceTime_running_live source fuel row sourceRun
  unfold sourceOrdinaryTime sourceWord sourceProgram sourceInitial
  rw [ordinaryTime_exact]
  exact ordinary_encodeState_notHalted _ _ runningLive.1 runningLive.2

theorem sourceOrdinaryTime_le (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some row)
    (fuel : Nat) (bounded : fuel ≤ horizon) :
    sourceOrdinaryTime source fuel ≤ sourceOrdinaryTime source horizon := by
  cases Nat.eq_or_lt_of_le bounded with
  | inl same => subst fuel; exact Nat.le_refl _
  | inr before => exact Nat.le_of_lt (sourceOrdinaryTime_strict source horizon row sourceRun fuel horizon before (Nat.le_refl _))

/-- The same one trace serves every index of a defined source prefix. -/
theorem exists_sourcePrefix (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some row) :
    Nonempty (SourcePrefix source horizon) := by
  exact exists_prefix _ _ (ordinaryProgram_productionLabelsValid (sourceProgram source))
    (fun k => ordinaryTrajectory_boundary (sourceProgram source) k (sourceInitial source))
    (sourceOrdinaryTime source horizon)
    (nonhaltingBefore_of_endpoint _ _ _ (sourceOrdinaryTime_live source horizon row sourceRun))

theorem SourcePrefix.sourceTime_strict {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some row)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    trace.sourceTime first < trace.sourceTime second := by
  exact trace.strict _ _ (sourceOrdinaryTime_strict source horizon row sourceRun first second ordered bounded)
    (sourceOrdinaryTime_le source horizon row sourceRun second bounded)

/-- Literal readback uses the current normalized word and the fixed compiled
program. No source-run index is passed to this decoder. -/
theorem SourcePrefix.sourceTime_decodes {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    (DeletionTwoT2Readback.decodeWord? (ordinaryProgram (sourceProgram source))
      (RogozhinTagInput.iterate (normalizeProgram (ordinaryProgram (sourceProgram source)))
        (trace.sourceTime fuel) (normalizeWord (ordinaryProgram (sourceProgram source)) (sourceWord source)))).bind
      (fun ordinary => (ThreeCounterCookReadback.decodeCounterWord? (sourceProgram source) ordinary).bind
        DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?) = some row := by
  rw [SourcePrefix.sourceTime, trace.decodes _ (sourceOrdinaryTime_le source horizon endpoint endpointRun fuel bounded)]
  exact sourceOrdinaryTime_decodes source fuel row sourceRun

theorem SourcePrefix.sourceTime_nonhaltingBefore {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    NonhaltingBefore (normalizeProgram (ordinaryProgram (sourceProgram source)))
      (normalizeWord (ordinaryProgram (sourceProgram source)) (sourceWord source)) (trace.sourceTime fuel) := by
  exact trace.nonhaltingBefore
    (fun k => ordinaryTrajectory_boundary (sourceProgram source) k (sourceInitial source))
    (compileT2_wellFormed (sourceProgram source) (sourceInitial source)) _
    (sourceOrdinaryTime_le source horizon endpoint endpointRun fuel bounded)
    (sourceOrdinaryTime_live source fuel row sourceRun)

end PureSFormal.Computation.SourceChronologyNormalizedTag
