import PureSFormal.PureS.Clock
import PureSFormal.Research.RootResetAccumulatorClassifier

/-!
# Progress-aware pure-S program code

This module instantiates the existing word, appender, action, dispatcher,
frame, and generator algebra with the Armed constructor
`P_i = S S L_i`.  It is the closed program-code layer required by the
delayed-close root-reset protocol.  The existing selected-path construction
is left unchanged.

Every newly encoded or appended bit is an Armed progress cell.  The proofs
below establish the exact two-contraction Push identity, the complete
`2 * length` appender reduction, the action reductions, the three-step frame
prefix, and the first generator contraction.  The initial word is certified
both by the progress-spine grammar and by the exact Open-address tracker.
-/

namespace PureSFormal.Research.RootResetProgressProgramCode

open PureSFormal.PureS

abbrev progressLive := RootResetDeletionGadget.progressLive

/-! ## Armed words -/

/-- A binary word whose cells are all Armed progress cells, front innermost. -/
def progressWord (bits : List Bool) : Term :=
  bits.foldl (fun predecessor bit =>
    RootResetProgressRoles.Gadget.source bit predecessor) omega

@[simp]
theorem progressWord_nil : progressWord [] = omega :=
  rfl

/-- Splitting a word continues to wrap its suffix around the initial word. -/
theorem progressWord_append (initial suffix : List Bool) :
    progressWord (initial ++ suffix) =
      suffix.foldl (fun predecessor bit =>
        RootResetProgressRoles.Gadget.source bit predecessor)
        (progressWord initial) := by
  have fold : ∀ (before : List Bool) (start : Term),
      (before ++ suffix).foldl (fun predecessor bit =>
        RootResetProgressRoles.Gadget.source bit predecessor) start =
      suffix.foldl (fun predecessor bit =>
        RootResetProgressRoles.Gadget.source bit predecessor)
        (before.foldl (fun predecessor bit =>
          RootResetProgressRoles.Gadget.source bit predecessor) start) := by
    intro before
    induction before with
    | nil => intro start; rfl
    | cons bit rest ih =>
        intro start
        exact ih (RootResetProgressRoles.Gadget.source bit start)
  exact fold initial omega

/-- Appending one rear bit creates one new outer Armed cell. -/
@[simp]
theorem progressWord_append_singleton (bits : List Bool) (bit : Bool) :
    progressWord (bits ++ [bit]) =
      RootResetProgressRoles.Gadget.source bit (progressWord bits) := by
  rw [progressWord_append]
  rfl

@[simp]
theorem progressWord_singleton (bit : Bool) :
    progressWord [bit] =
      RootResetProgressRoles.Gadget.source bit omega :=
  rfl

/-- The concrete two-symbol orientation is front innermost. -/
theorem progressWord_pair (front rear : Bool) :
    progressWord [front, rear] =
      RootResetProgressRoles.Gadget.source rear
        (RootResetProgressRoles.Gadget.source front omega) :=
  rfl

/-- Folding Armed constructors preserves the progress-spine derivation. -/
theorem progressDecodes_foldl
    (suffix : List Bool) {start : Term} {bits : List Bool} {opens : Nat}
    (inner : RootResetProgressSpine.Decodes start bits opens) :
    RootResetProgressSpine.Decodes
      (suffix.foldl (fun predecessor bit =>
        RootResetProgressRoles.Gadget.source bit predecessor) start)
      (bits ++ suffix) opens := by
  induction suffix generalizing start bits with
  | nil => simpa using inner
  | cons bit suffix ih =>
      have armed : RootResetProgressSpine.Decodes
          (RootResetProgressRoles.Gadget.source bit start)
          (bits ++ [bit]) opens :=
        RootResetProgressSpine.Decodes.armed bit inner
      have rest := ih armed
      simpa [List.append_assoc] using rest

/-- Every encoded input word is clean and decodes to the literal input. -/
theorem progressWord_decodes (bits : List Bool) :
    RootResetProgressSpine.Decodes (progressWord bits) bits 0 := by
  simpa [progressWord] using
    progressDecodes_foldl bits
      (start := omega) (bits := []) (opens := 0)
      RootResetProgressSpine.Decodes.endpoint

/-- Folding Armed constructors preserves the exact Open-address tracker. -/
theorem progressTracks_foldl
    (suffix : List Bool) {start : Term} {bits : List Bool}
    {addresses : List Address}
    (inner : RootResetAccumulatorClassifier.Tracks start bits addresses) :
    RootResetAccumulatorClassifier.Tracks
      (suffix.foldl (fun predecessor bit =>
        RootResetProgressRoles.Gadget.source bit predecessor) start)
      (bits ++ suffix)
      (suffix.foldl (fun prior _ =>
        RootResetAccumulatorClassifier.prefixAddresses [.right] prior)
        addresses) := by
  induction suffix generalizing start bits addresses with
  | nil => simpa using inner
  | cons bit suffix ih =>
      have armed : RootResetAccumulatorClassifier.Tracks
          (RootResetProgressRoles.Gadget.source bit start)
          (bits ++ [bit])
          (RootResetAccumulatorClassifier.prefixAddresses [.right]
            addresses) :=
        RootResetAccumulatorClassifier.Tracks.armed bit inner
      have rest := ih armed
      simpa [List.append_assoc] using rest

/-- Prefixing an empty address list leaves it empty. -/
@[simp]
theorem prefixAddresses_nil (path : Address) :
    RootResetAccumulatorClassifier.prefixAddresses path [] = [] :=
  rfl

/-- A fold of address-prefix operations still maps the empty list to empty. -/
@[simp]
theorem foldl_prefixAddresses_nil (bits : List Bool) :
    bits.foldl (fun prior _ =>
      RootResetAccumulatorClassifier.prefixAddresses [.right] prior) [] = [] := by
  induction bits with
  | nil => rfl
  | cons bit bits ih => simpa using ih

/-- The initial word contains no Open cell and tracks the literal input. -/
theorem progressWord_tracks (bits : List Bool) :
    RootResetAccumulatorClassifier.Tracks (progressWord bits) bits [] := by
  have tracked := progressTracks_foldl bits
    (start := omega) (bits := []) (addresses := [])
    RootResetAccumulatorClassifier.Tracks.endpoint
  simpa [progressWord] using tracked

@[simp]
theorem progressWord_decode (bits : List Bool) :
    RootResetProgressSpine.decode? (progressWord bits) =
      some ⟨bits, 0⟩ :=
  RootResetProgressSpine.decode?_complete (progressWord_decodes bits)

@[simp]
theorem progressWord_analyze (bits : List Bool) :
    RootResetAccumulatorClassifier.analyze? (progressWord bits) =
      some ⟨bits, []⟩ :=
  RootResetAccumulatorClassifier.analyze?_complete (progressWord_tracks bits)

/-! ## Progress-aware appenders -/

/-- Add one Armed progress cell outside the current accumulator. -/
def progressExtendAccumulator (bit : Bool) (before : Term) : Term :=
  RootResetProgressRoles.Gadget.source bit before

/-- The retained history made by one progress-aware Push. -/
def progressPushHistory (bit : Bool) (before : Term) : Term :=
  .app before (progressExtendAccumulator bit before)

/-- The ordinary Push program with `P_i`, rather than `L_i`, as constructor. -/
def progressAppender (bits : List Bool) : Term :=
  bits.foldr (fun bit next => push (progressLive bit) next) p

@[simp]
theorem progressAppender_nil : progressAppender [] = p :=
  rfl

@[simp]
theorem progressAppender_cons (bit : Bool) (bits : List Bool) :
    progressAppender (bit :: bits) =
      push (progressLive bit) (progressAppender bits) :=
  rfl

/-- The canonical accumulator after all progress-aware Push layers. -/
def progressAppenderAccumulator (bits : List Bool) (initial : Term) : Term :=
  bits.foldl (fun before bit => progressExtendAccumulator bit before) initial

@[simp]
theorem progressAppenderAccumulator_nil (initial : Term) :
    progressAppenderAccumulator [] initial = initial :=
  rfl

@[simp]
theorem progressAppenderAccumulator_cons
    (bit : Bool) (bits : List Bool) (initial : Term) :
    progressAppenderAccumulator (bit :: bits) initial =
      progressAppenderAccumulator bits
        (progressExtendAccumulator bit initial) :=
  rfl

theorem progressAppenderAccumulator_append
    (first second : List Bool) (initial : Term) :
    progressAppenderAccumulator (first ++ second) initial =
      progressAppenderAccumulator second
        (progressAppenderAccumulator first initial) := by
  induction first generalizing initial with
  | nil => rfl
  | cons bit rest ih => exact ih (progressExtendAccumulator bit initial)

@[simp]
theorem progressAppenderAccumulator_append_singleton
    (bits : List Bool) (bit : Bool) (initial : Term) :
    progressAppenderAccumulator (bits ++ [bit]) initial =
      progressExtendAccumulator bit
        (progressAppenderAccumulator bits initial) := by
  rw [progressAppenderAccumulator_append]
  rfl

/-- Histories in their literal final argument order. -/
def progressRetainedHistories : List Bool → Term → List Term
  | [], _ => []
  | bit :: bits, initial =>
      let next := progressExtendAccumulator bit initial
      progressRetainedHistories bits next ++
        [progressPushHistory bit initial]

@[simp]
theorem progressRetainedHistories_nil (initial : Term) :
    progressRetainedHistories [] initial = [] :=
  rfl

@[simp]
theorem progressRetainedHistories_cons
    (bit : Bool) (bits : List Bool) (initial : Term) :
    progressRetainedHistories (bit :: bits) initial =
      progressRetainedHistories bits
          (progressExtendAccumulator bit initial) ++
        [progressPushHistory bit initial] :=
  rfl

theorem progressRetainedHistories_length
    (bits : List Bool) (initial : Term) :
    (progressRetainedHistories bits initial).length = bits.length := by
  induction bits generalizing initial with
  | nil => rfl
  | cons bit bits ih =>
      simp [progressRetainedHistories, ih]

/-- The complete progress-aware appender endpoint. -/
def progressAppenderResult (bits : List Bool) (initial : Term) : Term :=
  Term.applyArgs (.app p (progressAppenderAccumulator bits initial))
    (progressRetainedHistories bits initial)

@[simp]
theorem progressAppenderResult_nil (initial : Term) :
    progressAppenderResult [] initial = .app p initial :=
  rfl

@[simp]
theorem progressAppenderResult_cons
    (bit : Bool) (bits : List Bool) (initial : Term) :
    progressAppenderResult (bit :: bits) initial =
      .app
        (progressAppenderResult bits
          (progressExtendAccumulator bit initial))
        (progressPushHistory bit initial) := by
  simp [progressAppenderResult, progressRetainedHistories,
    progressAppenderAccumulator, Term.applyArgs_append]

/-- The generic two-step Push identity with an Armed constructor. -/
theorem progressPush_twoSteps
    (bit : Bool) (next initial : Term) :
    StepsN 2 (.app (push (progressLive bit) next) initial)
      (.app
        (.app next (progressExtendAccumulator bit initial))
        (progressPushHistory bit initial)) := by
  simpa [progressLive, progressExtendAccumulator, progressPushHistory,
    RootResetProgressRoles.Gadget.source,
    RootResetDeletionGadget.source] using
      C5_push (progressLive bit) next initial

/-- A complete appender performs exactly two contractions per appended bit. -/
theorem progressAppender_reduces
    (bits : List Bool) (initial : Term) :
    StepsN (2 * bits.length) (.app (progressAppender bits) initial)
      (progressAppenderResult bits initial) := by
  induction bits generalizing initial with
  | nil => exact StepsN.refl _
  | cons bit bits ih =>
      let next : Term := progressExtendAccumulator bit initial
      let history : Term := progressPushHistory bit initial
      have first :
          StepsN 2 (.app (progressAppender (bit :: bits)) initial)
            (.app (.app (progressAppender bits) next) history) := by
        simpa [progressAppender, next, history] using
          progressPush_twoSteps bit (progressAppender bits) initial
      have remaining :
          StepsN (2 * bits.length)
            (.app (.app (progressAppender bits) next) history)
            (.app (progressAppenderResult bits next) history) := by
        exact StepsN.appLeft (ih next) history
      have combined := StepsN.trans first remaining
      have count : 2 * (bit :: bits).length = 2 + 2 * bits.length := by
        simp only [List.length_cons, Nat.mul_succ]
        exact Nat.add_comm _ _
      rw [count]
      simpa [next, history] using combined

/-- Appending Armed cells preserves a supplied progress-spine derivation. -/
theorem progressAppenderAccumulator_decodes
    (suffix : List Bool) {initial : Term} {bits : List Bool} {opens : Nat}
    (inner : RootResetProgressSpine.Decodes initial bits opens) :
    RootResetProgressSpine.Decodes
      (progressAppenderAccumulator suffix initial)
      (bits ++ suffix) opens := by
  simpa [progressAppenderAccumulator, progressExtendAccumulator] using
    progressDecodes_foldl suffix inner

/-- Appending Armed cells preserves the exact Open-address relation. -/
theorem progressAppenderAccumulator_tracks
    (suffix : List Bool) {initial : Term} {bits : List Bool}
    {addresses : List Address}
    (inner : RootResetAccumulatorClassifier.Tracks initial bits addresses) :
    RootResetAccumulatorClassifier.Tracks
      (progressAppenderAccumulator suffix initial)
      (bits ++ suffix)
      (suffix.foldl (fun prior _ =>
        RootResetAccumulatorClassifier.prefixAddresses [.right] prior)
        addresses) := by
  simpa [progressAppenderAccumulator, progressExtendAccumulator] using
    progressTracks_foldl suffix inner

/-! ## CTS actions and compiled dispatcher -/

/-- The action selected by a phase and the deleted bit. -/
def progressSelectedAction (program : CTS.Program) :
    ActionLabel program → Term
  | (_, false) => p
  | (phase, true) => progressAppender (program.appendant phase)

@[simp]
theorem progressSelectedAction_zero
    (program : CTS.Program) (phase : CTS.Phase program) :
    progressSelectedAction program (phase, false) = p :=
  rfl

@[simp]
theorem progressSelectedAction_one
    (program : CTS.Program) (phase : CTS.Phase program) :
    progressSelectedAction program (phase, true) =
      progressAppender (program.appendant phase) :=
  rfl

/-- The canonical accumulator selected by one completed action. -/
def progressActionAccumulator (program : CTS.Program) :
    ActionLabel program → Term → Term
  | (_, false), initial => initial
  | (phase, true), initial =>
      progressAppenderAccumulator (program.appendant phase) initial

/-- The retained histories selected by one completed action. -/
def progressActionHistories (program : CTS.Program) :
    ActionLabel program → Term → List Term
  | (_, false), _ => []
  | (phase, true), initial =>
      progressRetainedHistories (program.appendant phase) initial

/-- The complete selected-action endpoint. -/
def progressActionResult (program : CTS.Program)
    (label : ActionLabel program) (initial : Term) : Term :=
  Term.applyArgs (.app p (progressActionAccumulator program label initial))
    (progressActionHistories program label initial)

@[simp]
theorem progressActionAccumulator_zero
    (program : CTS.Program) (phase : CTS.Phase program) (initial : Term) :
    progressActionAccumulator program (phase, false) initial = initial :=
  rfl

@[simp]
theorem progressActionAccumulator_one
    (program : CTS.Program) (phase : CTS.Phase program) (initial : Term) :
    progressActionAccumulator program (phase, true) initial =
      progressAppenderAccumulator (program.appendant phase) initial :=
  rfl

@[simp]
theorem progressActionHistories_zero
    (program : CTS.Program) (phase : CTS.Phase program) (initial : Term) :
    progressActionHistories program (phase, false) initial = [] :=
  rfl

@[simp]
theorem progressActionHistories_one
    (program : CTS.Program) (phase : CTS.Phase program) (initial : Term) :
    progressActionHistories program (phase, true) initial =
      progressRetainedHistories (program.appendant phase) initial :=
  rfl

@[simp]
theorem progressActionResult_zero
    (program : CTS.Program) (phase : CTS.Phase program) (initial : Term) :
    progressActionResult program (phase, false) initial = .app p initial :=
  rfl

@[simp]
theorem progressActionResult_one
    (program : CTS.Program) (phase : CTS.Phase program) (initial : Term) :
    progressActionResult program (phase, true) initial =
      progressAppenderResult (program.appendant phase) initial :=
  rfl

/-- Exact action cost in strict pure-S contractions. -/
def progressActionCost (program : CTS.Program) :
    ActionLabel program → Nat
  | (_, false) => 0
  | (phase, true) => 2 * (program.appendant phase).length

/-- Execute either selected progress action to its explicit endpoint. -/
theorem progressExecuteAction
    (program : CTS.Program) (label : ActionLabel program) (initial : Term) :
    StepsN (progressActionCost program label)
      (.app (progressSelectedAction program label) initial)
      (progressActionResult program label initial) := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact StepsN.refl _
  | true =>
      simpa [progressActionCost] using
        progressAppender_reduces (program.appendant phase) initial

/-- Compile every finite dispatcher leaf with the progress-aware action. -/
def progressCompileActions (program : CTS.Program) :
    Dispatcher.Tree (ActionLabel program) → Term :=
  compileDispatcher (progressSelectedAction program)

@[simp]
theorem progressCompileActions_leaf
    (program : CTS.Program) (label : ActionLabel program) :
    progressCompileActions program (.leaf label) =
      leafCode (progressSelectedAction program label) :=
  rfl

@[simp]
theorem progressCompileActions_node
    (program : CTS.Program)
    (left right : Dispatcher.Tree (ActionLabel program)) :
    progressCompileActions program (.node left right) =
      nodeCode (progressCompileActions program left)
        (progressCompileActions program right) :=
  rfl

/-- Activating a compiled progress-action leaf takes one contraction. -/
theorem progressActionLeaf_activate
    (program : CTS.Program) (label : ActionLabel program) (carrier : Term) :
    StepsN 1
      (.app (progressCompileActions program (.leaf label)) carrier)
      (chosen carrier
        (.app (progressSelectedAction program label) carrier)) := by
  simpa using
    leafCode_activate (progressSelectedAction program label) carrier

/-! ## Progress-aware frame and generator code -/

/-- The input-dependent seed whose word uses only Armed progress cells. -/
def progressSeedCode (bits : List Bool) : Term :=
  .app .s (progressWord bits)

/-- The fixed activation field for a compiled progress dispatcher. -/
def progressActCode (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Term :=
  .app (.app .s haltCode) (progressCompileActions program tree)

/-- The progress dispatcher and input seed packaged as `D*`. -/
def progressDispatcherCode (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) : Term :=
  .app (.app .s (progressActCode program tree)) (progressSeedCode bits)

/-- The progress environment packaged as `E* = S D*`. -/
def progressEnvironmentCode (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) : Term :=
  .app .s (progressDispatcherCode program tree bits)

/-- The fresh response made by the three-contraction frame prefix. -/
def progressFreshLocal (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) : Term :=
  Term.applyArgs haltCode
    [carrier, .app (progressCompileActions program tree) carrier,
      .app (progressSeedCode bits) carrier, .app continuation carrier]

/-- The same progress response after its shallow status field is committed. -/
def progressMarkedLocal (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) : Term :=
  Term.applyArgs (markH carrier)
    [.app (progressCompileActions program tree) carrier,
      .app (progressSeedCode bits) carrier, .app continuation carrier]

/-- The closed outer generator carrying the progress-aware environment. -/
def progressGenerator (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) : Term :=
  .app (.app (C 0) (C 0))
    (progressEnvironmentCode program tree bits)

@[simp]
theorem headArity_progressSeedCode (bits : List Bool) :
    (progressSeedCode bits).headArity = 1 :=
  rfl

@[simp]
theorem headArity_progressDispatcherCode
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) :
    (progressDispatcherCode program tree bits).headArity = 2 :=
  rfl

@[simp]
theorem headArity_progressEnvironmentCode
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) :
    (progressEnvironmentCode program tree bits).headArity = 1 :=
  rfl

@[simp]
theorem headArity_progressFreshLocal
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (progressFreshLocal program tree bits continuation carrier).headArity = 6 :=
  rfl

@[simp]
theorem headArity_progressMarkedLocal
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (progressMarkedLocal program tree bits continuation carrier).headArity = 5 :=
  rfl

/-- COMMIT is the literal contraction at the fresh Local's shallow status field. -/
@[simp]
theorem contractAt?_progressFreshLocal_commit
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    (progressFreshLocal program tree bits continuation carrier).contractAt?
        [.left, .left, .left] =
      some (progressMarkedLocal program tree bits continuation carrier) := by
  rfl

/-- COMMIT is one contextual pure-S contraction and changes no other field. -/
theorem progressFreshLocal_step_markedLocal
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    Step (progressFreshLocal program tree bits continuation carrier)
      (progressMarkedLocal program tree bits continuation carrier) :=
  Term.contractAt?_sound
    (contractAt?_progressFreshLocal_commit program tree bits continuation carrier)

/-- The exact COMMIT script contains one strict contraction. -/
theorem progressFreshLocal_commit
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    StepsN 1 (progressFreshLocal program tree bits continuation carrier)
      (progressMarkedLocal program tree bits continuation carrier) :=
  StepsN.single
    (progressFreshLocal_step_markedLocal program tree bits continuation carrier)

/-- First frame-prefix contraction for the progress environment. -/
theorem progressFramePrefix_first
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    StepsN 1
      (frame (progressEnvironmentCode program tree bits) continuation carrier)
      (.app
        (.app (progressDispatcherCode program tree bits) carrier)
        (.app continuation carrier)) := by
  apply StepsN.single
  simpa [frame, progressEnvironmentCode, Term.redex, Term.contractum] using
    Step.root (progressDispatcherCode program tree bits) continuation carrier

/-- First two frame-prefix contractions for the progress environment. -/
theorem progressFramePrefix_second
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    StepsN 2
      (frame (progressEnvironmentCode program tree bits) continuation carrier)
      (.app
        (.app
          (.app (progressActCode program tree) carrier)
          (.app (progressSeedCode bits) carrier))
        (.app continuation carrier)) := by
  let afterFirst : Term :=
    .app
      (.app (progressDispatcherCode program tree bits) carrier)
      (.app continuation carrier)
  have first : StepsN 1
      (frame (progressEnvironmentCode program tree bits) continuation carrier)
      afterFirst := by
    simpa [afterFirst] using
      progressFramePrefix_first program tree bits continuation carrier
  have second : Step afterFirst
      (.app
        (.app
          (.app (progressActCode program tree) carrier)
          (.app (progressSeedCode bits) carrier))
        (.app continuation carrier)) := by
    simpa [afterFirst, progressDispatcherCode,
      Term.redex, Term.contractum] using
      Step.appLeft
        (Step.root (progressActCode program tree)
          (progressSeedCode bits) carrier)
        (.app continuation carrier)
  exact StepsN.tail first second

/-- The exact three-contraction frame prefix reaches a progress fresh Local. -/
theorem progressFramePrefix
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    StepsN 3
      (frame (progressEnvironmentCode program tree bits) continuation carrier)
      (progressFreshLocal program tree bits continuation carrier) := by
  let afterSecond : Term :=
    .app
      (.app
        (.app (progressActCode program tree) carrier)
        (.app (progressSeedCode bits) carrier))
      (.app continuation carrier)
  have firstTwo : StepsN 2
      (frame (progressEnvironmentCode program tree bits) continuation carrier)
      afterSecond := by
    simpa [afterSecond] using
      progressFramePrefix_second program tree bits continuation carrier
  have third : Step afterSecond
      (progressFreshLocal program tree bits continuation carrier) := by
    simpa [afterSecond, progressActCode, progressFreshLocal, Term.applyArgs,
      Term.redex, Term.contractum] using
      Step.appLeft
        (Step.appLeft
          (Step.root haltCode (progressCompileActions program tree) carrier)
          (.app (progressSeedCode bits) carrier))
        (.app continuation carrier)
  exact StepsN.tail firstTwo third

/-- The first generator contraction preserves the entire progress environment. -/
theorem progressGenerator_staging
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) :
    StepsN 1 (progressGenerator program tree bits)
      (.app (clockBase 0) (progressEnvironmentCode program tree bits)) := by
  simpa [progressGenerator] using
    StepsN.appLeft (clock_zero 0) (progressEnvironmentCode program tree bits)

end PureSFormal.Research.RootResetProgressProgramCode
