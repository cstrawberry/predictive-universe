import PureSFormal.CostModel.FiniteArenaMachine
import PureSFormal.Research.ProtectedTrieBoundedTerminal

/-!
# DAG-local protected-certificate observation

The whole-term observer is intentionally an unfolded-tree algorithm.  For a
shared implementation the relevant bounded observation is instead one supplied
literal certificate.  This module checks that certificate directly through
arena identifiers: it recognizes the frozen header, compares its seed with the
supplied source's canonical normal encoding, follows the protected binary path,
and invokes the already-counted local tableau checker.  It never constructs an
arena readback.

The main equivalence theorem relates that executable DAG-local check to the
corresponding literal record in the unfolded current-term observer.  Sharing
and aliasing therefore cannot change certificate acceptance.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieBoundedTerminal
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieTableauExactCost
open PureSFormal.Research.ProtectedTrieWholeObserverExactCost

namespace DAGLocalObserver

variable {ι : Type} [DecidableEq ι]

/-- Arena identifiers occupying the two fields of an exact inert header. -/
structure HeaderNodes (ι : Type) where
  seed : ι
  body : ι
  deriving Repr

/-- Recognize `S seed body` by inspecting three arena records. -/
def parseHeaderNodes? (arena : Arena ι) (node : ι) : Option (HeaderNodes ι) :=
  match arena.cell node with
  | .s => none
  | .app fn body =>
      match arena.cell fn with
      | .s => none
      | .app head seed =>
          match arena.cell head with
          | .s => some ⟨seed, body⟩
          | .app _ _ => none

/-- Parsed arena header, mapped to ordinary readbacks, agrees with the exact
tree parser. -/
theorem parseHeaderNodes?_readback (arena : Arena ι) (node : ι) :
    (parseHeaderNodes? arena node).map (fun view =>
      (⟨arena.readback view.seed, arena.readback view.body⟩ : HeaderView)) =
      parseHeader? (arena.readback node) := by
  cases hnode : arena.cell node with
  | s =>
      rw [arena.readback_of_cell_s hnode]
      simp [parseHeaderNodes?, hnode, parseHeader?]
  | app fn body =>
      rw [arena.readback_of_cell_app hnode]
      cases hfn : arena.cell fn with
      | s =>
          rw [arena.readback_of_cell_s hfn]
          simp [parseHeaderNodes?, hnode, hfn, parseHeader?]
      | app head seed =>
          rw [arena.readback_of_cell_app hfn]
          cases hhead : arena.cell head with
          | s =>
              rw [arena.readback_of_cell_s hhead]
              simp [parseHeaderNodes?, hnode, hfn, hhead, parseHeader?]
          | app left right =>
              rw [arena.readback_of_cell_app hhead]
              simp [parseHeaderNodes?, hnode, hfn, hhead, parseHeader?]

/-- Arena identifiers occupying the three fields of one protected node. -/
structure ProtectedNodes (ι : Type) where
  left : ι
  right : ι
  junk : ι
  deriving Repr

/-- Recognize `S left (S right junk)` with bounded record inspections. -/
def parseProtectedNodes? (arena : Arena ι) (node : ι) :
    Option (ProtectedNodes ι) :=
  match arena.cell node with
  | .s => none
  | .app leftSpine tail =>
      match arena.cell leftSpine with
      | .s => none
      | .app leftHead left =>
          match arena.cell leftHead with
          | .app _ _ => none
          | .s =>
              match arena.cell tail with
              | .s => none
              | .app rightSpine junk =>
                  match arena.cell rightSpine with
                  | .s => none
                  | .app rightHead right =>
                      match arena.cell rightHead with
                      | .s => some ⟨left, right, junk⟩
                      | .app _ _ => none

/-- Parsed arena protected node, mapped to readbacks, agrees with the literal
tree parser. -/
theorem parseProtectedNodes?_readback (arena : Arena ι) (node : ι) :
    (parseProtectedNodes? arena node).map (fun view =>
      (⟨arena.readback view.left, arena.readback view.right,
        arena.readback view.junk⟩ : ProtectedView)) =
      parseProtected? (arena.readback node) := by
  cases hnode : arena.cell node with
  | s =>
      rw [arena.readback_of_cell_s hnode]
      simp [parseProtectedNodes?, hnode, parseProtected?]
  | app leftSpine tail =>
      rw [arena.readback_of_cell_app hnode]
      cases hleftSpine : arena.cell leftSpine with
      | s =>
          rw [arena.readback_of_cell_s hleftSpine]
          simp [parseProtectedNodes?, hnode, hleftSpine, parseProtected?]
      | app leftHead left =>
          rw [arena.readback_of_cell_app hleftSpine]
          cases hleftHead : arena.cell leftHead with
          | app first second =>
              rw [arena.readback_of_cell_app hleftHead]
              simp [parseProtectedNodes?, hnode, hleftSpine, hleftHead,
                parseProtected?]
          | s =>
              rw [arena.readback_of_cell_s hleftHead]
              cases htail : arena.cell tail with
              | s =>
                  rw [arena.readback_of_cell_s htail]
                  simp [parseProtectedNodes?, hnode, hleftSpine, hleftHead,
                    htail, parseProtected?]
              | app rightSpine junk =>
                  rw [arena.readback_of_cell_app htail]
                  cases hrightSpine : arena.cell rightSpine with
                  | s =>
                      rw [arena.readback_of_cell_s hrightSpine]
                      simp [parseProtectedNodes?, hnode, hleftSpine,
                        hleftHead, htail, hrightSpine, parseProtected?]
                  | app rightHead right =>
                      rw [arena.readback_of_cell_app hrightSpine]
                      cases hrightHead : arena.cell rightHead with
                      | s =>
                          rw [arena.readback_of_cell_s hrightHead]
                          simp [parseProtectedNodes?, hnode, hleftSpine,
                            hleftHead, htail, hrightSpine, hrightHead,
                            parseProtected?]
                      | app first second =>
                          rw [arena.readback_of_cell_app hrightHead]
                          simp [parseProtectedNodes?, hnode, hleftSpine,
                            hleftHead, htail, hrightSpine, hrightHead,
                            parseProtected?]

/-- Follow one abstract protected-trie path through arena identifiers. -/
def openedAtNode? (arena : Arena ι) : ι → BitWord → Bool
  | node, [] => (parseProtectedNodes? arena node).isSome
  | node, bit :: rest =>
      match parseProtectedNodes? arena node with
      | none => false
      | some view =>
          openedAtNode? arena (if bit then view.right else view.left) rest

/-- Alias-insensitive agreement of protected-path parsing with tree readback. -/
theorem openedAtNode?_readback (arena : Arena ι) (node : ι)
    (path : BitWord) :
    openedAtNode? arena node path = openedAt? (arena.readback node) path := by
  induction path generalizing node with
  | nil =>
      unfold openedAtNode? openedAt?
      have parsed := parseProtectedNodes?_readback arena node
      cases hparse : parseProtectedNodes? arena node with
      | none =>
          simp only [hparse, Option.map_none] at parsed
          rw [← parsed]
          rfl
      | some view =>
          simp only [hparse, Option.map_some] at parsed
          rw [← parsed]
          rfl
  | cons bit rest ih =>
      unfold openedAtNode? openedAt?
      have parsed := parseProtectedNodes?_readback arena node
      cases hparse : parseProtectedNodes? arena node with
      | none =>
          simp only [hparse, Option.map_none] at parsed
          rw [← parsed]
          cases bit <;> rfl
      | some view =>
          simp only [hparse, Option.map_some] at parsed
          rw [← parsed]
          cases bit <;> simp only [ite_false, ite_true] <;> apply ih

/-! ## Source-header matching without unfolding -/

/-- Compare one arena node with a supplied ordinary term.  Recursion is on the
finite supplied term; shared arena nodes are never unfolded into a tree. -/
def matchesTerm? (arena : Arena ι) : ι → Term → Bool
  | node, .s =>
      match arena.cell node with
      | .s => true
      | .app _ _ => false
  | node, .app fn arg =>
      match arena.cell node with
      | .s => false
      | .app fnNode argNode =>
          matchesTerm? arena fnNode fn && matchesTerm? arena argNode arg

theorem matchesTerm?_eq_true_iff (arena : Arena ι) (node : ι)
    (term : Term) :
    matchesTerm? arena node term = true ↔ arena.readback node = term := by
  induction term generalizing node with
  | s =>
      cases hcell : arena.cell node with
      | s => simp [matchesTerm?, hcell, arena.readback_of_cell_s hcell]
      | app fn arg =>
          simp [matchesTerm?, hcell, arena.readback_of_cell_app hcell]
  | app fn arg ihFn ihArg =>
      cases hcell : arena.cell node with
      | s => simp [matchesTerm?, hcell, arena.readback_of_cell_s hcell]
      | app fnNode argNode =>
          rw [arena.readback_of_cell_app hcell]
          simp [matchesTerm?, hcell, ihFn, ihArg]

/-- Locate the body only when the physical frozen seed equals the canonical
encoding of the supplied source instance. -/
def sourceBody? (arena : Arena ι) (node : ι) (source : Instance) : Option ι :=
  match parseHeaderNodes? arena node with
  | none => none
  | some view =>
      if matchesTerm? arena view.seed (N (encodeInstance source)) then
        some view.body
      else none

/-- Tree specification of source-indexed header matching. -/
def sourceBodyTerm? (term : Term) (source : Instance) : Option Term :=
  match parseHeader? term with
  | none => none
  | some view =>
      if view.seed = N (encodeInstance source) then some view.body else none

/-- Header matching is alias-insensitive and does not unfold in the algorithm:
only this specification theorem mentions readback. -/
theorem sourceBody?_readback (arena : Arena ι) (node : ι)
    (source : Instance) :
    (sourceBody? arena node source).map arena.readback =
      sourceBodyTerm? (arena.readback node) source := by
  unfold sourceBody? sourceBodyTerm?
  have parsed := parseHeaderNodes?_readback arena node
  cases hheader : parseHeaderNodes? arena node with
  | none =>
      simp only [hheader, Option.map_none] at parsed
      rw [← parsed]
      rfl
  | some view =>
      simp only [hheader, Option.map_some] at parsed
      rw [← parsed]
      by_cases hmatch : matchesTerm? arena view.seed
          (N (encodeInstance source)) = true
      · have hseed := (matchesTerm?_eq_true_iff arena view.seed
          (N (encodeInstance source))).mp hmatch
        simp [hmatch, hseed]
      · have hseed : arena.readback view.seed ≠ N (encodeInstance source) := by
          intro equality
          exact hmatch ((matchesTerm?_eq_true_iff arena view.seed
            (N (encodeInstance source))).mpr equality)
        simp [hmatch, hseed]

/-! ## Counted DAG-local primitives -/

/-- Branch-sensitive metering of the physical header parser.  One tick is one
arena-record inspection. -/
def parseHeaderNodesM? (arena : Arena ι) (node : ι) :
    Meter (Option (HeaderNodes ι)) :=
  match arena.cell node with
  | .s => ⟨none, 1, 1⟩
  | .app fn body =>
      match arena.cell fn with
      | .s => ⟨none, 2, 2⟩
      | .app head seed =>
          match arena.cell head with
          | .s => ⟨some ⟨seed, body⟩, 3, 3⟩
          | .app _ _ => ⟨none, 3, 3⟩

@[simp]
theorem parseHeaderNodesM?_value (arena : Arena ι) (node : ι) :
    (parseHeaderNodesM? arena node).value = parseHeaderNodes? arena node := by
  cases hnode : arena.cell node with
  | s => simp [parseHeaderNodesM?, parseHeaderNodes?, hnode]
  | app fn body =>
      cases hfn : arena.cell fn with
      | s => simp [parseHeaderNodesM?, parseHeaderNodes?, hnode, hfn]
      | app head seed =>
          cases hhead : arena.cell head <;>
            simp [parseHeaderNodesM?, parseHeaderNodes?, hnode, hfn, hhead]

theorem parseHeaderNodesM?_ticks_le (arena : Arena ι) (node : ι) :
    (parseHeaderNodesM? arena node).ticks ≤ 3 := by
  cases hnode : arena.cell node with
  | s => simp [parseHeaderNodesM?, hnode]
  | app fn body =>
      cases hfn : arena.cell fn with
      | s => simp [parseHeaderNodesM?, hnode, hfn]
      | app head seed =>
          cases hhead : arena.cell head <;>
            simp [parseHeaderNodesM?, hnode, hfn, hhead]

/-- Branch-sensitive metering of one protected-node probe. -/
def parseProtectedNodesM? (arena : Arena ι) (node : ι) :
    Meter (Option (ProtectedNodes ι)) :=
  match arena.cell node with
  | .s => ⟨none, 1, 1⟩
  | .app leftSpine tail =>
      match arena.cell leftSpine with
      | .s => ⟨none, 2, 2⟩
      | .app leftHead left =>
          match arena.cell leftHead with
          | .app _ _ => ⟨none, 3, 3⟩
          | .s =>
              match arena.cell tail with
              | .s => ⟨none, 4, 4⟩
              | .app rightSpine junk =>
                  match arena.cell rightSpine with
                  | .s => ⟨none, 5, 5⟩
                  | .app rightHead right =>
                      match arena.cell rightHead with
                      | .s => ⟨some ⟨left, right, junk⟩, 6, 6⟩
                      | .app _ _ => ⟨none, 6, 6⟩

@[simp]
theorem parseProtectedNodesM?_value (arena : Arena ι) (node : ι) :
    (parseProtectedNodesM? arena node).value =
      parseProtectedNodes? arena node := by
  cases hnode : arena.cell node with
  | s => simp [parseProtectedNodesM?, parseProtectedNodes?, hnode]
  | app leftSpine tail =>
      cases hleftSpine : arena.cell leftSpine with
      | s =>
          simp [parseProtectedNodesM?, parseProtectedNodes?, hnode,
            hleftSpine]
      | app leftHead left =>
          cases hleftHead : arena.cell leftHead with
          | app first second =>
              simp [parseProtectedNodesM?, parseProtectedNodes?, hnode,
                hleftSpine, hleftHead]
          | s =>
              cases htail : arena.cell tail with
              | s =>
                  simp [parseProtectedNodesM?, parseProtectedNodes?, hnode,
                    hleftSpine, hleftHead, htail]
              | app rightSpine junk =>
                  cases hrightSpine : arena.cell rightSpine with
                  | s =>
                      simp [parseProtectedNodesM?, parseProtectedNodes?, hnode,
                        hleftSpine, hleftHead, htail, hrightSpine]
                  | app rightHead right =>
                      cases hrightHead : arena.cell rightHead <;>
                        simp [parseProtectedNodesM?, parseProtectedNodes?,
                          hnode, hleftSpine, hleftHead, htail, hrightSpine,
                          hrightHead]

theorem parseProtectedNodesM?_ticks_le (arena : Arena ι) (node : ι) :
    (parseProtectedNodesM? arena node).ticks ≤ 6 := by
  cases hnode : arena.cell node with
  | s => simp [parseProtectedNodesM?, hnode]
  | app leftSpine tail =>
      cases hleftSpine : arena.cell leftSpine with
      | s => simp [parseProtectedNodesM?, hnode, hleftSpine]
      | app leftHead left =>
          cases hleftHead : arena.cell leftHead with
          | app first second =>
              simp [parseProtectedNodesM?, hnode, hleftSpine, hleftHead]
          | s =>
              cases htail : arena.cell tail with
              | s =>
                  simp [parseProtectedNodesM?, hnode, hleftSpine, hleftHead,
                    htail]
              | app rightSpine junk =>
                  cases hrightSpine : arena.cell rightSpine with
                  | s =>
                      simp [parseProtectedNodesM?, hnode, hleftSpine,
                        hleftHead, htail, hrightSpine]
                  | app rightHead right =>
                      cases hrightHead : arena.cell rightHead <;>
                        simp [parseProtectedNodesM?, hnode, hleftSpine,
                          hleftHead, htail, hrightSpine, hrightHead]

/-- Metered comparison with one supplied ordinary term.  The recursion follows
the supplied term, not the arena readback, and short-circuits after a failed
left comparison. -/
def matchesTermM? (arena : Arena ι) : ι → Term → Meter Bool
  | node, .s =>
      match arena.cell node with
      | .s => ⟨true, 1, 1⟩
      | .app _ _ => ⟨false, 1, 1⟩
  | node, .app fn arg =>
      match arena.cell node with
      | .s => ⟨false, 1, 1⟩
      | .app fnNode argNode =>
          let left := matchesTermM? arena fnNode fn
          if left.value then
            let right := matchesTermM? arena argNode arg
            ⟨right.value, left.ticks + right.ticks + 1,
              Nat.max left.peak right.peak + 1⟩
          else
            ⟨false, left.ticks + 1, left.peak + 1⟩

@[simp]
theorem matchesTermM?_value (arena : Arena ι) (node : ι) (term : Term) :
    (matchesTermM? arena node term).value = matchesTerm? arena node term := by
  induction term generalizing node with
  | s =>
      cases hcell : arena.cell node <;>
        simp [matchesTermM?, matchesTerm?, hcell]
  | app fn arg ihFn ihArg =>
      cases hcell : arena.cell node with
      | s => simp [matchesTermM?, matchesTerm?, hcell]
      | app fnNode argNode =>
          simp only [matchesTermM?, matchesTerm?, hcell]
          rw [ihFn, ihArg]
          cases hleft : matchesTerm? arena fnNode fn <;> simp [hleft]

theorem matchesTermM?_ticks_le (arena : Arena ι) (node : ι)
    (term : Term) :
    (matchesTermM? arena node term).ticks ≤ term.size := by
  induction term generalizing node with
  | s =>
      cases hcell : arena.cell node <;>
        simp [matchesTermM?, hcell, Term.size]
  | app fn arg ihFn ihArg =>
      cases hcell : arena.cell node with
      | s => simp [matchesTermM?, hcell, Term.size]
      | app fnNode argNode =>
          simp only [matchesTermM?, hcell]
          by_cases hleft : (matchesTermM? arena fnNode fn).value = true
          · rw [if_pos hleft]
            simp only [Meter.ticks, Term.size]
            have hfn := ihFn fnNode
            have harg := ihArg argNode
            simpa [Nat.succ_eq_add_one] using
              Nat.succ_le_succ (Nat.add_le_add hfn harg)
          · rw [if_neg hleft]
            simp only [Meter.ticks, Term.size]
            have hfn := ihFn fnNode
            simpa [Nat.succ_eq_add_one] using
              Nat.succ_le_succ
                (Nat.le_trans hfn (Nat.le_add_right fn.size arg.size))

/-- Metered protected-path traversal.  Each level performs exactly one
branch-sensitive protected-node probe. -/
def openedAtNodeM? (arena : Arena ι) : ι → BitWord → Meter Bool
  | node, [] =>
      let parsed := parseProtectedNodesM? arena node
      ⟨parsed.value.isSome, parsed.ticks, parsed.peak⟩
  | node, bit :: rest =>
      let parsed := parseProtectedNodesM? arena node
      match parsed.value with
      | none => ⟨false, parsed.ticks, parsed.peak⟩
      | some view =>
          let tail := openedAtNodeM? arena
            (if bit then view.right else view.left) rest
          ⟨tail.value, parsed.ticks + tail.ticks,
            Nat.max parsed.peak tail.peak⟩

@[simp]
theorem openedAtNodeM?_value (arena : Arena ι) (node : ι)
    (path : BitWord) :
    (openedAtNodeM? arena node path).value = openedAtNode? arena node path := by
  induction path generalizing node with
  | nil => simp [openedAtNodeM?, openedAtNode?]
  | cons bit rest ih =>
      simp only [openedAtNodeM?, openedAtNode?, parseProtectedNodesM?_value]
      cases hparsed : parseProtectedNodes? arena node with
      | none => rfl
      | some view =>
          simp only
          exact ih (if bit then view.right else view.left)

theorem openedAtNodeM?_ticks_le (arena : Arena ι) (node : ι)
    (path : BitWord) :
    (openedAtNodeM? arena node path).ticks ≤ 6 * (path.length + 1) := by
  induction path generalizing node with
  | nil =>
      simpa [openedAtNodeM?] using parseProtectedNodesM?_ticks_le arena node
  | cons bit rest ih =>
      simp only [openedAtNodeM?]
      cases hparsed : (parseProtectedNodesM? arena node).value with
      | none =>
          simp only [hparsed, Meter.ticks, List.length_cons]
          have hprobe := parseProtectedNodesM?_ticks_le arena node
          exact Nat.le_trans hprobe
            (Nat.mul_le_mul_left 6
              (Nat.succ_le_succ (Nat.zero_le (rest.length + 1))))
      | some view =>
          simp only [hparsed, Meter.ticks, List.length_cons]
          have hprobe := parseProtectedNodesM?_ticks_le arena node
          have htail := ih (if bit then view.right else view.left)
          calc
            (parseProtectedNodesM? arena node).ticks +
                (openedAtNodeM? arena
                  (if bit then view.right else view.left) rest).ticks ≤
              6 + 6 * (rest.length + 1) := Nat.add_le_add hprobe htail
            _ = 6 * (rest.length + 1 + 1) := by
              rw [Nat.mul_succ]
              exact Nat.add_comm _ _

/-- Metered source/header check.  It charges physical header inspection,
short-circuit seed comparison, and one branch decision. -/
def sourceBodyM? (arena : Arena ι) (node : ι) (source : Instance) :
    Meter (Option ι) :=
  let header := parseHeaderNodesM? arena node
  match header.value with
  | none => ⟨none, header.ticks + 1, header.peak + 1⟩
  | some view =>
      let matched := matchesTermM? arena view.seed (N (encodeInstance source))
      ⟨if matched.value then some view.body else none,
        header.ticks + matched.ticks + 1,
        Nat.max header.peak matched.peak + 1⟩

@[simp]
theorem sourceBodyM?_value (arena : Arena ι) (node : ι)
    (source : Instance) :
    (sourceBodyM? arena node source).value = sourceBody? arena node source := by
  simp only [sourceBodyM?, sourceBody?, parseHeaderNodesM?_value]
  cases hheader : parseHeaderNodes? arena node with
  | none => rfl
  | some view =>
      simp only [matchesTermM?_value]

theorem sourceBodyM?_ticks_le (arena : Arena ι) (node : ι)
    (source : Instance) :
    (sourceBodyM? arena node source).ticks ≤
      4 + (N (encodeInstance source)).size := by
  simp only [sourceBodyM?]
  cases hheader : (parseHeaderNodesM? arena node).value with
  | none =>
      simp only [hheader, Meter.ticks]
      have hprobe := parseHeaderNodesM?_ticks_le arena node
      exact Nat.le_trans
        (by simpa [Nat.succ_eq_add_one] using Nat.succ_le_succ hprobe)
        (Nat.le_add_right 4 (N (encodeInstance source)).size)
  | some view =>
      simp only [hheader, Meter.ticks]
      have hprobe := parseHeaderNodesM?_ticks_le arena node
      have hseed := matchesTermM?_ticks_le arena view.seed
        (N (encodeInstance source))
      change Nat.succ
          ((parseHeaderNodesM? arena node).ticks +
            (matchesTermM? arena view.seed
              (N (encodeInstance source))).ticks) ≤
        Nat.succ 3 + (N (encodeInstance source)).size
      rw [Nat.succ_add]
      exact Nat.succ_le_succ (Nat.add_le_add hprobe hseed)

/-! ## Counted DAG-local terminal certificate -/

/-- One supplied protected certificate checked directly against a shared
arena.  The source is an explicit observation parameter and must match the
literal frozen header. -/
def terminalCertificate? (store : FiniteArena ι) (source : Instance)
    (history payload : BitWord) : Bool :=
  match sourceBody? store.arena store.arena.root source with
  | none => false
  | some body =>
      openedAtNode? store.arena body (a history payload) &&
        terminalCandidate? source history payload

/-- Executed one-record DAG observer.  Failure of the physical header or
protected path short-circuits before tableau verification. -/
def runTerminalCertificate (store : FiniteArena ι) (source : Instance)
    (history payload : BitWord) : Meter Bool :=
  let bodyCheck := sourceBodyM? store.arena store.arena.root source
  match bodyCheck.value with
  | none => ⟨false, bodyCheck.ticks + 1, bodyCheck.peak + 1⟩
  | some body =>
      let opened := openedAtNodeM? store.arena body (a history payload)
      if opened.value then
        let terminal := runTerminalCandidate source history payload
        ⟨terminal.value,
          bodyCheck.ticks + opened.ticks + terminal.ticks + 2,
          Nat.max bodyCheck.peak (Nat.max opened.peak terminal.peak) + 2⟩
      else
        ⟨false, bodyCheck.ticks + opened.ticks + 2,
          Nat.max bodyCheck.peak opened.peak + 2⟩

@[simp]
private theorem runTerminalCertificate_value_raw (store : FiniteArena ι)
    (source : Instance) (history payload : BitWord) :
    (runTerminalCertificate store source history payload).value =
      match (sourceBodyM? store.arena store.arena.root source).value with
      | none => false
      | some body =>
          if (openedAtNodeM? store.arena body (a history payload)).value then
            (runTerminalCandidate source history payload).value
          else false := by
  unfold runTerminalCertificate
  cases hbody : (sourceBodyM? store.arena store.arena.root source).value with
  | none => simp only [hbody]
  | some body =>
      cases hopened :
          (openedAtNodeM? store.arena body (a history payload)).value with
      | false =>
          simp only [hbody, hopened]
          have hne : ¬ (false = true) := by
            intro h
            exact Bool.noConfusion h
          rw [if_neg hne, if_neg hne]
      | true =>
          simp only [hbody, hopened]
          rw [if_pos True.intro, if_pos True.intro]

@[simp]
theorem runTerminalCertificate_value (store : FiniteArena ι)
    (source : Instance) (history payload : BitWord) :
    (runTerminalCertificate store source history payload).value =
      terminalCertificate? store source history payload := by
  rw [runTerminalCertificate_value_raw, sourceBodyM?_value]
  unfold terminalCertificate?
  cases hbody : sourceBody? store.arena store.arena.root source with
  | none => rfl
  | some body =>
      simp only [openedAtNodeM?_value]
      cases hopened : openedAtNode? store.arena body (a history payload) with
      | false => rfl
      | true =>
          exact runTerminalCandidate_value source history payload

/-- Concrete cell-inspection bound for one supplied record.  The store is not
enumerated: the only unbounded arena work is the supplied protected path. -/
def terminalCertificateTimeBound (source : Instance)
    (history payload : BitWord) : Nat :=
  6 + (N (encodeInstance source)).size +
    6 * ((a history payload).length + 1) +
    terminalCandidateTimeBound source history payload

theorem runTerminalCertificate_ticks_le (store : FiniteArena ι)
    (source : Instance) (history payload : BitWord) :
    (runTerminalCertificate store source history payload).ticks ≤
      terminalCertificateTimeBound source history payload := by
  unfold runTerminalCertificate terminalCertificateTimeBound
  cases hbody : (sourceBodyM? store.arena store.arena.root source).value with
  | none =>
      simp only [hbody, Meter.ticks]
      have hsource := sourceBodyM?_ticks_le store.arena store.arena.root source
      have hsource' :
          (sourceBodyM? store.arena store.arena.root source).ticks + 1 ≤
            5 + (N (encodeInstance source)).size := by
        change Nat.succ
            (sourceBodyM? store.arena store.arena.root source).ticks ≤
          Nat.succ 4 + (N (encodeInstance source)).size
        rw [Nat.succ_add]
        exact Nat.succ_le_succ hsource
      exact Nat.le_trans hsource' <| Nat.le_trans
        (Nat.add_le_add_right (by decide : 5 ≤ 6)
          (N (encodeInstance source)).size)
        (Nat.le_trans
          (Nat.le_add_right
            (6 + (N (encodeInstance source)).size)
            (6 * ((a history payload).length + 1)))
          (Nat.le_add_right
            (6 + (N (encodeInstance source)).size +
              6 * ((a history payload).length + 1))
            (terminalCandidateTimeBound source history payload)))
  | some body =>
      simp only [hbody]
      by_cases hopened :
          (openedAtNodeM? store.arena body (a history payload)).value = true
      · rw [if_pos hopened]
        simp only [Meter.ticks]
        have hsource := sourceBodyM?_ticks_le store.arena store.arena.root source
        have hpath := openedAtNodeM?_ticks_le store.arena body
          (a history payload)
        have hterminal := runTerminalCandidate_ticks_le source history payload
        have hsum := Nat.add_le_add
          (Nat.add_le_add hsource hpath) hterminal
        calc
          (sourceBodyM? store.arena store.arena.root source).ticks +
                (openedAtNodeM? store.arena body
                  (a history payload)).ticks +
              (runTerminalCandidate source history payload).ticks + 2 ≤
            (4 + (N (encodeInstance source)).size +
                6 * ((a history payload).length + 1) +
              terminalCandidateTimeBound source history payload) + 2 :=
                Nat.add_le_add_right hsum 2
          _ = 6 + (N (encodeInstance source)).size +
                6 * ((a history payload).length + 1) +
              terminalCandidateTimeBound source history payload := by
                rw [Nat.add_right_comm
                  (4 + (N (encodeInstance source)).size +
                    6 * ((a history payload).length + 1))
                  (terminalCandidateTimeBound source history payload) 2]
                rw [Nat.add_right_comm
                  (4 + (N (encodeInstance source)).size)
                  (6 * ((a history payload).length + 1)) 2]
                rw [Nat.add_right_comm 4
                  (N (encodeInstance source)).size 2]
      · rw [if_neg hopened]
        simp only [Meter.ticks]
        have hsource := sourceBodyM?_ticks_le store.arena store.arena.root source
        have hpath := openedAtNodeM?_ticks_le store.arena body
          (a history payload)
        have hsum := Nat.add_le_add hsource hpath
        have hbase :
            (sourceBodyM? store.arena store.arena.root source).ticks +
                (openedAtNodeM? store.arena body
                  (a history payload)).ticks + 2 ≤
              6 + (N (encodeInstance source)).size +
                6 * ((a history payload).length + 1) := by
          calc
            (sourceBodyM? store.arena store.arena.root source).ticks +
                  (openedAtNodeM? store.arena body
                    (a history payload)).ticks + 2 ≤
                (4 + (N (encodeInstance source)).size +
                  6 * ((a history payload).length + 1)) + 2 :=
                    Nat.add_le_add_right hsum 2
            _ = 6 + (N (encodeInstance source)).size +
                  6 * ((a history payload).length + 1) := by
                    rw [Nat.add_right_comm
                      (4 + (N (encodeInstance source)).size)
                      (6 * ((a history payload).length + 1)) 2]
                    rw [Nat.add_right_comm 4
                      (N (encodeInstance source)).size 2]
        exact Nat.le_trans hbase
          (Nat.le_add_right
            (6 + (N (encodeInstance source)).size +
              6 * ((a history payload).length + 1))
            (terminalCandidateTimeBound source history payload))

/-- A store-explicit ledger bound.  The stronger theorem above is independent
of retained or live cardinality because one-record observation never scans the
store. -/
def retainedLiveTerminalTimeBound (store : FiniteArena ι)
    (source : Instance) (history payload : BitWord) : Nat :=
  store.retainedCard + store.liveCard +
    terminalCertificateTimeBound source history payload

theorem runTerminalCertificate_ticks_le_retainedLive
    (store : FiniteArena ι) (source : Instance)
    (history payload : BitWord) :
    (runTerminalCertificate store source history payload).ticks ≤
      retainedLiveTerminalTimeBound store source history payload := by
  exact Nat.le_trans
    (runTerminalCertificate_ticks_le store source history payload)
    (Nat.le_add_left _ (store.retainedCard + store.liveCard))

/-- Tree-level specification for one source-indexed literal terminal record. -/
def terminalRecordOnTerm? (source : Instance) (term : Term)
    (history payload : BitWord) : Bool :=
  match sourceBodyTerm? term source with
  | none => false
  | some body =>
      openedAt? body (a history payload) &&
        terminalCandidate? source history payload

theorem sourceBodyTerm?_eq_some_iff (term : Term) (source : Instance)
    (body : Term) :
    sourceBodyTerm? term source = some body ↔
      term = seededHeader (encodeInstance source) body := by
  constructor
  · intro found
    unfold sourceBodyTerm? at found
    cases hparse : parseHeader? term with
    | none => simp [hparse] at found
    | some view =>
        by_cases hseed : view.seed = N (encodeInstance source)
        · simp [hparse, hseed] at found
          subst body
          have reconstructed := parseHeader?_sound hparse
          rw [reconstructed, hseed]
          rfl
        · simp [hparse, hseed] at found
  · intro equality
    subst term
    simp [sourceBodyTerm?, seededHeader]

/-- Exact agreement with one supplied record of the public current-term
observer.  This theorem deliberately does not enumerate the observer's whole
output list. -/
theorem terminalRecordOnTerm?_eq_true_iff_labelledProjection
    (source : Instance) (term body : Term) (history payload : BitWord)
    (hbody : sourceBodyTerm? term source = some body) :
    terminalRecordOnTerm? source term history payload = true ↔
      ∃ label,
        List.Mem ⟨history, payload, label⟩ (labelledProjection term) ∧
        label.terminal = true := by
  have hterm := (sourceBodyTerm?_eq_some_iff term source body).mp hbody
  constructor
  · intro accepted
    unfold terminalRecordOnTerm? at accepted
    rw [hbody] at accepted
    have split := (Bool.and_eq_true _ _).mp accepted
    obtain ⟨label, hlabel, hterminal⟩ :=
      (terminalCandidate?_eq_true_iff source history payload).mp split.2
    refine ⟨label, ?_, hterminal⟩
    rw [hterm]
    simp only [labelledProjection,
      headerBits?_seededHeader, decodeInstance?_encodeInstance]
    apply mem_collectLabels_of_candidate source _ history payload label
    · have opened : OpenedAt body (a history payload) :=
        (openedAt?_eq_true_iff).mp split.1
      simpa [seededHeader] using
        (mem_anchoredOpenedPaths_header_iff
          (N (encodeInstance source)) body (a history payload)).mpr opened
    · exact hlabel
  · rintro ⟨label, hmember, hterminal⟩
    have hmember' := hmember
    rw [hterm] at hmember'
    simp only [labelledProjection,
      headerBits?_seededHeader, decodeInstance?_encodeInstance] at hmember'
    have literal := mem_collectLabels source _ ⟨history, payload, label⟩
      hmember'
    have opened : OpenedAt body (a history payload) := by
      exact (mem_anchoredOpenedPaths_header_iff
        (N (encodeInstance source)) body (a history payload)).mp
          (by simpa [seededHeader] using literal.1)
    have hopen : openedAt? body (a history payload) = true :=
      opened.to_openedAt?_eq_true
    have hcandidate : terminalCandidate? source history payload = true := by
      unfold terminalCandidate?
      rw [literal.2]
      exact hterminal
    unfold terminalRecordOnTerm?
    rw [hbody]
    exact (Bool.and_eq_true _ _).mpr ⟨hopen, hcandidate⟩

/-- The DAG-local terminal check is exactly the corresponding current-term
check on readback.  This is the alias-insensitive observer agreement needed by
bounded shared reachability. -/
theorem terminalCertificate?_readback
    (store : FiniteArena ι) (source : Instance)
    (history payload : BitWord) :
    terminalCertificate? store source history payload =
      terminalRecordOnTerm? source store.arena.rootReadback history payload := by
  unfold terminalCertificate? terminalRecordOnTerm?
  unfold Arena.rootReadback
  cases hbody : sourceBody? store.arena store.arena.root source with
  | none =>
      have specification := sourceBody?_readback store.arena
        store.arena.root source
      rw [hbody] at specification
      rw [← specification]
      rfl
  | some body =>
      have specification := sourceBody?_readback store.arena
        store.arena.root source
      rw [hbody] at specification
      rw [← specification]
      simp only [Option.map_some]
      rw [openedAtNode?_readback]

end DAGLocalObserver

end PureSFormal.CostModel
