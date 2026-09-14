import PureSFormal.PureS.Actions
import PureSFormal.PureS.Arity

/-!
# Executable selected-action parser

At a known CTS action label, equation (8b) has one public applicative
spine: `p X` followed by a label-determined number of history arguments.
The parser checks the fixed `p` prefix and that number.  It returns the
registered accumulator occurrence and the history terms themselves, without
inspecting or comparing any two returned fields.
-/

namespace PureSFormal.PureS

namespace ActionParser

/-- The history arity fixed by a known phase/bit action label. -/
def historyCount (program : CTS.Program) : ActionLabel program → Nat
  | (_, false) => 0
  | (phase, true) => (program.appendant phase).length

@[simp]
theorem historyCount_zero (program : CTS.Program)
    (phase : CTS.Phase program) :
    historyCount program (phase, false) = 0 :=
  rfl

@[simp]
theorem historyCount_one (program : CTS.Program)
    (phase : CTS.Phase program) :
    historyCount program (phase, true) =
      (program.appendant phase).length :=
  rfl

/-- The two fields returned by a successful equation-(8b) parse. -/
structure ParsedAction where
  accumulator : Term
  histories : List Term
  deriving BEq, DecidableEq, Repr

/--
Check the argument list of a pure-`S` applicative spine.  The first argument
must be the fixed argument `b` of `p = S b`; the next argument is the
accumulator; all remaining arguments are independent histories.
-/
def parseSpine? (expectedHistories : Nat) : List Term → Option ParsedAction
  | fixed :: accumulator :: histories =>
      if fixed = b then
        if histories.length = expectedHistories then
          some ⟨accumulator, histories⟩
        else
          none
      else
        none
  | _ => none

/-- Parse a bare term at a known finite CTS action label. -/
def parse (program : CTS.Program) (label : ActionLabel program)
    (result : Term) : Option ParsedAction :=
  parseSpine? (historyCount program label) result.spineArgs

/--
The permissive equation-(8b) language.  Only its public prefix and history
count are fixed; `accumulator` and every member of `histories` are arbitrary
and mutually independent terms.
-/
def ActionShape (program : CTS.Program) (label : ActionLabel program)
    (accumulator : Term) (histories : List Term) (result : Term) : Prop :=
  histories.length = historyCount program label ∧
    result = Term.applyArgs (.app p accumulator) histories

theorem parseSpine?_sound
    {expectedHistories : Nat} {args : List Term} {parsed : ParsedAction}
    (h : parseSpine? expectedHistories args = some parsed) :
    args = b :: parsed.accumulator :: parsed.histories ∧
      parsed.histories.length = expectedHistories := by
  cases args with
  | nil => simp [parseSpine?] at h
  | cons fixed rest =>
      cases rest with
      | nil => simp [parseSpine?] at h
      | cons accumulator histories =>
          simp only [parseSpine?] at h
          split at h
          next hfixed =>
            split at h
            next hlength =>
              have hparsed :
                  ({ accumulator := accumulator, histories := histories } :
                    ParsedAction) = parsed :=
                Option.some.inj h
              subst parsed
              exact ⟨by rw [hfixed], hlength⟩
            next hlength => contradiction
          next hfixed => contradiction

theorem parseSpine?_complete
    (expectedHistories : Nat) (accumulator : Term) (histories : List Term)
    (hlength : histories.length = expectedHistories) :
    parseSpine? expectedHistories (b :: accumulator :: histories) =
      some ⟨accumulator, histories⟩ := by
  simp [parseSpine?, hlength]

/-- A successful executable parse proves the full permissive shape. -/
theorem parse_sound
    {program : CTS.Program} {label : ActionLabel program}
    {result : Term} {parsed : ParsedAction}
    (h : parse program label result = some parsed) :
    ActionShape program label parsed.accumulator parsed.histories result := by
  have hspine := parseSpine?_sound h
  rcases hspine with ⟨hargs, hlength⟩
  constructor
  · exact hlength
  · calc
      result = Term.applyArgs .s result.spineArgs :=
        (Term.applyArgs_spineArgs result).symm
      _ = Term.applyArgs .s
          (b :: parsed.accumulator :: parsed.histories) := by rw [hargs]
      _ = Term.applyArgs (.app p parsed.accumulator) parsed.histories := by
        rfl

/-- Every term in the permissive equation-(8b) language parses exactly. -/
theorem parse_complete
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {result : Term}
    (h : ActionShape program label accumulator histories result) :
    parse program label result = some ⟨accumulator, histories⟩ := by
  rcases h with ⟨hlength, rfl⟩
  unfold parse
  rw [Term.spineArgs_applyArgs]
  simpa [p] using
    parseSpine?_complete (historyCount program label) accumulator histories
      hlength

/-- Executable parsing is equivalent to the declarative action shape. -/
theorem parse_eq_some_iff
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {result : Term} :
    parse program label result = some ⟨accumulator, histories⟩ ↔
      ActionShape program label accumulator histories result :=
  ⟨parse_sound, parse_complete⟩

/-- Canonical action histories have exactly the label-selected length. -/
theorem actionHistories_length (program : CTS.Program)
    (label : ActionLabel program) (initial : Term) :
    (actionHistories program label initial).length =
      historyCount program label := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => rfl
  | true =>
      simpa [actionHistories, historyCount] using
        retainedHistories_length (program.appendant phase) initial

/-- Every generated `actionResult` inhabits the permissive action shape. -/
theorem actionResult_shape (program : CTS.Program)
    (label : ActionLabel program) (initial : Term) :
    ActionShape program label
      (actionAccumulator program label initial)
      (actionHistories program label initial)
      (actionResult program label initial) := by
  exact ⟨actionHistories_length program label initial, rfl⟩

/-- Generated selected-action endpoints parse to their exact stored fields. -/
@[simp]
theorem parse_actionResult (program : CTS.Program)
    (label : ActionLabel program) (initial : Term) :
    parse program label (actionResult program label initial) =
      some ⟨actionAccumulator program label initial,
        actionHistories program label initial⟩ :=
  parse_complete (actionResult_shape program label initial)

/-!
The address constructor below adds one left move for each retained history,
then one right move into the accumulator of the remaining `p X` prefix.
-/

/-- Prefix an address by `count` left moves. -/
def prefixLeft : Nat → Address → Address
  | 0, suffix => suffix
  | count + 1, suffix => prefixLeft count (.left :: suffix)

/-- The equation-(8b) accumulator address `L^count R`. -/
def accumulatorAddress (count : Nat) : Address :=
  prefixLeft count [.right]

@[simp]
theorem accumulatorAddress_zero : accumulatorAddress 0 = [.right] :=
  rfl

theorem prefixLeft_left (count : Nat) (suffix : Address) :
    prefixLeft count (.left :: suffix) =
      .left :: prefixLeft count suffix := by
  induction count generalizing suffix with
  | zero => rfl
  | succ count ih =>
      simp only [prefixLeft]
      exact ih (.left :: suffix)

@[simp]
theorem accumulatorAddress_succ (count : Nat) :
    accumulatorAddress (count + 1) =
      .left :: accumulatorAddress count := by
  simp only [accumulatorAddress, prefixLeft]
  exact prefixLeft_left count [.right]

theorem subterm?_applyArgs_prefixLeft
    (fn : Term) (args : List Term) (suffix : Address) :
    (Term.applyArgs fn args).subterm?
        (prefixLeft args.length suffix) =
      fn.subterm? suffix := by
  induction args generalizing fn suffix with
  | nil => rfl
  | cons arg rest ih =>
      change
        (Term.applyArgs (.app fn arg) rest).subterm?
            (prefixLeft rest.length (.left :: suffix)) =
          fn.subterm? suffix
      rw [ih]
      rfl

/-- The returned accumulator is at exactly `L^|histories| R`. -/
theorem actionSpine_accumulator_subterm
    (accumulator : Term) (histories : List Term) :
    (Term.applyArgs (.app p accumulator) histories).subterm?
        (accumulatorAddress histories.length) = some accumulator := by
  unfold accumulatorAddress
  rw [subterm?_applyArgs_prefixLeft]
  simp only [Term.subterm?]

/-- A parsed action fixes the accumulator address using its label alone. -/
theorem ActionShape.accumulator_subterm
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {result : Term}
    (h : ActionShape program label accumulator histories result) :
    result.subterm? (accumulatorAddress (historyCount program label)) =
      some accumulator := by
  rcases h with ⟨hlength, rfl⟩
  rw [← hlength]
  exact actionSpine_accumulator_subterm accumulator histories

/-- An equation-(8b) spine has arity two plus its history count. -/
theorem actionSpine_headArity
    (accumulator : Term) (histories : List Term) :
    (Term.applyArgs (.app p accumulator) histories).headArity =
      2 + histories.length := by
  rw [Term.headArity_applyArgs]
  rfl

/-- A parsed action's exact outer arity is fixed by its known label. -/
theorem ActionShape.headArity
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {result : Term}
    (h : ActionShape program label accumulator histories result) :
    result.headArity = 2 + historyCount program label := by
  rcases h with ⟨hlength, rfl⟩
  rw [actionSpine_headArity, hlength]

end ActionParser

end PureSFormal.PureS
