import PureSFormal.PureS.Actions

/-!
# Complete finite CTS action dispatchers

The generic route-development modules work with an arbitrary finite binary
tree.  A scheduler, however, must contain a leaf for every action selected by
a CTS phase and front bit.  This file constructs that tree without choice and
proves its completeness from the positive program period.
-/

namespace PureSFormal.PureS

namespace Dispatcher

namespace Tree

/-- A right-associated binary tree containing a supplied nonempty list. -/
def chain : Label → List Label → Tree Label
  | first, [] => .leaf first
  | first, next :: rest => .node (.leaf first) (chain next rest)

@[simp]
theorem leaves_chain (first : Label) (rest : List Label) :
    (chain first rest).leaves = first :: rest := by
  induction rest generalizing first with
  | nil => rfl
  | cons next rest ih =>
      simp only [chain, leaves, ih, List.singleton_append]

@[simp]
theorem leafCount_chain (first : Label) (rest : List Label) :
    (chain first rest).leafCount = rest.length + 1 := by
  rw [← leaves_length, leaves_chain, List.length_cons]

/--
Turn a possibly empty list into a tree.  The fallback is used only in the
empty case; action dispatchers below are proved nonempty.
-/
def ofList (fallback : Label) : List Label → Tree Label
  | [] => .leaf fallback
  | first :: rest => chain first rest

theorem leaves_ofList_of_ne_nil (fallback : Label) (labels : List Label)
    (hne : labels ≠ []) :
    (ofList fallback labels).leaves = labels := by
  cases labels with
  | nil => contradiction
  | cons first rest => exact leaves_chain first rest

/-- Every label occurring among the leaves is reached by a structural route. -/
theorem exists_hasRoute_of_mem_leaves
    {tree : Tree Label} {label : Label}
    (hmem : label ∈ tree.leaves) :
    ∃ route, HasRoute tree route label := by
  induction tree with
  | leaf stored =>
      simp only [leaves, List.mem_singleton] at hmem
      subst label
      exact ⟨[], .leaf stored⟩
  | node left right leftIH rightIH =>
      simp only [leaves, List.mem_append] at hmem
      cases hmem with
      | inl hleft =>
          obtain ⟨route, routeProof⟩ := leftIH hleft
          exact ⟨.left :: route, .left routeProof⟩
      | inr hright =>
          obtain ⟨route, routeProof⟩ := rightIH hright
          exact ⟨.right :: route, .right routeProof⟩

/-- Executably select the first root-to-leaf route carrying a target label. -/
def findRoute? [DecidableEq Label] : Tree Label → Label → Option Route
  | .leaf stored, target =>
      if stored = target then some [] else none
  | .node left right, target =>
      match findRoute? left target with
      | some route => some (.left :: route)
      | none =>
          match findRoute? right target with
          | some route => some (.right :: route)
          | none => none

/-- Every route returned by executable search reaches the requested label. -/
theorem findRoute?_sound [DecidableEq Label]
    {tree : Tree Label} {target : Label} {route : Route}
    (hfind : findRoute? tree target = some route) :
    HasRoute tree route target := by
  induction tree generalizing route with
  | leaf stored =>
      simp only [findRoute?] at hfind
      split at hfind
      next heq =>
        subst target
        cases hfind
        exact .leaf stored
      next => contradiction
  | node left right leftIH rightIH =>
      simp only [findRoute?] at hfind
      generalize hleft : findRoute? left target = leftResult at hfind
      cases leftResult with
      | some leftRoute =>
          cases hfind
          exact .left (leftIH hleft)
      | none =>
          generalize hright : findRoute? right target = rightResult at hfind
          cases rightResult with
          | none => contradiction
          | some rightRoute =>
              cases hfind
              exact .right (rightIH hright)

/-- Structural reachability makes executable route search succeed. -/
theorem findRoute?_complete [DecidableEq Label]
    {tree : Tree Label} {target : Label}
    (path : ∃ route, HasRoute tree route target) :
    ∃ route, findRoute? tree target = some route := by
  obtain ⟨witness, path⟩ := path
  induction path with
  | leaf label =>
      exact ⟨[], by simp [findRoute?]⟩
  | @left route label left right path ih =>
      obtain ⟨selected, hselected⟩ := ih
      exact ⟨.left :: selected, by simp [findRoute?, hselected]⟩
  | @right route label left right path ih =>
      generalize hleft : findRoute? left label = leftResult
      cases leftResult with
      | some selected =>
          exact ⟨.left :: selected, by simp [findRoute?, hleft]⟩
      | none =>
          obtain ⟨selected, hselected⟩ := ih
          exact ⟨.right :: selected, by simp [findRoute?, hleft, hselected]⟩

end Tree

end Dispatcher

/-- Interleave the zero and one action belonging to each listed phase. -/
def phaseActions : List (Fin period) → List (Fin period × Bool)
  | [] => []
  | phase :: phases =>
      (phase, false) :: (phase, true) :: phaseActions phases

@[simp]
theorem length_phaseActions (phases : List (Fin period)) :
    (phaseActions phases).length = 2 * phases.length := by
  induction phases with
  | nil => rfl
  | cons phase phases ih =>
      simp only [phaseActions, List.length_cons, ih, Nat.mul_succ]

/-- Both bit actions occur whenever their phase occurs in the source list. -/
theorem mem_phaseActions_of_mem
    {phase : Fin period} {phases : List (Fin period)}
    (hphase : phase ∈ phases) (bit : Bool) :
    (phase, bit) ∈ phaseActions phases := by
  induction hphase with
  | head phases =>
      cases bit with
      | false => exact .head _
      | true => exact .tail _ (.head _)
  | tail first hphase ih =>
      exact .tail _ (.tail _ ih)

/-- All phase/bit actions in phase-major, zero-before-one order. -/
def allActionLabels (program : CTS.Program) : List (ActionLabel program) :=
  phaseActions (List.finRange program.period)

theorem phase_mem_finRange {period : Nat} (phase : Fin period) :
    phase ∈ List.finRange period := by
  have hbound : phase.val < (List.finRange period).length := by
    rw [List.length_finRange]
    exact phase.isLt
  apply List.mem_of_getElem (i := phase.val) (h := hbound)
  apply Fin.ext
  simp

theorem allActionLabels_ne_nil (program : CTS.Program) :
    allActionLabels program ≠ [] := by
  intro hempty
  have hzero : CTS.zeroPhase program ∈ List.finRange program.period := by
    exact phase_mem_finRange (CTS.zeroPhase program)
  have hpair :
      (CTS.zeroPhase program, false) ∈ allActionLabels program := by
    exact mem_phaseActions_of_mem hzero false
  rw [hempty] at hpair
  cases hpair

/--
A canonical complete-tree witness.  Its right-associated layout is useful for
generic existence proofs; a compiled scheduler may supply any other finite
layout satisfying `ActionDispatcher.route_valid` below.
-/
def actionTree (program : CTS.Program) :
    Dispatcher.Tree (ActionLabel program) :=
  Dispatcher.Tree.ofList (CTS.zeroPhase program, false)
    (allActionLabels program)

@[simp]
theorem actionTree_leaves (program : CTS.Program) :
    (actionTree program).leaves = allActionLabels program := by
  exact Dispatcher.Tree.leaves_ofList_of_ne_nil _ _
    (allActionLabels_ne_nil program)

theorem mem_allActionLabels (program : CTS.Program)
    (label : ActionLabel program) :
    label ∈ allActionLabels program := by
  rcases label with ⟨phase, bit⟩
  exact mem_phaseActions_of_mem (phase_mem_finRange phase) bit

@[simp]
theorem length_allActionLabels (program : CTS.Program) :
    (allActionLabels program).length = 2 * program.period := by
  simp only [allActionLabels, length_phaseActions, List.length_finRange]

@[simp]
theorem actionTree_leafCount (program : CTS.Program) :
    (actionTree program).leafCount = 2 * program.period := by
  rw [← Dispatcher.Tree.leaves_length, actionTree_leaves,
    length_allActionLabels]

/-- Every possible phase/bit action has a route in the generated tree. -/
theorem actionTree_complete (program : CTS.Program)
    (label : ActionLabel program) :
    ∃ route, Dispatcher.HasRoute (actionTree program) route label := by
  apply Dispatcher.Tree.exists_hasRoute_of_mem_leaves
  rw [actionTree_leaves]
  exact mem_allActionLabels program label

/-- Executable lookup also reaches every possible action. -/
theorem actionTree_lookup_complete (program : CTS.Program)
    (label : ActionLabel program) :
    ∃ route, (actionTree program).lookup? route = some label := by
  obtain ⟨route, path⟩ := actionTree_complete program label
  exact ⟨route, path.lookup⟩

/--
The exact interface required of a compiled CTS dispatcher.  Completeness is
data, so transition theorems do not use choice to recover a route and do not
depend on one particular balancing or leaf-order policy.
-/
structure ActionDispatcher (program : CTS.Program) where
  tree : Dispatcher.Tree (ActionLabel program)
  route : ActionLabel program → Dispatcher.Route
  route_valid : ∀ label, Dispatcher.HasRoute tree (route label) label

namespace ActionDispatcher

/-- Executable route selected in the generic right-associated witness. -/
def canonicalRoute (program : CTS.Program) (label : ActionLabel program) :
    Dispatcher.Route :=
  (Dispatcher.Tree.findRoute? (actionTree program) label).getD []

theorem canonicalRoute_valid (program : CTS.Program)
    (label : ActionLabel program) :
    Dispatcher.HasRoute (actionTree program) (canonicalRoute program label)
      label := by
  obtain ⟨route, hroute⟩ := Dispatcher.Tree.findRoute?_complete
    (actionTree_complete program label)
  have hcanonical : canonicalRoute program label = route := by
    simp [canonicalRoute, hroute]
  rw [hcanonical]
  exact Dispatcher.Tree.findRoute?_sound hroute

/-- The generic right-associated construction supplies executable routes. -/
def canonical (program : CTS.Program) : ActionDispatcher program :=
  ⟨actionTree program, canonicalRoute program, canonicalRoute_valid program⟩

/-- Select a structural route for a specified action without global choice. -/
theorem existsRoute (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) :
    ∃ route, Dispatcher.HasRoute dispatcher.tree route label :=
  ⟨dispatcher.route label, dispatcher.route_valid label⟩

/-- The selected route itself is valid, with no existential elimination. -/
theorem selectedRoute (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) :
    Dispatcher.HasRoute dispatcher.tree (dispatcher.route label) label :=
  dispatcher.route_valid label

/-- Every compiled layout contains exactly one label at a fixed route. -/
theorem routeLabel_unique (dispatcher : ActionDispatcher program)
    {route : Dispatcher.Route} {left right : ActionLabel program}
    (hleft : Dispatcher.HasRoute dispatcher.tree route left)
    (hright : Dispatcher.HasRoute dispatcher.tree route right) :
    left = right :=
  hleft.deterministic hright

end ActionDispatcher

end PureSFormal.PureS
