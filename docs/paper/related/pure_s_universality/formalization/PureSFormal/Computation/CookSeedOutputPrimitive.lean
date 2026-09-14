import PureSFormal.Computation.ThreeCounterCookReadbackPrimitive
import PureSFormal.Computation.CookSeedOrdinaryPrimitive
import PureSFormal.Computation.CookDecodedRowPrimitive

/-!
# Full primitive seed/current output reader

The immutable seed is parsed once. Reusing its recovered context agrees with
the existing observers, including their duplicate seed parsing, on every input.
Every conversion, table allocation, candidate reconstruction and equality test
is measured. Bounds depend only on the two literal bitword lengths.
-/

namespace PureSFormal.Computation.CookSeedOutputPrimitive

open PureS.ParserPrimitiveMachine PureS.ParserRoutePrimitive
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open RogozhinFramePrimitiveSize
open CookSeedReadbackContext (Context)

theorem counterBudget_mono {s t m n c d : Nat} (hs : s ≤ t) (hm : m ≤ n) (hc : c ≤ d) :
    ThreeCounterCookReadbackPrimitive.contextBudget s m c ≤
      ThreeCounterCookReadbackPrimitive.contextBudget t n d :=
  Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add_right (Nat.mul_le_mul_left 84 hs) 34)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 4 hs) 1))
    (ThreeCounterCookReadbackPrimitive.decodeBudget_mono hs hm hc)) 4

def passCounter (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Result (Option ThreeCounter.State) :=
  andThen (CookSeedOrdinaryPrimitive.passOrdinary context horizon snapshot)
    (ThreeCounterCookReadbackPrimitive.fromContext context)

theorem passCounter_value (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (passCounter context horizon snapshot).value = CookSeedPassReadback.decodePassCounter? context horizon snapshot := by
  rw [passCounter, andThen_value, CookSeedOrdinaryPrimitive.passOrdinary_value]
  unfold CookSeedPassReadback.decodePassCounter?
  cases CookSeedPassReadback.decodePassTag? context horizon snapshot with
  | none => rfl
  | some normalized =>
      change (DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized).bind
        (fun value => (ThreeCounterCookReadbackPrimitive.fromContext context value).value) =
        (DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized).bind
          (ThreeCounterCookReadback.decodeCounterWord? context.counterShape)
      cases DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized with
      | none => rfl
      | some ordinary => exact ThreeCounterCookReadbackPrimitive.fromContext_value context ordinary

def passCounterBudget (size cells : Nat) : Nat :=
  CookSeedOrdinaryPrimitive.passOrdinaryBudget size cells + 2 +
    ThreeCounterCookReadbackPrimitive.contextBudget size (size * (cells + 2)) (cells + 2)

theorem passCounter_operations_le (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (passCounter context horizon snapshot).operations ≤
      passCounterBudget (contextSize context.frames) snapshot.data.length := by
  have continuation (word : List Nat)
      (found : (CookSeedOrdinaryPrimitive.passOrdinary context horizon snapshot).value = some word) :
      (ThreeCounterCookReadbackPrimitive.fromContext context word).operations ≤
        ThreeCounterCookReadbackPrimitive.contextBudget (contextSize context.frames)
          (contextSize context.frames * (snapshot.data.length + 2)) (snapshot.data.length + 2) := by
    have fields := CookSeedOrdinaryPrimitive.passOrdinary_fields context horizon snapshot word found
    have mass := Nat.le_trans (ThreeCounterCookReadbackPrimitive.labelsMass_le word _ fields.2)
      (Nat.mul_le_mul_left _ fields.1)
    exact Nat.le_trans (ThreeCounterCookReadbackPrimitive.fromContext_operations_le context word)
      (counterBudget_mono (Nat.le_refl _) mass fields.1)
  have bound := andThen_operations_le (CookSeedOrdinaryPrimitive.passOrdinary context horizon snapshot)
    (ThreeCounterCookReadbackPrimitive.fromContext context) _ continuation
  exact Nat.le_trans bound (Nat.add_le_add_right (Nat.add_le_add_right
    (CookSeedOrdinaryPrimitive.passOrdinary_operations_le context horizon snapshot) 2) _)

def fieldCap (size cells : Nat) : Nat := size * (cells + 2) + (cells + 3)

theorem fieldCap_mono {s t n m : Nat} (hs : s ≤ t) (hn : n ≤ m) : fieldCap s n ≤ fieldCap t m :=
  Nat.add_le_add (Nat.mul_le_mul hs (Nat.add_le_add_right hn 2)) (Nat.add_le_add_right hn 3)

theorem passCounter_fields (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (candidate : ThreeCounter.State)
    (found : (passCounter context horizon snapshot).value = some candidate) :
    candidate.control ≤ fieldCap (contextSize context.frames) snapshot.data.length ∧
      candidate.left ≤ fieldCap (contextSize context.frames) snapshot.data.length ∧
      candidate.right ≤ fieldCap (contextSize context.frames) snapshot.data.length := by
  rw [passCounter, andThen_value] at found
  cases wordFound : (CookSeedOrdinaryPrimitive.passOrdinary context horizon snapshot).value with
  | none => rw [wordFound] at found; cases found
  | some word =>
      rw [wordFound] at found
      have wordFields := CookSeedOrdinaryPrimitive.passOrdinary_fields context horizon snapshot word wordFound
      have fields := ThreeCounterCookReadbackPrimitive.fromContext_fields context word candidate found
      have mass := Nat.le_trans (ThreeCounterCookReadbackPrimitive.labelsMass_le word _ wordFields.2)
        (Nat.mul_le_mul_left _ wordFields.1)
      have registers : word.length + 1 ≤ snapshot.data.length + 3 := Nat.add_le_add_right wordFields.1 1
      exact ⟨Nat.le_trans fields.1 (Nat.le_trans mass (Nat.le_add_right _ _)),
        Nat.le_trans fields.2.1 (Nat.le_trans registers (Nat.le_add_left _ _)),
        Nat.le_trans fields.2.2.1 (Nat.le_trans registers (Nat.le_add_left _ _))⟩

theorem passCounterBudget_mono {s t n m : Nat} (hs : s ≤ t) (hn : n ≤ m) :
    passCounterBudget s n ≤ passCounterBudget t m := by
  have ordinary : CookSeedOrdinaryPrimitive.passOrdinaryBudget s n ≤
      CookSeedOrdinaryPrimitive.passOrdinaryBudget t m := by
    exact Nat.add_le_add (Nat.add_le_add_right
      (Nat.add_le_add (Nat.add_le_add_right
        (Nat.mul_le_mul_left 6144 (Nat.pow_le_pow_left (Nat.add_le_add_right hn 1) 2)) 2)
        (RogozhinContextBoundaryPrimitive.boundaryBudget_mono hs hn hn)) 2)
      (CookSeedOrdinaryPrimitive.ordinaryBudget_mono hs (Nat.add_le_add_right hn 2))
  exact Nat.add_le_add (Nat.add_le_add_right ordinary 2)
    (counterBudget_mono hs (Nat.mul_le_mul hs (Nat.add_le_add_right hn 2)) (Nat.add_le_add_right hn 2))

def contextRow (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Result (Option DeterministicTape.Row) :=
  andThen (passCounter context horizon snapshot) TapeRowPrimitive.parse

def contextTerminal (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Result (Option DeterministicTape.Row) :=
  andThen (passCounter context horizon snapshot) (CookDecodedRowPrimitive.terminal context)

def contextScanned (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Result (Option Bool) :=
  andThen (passCounter context horizon snapshot) (CookDecodedRowPrimitive.scanned context)

def rowBudget (size cells : Nat) : Nat :=
  passCounterBudget size cells + 2 + 640 * (fieldCap size cells + 1)^2

def terminalBudget (size cells : Nat) : Nat :=
  passCounterBudget size cells + 2 + CookDecodedRowPrimitive.terminalBudget size (fieldCap size cells)

def scannedBudget (size cells : Nat) : Nat :=
  passCounterBudget size cells + 2 + CookDecodedRowPrimitive.scannedBudget size (fieldCap size cells)

theorem contextRow_operations_le (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (contextRow context horizon snapshot).operations ≤ rowBudget (contextSize context.frames) snapshot.data.length := by
  have continuation (candidate : ThreeCounter.State)
      (found : (passCounter context horizon snapshot).value = some candidate) :
      (TapeRowPrimitive.parse candidate).operations ≤ 640 * (fieldCap (contextSize context.frames) snapshot.data.length + 1)^2 := by
    have fields := passCounter_fields context horizon snapshot candidate found
    exact TapeRowPrimitive.parse_operations_le_cap candidate _ fields.1 fields.2.1 fields.2.2
  exact Nat.le_trans (andThen_operations_le (passCounter context horizon snapshot) TapeRowPrimitive.parse _ continuation)
    (Nat.add_le_add_right (Nat.add_le_add_right (passCounter_operations_le context horizon snapshot) 2) _)

theorem contextTerminal_operations_le (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (contextTerminal context horizon snapshot).operations ≤ terminalBudget (contextSize context.frames) snapshot.data.length := by
  have continuation (candidate : ThreeCounter.State)
      (found : (passCounter context horizon snapshot).value = some candidate) :
      (CookDecodedRowPrimitive.terminal context candidate).operations ≤
        CookDecodedRowPrimitive.terminalBudget (contextSize context.frames) (fieldCap (contextSize context.frames) snapshot.data.length) := by
    have fields := passCounter_fields context horizon snapshot candidate found
    exact CookDecodedRowPrimitive.terminal_operations_le_cap context candidate _ fields.1 fields.2.1 fields.2.2
  exact Nat.le_trans (andThen_operations_le (passCounter context horizon snapshot) (CookDecodedRowPrimitive.terminal context) _ continuation)
    (Nat.add_le_add_right (Nat.add_le_add_right (passCounter_operations_le context horizon snapshot) 2) _)

theorem contextScanned_operations_le (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (contextScanned context horizon snapshot).operations ≤ scannedBudget (contextSize context.frames) snapshot.data.length := by
  have continuation (candidate : ThreeCounter.State)
      (found : (passCounter context horizon snapshot).value = some candidate) :
      (CookDecodedRowPrimitive.scanned context candidate).operations ≤
        CookDecodedRowPrimitive.scannedBudget (contextSize context.frames) (fieldCap (contextSize context.frames) snapshot.data.length) := by
    have fields := passCounter_fields context horizon snapshot candidate found
    exact CookDecodedRowPrimitive.scanned_operations_le_cap context candidate _ fields.1 fields.2.1 fields.2.2
  exact Nat.le_trans (andThen_operations_le (passCounter context horizon snapshot) (CookDecodedRowPrimitive.scanned context) _ continuation)
    (Nat.add_le_add_right (Nat.add_le_add_right (passCounter_operations_le context horizon snapshot) 2) _)

theorem contextRow_value (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (contextRow context horizon snapshot).value =
      (CookSeedPassReadback.decodePassCounter? context horizon snapshot).bind
        DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? := by
  rw [contextRow, andThen_value, passCounter_value]
  cases CookSeedPassReadback.decodePassCounter? context horizon snapshot with
  | none => rfl
  | some candidate => exact TapeRowPrimitive.parse_value candidate

theorem contextTerminal_value (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (contextTerminal context horizon snapshot).value =
      ((CookSeedPassReadback.decodePassCounter? context horizon snapshot).bind
        DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?).bind
          (fun row => if CookSeedTerminalReadback.terminalRow context row then some row else none) := by
  rw [contextTerminal, andThen_value, passCounter_value]
  cases CookSeedPassReadback.decodePassCounter? context horizon snapshot with
  | none => rfl
  | some candidate => exact CookDecodedRowPrimitive.terminal_value context candidate

theorem contextScanned_value (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (contextScanned context horizon snapshot).value =
      (((CookSeedPassReadback.decodePassCounter? context horizon snapshot).bind
        DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?).bind
          (fun row => if CookSeedTerminalReadback.terminalRow context row then some row else none)).bind
            PureSFormal.Research.ProtectedTrieMachine.scanned? := by
  rw [contextScanned, andThen_value, passCounter_value]
  cases CookSeedPassReadback.decodePassCounter? context horizon snapshot with
  | none => rfl
  | some candidate => exact CookDecodedRowPrimitive.scanned_value context candidate

theorem rowBudget_mono {s t n m : Nat} (hs : s ≤ t) (hn : n ≤ m) : rowBudget s n ≤ rowBudget t m :=
  Nat.add_le_add (Nat.add_le_add_right (passCounterBudget_mono hs hn) 2)
    (Nat.mul_le_mul_left 640 (Nat.pow_le_pow_left (Nat.add_le_add_right (fieldCap_mono hs hn) 1) 2))

theorem terminalBudget_mono {s t n m : Nat} (hs : s ≤ t) (hn : n ≤ m) : terminalBudget s n ≤ terminalBudget t m :=
  Nat.add_le_add (Nat.add_le_add_right (passCounterBudget_mono hs hn) 2)
    (CookDecodedRowPrimitive.terminalBudget_mono hs (fieldCap_mono hs hn))

theorem scannedBudget_mono {s t n m : Nat} (hs : s ≤ t) (hn : n ≤ m) : scannedBudget s n ≤ scannedBudget t m :=
  Nat.add_le_add (Nat.add_le_add_right (passCounterBudget_mono hs hn) 2)
    (CookDecodedRowPrimitive.scannedBudget_mono hs (fieldCap_mono hs hn))

def seedRead {α : Type}
    (read : Context → Nat → CTS.Config Cook.rogozhinCookProgram → Result (Option α))
    (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) : Result (Option α) :=
  andThen (RogozhinSeedPrimitive.context seed) fun context => read context horizon snapshot

def row (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :=
  seedRead contextRow seed horizon snapshot

def terminal (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :=
  seedRead contextTerminal seed horizon snapshot

def scanned (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :=
  seedRead contextScanned seed horizon snapshot

theorem row_value (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (row seed horizon snapshot).value = CookSeedPassReadback.decodeTape? seed horizon snapshot := by
  rw [row, seedRead, andThen_value, RogozhinSeedPrimitive.context_value]
  unfold CookSeedPassReadback.decodeTape?
  cases CookSeedReadbackContext.decodeContext? seed with
  | none => rfl
  | some context => exact contextRow_value context horizon snapshot

theorem terminal_value (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (terminal seed horizon snapshot).value = CookSeedPassReadback.decodeTerminalTape? seed horizon snapshot := by
  rw [terminal, seedRead, andThen_value, RogozhinSeedPrimitive.context_value]
  unfold CookSeedPassReadback.decodeTerminalTape? CookSeedPassReadback.decodeTape?
  cases decoded : CookSeedReadbackContext.decodeContext? seed with
  | none => rfl
  | some context => exact contextTerminal_value context horizon snapshot

theorem scanned_value (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (scanned seed horizon snapshot).value = CookSeedPassReadback.decodeScannedOutput? seed horizon snapshot := by
  rw [scanned, seedRead, andThen_value, RogozhinSeedPrimitive.context_value]
  unfold CookSeedPassReadback.decodeScannedOutput? CookSeedPassReadback.decodeTerminalTape?
    CookSeedPassReadback.decodeTape?
  cases decoded : CookSeedReadbackContext.decodeContext? seed with
  | none => rfl
  | some context => exact contextScanned_value context horizon snapshot

def seedBudget (budget : Nat → Nat → Nat) (seed cells : Nat) : Nat :=
  5124 * (seed + 1)^2 + 2 + budget seed cells

theorem seedBudget_mono (budget : Nat → Nat → Nat)
    (mono : ∀ {s t n m}, s ≤ t → n ≤ m → budget s n ≤ budget t m)
    {s t n m : Nat} (hs : s ≤ t) (hn : n ≤ m) : seedBudget budget s n ≤ seedBudget budget t m :=
  Nat.add_le_add (Nat.add_le_add_right
    (Nat.mul_le_mul_left 5124 (Nat.pow_le_pow_left (Nat.add_le_add_right hs 1) 2)) 2) (mono hs hn)

theorem seedRead_operations_le {α : Type}
    (read : Context → Nat → CTS.Config Cook.rogozhinCookProgram → Result (Option α))
    (budget : Nat → Nat → Nat)
    (bound : ∀ context horizon snapshot, (read context horizon snapshot).operations ≤
      budget (contextSize context.frames) snapshot.data.length)
    (mono : ∀ {s t n m}, s ≤ t → n ≤ m → budget s n ≤ budget t m)
    (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (seedRead read seed horizon snapshot).operations ≤ seedBudget budget seed.length snapshot.data.length := by
  have continuation (context : Context) (found : (RogozhinSeedPrimitive.context seed).value = some context) :
      (read context horizon snapshot).operations ≤ budget seed.length snapshot.data.length :=
    Nat.le_trans (bound context horizon snapshot) (mono (RogozhinFramePrimitiveSize.context_size seed context found) (Nat.le_refl _))
  exact Nat.le_trans (andThen_operations_le (RogozhinSeedPrimitive.context seed) _ _ continuation)
    (Nat.add_le_add_right (Nat.add_le_add_right (RogozhinSeedPrimitive.context_operations_le seed) 2) _)

theorem row_operations_le (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (row seed horizon snapshot).operations ≤ seedBudget rowBudget seed.length snapshot.data.length :=
  seedRead_operations_le contextRow rowBudget contextRow_operations_le (fun h => rowBudget_mono h) seed horizon snapshot

theorem terminal_operations_le (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (terminal seed horizon snapshot).operations ≤ seedBudget terminalBudget seed.length snapshot.data.length :=
  seedRead_operations_le contextTerminal terminalBudget contextTerminal_operations_le (fun h => terminalBudget_mono h) seed horizon snapshot

theorem scanned_operations_le (seed : List Bool) (horizon : Nat) (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (scanned seed horizon snapshot).operations ≤ seedBudget scannedBudget seed.length snapshot.data.length :=
  seedRead_operations_le contextScanned scannedBudget contextScanned_operations_le (fun h => scannedBudget_mono h) seed horizon snapshot

end PureSFormal.Computation.CookSeedOutputPrimitive
