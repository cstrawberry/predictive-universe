import PureSFormal.PureS.Reduction
import PureSFormal.Research.ProtectedTrieMachineCode

/-!
# Deterministic differential-test emitter

This executable exercises the public Lean definitions on data generated from
four fixed 32-bit seeds.  Its line protocol is consumed by an independent
Python implementation in `verify_lean_python_differential.py`.
-/

namespace PureSFormal.Differential

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieTableau

structure Rng where
  state : Nat

def Rng.next (rng : Rng) : Nat × Rng :=
  let value := (1664525 * rng.state + 1013904223) % 4294967296
  (value, ⟨value⟩)

def Rng.below (rng : Rng) (bound : Nat) : Nat × Rng :=
  let (value, rng) := rng.next
  (value % bound, rng)

def Rng.bit (rng : Rng) : Bool × Rng :=
  let (value, rng) := rng.below 2
  (value = 1, rng)

def genBits : Nat → Rng → BitWord × Rng
  | 0, rng => ([], rng)
  | count + 1, rng =>
      let (bit, rng) := rng.bit
      let (bits, rng) := genBits count rng
      (bit :: bits, rng)

def genDirection (rng : Rng) :
    PureSFormal.Research.ProtectedTrieMachine.Direction × Rng :=
  let (value, rng) := rng.below 3
  (match value with
    | 0 => .left
    | 1 => .stay
    | _ => .right, rng)

def genRule (stateCount : Nat) (rng : Rng) : Rule × Rng :=
  let (write, rng) := rng.bit
  let (move, rng) := genDirection rng
  let (nextState, rng) := rng.below stateCount
  (⟨write, move, nextState⟩, rng)

def genRuleOption (stateCount : Nat) (total : Bool) (rng : Rng) :
    Option Rule × Rng :=
  let (choice, rng) := rng.below 4
  if !total && choice = 0 then
    (none, rng)
  else
    let (rule, rng) := genRule stateCount rng
    (some rule, rng)

def genCell (stateCount : Nat) (total : Bool) (rng : Rng) :
    OrderedCell × Rng :=
  let (slot0, rng) := genRuleOption stateCount total rng
  let (slot1, rng) := genRuleOption stateCount total rng
  (⟨slot0, slot1⟩, rng)

def genStateRow (stateCount : Nat) (total : Bool) (rng : Rng) :
    StateRow × Rng :=
  let (onFalse, rng) := genCell stateCount total rng
  let (onTrue, rng) := genCell stateCount total rng
  (⟨onFalse, onTrue⟩, rng)

def genStateRows (stateCount : Nat) (total : Bool) :
    Nat → Rng → List StateRow × Rng
  | 0, rng => ([], rng)
  | count + 1, rng =>
      let (state, rng) := genStateRow stateCount total rng
      let (states, rng) := genStateRows stateCount total count rng
      (state :: states, rng)

def genInstance (total : Bool) (rng : Rng) : Instance × Rng :=
  let (stateOffset, rng) := rng.below 4
  let stateCount := stateOffset + 1
  let (states, rng) := genStateRows stateCount total stateCount rng
  let (initialState, rng) := rng.below stateCount
  let (inputLength, rng) := rng.below 7
  let (input, rng) := genBits inputLength rng
  (⟨⟨states⟩, initialState, input⟩, rng)

def genRow (rng : Rng) : Row × Rng :=
  let (state, rng) := rng.below 6
  let (lengthOffset, rng) := rng.below 7
  let tapeLength := lengthOffset + 1
  let (head, rng) := rng.below tapeLength
  let (tape, rng) := genBits tapeLength rng
  (⟨state, head, tape⟩, rng)

def genRows : Nat → Rng → List Row × Rng
  | 0, rng => ([], rng)
  | count + 1, rng =>
      let (row, rng) := genRow rng
      let (rows, rng) := genRows count rng
      (row :: rows, rng)

def genTerm : Nat → Rng → Term × Rng
  | 0, rng => (Term.s, rng)
  | depth + 1, rng =>
      let (choice, rng) := rng.below 4
      if choice = 0 then
        (Term.s, rng)
      else
        let (fn, rng) := genTerm depth rng
        let (arg, rng) := genTerm depth rng
        (Term.app fn arg, rng)

def wrapRedex : Nat → Term → Address → Rng → Term × Address × Rng
  | 0, term, address, rng => (term, address, rng)
  | count + 1, term, address, rng =>
      let (side, rng) := rng.bit
      let (sibling, rng) := genTerm 2 rng
      let term := if side then Term.app sibling term else Term.app term sibling
      let direction := if side then
        PureSFormal.PureS.Direction.right
      else PureSFormal.PureS.Direction.left
      wrapRedex count term (direction :: address) rng

def genAddressedRedex (rng : Rng) : Term × Address × Rng :=
  let (x, rng) := genTerm 3 rng
  let (y, rng) := genTerm 3 rng
  let (z, rng) := genTerm 3 rng
  let (depth, rng) := rng.below 7
  wrapRedex depth (Term.redex x y z) [] rng

def boolDigit (value : Bool) : String := if value then "1" else "0"

def bitsText (bits : BitWord) : String :=
  String.mk (bits.map fun bit => if bit then '1' else '0')

def addressText (address : Address) : String :=
  String.mk (address.map fun direction =>
    match direction with | .left => 'L' | .right => 'R')

def termText : Term → String
  | .s => "S"
  | .app fn arg => "A" ++ termText fn ++ termText arg

def emitCase (seed index : Nat) (rng : Rng) : IO Rng := do
  let (codecSource, rng) := genInstance false rng
  let sourceCode := encodeInstance codecSource
  let sourceRoundTrip := decodeInstance? sourceCode = some codecSource
  IO.println s!"I|{seed}|{index}|{bitsText sourceCode}|{boolDigit sourceRoundTrip}"

  let (rowCountOffset, rng) := rng.below 6
  let (rows, rng) := genRows (rowCountOffset + 1) rng
  let rowCode := encodeTableau rows
  let rowRoundTrip := decodeTableau? rowCode = some rows
  IO.println s!"R|{seed}|{index}|{bitsText rowCode}|{boolDigit rowRoundTrip}"

  let (source, rng) := genInstance true rng
  let (historyLength, rng) := rng.below 9
  let (history, rng) := genBits historyLength rng
  match canonicalTableau? source history with
  | none =>
      IO.println s!"E|{seed}|{index}|unexpected-invalid-history"
  | some canonicalRows =>
      let payload := encodeTableau canonicalRows
      let accepted := verify source history payload
      let rejected := !(verify source history (payload ++ [false]))
      IO.println (s!"V|{seed}|{index}|{bitsText (encodeInstance source)}|" ++
        s!"{bitsText history}|{bitsText payload}|{boolDigit accepted}|{boolDigit rejected}")

  let (term, address, rng) := genAddressedRedex rng
  match term.contractAt? address with
  | none =>
      IO.println s!"E|{seed}|{index}|unexpected-missing-redex"
  | some target =>
      IO.println (s!"S|{seed}|{index}|{addressText address}|" ++
        s!"{termText term}|{termText target}|1")
  pure rng

def emitCases (seed : Nat) : Nat → Rng → IO Unit
  | 0, _ => pure ()
  | count + 1, rng => do
      let index := 24 - (count + 1)
      let rng ← emitCase seed index rng
      emitCases seed count rng

def seeds : List Nat := [7, 12648430, 1592594996, 3735928559]

def main : IO Unit :=
  seeds.forM fun seed => emitCases seed 24 ⟨seed⟩

end PureSFormal.Differential

def main : IO Unit := PureSFormal.Differential.main
