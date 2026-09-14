import PureSFormal.Research.RootResetNonemptyAppenderSelector

/-!
# Complete appender contraction chains

The literal action-entry recursion supplies every first and second Push row.
Its suffix and retained-history equations discharge the row parser grammar,
and each contraction is selected in the actual completed dispatcher route.
-/

namespace PureSFormal.Research.RootResetAppenderSelectorChain

open PureSFormal.PureS
open SchedulerResponseInvariant
open RootResetPersistentResponseSelector
open RootResetNonemptyAppenderSelector

/-- Exact selected action-field terms in their fixed full response shell. -/
inductive ActionSelections
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term) :
    Term → List Term → Prop where
  | done (source : Term) : ActionSelections program dispatcher label bits continuation carrier source []
  | next {source target : Term} {rest : List Term}
      (selected : selectStep? program dispatcher (routeShell program dispatcher label bits continuation carrier source) =
        some (routeShell program dispatcher label bits continuation carrier target))
      (tail : ActionSelections program dispatcher label bits continuation carrier target rest) :
      ActionSelections program dispatcher label bits continuation carrier source (target :: rest)

/-- After the first row of a Push layer, every remaining action entry is
selected.  The embedding records its actual place in the emitted word. -/
theorem actionTail_selections
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2) :
    ∀ (rest : List Bool) (bit : Bool) (initial : Term) (outer : List Term)
      (count : (PrimitiveLocalResponse.emitted program label).length = (bit :: rest).length + outer.length),
      (PrimitiveLocalResponse.emitted program label).drop outer.length = bit :: rest →
      (∀ {done term}, ActionMutation (PrimitiveLocalResponse.emitted program label).length
        (bit :: rest) initial outer done term →
        ActionMutation (PrimitiveLocalResponse.emitted program label).length
          (PrimitiveLocalResponse.emitted program label) carrier [] done term) →
      ActionSelections program dispatcher label bits continuation carrier
        (Term.applyArgs (pushFirst bit rest initial) outer)
        ((actionEntries (PrimitiveLocalResponse.emitted program label).length
          (bit :: rest) initial outer count).tail.map Prod.snd)
  | rest, bit, initial, outer, count, suffix, embed => by
      let firstRow : RootResetWholeAppenderStages.Row :=
        .first outer.length bit rest initial initial outer
      have firstValid : firstRow.Valid (PrimitiveLocalResponse.emitted program label) := ⟨suffix, rfl⟩
      have firstProgress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
          (PrimitiveLocalResponse.emitted program label) carrier [] false firstRow.term :=
        embed (.first bit rest initial outer count)
      have firstChoice := nonfinalRow_selectStep? program dispatcher label bits continuation carrier firstRow
        (Term.applyArgs (pushSecond bit rest initial) outer) firstValid firstProgress rfl
        carrierNot2 phaseEq bitEq
      cases rest with
      | nil =>
          exact .next firstChoice (.done _)
      | cons next tail =>
          let accumulator := extendAccumulator bit initial
          let currentHistory := pushHistory bit initial
          let secondRow : RootResetWholeAppenderStages.Row :=
            .secondNonfinal outer.length bit next tail accumulator currentHistory outer
          have secondValid : secondRow.Valid (PrimitiveLocalResponse.emitted program label) := ⟨suffix, rfl⟩
          have secondProgress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
              (PrimitiveLocalResponse.emitted program label) carrier [] false secondRow.term :=
            embed (.second bit (next :: tail) initial outer count)
          have secondChoice := nonfinalRow_selectStep? program dispatcher label bits continuation carrier secondRow
            (Term.applyArgs (pushFirst next tail accumulator) (currentHistory :: outer))
            secondValid secondProgress rfl carrierNot2 phaseEq bitEq
          have nextCount : (PrimitiveLocalResponse.emitted program label).length =
              (next :: tail).length + (currentHistory :: outer).length := by
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using count
          have nextSuffix : (PrimitiveLocalResponse.emitted program label).drop (currentHistory :: outer).length =
              next :: tail := by
            rw [List.length_cons, ← List.drop_drop]
            simp only [suffix, List.drop_succ_cons, List.drop_zero]
          have nextEmbed : ∀ {done term},
              ActionMutation (PrimitiveLocalResponse.emitted program label).length
                (next :: tail) accumulator (currentHistory :: outer) done term →
              ActionMutation (PrimitiveLocalResponse.emitted program label).length
                (PrimitiveLocalResponse.emitted program label) carrier [] done term := by
            intro done term progress
            exact embed (.inner progress)
          have remaining := actionTail_selections program dispatcher label bits continuation carrier
            carrierNot2 phaseEq bitEq tail next accumulator (currentHistory :: outer) nextCount nextSuffix nextEmbed
          exact .next firstChoice (.next secondChoice remaining)

/-- The entire emitted appendant has exact selection from the selected
action call to the final second Push row, including the empty appendant. -/
theorem actionEntries_selections
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2) :
    ActionSelections program dispatcher label bits continuation carrier
      (.app (selectedAction program label) carrier)
      ((actionEntries (PrimitiveLocalResponse.emitted program label).length
        (PrimitiveLocalResponse.emitted program label) carrier [] (by simp)).map Prod.snd) := by
  cases emitted : PrimitiveLocalResponse.emitted program label with
  | nil =>
      simp only [emitted, actionEntries_nil, actionEntries_cons, List.map]
      exact .done _
  | cons first rest =>
      have count : (PrimitiveLocalResponse.emitted program label).length = (first :: rest).length + ([] : List Term).length := by
        rw [emitted]
        rfl
      have suffix : (PrimitiveLocalResponse.emitted program label).drop ([] : List Term).length = first :: rest := by
        exact emitted
      have embed : ∀ {done term},
          ActionMutation (PrimitiveLocalResponse.emitted program label).length (first :: rest) carrier [] done term →
          ActionMutation (PrimitiveLocalResponse.emitted program label).length
            (PrimitiveLocalResponse.emitted program label) carrier [] done term := by
        intro done term progress
        simpa only [emitted] using progress
      have tail := actionTail_selections program dispatcher label bits continuation carrier
        carrierNot2 phaseEq bitEq rest first carrier [] count suffix embed
      have firstChoice := selectedAction_selects_firstPush program dispatcher label bits continuation carrier
        first rest emitted carrierNot2 phaseEq bitEq
      have selected := ActionSelections.next firstChoice tail
      simpa only [emitted, actionEntries_nil, actionEntries_cons, List.map, Term.applyArgs] using! selected

/-- Pairing action entries with the actual sampled scheduler configurations
transfers the complete appender certificate without omitting a contraction. -/
theorem ActionSelections.selectsSamples
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {bits : List Bool} {continuation carrier source : Term}
    {entries : List Term}
    (chain : ActionSelections program dispatcher label bits continuation carrier source entries)
    {Control : Type} {before : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    (beforeEq : before.cursor.erase = routeShell program dispatcher label bits continuation carrier source)
    (samplesEq : samples.map (fun sample => sample.cursor.erase) =
      entries.map (routeShell program dispatcher label bits continuation carrier)) :
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before samples := by
  induction chain generalizing before samples with
  | done source =>
      cases samples with
      | nil => exact .done before
      | cons sample rest => cases samplesEq
  | @next source target rest selected tail ih =>
      cases samples with
      | nil => cases samplesEq
      | cons sample samples =>
          have equalities := List.cons.inj samplesEq
          dsimp only at equalities
          refine .next ?_ (ih equalities.1 equalities.2)
          rw [beforeEq, equalities.1]
          exact selected

end PureSFormal.Research.RootResetAppenderSelectorChain
