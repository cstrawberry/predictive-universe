import PureSFormal.Research.RootResetActiveFuelEndpointAgreement
import PureSFormal.Research.RootResetFreshAncestorExitAgreement

/-! The actual frontend reaches generated CLOCK endpoints under completed history. -/
namespace PureSFormal.Research.RootResetActiveClockEndpointAgreement
open PureSFormal.PureS
open FiniteController SchedulerInvariant
open RootResetActiveMarkedFrontend RootResetActiveCleanParentsAgreement RootResetActivePendingAgreement
open RootResetActiveFuelEndpointAgreement

theorem growth_free (actions : Term) (bits : List Bool) (stage wrappers residual : Nat) :
    FrameFree (.app (clockGrowthCore stage wrappers residual) (environmentCode actions bits)) := by
  cases wrappers with
  | zero => cases residual <;> exact FrameFree.endpoint _ rfl rfl
  | succ wrappers =>
      exact (FrameFree.endpoint (environmentCode actions bits) rfl rfl).frame (C stage) (clockGrowthCore stage wrappers residual)

theorem growth_noLocal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (stage wrappers residual : Nat) (environment : Term) :
    CheckpointDecoder.parseLocal? program tree (.app (clockGrowthCore stage wrappers residual) environment) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · cases wrappers with
    | zero => cases residual <;> change (4 : Nat) ≠ 5 <;> decide
    | succ wrappers => change (3 : Nat) ≠ 5; decide
  · exact RootResetEndpointGeneratedMisses.growth_not_six stage wrappers residual environment

theorem pending_misses_growth (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame) :
    ∃ ticks, run (RootResetPendingAdmissionFragment.machine program tree) ticks
      (RootResetPendingAdmissionFragment.initial program tree ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩) =
      ⟨some (.done false), ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩⟩ := by
  obtain ⟨ticks, entered, after, bounded, execution, outcome⟩ := RootResetPendingAdmissionFragment.bounded_input program tree
    ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩
  cases outcome with
  | stopped refused => exact ⟨ticks, execution⟩
  | entered payload continuation child shape admitted =>
      cases wrappers with
      | zero =>
          have arity := congrArg Term.headArity shape
          cases residual <;> change (4 : Nat) = 3 at arity <;> cases arity
      | succ wrappers =>
          have envEq := (Term.app.inj (Term.app.inj shape).1).1
          have rejected : (RootResetPendingAdmissionPatterns.environmentPattern (compileActions program tree)).matchesBool
              (.app .s (C stage)) = false := by cases stage <;> rfl
          rw [envEq, RootResetPendingAdmissionPatterns.environment_matches] at rejected
          cases rejected

theorem growth_stops (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (stage wrappers residual : Nat) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent?
      ⟨.app (clockGrowthCore stage wrappers residual) (environmentCode (compileActions program tree) bits), parents⟩ = false) :
    ∃ ticks, run (machine program tree) ticks
      (initial program tree ⟨.app (clockGrowthCore stage wrappers residual) (environmentCode (compileActions program tree) bits), parents⟩) =
      ⟨some (.done false), ⟨.app (clockGrowthCore stage wrappers residual) (environmentCode (compileActions program tree) bits), parents⟩⟩ := by
  let source := Term.app (clockGrowthCore stage wrappers residual) (environmentCode (compileActions program tree) bits)
  have noLocal := growth_noLocal program tree stage wrappers residual (environmentCode (compileActions program tree) bits)
  obtain ⟨p, pr⟩ := pending_misses_growth program tree stage wrappers residual (environmentCode (compileActions program tree) bits) parents
  obtain ⟨l, lr⟩ := local_stops_of_noLocal program tree ⟨source, parents⟩ noLocal
  obtain ⟨s, sr⟩ := segment_stops program tree _ p l pr lr
  obtain ⟨f, fr⟩ := (growth_free (compileActions program tree) bits stage wrappers residual).missed parents boundary
  exact forwarded program tree _ _ f s (notMarked_of_noLocal noLocal) fr .stopped (by intro h; cases h) sr

theorem cleanParents_growth_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (bits : List Bool) (stage wrappers residual : Nat) :
    let source := Term.app (clockGrowthCore stage wrappers residual) (environmentCode (compileActions program layout.tree) bits)
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents source).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents source))) =
      ⟨some (.done false), ⟨source, parents⟩⟩ := by
  obtain ⟨ticks, execution⟩ := growth_stops program layout.tree bits stage wrappers residual parents (parents_boundary outer _)
  exact cleanParents_terminal outer _ ticks false _ execution

theorem cleanParents_launch_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (bits : List Bool) (stage wrappers : Nat) :
    let source := Term.app (clockWrappers stage (wrappers + 1)) (environmentCode (compileActions program layout.tree) bits)
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents source).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents source))) =
      ⟨some (.done false), ⟨source, parents⟩⟩ := by
  obtain ⟨ticks, execution⟩ := RootResetFreshAncestorExitAgreement.exit_stops program layout stage (wrappers + 1) bits parents (parents_boundary outer _)
  exact cleanParents_terminal outer _ ticks false _ execution

end PureSFormal.Research.RootResetActiveClockEndpointAgreement
