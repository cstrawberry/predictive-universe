import PureSFormal.Research.RootResetActivePendingAgreement
import PureSFormal.Research.RootResetFuelEndpointPipeline

/-! Generated fuel endpoints survive the frontend's actual FRAME lookahead. -/
namespace PureSFormal.Research.RootResetActiveFuelEndpointAgreement
open PureSFormal.PureS
open FiniteController RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetActiveMarkedFrontend RootResetActiveCleanParentsAgreement RootResetActivePendingAgreement

def FrameFree (source : Term) : Prop :=
  ∃ layers body, source = RootResetFrameSpineWalker.wrap layers body ∧
    RootResetEdgeFragment.select RootResetNestedFramePatterns.pendingRows body = none ∧
    RootResetFrameCarrierGuard.frameHeadGuard body = false

theorem FrameFree.endpoint (source : Term)
    (stops : RootResetEdgeFragment.select RootResetNestedFramePatterns.pendingRows source = none)
    (guardMiss : RootResetFrameCarrierGuard.frameHeadGuard source = false) : FrameFree source :=
  ⟨[], source, rfl, stops, guardMiss⟩

theorem FrameFree.frame {source : Term} (free : FrameFree source) (field continuation : Term) :
    FrameFree (frame (.app .s field) continuation source) := by
  obtain ⟨layers, body, equal, stops, guardMiss⟩ := free
  exact ⟨(field, continuation) :: layers, body, by rw [equal]; rfl, stops, guardMiss⟩

theorem FrameFree.wrap {source : Term} (free : FrameFree source) (layers : List RootResetFrameSpineWalker.Layer) :
    FrameFree (RootResetFrameSpineWalker.wrap layers source) := by
  induction layers with
  | nil => exact free
  | cons layer layers ih => exact ih.frame layer.1 layer.2

theorem FrameFree.missed {source : Term} (free : FrameFree source) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨source, parents⟩ = false) :
    ∃ ticks, run RootResetNestedFrameProbe.machine ticks (RootResetNestedFrameProbe.initial ⟨source, parents⟩) =
      ⟨some (.done false), ⟨source, parents⟩⟩ := by
  obtain ⟨layers, body, equal, stops, guardMiss⟩ := free
  rw [equal] at boundary ⊢
  obtain ⟨ticks, bounded, execution⟩ := RootResetNestedFrameCost.missed_count layers body parents stops guardMiss boundary
  exact ⟨ticks, execution⟩

theorem exit_free (actions : Term) (bits : List Bool) (horizon remaining : Nat) :
    FrameFree (Dovetail.clockExit horizon remaining (environmentCode actions bits)) := by
  cases remaining with
  | zero => exact FrameFree.endpoint _ rfl rfl
  | succ remaining =>
      exact (FrameFree.endpoint (environmentCode actions bits) rfl rfl).frame (C horizon) (clockWrappers horizon remaining)

theorem call_free (fuel : Nat) (environment continuation : Term) : FrameFree (FuelRow.call fuel environment continuation).term := by
  cases fuel <;> exact FrameFree.endpoint _ rfl rfl

theorem positiveHalf_free (residual : Nat) (leftEnvironment rightEnvironment continuation : Term)
    (free : FrameFree continuation) : FrameFree (FuelRow.positiveHalf residual leftEnvironment rightEnvironment continuation).term :=
  free.frame leftEnvironment (.app (C residual) rightEnvironment)

theorem zero_free (position : ZeroPosition) (actions payload continuation : Term) (free : FrameFree continuation) :
    FrameFree (position.row actions payload continuation).term := by
  cases position with
  | call => exact call_free 0 _ _
  | first => exact FrameFree.endpoint _ rfl rfl
  | second =>
      exact free.frame (.app b (zeroEnvironment actions payload))
        (.app (zeroEnvironment actions payload) (.app b (zeroEnvironment actions payload)))
  | third => exact FrameFree.endpoint _ rfl rfl
  | fourth =>
      exact (free.frame (.app (.app .s (actCode actions)) (.app .s payload))
        (.app b (zeroEnvironment actions payload))).frame continuation (.app (zeroEnvironment actions payload) continuation)

theorem fuel_noLocal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (fuel : FuelRow) :
    CheckpointDecoder.parseLocal? program tree fuel.term = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · intro equal
    have bounded := fuel.term_headArity_le_four
    rw [equal] at bounded
    exact (by decide : ¬ (5 : Nat) ≤ 4) bounded
  · intro equal
    have bounded := fuel.term_headArity_le_four
    rw [equal] at bounded
    exact (by decide : ¬ (6 : Nat) ≤ 4) bounded

theorem canonical_not_pending (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (fuel : FuelRow) (canonical : CanonicalFuelRow (compileActions program tree) fuel)
    (payload continuation child : Term) :
    fuel.term ≠ .app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child := by
  intro equal
  have envMatches := RootResetPendingAdmissionPatterns.environment_matches (compileActions program tree) payload
  cases fuel with
  | call number environment outer =>
      have arity := congrArg Term.headArity equal
      cases number <;> change (4 : Nat) = 3 at arity <;> cases arity
  | zeroFirst | zeroThird =>
      have arity := congrArg Term.headArity equal
      change (4 : Nat) = 3 at arity
      cases arity
  | positiveHalf residual leftEnvironment rightEnvironment outer =>
      obtain ⟨⟨leftPayload, rfl⟩, rightOpen, admissible⟩ := canonical
      have envEq := (Term.app.inj (Term.app.inj equal).1).1
      rw [← envEq] at envMatches
      cases envMatches
  | zeroSecond leftArgument function rightArgument outer =>
      obtain ⟨⟨leftPayload, rfl⟩, functionOpen, rightOpen, admissible⟩ := canonical
      have envEq := (Term.app.inj (Term.app.inj equal).1).1
      rw [← envEq] at envMatches
      cases envMatches
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      obtain ⟨admissible, envOpen, rightAdmissible⟩ := canonical
      have envEq := (Term.app.inj (Term.app.inj equal).1).1
      have fieldEq := (Term.app.inj envEq).2
      have arity := congrArg Term.headArity fieldEq
      rcases admissible with three | four
      · rw [three] at arity; cases arity
      · rw [four] at arity; cases arity

theorem pending_misses_fuel (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (fuel : FuelRow) (canonical : CanonicalFuelRow (compileActions program tree) fuel) (parents : List ParentFrame) :
    ∃ ticks, run (RootResetPendingAdmissionFragment.machine program tree) ticks
      (RootResetPendingAdmissionFragment.initial program tree ⟨fuel.term, parents⟩) = ⟨some (.done false), ⟨fuel.term, parents⟩⟩ := by
  obtain ⟨ticks, entered, after, bounded, execution, outcome⟩ := RootResetPendingAdmissionFragment.bounded_input program tree ⟨fuel.term, parents⟩
  cases outcome with
  | stopped refused => exact ⟨ticks, execution⟩
  | entered payload continuation child shape admitted =>
      exact (canonical_not_pending program tree fuel canonical payload continuation child shape).elim

theorem pendingLayers_fuel_stops (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (fuel : FuelRow) (canonical : CanonicalFuelRow (compileActions program tree) fuel)
    (free : FrameFree fuel.term) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨wrap (compileActions program tree) layers fuel.term, parents⟩ = false) :
    ∃ ticks, run (machine program tree) ticks
      (initial program tree ⟨wrap (compileActions program tree) layers fuel.term, parents⟩) =
      ⟨some (.done false), ⟨fuel.term, parentsAfter (compileActions program tree) layers parents⟩⟩ := by
  obtain ⟨p, pr⟩ := pending_misses_fuel program tree fuel canonical (parentsAfter (compileActions program tree) layers parents)
  obtain ⟨l, lr⟩ := local_stops_of_noLocal program tree ⟨fuel.term, parentsAfter (compileActions program tree) layers parents⟩
    (fuel_noLocal program tree fuel)
  obtain ⟨s, sr⟩ := segment_stops program tree _ p l pr lr
  obtain ⟨a, ar⟩ := segment_layers_terminal program tree layers fuel.term parents
    (RootResetPendingAdmissionPatterns.childAdmitted_canonicalFuel program tree fuel canonical) s .stopped _ sr
  obtain ⟨f, fr⟩ := (free.wrap (frameLayers (compileActions program tree) layers)).missed parents boundary
  exact forwarded program tree _ _ f a (notMarked_of_noLocal (wrapped_noLocal _ (fuel_noLocal program tree fuel)))
    fr .stopped (by intro h; cases h) ar

theorem cleanParents_fuel_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (fuel : FuelRow) (canonical : CanonicalFuelRow (compileActions program layout.tree) fuel)
    (free : FrameFree fuel.term) :
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)).size ∧
      run (machine program layout.tree) ticks
        (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)))) =
      ⟨some (.done false), ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  obtain ⟨ticks, actual⟩ := pendingLayers_fuel_stops program layout.tree layers fuel canonical free parents (parents_boundary outer _)
  exact cleanParents_terminal outer _ ticks false _ actual

theorem generated_zero_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (position : ZeroPosition) (bits : List Bool) (horizon remaining : Nat) :
    let fuel := position.row (compileActions program layout.tree) (word bits)
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)).size ∧
      run (machine program layout.tree) ticks
        (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)))) =
      ⟨some (.done false), ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  exact cleanParents_fuel_stops outer layers _ (position.row_canonical _ _ _ (Dovetail.clockExit_admissible ..))
    (zero_free position _ _ _ (exit_free _ bits horizon remaining))

theorem generated_call_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (number : Nat) (bits : List Bool) (horizon remaining : Nat) :
    let fuel := FuelRow.call number (environmentCode (compileActions program layout.tree) bits)
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)).size ∧
      run (machine program layout.tree) ticks
        (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)))) =
      ⟨some (.done false), ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  exact cleanParents_fuel_stops outer layers _ ⟨⟨word bits, rfl⟩, Dovetail.clockExit_admissible ..⟩ (call_free number _ _)

theorem generated_positiveHalf_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (residual : Nat) (bits : List Bool) (horizon remaining : Nat) :
    let fuel := FuelRow.positiveHalf residual (environmentCode (compileActions program layout.tree) bits)
      (environmentCode (compileActions program layout.tree) bits)
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)).size ∧
      run (machine program layout.tree) ticks
        (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)))) =
      ⟨some (.done false), ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  exact cleanParents_fuel_stops outer layers _ ⟨⟨word bits, rfl⟩, ⟨word bits, rfl⟩, Dovetail.clockExit_admissible ..⟩
    (positiveHalf_free residual _ _ _ (exit_free _ bits horizon remaining))

end PureSFormal.Research.RootResetActiveFuelEndpointAgreement
