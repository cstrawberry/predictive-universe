import PureSFormal.Research.RootResetEdgeSpine
import PureSFormal.Research.RootResetCarrierImmediateLive

/-!
# A finite designated-carrier descent machine

Base queue, completed fresh/marked Local accumulator, and tombstone
predecessor edges instantiate the cyclic edge scanner. Every input reaches
an absorbing endpoint within a fixed coefficient times its syntax size;
all runs are read-only. Live cells require no descent for a nonempty test.
The Base pattern compares fixed code only and leaves duplicated continuation
fields independent; generated carrier disjointness is proved explicitly.
Origin return and the endpoint live decision compose with this scan.
-/

namespace PureSFormal.Research.RootResetCarrierNonemptyRows
open PureSFormal.PureS
open RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns

def supports : Pattern → Address → Bool
  | _, [] => true
  | .app left _, .left :: rest => supports left rest
  | .app _ right, .right :: rest => supports right rest
  | _, _ :: _ => false

theorem supports_subterm (pattern : Pattern) (address : Address)
    (supported : supports pattern address = true) (source : Term)
    (matched : pattern.matchesBool source = true) : ∃ target, source.subterm? address = some target := by
  induction address generalizing pattern source with
  | nil => exact ⟨source, Term.subterm?_root source⟩
  | cons side rest ih =>
      cases pattern with
      | hole => cases side <;> simp [supports] at supported
      | s => cases side <;> simp [supports] at supported
      | app left right =>
          obtain ⟨fn, arg, sourceEq, fnMatches, argMatches⟩ := app_matches matched
          subst source
          cases side with
          | left => exact ih left supported fn fnMatches
          | right => exact ih right supported arg argMatches

def environmentPattern (actions : Term) : Pattern :=
  .app .s (.app (.app .s (literal (actCode actions))) (.app .s .hole))

def basePattern (actions : Term) : Pattern :=
  .app (.app .hole (.app (.app (environmentPattern actions)
    (.app (literal b) (environmentPattern actions))) .hole)) .hole

def baseRow (actions : Term) : EdgeRow :=
  ⟨basePattern actions, [.left, .right, .left, .left, .right, .right, .right]⟩

def tombstonePattern (bit : Bool) : Pattern :=
  .app (.app .s .hole) (.app (literal (valueTag bit)) .hole)

def tombstoneRow (bit : Bool) : EdgeRow := ⟨tombstonePattern bit, [.left, .right]⟩

def rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  baseRow (compileActions program tree) ::
    (localRows .fresh program tree ++ localRows .marked program tree ++ [tombstoneRow false, tombstoneRow true])

theorem base_supported (actions : Term) : supports (baseRow actions).pattern (baseRow actions).address = true := rfl
theorem tombstone_supported (bit : Bool) : supports (tombstoneRow bit).pattern (tombstoneRow bit).address = true := rfl

theorem environment_matches (actions payload : Term) :
    (environmentPattern actions).matchesBool (CheckpointDecoder.openEnvironment actions payload) = true := by
  simp only [environmentPattern, CheckpointDecoder.openEnvironment, Pattern.matchesBool, literal_self,
    Bool.true_and, Bool.and_true]

theorem base_matches (actions continuation queue seed beta : Term) :
    (basePattern actions).matchesBool (CheckpointDecoder.openBase actions continuation queue seed beta) = true := by
  simp only [basePattern, CheckpointDecoder.openBase, Pattern.matchesBool, environment_matches,
    literal_self, Bool.true_and, Bool.and_true]

theorem base_misses_local (actions halt dispatcher payload seedAudit continuation continuationAudit : Term) :
    (basePattern actions).matchesBool
      (CheckpointDecoder.openShell halt dispatcher payload seedAudit continuation continuationAudit) = false := rfl

theorem base_misses_live (actions : Term) (bit : Bool) (predecessor : Term) :
    (basePattern actions).matchesBool (.app (live bit) predecessor) = false := by cases bit <;> rfl

theorem base_misses_omega (actions : Term) : (basePattern actions).matchesBool omega = false := rfl

theorem base_tombstone_arity (actions : Term) (bit : Bool) (predecessor audit : Term)
    (matched : (basePattern actions).matchesBool (Carrier.tombstone bit predecessor audit) = true) :
    predecessor.headArity = 3 := by
  have alphaMatched : (Pattern.app (.app (environmentPattern actions)
      (.app (literal b) (environmentPattern actions))) .hole).matchesBool predecessor = true := by
    simpa only [basePattern, Carrier.tombstone, Pattern.matchesBool, Bool.true_and, Bool.and_true] using matched
  obtain ⟨fn, arg, predecessorEq, fnMatched, _⟩ := app_matches alphaMatched
  obtain ⟨environment, seed, fnEq, environmentMatched, _⟩ := app_matches fnMatched
  obtain ⟨head, slots, environmentEq, headMatched, _⟩ := app_matches environmentMatched
  have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound headMatched)
  rw [predecessorEq, fnEq, environmentEq, headEq]
  rfl

theorem base_misses_tombstone_of_arity (actions : Term) (bit : Bool) (predecessor audit : Term)
    (arity : predecessor.headArity ≠ 3) :
    (basePattern actions).matchesBool (Carrier.tombstone bit predecessor audit) = false := by
  cases matched : (basePattern actions).matchesBool (Carrier.tombstone bit predecessor audit) with
  | false => rfl
  | true => exact False.elim (arity (base_tombstone_arity actions bit predecessor audit matched))

theorem base_misses_tombstone_live (actions : Term) (outer inner : Bool) (predecessor audit : Term) :
    (basePattern actions).matchesBool (Carrier.tombstone outer (.app (live inner) predecessor) audit) = false := by
  cases outer <;> cases inner <;> rfl

theorem base_misses_tombstone_path
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation predecessor : Term}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation predecessor decoded)
    (bit : Bool) (audit : Term) :
    (basePattern (compileActions program tree)).matchesBool (Carrier.tombstone bit predecessor audit) = false := by
  cases path with
  | root rootShape =>
      rcases CheckpointRun.rootDecodes_headArity admissible rootShape with five | six
      · apply base_misses_tombstone_of_arity
        intro three
        rw [five] at three
        cases three
      · apply base_misses_tombstone_of_arity
        intro three
        rw [six] at three
        cases three
  | live innerBit inner => exact base_misses_tombstone_live _ bit innerBit _ audit
  | tombstone innerBit innerAudit inner =>
      apply base_misses_tombstone_of_arity
      intro three
      rw [Carrier.headArity_tombstone] at three
      cases three

theorem tombstone_matches (bit : Bool) (predecessor audit : Term) :
    (tombstonePattern bit).matchesBool (Carrier.tombstone bit predecessor audit) = true := by
  simp only [tombstonePattern, Carrier.tombstone, Pattern.matchesBool, literal_self, Bool.true_and, Bool.and_true]

theorem tombstone_sound (bit : Bool) (source : Term)
    (matched : (tombstonePattern bit).matchesBool source = true) :
    ∃ predecessor audit, source = Carrier.tombstone bit predecessor audit := by
  obtain ⟨fn, arg, sourceEq, fnMatched, argMatched⟩ := app_matches matched
  obtain ⟨head, predecessor, fnEq, headMatched, _⟩ := app_matches fnMatched
  obtain ⟨tag, audit, argEq, tagMatched, _⟩ := app_matches argMatched
  have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound headMatched)
  have tagEq : tag = valueTag bit := (literal_matches _ _).mp tagMatched
  refine ⟨predecessor, audit, ?_⟩
  rw [sourceEq, fnEq, argEq, headEq, tagEq]
  rfl

theorem localRows_valid (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : RootResetEdgeFragment.Valid (localRows status program tree) := by
  intro row member
  obtain ⟨dispatch, dispatchMember, rowEq⟩ := map_member_inverse _ _ _ member
  subst row
  refine ⟨?_, ?_⟩
  · intro equal
    cases equal
  intro source matched
  obtain ⟨view, _, _, subterm⟩ := RootResetCarrierImmediateLive.localRow_subterm status program tree
    dispatch dispatchMember source matched
  exact ⟨view.accumulator, subterm⟩

theorem valid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    RootResetEdgeFragment.Valid (rows program tree) := by
  intro row member
  rcases List.mem_cons.mp member with first | later
  · subst row
    refine ⟨?_, supports_subterm _ _ (base_supported _)⟩
    intro h
    cases h
  · rcases List.mem_append.mp later with locals | tombstones
    · rcases List.mem_append.mp locals with fresh | marked
      · exact localRows_valid .fresh program tree row fresh
      · exact localRows_valid .marked program tree row marked
    · rcases List.mem_cons.mp tombstones with zero | one
      · subst row
        refine ⟨?_, supports_subterm _ _ (tombstone_supported false)⟩
        intro h
        cases h
      · have equal := List.mem_singleton.mp one
        subst row
        refine ⟨?_, supports_subterm _ _ (tombstone_supported true)⟩
        intro h
        cases h

abbrev machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetEdgeSpine.machine (rows program tree)

abbrev initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetEdgeSpine.initial (rows program tree)

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    ∃ ticks endpoint noMember,
      ticks ≤ RootResetEdgeSpine.coefficient (rows program tree) * source.size ∧
      FiniteController.run (machine program tree) ticks (initial program tree (Cursor.atRoot source)) =
        ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, endpoint⟩ ∧
      RootResetEdgeSpine.Walks (rows program tree) (Cursor.atRoot source) endpoint ∧
      endpoint.erase = source ∧ RootResetEdgeFragment.select (rows program tree) endpoint.focus = none :=
  RootResetEdgeSpine.atRoot_within _ (valid program tree) source

end PureSFormal.Research.RootResetCarrierNonemptyRows


