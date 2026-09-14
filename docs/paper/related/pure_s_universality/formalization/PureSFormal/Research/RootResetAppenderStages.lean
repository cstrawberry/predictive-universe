import PureSFormal.PureS.SchedulerResponseInvariant

/-!
# Term-only Push/appender stage parsers

For a fixed CTS program and action label, the selected appendant is a fixed
finite word.  This module recognizes the two rows produced by each `Push`
layer directly from the bare action-field term.

The zero-based appendant position is recovered from the number of already
retained outer history arguments.  The parser then checks the corresponding
suffix of the fixed emitted word.  It compares only the fixed appender and
live-constructor codes.  The accumulator occurrences, the current history,
and every retained history are returned as independent opaque holes; in
particular, no two such holes are compared.

The results here are local to an action-field focus.  They do not locate that
focus in a whole carrier, classify response boundaries, or supply a complete
root-reset walker.
-/

namespace PureSFormal.Research.RootResetAppenderStages

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerResponseInvariant

/-- A first Push row with its two runtime occurrences kept independent. -/
def firstRow (bit : Bool) (rest : List Bool)
    (accumulator duplicate : Term) : Term :=
  .app (.app (.app .s (appender rest)) accumulator)
    (.app (live bit) duplicate)

/-- A second Push row with its accumulator and current history kept opaque. -/
def secondRow (rest : List Bool) (accumulator currentHistory : Term) : Term :=
  .app (.app (appender rest) accumulator) currentHistory

/-- Data reconstructed from a successful first-row parse. -/
structure FirstView where
  position : Nat
  bit : Bool
  rest : List Bool
  accumulator : Term
  duplicate : Term
  histories : List Term
  deriving BEq, DecidableEq, Repr

/-- Data reconstructed from a successful second-row parse. -/
structure SecondView where
  position : Nat
  bit : Bool
  rest : List Bool
  accumulator : Term
  currentHistory : Term
  histories : List Term
  deriving BEq, DecidableEq, Repr

/-- Parse a first row relative to one fixed emitted word. -/
def parseFirstWord? (emitted : List Bool) (term : Term) : Option FirstView :=
  match term.spineArgs with
  | foundAppender :: accumulator :: (.app foundLive duplicate) :: histories =>
      let position := histories.length
      match emitted.drop position with
      | bit :: rest =>
          if foundAppender = appender rest then
            if foundLive = live bit then
              some ⟨position, bit, rest, accumulator, duplicate, histories⟩
            else
              none
          else
            none
      | [] => none
  | _ => none

/-- Parse the last second row, whose unconsumed suffix is a singleton. -/
def parseSecondFinalWord? (emitted : List Bool)
    (term : Term) : Option SecondView :=
  match term.spineArgs with
  | foundFixed :: accumulator :: currentHistory :: histories =>
      let position := histories.length
      match emitted.drop position with
      | [bit] =>
          if foundFixed = b then
            some ⟨position, bit, [], accumulator, currentHistory, histories⟩
          else
            none
      | _ => none
  | _ => none

/-- Parse a nonfinal second row, whose residual appender is nonempty. -/
def parseSecondNonfinalWord? (emitted : List Bool)
    (term : Term) : Option SecondView :=
  match term.spineArgs with
  | foundNextHead :: foundNextLive :: accumulator :: currentHistory :: histories =>
      let position := histories.length
      match emitted.drop position with
      | bit :: next :: tail =>
          if foundNextHead = .app .s (appender tail) then
            if foundNextLive = live next then
              some ⟨position, bit, next :: tail, accumulator,
                currentHistory, histories⟩
            else
              none
          else
            none
      | _ => none
  | _ => none

/-- Parse either final or nonfinal second row. -/
def parseSecondWord? (emitted : List Bool) (term : Term) : Option SecondView :=
  match parseSecondFinalWord? emitted term with
  | some view => some view
  | none => parseSecondNonfinalWord? emitted term

/-- First-row parser for one fixed program and selected action label. -/
def parseFirst? (program : CTS.Program) (label : ActionLabel program)
    (term : Term) : Option FirstView :=
  parseFirstWord? (PrimitiveLocalResponse.emitted program label) term

/-- Second-row parser for one fixed program and selected action label. -/
def parseSecond? (program : CTS.Program) (label : ActionLabel program)
    (term : Term) : Option SecondView :=
  parseSecondWord? (PrimitiveLocalResponse.emitted program label) term

/-! ## Parser correctness and appendant-position recovery -/

/-- Successful first-row parsing reconstructs the complete local syntax. -/
theorem parseFirstWord?_sound
    {emitted : List Bool} {term : Term} {view : FirstView}
    (h : parseFirstWord? emitted term = some view) :
    emitted.drop view.position = view.bit :: view.rest ∧
      view.histories.length = view.position ∧
      term = Term.applyArgs
        (firstRow view.bit view.rest view.accumulator view.duplicate)
        view.histories := by
  cases hargs : term.spineArgs with
  | nil => simp [parseFirstWord?, hargs] at h
  | cons foundAppender tail₁ =>
      cases tail₁ with
      | nil => simp [parseFirstWord?, hargs] at h
      | cons accumulator tail₂ =>
          cases tail₂ with
          | nil => simp [parseFirstWord?, hargs] at h
          | cons liveApplication histories =>
              cases liveApplication with
              | s => simp [parseFirstWord?, hargs] at h
              | app foundLive duplicate =>
                  cases hdrop : emitted.drop histories.length with
                  | nil => simp [parseFirstWord?, hargs, hdrop] at h
                  | cons bit rest =>
                      by_cases happender : foundAppender = appender rest
                      · by_cases hlive : foundLive = live bit
                        · simp [parseFirstWord?, hargs, hdrop, happender,
                            hlive] at h
                          subst view
                          subst foundAppender
                          subst foundLive
                          refine ⟨hdrop, rfl, ?_⟩
                          calc
                            term = Term.applyArgs .s term.spineArgs :=
                              (Term.applyArgs_spineArgs term).symm
                            _ = Term.applyArgs .s
                                (appender rest :: accumulator ::
                                  (.app (live bit) duplicate) :: histories) := by
                              rw [hargs]
                            _ = Term.applyArgs
                                (firstRow bit rest accumulator duplicate)
                                histories := by rfl
                        · simp [parseFirstWord?, hargs, hdrop, happender,
                            hlive] at h
                      · simp [parseFirstWord?, hargs, hdrop, happender] at h

/-- A generated first row parses at exactly its retained-history position. -/
theorem parseFirstWord?_complete
    (emitted : List Bool) (bit : Bool) (rest : List Bool)
    (accumulator duplicate : Term) (histories : List Term)
    (hdrop : emitted.drop histories.length = bit :: rest) :
    parseFirstWord? emitted
        (Term.applyArgs (firstRow bit rest accumulator duplicate) histories) =
      some ⟨histories.length, bit, rest, accumulator, duplicate, histories⟩ := by
  simp [parseFirstWord?, Term.spineArgs_applyArgs, firstRow, hdrop]

/-- Successful final-second parsing reconstructs its exact local syntax. -/
theorem parseSecondFinalWord?_sound
    {emitted : List Bool} {term : Term} {view : SecondView}
    (h : parseSecondFinalWord? emitted term = some view) :
    emitted.drop view.position = [view.bit] ∧
      view.rest = [] ∧
      view.histories.length = view.position ∧
      term = Term.applyArgs
        (secondRow [] view.accumulator view.currentHistory) view.histories := by
  cases hargs : term.spineArgs with
  | nil => simp [parseSecondFinalWord?, hargs] at h
  | cons foundFixed tail₁ =>
      cases tail₁ with
      | nil => simp [parseSecondFinalWord?, hargs] at h
      | cons accumulator tail₂ =>
          cases tail₂ with
          | nil => simp [parseSecondFinalWord?, hargs] at h
          | cons currentHistory histories =>
              cases hdrop : emitted.drop histories.length with
              | nil => simp [parseSecondFinalWord?, hargs, hdrop] at h
              | cons bit rest =>
                  cases rest with
                  | nil =>
                      by_cases hfixed : foundFixed = b
                      · simp [parseSecondFinalWord?, hargs, hdrop, hfixed] at h
                        subst view
                        subst foundFixed
                        refine ⟨hdrop, rfl, rfl, ?_⟩
                        calc
                          term = Term.applyArgs .s term.spineArgs :=
                            (Term.applyArgs_spineArgs term).symm
                          _ = Term.applyArgs .s
                              (b :: accumulator :: currentHistory :: histories) := by
                            rw [hargs]
                          _ = Term.applyArgs
                              (secondRow [] accumulator currentHistory)
                              histories := by rfl
                      · simp [parseSecondFinalWord?, hargs, hdrop, hfixed] at h
                  | cons next tail =>
                      simp [parseSecondFinalWord?, hargs, hdrop] at h

/-- A generated last second row parses at exactly its history position. -/
theorem parseSecondFinalWord?_complete
    (emitted : List Bool) (bit : Bool) (accumulator currentHistory : Term)
    (histories : List Term)
    (hdrop : emitted.drop histories.length = [bit]) :
    parseSecondFinalWord? emitted
        (Term.applyArgs (secondRow [] accumulator currentHistory) histories) =
      some ⟨histories.length, bit, [], accumulator, currentHistory,
        histories⟩ := by
  simp [parseSecondFinalWord?, Term.spineArgs_applyArgs, secondRow, appender,
    p, b, hdrop]

/-- Successful nonfinal-second parsing reconstructs its exact local syntax. -/
theorem parseSecondNonfinalWord?_sound
    {emitted : List Bool} {term : Term} {view : SecondView}
    (h : parseSecondNonfinalWord? emitted term = some view) :
    emitted.drop view.position = view.bit :: view.rest ∧
      view.rest ≠ [] ∧
      view.histories.length = view.position ∧
      term = Term.applyArgs
        (secondRow view.rest view.accumulator view.currentHistory)
        view.histories := by
  cases hargs : term.spineArgs with
  | nil => simp [parseSecondNonfinalWord?, hargs] at h
  | cons foundNextHead tail₁ =>
      cases tail₁ with
      | nil => simp [parseSecondNonfinalWord?, hargs] at h
      | cons foundNextLive tail₂ =>
          cases tail₂ with
          | nil => simp [parseSecondNonfinalWord?, hargs] at h
          | cons accumulator tail₃ =>
              cases tail₃ with
              | nil => simp [parseSecondNonfinalWord?, hargs] at h
              | cons currentHistory histories =>
                  cases hdrop : emitted.drop histories.length with
                  | nil => simp [parseSecondNonfinalWord?, hargs, hdrop] at h
                  | cons bit rest =>
                      cases rest with
                      | nil =>
                          simp [parseSecondNonfinalWord?, hargs, hdrop] at h
                      | cons next tail =>
                          by_cases hhead :
                              foundNextHead = .app .s (appender tail)
                          · by_cases hlive : foundNextLive = live next
                            · simp [parseSecondNonfinalWord?, hargs, hdrop,
                                hhead, hlive] at h
                              subst view
                              subst foundNextHead
                              subst foundNextLive
                              refine ⟨hdrop, by simp, rfl, ?_⟩
                              calc
                                term = Term.applyArgs .s term.spineArgs :=
                                  (Term.applyArgs_spineArgs term).symm
                                _ = Term.applyArgs .s
                                    ((.app .s (appender tail)) ::
                                      live next :: accumulator ::
                                      currentHistory :: histories) := by
                                  rw [hargs]
                                _ = Term.applyArgs
                                    (secondRow (next :: tail) accumulator
                                      currentHistory) histories := by rfl
                            · simp [parseSecondNonfinalWord?, hargs, hdrop,
                                hhead, hlive] at h
                          · simp [parseSecondNonfinalWord?, hargs, hdrop,
                              hhead] at h

/-- A generated nonfinal second row parses at exactly its history position. -/
theorem parseSecondNonfinalWord?_complete
    (emitted : List Bool) (bit next : Bool) (tail : List Bool)
    (accumulator currentHistory : Term) (histories : List Term)
    (hdrop : emitted.drop histories.length = bit :: next :: tail) :
    parseSecondNonfinalWord? emitted
        (Term.applyArgs
          (secondRow (next :: tail) accumulator currentHistory) histories) =
      some ⟨histories.length, bit, next :: tail, accumulator,
        currentHistory, histories⟩ := by
  simp [parseSecondNonfinalWord?, Term.spineArgs_applyArgs, secondRow,
    appender, push, hdrop]

/-- An appender is never the fixed term `b`. -/
theorem appender_ne_b (bits : List Bool) : appender bits ≠ b :=
  ActionMutation.appender_ne_b bits

/-- The fixed `p` endpoint is not `b`. -/
theorem p_ne_b : p ≠ b := by
  simpa [appender] using appender_ne_b []

/-- An `S` applied to an appender is not `b = S S`. -/
theorem s_appender_ne_b (bits : List Bool) :
    (.app .s (appender bits) : Term) ≠ b := by
  intro equal
  have child := Term.app.inj equal
  exact ActionMutation.appender_ne_s bits child.2

/-- An appender is never an `S` applied to another appender. -/
theorem appender_ne_s_appender (first second : List Bool) :
    appender first ≠ .app .s (appender second) := by
  cases first with
  | nil =>
      intro equal
      have child := Term.app.inj equal
      exact appender_ne_b second child.2.symm
  | cons bit rest => simp [appender, push]

/-- The symmetric fixed-code separation used by the first-row parser. -/
theorem s_appender_ne_appender (first second : List Bool) :
    (.app .s (appender first) : Term) ≠ appender second := by
  intro equal
  exact appender_ne_s_appender second first equal.symm

/-- A nonfinal second row cannot be accepted by the final-row parser. -/
theorem parseSecondFinalWord?_secondRow_nonfinal
    (emitted : List Bool) (bit next : Bool) (tail : List Bool)
    (accumulator currentHistory : Term) (histories : List Term)
    (hdrop : emitted.drop histories.length = bit :: next :: tail) :
    parseSecondFinalWord? emitted
        (Term.applyArgs
          (secondRow (next :: tail) accumulator currentHistory) histories) =
      none := by
  have hnext : emitted.drop (histories.length + 1) = next :: tail := by
    rw [← List.drop_drop]
    simp [hdrop]
  cases tail with
  | nil =>
      have hne : (.app .s p : Term) ≠ b := by
        simpa using s_appender_ne_b []
      simp [parseSecondFinalWord?, Term.spineArgs_applyArgs, secondRow,
        appender_cons, push, hnext, hne]
  | cons later tail =>
      simp [parseSecondFinalWord?, Term.spineArgs_applyArgs, secondRow,
        appender_cons, push, s_appender_ne_b, hnext]

/-- The combined second-row parser is complete on a final generated row. -/
theorem parseSecondWord?_complete_final
    (emitted : List Bool) (bit : Bool) (accumulator currentHistory : Term)
    (histories : List Term)
    (hdrop : emitted.drop histories.length = [bit]) :
    parseSecondWord? emitted
        (Term.applyArgs (secondRow [] accumulator currentHistory) histories) =
      some ⟨histories.length, bit, [], accumulator, currentHistory,
        histories⟩ := by
  simp [parseSecondWord?, parseSecondFinalWord?_complete, hdrop]

/-- The combined second-row parser is complete on a nonfinal generated row. -/
theorem parseSecondWord?_complete_nonfinal
    (emitted : List Bool) (bit next : Bool) (tail : List Bool)
    (accumulator currentHistory : Term) (histories : List Term)
    (hdrop : emitted.drop histories.length = bit :: next :: tail) :
    parseSecondWord? emitted
        (Term.applyArgs
          (secondRow (next :: tail) accumulator currentHistory) histories) =
      some ⟨histories.length, bit, next :: tail, accumulator,
        currentHistory, histories⟩ := by
  rw [parseSecondWord?,
    parseSecondFinalWord?_secondRow_nonfinal emitted bit next tail accumulator
      currentHistory histories hdrop]
  exact parseSecondNonfinalWord?_complete emitted bit next tail accumulator
    currentHistory histories hdrop

/-- Successful combined second-row parsing reconstructs one exact row. -/
theorem parseSecondWord?_sound
    {emitted : List Bool} {term : Term} {view : SecondView}
    (h : parseSecondWord? emitted term = some view) :
    emitted.drop view.position = view.bit :: view.rest ∧
      view.histories.length = view.position ∧
      term = Term.applyArgs
        (secondRow view.rest view.accumulator view.currentHistory)
        view.histories := by
  unfold parseSecondWord? at h
  generalize hfinal : parseSecondFinalWord? emitted term = finalResult at h
  cases finalResult with
  | some finalView =>
      have equal := Option.some.inj h
      subst view
      have sound := parseSecondFinalWord?_sound hfinal
      rcases sound with ⟨hdrop, hrest, hlength, hterm⟩
      rw [hrest]
      exact ⟨hdrop, hlength, hterm⟩
  | none =>
      have sound := parseSecondNonfinalWord?_sound h
      exact ⟨sound.1, sound.2.2.1, sound.2.2.2⟩

/-- Program/label first-row success recovers the literal emitted suffix. -/
theorem parseFirst?_sound
    {program : CTS.Program} {label : ActionLabel program}
    {term : Term} {view : FirstView}
    (h : parseFirst? program label term = some view) :
    (PrimitiveLocalResponse.emitted program label).drop view.position =
        view.bit :: view.rest ∧
      view.histories.length = view.position ∧
      term = Term.applyArgs
        (firstRow view.bit view.rest view.accumulator view.duplicate)
        view.histories :=
  parseFirstWord?_sound h

/-- Program/label second-row success recovers the literal emitted suffix. -/
theorem parseSecond?_sound
    {program : CTS.Program} {label : ActionLabel program}
    {term : Term} {view : SecondView}
    (h : parseSecond? program label term = some view) :
    (PrimitiveLocalResponse.emitted program label).drop view.position =
        view.bit :: view.rest ∧
      view.histories.length = view.position ∧
      term = Term.applyArgs
        (secondRow view.rest view.accumulator view.currentHistory)
        view.histories :=
  parseSecondWord?_sound h

/-- A successful first-row parse returns an actual appendant position. -/
theorem FirstView.position_lt_emitted_length
    {emitted : List Bool} {term : Term} {view : FirstView}
    (h : parseFirstWord? emitted term = some view) :
    view.position < emitted.length := by
  have hdrop := (parseFirstWord?_sound h).1
  apply Nat.lt_of_not_ge
  intro hle
  have hempty : emitted.drop view.position = [] :=
    List.drop_eq_nil_of_le hle
  rw [hempty] at hdrop
  contradiction

/-- A successful second-row parse returns an actual appendant position. -/
theorem SecondView.position_lt_emitted_length
    {emitted : List Bool} {term : Term} {view : SecondView}
    (h : parseSecondWord? emitted term = some view) :
    view.position < emitted.length := by
  have hdrop := (parseSecondWord?_sound h).1
  apply Nat.lt_of_not_ge
  intro hle
  have hempty : emitted.drop view.position = [] :=
    List.drop_eq_nil_of_le hle
  rw [hempty] at hdrop
  contradiction

/-! ## Generated scheduler-row completeness -/

/-- The exact `SchedulerResponseInvariant.pushFirst` row is recognized. -/
theorem parseFirst?_pushFirst
    (program : CTS.Program) (label : ActionLabel program)
    (bit : Bool) (rest : List Bool) (initial : Term) (outer : List Term)
    (hdrop : (PrimitiveLocalResponse.emitted program label).drop outer.length =
      bit :: rest) :
    parseFirst? program label
        (Term.applyArgs (pushFirst bit rest initial) outer) =
      some ⟨outer.length, bit, rest, initial, initial, outer⟩ := by
  simpa [parseFirst?, pushFirst, firstRow] using
    parseFirstWord?_complete
      (PrimitiveLocalResponse.emitted program label) bit rest initial initial
      outer hdrop

/-- The exact last `pushSecond` row is recognized as final. -/
theorem parseSecond?_pushSecond_final
    (program : CTS.Program) (label : ActionLabel program)
    (bit : Bool) (initial : Term) (outer : List Term)
    (hdrop : (PrimitiveLocalResponse.emitted program label).drop outer.length =
      [bit]) :
    parseSecond? program label
        (Term.applyArgs (pushSecond bit [] initial) outer) =
      some ⟨outer.length, bit, [], extendAccumulator bit initial,
        pushHistory bit initial, outer⟩ := by
  simpa [parseSecond?, pushSecond, secondRow] using
    parseSecondWord?_complete_final
      (PrimitiveLocalResponse.emitted program label) bit
      (extendAccumulator bit initial) (pushHistory bit initial) outer hdrop

/-- An exact nonfinal `pushSecond` row recovers the next residual appender. -/
theorem parseSecond?_pushSecond_nonfinal
    (program : CTS.Program) (label : ActionLabel program)
    (bit next : Bool) (tail : List Bool) (initial : Term) (outer : List Term)
    (hdrop : (PrimitiveLocalResponse.emitted program label).drop outer.length =
      bit :: next :: tail) :
    parseSecond? program label
        (Term.applyArgs (pushSecond bit (next :: tail) initial) outer) =
      some ⟨outer.length, bit, next :: tail, extendAccumulator bit initial,
        pushHistory bit initial, outer⟩ := by
  simpa [parseSecond?, pushSecond, secondRow] using
    parseSecondWord?_complete_nonfinal
      (PrimitiveLocalResponse.emitted program label) bit next tail
      (extendAccumulator bit initial) (pushHistory bit initial) outer hdrop

/-! ## Registered-role disjointness -/

/-- A first row is rejected by the final-second parser. -/
theorem parseSecondFinalWord?_firstRow
    (emitted : List Bool) (bit : Bool) (rest : List Bool)
    (accumulator duplicate : Term) (histories : List Term)
    (hdrop : emitted.drop histories.length = bit :: rest) :
    parseSecondFinalWord? emitted
        (Term.applyArgs (firstRow bit rest accumulator duplicate) histories) =
      none := by
  cases rest <;>
    simp [parseSecondFinalWord?, Term.spineArgs_applyArgs, firstRow,
      appender_ne_b, p_ne_b,
      ActionMutation.appender_ne_s, hdrop]

/-- A first row is rejected by the nonfinal-second parser. -/
theorem parseSecondNonfinalWord?_firstRow
    (emitted : List Bool) (bit : Bool) (rest : List Bool)
    (accumulator duplicate : Term) (histories : List Term)
    (hdrop : emitted.drop histories.length = bit :: rest) :
    parseSecondNonfinalWord? emitted
        (Term.applyArgs (firstRow bit rest accumulator duplicate) histories) =
      none := by
  cases histories with
  | nil =>
      simp [parseSecondNonfinalWord?, Term.spineArgs_applyArgs, firstRow]
  | cons history histories =>
      simp only [parseSecondNonfinalWord?, Term.spineArgs_applyArgs, firstRow,
        Term.spineArgs, List.append_nil, List.length_cons]
      cases hsuffix : emitted.drop histories.length with
      | nil => simp [hsuffix]
      | cons current suffix =>
          cases suffix with
          | nil => simp [hsuffix]
          | cons next tail =>
              simp [hsuffix, appender_ne_s_appender]

/-- Every successfully parsed first row is rejected by the second parser. -/
theorem parseSecondWord?_none_of_parseFirstWord?_some
    {emitted : List Bool} {term : Term} {view : FirstView}
    (h : parseFirstWord? emitted term = some view) :
    parseSecondWord? emitted term = none := by
  have sound := parseFirstWord?_sound h
  rcases sound with ⟨hdrop, hlength, rfl⟩
  rw [← hlength] at hdrop
  rw [parseSecondWord?,
    parseSecondFinalWord?_firstRow emitted view.bit view.rest
      view.accumulator view.duplicate view.histories hdrop,
    parseSecondNonfinalWord?_firstRow emitted view.bit view.rest
      view.accumulator view.duplicate view.histories hdrop]

/-- A final second row is rejected by the first-row parser. -/
theorem parseFirstWord?_secondRow_final
    (emitted : List Bool) (bit : Bool) (accumulator currentHistory : Term)
    (histories : List Term)
    (hdrop : emitted.drop histories.length = [bit]) :
    parseFirstWord? emitted
        (Term.applyArgs (secondRow [] accumulator currentHistory) histories) =
      none := by
  cases currentHistory <;>
    simp [parseFirstWord?, Term.spineArgs_applyArgs, secondRow, appender, p, b,
      appender_ne_b, hdrop]

/-- A nonfinal second row is rejected by the first-row parser. -/
theorem parseFirstWord?_secondRow_nonfinal
    (emitted : List Bool) (bit next : Bool) (tail : List Bool)
    (accumulator currentHistory : Term) (histories : List Term)
    (hdrop : emitted.drop histories.length = bit :: next :: tail) :
    parseFirstWord? emitted
        (Term.applyArgs
          (secondRow (next :: tail) accumulator currentHistory) histories) =
      none := by
  have hnext : emitted.drop (histories.length + 1) = next :: tail := by
    rw [← List.drop_drop]
    simp [hdrop]
  cases tail with
  | nil =>
      have hne : (.app .s p : Term) ≠ p := by
        simpa using s_appender_ne_appender [] []
      cases accumulator <;>
        simp [parseFirstWord?, Term.spineArgs_applyArgs, secondRow,
          appender_cons, push, hnext, hne]
  | cons later tail =>
      cases accumulator <;>
        simp [parseFirstWord?, Term.spineArgs_applyArgs, secondRow,
          appender_cons, push, s_appender_ne_appender, hnext]

/-- Every successfully parsed second row is rejected by the first parser. -/
theorem parseFirstWord?_none_of_parseSecondWord?_some
    {emitted : List Bool} {term : Term} {view : SecondView}
    (h : parseSecondWord? emitted term = some view) :
    parseFirstWord? emitted term = none := by
  have sound := parseSecondWord?_sound h
  rcases sound with ⟨hdrop, hlength, rfl⟩
  rw [← hlength] at hdrop
  cases hrest : view.rest with
  | nil =>
      have hdrop' : emitted.drop view.histories.length = [view.bit] := by
        simpa [hrest] using hdrop
      exact parseFirstWord?_secondRow_final emitted view.bit view.accumulator
        view.currentHistory view.histories hdrop'
  | cons next tail =>
      have hdrop' :
          emitted.drop view.histories.length = view.bit :: next :: tail := by
        simpa [hrest] using hdrop
      exact parseFirstWord?_secondRow_nonfinal emitted view.bit next tail
        view.accumulator view.currentHistory view.histories hdrop'

/-! ## Exact registered redex addresses -/

/-- Prefix a local address by one left move per retained history. -/
def historyPrefixAddress (histories : List Term) (suffix : Address) : Address :=
  ActionParser.prefixLeft histories.length suffix

/-- Replace beneath the left spine created by `applyArgs`. -/
theorem replace?_applyArgs_prefixLeft
    (fn replacement result : Term) (args : List Term) (suffix : Address)
    (h : fn.replace? suffix replacement = some result) :
    (Term.applyArgs fn args).replace?
        (ActionParser.prefixLeft args.length suffix) replacement =
      some (Term.applyArgs result args) := by
  induction args generalizing fn result suffix with
  | nil => exact h
  | cons arg rest ih =>
      change
        (Term.applyArgs (.app fn arg) rest).replace?
            (ActionParser.prefixLeft rest.length (.left :: suffix)) replacement =
          some (Term.applyArgs (.app result arg) rest)
      apply ih
      simp [Term.replace?, h]

/-- Contract a root redex beneath a retained-history spine. -/
theorem contractAt?_applyArgs_root
    (source target : Term) (args : List Term)
    (h : source.contractRoot? = some target) :
    (Term.applyArgs source args).contractAt?
        (historyPrefixAddress args []) =
      some (Term.applyArgs target args) := by
  unfold Term.contractAt? historyPrefixAddress
  rw [ActionParser.subterm?_applyArgs_prefixLeft]
  simp only [Term.subterm?, h]
  exact replace?_applyArgs_prefixLeft source target target args [] (by
    simp [Term.replace?])

/-- Exact result of contracting a generalized first row. -/
def firstTarget (bit : Bool) (rest : List Bool)
    (accumulator duplicate : Term) : Term :=
  .app
    (.app (appender rest) (.app (live bit) duplicate))
    (.app accumulator (.app (live bit) duplicate))

/-- A parsed first row's registered address reaches a saturated S-redex. -/
theorem FirstView.redex_subterm
    {emitted : List Bool} {term : Term} {view : FirstView}
    (h : parseFirstWord? emitted term = some view) :
    term.subterm? (historyPrefixAddress view.histories []) =
      some (firstRow view.bit view.rest view.accumulator view.duplicate) := by
  have sound := parseFirstWord?_sound h
  rcases sound with ⟨_, _, rfl⟩
  unfold historyPrefixAddress
  simpa using ActionParser.subterm?_applyArgs_prefixLeft
    (firstRow view.bit view.rest view.accumulator view.duplicate)
    view.histories []

/-- The registered first-row address contracts to the exact second half-row. -/
theorem FirstView.contracts
    {emitted : List Bool} {term : Term} {view : FirstView}
    (h : parseFirstWord? emitted term = some view) :
    term.contractAt? (historyPrefixAddress view.histories []) =
      some (Term.applyArgs
        (firstTarget view.bit view.rest view.accumulator view.duplicate)
        view.histories) := by
  have sound := parseFirstWord?_sound h
  rcases sound with ⟨_, _, rfl⟩
  apply contractAt?_applyArgs_root
  rfl

/-- On a canonical scheduler row, the first contraction is exactly `pushSecond`. -/
theorem contractAt?_pushFirst
    (bit : Bool) (rest : List Bool) (initial : Term) (outer : List Term) :
    (Term.applyArgs (pushFirst bit rest initial) outer).contractAt?
        (historyPrefixAddress outer []) =
      some (Term.applyArgs (pushSecond bit rest initial) outer) := by
  simpa [pushFirst, pushSecond, firstRow, firstTarget, extendAccumulator,
    pushHistory] using
    contractAt?_applyArgs_root
      (firstRow bit rest initial initial)
      (firstTarget bit rest initial initial) outer (by rfl)

/-- A nonfinal second row's registered address reaches the next Push redex. -/
theorem SecondView.nonfinal_redex_subterm
    {emitted : List Bool} {term : Term} {view : SecondView}
    (h : parseSecondWord? emitted term = some view)
    {next : Bool} {tail : List Bool} (hrest : view.rest = next :: tail) :
    term.subterm? (historyPrefixAddress view.histories [.left]) =
      some (.app (appender (next :: tail)) view.accumulator) := by
  have sound := parseSecondWord?_sound h
  rcases sound with ⟨_, _, hterm⟩
  rw [hterm, hrest]
  unfold historyPrefixAddress
  rw [ActionParser.subterm?_applyArgs_prefixLeft]
  rfl

/-- A nonfinal second row contracts exactly to the next first Push row. -/
theorem SecondView.nonfinal_contracts
    {emitted : List Bool} {term : Term} {view : SecondView}
    (h : parseSecondWord? emitted term = some view)
    {next : Bool} {tail : List Bool} (hrest : view.rest = next :: tail) :
    term.contractAt? (historyPrefixAddress view.histories [.left]) =
      some (Term.applyArgs
        (firstRow next tail view.accumulator view.accumulator)
        (view.currentHistory :: view.histories)) := by
  have sound := parseSecondWord?_sound h
  rcases sound with ⟨_, _, hterm⟩
  rw [hterm, hrest]
  unfold historyPrefixAddress Term.contractAt?
  rw [ActionParser.subterm?_applyArgs_prefixLeft]
  simp only [secondRow, Term.subterm?, appender, push, Term.contractRoot?,
    Term.contractum]
  have replace := replace?_applyArgs_prefixLeft
    (secondRow (next :: tail) view.accumulator view.currentHistory)
    (firstRow next tail view.accumulator view.accumulator)
    (.app (firstRow next tail view.accumulator view.accumulator)
      view.currentHistory)
    view.histories [.left] (by rfl)
  simpa [firstRow] using! replace

/-- On canonical scheduler rows, a nonfinal second contraction starts the next Push. -/
theorem contractAt?_pushSecond_nonfinal
    (bit next : Bool) (tail : List Bool) (initial : Term)
    (outer : List Term) :
    (Term.applyArgs (pushSecond bit (next :: tail) initial) outer).contractAt?
        (historyPrefixAddress outer [.left]) =
      some (Term.applyArgs
        (pushFirst next tail (extendAccumulator bit initial))
        (pushHistory bit initial :: outer)) := by
  unfold pushSecond historyPrefixAddress Term.contractAt?
  rw [ActionParser.subterm?_applyArgs_prefixLeft]
  simp only [Term.subterm?, appender, push, Term.contractRoot?, Term.contractum]
  have replace := replace?_applyArgs_prefixLeft
    (.app (.app (appender (next :: tail)) (extendAccumulator bit initial))
      (pushHistory bit initial))
    (pushFirst next tail (extendAccumulator bit initial))
    (.app (pushFirst next tail (extendAccumulator bit initial))
      (pushHistory bit initial))
    outer [.left] (by rfl)
  simpa using! replace

/-- At the last second row, the would-be next-Push address is not a redex. -/
theorem contractAt?_secondRow_final_none
    (accumulator currentHistory : Term) (histories : List Term) :
    (Term.applyArgs (secondRow [] accumulator currentHistory) histories).contractAt?
        (historyPrefixAddress histories [.left]) = none := by
  unfold historyPrefixAddress Term.contractAt?
  rw [ActionParser.subterm?_applyArgs_prefixLeft]
  rfl

/-- Canonical last second rows likewise have no next Push contraction. -/
theorem contractAt?_pushSecond_final_none
    (bit : Bool) (initial : Term) (outer : List Term) :
    (Term.applyArgs (pushSecond bit [] initial) outer).contractAt?
        (historyPrefixAddress outer [.left]) = none := by
  simpa [pushSecond, secondRow] using
    contractAt?_secondRow_final_none
      (extendAccumulator bit initial) (pushHistory bit initial) outer

end PureSFormal.Research.RootResetAppenderStages
