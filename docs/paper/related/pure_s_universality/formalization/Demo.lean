import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.SchedulerControl
import PureSFormal.PureS.PublicDecoder
import PureSFormal.Computation.DeterministicTapeCook
import PureSFormal.Research.RootResetPersistentResponseSelector

open PureSFormal
open PureSFormal.PureS

namespace PureSDemo

abbrev canonicalDispatcher (program : CTS.Program) :
    ActionDispatcher program :=
  BalancedActionTree.dispatcher program

def tinyProgram : CTS.Program :=
  ⟨2, by decide, fun phase => if phase.val = 0 then [true] else []⟩

structure Options where
  program : String := "tiny"
  word : Option String := none
  checkpoints : Nat := 3
  tape : Option String := none
  maxMicroticks : Nat := 100000000
  microtraceFirst : Bool := false
  contractionTrace : Option Nat := none
  rootResetCheck : Option Nat := none

def usage : String :=
  "usage: pure-s-demo --program tiny|fixed912 --word <bits> " ++
  "--checkpoints <n> [--tape <instance-file>] [--max-microticks <n>] " ++
  "[--microtrace-first] [--contraction-trace <n>] [--root-reset-check <n>]\n" ++
  "--microtrace-first prints and verifies the first tiny-program contraction\n" ++
  "--contraction-trace prints and verifies the first n successful contractions\n" ++
  "--root-reset-check compares the bare-term route-A selection with the real scheduler\n" ++
  "tape format: initial <state> input <bits> " ++
  "state <false-rule> <true-rule> ...; a rule is halt or <0|1>,<L|S|R>,<state>"

def requireSome (message : String) : Option α → Except String α
  | some value => pure value
  | none => throw message

def parseOptions : List String → Except String Options
  | [] => pure {}
  | "--program" :: value :: rest => do
      let options ← parseOptions rest
      pure { options with program := value }
  | "--word" :: value :: rest => do
      let options ← parseOptions rest
      pure { options with word := some value }
  | "--checkpoints" :: value :: rest => do
      let count ← requireSome s!"invalid checkpoint count: {value}" value.toNat?
      let options ← parseOptions rest
      pure { options with checkpoints := count }
  | "--tape" :: value :: rest => do
      let options ← parseOptions rest
      pure { options with tape := some value }
  | "--max-microticks" :: value :: rest => do
      let count ← requireSome s!"invalid microtick limit: {value}" value.toNat?
      let options ← parseOptions rest
      pure { options with maxMicroticks := count }
  | "--microtrace-first" :: rest => do
      let options ← parseOptions rest
      pure { options with microtraceFirst := true }
  | "--contraction-trace" :: value :: rest => do
      let count ← requireSome s!"invalid contraction count: {value}" value.toNat?
      let options ← parseOptions rest
      pure { options with contractionTrace := some count }
  | "--root-reset-check" :: value :: rest => do
      let count ← requireSome s!"invalid root-reset count: {value}" value.toNat?
      let options ← parseOptions rest
      pure { options with rootResetCheck := some count }
  | flag :: _ => throw s!"unknown or incomplete argument: {flag}"

def parseBit : Char → Except String Bool
  | '0' => pure false
  | '1' => pure true
  | character => throw s!"invalid bit: {character}"

def parseBits (text : String) : Except String (List Bool) :=
  text.toList.mapM parseBit

def bitText (bit : Bool) : String := if bit then "1" else "0"

def bitsText (bits : List Bool) : String :=
  String.mk (bits.map fun bit => if bit then '1' else '0')

def bitsJson (bits : List Bool) : String :=
  "[" ++ String.intercalate "," (bits.map bitText) ++ "]"

def termPrefixAux : Term → Nat → String × Nat
  | _, 0 => ("…", 0)
  | .s, remaining + 1 => ("S", remaining)
  | .app fn argument, remaining + 1 =>
      let (fnText, afterFn) := termPrefixAux fn remaining
      let (argumentText, afterArgument) := termPrefixAux argument afterFn
      ("A(" ++ fnText ++ "," ++ argumentText ++ ")", afterArgument)

def termPrefixWithNodes (term : Term) (nodes : Nat) : String :=
  ((termPrefixAux term nodes).1.take 200).toString

def termPrefix (term : Term) : String :=
  termPrefixWithNodes term 55

/-- Lossless prefix notation used only by the machine-readable contraction
trace.  Unlike the human-facing previews above, this contains every node, so
an independent checker can reconstruct the redex and its contractum. -/
def termFullPrefix (term : Term) : String :=
  (termPrefixAux term term.size).1

/- The opt-in microtrace uses stable indices in the scheduler's explicit
finite tables.  Each row is computed from the same transition function used
by the ordinary checkpoint demo. -/
def traceBoolText (value : Bool) : String := if value then "true" else "false"

def traceDirectionText : Direction → String
  | .left => "L"
  | .right => "R"

def tracePrimitiveText : Primitive → String
  | .L => "L"
  | .R => "R"
  | .U => "U"
  | .Rdx => "Rdx"

def traceNodeText : Probe.NodeKind → String
  | .s => "S"
  | .app => "app"

def traceIncomingText : Probe.Incoming → String
  | .root => "root"
  | .left => "L"
  | .right => "R"

def traceFrameDirection : ParentFrame → Direction
  | .left _ => .left
  | .right _ => .right

def traceAddress (cursor : Cursor) : String :=
  match cursor.parents.reverse with
  | [] => "ε"
  | frames =>
      String.intercalate ""
        (frames.map (traceDirectionText ∘ traceFrameDirection))

def traceAddressValue (address : Address) : String :=
  match address with
  | [] => "ε"
  | directions =>
      String.intercalate "" (directions.map traceDirectionText)

def traceFocusedSubtree (cursor : Cursor) : String :=
  if traceAddress cursor = "ε" then
    "T₀=A(A(C₀,C₀),R)"
  else if cursor.focus == .app (C 0) (C 0) then
    "A(C₀,C₀)"
  else if cursor.focus == C 0 then
    "C₀=A(A(S,b),b)"
  else if cursor.focus == .app .s b then
    "A(S,b)"
  else if cursor.focus == b then
    "b=A(S,S)"
  else if cursor.focus == .s then
    "S"
  else
    termPrefixWithNodes cursor.focus 28

def traceRegisters (registers : SchedulerControl.Registers program) : String :=
  "φ" ++ toString registers.phase.val ++ "/b" ++
    (match registers.bit with
    | none => "-"
    | some bit => bitText bit) ++
    "/s" ++ bitText registers.seen ++
    "/t" ++ bitText registers.tail ++
    "/e" ++ bitText registers.empty

def traceFindIndex [DecidableEq α] (value : α) (values : List α) : Nat :=
  values.findIdx (fun candidate => decide (candidate = value))

def traceControlText : SchedulerControl.Control program dispatcher → String
  | .macro mode registers =>
      "M" ++ toString (traceFindIndex mode
        (SchedulerControl.macroStates program dispatcher)) ++
        "[" ++ traceRegisters registers ++ "]"
  | .script job pc registers =>
      "S" ++ toString (traceFindIndex job
        (SchedulerControl.scriptJobStates program)) ++
        "." ++ toString pc.val ++
        "[" ++ traceRegisters registers ++ "]"
  | .probe kind pc registers =>
      "P" ++ toString (traceFindIndex kind
        (SchedulerControl.probeKindStates program dispatcher)) ++
        "." ++ toString (traceFindIndex pc.val
          (SchedulerControl.probeControl program dispatcher kind).nodes) ++
        "[" ++ traceRegisters registers ++ "]"

def traceRuntimeControlText :
    FiniteController.RuntimeControl
      (SchedulerControl.Control program dispatcher) → String
  | none => "REJECT"
  | some control => traceControlText control

def traceCommandText :
    FiniteController.Command
      (SchedulerControl.Control program dispatcher) → String
  | .stay next => "stay→" ++ traceControlText next
  | .exec primitive next =>
      tracePrimitiveText primitive ++ "→" ++ traceControlText next
  | .reject => "reject"

def firstMicrotraceLoop : Nat → Nat →
    FiniteController.Configuration
      (SchedulerControl.Control tinyProgram
        (canonicalDispatcher tinyProgram)) → IO Bool
  | 0, _, _ => do
      IO.eprintln "microtrace fuel exhausted before the first contraction"
      pure false
  | remaining + 1, tick, configuration => do
      let dispatcher := canonicalDispatcher tinyProgram
      let machine := SchedulerControl.machine tinyProgram dispatcher
      let node := Probe.observeNode configuration.cursor
      let incoming := Probe.observeIncoming configuration.cursor
      let commandText := match configuration.control with
        | none => "sink"
        | some control =>
            traceCommandText (machine.transition control node incoming)
      IO.println ("| " ++ toString tick ++ " | " ++
        traceRuntimeControlText configuration.control ++ " | " ++
        traceAddress configuration.cursor ++ " | " ++
        traceNodeText node ++ "/" ++ traceIncomingText incoming ++ " | " ++
        commandText ++ " | `" ++ traceFocusedSubtree configuration.cursor ++
        "` |")
      let mutation := FiniteController.mutationCount machine configuration
      let after := FiniteController.step machine configuration
      if mutation = 1 then
        match configuration.cursor.focus with
        | .app (.app (.app .s x) y) z =>
            let contractumMatches := Term.contractum x y z == after.cursor.focus
            let expectedArguments := x == b && y == b && z == C 0
            let expectedTick := tick == 49
            let expectedAddress := traceAddress configuration.cursor == "L"
            let addressPreserved :=
              traceAddress configuration.cursor == traceAddress after.cursor
            let verified := contractumMatches && expectedArguments &&
              expectedTick && expectedAddress && addressPreserved
            IO.println ""
            IO.println ("selected_address: " ++ traceAddress configuration.cursor)
            IO.println "focused_rule: A(A(A(S,X),Y),Z) → A(A(X,Z),A(Y,Z))"
            IO.println ("X: " ++ termPrefixWithNodes x 24)
            IO.println ("Y: " ++ termPrefixWithNodes y 24)
            IO.println ("Z: " ++ termPrefixWithNodes z 24)
            IO.println ("before_focus: " ++
              termPrefixWithNodes configuration.cursor.focus 48)
            IO.println ("after_focus:  " ++
              termPrefixWithNodes after.cursor.focus 48)
            IO.println "whole_term_step: A(A(C₀,C₀),R) → A(A(A(b,C₀),A(b,C₀)),R)"
            IO.println ("contractum_matches_after: " ++
              traceBoolText contractumMatches)
            IO.println ("expected_X_b_Y_b_Z_C0: " ++
              traceBoolText expectedArguments)
            IO.println ("expected_50_rows: " ++ traceBoolText expectedTick)
            IO.println ("expected_address_L: " ++ traceBoolText expectedAddress)
            IO.println ("address_preserved: " ++ traceBoolText addressPreserved)
            IO.println ("microtrace_match: " ++ traceBoolText verified)
            pure verified
        | _ => do
            IO.eprintln "the counted mutation was not focused on a saturated S-redex"
            pure false
      else
        firstMicrotraceLoop remaining (tick + 1) after

def runFirstMicrotrace (word : List Bool) : IO UInt32 := do
  let dispatcher := canonicalDispatcher tinyProgram
  let initial := SchedulerControl.initialConfiguration tinyProgram dispatcher word
  let initialShapeMatches := match initial.cursor.focus with
    | .app clock _ => clock == .app (C 0) (C 0)
    | .s => false
  IO.println "state_code: M=macro-table index; S=script-table index.pc; P=probe-kind index.probe-pc index"
  IO.println "state_legend: M0=CLOCK; M7=CLOCK.grow; S0=clockEnter; S2=clockZero; P0=clockSuccessor; P1=clockZero"
  IO.println "registers: φ=phase; b=front-bit register; s=seen; t=tail; e=empty"
  IO.println "term_legend: b=A(S,S); C₀=A(A(S,b),b); T₀=A(A(C₀,C₀),R), with R the exact right child of the encoded term"
  IO.println ("initial_shape_matches: " ++ traceBoolText initialShapeMatches)
  IO.println "| tick | finite-control state | address | observation | command | focused subtree |"
  IO.println "|---:|---|---|---|---|---|"
  let redexVerified ← firstMicrotraceLoop 1000 0 initial
  let verified := initialShapeMatches && redexVerified
  IO.println ("complete_microtrace_match: " ++ traceBoolText verified)
  if verified then pure 0 else pure 1

/- The runtime term shares immutable subtrees.  This parallel zipper caches
the exact unfolded size at every node, so reporting a checkpoint size does
not unfold duplicated subtrees. -/
inductive SizedTerm where
  | s
  | app (size : Nat) (fn argument : SizedTerm)

namespace SizedTerm

def nodeSize : SizedTerm → Nat
  | .s => 1
  | .app size _ _ => size

def mkApp (fn argument : SizedTerm) : SizedTerm :=
  .app (fn.nodeSize + argument.nodeSize + 1) fn argument

def contractRoot? : SizedTerm → Option SizedTerm
  | .app _ (.app _ (.app _ .s x) y) z =>
      some (mkApp (mkApp x z) (mkApp y z))
  | _ => none

end SizedTerm

inductive SizeTask where
  | visit (term : Term)
  | combine

def buildSized : Nat → List SizeTask → List SizedTerm → Option SizedTerm
  | _, [], [result] => some result
  | 0, _, _ => none
  | fuel + 1, .visit .s :: tasks, results =>
      buildSized fuel tasks (.s :: results)
  | fuel + 1, .visit (.app fn argument) :: tasks, results =>
      buildSized fuel
        (.visit fn :: .visit argument :: .combine :: tasks) results
  | fuel + 1, .combine :: tasks, argument :: fn :: results =>
      buildSized fuel tasks (SizedTerm.mkApp fn argument :: results)
  | _, _, _ => none

inductive SizedParentFrame where
  | left (rightSibling : SizedTerm)
  | right (leftSibling : SizedTerm)

namespace SizedParentFrame

def fill : SizedParentFrame → SizedTerm → SizedTerm
  | .left rightSibling, focus => SizedTerm.mkApp focus rightSibling
  | .right leftSibling, focus => SizedTerm.mkApp leftSibling focus

end SizedParentFrame

structure SizedCursor where
  focus : SizedTerm
  parents : List SizedParentFrame

namespace SizedCursor

def atRoot? (fuel : Nat) (term : Term) : Option SizedCursor := do
  let sized ← buildSized fuel [.visit term] []
  pure ⟨sized, []⟩

def left? : SizedCursor → Option SizedCursor
  | ⟨.app _ fn argument, parents⟩ =>
      some ⟨fn, .left argument :: parents⟩
  | ⟨.s, _⟩ => none

def right? : SizedCursor → Option SizedCursor
  | ⟨.app _ fn argument, parents⟩ =>
      some ⟨argument, .right fn :: parents⟩
  | ⟨.s, _⟩ => none

def up? : SizedCursor → Option SizedCursor
  | ⟨_, []⟩ => none
  | ⟨focus, frame :: parents⟩ => some ⟨frame.fill focus, parents⟩

def rdx? (cursor : SizedCursor) : Option SizedCursor := do
  let focus ← cursor.focus.contractRoot?
  pure { cursor with focus }

def exec (primitive : Primitive) (cursor : SizedCursor) : Option SizedCursor :=
  match primitive with
  | .L => cursor.left?
  | .R => cursor.right?
  | .U => cursor.up?
  | .Rdx => cursor.rdx?

def rootSize (cursor : SizedCursor) : Nat :=
  cursor.parents.foldl (fun size frame =>
    match frame with
    | .left rightSibling => size + rightSibling.nodeSize + 1
    | .right leftSibling => leftSibling.nodeSize + size + 1)
    cursor.focus.nodeSize

end SizedCursor

def stepSized (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (configuration : FiniteController.Configuration
      (SchedulerControl.Control program dispatcher))
    (cursor : SizedCursor) : SizedCursor :=
  match configuration.control with
  | none => cursor
  | some control =>
      match (SchedulerControl.machine program dispatcher).transition control
          (Probe.observeNode configuration.cursor)
          (Probe.observeIncoming configuration.cursor) with
      | .exec primitive _ => (cursor.exec primitive).getD cursor
      | _ => cursor

/-! ## Contraction-by-contraction trace -/

/-- Human-facing name for each contraction in the first tiny-program
checkpoint.  The ranges are the exact summands of `checkpointTime_one`. -/
def contractionOperation (programName : String) (index : Nat) : String :=
  if programName != "tiny" then
    "scheduler-contraction"
  else if index = 1 then
    "enter-stage"
  else if index <= 3 then
    "expand-stage-one"
  else if index <= 11 then
    "launch-one-step-job"
  else if index = 12 then
    "consume-front-cell"
  else if index <= 15 then
    "expose-branch-table"
  else if index <= 20 then
    "select-route-0-1"
  else if index <= 22 then
    "append-one"
  else
    "later-scheduler-contraction"

/-- Execute the real controller and emit one machine-readable row for each
successful focused contraction. -/
def contractionTraceLoop (programName : String) (program : CTS.Program)
    (wanted : Nat) :
    Nat → Nat → Nat → SizedCursor →
      FiniteController.Configuration
        (SchedulerControl.Control program (canonicalDispatcher program)) →
      IO Bool
  | 0, _, found, _, _ => do
      IO.eprintln s!"microtick limit reached after {found} traced contractions"
      pure false
  | remaining + 1, tick, found, sized, configuration => do
      if found = wanted then
        pure true
      else
        let dispatcher := canonicalDispatcher program
        let machine := SchedulerControl.machine program dispatcher
        let mutation := FiniteController.mutationCount machine configuration
        let sizedAfter := stepSized program dispatcher configuration sized
        let after := FiniteController.step machine configuration
        if mutation = 1 then
          let index := found + 1
          match configuration.cursor.focus with
          | .app (.app (.app .s x) y) z =>
              let contractumMatches :=
                Term.contractum x y z == after.cursor.focus
              let addressPreserved :=
                traceAddress configuration.cursor == traceAddress after.cursor
              let verified := contractumMatches && addressPreserved
              let beforeFocus := termFullPrefix configuration.cursor.focus
              let afterFocus := termFullPrefix after.cursor.focus
              IO.println ("{\"trace\":\"contraction\",\"index\":" ++
                toString index ++ ",\"microtick\":" ++ toString tick ++
                ",\"address\":\"" ++ traceAddress configuration.cursor ++
                "\",\"after_address\":\"" ++ traceAddress after.cursor ++
                "\",\"operation\":\"" ++
                contractionOperation programName index ++
                "\",\"control\":\"" ++
                traceRuntimeControlText configuration.control ++
                "\",\"x\":\"" ++ termFullPrefix x ++
                "\",\"y\":\"" ++ termFullPrefix y ++
                "\",\"z\":\"" ++ termFullPrefix z ++
                "\",\"before_focus\":\"" ++ beforeFocus ++
                "\",\"after_focus\":\"" ++ afterFocus ++
                "\",\"before_size\":" ++ toString sized.rootSize ++
                ",\"after_size\":" ++ toString sizedAfter.rootSize ++
                ",\"saturated\":true,\"contractum_match\":" ++
                traceBoolText contractumMatches ++
                ",\"address_preserved\":" ++
                traceBoolText addressPreserved ++ "}")
              if verified then
                contractionTraceLoop programName program wanted remaining
                  (tick + 1) index sizedAfter after
              else
                pure false
          | _ => do
              IO.eprintln "a counted mutation was not focused on a saturated S-redex"
              pure false
        else
          contractionTraceLoop programName program wanted remaining
            (tick + 1) found sizedAfter after

/-- Entry point for the contraction trace.  The size zipper is built once;
each emitted size is the exact unfolded occurrence-tree size. -/
def runContractionTrace (programName : String) (program : CTS.Program)
    (word : List Bool) (wanted maxMicroticks : Nat) : IO UInt32 := do
  let dispatcher := canonicalDispatcher program
  let initial := SchedulerControl.initialConfiguration program dispatcher word
  let sizeBuildFuel := 20000000 + 40 * word.length
  let initialSized ← match SizedCursor.atRoot? sizeBuildFuel initial.cursor.erase with
    | some sized => pure sized
    | none =>
        IO.eprintln "exact-size cache construction exhausted its structural bound"
        return 2
  let verified ← contractionTraceLoop programName program wanted
    maxMicroticks 0 0 initialSized initial
  IO.println ("{\"trace\":\"summary\",\"requested\":" ++
    toString wanted ++ ",\"verified\":" ++ traceBoolText verified ++ "}")
  if verified then pure 0 else pure 1

/-! ## Persistent-scheduler/root-reset differential -/

def rootResetStageText
    {program : CTS.Program}
    (classification :
      PureSFormal.Research.RootResetPersistentResponseSelector.Classification program) :
    String :=
  match classification.origin with
  | .freshDispatcher => "response:freshDispatcher"
  | .responseCarrier => "response:carrier"
  | .responseBoundary => "response:boundary"
  | .markedHandoff => "response:markedHandoff"
  | .responseAppender => "response:nestedAppender"
  | .dispatcher => "response:dispatcher"
  | .selectedAction => "response:selectedAction"
  | .appender => "response:appender"
  | .activatedRoute => "response:activatedRoute"
  | .base =>
      match classification.base.fuel with
      | some fuel =>
          match fuel.stage with
          | .preC4 _ => "fuel:preC4"
          | .postC4 _ _ => "fuel:postC4"
          | .empty _ => "fuel:empty"
      | none =>
          match classification.base.route.endpoint with
          | none => "unregistered"
          | some endpoint => reprStr endpoint.stage
  | .none => "unregistered"

def traceOneLine (text : String) : String :=
  String.map (fun character =>
    if character = '\n' || character = '\r' then ' ' else character) text

/-- Structural carrier layers used by the root-reset development differential. -/
def carrierLayerTrace
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Nat → Term → List String
  | 0, _ => ["depth-limit"]
  | depth + 1, term =>
      match CheckpointDecoder.parseBase? (compileActions program tree) term with
      | some view => "Base" :: carrierLayerTrace program tree depth view.queue
      | none =>
          match CheckpointDecoder.parseLocal? program tree term with
          | some view =>
              ("Local(" ++ toString view.label.1.val ++ ":" ++
                (if view.label.2 then "1" else "0") ++ ":" ++
                reprStr view.status ++ ")") ::
                carrierLayerTrace program tree depth view.accumulator
          | none =>
              match CanonicalStep.parseCell? term with
              | some (.live bit predecessor) =>
                  ("Live(" ++ (if bit then "1" else "0") ++ ")") ::
                    carrierLayerTrace program tree depth predecessor
              | some (.tombstone bit predecessor) =>
                  ("Tombstone(" ++ (if bit then "1" else "0") ++ ")") ::
                    carrierLayerTrace program tree depth predecessor
              | none => if term = omega then ["Omega"] else ["unparsed"]

/-- Preorder redex addresses used only by the root-reset differential. -/
def redexAddresses : Term → List Address
  | .s => []
  | term@(.app left right) =>
      (if term.contractRoot?.isSome then [[]] else []) ++
        (redexAddresses left).map (fun address => .left :: address) ++
        (redexAddresses right).map (fun address => .right :: address)

/-- At every successful scheduler contraction, compare the address and
contractum reconstructed solely from the bare current term with the actual
persistent-cursor contraction.  This executable differential is a development
guard for the global path-identity proof. -/
def rootResetCheckLoop (programName : String) (program : CTS.Program)
    (wanted : Nat) :
    Nat → Nat → Nat → Bool →
      FiniteController.Configuration
        (SchedulerControl.Control program (canonicalDispatcher program)) →
      IO Bool
  | 0, _, found, _, _ => do
      IO.eprintln s!"microtick limit reached after {found} root-reset checks"
      pure false
  | remaining + 1, tick, found, validSoFar, configuration => do
      if found = wanted then
        pure validSoFar
      else
        let dispatcher := canonicalDispatcher program
        let machine := SchedulerControl.machine program dispatcher
        let mutation := FiniteController.mutationCount machine configuration
        let after := FiniteController.step machine configuration
        if mutation = 1 then
          let source := configuration.cursor.erase
          let target := after.cursor.erase
          let classification :=
            PureSFormal.Research.RootResetPersistentResponseSelector.classify
              program dispatcher source
          IO.eprintln ("base-debug|" ++ toString (found + 1) ++ "|fuel=" ++
            (match classification.base.fuel with
            | none => "none"
            | some fuel =>
                match fuel.stage with
                | .preC4 _ => "preC4"
                | .postC4 _ _ => "postC4"
                | .empty _ => "empty") ++ "|route=" ++
            (match classification.base.route.endpoint with
            | none => "none"
            | some endpoint => traceOneLine (reprStr endpoint.stage)) ++
            "|roles=" ++ traceOneLine (reprStr
              (PureSFormal.Research.RootResetPersistentRouteA.activeContext
                program dispatcher source).roles) ++
            "|pending-before-fresh=" ++ reprStr
              (PureSFormal.Research.RootResetPersistentResponseSelector.pendingBeforeFresh?
                (PureSFormal.Research.RootResetPersistentRouteA.activeContext
                  program dispatcher source).roles) ++
            "|selected=" ++
            (match classification.base.selected? with
            | none => "none"
            | some selected => traceAddressValue selected.address) ++
            "|response=" ++
            (match PureSFormal.Research.RootResetPersistentResponseSelector.freshResponseRoot?
                program dispatcher source with
            | none => "none"
            | some pair =>
                traceAddressValue pair.1 ++ ":" ++
                (match PureSFormal.Research.RootResetWholeAppenderStages.parseActive?
                    program dispatcher.tree pair.2 with
                | none => "no-appender"
                | some view =>
                    match view.row with
                    | .secondFinal _ _ accumulator _ _ =>
                        "secondFinal:" ++
                        reprStr (PureSFormal.Research.RootResetPersistentResponseSelector.carrierLocalCount?
                          program dispatcher.tree accumulator) ++ ":" ++
                        reprStr (PureSFormal.Research.RootResetPersistentResponseSelector.carrierTombstoneCount?
                          program dispatcher.tree accumulator)
                    | _ => reprStr view.row.stage)))
          match classification.selected? with
          | none =>
              IO.eprintln s!"root-reset selector returned none at contraction {found + 1}"
              IO.eprintln s!"persistent address: {traceAddress configuration.cursor}"
              IO.eprintln s!"classified stage: {rootResetStageText classification}"
              IO.eprintln s!"active address: {traceAddressValue classification.base.fuelOuter.address}"
              let responseOuter :=
                PureSFormal.Research.RootResetPersistentResponseSelector.responseOuter
                  program dispatcher source
              IO.eprintln s!"response outer address: {traceAddressValue responseOuter.address}"
              let boundaryOuter :=
                PureSFormal.Research.RootResetPersistentResponseSelector.responseBoundaryOuter
                  program dispatcher source
              IO.eprintln s!"boundary outer address: {traceAddressValue boundaryOuter.address}"
              IO.eprintln s!"boundary active parse: {match
                PureSFormal.Research.RootResetResponseBoundaryStages.parseActive?
                  program dispatcher.tree boundaryOuter.active with
                | none => "none"
                | some view => reprStr view.stage}"
              IO.eprintln s!"fresh dispatcher syntax: {
                PureSFormal.Research.RootResetPersistentResponseSelector.parseFreshDispatcherCall?
                  program dispatcher.tree responseOuter.active}"
              IO.eprintln s!"fresh dispatcher checked: {match
                PureSFormal.Research.RootResetPersistentResponseSelector.freshDispatcherSelection?
                  program dispatcher source with
                | none => "none"
                | some selection => traceAddressValue selection.address}"
              let core :=
                PureSFormal.Research.RootResetWholeStageClassifier.classifyActive
                  program dispatcher.tree classification.base.route.outer.history
                  classification.base.route.outer.active
              IO.eprintln s!"raw core stage: {reprStr core.stage}"
              IO.eprintln s!"raw core child: {match core.canonicalChildAddress with
                | none => "none"
                | some address => traceAddressValue address}"
              let dispatcherView :=
                PureSFormal.Research.RootResetWholeDispatcherStages.parse?
                  program dispatcher source
              IO.eprintln s!"whole dispatcher: {match dispatcherView with
                | none => "none"
                | some view => reprStr view.stage ++ " @ " ++
                    traceAddressValue view.redexAddress}"
              let appenderView :=
                PureSFormal.Research.RootResetWholeAppenderStages.parse?
                  program dispatcher.tree source
              IO.eprintln s!"whole appender: {match appenderView with
                | none => "none"
                | some view => reprStr view.stage ++ " @ " ++
                    traceAddressValue view.focusAddress}"
              let responseView :=
                PureSFormal.Research.RootResetResponseBoundaryStages.parse?
                  program dispatcher.tree source
              IO.eprintln s!"response boundary: {match responseView with
                | none => "none"
                | some view => reprStr view.endpoint.stage ++ " commit @ " ++
                    traceAddressValue view.commitAddress}"
              IO.eprintln s!"first redexes: {String.intercalate "," <|
                (redexAddresses source |>.take 32 |>.map traceAddressValue)}"
              let persistentAddress :=
                PureSFormal.Research.RootResetSelectorContract.cursorAddress
                  configuration.cursor
              IO.eprintln
                (s!"redex count/rank: {(redexAddresses source).length}/" ++
                  s!"{(redexAddresses source).findIdx (fun address =>
                    decide (address = persistentAddress))}")
              rootResetCheckLoop programName program wanted remaining
                (tick + 1) (found + 1) false after
          | some selection =>
              let address := selection.address
              let addressMatch :=
                traceAddressValue address = traceAddress configuration.cursor
              let targetMatch := selection.target = target &&
                source.contractAt? address = some target
              IO.println ("{\"trace\":\"root-reset\",\"index\":" ++
                toString (found + 1) ++ ",\"microtick\":" ++ toString tick ++
                ",\"stage\":\"" ++ rootResetStageText classification ++
                "\",\"selected\":\"" ++ traceAddressValue address ++
                "\",\"persistent\":\"" ++ traceAddress configuration.cursor ++
                "\",\"address_match\":" ++ traceBoolText addressMatch ++
                ",\"target_match\":" ++ traceBoolText targetMatch ++ "}")
              if !addressMatch then
                IO.eprintln s!"mismatch-index: {found + 1}"
                IO.eprintln s!"mismatch-addresses: selected={traceAddressValue address} persistent={traceAddress configuration.cursor} origin={reprStr classification.origin}"
                let responseOuter :=
                  PureSFormal.Research.RootResetPersistentResponseSelector.responseOuter
                    program dispatcher source
                IO.eprintln s!"mismatch response outer: {traceAddressValue responseOuter.address}"
                IO.eprintln s!"mismatch response history: {String.intercalate "," <|
                  responseOuter.history.map (fun view =>
                    toString view.label.1.val ++ ":" ++
                      (if view.label.2 then "1" else "0") ++ ":" ++
                      reprStr view.status)}"
                IO.eprintln s!"mismatch response carrier: {match responseOuter.active with
                  | .app (.app (.app haltField _) _) _ =>
                      match PureSFormal.Research.RootResetWholeDispatcherStages.parseFreshHalt?
                          haltField with
                      | none => "not-fresh"
                      | some carrier =>
                          match CheckpointDecoder.decodeCarrier? program
                              dispatcher.tree carrier with
                          | none => "undecoded"
                          | some queue => reprStr queue
                  | _ => "not-shell"}"
                IO.eprintln s!"mismatch response carrier parse: {match responseOuter.active with
                  | .app (.app (.app haltField _) _) _ =>
                      match PureSFormal.Research.RootResetWholeDispatcherStages.parseFreshHalt?
                          haltField with
                      | none => "not-fresh"
                      | some carrier =>
                          "phase=" ++ reprStr
                            (PureSFormal.Research.RootResetPersistentResponseSelector.carrierPhase?
                              program dispatcher.tree carrier) ++
                            " / deleted=" ++ reprStr
                            (PureSFormal.Research.RootResetPersistentResponseSelector.deletedFrontBit?
                              program dispatcher.tree carrier) ++
                            " / layers=" ++ String.intercalate ">"
                              (carrierLayerTrace program dispatcher.tree 24 carrier)
                  | _ => "not-shell"}"
                IO.eprintln s!"mismatch response accumulator: {match
                  CheckpointDecoder.parseLocal? program dispatcher.tree responseOuter.active with
                  | none => "not-local"
                  | some view =>
                      "queue=" ++ reprStr
                        (CheckpointDecoder.decodeCarrier? program dispatcher.tree
                          view.accumulator) ++
                        " / layers=" ++ String.intercalate ">"
                          (carrierLayerTrace program dispatcher.tree 24 view.accumulator)}"
                IO.eprintln s!"mismatch control registers: {match configuration.control with
                  | none => "reject"
                  | some (.macro _ registers) =>
                      toString registers.phase.val ++ ":" ++ reprStr registers.bit
                  | some (.script _ _ registers) =>
                      toString registers.phase.val ++ ":" ++ reprStr registers.bit
                  | some (.probe _ _ registers) =>
                      toString registers.phase.val ++ ":" ++ reprStr registers.bit}"
                IO.eprintln s!"mismatch route outer: {
                  traceAddressValue classification.base.route.outer.address}"
                IO.eprintln s!"mismatch fuel outer: {
                  traceAddressValue classification.base.fuelOuter.address}"
                let boundaryOuter :=
                  PureSFormal.Research.RootResetPersistentResponseSelector.responseBoundaryOuter
                    program dispatcher source
                IO.eprintln s!"mismatch boundary outer: {traceAddressValue boundaryOuter.address}"
                IO.eprintln s!"mismatch boundary parse: {match
                  PureSFormal.Research.RootResetResponseBoundaryStages.parseActive?
                    program dispatcher.tree boundaryOuter.active with
                  | none => "none"
                  | some view => reprStr view.stage}"
                IO.eprintln s!"mismatch fresh response root: {match
                  PureSFormal.Research.RootResetPersistentResponseSelector.freshResponseRoot?
                    program dispatcher source with
                  | none => "none"
                  | some pair => traceAddressValue pair.1 ++ " / " ++
                      (match PureSFormal.Research.RootResetResponseBoundaryStages.parseActive?
                          program dispatcher.tree pair.2 with
                        | none => "not-boundary"
                        | some view => reprStr view.stage) ++ " / " ++
                      (match PureSFormal.Research.RootResetWholeAppenderStages.parseActive?
                          program dispatcher.tree pair.2 with
                        | none => "not-appender"
                        | some view => reprStr view.row.stage ++ " @ " ++
                            traceAddressValue view.focusAddress)}"
                IO.eprintln s!"mismatch response local carrier: {match
                  PureSFormal.Research.RootResetPersistentResponseSelector.freshResponseRoot?
                    program dispatcher source with
                  | none => "no-response"
                  | some pair =>
                      match CheckpointDecoder.parseLocal? program dispatcher.tree pair.2 with
                      | none => "not-local"
                      | some view =>
                          let localCount :=
                            PureSFormal.Research.RootResetPersistentResponseSelector.carrierLocalCount?
                              program dispatcher.tree view.accumulator
                          let tombstoneCount :=
                            PureSFormal.Research.RootResetPersistentResponseSelector.carrierTombstoneCount?
                              program dispatcher.tree view.accumulator
                          let firstLive :=
                            PureSFormal.Research.RootResetPersistentResponseSelector.carrierFirstLiveAddress?
                              program dispatcher.tree view.accumulator
                          "status=" ++ reprStr view.status ++
                            " / route=" ++ reprStr view.route ++
                            " / label=" ++ toString view.label.1.val ++ ":" ++
                              (if view.label.2 then "1" else "0") ++
                            " / locals=" ++ reprStr localCount ++
                            " / tombstones=" ++ reprStr tombstoneCount ++
                            " / first-live=" ++
                              (match firstLive with
                              | none => "none"
                              | some address => traceAddressValue address)}"
                IO.eprintln s!"mismatch nested appender selection: {match
                  PureSFormal.Research.RootResetPersistentResponseSelector.responseAppenderSelection?
                    program dispatcher source with
                  | none => "none"
                  | some selection => traceAddressValue selection.address}"
                IO.eprintln s!"mismatch nested appender candidate: {match
                  PureSFormal.Research.RootResetPersistentResponseSelector.responseAppenderAddress?
                    program dispatcher source with
                  | none => "none"
                  | some address => traceAddressValue address ++ " / " ++
                      (match source.contractAt? address with
                        | none => "not-redex"
                        | some _ => "redex")}"
                IO.eprintln s!"mismatch nested appender accumulator: {match
                  PureSFormal.Research.RootResetPersistentResponseSelector.freshResponseRoot?
                    program dispatcher source with
                  | none => "no-response"
                  | some pair =>
                      match PureSFormal.Research.RootResetWholeAppenderStages.parseActive?
                          program dispatcher.tree pair.2 with
                      | some view =>
                          match view.row with
                          | .secondFinal _ _ accumulator _ _ =>
                              let localCount :=
                                PureSFormal.Research.RootResetPersistentResponseSelector.carrierLocalCount?
                                  program dispatcher.tree accumulator
                              let tombstoneCount :=
                                PureSFormal.Research.RootResetPersistentResponseSelector.carrierTombstoneCount?
                                  program dispatcher.tree accumulator
                              let firstLive :=
                                PureSFormal.Research.RootResetPersistentResponseSelector.carrierFirstLiveAddress?
                                  program dispatcher.tree accumulator
                              let stage :=
                                match PureSFormal.Research.RootResetAccumulatorClassifier.classify?
                                    accumulator with
                                | none => "none"
                                | some classified => reprStr classified.stage
                              stage ++ " / locals=" ++ reprStr localCount ++
                                " / tombstones=" ++ reprStr tombstoneCount ++
                                " / first-live=" ++
                                  (match firstLive with
                                  | none => "none"
                                  | some address => traceAddressValue address)
                          | _ => "not-final"
                      | none => "no-appender"}"
                IO.eprintln s!"mismatch fresh syntax: {
                  PureSFormal.Research.RootResetPersistentResponseSelector.parseFreshDispatcherCall?
                    program dispatcher.tree responseOuter.active}"
                IO.eprintln s!"mismatch active preview: {termPrefixWithNodes responseOuter.active 120}"
              if addressMatch && targetMatch then
                rootResetCheckLoop programName program wanted remaining
                  (tick + 1) (found + 1) validSoFar after
              else
                rootResetCheckLoop programName program wanted remaining
                  (tick + 1) (found + 1) false after
        else
          rootResetCheckLoop programName program wanted remaining (tick + 1)
            found validSoFar after

def runRootResetCheck (programName : String) (program : CTS.Program)
    (word : List Bool) (wanted maxMicroticks : Nat) : IO UInt32 := do
  let dispatcher := canonicalDispatcher program
  let initial := SchedulerControl.initialConfiguration program dispatcher word
  let verified ← rootResetCheckLoop programName program wanted maxMicroticks
    0 0 true initial
  IO.println ("{\"trace\":\"root-reset-summary\",\"requested\":" ++
    toString wanted ++ ",\"verified\":" ++ traceBoolText verified ++ "}")
  if verified then pure 0 else pure 1

abbrev TapeDirection :=
  PureSFormal.Research.ProtectedTrieMachine.Direction

abbrev TapeRule :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Rule

abbrev TapeStateRow :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.StateRow

abbrev TapeInstance :=
  PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Instance

def splitFields (text : String) : List String :=
  (text.splitToList fun character =>
      character = ' ' || character = '\n' || character = '\r' ||
        character = '\t').filter (fun field => !field.isEmpty)

def parseRule (text : String) : Except String (Option TapeRule) := do
  if text = "halt" then
    pure none
  else
    match text.splitToList (fun character => character = ',') with
    | [writeText, moveText, stateText] =>
        let write ← match writeText with
          | "0" => pure false
          | "1" => pure true
          | _ => throw s!"invalid write bit in rule: {text}"
        let move ← match moveText with
          | "L" => pure PureSFormal.Research.ProtectedTrieMachine.Direction.left
          | "S" => pure PureSFormal.Research.ProtectedTrieMachine.Direction.stay
          | "R" => pure PureSFormal.Research.ProtectedTrieMachine.Direction.right
          | _ => throw s!"invalid head move in rule: {text}"
        let nextState ← requireSome s!"invalid next state in rule: {text}"
          stateText.toNat?
        pure (some { write, move, nextState })
    | _ => throw s!"invalid rule: {text}"

def parseStateRows : List String → Except String (List TapeStateRow)
  | [] => pure []
  | "state" :: falseText :: trueText :: rest => do
      let onFalse ← parseRule falseText
      let onTrue ← parseRule trueText
      let rows ← parseStateRows rest
      pure ({ onFalse, onTrue } :: rows)
  | _ => throw "expected: state <false-rule> <true-rule>"

def parseTapeInstance (text : String) : Except String TapeInstance := do
  match splitFields text with
  | "initial" :: stateText :: "input" :: inputText :: rest =>
      let initialState ← requireSome s!"invalid initial state: {stateText}"
        stateText.toNat?
      let input ← parseBits inputText
      let states ← parseStateRows rest
      if states.isEmpty then
        throw "the tape instance must contain at least one state"
      else
        pure { machine := { states }, initialState, input }
  | _ => throw "expected tape header: initial <state> input <bits>"

structure LoopResult where
  matched : Bool
  checkpoints : Nat
  exhausted : Bool

def emitCheckpoint (programName : String) (program : CTS.Program)
    (word : List Bool) (contraction horizon : Nat) (config : CTS.Config program)
    (termSize : Nat) : IO Bool := do
  let expected := CTS.iterate program horizon (CTS.initial program word)
  let isMatch := config = expected
  IO.println ("{\"program\":\"" ++ programName ++ "\",\"word\":\"" ++
    bitsText word ++ "\",\"contraction\":" ++ toString contraction ++
    ",\"horizon\":" ++ toString horizon ++
    ",\"phase\":" ++ toString config.phase.val ++
    ",\"data\":" ++ bitsJson config.data ++
    ",\"expected\":" ++ bitsJson expected.data ++
    ",\"match\":" ++ (if isMatch then "true" else "false") ++
    ",\"term_size\":" ++ toString termSize ++ "}")
  pure isMatch

def controllerLoop (programName : String) (program : CTS.Program)
    (word : List Bool) (wanted : Nat) :
    Nat → Nat → Nat → List Nat → Bool → SizedCursor →
      FiniteController.Configuration
        (SchedulerControl.Control program
          (canonicalDispatcher program)) →
      IO LoopResult
  | 0, _, found, _, matched, _, _ =>
      pure { matched, checkpoints := found, exhausted := found ≠ wanted }
  | remaining + 1, contractions, found, seen, matched, sized, configuration => do
      if found = wanted then
        pure { matched, checkpoints := found, exhausted := false }
      else
        let dispatcher := canonicalDispatcher program
        let machine := SchedulerControl.machine program dispatcher
        let mutation := FiniteController.mutationCount machine configuration
        let sizedAfter := stepSized program dispatcher configuration sized
        let after := FiniteController.step machine configuration
        if mutation = 1 then
          let nextContraction := contractions + 1
          let term := after.cursor.erase
          match PublicDecoder.decode program dispatcher.tree term with
          | none =>
              controllerLoop programName program word wanted remaining
                nextContraction found seen matched sizedAfter after
          | some (horizon, config) =>
              if seen.contains horizon then
                controllerLoop programName program word wanted remaining
                  nextContraction found seen matched sizedAfter after
              else
                if programName = "tiny" && horizon < 3 then
                  IO.println s!"checkpoint_term_{horizon}: {termPrefix term}"
                let currentMatch ← emitCheckpoint programName program word
                  nextContraction horizon config sizedAfter.rootSize
                controllerLoop programName program word wanted remaining
                  nextContraction (found + 1) (horizon :: seen)
                  (matched && currentMatch) sizedAfter after
        else
          controllerLoop programName program word wanted remaining contractions
            found seen matched sizedAfter after

def runProgram (programName : String) (program : CTS.Program)
    (word : List Bool) (wanted maxMicroticks : Nat) : IO UInt32 := do
  let dispatcher := canonicalDispatcher program
  let initial := SchedulerControl.initialConfiguration program dispatcher word
  let initialTerm := initial.cursor.erase
  let sizeBuildFuel := 20000000 + 40 * word.length
  let initialSized ← match SizedCursor.atRoot? sizeBuildFuel initialTerm with
    | some sized => pure sized
    | none =>
        IO.eprintln "exact-size cache construction exhausted its structural bound"
        return 2
  if programName = "tiny" then
    IO.println s!"encoded_term: {termPrefix initialTerm}"
  if wanted = 0 then
    return 0
  let (found, seen, matched) ←
    match PublicDecoder.decode program dispatcher.tree initialTerm with
    | none => pure (0, [], false)
    | some (horizon, config) => do
        if programName = "tiny" && horizon < 3 then
          IO.println s!"checkpoint_term_{horizon}: {termPrefix initialTerm}"
        let currentMatch ← emitCheckpoint programName program word 0 horizon
          config initialSized.rootSize
        pure (1, [horizon], currentMatch)
  let result ← controllerLoop programName program word wanted maxMicroticks
    0 found seen matched initialSized initial
  if result.exhausted then
    IO.eprintln s!"microtick limit reached after {result.checkpoints} checkpoints"
  if result.matched && result.checkpoints = wanted then
    return 0
  else
    return 1

def loadWord (options : Options) : IO (Except String (String × List Bool)) := do
  if options.program = "tiny" then
    match options.tape with
    | some _ => pure (throw "--tape is available only with --program fixed912")
    | none =>
        pure do
          let text ← requireSome "--word is required" options.word
          let bits ← parseBits text
          pure ("tiny", bits)
  else if options.program = "fixed912" then
    match options.tape with
    | some path =>
        try
          let contents ← IO.FS.readFile path
          match parseTapeInstance contents with
          | .error message => pure (.error message)
          | .ok source =>
              pure (.ok ("fixed912",
                PureSFormal.Computation.DeterministicTapeCook.encodeBits source))
        catch exception =>
          pure (.error s!"cannot read tape instance: {exception} ")
    | none =>
        pure do
          let text ← requireSome "--word or --tape is required" options.word
          let bits ← parseBits text
          pure ("fixed912", bits)
  else
    pure (.error s!"unknown program: {options.program}")

def main (args : List String) : IO UInt32 := do
  match parseOptions args with
  | .error message =>
      IO.eprintln message
      IO.eprintln usage
      return 2
  | .ok options =>
      match ← loadWord options with
      | .error message =>
          IO.eprintln message
          IO.eprintln usage
          return 2
      | .ok (programName, word) =>
          if (options.microtraceFirst && options.contractionTrace.isSome) ||
              (options.microtraceFirst && options.rootResetCheck.isSome) ||
              (options.contractionTrace.isSome && options.rootResetCheck.isSome) then
            IO.eprintln "choose one of --microtrace-first, --contraction-trace, or --root-reset-check"
            pure 2
          else if options.microtraceFirst then
            if programName = "tiny" then
              runFirstMicrotrace word
            else
              IO.eprintln "--microtrace-first is available only with --program tiny"
              pure 2
          else if let some count := options.rootResetCheck then
            if programName = "tiny" then
              runRootResetCheck programName tinyProgram word count
                options.maxMicroticks
            else
              runRootResetCheck programName Cook.rogozhinCookProgram word count
                options.maxMicroticks
          else
            match options.contractionTrace with
            | some count =>
                if programName = "tiny" then
                  runContractionTrace programName tinyProgram word count
                    options.maxMicroticks
                else
                  runContractionTrace programName Cook.rogozhinCookProgram word
                    count options.maxMicroticks
            | none =>
                if programName = "tiny" then
                  runProgram programName tinyProgram word options.checkpoints
                    options.maxMicroticks
                else
                  runProgram programName Cook.rogozhinCookProgram word
                    options.checkpoints options.maxMicroticks

end PureSDemo

def main (args : List String) : IO UInt32 :=
  PureSDemo.main args
