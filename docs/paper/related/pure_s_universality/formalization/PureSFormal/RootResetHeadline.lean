import PureSFormal.RootResetChallenge
import PureSFormal.Computation.SourceChronologyRootReset
import PureSFormal.Research.RootResetRegularMarkerLanguage

namespace PureSFormal.RootResetHeadline

set_option maxRecDepth 10000
set_option maxHeartbeats 1000000

open PureSFormal.PureS PureSFormal.Computation PureSFormal.Research
open ProtectedTrieDeterministicCompiler
open RootResetChallenge

attribute [local irreducible] Cook.rogozhinCookProgram BalancedActionTree.dispatcher

/-- Theorem 1R, with the fixed source trajectory shared by the computation
contract, regular halting language and ordered finite source observations. -/
structure HeadlineUniversality : Prop extends RootResetComputationUniversality where
  allProgramTrajectories : ∀ program : CTS.Program,
    Nonempty (WeakPath.UniformRealizes program
      (RootResetTermOnlyTransfer.Projects (RootResetFiniteAllInputsTraceAgreement.selector program))
      (RootResetFiniteAllInputsTraceAgreement.selector program)
      (PublicDecoder.decode program (WeakPathUniversality.canonicalDispatcher program).tree))
  allProgramControllerProjection : ∀ (program : CTS.Program) term,
    RootResetFiniteAllInputsTraceAgreement.selector program term =
      RootResetContractProjection.projectedStep?
        (RootResetFinitePrioritySelector.selectorContract program
          (WeakPathUniversality.canonicalDispatcher program)) term
  fixedRegularHalting : ∀ source : Source,
    DeterministicTape.Halts source ↔ ∃ sample,
      RootResetRegularMarkerLanguage.automaton.accepts (sourceTerm source sample) = true
  regularObserverAgreement : ∀ term : Term,
    RootResetRegularMarkerLanguage.automaton.accepts term =
      RootResetFiniteMarkerObserver.accepts? UniversalProgram UniversalDispatcher term
  finiteSourceChronology : ∀ (source : Source) (horizon : Nat) (endpoint : DeterministicTape.Row),
    DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint →
      ∃ clock : Nat → Nat, clock 0 = 0 ∧
        (∀ first second, first < second → second ≤ horizon → clock first < clock second) ∧
        (∀ fuel, fuel ≤ horizon →
          DeterministicTapePureSOutput.decodeRow? (sourceTerm source (clock fuel)) =
            DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel)

private theorem readonlyProjection {α : Type} (spec : RootResetReadonlySelector.ProbeSpec α) (term : Term) :
    RootResetReadonlySelector.selectStep? spec term =
      RootResetContractProjection.projectedStep? (RootResetReadonlySelector.selectorContract spec) term := rfl

private theorem finiteProjection (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    RootResetFinitePrioritySelector.selectStep? program layout term =
      RootResetContractProjection.projectedStep? (RootResetFinitePrioritySelector.selectorContract program layout) term :=
  readonlyProjection (RootResetFinitePrioritySelector.selectionSpec program layout) term

theorem sCombinatorIsRootResetUniversal : HeadlineUniversality := by
  refine {
    toRootResetComputationUniversality := sCombinatorIsRootResetComputationUniversal
    allProgramTrajectories := ?_
    allProgramControllerProjection := ?_
    fixedRegularHalting := ?_
    regularObserverAgreement := ?_
    finiteSourceChronology := ?_ }
  · exact fun program => ⟨RootResetFiniteAllInputsTraceAgreement.finiteCTSUniversality program⟩
  · exact fun program => finiteProjection program (WeakPathUniversality.canonicalDispatcher program)
  · exact RootResetRegularMarkerLanguage.fixed_language_halting_iff
  · exact RootResetRegularMarkerLanguage.member_eq_observer
  · exact SourceChronologyRootReset.exists_sourceClock

end PureSFormal.RootResetHeadline
