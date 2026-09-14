import PureSFormal.Research.RootResetFinitePrioritySelector
import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.SchedulerControl

/- Executable regression harness only. All caps and counters below belong to
the test driver, not to either finite controller. No state cover or proof
stopping-time budget is evaluated. A cap, reject, or mismatch fails the run. -/
namespace RootResetRuntimeDifferential

def progress (message : String) : IO Unit := do
  IO.println message
  (← IO.getStdout).flush

open PureSFormal PureSFormal.PureS PureSFormal.Research
open FiniteController RootResetSelectorContract

def one (appendant : List Bool) : CTS.Program :=
  { period := 1, period_pos := by decide, appendant := fun _ => appendant }

def two (first second : List Bool) : CTS.Program :=
  { period := 2, period_pos := by decide,
    appendant := fun phase => if phase.val = 0 then first else second }

def scriptName : SchedulerControl.ScriptJob program → String
  | .clockEnter => "clockEnter"
  | .clockPositive => "clockPositive"
  | .clockZero => "clockZero"
  | .fuelPositive => "fuelPositive"
  | .fuelZero => "fuelZero"
  | .downLive => "downLive"
  | .downTombstone => "downTombstone"
  | .downLocal => "downLocal"
  | .downBase => "downBase"
  | .accumulator _ => "accumulator"
  | .normalResponse _ => "normalResponse"
  | .emptyResponse _ => "emptyResponse"
  | .markNormal => "markNormal"
  | .markEmpty => "markEmpty"
  | .continuation => "continuation"

def mutationName : SchedulerControl.Control program layout → String
  | .script job pc registers =>
      s!"{scriptName job}_pc{pc.val}_phase{registers.phase.val}_empty{registers.empty}"
  | .macro (.upLiveFound bit) registers => s!"C4_bit{bit}_phase{registers.phase.val}"
  | .macro (.family .frameDispatch) _ => "FRAME"
  | .macro (.family .empty) _ => "EMPTY_FRAME"
  | .macro (.routeChoice _ .left) _ => "dispatcherLeft"
  | .macro (.routeChoice _ .right) _ => "dispatcherRight"
  | .macro (.arityDecision .growth _) _ => "clockLaunch"
  | .macro (.arityDecision (.continuation empty) _) _ => s!"handoff_empty{empty}"
  | state => s!"other_{reprStr state.family}"

def untilMutation (machine : Machine α) :
    Nat → Nat → Configuration α → Except String (Nat × Configuration α × Configuration α)
  | 0, ticks, _ => .error s!"persistent microtick cap reached after {ticks} ticks"
  | cap + 1, ticks, configuration =>
    match configuration.control with
    | none => .error s!"persistent reject after {ticks} ticks"
    | some _ =>
      let next := FiniteController.step machine configuration
      if mutationCount machine configuration == 1 then
        .ok (ticks + 1, configuration, next)
      else untilMutation machine cap (ticks + 1) next

def untilHalt (machine : Machine α) (halt : α → Option HaltKind) :
    Nat → Nat → Nat → Configuration α → Except String (Nat × Nat × Configuration α)
  | cap, ticks, mutations, configuration =>
    match configuration.control with
    | none => .error s!"root selector reject after {ticks} ticks"
    | some state => match halt state with
      | some .nf => .error s!"unexpected normal form after {ticks} ticks"
      | some .redex => .ok (ticks, mutations, configuration)
      | none => match cap with
        | 0 => .error s!"root selector microtick cap reached after {ticks} ticks"
        | cap + 1 => untilHalt machine halt cap (ticks + 1)
            (mutations + mutationCount machine configuration)
            (FiniteController.step machine configuration)

def addressText (cursor : Cursor) : String :=
  String.mk ((cursorAddress cursor).map fun side => match side with | .left => 'L' | .right => 'R')

def checked {α : Type} (fixture : String) (sample : Nat) (result : Except String α) : IO α :=
  match result with
  | .ok value => pure value
  | .error reason => throw (IO.userError s!"FAIL fixture={fixture} sample={sample}: {reason}")

def trial (name : String) (program : CTS.Program) (bits : List Bool)
    (samples rootCap persistentCap termCap : Nat) : IO Unit := do
  RootResetRuntimeDifferential.progress s!"FIXTURE,{name},samples={samples},rootCap={rootCap},persistentCap={persistentCap},termCap={termCap}"
  let layout := BalancedActionTree.dispatcher program
  let spec := RootResetFinitePrioritySelector.selectionSpec program layout
  let rootMachine := RootResetReadonlySelector.machine spec
  let persistent := SchedulerControl.machine program layout
  let mut configuration := SchedulerControl.initialConfiguration program layout bits
  let mut totalRoot := 0
  let mut totalPersistent := 0
  let mut maxRoot := 0
  let mut maxSize := 0
  for sample in [:samples] do
    let source := configuration.cursor.erase
    let sourceSize := source.size
    if sourceSize > termCap then
      throw (IO.userError s!"FAIL fixture={name} sample={sample}: term cap {termCap} exceeded by {sourceSize}")
    let (schedulerTicks, mutationSource, next) ← checked name sample
      (untilMutation persistent persistentCap 0 configuration)
    let (rootTicks, mutations, rootNext) ← checked name sample
      (untilHalt rootMachine RootResetReadonlySelector.haltKind rootCap 0 0
        (RootResetReadonlySelector.initial spec source))
    if mutations != 1 then
      throw (IO.userError s!"FAIL fixture={name} sample={sample}: root mutation count {mutations}")
    let target := rootNext.cursor.erase
    if target != next.cursor.erase then
      throw (IO.userError s!"FAIL fixture={name} sample={sample}: target mismatch rootAddress={addressText rootNext.cursor} schedulerAddress={addressText next.cursor}")
    if source.contractAt? (cursorAddress rootNext.cursor) != some target then
      throw (IO.userError s!"FAIL fixture={name} sample={sample}: root target is not the reported native contraction")
    if cursorAddress rootNext.cursor != cursorAddress next.cursor then
      throw (IO.userError s!"FAIL fixture={name} sample={sample}: selected occurrence mismatch")
    let label := match mutationSource.control with | none => "reject" | some q => mutationName q
    RootResetRuntimeDifferential.progress s!"ROW,{name},{sample},{sourceSize},{target.size},{rootTicks},{schedulerTicks},{mutations},{label},{addressText rootNext.cursor}"
    configuration := next
    totalRoot := totalRoot + rootTicks
    totalPersistent := totalPersistent + schedulerTicks
    maxRoot := max maxRoot rootTicks
    maxSize := max maxSize (max sourceSize target.size)
  RootResetRuntimeDifferential.progress s!"PASS,{name},samples={samples},rootTicks={totalRoot},persistentTicks={totalPersistent},maxRootTicks={maxRoot},maxTermSize={maxSize}"

end RootResetRuntimeDifferential

open RootResetRuntimeDifferential in
def main (args : List String) : IO Unit := do
  if args == ["smoke"] then
    trial "initial_empty_smoke" (one []) [] 1 1000000 100000 1000000
  else
    let samples := (args.head?.bind String.toNat?).getD 120
    let rootCap := 1000000
    let persistentCap := 100000
    let termCap := 1000000
    RootResetRuntimeDifferential.progress "HEADER,fixture,sample,sourceNodes,targetNodes,rootMicroticks,persistentMicroticks,rootMutations,persistentMutationRow,address"
    trial "initial_empty" (one []) [] samples rootCap persistentCap termCap
    trial "single_false" (one []) [false] samples rootCap persistentCap termCap
    trial "true_empty_appendant" (one []) [true] samples rootCap persistentCap termCap
    trial "true_nonempty_appendant" (one [true]) [true] samples rootCap persistentCap termCap
    trial "period2_drain" (two [] []) [false, true] samples rootCap persistentCap termCap
    trial "period2_mixed" (two [] [true, false]) [true, true] samples rootCap persistentCap termCap
    RootResetRuntimeDifferential.progress s!"ALL_PASS,fixtures=6,samples={samples * 6}"
