import PureSFormal.Research.RootResetMarkerTreeAutomaton
import PureSFormal.Computation.DeterministicTapeRootResetOutput

/-! A single fixed regular language detects source halting along the existing
padded, fresh-root pure-S computation endpoint. Only the source term varies. -/
namespace PureSFormal.Research.RootResetRegularMarkerLanguage
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

abbrev program := Cook.rogozhinCookProgram
abbrev dispatcher : ActionDispatcher program := BalancedActionTree.dispatcher program

def automaton := RootResetMarkerTreeAutomaton.automaton program dispatcher
def member? (source : Term) : Bool := automaton.accepts source

attribute [local irreducible] Cook.rogozhinCookProgram BalancedActionTree.dispatcher

theorem member_eq_observer (source : Term) :
    member? source = RootResetFiniteMarkerObserver.accepts? program dispatcher source :=
  RootResetMarkerTreeAutomaton.automaton_accepts_eq_observer program dispatcher source

theorem fixed_language_halting_iff (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source ↔
      ∃ sample, member? (DeterministicTapeRootResetOutput.termAt source sample) = true := by
  have path := RootResetMarkerTreeAutomaton.automaton_root_trajectory_iff program dispatcher
    (DeterministicTapePureSOutput.seed source)
  change (∃ sample, member? (DeterministicTapeRootResetOutput.termAt source sample) = true) ↔
    ∃ horizon, (CTS.iterate program horizon
      (CTS.initial program (DeterministicTapePureSOutput.seed source))).data = [] at path
  exact (DeterministicTapeStatePadding.halts_pad_iff source).symm.trans
    ((DeterministicTapeCook.halts_iff_exists_fixedCookEmpty (DeterministicTapeStatePadding.pad source)).trans path.symm)

end PureSFormal.Research.RootResetRegularMarkerLanguage
