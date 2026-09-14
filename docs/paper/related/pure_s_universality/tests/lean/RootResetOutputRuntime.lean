import PureSFormal.Computation.DeterministicTapeRootResetOutput
import PureSFormal.Computation.DeterministicTapeOutputPrimitive

namespace RootResetOutputRuntime

def progress (message : String) : IO Unit := do
  IO.println message
  (← IO.getStdout).flush

open PureSFormal PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

def exactTrees : Nat → Nat → List Term
  | 0, _ => []
  | _ + 1, 0 => [.s]
  | depth + 1, nodes + 1 =>
    (List.range (nodes + 1)).flatMap fun leftCount =>
      (exactTrees depth leftCount).flatMap fun left =>
        (exactTrees depth (nodes - leftCount)).map (Term.app left)

def testTerms : List Term := (List.range 7).flatMap (exactTrees 7)

def smallOutputs : IO Unit := do
  let terms := testTerms
  if terms.length != 197 || terms.eraseDups.length != 197 then
    throw (IO.userError "FAIL: small-output enumeration count or uniqueness")
  let mut rowOps := 0
  let mut terminalOps := 0
  let mut scannedOps := 0
  for index in [:terms.length] do
    let term := terms[index]!
    let row := DeterministicTapeOutputPrimitive.row term
    let terminal := DeterministicTapeOutputPrimitive.terminal term
    let scanned := DeterministicTapeOutputPrimitive.scanned term
    if row.value.isSome || terminal.value.isSome || scanned.value.isSome then
      throw (IO.userError s!"FAIL: malformed term #{index} accepted by measured output observer")
    if (DeterministicTapePureSOutput.decodeRow? term).isSome ||
        (DeterministicTapePureSOutput.decodeTerminalRow? term).isSome ||
        (DeterministicTapePureSOutput.decodeScannedOutput? term).isSome then
      throw (IO.userError s!"FAIL: malformed term #{index} accepted by public output observer")
    rowOps := rowOps + row.operations
    terminalOps := terminalOps + terminal.operations
    scannedOps := scannedOps + scanned.operations
    RootResetOutputRuntime.progress s!"ROW,{index},{term.size},{row.operations},{terminal.operations},{scanned.operations}"
  RootResetOutputRuntime.progress s!"OUTPUT_PASS,terms={terms.length},measuredCalls={3 * terms.length},publicCalls={3 * terms.length},rowOperations={rowOps},terminalOperations={terminalOps},scannedOperations={scannedOps}"

def preflight : IO Unit := do
  let expected : DeterministicTape.Instance := ⟨⟨[]⟩, 0, []⟩
  let expectedPadded : DeterministicTape.Instance := ⟨⟨[⟨none, none⟩]⟩, 0, []⟩
  let decoded := DeterministicTapeDecodeConstructionMachine.decode 0
  if !(decide (decoded.value = expected)) || !(decide (DeterministicTapeCode.instanceDecodeCode 0 = expected)) then
    throw (IO.userError "FAIL: source code0 does not decode to the independently specified empty machine/state0/empty input")
  let padded := DeterministicTapePaddingConstructionMachine.pad decoded.value
  if !(decide (padded.value = expectedPadded)) || !(decide (DeterministicTapeStatePadding.pad expected = expectedPadded)) then
    throw (IO.userError "FAIL: source code0 padding is not one undefined state")
  RootResetOutputRuntime.progress s!"PREFLIGHT_SOURCE,code=0,originalStates=0,paddedStates=1,initialState=0,inputLength=0,decodeOperations={decoded.operations},paddingOperations={padded.operations}"
  let counter := DeterministicTapeTableConstructionMachine.compile padded.value.machine
  let expectedCounter := DeterministicTapeThreeCounterCompiler.Compiler.compileMachine expectedPadded.machine
  if !(decide (counter.value = expectedCounter)) then
    throw (IO.userError "FAIL: measured padded table compilation differs from the declared compiler")
  RootResetOutputRuntime.progress s!"PREFLIGHT_COUNTER,instructions={counter.value.length},operations={counter.operations}"
  let tag := DeterministicTapeCook.compileT2Job expectedPadded
  let productionCount := tag.program.productions.length
  let productionCells := (tag.program.productions.map List.length).foldl (· + ·) 0
  let programTapeLowerBound := 3 + 5 * productionCount
  let binaryExponentLowerBound := 3 * (programTapeLowerBound + 1)
  RootResetOutputRuntime.progress s!"PREFLIGHT_T2,productions={productionCount},productionCells={productionCells},initialWordLength={tag.word.length},programTapeCellsLowerBound={programTapeLowerBound},seedBitsAtLeastPowerOfTwo={binaryExponentLowerBound}"
  RootResetOutputRuntime.progress "PREFLIGHT_PASS,decodePaddingAndTable=true,fullSeedAndTermMaterialized=false"

end RootResetOutputRuntime

def main (args : List String) : IO Unit := do
  if args == ["preflight"] then RootResetOutputRuntime.preflight
  else if args == ["small"] then RootResetOutputRuntime.smallOutputs
  else throw (IO.userError "expected mode preflight or small")
