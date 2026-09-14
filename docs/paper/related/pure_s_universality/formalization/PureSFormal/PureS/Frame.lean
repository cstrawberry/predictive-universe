import PureSFormal.PureS.Actions
import PureSFormal.PureS.Arity

set_option backward.isDefEq.respectTransparency false

/-!
# Closed frame and Local-shell code

This module gives literal pure-`S` definitions for equation (5a) and proves
the three registered frame-prefix contractions in (14d).  The parameters
`actions` and `bits` are compile-time data; every theorem is uniform in the
finite dispatcher and the encoded input word.
-/

namespace PureSFormal.PureS

/-- The reserved halt tag `haltTag = b S`. -/
def haltTag : Term := .app b .s

/-- The fresh halt-field code `Halt* = b haltTag`. -/
def haltCode : Term := .app b haltTag

/-- The registered marked halt field `Mark_H(V) = S V (haltTag V)`. -/
def markH (carrier : Term) : Term :=
  .app (.app .s carrier) (.app haltTag carrier)

/-- The input-dependent closed seed `Seed_w = S Word(w)`. -/
def seedCode (bits : List Bool) : Term :=
  .app .s (word bits)

/-- `Act* = S Halt* Actions*`. -/
def actCode (actions : Term) : Term :=
  .app (.app .s haltCode) actions

/-- `D* = S Act* Seed_w`. -/
def dispatcherCode (actions : Term) (bits : List Bool) : Term :=
  .app (.app .s (actCode actions)) (seedCode bits)

/-- `E* = S D*`. -/
def environmentCode (actions : Term) (bits : List Bool) : Term :=
  .app .s (dispatcherCode actions bits)

/-- The fresh registered halt field `Fresh(V) = Halt* V`. -/
def freshHField (carrier : Term) : Term :=
  .app haltCode carrier

/--
The diagonal fresh Local response produced directly by the frame prefix:
`Halt* V (Actions* V) (Seed_w V) (B V)`.
-/
def freshLocal (actions : Term) (bits : List Bool)
    (continuation carrier : Term) : Term :=
  Term.applyArgs haltCode
    [carrier, .app actions carrier, .app (seedCode bits) carrier,
      .app continuation carrier]

/--
The same Local shell with only its registered halt field marked.  All four
carrier occurrences remain literal independent occurrences in the tree.
-/
def markedLocal (actions : Term) (bits : List Bool)
    (continuation carrier : Term) : Term :=
  Term.applyArgs (markH carrier)
    [.app actions carrier, .app (seedCode bits) carrier,
      .app continuation carrier]

/-- `Halt* V` contracts to `Mark_H(V)` in exactly one `S` step. -/
theorem haltCode_mark (carrier : Term) :
    StepsN 1 (freshHField carrier) (markH carrier) := by
  apply StepsN.single
  simpa [freshHField, haltCode, haltTag, markH, b,
    Term.redex, Term.contractum] using
      Step.root (.s : Term) haltTag carrier

/-- The first registered frame contraction in (14d). -/
theorem framePrefix_first (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    StepsN 1
      (frame (environmentCode actions bits) continuation carrier)
      (.app
        (.app (dispatcherCode actions bits) carrier)
        (.app continuation carrier)) := by
  apply StepsN.single
  simpa [frame, environmentCode, Term.redex, Term.contractum] using
    Step.root (dispatcherCode actions bits) continuation carrier

/-- The first two registered frame contractions in (14d). -/
theorem framePrefix_second (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    StepsN 2
      (frame (environmentCode actions bits) continuation carrier)
      (.app
        (.app
          (.app (actCode actions) carrier)
          (.app (seedCode bits) carrier))
        (.app continuation carrier)) := by
  let afterFirst : Term :=
    .app
      (.app (dispatcherCode actions bits) carrier)
      (.app continuation carrier)
  have first : StepsN 1
      (frame (environmentCode actions bits) continuation carrier)
      afterFirst := by
    simpa [afterFirst] using
      framePrefix_first actions bits continuation carrier
  have second : Step afterFirst
      (.app
        (.app
          (.app (actCode actions) carrier)
          (.app (seedCode bits) carrier))
        (.app continuation carrier)) := by
    simpa [afterFirst, dispatcherCode, Term.redex, Term.contractum] using
      Step.appLeft
        (Step.root (actCode actions) (seedCode bits) carrier)
        (.app continuation carrier)
  exact StepsN.tail first second

/--
Equation (14d): the literal frame prefix reaches a diagonal fresh Local
shell in exactly three contractions, without entering any retained carrier
copy.
-/
theorem framePrefix (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    StepsN 3
      (frame (environmentCode actions bits) continuation carrier)
      (freshLocal actions bits continuation carrier) := by
  let afterSecond : Term :=
    .app
      (.app
        (.app (actCode actions) carrier)
        (.app (seedCode bits) carrier))
      (.app continuation carrier)
  have firstTwo : StepsN 2
      (frame (environmentCode actions bits) continuation carrier)
      afterSecond := by
    simpa [afterSecond] using
      framePrefix_second actions bits continuation carrier
  have third : Step afterSecond
      (freshLocal actions bits continuation carrier) := by
    simpa [afterSecond, actCode, freshLocal, Term.applyArgs,
      Term.redex, Term.contractum] using
      Step.appLeft
        (Step.appLeft
          (Step.root haltCode actions carrier)
          (.app (seedCode bits) carrier))
        (.app continuation carrier)
  exact StepsN.tail firstTwo third

/-- Marking the registered fresh halt field preserves every other field. -/
theorem freshLocal_mark (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    StepsN 1
      (freshLocal actions bits continuation carrier)
      (markedLocal actions bits continuation carrier) := by
  simpa [freshLocal, markedLocal, Term.applyArgs] using!
    StepsN.appLeft
      (StepsN.appLeft
        (StepsN.appLeft (haltCode_mark carrier)
          (.app actions carrier))
        (.app (seedCode bits) carrier))
      (.app continuation carrier)

/-- The reserved halt tag is syntactically distinct from the action prefix. -/
theorem haltTag_ne_p : haltTag ≠ p := by
  decide

/--
At their registered field boundary, a marked halt response cannot be a
selected zero action.  The proof compares only the fixed `haltTag` and `p`
heads; all audit and payload terms remain arbitrary.
-/
theorem markH_ne_zeroAction
    (markAudit zeroAudit payload : Term) :
    markH markAudit ≠ chosen zeroAudit (.app p payload) := by
  intro h
  unfold markH chosen at h
  injection h with _ hfield
  injection hfield with hhead _
  exact haltTag_ne_p hhead

/-- The halt tag is also disjoint from both reserved live constructors. -/
theorem haltTag_ne_live (bit : Bool) : haltTag ≠ live bit := by
  cases bit <;> decide

@[simp] theorem headArity_haltTag : haltTag.headArity = 2 := rfl
@[simp] theorem headArity_haltCode : haltCode.headArity = 2 := rfl
@[simp] theorem headArity_freshHField (carrier : Term) :
    (freshHField carrier).headArity = 3 := rfl
@[simp] theorem headArity_markH (carrier : Term) :
    (markH carrier).headArity = 2 := rfl
@[simp] theorem headArity_seedCode (bits : List Bool) :
    (seedCode bits).headArity = 1 := rfl
@[simp] theorem headArity_seedField (bits : List Bool) (carrier : Term) :
    (Term.app (seedCode bits) carrier).headArity = 2 := rfl
@[simp] theorem headArity_dispatcherCode (actions : Term) (bits : List Bool) :
    (dispatcherCode actions bits).headArity = 2 := rfl
@[simp] theorem headArity_environmentCode (actions : Term) (bits : List Bool) :
    (environmentCode actions bits).headArity = 1 := rfl
@[simp] theorem headArity_freshLocal (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    (freshLocal actions bits continuation carrier).headArity = 6 := rfl
@[simp] theorem headArity_markedLocal (actions : Term) (bits : List Bool)
    (continuation carrier : Term) :
    (markedLocal actions bits continuation carrier).headArity = 5 := rfl

end PureSFormal.PureS
