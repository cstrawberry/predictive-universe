import PureSFormal.Research.RootResetFinitePrioritySelector
import PureSFormal.PureS.BalancedActionTree

/- Exhaustive small bare-tree tests. Enumeration, redex search, bounds, and
loop counters are test-driver data, never inputs to the finite transition. -/
namespace RootResetArbitraryRuntime

def progress (message : String) : IO Unit := do
  IO.println message
  (← IO.getStdout).flush

open PureSFormal PureSFormal.PureS PureSFormal.Research
open FiniteController RootResetSelectorContract

def one : CTS.Program :=
  { period := 1, period_pos := by decide, appendant := fun _ => [] }

def two : CTS.Program :=
  { period := 2, period_pos := by decide,
    appendant := fun phase => if phase.val = 0 then [] else [true, false] }

def exactTrees : Nat → Nat → List Term
  | 0, _ => []
  | _ + 1, 0 => [.s]
  | depth + 1, nodes + 1 =>
    (List.range (nodes + 1)).flatMap fun leftCount =>
      (exactTrees depth leftCount).flatMap fun left =>
        (exactTrees depth (nodes - leftCount)).map (Term.app left)

def testTerms : List Term := (List.range 7).flatMap (exactTrees 7)

/-- An independent syntactic redex census; does not call the formal selector,
normality decision, or native contractAt function. -/
def redexAddresses : Term → List Address
  | .s => []
  | term@(.app left right) =>
    let root := match term with
      | .app (.app (.app .s _) _) _ => [[]]
      | _ => []
    root ++ (redexAddresses left).map (.left :: ·) ++ (redexAddresses right).map (.right :: ·)

def untilHalt (machine : Machine α) (halt : α → Option HaltKind) :
    Nat → Nat → Nat → Configuration α → Except String (Nat × Nat × HaltKind × Configuration α)
  | cap, ticks, mutations, configuration =>
    match configuration.control with
    | none => .error s!"reject after {ticks} ticks"
    | some state => match halt state with
      | some tag => .ok (ticks, mutations, tag, configuration)
      | none => match cap with
        | 0 => .error s!"microtick cap reached after {ticks} ticks"
        | cap + 1 => untilHalt machine halt cap (ticks + 1)
            (mutations + mutationCount machine configuration)
            (FiniteController.step machine configuration)

def addressText (cursor : Cursor) : String :=
  String.mk ((cursorAddress cursor).map fun side => match side with | .left => 'L' | .right => 'R')

def trial (name : String) (program : CTS.Program) : IO Unit := do
  let terms := testTerms
  if terms.length != 197 || terms.eraseDups.length != 197 then
    throw (IO.userError "FAIL: exhaustive enumeration count or uniqueness disagrees with 197")
  let expectedByInternal := [1, 1, 2, 5, 14, 42, 132]
  for internal in [:7] do
    if (terms.filter fun term => term.size == 2 * internal + 1).length != expectedByInternal[internal]! then
      throw (IO.userError s!"FAIL: size {2 * internal + 1} Catalan enumeration count mismatch")
  RootResetArbitraryRuntime.progress s!"FIXTURE,{name},terms={terms.length},maxNodes=13,microtickCap=1000000"
  let layout := BalancedActionTree.dispatcher program
  let spec := RootResetFinitePrioritySelector.selectionSpec program layout
  let machine := RootResetReadonlySelector.machine spec
  let mut normalCount := 0
  let mut redexCount := 0
  let mut totalTicks := 0
  let mut maximumTicks := 0
  for index in [:terms.length] do
    let source := terms[index]!
    if source.size > 13 then throw (IO.userError s!"FAIL {name} #{index}: source outside size bound")
    let roots := redexAddresses source
    let (ticks, mutations, tag, final) ← match untilHalt machine RootResetReadonlySelector.haltKind
        1000000 0 0 (RootResetReadonlySelector.initial spec source) with
      | .error reason => throw (IO.userError s!"FAIL {name} #{index}: {reason}")
      | .ok value => pure value
    match tag with
    | .nf =>
      if !roots.isEmpty || mutations != 0 || final.cursor.erase != source then
        throw (IO.userError s!"FAIL {name} #{index}: incorrect normal-form answer")
      normalCount := normalCount + 1
    | .redex =>
      if roots.isEmpty || mutations != 1 || !(roots.contains (cursorAddress final.cursor)) then
        throw (IO.userError s!"FAIL {name} #{index}: incorrect redex answer or occurrence")
      if source.contractAt? (cursorAddress final.cursor) != some final.cursor.erase then
        throw (IO.userError s!"FAIL {name} #{index}: native contractAt mismatch")
      redexCount := redexCount + 1
    let afterHalt := FiniteController.step machine final
    if runtimeHaltKind RootResetReadonlySelector.haltKind afterHalt.control != some tag ||
        afterHalt.cursor.erase != final.cursor.erase || mutationCount machine final != 0 then
      throw (IO.userError s!"FAIL {name} #{index}: terminal absorption check")
    totalTicks := totalTicks + ticks
    maximumTicks := max maximumTicks ticks
    RootResetArbitraryRuntime.progress s!"ROW,{name},{index},{source.size},{roots.length},{reprStr tag},{ticks},{mutations},{addressText final.cursor}"
  RootResetArbitraryRuntime.progress s!"PASS,{name},terms={terms.length},normal={normalCount},redex={redexCount},microticks={totalTicks},maxMicroticks={maximumTicks}"

end RootResetArbitraryRuntime

def main : IO Unit := do
  RootResetArbitraryRuntime.progress "HEADER,fixture,index,sourceNodes,syntacticRedexes,haltTag,microticks,mutations,address"
  RootResetArbitraryRuntime.trial "period1_empty" RootResetArbitraryRuntime.one
  RootResetArbitraryRuntime.trial "period2_mixed" RootResetArbitraryRuntime.two
  RootResetArbitraryRuntime.progress "ALL_PASS,fixtures=2,termsPerFixture=197,executions=394"
