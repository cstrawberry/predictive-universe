import PureSFormal.Research.ProtectedTrieMonotoneBuild
import PureSFormal.Research.ProtectedTrieProjection
import PureSFormal.Research.ProtectedTrieSubdivisionMeasure

set_option backward.isDefEq.respectTransparency false

/-!
# Canonical macroedges and directed subdivision

This Research module closes the finite graph-theoretic part of the protected
certificate-trie construction.  It is deliberately verifier-parametric.

The first half extracts the literal protected-field context at a frontier of
a canonical finite trie.  Consequently, promoting one prepared candidate is
not merely some reduction between two canonical representatives: it is the
displayed six- or seven-contraction opening, every proper stage is a projection
stutter, and the last edge has the exact singleton-certificate delta.

The second half gives a reusable directed-subdivision theorem for binary
history trees.  Projection separates interiors of edges with different source
histories.  Thus global pairwise interior disjointness reduces to the local
sibling case.  The protected left/right-field separation theorem supplies that
local case for the concrete opening macros.
-/

namespace PureSFormal.Research.ProtectedTrieSubdivision

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTrieMonotoneBuild
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieSingleOpening
open PureSFormal.Research.ProtectedTrieSubdivisionMeasure

/-! ## Explicit finite directed walks -/

/-- A finite directed walk, retaining every literal vertex. -/
inductive Walk {Vertex : Type} (Edge : Vertex -> Vertex -> Prop) :
    Vertex -> Vertex -> Type where
  | refl (vertex : Vertex) : Walk Edge vertex vertex
  | tail {source middle target : Vertex} :
      Walk Edge source middle -> Edge middle target -> Walk Edge source target

namespace Walk

/-- Literal vertices of a walk, including both endpoints. -/
def vertices {Vertex : Type} {Edge : Vertex -> Vertex -> Prop} :
    {source target : Vertex} -> Walk Edge source target -> List Vertex
  | _, _, .refl vertex => [vertex]
  | _, target, .tail initial _ => initial.vertices ++ [target]

/-- A vertex is internal when it occurs on the walk but is neither endpoint. -/
def Interior {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target : Vertex} (walk : Walk Edge source target)
    (vertex : Vertex) : Prop :=
  List.Mem vertex walk.vertices /\ vertex ≠ source /\ vertex ≠ target

/-- Two walks share no internal target vertex. -/
def InternallyDisjoint {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source1 target1 source2 target2 : Vertex}
    (left : Walk Edge source1 target1) (right : Walk Edge source2 target2) : Prop :=
  forall vertex, left.Interior vertex -> right.Interior vertex -> False

/-- Internal disjointness is symmetric. -/
theorem internallyDisjoint_symm {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source1 target1 source2 target2 : Vertex}
    {left : Walk Edge source1 target1} {right : Walk Edge source2 target2}
    (h : InternallyDisjoint left right) : InternallyDisjoint right left := by
  intro vertex hright hleft
  exact h vertex hleft hright

/-- Concatenate two explicit walks with a common literal endpoint. -/
def append {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source middle : Vertex} (first : Walk Edge source middle) :
    {target : Vertex} -> Walk Edge middle target -> Walk Edge source target
  | _, .refl _ => first
  | _, .tail initial last => .tail (append first initial) last

/-- Transport a literal walk across equal endpoint indices. -/
def castEndpoints {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target source' target' : Vertex}
    (hsource : source = source') (htarget : target = target')
    (walk : Walk Edge source target) : Walk Edge source' target' := by
  subst source'
  subst target'
  exact walk

@[simp]
theorem vertices_castEndpoints {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target source' target' : Vertex}
    (hsource : source = source') (htarget : target = target')
    (walk : Walk Edge source target) :
    (castEndpoints hsource htarget walk).vertices = walk.vertices := by
  subst source'
  subst target'
  rfl

/-- A predicate holds at every literal vertex of an explicit walk. -/
inductive Every {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    (predicate : Vertex -> Prop) :
    {source target : Vertex} -> Walk Edge source target -> Prop where
  | refl {vertex : Vertex} (hvertex : predicate vertex) :
      Every predicate (.refl vertex)
  | tail {source middle target : Vertex}
      {initial : Walk Edge source middle}
      (last : Edge middle target)
      (hinitial : Every predicate initial) (htarget : predicate target) :
      Every predicate (.tail initial last)

namespace Every

/-- `Every` is preserved by literal walk concatenation. -/
theorem append {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {predicate : Vertex -> Prop} {source middle target : Vertex}
    {first : Walk Edge source middle} {second : Walk Edge middle target}
    (hfirst : Every predicate first) (hsecond : Every predicate second) :
    Every predicate (Walk.append first second) := by
  induction hsecond with
  | refl => exact hfirst
  | tail last hinitial htarget ih => exact .tail last ih htarget

/-- Pointwise strengthening preserves `Every`. -/
theorem imp {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {first second : Vertex -> Prop} {source target : Vertex}
    {walk : Walk Edge source target} (hevery : Every first walk)
    (himp : forall vertex, first vertex -> second vertex) :
    Every second walk := by
  induction hevery with
  | refl hvertex => exact .refl (himp _ hvertex)
  | tail last hinitial htarget ih =>
      exact .tail last ih (himp _ htarget)

/-- Recover the predicate at an arbitrary listed vertex. -/
theorem holdsAt {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {predicate : Vertex -> Prop} {source target vertex : Vertex}
    {walk : Walk Edge source target} (hevery : Every predicate walk)
    (hmem : List.Mem vertex walk.vertices) : predicate vertex := by
  induction hevery generalizing vertex with
  | refl hvertex =>
      simp only [Walk.vertices] at hmem
      cases hmem with
      | head => exact hvertex
      | tail _ htail => cases htail
  | tail last hinitial htarget ih =>
      rw [Walk.vertices] at hmem
      rcases List.mem_append.mp hmem with hprefix | hlast
      · exact ih hprefix
      · simp at hlast
        subst vertex
        exact htarget

/-- Build `Every` from the list-of-vertices characterization. -/
theorem of_mem {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {predicate : Vertex -> Prop} {source target : Vertex}
    (walk : Walk Edge source target)
    (hpredicate : forall vertex, List.Mem vertex walk.vertices ->
      predicate vertex) : Every predicate walk := by
  induction walk with
  | refl =>
      apply Every.refl
      apply hpredicate source
      simpa only [Walk.vertices] using
        (List.Mem.head ([] : List Vertex) : List.Mem source [source])
  | @tail middle target initial last ih =>
      apply Every.tail last
      · apply ih
        intro vertex hmem
        apply hpredicate vertex
        rw [Walk.vertices]
        exact List.mem_append.mpr (Or.inl hmem)
      · apply hpredicate target
        rw [Walk.vertices]
        exact List.mem_append.mpr (Or.inr (List.Mem.head _))

end Every

/-- Every explicit walk lists at least its source vertex. -/
theorem vertices_ne_nil {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target : Vertex} (walk : Walk Edge source target) :
    walk.vertices ≠ [] := by
  cases walk with
  | refl => simp [vertices]
  | tail initial last => simp [vertices, initial.vertices_ne_nil]

/-- The target endpoint is always a literal listed vertex. -/
theorem target_mem_vertices {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target : Vertex} (walk : Walk Edge source target) :
    List.Mem target walk.vertices := by
  cases walk with
  | refl => simpa [vertices] using (List.Mem.head ([] : List Vertex))
  | tail initial last =>
      rw [vertices]
      exact List.mem_append.mpr (Or.inr (List.Mem.head _))

/-- The source endpoint is always a literal listed vertex. -/
theorem source_mem_vertices {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target : Vertex} (walk : Walk Edge source target) :
    List.Mem source walk.vertices := by
  induction walk with
  | refl => simpa [vertices] using (List.Mem.head ([] : List Vertex))
  | tail initial last ih =>
      rw [vertices]
      exact List.mem_append.mpr (Or.inl ih)

/-- Literal vertices of concatenated walks, without duplicating the join. -/
theorem vertices_append {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source middle target : Vertex}
    (first : Walk Edge source middle) (second : Walk Edge middle target) :
    (Walk.append first second).vertices =
      first.vertices ++ second.vertices.tail := by
  induction second with
  | refl => simp [Walk.append, vertices]
  | tail initial last ih =>
      simp only [Walk.append, vertices]
      rw [ih]
      have hnonempty := initial.vertices_ne_nil
      cases hverts : initial.vertices with
      | nil => exact False.elim (hnonempty hverts)
      | cons head rest => simp [hverts, List.append_assoc]

/-- An interior of a concatenation lies properly in the prefix or in the suffix. -/
theorem interior_append_cases {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop}
    {source middle target vertex : Vertex}
    (first : Walk Edge source middle) (second : Walk Edge middle target)
    (hvertex : (Walk.append first second).Interior vertex) :
    first.Interior vertex \/ List.Mem vertex second.vertices := by
  have hmem := hvertex.1
  rw [vertices_append] at hmem
  rcases List.mem_append.mp hmem with hfirst | hsecond
  · by_cases hsource : vertex = source
    · exact False.elim (hvertex.2.1 hsource)
    · by_cases hmiddle : vertex = middle
      · subst vertex
        exact Or.inr second.source_mem_vertices
      · exact Or.inl ⟨hfirst, hsource, hmiddle⟩
  · exact Or.inr (List.mem_of_mem_tail hsecond)

/-- All vertices before the final endpoint satisfy a predicate. -/
def BeforeTarget {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    (predicate : Vertex -> Prop) {source target : Vertex}
    (walk : Walk Edge source target) : Prop :=
  forall vertex, List.Mem vertex walk.vertices -> vertex ≠ target ->
    predicate vertex

/-- Concatenating an all-good prefix with a good-before-target suffix. -/
theorem BeforeTarget.append {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {predicate : Vertex -> Prop} {source middle target : Vertex}
    {first : Walk Edge source middle} {second : Walk Edge middle target}
    (hfirst : Every predicate first) (hsecond : BeforeTarget predicate second) :
    BeforeTarget predicate (Walk.append first second) := by
  intro vertex hmem hne
  rw [vertices_append] at hmem
  rcases List.mem_append.mp hmem with hfirstMem | hsecondMem
  · exact hfirst.holdsAt hfirstMem
  · exact hsecond vertex (List.mem_of_mem_tail hsecondMem) hne

/-- Source plus proper-interior facts characterize all pre-target vertices. -/
theorem BeforeTarget.of_source_interior
    {Vertex : Type} [DecidableEq Vertex] {Edge : Vertex -> Vertex -> Prop}
    {predicate : Vertex -> Prop} {source target : Vertex}
    {walk : Walk Edge source target}
    (hsource : predicate source)
    (hinterior : forall vertex, walk.Interior vertex -> predicate vertex) :
    BeforeTarget predicate walk := by
  intro vertex hmem htarget
  by_cases hsourceEq : vertex = source
  · subst vertex
    exact hsource
  · exact hinterior vertex ⟨hmem, hsourceEq, htarget⟩

/-- Endpoint transport preserves all pre-target vertex facts. -/
theorem BeforeTarget.castEndpoints
    {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {predicate : Vertex -> Prop}
    {source target source' target' : Vertex}
    {walk : Walk Edge source target}
    (hsource : source = source') (htarget : target = target')
    (hbefore : BeforeTarget predicate walk) :
    BeforeTarget predicate (Walk.castEndpoints hsource htarget walk) := by
  subst source'
  subst target'
  exact hbefore

/-- Forget an explicit walk to a finite pure-S reduction (early local form). -/
theorem toStepsEarly {source target : Term} (walk : Walk Step source target) :
    Steps source target := by
  induction walk with
  | refl => exact .refl _
  | tail initial last ih => exact .tail ih last

/-- An opened protected path stays open at every later vertex in the cone. -/
theorem every_anchoredOpenedAt_of_source_on_encoder_cone
    (bits path : BitWord) {source target : Term}
    (walk : Walk Step source target) (hreach : Steps (encoder bits) source)
    (hopen : anchoredOpenedAt? source path = true) :
    Every (fun vertex => anchoredOpenedAt? vertex path = true) walk := by
  induction walk with
  | refl => exact .refl hopen
  | @tail middle target initial last ih =>
      have hinitial := ih
      have hmiddleOpen := hinitial.holdsAt initial.target_mem_vertices
      have hmiddleReach : Steps (encoder bits) middle :=
        Steps.trans hreach (toStepsEarly initial)
      rcases encoder_steps_preserves hmiddleReach with
        ⟨body, hbodySteps, hmiddle⟩
      subst middle
      have htargetOpen := seededHeader_anchoredOpenedAt?_step_mono
        hmiddleOpen last
      exact .tail last hinitial htargetOpen

/-- If the endpoint is closed, monotonicity makes every earlier vertex closed. -/
theorem every_anchoredOpenedAt_false_of_target_on_encoder_cone
    (bits path : BitWord) {source target : Term}
    (walk : Walk Step source target) (hreach : Steps (encoder bits) source)
    (hclosed : anchoredOpenedAt? target path = false) :
    Every (fun vertex => anchoredOpenedAt? vertex path = false) walk := by
  induction walk with
  | refl => exact .refl hclosed
  | @tail middle target initial last ih =>
      have hmiddleReach : Steps (encoder bits) middle :=
        Steps.trans hreach (toStepsEarly initial)
      have hmiddleClosed : anchoredOpenedAt? middle path = false := by
        cases hopen : anchoredOpenedAt? middle path with
        | false => rfl
        | true =>
            rcases encoder_steps_preserves hmiddleReach with
              ⟨body, hbodySteps, hmiddle⟩
            subst middle
            have htargetOpen := seededHeader_anchoredOpenedAt?_step_mono
              hopen last
            rw [hclosed] at htargetOpen
            cases htargetOpen
      have hinitial := ih hmiddleClosed
      exact .tail last hinitial hclosed

end Walk

/-! ## Finite history ideals distinguish history-tree vertices -/

namespace HistoryIdeal

/-- Semantic ideal equivalence is reflexive. -/
theorem equivalent_refl (ideal : HistoryIdeal) : ideal.Equivalent ideal :=
  fun _ => Iff.rfl

/-- Semantic ideal equivalence is symmetric. -/
theorem equivalent_symm {left right : HistoryIdeal}
    (h : left.Equivalent right) : right.Equivalent left :=
  fun history => (h history).symm

/-- Semantic ideal equivalence is transitive. -/
theorem equivalent_trans {first second third : HistoryIdeal}
    (h12 : first.Equivalent second) (h23 : second.Equivalent third) :
    first.Equivalent third :=
  fun history => Iff.trans (h12 history) (h23 history)

end HistoryIdeal

/-- The finite branch ideal at `history`: exactly its literal ancestors. -/
def branchIdeal (history : BitWord) : HistoryIdeal :=
  idealOf [history]

/-- Exact membership in a branch ideal. -/
theorem branchIdeal_contains_iff (small history : BitWord) :
    (branchIdeal history).Contains small <-> WordPrefix small history := by
  rw [branchIdeal, idealOf_contains_iff]
  constructor
  · rintro ⟨large, hlarge, hprefix⟩
    have heq : large = history := by
      cases hlarge with
      | head => rfl
      | tail _ htail => cases htail
    simpa [heq] using hprefix
  · intro hprefix
    exact ⟨history, List.Mem.head [], hprefix⟩

/-- Two branch ideals are semantically equal exactly at the same history. -/
theorem branchIdeal_equivalent_iff (left right : BitWord) :
    (branchIdeal left).Equivalent (branchIdeal right) <-> left = right := by
  constructor
  · intro hequiv
    have hleftMem : (branchIdeal left).Contains left :=
      (branchIdeal_contains_iff left left).mpr (WordPrefix.refl left)
    have hrightMem : (branchIdeal right).Contains right :=
      (branchIdeal_contains_iff right right).mpr (WordPrefix.refl right)
    have hleftRight : WordPrefix left right :=
      (branchIdeal_contains_iff left right).mp ((hequiv left).mp hleftMem)
    have hrightLeft : WordPrefix right left :=
      (branchIdeal_contains_iff right left).mp ((hequiv right).mpr hrightMem)
    have hlen : left.length = right.length :=
      Nat.le_antisymm (wordPrefix_length_le hleftRight)
        (wordPrefix_length_le hrightLeft)
    exact WordPrefix.eq_of_length_eq hleftRight hlen
  · intro heq
    subst right
    exact HistoryIdeal.equivalent_refl _

/-- A literal word prefixes itself followed by any suffix. -/
theorem wordPrefix_self_append (stem suffix : BitWord) :
    WordPrefix stem (stem ++ suffix) := by
  induction stem with
  | nil => exact .nil suffix
  | cons bit rest ih => exact .cons bit ih

/-- Route encodings preserve literal history-prefix relations. -/
theorem router_prefix_of_history_prefix {small large : BitWord}
    (hprefix : WordPrefix small large) :
    WordPrefix (router small) (router large) := by
  induction hprefix with
  | nil large =>
      cases large with
      | nil => exact WordPrefix.refl _
      | cons bit rest =>
          exact .cons true (.nil (bit :: router rest))
  | cons bit htail ih => exact .cons true (.cons bit ih)

/-- A descendant router cannot enter an ancestor's certificate region. -/
theorem router_not_prefix_a_of_history_prefix
    {ancestor history : BitWord} (hprefix : WordPrefix ancestor history)
    (payload : BitWord) :
    Not (WordPrefix (router history) (a ancestor payload)) := by
  induction hprefix with
  | nil history =>
      cases history with
      | nil => exact WordPrefix.not_true_false _ _
      | cons bit rest => exact WordPrefix.not_true_false _ _
  | cons bit htail ih =>
      intro h
      exact ih (WordPrefix.tail (WordPrefix.tail h))

/-- A strict prefix of `stem ++ [bit]` already prefixes `stem`. -/
theorem proper_prefix_append_singleton_prefix_self
    {small stem : BitWord} {bit : Bool}
    (hproper : ProperWordPrefix small (stem ++ [bit])) :
    WordPrefix small stem := by
  induction stem generalizing small with
  | nil =>
      cases small with
      | nil => exact .nil []
      | cons head tail =>
          have heq : head :: tail = [bit] :=
            WordPrefix.eq_of_length_eq hproper.1 (by
              have hlen := wordPrefix_length_le hproper.1
              cases tail with
              | nil => simp
              | cons next rest => simp at hlen)
          exact False.elim (hproper.2 heq)
  | cons head stem ih =>
      cases small with
      | nil => exact .nil _
      | cons other small =>
          have hhead : other = head := WordPrefix.head_eq hproper.1
          subst other
          apply WordPrefix.cons head
          apply ih
          exact ⟨WordPrefix.tail hproper.1, fun heq =>
            hproper.2 (congrArg (List.cons head) heq)⟩

/-! ## A verifier-independent directed-subdivision criterion -/

/--
One enabled ordered binary history-tree edge.  Both validity fields are
part of the edge data, so terminal and otherwise invalid extensions do not
occur in the target path family.
-/
structure HistoryEdge (Valid : BitWord -> Prop) where
  source : BitWord
  bit : Bool
  sourceValid : Valid source
  targetValid : Valid (source ++ [bit])

namespace HistoryEdge

/-- The target history obtained by appending the occurrence bit. -/
def target {Valid : BitWord -> Prop} (edge : HistoryEdge Valid) : BitWord :=
  edge.source ++ [edge.bit]

end HistoryEdge

/--
A family of target walks for every ordered binary history edge.  The only
local geometric premise is separation of the two sibling walks.  All other
edge pairs are separated by their literal source-history projections.
-/
structure HistoryEdgePathFamily (Valid : BitWord -> Prop) {Vertex : Type}
    (Edge : Vertex -> Vertex -> Prop) (project : Vertex -> HistoryIdeal) where
  checkpoint : forall history, Valid history -> Vertex
  checkpointProjection : forall history (hvalid : Valid history),
    (project (checkpoint history hvalid)).Equivalent (branchIdeal history)
  edgeWalk : forall edge : HistoryEdge Valid,
    Walk Edge (checkpoint edge.source edge.sourceValid)
      (checkpoint edge.target edge.targetValid)
  interiorProjection : forall (edge : HistoryEdge Valid) (vertex : Vertex),
    (edgeWalk edge).Interior vertex ->
      (project vertex).Equivalent (branchIdeal edge.source)
  siblingInteriors : forall history (hsource : Valid history)
      (hfalse : Valid (history ++ [false]))
      (htrue : Valid (history ++ [true])),
    Walk.InternallyDisjoint
      (edgeWalk ⟨history, false, hsource, hfalse⟩)
      (edgeWalk ⟨history, true, hsource, htrue⟩)

namespace HistoryEdgePathFamily

/-- The semantic projection makes all checkpoint vertices injective. -/
theorem checkpoint_injective {Valid : BitWord -> Prop} {Vertex : Type}
    {Edge : Vertex -> Vertex -> Prop} {project : Vertex -> HistoryIdeal}
    (family : HistoryEdgePathFamily Valid Edge project) :
    forall {left right} (hleft : Valid left) (hright : Valid right),
      family.checkpoint left hleft = family.checkpoint right hright ->
        left = right := by
  intro left right hleft hright heq
  have hproject : project (family.checkpoint left hleft) =
      project (family.checkpoint right hright) := congrArg project heq
  have hcross : (branchIdeal left).Equivalent (branchIdeal right) :=
    HistoryIdeal.equivalent_trans
      (HistoryIdeal.equivalent_symm
        (family.checkpointProjection left hleft))
      (by
        simpa [hproject] using family.checkpointProjection right hright)
  exact (branchIdeal_equivalent_iff left right).mp hcross

/--
Distinct source histories force disjoint edge interiors, independently of
the local shape of either target walk.
-/
theorem interiors_disjoint_of_source_ne {Valid : BitWord -> Prop}
    {Vertex : Type}
    {Edge : Vertex -> Vertex -> Prop} {project : Vertex -> HistoryIdeal}
    (family : HistoryEdgePathFamily Valid Edge project)
    (left right : HistoryEdge Valid)
    (hsource : left.source ≠ right.source) :
    Walk.InternallyDisjoint (family.edgeWalk left) (family.edgeWalk right) := by
  intro vertex hleft hright
  have hleftProjection := family.interiorProjection left vertex hleft
  have hrightProjection := family.interiorProjection right vertex hright
  have hideals : (branchIdeal left.source).Equivalent
      (branchIdeal right.source) :=
    HistoryIdeal.equivalent_trans
      (HistoryIdeal.equivalent_symm hleftProjection) hrightProjection
  exact hsource ((branchIdeal_equivalent_iff _ _).mp hideals)

/-- Every pair of distinct source edges has internally disjoint target walks. -/
theorem pairwise_internally_disjoint {Valid : BitWord -> Prop}
    {Vertex : Type}
    {Edge : Vertex -> Vertex -> Prop} {project : Vertex -> HistoryIdeal}
    (family : HistoryEdgePathFamily Valid Edge project)
    (left right : HistoryEdge Valid) (hne : left ≠ right) :
    Walk.InternallyDisjoint (family.edgeWalk left) (family.edgeWalk right) := by
  by_cases hsource : left.source = right.source
  · rcases left with ⟨leftSource, leftBit, leftValid, leftTargetValid⟩
    rcases right with
      ⟨rightSource, rightBit, rightValid, rightTargetValid⟩
    simp only at hsource
    subst rightSource
    cases leftBit <;> cases rightBit
    · exact False.elim (hne rfl)
    · exact family.siblingInteriors leftSource leftValid
        leftTargetValid rightTargetValid
    · exact Walk.internallyDisjoint_symm
        (family.siblingInteriors leftSource leftValid
          rightTargetValid leftTargetValid)
    · exact False.elim (hne rfl)
  · exact family.interiors_disjoint_of_source_ne left right hsource

/-- No proper edge-path vertex is any checkpoint vertex. -/
theorem interior_checkpoint_disjoint {Valid : BitWord -> Prop}
    {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {project : Vertex -> HistoryIdeal}
    (family : HistoryEdgePathFamily Valid Edge project)
    (edge : HistoryEdge Valid) (vertex : Vertex)
    (hinterior : (family.edgeWalk edge).Interior vertex)
    (history : BitWord) (hvalid : Valid history) :
    vertex ≠ family.checkpoint history hvalid := by
  intro heq
  by_cases hsame : history = edge.source
  · subst history
    have hproof : hvalid = edge.sourceValid := Subsingleton.elim _ _
    subst hvalid
    exact hinterior.2.1 heq
  · have hinteriorProjection :=
      family.interiorProjection edge vertex hinterior
    have hcheckpointProjection :=
      family.checkpointProjection history hvalid
    have hprojectEq : project vertex =
        project (family.checkpoint history hvalid) := congrArg project heq
    have hideals : (branchIdeal edge.source).Equivalent
        (branchIdeal history) :=
      HistoryIdeal.equivalent_trans
        (HistoryIdeal.equivalent_symm hinteriorProjection)
        (by simpa [hprojectEq] using hcheckpointProjection)
    exact hsame ((branchIdeal_equivalent_iff _ _).mp hideals).symm

/--
Verifier-parametric directed-subdivision gate.  Once concrete prepared
checkpoints and their valid-edge walks fill `HistoryEdgePathFamily`, vertex
injectivity and pairwise internal vertex-disjointness require no further
source-machine or target-reduction assumptions.
-/
theorem directed_subdivision_gate {Valid : BitWord -> Prop}
    {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {project : Vertex -> HistoryIdeal}
    (family : HistoryEdgePathFamily Valid Edge project) :
    (forall {left right} (hleft : Valid left) (hright : Valid right),
      family.checkpoint left hleft = family.checkpoint right hright ->
        left = right) /\
    (forall (left right : HistoryEdge Valid), left ≠ right ->
      Walk.InternallyDisjoint
        (family.edgeWalk left) (family.edgeWalk right)) /\
    (forall (edge : HistoryEdge Valid) (vertex : Vertex),
      (family.edgeWalk edge).Interior vertex ->
      forall history (hvalid : Valid history),
        vertex ≠ family.checkpoint history hvalid) := by
  exact ⟨family.checkpoint_injective,
    family.pairwise_internally_disjoint,
    family.interior_checkpoint_disjoint⟩

end HistoryEdgePathFamily

/-! ## Extracting the canonical protected field at a trie frontier -/

namespace PrefixTree

/--
`Frontier tree path` is data, rather than merely a proposition: every strict
prefix of `path` is a node of `tree`, while the field at `path` is empty.
-/
inductive Frontier : PrefixTree -> BitWord -> Type where
  | root : Frontier .empty []
  | left {left : PrefixTree} {path : BitWord}
      (inner : Frontier left path) (right : PrefixTree) :
      Frontier (.node left right) (false :: path)
  | right (left : PrefixTree) {right : PrefixTree} {path : BitWord}
      (inner : Frontier right path) :
      Frontier (.node left right) (true :: path)

/-- Semantic nonmembership plus all strict prefixes construct a frontier. -/
theorem exists_frontier_of_proper_prefixes {tree : PrefixTree}
    {path : BitWord} (hnot : Not (List.Mem path tree.paths))
    (hproper : forall small, ProperWordPrefix small path ->
      List.Mem small tree.paths) :
    exists frontier : Frontier tree path, True := by
  induction path generalizing tree with
  | nil =>
      cases tree with
      | empty => exact ⟨Frontier.root, trivial⟩
      | node left right =>
          exact False.elim (hnot (nil_mem_paths_node left right))
  | cons bit rest ih =>
      cases tree with
      | empty =>
          have hempty : ProperWordPrefix [] (bit :: rest) :=
            ⟨WordPrefix.nil _, by intro heq; cases heq⟩
          exact False.elim (not_mem_paths_empty [] (hproper [] hempty))
      | node left right =>
          cases bit with
          | false =>
              have hnotLeft : Not (List.Mem rest left.paths) := by
                intro hmem
                exact hnot
                  ((false_cons_mem_paths_node_iff rest left right).mpr hmem)
              have hproperLeft : forall small,
                  ProperWordPrefix small rest -> List.Mem small left.paths := by
                intro small hsmall
                apply (false_cons_mem_paths_node_iff small left right).mp
                apply hproper (false :: small)
                exact ⟨WordPrefix.cons false hsmall.1, by
                  intro heq
                  exact hsmall.2 (List.cons.inj heq).2⟩
              obtain ⟨inner, _⟩ := ih hnotLeft hproperLeft
              exact ⟨Frontier.left inner right, trivial⟩
          | true =>
              have hnotRight : Not (List.Mem rest right.paths) := by
                intro hmem
                exact hnot
                  ((true_cons_mem_paths_node_iff rest left right).mpr hmem)
              have hproperRight : forall small,
                  ProperWordPrefix small rest -> List.Mem small right.paths := by
                intro small hsmall
                apply (true_cons_mem_paths_node_iff small left right).mp
                apply hproper (true :: small)
                exact ⟨WordPrefix.cons true hsmall.1, by
                  intro heq
                  exact hsmall.2 (List.cons.inj heq).2⟩
              obtain ⟨inner, _⟩ := ih hnotRight hproperRight
              exact ⟨Frontier.right left inner, trivial⟩

/-- Constructive data form of `exists_frontier_of_proper_prefixes`. -/
noncomputable def frontierOfProperPrefixes {tree : PrefixTree} {path : BitWord}
    (hnot : Not (List.Mem path tree.paths))
    (hproper : forall small, ProperWordPrefix small path ->
      List.Mem small tree.paths) : Frontier tree path := by
  induction path generalizing tree with
  | nil =>
      cases tree with
      | empty => exact .root
      | node left right =>
          exact False.elim (hnot (nil_mem_paths_node left right))
  | cons bit rest ih =>
      cases tree with
      | empty =>
          have hempty : ProperWordPrefix [] (bit :: rest) :=
            ⟨WordPrefix.nil _, by intro heq; cases heq⟩
          exact False.elim (not_mem_paths_empty [] (hproper [] hempty))
      | node left right =>
          cases bit with
          | false =>
              have hnotLeft : Not (List.Mem rest left.paths) := by
                intro hmem
                exact hnot
                  ((false_cons_mem_paths_node_iff rest left right).mpr hmem)
              have hproperLeft : forall small,
                  ProperWordPrefix small rest -> List.Mem small left.paths := by
                intro small hsmall
                apply (false_cons_mem_paths_node_iff small left right).mp
                apply hproper (false :: small)
                exact ⟨WordPrefix.cons false hsmall.1, by
                  intro heq
                  exact hsmall.2 (List.cons.inj heq).2⟩
              exact .left (ih hnotLeft hproperLeft) right
          | true =>
              have hnotRight : Not (List.Mem rest right.paths) := by
                intro hmem
                exact hnot
                  ((true_cons_mem_paths_node_iff rest left right).mpr hmem)
              have hproperRight : forall small,
                  ProperWordPrefix small rest -> List.Mem small right.paths := by
                intro small hsmall
                apply (true_cons_mem_paths_node_iff small left right).mp
                apply hproper (true :: small)
                exact ⟨WordPrefix.cons true hsmall.1, by
                  intro heq
                  exact hsmall.2 (List.cons.inj heq).2⟩
              exact .right left (ih hnotRight hproperRight)

namespace Frontier

/-- Literal protected-field context selected by a structural frontier. -/
noncomputable def fieldContext {tree : PrefixTree} {path : BitWord}
    (frontier : Frontier tree path) (phase : Nat × Nat) :
    ProtectedFieldContext path :=
  Frontier.rec
    (motive := fun _ indexedPath _ => Nat × Nat ->
      ProtectedFieldContext indexedPath)
    (fun _ => ProtectedFieldContext.hole)
    (fun {left} {path} inner right recurse current =>
      ProtectedFieldContext.left (recurse (nextPhase current))
        (buildFrom (nextPhase current) right) (phaseJunk current))
    (fun left {right} {path} inner recurse current =>
      ProtectedFieldContext.right (buildFrom (nextPhase current) left)
        (phaseJunk current) (recurse (nextPhase current)))
    frontier phase

/-- Generator phase found at the selected frontier. -/
noncomputable def focusPhase {tree : PrefixTree} {path : BitWord}
    (frontier : Frontier tree path) (phase : Nat × Nat) : Nat × Nat :=
  Frontier.rec
    (motive := fun _ _ _ => Nat × Nat -> Nat × Nat)
    (fun current => current)
    (fun {left} {path} inner right recurse current =>
      recurse (nextPhase current))
    (fun left {right} {path} inner recurse current =>
      recurse (nextPhase current))
    frontier phase

/-- Filling the selected field with its generator reconstructs the source. -/
theorem plug_focusGenerator {tree : PrefixTree} {path : BitWord}
    (frontier : Frontier tree path) (phase : Nat × Nat) :
    (frontier.fieldContext phase).plug
        (phaseGenerator (frontier.focusPhase phase)) =
      buildFrom phase tree := by
  induction frontier generalizing phase with
  | root =>
      change phaseGenerator phase = phaseGenerator phase
      rfl
  | left inner right ih =>
      change protectedNode
          ((fieldContext inner (nextPhase phase)).plug
            (phaseGenerator (focusPhase inner (nextPhase phase))))
          (buildFrom (nextPhase phase) right) (phaseJunk phase) =
        protectedNode (buildFrom (nextPhase phase) _) 
          (buildFrom (nextPhase phase) right) (phaseJunk phase)
      rw [ih]
  | right left inner ih =>
      change protectedNode (buildFrom (nextPhase phase) left)
          ((fieldContext inner (nextPhase phase)).plug
            (phaseGenerator (focusPhase inner (nextPhase phase))))
          (phaseJunk phase) =
        protectedNode (buildFrom (nextPhase phase) left)
          (buildFrom (nextPhase phase) _) (phaseJunk phase)
      rw [ih]

/-- Filling the selected field with its opened node is structural insertion. -/
theorem plug_focusOpened {tree : PrefixTree} {path : BitWord}
    (frontier : Frontier tree path) (phase : Nat × Nat) :
    (frontier.fieldContext phase).plug
        (phaseOpened (frontier.focusPhase phase)) =
      buildFrom phase (insertPath path tree) := by
  induction frontier generalizing phase with
  | root =>
      change phaseOpened phase = phaseOpened phase
      rfl
  | left inner right ih =>
      change protectedNode
          ((fieldContext inner (nextPhase phase)).plug
            (phaseOpened (focusPhase inner (nextPhase phase))))
          (buildFrom (nextPhase phase) right) (phaseJunk phase) =
        protectedNode
          (buildFrom (nextPhase phase) (insertPath _ _))
          (buildFrom (nextPhase phase) right) (phaseJunk phase)
      rw [ih]
  | right left inner ih =>
      change protectedNode (buildFrom (nextPhase phase) left)
          ((fieldContext inner (nextPhase phase)).plug
            (phaseOpened (focusPhase inner (nextPhase phase))))
          (phaseJunk phase) =
        protectedNode (buildFrom (nextPhase phase) left)
          (buildFrom (nextPhase phase) (insertPath _ _)) (phaseJunk phase)
      rw [ih]

/-- A good outer phase remains good at every selected finite frontier. -/
theorem focus_good {tree : PrefixTree} {path : BitWord}
    (frontier : Frontier tree path) {phase : Nat × Nat}
    (hgood : GoodPhase phase) : GoodPhase (frontier.focusPhase phase) := by
  induction frontier generalizing phase with
  | root => exact hgood
  | left inner right ih => exact ih hgood.next
  | right left inner ih => exact ih hgood.next

end Frontier

/-! ### A literal binary leaf and its two protected child fields -/

/-- A path whose focused trie node has two still-empty children. -/
inductive BinaryLeafAt : PrefixTree -> BitWord -> Type where
  | root : BinaryLeafAt (.node .empty .empty) []
  | left {left : PrefixTree} {path : BitWord}
      (inner : BinaryLeafAt left path) (right : PrefixTree) :
      BinaryLeafAt (.node left right) (false :: path)
  | right (left : PrefixTree) {right : PrefixTree} {path : BitWord}
      (inner : BinaryLeafAt right path) :
      BinaryLeafAt (.node left right) (true :: path)

/-- Membership of a node with both child paths absent constructs a binary leaf. -/
noncomputable def binaryLeafAtOfChildrenAbsent
    {tree : PrefixTree} {path : BitWord}
    (hnode : List.Mem path tree.paths)
    (hfalse : Not (List.Mem (path ++ [false]) tree.paths))
    (htrue : Not (List.Mem (path ++ [true]) tree.paths)) :
    BinaryLeafAt tree path := by
  induction path generalizing tree with
  | nil =>
      cases tree with
      | empty => exact False.elim (not_mem_paths_empty [] hnode)
      | node left right =>
          have hleftEmpty : left = .empty := by
            cases left with
            | empty => rfl
            | node ll lr =>
                exact False.elim (hfalse
                  ((false_cons_mem_paths_node_iff [] (.node ll lr) right).mpr
                    (nil_mem_paths_node ll lr)))
          have hrightEmpty : right = .empty := by
            cases right with
            | empty => rfl
            | node rl rr =>
                exact False.elim (htrue
                  ((true_cons_mem_paths_node_iff [] left (.node rl rr)).mpr
                    (nil_mem_paths_node rl rr)))
          subst left
          subst right
          exact .root
  | cons bit rest ih =>
      cases tree with
      | empty => exact False.elim (not_mem_paths_empty _ hnode)
      | node left right =>
          cases bit with
          | false =>
              apply BinaryLeafAt.left
              · refine ih (tree := left)
                  ((false_cons_mem_paths_node_iff rest left right).mp hnode)
                  ?_ ?_
                · intro h
                  apply hfalse
                  exact (false_cons_mem_paths_node_iff (rest ++ [false])
                    left right).mpr (by simpa [List.append_assoc] using h)
                · intro h
                  apply htrue
                  exact (false_cons_mem_paths_node_iff (rest ++ [true])
                    left right).mpr (by simpa [List.append_assoc] using h)
          | true =>
              apply BinaryLeafAt.right left
              refine ih (tree := right)
                  ((true_cons_mem_paths_node_iff rest left right).mp hnode)
                  ?_ ?_
              · intro h
                apply hfalse
                exact (true_cons_mem_paths_node_iff (rest ++ [false])
                  left right).mpr (by simpa [List.append_assoc] using h)
              · intro h
                apply htrue
                exact (true_cons_mem_paths_node_iff (rest ++ [true])
                  left right).mpr (by simpa [List.append_assoc] using h)

namespace BinaryLeafAt

/-- Protected context focusing the literal binary leaf node. -/
noncomputable def fieldContext {tree : PrefixTree} {path : BitWord}
    (leaf : BinaryLeafAt tree path) (phase : Nat × Nat) :
    ProtectedFieldContext path :=
  BinaryLeafAt.rec
    (motive := fun _ indexedPath _ => Nat × Nat ->
      ProtectedFieldContext indexedPath)
    (fun _ => ProtectedFieldContext.hole)
    (fun {left} {path} inner right recurse current =>
      ProtectedFieldContext.left (recurse (nextPhase current))
        (buildFrom (nextPhase current) right) (phaseJunk current))
    (fun left {right} {path} inner recurse current =>
      ProtectedFieldContext.right (buildFrom (nextPhase current) left)
        (phaseJunk current) (recurse (nextPhase current)))
    leaf phase

/-- Generator phase at the literal binary leaf. -/
noncomputable def focusPhase {tree : PrefixTree} {path : BitWord}
    (leaf : BinaryLeafAt tree path) (phase : Nat × Nat) : Nat × Nat :=
  BinaryLeafAt.rec
    (motive := fun _ _ _ => Nat × Nat -> Nat × Nat)
    (fun current => current)
    (fun {left} {path} inner right recurse current =>
      recurse (nextPhase current))
    (fun left {right} {path} inner recurse current =>
      recurse (nextPhase current))
    leaf phase

/-- Outer reconstruction from the focused protected binary leaf. -/
theorem plug_focusOpened {tree : PrefixTree} {path : BitWord}
    (leaf : BinaryLeafAt tree path) (phase : Nat × Nat) :
    (leaf.fieldContext phase).plug (phaseOpened (leaf.focusPhase phase)) =
      buildFrom phase tree := by
  induction leaf generalizing phase with
  | root => rfl
  | left inner right ih =>
      change protectedNode
          ((fieldContext inner (nextPhase phase)).plug
            (phaseOpened (focusPhase inner (nextPhase phase))))
          (buildFrom (nextPhase phase) right) (phaseJunk phase) =
        protectedNode (buildFrom (nextPhase phase) _)
          (buildFrom (nextPhase phase) right) (phaseJunk phase)
      rw [ih]
  | right left inner ih =>
      change protectedNode (buildFrom (nextPhase phase) left)
          ((fieldContext inner (nextPhase phase)).plug
            (phaseOpened (focusPhase inner (nextPhase phase))))
          (phaseJunk phase) =
        protectedNode (buildFrom (nextPhase phase) left)
          (buildFrom (nextPhase phase) _) (phaseJunk phase)
      rw [ih]

/-- A good phase remains good at the focused binary leaf. -/
theorem focus_good {tree : PrefixTree} {path : BitWord}
    (leaf : BinaryLeafAt tree path) {phase : Nat × Nat}
    (hgood : GoodPhase phase) : GoodPhase (leaf.focusPhase phase) := by
  induction leaf generalizing phase with
  | root => exact hgood
  | left inner right ih => exact ih hgood.next
  | right left inner ih => exact ih hgood.next

/-- The selected direct child field of a literal binary leaf. -/
noncomputable def childContext {tree : PrefixTree} {path : BitWord}
    (leaf : BinaryLeafAt tree path) (phase : Nat × Nat) (bit : Bool) :
    ProtectedFieldContext (path ++ [bit]) :=
  match bit with
  | false => (leaf.fieldContext phase).extendLeft
      (phaseGenerator (nextPhase (leaf.focusPhase phase)))
      (phaseJunk (leaf.focusPhase phase))
  | true => (leaf.fieldContext phase).extendRight
      (phaseGenerator (nextPhase (leaf.focusPhase phase)))
      (phaseJunk (leaf.focusPhase phase))

/-- Opening one selected empty child is exactly structural path insertion. -/
theorem plug_childOpened {tree : PrefixTree} {path : BitWord}
    (leaf : BinaryLeafAt tree path) (phase : Nat × Nat) (bit : Bool) :
    (leaf.childContext phase bit).plug
        (phaseOpened (nextPhase (leaf.focusPhase phase))) =
      buildFrom phase (insertPath (path ++ [bit]) tree) := by
  induction leaf generalizing phase with
  | root => cases bit <;> rfl
  | left inner right ih =>
      cases bit with
      | false =>
          change protectedNode
              ((inner.childContext (nextPhase phase) false).plug
                (phaseOpened
                  (nextPhase (inner.focusPhase (nextPhase phase)))))
              (buildFrom (nextPhase phase) right) (phaseJunk phase) = _
          rw [ih]
          rfl

      | true =>
          change protectedNode
              ((inner.childContext (nextPhase phase) true).plug
                (phaseOpened
                  (nextPhase (inner.focusPhase (nextPhase phase)))))
              (buildFrom (nextPhase phase) right) (phaseJunk phase) = _
          rw [ih]
          rfl
  | right left inner ih =>
      cases bit with
      | false =>
          change protectedNode (buildFrom (nextPhase phase) left)
              ((inner.childContext (nextPhase phase) false).plug
                (phaseOpened
                  (nextPhase (inner.focusPhase (nextPhase phase)))))
              (phaseJunk phase) = _
          rw [ih]
          rfl
      | true =>
          change protectedNode (buildFrom (nextPhase phase) left)
              ((inner.childContext (nextPhase phase) true).plug
                (phaseOpened
                  (nextPhase (inner.focusPhase (nextPhase phase)))))
              (phaseJunk phase) = _
          rw [ih]
          rfl

/-- Before child work, the two generator fields reconstruct the binary leaf. -/
theorem plug_childGenerator {tree : PrefixTree} {path : BitWord}
    (leaf : BinaryLeafAt tree path) (phase : Nat × Nat) (bit : Bool) :
    (leaf.childContext phase bit).plug
        (phaseGenerator (nextPhase (leaf.focusPhase phase))) =
      buildFrom phase tree := by
  cases bit <;>
    simp only [childContext, ProtectedFieldContext.plug_extendLeft,
      ProtectedFieldContext.plug_extendRight, phaseOpened] <;>
    exact leaf.plug_focusOpened phase

end BinaryLeafAt

end PrefixTree

/-! ## The designated endpoint really is a frontier of a prepared build -/

/-- Adding one chosen pair is definitionally one structural path insertion. -/
theorem preparedTree_promote (pair : BitWord × BitWord)
    (chosen frontier : List (BitWord × BitWord)) :
    treeOfPrefixSet (preparedPrefixSet (pair :: chosen) frontier) =
      insertPath (a pair.1 pair.2)
        (treeOfPrefixSet (preparedPrefixSet chosen frontier)) :=
  rfl

/--
If a prepared pair is not already chosen, its complete candidate address is
the unique empty field below all of its prepared strict prefixes.
-/
theorem exists_prepared_candidate_frontier
    (pair : BitWord × BitWord) (chosen frontier : List (BitWord × BitWord))
    (hfrontier : List.Mem pair frontier)
    (hnotChosen : Not (List.Mem pair chosen)) :
    exists selected : PrefixTree.Frontier
      (treeOfPrefixSet (preparedPrefixSet chosen frontier)) (a pair.1 pair.2),
      True := by
  let tree := treeOfPrefixSet (preparedPrefixSet chosen frontier)
  have hnotContains : Not
      ((preparedPrefixSet chosen frontier).Contains (a pair.1 pair.2)) := by
    intro hcontains
    exact hnotChosen
      ((a_preparedPrefixSet_contains_iff (history := pair.1)
        (payload := pair.2) (chosen := chosen) (frontier := frontier)).mp hcontains)
  have hnotPath : Not (List.Mem (a pair.1 pair.2) tree.paths) := by
    intro hmem
    apply hnotContains
    apply (mem_paths_treeOfGenerators_iff _ _).mp
    simpa [tree, treeOfPrefixSet] using hmem
  have hproperPath : forall small,
      ProperWordPrefix small (a pair.1 pair.2) -> List.Mem small tree.paths := by
    intro small hproper
    have hgenerator : List.Mem small (frontierPrefixGenerators frontier) :=
      frontierPrefixGenerator_mem_of_mem hfrontier hproper
    have hcontains : (preparedPrefixSet chosen frontier).Contains small :=
      ⟨small,
        mem_append_right (candidateGenerators chosen) hgenerator,
        WordPrefix.refl small⟩
    have hmem := (mem_paths_treeOfGenerators_iff
      (preparedPrefixSet chosen frontier).generators small).mpr hcontains
    simpa [tree, treeOfPrefixSet] using hmem
  exact PrefixTree.exists_frontier_of_proper_prefixes hnotPath hproperPath

/-! ## Literal six- and seven-edge walks -/

/-- Place one local field term below the frozen public seed. -/
def seededFieldTerm (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (term : Term) : Term :=
  seededHeader bits (context.plug term)

/-- Lift one field-local contraction below the frozen public seed. -/
theorem seededField_step (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) {source target : Term}
    (hstep : Step source target) :
    Step (seededFieldTerm bits context source)
      (seededFieldTerm bits context target) := by
  simpa [seededFieldTerm, seededHeader, header, passive] using
    Step.appRight (.app .s (N bits)) (context.step hstep)

/-- The displayed positive opening as a literal directed walk. -/
def positiveWalk (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (m n : Nat) :
    Walk Step (seededFieldTerm bits context (positive0 m n))
      (seededFieldTerm bits context (opened m n)) :=
  .tail
    (.tail
      (.tail
        (.tail
          (.tail
            (.tail (.refl _)
              (seededField_step bits context (positive_step01 m n)))
            (seededField_step bits context (positive_step12 m n)))
          (seededField_step bits context (positive_step23 m n)))
        (seededField_step bits context (positive_step34 m n)))
      (seededField_step bits context (positive_step45 m n)))
    (seededField_step bits context (positive_step5final m n))

/-- The positive walk lists exactly its seven displayed vertices. -/
theorem positiveWalk_vertices (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (m n : Nat) :
    (positiveWalk bits context m n).vertices =
      [seededFieldTerm bits context (positive0 m n),
       seededFieldTerm bits context (positive1 m n),
       seededFieldTerm bits context (positive2 m n),
       seededFieldTerm bits context (positive3 m n),
       seededFieldTerm bits context (positive4 m n),
       seededFieldTerm bits context (positive5 m n),
       seededFieldTerm bits context (opened m n)] :=
  by simp [positiveWalk, Walk.vertices]

/-- The displayed reset opening as a literal directed walk. -/
def zeroWalk (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (n : Nat) :
    Walk Step (seededFieldTerm bits context (D 0 (n + 2)))
      (seededFieldTerm bits context (opened (n + 2) (n + 1))) :=
  .tail
    (.tail
      (.tail
        (.tail
          (.tail
            (.tail
              (.tail (.refl _)
                (seededField_step bits context (zeroProper_step n .source)))
              (seededField_step bits context
                (positive_step01 (n + 2) (n + 1))))
            (seededField_step bits context
              (positive_step12 (n + 2) (n + 1))))
          (seededField_step bits context
            (positive_step23 (n + 2) (n + 1))))
        (seededField_step bits context
          (positive_step34 (n + 2) (n + 1))))
      (seededField_step bits context
        (positive_step45 (n + 2) (n + 1))))
    (seededField_step bits context
      (positive_step5final (n + 2) (n + 1)))

/-- The reset walk lists exactly its eight displayed vertices. -/
theorem zeroWalk_vertices (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (n : Nat) :
    (zeroWalk bits context n).vertices =
      [seededFieldTerm bits context (D 0 (n + 2)),
       seededFieldTerm bits context (positive0 (n + 2) (n + 1)),
       seededFieldTerm bits context (positive1 (n + 2) (n + 1)),
       seededFieldTerm bits context (positive2 (n + 2) (n + 1)),
       seededFieldTerm bits context (positive3 (n + 2) (n + 1)),
       seededFieldTerm bits context (positive4 (n + 2) (n + 1)),
       seededFieldTerm bits context (positive5 (n + 2) (n + 1)),
       seededFieldTerm bits context (opened (n + 2) (n + 1))] :=
  by simp [zeroWalk, Walk.vertices, zeroProperNext, positive0, positive1, positive2, D]

/-- Classification of a good phase into its literal opening trace. -/
inductive CanonicalOpening {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (phase : Nat × Nat) : Type where
  | positive (m n : Nat) (hphase : phase = (m + 1, n + 2)) :
      CanonicalOpening bits context phase
  | zero (n : Nat) (hphase : phase = (0, n + 2)) :
      CanonicalOpening bits context phase

/-- Every good phase has exactly one of the two operational opening forms. -/
theorem exists_canonicalOpening_of_good {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (phase : Nat × Nat) (hgood : GoodPhase phase) :
    exists opening : CanonicalOpening bits context phase, True := by
  rcases phase with ⟨m, n⟩
  rcases hgood with ⟨hn, hm⟩
  cases n with
  | zero =>
      exact False.elim ((by decide : Not (2 ≤ 0)) hn)
  | succ n =>
      cases n with
      | zero =>
          exact False.elim ((by decide : Not (2 ≤ 1)) hn)
      | succ n =>
          cases m with
          | zero => exact ⟨CanonicalOpening.zero n rfl, trivial⟩
          | succ m => exact ⟨CanonicalOpening.positive m n rfl, trivial⟩

/--
Proof-level phase classifier used by explicit insertion walks.  Only this walk
witness is noncomputable; the checkpoint term itself remains the executable
`branchCheckpoint` above.
-/
def canonicalOpeningOfGood {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (phase : Nat × Nat) (hgood : GoodPhase phase) :
    CanonicalOpening bits context phase := by
  rcases phase with ⟨m, n⟩
  rcases hgood with ⟨hn, hm⟩
  cases n with
  | zero =>
      exact False.elim ((by decide : Not (2 ≤ 0)) hn)
  | succ n =>
      cases n with
      | zero =>
          exact False.elim ((by decide : Not (2 ≤ 1)) hn)
      | succ n =>
          cases m with
          | zero => exact .zero n rfl
          | succ m => exact .positive m n rfl

namespace CanonicalOpening

/-- Source term of a canonical local opening. -/
def source {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (_ : CanonicalOpening bits context phase) : Term :=
  seededFieldTerm bits context (phaseGenerator phase)

/-- Target term of a canonical local opening. -/
def target {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (_ : CanonicalOpening bits context phase) : Term :=
  seededFieldTerm bits context (phaseOpened phase)

/-- Exact directed walk selected by the phase classification. -/
def walk {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (opening : CanonicalOpening bits context phase) :
    Walk Step opening.source opening.target := by
  cases opening with
  | positive m n hphase =>
      subst phase
      simpa [source, target, phaseGenerator, phaseOpened, nextPhase,
        phaseJunk, positive0, opened, openingChild] using
        positiveWalk bits context m n
  | zero n hphase =>
      subst phase
      simpa [source, target, phaseGenerator, phaseOpened, nextPhase,
        phaseJunk, positive0, opened, openingChild, Nat.add_assoc] using
        zeroWalk bits context n

/-- Every internal vertex of the positive walk is one nonzero proper stage. -/
theorem positive_interior_cases (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (m n : Nat) (vertex : Term)
    (hvertex : (positiveWalk bits context m n).Interior vertex) :
    exists stage : PositiveProperStage,
      stage ≠ .zero /\
      vertex = seededFieldTerm bits context (positiveProperTerm m n stage) := by
  have hmem := hvertex.1
  rw [positiveWalk_vertices] at hmem
  rcases List.mem_cons.mp hmem with h0 | hmem
  · exact False.elim (hvertex.2.1 h0)
  rcases List.mem_cons.mp hmem with h1 | hmem
  · exact ⟨.one, by decide, by simpa [positiveProperTerm] using h1⟩
  rcases List.mem_cons.mp hmem with h2 | hmem
  · exact ⟨.two, by decide, by simpa [positiveProperTerm] using h2⟩
  rcases List.mem_cons.mp hmem with h3 | hmem
  · exact ⟨.three, by decide, by simpa [positiveProperTerm] using h3⟩
  rcases List.mem_cons.mp hmem with h4 | hmem
  · exact ⟨.four, by decide, by simpa [positiveProperTerm] using h4⟩
  rcases List.mem_cons.mp hmem with h5 | hmem
  · exact ⟨.five, by decide, by simpa [positiveProperTerm] using h5⟩
  rcases List.mem_cons.mp hmem with hfinal | hnil
  · exact False.elim (hvertex.2.2 hfinal)
  · cases hnil

/-- Every internal vertex of the reset walk is one non-source proper stage. -/
theorem zero_interior_cases (bits : BitWord) {path : BitWord}
    (context : ProtectedFieldContext path) (n : Nat) (vertex : Term)
    (hvertex : (zeroWalk bits context n).Interior vertex) :
    exists stage : ZeroProperStage,
      stage ≠ .source /\
      vertex = seededFieldTerm bits context (zeroProperTerm n stage) := by
  have hmem := hvertex.1
  rw [zeroWalk_vertices] at hmem
  rcases List.mem_cons.mp hmem with hsource | hmem
  · exact False.elim (hvertex.2.1 hsource)
  rcases List.mem_cons.mp hmem with h0 | hmem
  · exact ⟨.positive .zero, by decide,
      by simpa [zeroProperTerm, positiveProperTerm] using h0⟩
  rcases List.mem_cons.mp hmem with h1 | hmem
  · exact ⟨.positive .one, by decide,
      by simpa [zeroProperTerm, positiveProperTerm] using h1⟩
  rcases List.mem_cons.mp hmem with h2 | hmem
  · exact ⟨.positive .two, by decide,
      by simpa [zeroProperTerm, positiveProperTerm] using h2⟩
  rcases List.mem_cons.mp hmem with h3 | hmem
  · exact ⟨.positive .three, by decide,
      by simpa [zeroProperTerm, positiveProperTerm] using h3⟩
  rcases List.mem_cons.mp hmem with h4 | hmem
  · exact ⟨.positive .four, by decide,
      by simpa [zeroProperTerm, positiveProperTerm] using h4⟩
  rcases List.mem_cons.mp hmem with h5 | hmem
  · exact ⟨.positive .five, by decide,
      by simpa [zeroProperTerm, positiveProperTerm] using h5⟩
  rcases List.mem_cons.mp hmem with hfinal | hnil
  · exact False.elim (hvertex.2.2 hfinal)
  · cases hnil

/-- Every proper macro vertex has exactly the source checkpoint projection. -/
theorem interior_projection_stutter
    {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (opening : CanonicalOpening bits context phase)
    (verify : CertificateVerifier) (vertex : Term)
    (hvertex : opening.walk.Interior vertex) :
    (projection verify vertex).Equivalent (projection verify opening.source) := by
  cases opening with
  | positive m n hphase =>
      subst phase
      have hlocal : (positiveWalk bits context m n).Interior vertex := by
        simpa [walk, source, target, phaseGenerator, phaseOpened, nextPhase,
          phaseJunk, positive0, opened, openingChild] using! hvertex
      obtain ⟨stage, hstage, hterm⟩ :=
        positive_interior_cases bits context m n vertex hlocal
      subst vertex
      simpa [source, seededFieldTerm, phaseGenerator, positive0] using
        positiveProper_projection_stutter verify bits context m n stage
  | zero n hphase =>
      subst phase
      have hlocal : (zeroWalk bits context n).Interior vertex := by
        simpa [walk, source, target, phaseGenerator, phaseOpened, nextPhase,
          phaseJunk, positive0, opened, openingChild, Nat.add_assoc] using! hvertex
      obtain ⟨stage, hstage, hterm⟩ :=
        zero_interior_cases bits context n vertex hlocal
      subst vertex
      simpa [source, seededFieldTerm, phaseGenerator, zeroProperTerm] using
        zeroProper_projection_stutter verify bits context n stage

/-- No proper local opening stage exposes its designated protected path. -/
theorem interior_designated_closed
    {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (opening : CanonicalOpening bits context phase) (vertex : Term)
    (hvertex : opening.walk.Interior vertex) :
    anchoredOpenedAt? vertex path = false := by
  cases opening with
  | positive m n hphase =>
      subst phase
      have hlocal : (positiveWalk bits context m n).Interior vertex := by
        simpa [walk, source, target, phaseGenerator, phaseOpened, nextPhase,
          phaseJunk, positive0, opened, openingChild] using! hvertex
      obtain ⟨stage, hstage, hterm⟩ :=
        positive_interior_cases bits context m n vertex hlocal
      subst vertex
      change anchoredOpenedAt?
        (header (N bits) (context.plug (positiveProperTerm m n stage)))
        path = false
      rw [anchoredOpenedAt?_header]
      exact positiveProper_designated_stutter context m n stage
  | zero n hphase =>
      subst phase
      have hlocal : (zeroWalk bits context n).Interior vertex := by
        simpa [walk, source, target, phaseGenerator, phaseOpened, nextPhase,
          phaseJunk, positive0, opened, openingChild, Nat.add_assoc] using! hvertex
      obtain ⟨stage, hstage, hterm⟩ :=
        zero_interior_cases bits context n vertex hlocal
      subst vertex
      change anchoredOpenedAt?
        (header (N bits) (context.plug (zeroProperTerm n stage)))
        path = false
      rw [anchoredOpenedAt?_header]
      exact zeroProper_designated_stutter context n stage

/-- The last edge alone adds the designated accepted certificate history. -/
theorem final_projection_event
    {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (opening : CanonicalOpening bits context phase)
    (verify : CertificateVerifier) (history payload : BitWord)
    (hpath : path = a history payload)
    (hverify : verify bits history payload = true) :
    exists before : Term,
      Step before opening.target /\
      forall small,
        (projection verify opening.target).Contains small <->
          (projection verify before).Contains small \/
            WordPrefix small history := by
  cases opening with
  | positive m n hphase =>
      subst phase
      refine ⟨seededFieldTerm bits context (positive5 m n), ?_, ?_⟩
      · simpa [target, seededFieldTerm] using!
          (positive_final_projection_event verify bits history payload
            context m n hpath hverify).1
      · intro small
        simpa [target, seededFieldTerm] using!
          (positive_final_projection_event verify bits history payload
            context m n hpath hverify).2 small
  | zero n hphase =>
      subst phase
      refine ⟨seededFieldTerm bits context (positive5 (n + 2) (n + 1)),
        ?_, ?_⟩
      · simpa [target, seededFieldTerm, phaseOpened, nextPhase, phaseJunk,
          opened, openingChild, Nat.add_assoc] using!
          (zero_final_projection_event verify bits history payload
            context n hpath hverify).1
      · intro small
        simpa [target, seededFieldTerm, phaseOpened, nextPhase, phaseJunk,
          opened, openingChild, Nat.add_assoc] using!
          (zero_final_projection_event verify bits history payload
            context n hpath hverify).2 small

end CanonicalOpening

/-! ## Coherent prepared checkpoints with one exact final event -/

/--
The canonical prepared checkpoint and its promoted checkpoint are connected by
the literal opening at the designated candidate field.
-/
theorem exists_prepared_canonicalOpening
    (bits : BitWord) (pair : BitWord × BitWord)
    (chosen frontier : List (BitWord × BitWord))
    (hfrontier : List.Mem pair frontier)
    (hnotChosen : Not (List.Mem pair chosen)) :
    exists selected : PrefixTree.Frontier
        (treeOfPrefixSet (preparedPrefixSet chosen frontier))
        (a pair.1 pair.2),
      exists opening : CanonicalOpening bits
        (selected.fieldContext (phaseAt 0))
        (selected.focusPhase (phaseAt 0)),
        seededPreparedBuild bits chosen frontier = opening.source /\
        seededPreparedBuild bits (pair :: chosen) frontier = opening.target := by
  obtain ⟨selected, _⟩ :=
    exists_prepared_candidate_frontier pair chosen frontier hfrontier hnotChosen
  have hgood : GoodPhase (selected.focusPhase (phaseAt 0)) :=
    selected.focus_good (goodPhase_phaseAt 0)
  obtain ⟨opening, _⟩ := exists_canonicalOpening_of_good bits
    (selected.fieldContext (phaseAt 0))
    (selected.focusPhase (phaseAt 0)) hgood
  refine ⟨selected, opening, ?_, ?_⟩
  · unfold seededPreparedBuild seededPrefixBuild seededBuild buildAt
    unfold CanonicalOpening.source seededFieldTerm
    exact congrArg (seededHeader bits)
      (selected.plug_focusGenerator (phaseAt 0)).symm
  · unfold seededPreparedBuild seededPrefixBuild seededBuild buildAt
    unfold CanonicalOpening.target seededFieldTerm
    rw [preparedTree_promote]
    exact congrArg (seededHeader bits)
      (selected.plug_focusOpened (phaseAt 0)).symm

/--
One source-frontier event has coherent canonical endpoints, exact projections,
proper-stage stuttering, and one singleton final projection change.
-/
theorem exists_ideal_frontier_macro
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hsound : VerifierSound verify Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (hunique : VerifierUnique verify Valid witness)
    (bits : BitWord) (ideal : HistoryIdeal)
    (hideal : IdealValid Valid bits ideal)
    (history : BitWord) (hfrontier : HistoryFrontier ideal history)
    (hvalid : Valid bits history)
    (prepared : List (BitWord × BitWord)) :
    exists selected : PrefixTree.Frontier
        (treeOfPrefixSet (preparedPrefixSet
          (selectedWitnesses witness bits ideal.entries)
          ((history, witness bits history) :: prepared)))
        (a history (witness bits history)),
      exists opening : CanonicalOpening bits
        (selected.fieldContext (phaseAt 0))
        (selected.focusPhase (phaseAt 0)),
        idealCheckpoint bits witness ideal
            ((history, witness bits history) :: prepared) = opening.source /\
        idealCheckpoint bits witness
            (insertFrontier ideal history hfrontier)
            ((history, witness bits history) :: prepared) = opening.target /\
        (projection verify opening.source).Equivalent ideal /\
        (projection verify opening.target).Equivalent
          (insertFrontier ideal history hfrontier) /\
        (forall vertex, opening.walk.Interior vertex ->
          (projection verify vertex).Equivalent
            (projection verify opening.source)) /\
        (exists before,
          Step before opening.target /\
          forall small,
            (projection verify opening.target).Contains small <->
              (projection verify before).Contains small \/
                WordPrefix small history) := by
  let pair : BitWord × BitWord := (history, witness bits history)
  let chosen := selectedWitnesses witness bits ideal.entries
  let frontier := pair :: prepared
  have hpairFrontier : List.Mem pair frontier := List.Mem.head _
  have hpairNotChosen : Not (List.Mem pair chosen) := by
    intro hmem
    have hhistory : ideal.Contains history :=
      (mem_selectedWitnesses_iff witness bits ideal.entries history
        (witness bits history)).mp hmem |>.1
    exact hfrontier.1 hhistory
  obtain ⟨selected, opening, hsource, htarget⟩ :=
    exists_prepared_canonicalOpening bits pair chosen frontier
      hpairFrontier hpairNotChosen
  have hinsertValid : IdealValid Valid bits
      (insertFrontier ideal history hfrontier) := by
    intro query hquery
    rcases (insertFrontier_contains_iff ideal history hfrontier query).mp hquery with
      heq | hold
    · subst query
      exact hvalid
    · exact hideal query hold
  have hsourceProjection :
      (projection verify opening.source).Equivalent ideal := by
    rw [← hsource]
    exact projection_idealCheckpoint_equivalent hsound hcomplete hunique
      bits ideal hideal frontier
  have htargetProjection :
      (projection verify opening.target).Equivalent
        (insertFrontier ideal history hfrontier) := by
    rw [← htarget]
    exact projection_idealCheckpoint_equivalent hsound hcomplete hunique
      bits (insertFrontier ideal history hfrontier) hinsertValid frontier
  have hfinal := opening.final_projection_event verify history
    (witness bits history) rfl (hcomplete bits history hvalid)
  refine ⟨selected, opening, ?_, ?_, hsourceProjection, htargetProjection,
    ?_, hfinal⟩
  · simpa [idealCheckpoint, pair, chosen, frontier] using hsource
  · simpa [idealCheckpoint, insertFrontier, selectedWitnesses,
      pair, chosen, frontier] using htarget
  · intro vertex hvertex
    exact opening.interior_projection_stutter verify vertex hvertex

/-- Semantic distinction of finite ideals makes their canonical terms distinct. -/
theorem idealCheckpoint_ne_of_not_equivalent
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hsound : VerifierSound verify Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (hunique : VerifierUnique verify Valid witness)
    (bits : BitWord) (left right : HistoryIdeal)
    (hleft : IdealValid Valid bits left)
    (hright : IdealValid Valid bits right)
    (leftFrontier rightFrontier : List (BitWord × BitWord))
    (hne : Not (left.Equivalent right)) :
    idealCheckpoint bits witness left leftFrontier ≠
      idealCheckpoint bits witness right rightFrontier := by
  intro heq
  have hleftProjection := projection_idealCheckpoint_equivalent
    hsound hcomplete hunique bits left hleft leftFrontier
  have hrightProjection := projection_idealCheckpoint_equivalent
    hsound hcomplete hunique bits right hright rightFrontier
  have hprojectionEq :
      projection verify (idealCheckpoint bits witness left leftFrontier) =
        projection verify (idealCheckpoint bits witness right rightFrontier) :=
    congrArg (projection verify) heq
  apply hne
  exact HistoryIdeal.equivalent_trans
    (HistoryIdeal.equivalent_symm hleftProjection)
    (by simpa [hprojectionEq] using hrightProjection)

/--
Opening one abstract path that is not a complete candidate address is a
projection stutter, even on its final contraction.
-/
theorem projection_equivalent_of_singleton_nonCandidate
    (verify : CertificateVerifier) (bits path : BitWord)
    (before after : Term)
    (hdelta : forall query,
      OpenedAt after query <-> OpenedAt before query \/ query = path)
    (hnotCandidate : forall history payload, path ≠ a history payload) :
    (projection verify (seededHeader bits after)).Equivalent
      (projection verify (seededHeader bits before)) := by
  intro small
  constructor
  · intro hsmall
    obtain ⟨history, payload, hpath, hverify, hprefix⟩ :=
      (projection_seededHeader_contains_iff verify bits after small).mp hsmall
    have hopenAfter : OpenedAt after (a history payload) :=
      (mem_anchoredOpenedPaths_header_iff (N bits) after _).mp
        (by simpa [seededHeader] using hpath)
    rcases (hdelta (a history payload)).mp hopenAfter with
      hopenBefore | heq
    · apply (projection_seededHeader_contains_iff verify bits before small).mpr
      exact ⟨history, payload,
        by simpa [seededHeader] using
          (mem_anchoredOpenedPaths_header_iff (N bits) before _).mpr
            hopenBefore,
        hverify, hprefix⟩
    · exact False.elim (hnotCandidate history payload heq.symm)
  · intro hsmall
    obtain ⟨history, payload, hpath, hverify, hprefix⟩ :=
      (projection_seededHeader_contains_iff verify bits before small).mp hsmall
    have hopenBefore : OpenedAt before (a history payload) :=
      (mem_anchoredOpenedPaths_header_iff (N bits) before _).mp
        (by simpa [seededHeader] using hpath)
    apply (projection_seededHeader_contains_iff verify bits after small).mpr
    exact ⟨history, payload,
      by simpa [seededHeader] using
        (mem_anchoredOpenedPaths_header_iff (N bits) after _).mpr
          ((hdelta _).mpr (Or.inl hopenBefore)),
      hverify, hprefix⟩

namespace CanonicalOpening

/-- The endpoint also stutters when the designated field is not a candidate. -/
theorem target_projection_stutter_of_not_candidate
    {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (opening : CanonicalOpening bits context phase)
    (verify : CertificateVerifier)
    (hnotCandidate : forall history payload, path ≠ a history payload) :
    (projection verify opening.target).Equivalent
      (projection verify opening.source) := by
  cases opening with
  | positive m n hphase =>
      subst phase
      have hlast := projection_equivalent_of_singleton_nonCandidate
        verify bits path (context.plug (positive5 m n))
          (context.plug (opened m n))
          (positive_last_step_exact_delta context m n).2 hnotCandidate
      have hproper := positiveProper_projection_stutter verify bits context m n
        PositiveProperStage.five
      simpa [source, target, seededFieldTerm, phaseGenerator, phaseOpened,
        nextPhase, phaseJunk, positive0, opened, openingChild] using
        HistoryIdeal.equivalent_trans hlast hproper
  | zero n hphase =>
      subst phase
      have hlast := projection_equivalent_of_singleton_nonCandidate
        verify bits path
          (context.plug (positive5 (n + 2) (n + 1)))
          (context.plug (opened (n + 2) (n + 1)))
          (zero_last_step_exact_delta context n).2 hnotCandidate
      have hproper := zeroProper_projection_stutter verify bits context n
        (ZeroProperStage.positive PositiveProperStage.five)
      simpa [source, target, seededFieldTerm, phaseGenerator, phaseOpened,
        nextPhase, phaseJunk, positive0, opened, openingChild,
        zeroProperTerm, Nat.add_assoc] using
        HistoryIdeal.equivalent_trans hlast hproper

/-- Every vertex of a noncandidate opening has the source projection. -/
theorem every_projection_stutter_of_not_candidate
    {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (opening : CanonicalOpening bits context phase)
    (verify : CertificateVerifier)
    (hnotCandidate : forall history payload, path ≠ a history payload) :
    Walk.Every
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify opening.source)) opening.walk := by
  apply Walk.Every.of_mem opening.walk
  intro vertex hmem
  by_cases hsource : vertex = opening.source
  · subst vertex
    exact HistoryIdeal.equivalent_refl _
  by_cases htarget : vertex = opening.target
  · subst vertex
    exact opening.target_projection_stutter_of_not_candidate
      verify hnotCandidate
  exact opening.interior_projection_stutter verify vertex
    ⟨hmem, hsource, htarget⟩

/-- Every vertex before the final opening endpoint has the source projection. -/
theorem before_target_projection_stutter
    {path : BitWord} {bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (opening : CanonicalOpening bits context phase)
    (verify : CertificateVerifier) :
    Walk.BeforeTarget
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify opening.source)) opening.walk := by
  exact Walk.BeforeTarget.of_source_interior
    (HistoryIdeal.equivalent_refl _)
    (opening.interior_projection_stutter verify)

end CanonicalOpening

/-! ## Executable branch checkpoints with both enabled children prepared -/

/-! ### Canonical subdivision checkpoints -/

/--
One history block for the directed subdivision.  The complete certificate is
listed first, so the explicit insertion walk performs the router and every
strict certificate-prefix preparation before the certificate's final opening.
-/
def subdivisionGeneratorBlock
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : List BitWord :=
  let certificate := a history (witness bits history)
  certificate :: (properPrefixes certificate ++ [router history])

/-- Blocks from the current history back to the root give coherent snoc edges. -/
def subdivisionCheckpointGenerators
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : List BitWord :=
  (historyPrefixes history).reverse.flatMap
    (subdivisionGeneratorBlock witness bits)

/-- Executable canonical representative of one valid history-tree vertex. -/
def subdivisionCheckpoint
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : Term :=
  seededPrefixBuild bits ⟨subdivisionCheckpointGenerators witness bits history⟩

/-- Prefix enumeration commutes with appending one occurrence bit. -/
theorem historyPrefixes_snoc (history : BitWord) (bit : Bool) :
    historyPrefixes (history ++ [bit]) =
      historyPrefixes history ++ [history ++ [bit]] := by
  induction history with
  | nil => simp [historyPrefixes]
  | cons head tail ih =>
      simp only [List.cons_append, historyPrefixes, ih, List.map_append,
        List.map_cons, List.map_nil, List.append_assoc]

/-- Exact snoc recurrence for coherent checkpoint construction. -/
theorem subdivisionCheckpointGenerators_append_singleton
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) (bit : Bool) :
    subdivisionCheckpointGenerators witness bits (history ++ [bit]) =
      subdivisionGeneratorBlock witness bits (history ++ [bit]) ++
        subdivisionCheckpointGenerators witness bits history := by
  simp [subdivisionCheckpointGenerators, historyPrefixes_snoc]

/-- Constructive membership characterization for `List.flatMap`.

The corresponding library theorem currently carries an arithmetic quotient
dependency in Lean 4.19.  This structural proof keeps the public subdivision
chain kernel-small.
-/
theorem mem_flatMap_iff_constructive {Alpha Beta : Type}
    (value : Beta) (function : Alpha -> List Beta) (items : List Alpha) :
    List.Mem value (items.flatMap function) <->
      exists item, List.Mem item items /\ List.Mem value (function item) := by
  induction items with
  | nil =>
      constructor
      · intro hmem
        cases hmem
      · rintro ⟨item, hitem, hvalue⟩
        cases hitem
  | cons head tail ih =>
      constructor
      · intro hmem
        rcases List.mem_append.mp hmem with hhead | htail
        · exact ⟨head, List.Mem.head tail, hhead⟩
        · obtain ⟨item, hitem, hvalue⟩ := ih.mp htail
          exact ⟨item, List.Mem.tail head hitem, hvalue⟩
      · rintro ⟨item, hitem, hvalue⟩
        rcases List.mem_cons.mp hitem with heq | htail
        ·
            subst item
            exact List.mem_append.mpr (Or.inl hvalue)
        · exact List.mem_append.mpr (Or.inr (ih.mpr ⟨item, htail, hvalue⟩))

/-- A noncertificate member of a subdivision block is never a candidate. -/
theorem subdivisionBlock_tail_ne_candidate
    (witness : BitWord -> BitWord -> BitWord)
    (bits history generator candidateHistory candidatePayload : BitWord)
    (hmem : List.Mem generator
      ((subdivisionGeneratorBlock witness bits history).tail)) :
    generator ≠ a candidateHistory candidatePayload := by
  simp only [subdivisionGeneratorBlock, List.tail_cons] at hmem
  rcases List.mem_append.mp hmem with hproper | hrouter
  · have hproper' := (mem_properPrefixes_iff _ _).mp hproper
    intro heq
    subst generator
    exact a_not_proper_prefix_a candidateHistory candidatePayload history
      (witness bits history) hproper'
  · have heqRouter : generator = router history := by
      simpa using hrouter
    subst generator
    intro heq
    apply a_not_prefix_router candidateHistory candidatePayload history
    rw [heq]
    exact WordPrefix.refl _

/-- No complete candidate address prefixes a router/preparation generator. -/
theorem subdivisionBlock_tail_candidate_free
    (witness : BitWord -> BitWord -> BitWord)
    (bits history generator : BitWord)
    (hmem : List.Mem generator
      ((subdivisionGeneratorBlock witness bits history).tail)) :
    forall candidateHistory candidatePayload,
      Not (WordPrefix (a candidateHistory candidatePayload) generator) := by
  intro candidateHistory candidatePayload hprefix
  rcases List.mem_append.mp hmem with hproper | hrouter
  · have hp := (mem_properPrefixes_iff _ _).mp hproper
    have hcandidate : WordPrefix (a candidateHistory candidatePayload)
        (a history (witness bits history)) :=
      wordPrefix_trans hprefix hp.1
    obtain ⟨hhistory, hpayload⟩ := a_prefix_eq hcandidate
    subst candidateHistory
    subst candidatePayload
    exact hp.2 (wordPrefix_antisymm hp.1 hprefix)
  · have hgenerator : generator = router history := by simpa using hrouter
    subst generator
    exact a_not_prefix_router candidateHistory candidatePayload history hprefix

/-- Membership in the flattened checkpoint generators has one ancestor block. -/
theorem mem_subdivisionCheckpointGenerators_iff
    {witness : BitWord -> BitWord -> BitWord}
    {bits checkpointHistory generator : BitWord} :
    List.Mem generator
        (subdivisionCheckpointGenerators witness bits checkpointHistory) <->
      exists ancestor,
        WordPrefix ancestor checkpointHistory /\
        List.Mem generator (subdivisionGeneratorBlock witness bits ancestor) := by
  rw [subdivisionCheckpointGenerators]
  constructor
  · intro hmem
    obtain ⟨ancestor, hancestor, hgenerator⟩ :=
      (mem_flatMap_iff_constructive generator
        (subdivisionGeneratorBlock witness bits)
        (historyPrefixes checkpointHistory).reverse).mp hmem
    exact ⟨ancestor,
      (mem_historyPrefixes_iff ancestor checkpointHistory).mp
        (List.mem_reverse.mp hancestor), hgenerator⟩
  · rintro ⟨ancestor, hprefix, hgenerator⟩
    exact (mem_flatMap_iff_constructive generator
      (subdivisionGeneratorBlock witness bits)
      (historyPrefixes checkpointHistory).reverse).mpr
      ⟨ancestor,
        List.mem_reverse.mpr
          ((mem_historyPrefixes_iff ancestor checkpointHistory).mpr hprefix),
        hgenerator⟩

/-- Complete candidates at a subdivision checkpoint are exactly its ancestors. -/
theorem candidate_mem_subdivisionCheckpoint_iff
    (witness : BitWord -> BitWord -> BitWord)
    (bits checkpointHistory history payload : BitWord) :
    List.Mem (a history payload)
        (anchoredOpenedPaths
          (subdivisionCheckpoint witness bits checkpointHistory)) <->
      WordPrefix history checkpointHistory /\
        payload = witness bits history := by
  rw [subdivisionCheckpoint,
    mem_anchoredOpenedPaths_seededPrefixBuild_iff]
  constructor
  · rintro ⟨generator, hgenerator, hcandPrefix⟩
    obtain ⟨ancestor, hancestor, hblock⟩ :=
      (mem_subdivisionCheckpointGenerators_iff).mp hgenerator
    rcases List.mem_cons.mp hblock with hhead | htail
    · subst generator
      obtain ⟨hhistory, hpayload⟩ := a_prefix_eq hcandPrefix
      subst ancestor
      exact ⟨hancestor, hpayload⟩
    · rcases List.mem_append.mp htail with hproper | hrouter
      · have hp := (mem_properPrefixes_iff _ _).mp hproper
        have hcandidatePrefix : WordPrefix (a history payload)
            (a ancestor (witness bits ancestor)) :=
          wordPrefix_trans hcandPrefix hp.1
        obtain ⟨hhistory, hpayload⟩ := a_prefix_eq hcandidatePrefix
        subst history
        subst payload
        have hreverse : WordPrefix
            (a ancestor (witness bits ancestor)) generator := by
          simpa using hcandPrefix
        exact False.elim
          (hp.2 (wordPrefix_antisymm hp.1 hreverse))
      · have hgenerator : generator = router ancestor := by
          simpa using hrouter
        subst generator
        exact False.elim
          (a_not_prefix_router history payload ancestor hcandPrefix)
  · rintro ⟨hprefix, hpayload⟩
    subst payload
    refine ⟨a history (witness bits history), ?_, WordPrefix.refl _⟩
    apply (mem_subdivisionCheckpointGenerators_iff).mpr
    refine ⟨history, hprefix, ?_⟩
    exact List.Mem.head _

/-- Exact branch-ideal projection of the executable subdivision checkpoint. -/
theorem projection_subdivisionCheckpoint_equivalent
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits history : BitWord) (hvalid : Valid bits history) :
    (projection verify
        (subdivisionCheckpoint witness bits history)).Equivalent
      (branchIdeal history) := by
  intro small
  constructor
  · intro hsmall
    obtain ⟨seed, large, payload, hseed, hpath, hverify, hsmallLarge⟩ :=
      (projection_contains_iff verify
        (subdivisionCheckpoint witness bits history) small).mp hsmall
    simp [subdivisionCheckpoint, seededPrefixBuild, seededBuild] at hseed
    cases hseed
    obtain ⟨hlargeHistory, hpayload⟩ :=
      (candidate_mem_subdivisionCheckpoint_iff witness bits history
        large payload).mp hpath
    exact (branchIdeal_contains_iff small history).mpr
      (wordPrefix_trans hsmallLarge hlargeHistory)
  · intro hsmall
    have hsmallHistory := (branchIdeal_contains_iff small history).mp hsmall
    have hsmallValid : Valid bits small :=
      hprefixClosed bits small history hvalid hsmallHistory
    apply (projection_contains_iff verify
      (subdivisionCheckpoint witness bits history) small).mpr
    refine ⟨bits, small, witness bits small, ?_, ?_, ?_, WordPrefix.refl _⟩
    · simp [subdivisionCheckpoint, seededPrefixBuild, seededBuild]
    · exact (candidate_mem_subdivisionCheckpoint_iff witness bits history
        small (witness bits small)).mpr ⟨hsmallHistory, rfl⟩
    · exact hcomplete bits small hsmallValid

/-- Strict candidate-prefix generators for the two enabled child slots. -/
def enabledChildPrefixGenerators
    (enabled : BitWord -> Bool -> Bool)
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : List BitWord :=
  (if enabled history false then
      properPrefixes
        (a (history ++ [false]) (witness bits (history ++ [false])))
    else []) ++
  (if enabled history true then
      properPrefixes
        (a (history ++ [true]) (witness bits (history ++ [true])))
    else [])

/--
One branch block: the history certificate itself, followed by prepared strict
prefixes for each enabled child.  The certificate entry is deliberately first,
so `treeOfGenerators` performs child preparation before opening it.
-/
def branchGeneratorBlock
    (enabled : BitWord -> Bool -> Bool)
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : List BitWord :=
  a history (witness bits history) ::
    enabledChildPrefixGenerators enabled witness bits history

/--
Executable generators for the checkpoint at `history`.  Blocks are ordered
from the current history back to the root.  Thus every earlier prepared path
is retained literally when one valid child is installed.
-/
def branchCheckpointGenerators
    (enabled : BitWord -> Bool -> Bool)
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : List BitWord :=
  (historyPrefixes history).reverse.flatMap
    (branchGeneratorBlock enabled witness bits)

/-- Computable term representative of one source-history-tree vertex. -/
def branchCheckpoint
    (enabled : BitWord -> Bool -> Bool)
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : Term :=
  seededPrefixBuild bits
    ⟨branchCheckpointGenerators enabled witness bits history⟩

/-- Prefix enumeration commutes with appending one occurrence bit. -/
theorem historyPrefixes_append_singleton (history : BitWord) (bit : Bool) :
    historyPrefixes (history ++ [bit]) =
      historyPrefixes history ++ [history ++ [bit]] := by
  induction history with
  | nil => simp [historyPrefixes]
  | cons head tail ih =>
      simp only [List.cons_append, historyPrefixes, ih, List.map_append,
        List.map_cons, List.map_nil, List.append_assoc]

/-- Exact generator recurrence for a source occurrence edge. -/
theorem branchCheckpointGenerators_append_singleton
    (enabled : BitWord -> Bool -> Bool)
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) (bit : Bool) :
    branchCheckpointGenerators enabled witness bits (history ++ [bit]) =
      branchGeneratorBlock enabled witness bits (history ++ [bit]) ++
        branchCheckpointGenerators enabled witness bits history := by
  simp [branchCheckpointGenerators, historyPrefixes_append_singleton]

/-- Every listed child-preparation generator is a strict candidate prefix. -/
theorem mem_enabledChildPrefixGenerators
    {enabled : BitWord -> Bool -> Bool}
    {witness : BitWord -> BitWord -> BitWord}
    {bits history generator : BitWord}
    (hmem : List.Mem generator
      (enabledChildPrefixGenerators enabled witness bits history)) :
    exists bit,
      enabled history bit = true /\
      ProperWordPrefix generator
        (a (history ++ [bit]) (witness bits (history ++ [bit]))) := by
  rw [enabledChildPrefixGenerators] at hmem
  rcases List.mem_append.mp hmem with hfalse | htrue
  · by_cases henabled : enabled history false
    · refine ⟨false, by simpa using henabled,
          (mem_properPrefixes_iff _ _).mp ?_⟩
      simpa [henabled] using! hfalse
    · simp [henabled] at hfalse
  · by_cases henabled : enabled history true
    · refine ⟨true, by simpa using henabled,
          (mem_properPrefixes_iff _ _).mp ?_⟩
      simpa [henabled] using! htrue
    · simp [henabled] at htrue

/-- A prepared strict child prefix can never itself be a candidate address. -/
theorem enabledChildPrefixGenerator_ne_candidate
    {enabled : BitWord -> Bool -> Bool}
    {witness : BitWord -> BitWord -> BitWord}
    {bits history generator : BitWord}
    (hmem : List.Mem generator
      (enabledChildPrefixGenerators enabled witness bits history))
    (candidateHistory candidatePayload : BitWord) :
    generator ≠ a candidateHistory candidatePayload := by
  obtain ⟨bit, henabled, hproper⟩ :=
    mem_enabledChildPrefixGenerators hmem
  intro heq
  subst generator
  obtain ⟨hhistory, hpayload⟩ := a_prefix_eq hproper.1
  subst candidateHistory
  subst candidatePayload
  exact hproper.2 rfl

/-- Generator membership splits into one ancestor certificate or child prep. -/
theorem mem_branchCheckpointGenerators_iff
    {enabled : BitWord -> Bool -> Bool}
    {witness : BitWord -> BitWord -> BitWord}
    {bits checkpointHistory generator : BitWord} :
    List.Mem generator
        (branchCheckpointGenerators enabled witness bits checkpointHistory) <->
      exists ancestor,
        WordPrefix ancestor checkpointHistory /\
        (generator = a ancestor (witness bits ancestor) \/
          List.Mem generator
            (enabledChildPrefixGenerators enabled witness bits ancestor)) := by
  rw [branchCheckpointGenerators]
  constructor
  · intro hmem
    obtain ⟨ancestor, hancestor, hgenerator⟩ :=
      (mem_flatMap_iff_constructive generator
        (fun ancestor =>
          a ancestor (witness bits ancestor) ::
            enabledChildPrefixGenerators enabled witness bits ancestor)
        (historyPrefixes checkpointHistory).reverse).mp hmem
    have hancestor' : List.Mem ancestor
        (historyPrefixes checkpointHistory) := by
      exact List.mem_reverse.mp hancestor
    refine ⟨ancestor,
      (mem_historyPrefixes_iff ancestor checkpointHistory).mp hancestor', ?_⟩
    exact List.mem_cons.mp hgenerator
  · rintro ⟨ancestor, hprefix, hgenerator⟩
    apply (mem_flatMap_iff_constructive generator
      (fun ancestor =>
        a ancestor (witness bits ancestor) ::
          enabledChildPrefixGenerators enabled witness bits ancestor)
      (historyPrefixes checkpointHistory).reverse).mpr
    refine ⟨ancestor, ?_, ?_⟩
    · exact List.mem_reverse.mpr
        ((mem_historyPrefixes_iff ancestor checkpointHistory).mpr hprefix)
    · exact List.mem_cons.mpr hgenerator

/--
A complete candidate occurs at a branch checkpoint exactly when it is the
canonical witness of an ancestor of the checkpoint history.
-/
theorem candidate_mem_branchCheckpoint_iff
    (enabled : BitWord -> Bool -> Bool)
    (witness : BitWord -> BitWord -> BitWord)
    (bits checkpointHistory history payload : BitWord) :
    List.Mem (a history payload)
        (ProtectedTrieEnumeration.anchoredOpenedPaths
          (branchCheckpoint enabled witness bits checkpointHistory)) <->
      WordPrefix history checkpointHistory /\
        payload = witness bits history := by
  rw [branchCheckpoint, mem_anchoredOpenedPaths_seededPrefixBuild_iff]
  constructor
  · rintro ⟨generator, hgenerator, hcandPrefix⟩
    obtain ⟨ancestor, hancestor, hkind⟩ :=
      (mem_branchCheckpointGenerators_iff).mp hgenerator
    rcases hkind with heq | hprepared
    · subst generator
      obtain ⟨hhistory, hpayload⟩ := a_prefix_eq hcandPrefix
      subst ancestor
      exact ⟨hancestor, hpayload⟩
    · obtain ⟨bit, henabled, hproper⟩ :=
        mem_enabledChildPrefixGenerators hprepared
      have hcandidatePrefix : WordPrefix (a history payload)
          (a (ancestor ++ [bit]) (witness bits (ancestor ++ [bit]))) :=
        wordPrefix_trans hcandPrefix hproper.1
      obtain ⟨hhistory, hpayload⟩ := a_prefix_eq hcandidatePrefix
      subst history
      subst payload
      have hreverse : WordPrefix
          (a (ancestor ++ [bit]) (witness bits (ancestor ++ [bit])))
          generator := by
        simpa using hcandPrefix
      exact False.elim
        (hproper.2 (wordPrefix_antisymm hproper.1 hreverse))
  · rintro ⟨hprefix, hpayload⟩
    subst payload
    refine ⟨a history (witness bits history), ?_, WordPrefix.refl _⟩
    apply (mem_branchCheckpointGenerators_iff).mpr
    exact ⟨history, hprefix, Or.inl rfl⟩

/-- Exact branch-ideal projection of the executable checkpoint. -/
theorem projection_branchCheckpoint_equivalent
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {enabled : BitWord -> Bool -> Bool}
    {witness : BitWord -> BitWord -> BitWord}
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits history : BitWord) (hvalid : Valid bits history) :
    (projection verify (branchCheckpoint enabled witness bits history)).Equivalent
      (branchIdeal history) := by
  intro small
  constructor
  · intro hsmall
    obtain ⟨seed, large, payload, hseed, hpath, hverify, hsmallLarge⟩ :=
      (projection_contains_iff verify
        (branchCheckpoint enabled witness bits history) small).mp hsmall
    simp [branchCheckpoint, seededPrefixBuild, seededBuild] at hseed
    cases hseed
    obtain ⟨hlargeHistory, hpayload⟩ :=
      (candidate_mem_branchCheckpoint_iff enabled witness bits history
        large payload).mp hpath
    exact (branchIdeal_contains_iff small history).mpr
      (wordPrefix_trans hsmallLarge hlargeHistory)
  · intro hsmall
    have hsmallHistory := (branchIdeal_contains_iff small history).mp hsmall
    have hsmallValid : Valid bits small :=
      hprefixClosed bits small history hvalid hsmallHistory
    apply (projection_contains_iff verify
      (branchCheckpoint enabled witness bits history) small).mpr
    refine ⟨bits, small, witness bits small, ?_, ?_, ?_, WordPrefix.refl _⟩
    · simp [branchCheckpoint, seededPrefixBuild, seededBuild]
    · exact (candidate_mem_branchCheckpoint_iff enabled witness bits history
        small (witness bits small)).mpr ⟨hsmallHistory, rfl⟩
    · exact hcomplete bits small hsmallValid

/-! ## Explicit canonical insertion walks -/

/--
The literal walk that inserts one finite abstract path into an arbitrary
canonical trie.  It opens missing ancestors in order and never uses an
existential reduction witness.
-/
noncomputable def insertPathWalk (bits : BitWord) {contextPath : BitWord}
    (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoint : BitWord) (tree : PrefixTree) :
    Walk Step
      (seededFieldTerm bits context (buildFrom phase tree))
      (seededFieldTerm bits context
        (buildFrom phase (insertPath endpoint tree))) := by
  induction endpoint generalizing contextPath phase tree context with
  | nil =>
      cases tree with
      | empty =>
          let opening := canonicalOpeningOfGood bits context phase hgood
          simpa [CanonicalOpening.source, CanonicalOpening.target,
            buildFrom, insertPath, phaseOpened] using opening.walk
      | node left right => exact .refl _
  | cons bit rest ih =>
      cases tree with
      | empty =>
          let opening := canonicalOpeningOfGood bits context phase hgood
          cases bit with
          | false =>
              let childContext := context.extendLeft
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              let childWalk := ih childContext (nextPhase phase) hgood.next
                PrefixTree.empty
              let openingWalk : Walk Step
                  (seededFieldTerm bits context
                    (buildFrom phase PrefixTree.empty))
                  (seededFieldTerm bits childContext
                    (buildFrom (nextPhase phase) PrefixTree.empty)) := by
                simpa [opening, CanonicalOpening.source,
                  CanonicalOpening.target, buildFrom, phaseOpened,
                  childContext, seededFieldTerm] using opening.walk
              simpa [CanonicalOpening.source, CanonicalOpening.target,
                buildFrom, insertPath, phaseOpened, childContext,
                seededFieldTerm] using Walk.append openingWalk childWalk
          | true =>
              let childContext := context.extendRight
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              let childWalk := ih childContext (nextPhase phase) hgood.next
                PrefixTree.empty
              let openingWalk : Walk Step
                  (seededFieldTerm bits context
                    (buildFrom phase PrefixTree.empty))
                  (seededFieldTerm bits childContext
                    (buildFrom (nextPhase phase) PrefixTree.empty)) := by
                simpa [opening, CanonicalOpening.source,
                  CanonicalOpening.target, buildFrom, phaseOpened,
                  childContext, seededFieldTerm] using opening.walk
              simpa [CanonicalOpening.source, CanonicalOpening.target,
                buildFrom, insertPath, phaseOpened, childContext,
                seededFieldTerm] using Walk.append openingWalk childWalk
      | node left right =>
          cases bit with
          | false =>
              let childContext := context.extendLeft
                (buildFrom (nextPhase phase) right) (phaseJunk phase)
              let childWalk := ih childContext (nextPhase phase) hgood.next left
              simpa [buildFrom, insertPath, childContext,
                seededFieldTerm] using childWalk
          | true =>
              let childContext := context.extendRight
                (buildFrom (nextPhase phase) left) (phaseJunk phase)
              let childWalk := ih childContext (nextPhase phase) hgood.next right
              simpa [buildFrom, insertPath, childContext,
                seededFieldTerm] using childWalk

/-- Projection monotonicity along a literal directed walk. -/
theorem Walk.project_le {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {project : Vertex -> HistoryIdeal}
    (hmono : forall {source target}, Edge source target ->
      (project source).LE (project target))
    {source target : Vertex} (walk : Walk Edge source target) :
    (project source).LE (project target) := by
  induction walk with
  | refl => exact HistoryIdeal.le_refl _
  | @tail middle target initial last ih =>
      exact HistoryIdeal.le_trans ih (hmono last)

/-- Forget the explicit vertex list to an ordinary finite reduction. -/
theorem Walk.toSteps {source target : Term} (walk : Walk Step source target) :
    Steps source target := by
  induction walk with
  | refl => exact .refl _
  | tail initial last ih => exact .tail ih last

/--
If a monotone walk has the same semantic projection at its endpoints, every
literal vertex has that projection.  This squeeze lemma avoids inspecting
dependent casts in recursively assembled walks.
-/
theorem Walk.every_projection_equivalent_on_encoder_cone
    (verify : CertificateVerifier) (bits : BitWord)
    {source target : Term} (walk : Walk Step source target)
    (hreach : Steps (encoder bits) source)
    (hend : (projection verify target).Equivalent
      (projection verify source)) :
    Walk.Every (fun vertex =>
      (projection verify vertex).Equivalent
        (projection verify source)) walk := by
  induction walk with
  | refl => exact .refl (HistoryIdeal.equivalent_refl _)
  | @tail middle target initial last ih =>
      have hsourceMiddle :=
        projection_steps_mono_on_encoder_cone verify hreach initial.toSteps
      have hmiddleReach : Steps (encoder bits) _ :=
        Steps.trans hreach initial.toSteps
      have hmiddleTarget :=
        projection_step_mono_on_encoder_cone verify hmiddleReach last
      have hmiddle : (projection verify middle).Equivalent
          (projection verify source) := by
        intro history
        constructor
        · intro h
          exact (hend history).mp (hmiddleTarget history h)
        · exact hsourceMiddle history
      exact .tail last (ih hmiddle) hend

/--
Inserting a path below which no complete candidate can occur preserves the
projection at the canonical endpoint.
-/
theorem insertPath_projection_stutter
    (verify : CertificateVerifier) (bits : BitWord)
    {contextPath : BitWord} (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoint : BitWord) (tree : PrefixTree)
    (hfree : forall history payload,
      Not (WordPrefix (a history payload) (contextPath ++ endpoint))) :
    (projection verify
      (seededFieldTerm bits context
        (buildFrom phase (insertPath endpoint tree)))).Equivalent
      (projection verify
        (seededFieldTerm bits context (buildFrom phase tree))) := by
  induction endpoint generalizing contextPath phase tree context with
  | nil =>
      cases tree with
      | empty =>
          let opening := canonicalOpeningOfGood bits context phase hgood
          have hnot : forall history payload,
              contextPath ≠ a history payload := by
            intro history payload heq
            apply hfree history payload
            simpa [heq] using (WordPrefix.refl (a history payload))
          simpa [opening, CanonicalOpening.source,
            CanonicalOpening.target, buildFrom, insertPath, phaseOpened] using
            opening.target_projection_stutter_of_not_candidate verify hnot
      | node left right => exact HistoryIdeal.equivalent_refl _
  | cons bit rest ih =>
      cases tree with
      | empty =>
          let opening := canonicalOpeningOfGood bits context phase hgood
          have hnot : forall history payload,
              contextPath ≠ a history payload := by
            intro history payload heq
            apply hfree history payload
            rw [← heq]
            exact wordPrefix_self_append contextPath (bit :: rest)
          have hopen := opening.target_projection_stutter_of_not_candidate
            verify hnot
          cases bit with
          | false =>
              let childContext := context.extendLeft
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              have hfreeChild : forall history payload,
                  Not (WordPrefix (a history payload)
                    ((contextPath ++ [false]) ++ rest)) := by
                intro history payload hprefix
                apply hfree history payload
                simpa [List.append_assoc] using hprefix
              have hchild := ih childContext (nextPhase phase)
                hgood.next PrefixTree.empty hfreeChild
              have hbridge :
                  (projection verify
                    (seededFieldTerm bits childContext
                      (buildFrom (nextPhase phase) PrefixTree.empty))).Equivalent
                    (projection verify
                      (seededFieldTerm bits context
                        (buildFrom phase PrefixTree.empty))) := by
                have hopen' :
                    (projection verify
                      (seededFieldTerm bits childContext
                        (buildFrom (nextPhase phase) PrefixTree.empty))).Equivalent
                      (projection verify opening.source) := by
                  simpa [opening, CanonicalOpening.source,
                    CanonicalOpening.target, buildFrom, phaseOpened,
                    childContext, seededFieldTerm] using hopen
                simpa [opening, CanonicalOpening.source, buildFrom] using hopen'
              simpa [buildFrom, insertPath, childContext, seededFieldTerm] using
                HistoryIdeal.equivalent_trans hchild hbridge
          | true =>
              let childContext := context.extendRight
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              have hfreeChild : forall history payload,
                  Not (WordPrefix (a history payload)
                    ((contextPath ++ [true]) ++ rest)) := by
                intro history payload hprefix
                apply hfree history payload
                simpa [List.append_assoc] using hprefix
              have hchild := ih childContext (nextPhase phase)
                hgood.next PrefixTree.empty hfreeChild
              have hbridge :
                  (projection verify
                    (seededFieldTerm bits childContext
                      (buildFrom (nextPhase phase) PrefixTree.empty))).Equivalent
                    (projection verify
                      (seededFieldTerm bits context
                        (buildFrom phase PrefixTree.empty))) := by
                have hopen' :
                    (projection verify
                      (seededFieldTerm bits childContext
                        (buildFrom (nextPhase phase) PrefixTree.empty))).Equivalent
                      (projection verify opening.source) := by
                  simpa [opening, CanonicalOpening.source,
                    CanonicalOpening.target, buildFrom, phaseOpened,
                    childContext, seededFieldTerm] using hopen
                simpa [opening, CanonicalOpening.source, buildFrom] using hopen'
              simpa [buildFrom, insertPath, childContext, seededFieldTerm] using
                HistoryIdeal.equivalent_trans hchild hbridge
      | node left right =>
          cases bit with
          | false =>
              let childContext := context.extendLeft
                (buildFrom (nextPhase phase) right) (phaseJunk phase)
              have hfreeChild : forall history payload,
                  Not (WordPrefix (a history payload)
                    ((contextPath ++ [false]) ++ rest)) := by
                intro history payload hprefix
                apply hfree history payload
                simpa [List.append_assoc] using hprefix
              have hchild := ih childContext (nextPhase phase)
                hgood.next left hfreeChild
              simpa [buildFrom, insertPath, childContext, seededFieldTerm] using hchild
          | true =>
              let childContext := context.extendRight
                (buildFrom (nextPhase phase) left) (phaseJunk phase)
              have hfreeChild : forall history payload,
                  Not (WordPrefix (a history payload)
                    ((contextPath ++ [true]) ++ rest)) := by
                intro history payload hprefix
                apply hfree history payload
                simpa [List.append_assoc] using hprefix
              have hchild := ih childContext (nextPhase phase)
                hgood.next right hfreeChild
              simpa [buildFrom, insertPath, childContext, seededFieldTerm] using hchild

/--
If no complete candidate address prefixes the inserted endpoint, every vertex
of its explicit insertion walk has exactly the source projection.
-/
theorem insertPathWalk_every_projection_stutter
    (verify : CertificateVerifier) (bits : BitWord)
    {contextPath : BitWord} (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoint : BitWord) (tree : PrefixTree)
    (hreach : Steps (encoder bits)
      (seededFieldTerm bits context (buildFrom phase tree)))
    (hfree : forall history payload,
      Not (WordPrefix (a history payload) (contextPath ++ endpoint))) :
    Walk.Every
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify
          (seededFieldTerm bits context (buildFrom phase tree))))
      (insertPathWalk bits context phase hgood endpoint tree) := by
  apply Walk.every_projection_equivalent_on_encoder_cone verify bits _ hreach
  exact insertPath_projection_stutter verify bits context phase hgood endpoint tree hfree

/-
/--
When a missing inserted endpoint is one complete candidate address, every
vertex before the final endpoint retains the source projection.  Earlier
openings occur only at strict prefixes and therefore are full stutters; the
last canonical opening alone may add the certificate.
-/
theorem insertPathWalk_before_candidate_event
    (verify : CertificateVerifier) (bits : BitWord)
    {contextPath : BitWord} (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoint : BitWord) (tree : PrefixTree)
    (history payload : BitWord)
    (haddress : contextPath ++ endpoint = a history payload)
    (hmissing : Not (List.Mem endpoint tree.paths)) :
    Walk.BeforeTarget
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify
          (seededFieldTerm bits context (buildFrom phase tree))))
      (insertPathWalk bits context phase hgood endpoint tree) := by
  induction endpoint generalizing contextPath phase tree context with
  | nil =>
      cases tree with
      | empty =>
          let opening := canonicalOpeningOfGood bits context phase hgood
          have hopening := opening.before_target_projection_stutter verify
          simpa [insertPathWalk, opening, CanonicalOpening.source,
            CanonicalOpening.target, buildFrom, insertPath, phaseOpened] using
            hopening
      | node left right =>
          exact False.elim (hmissing (nil_mem_paths_node left right))
  | cons bit rest ih =>
      have hcontextProper : ProperWordPrefix contextPath (a history payload) := by
        constructor
        · rw [← haddress]
          exact wordPrefix_self_append contextPath (bit :: rest)
        · intro heq
          have hlen := congrArg List.length heq
          rw [← haddress] at hlen
          simp at hlen
      have hnot : forall otherHistory otherPayload,
          contextPath ≠ a otherHistory otherPayload := by
        intro otherHistory otherPayload heq
        subst contextPath
        exact False.elim
          (a_not_proper_prefix_a otherHistory otherPayload history payload
            hcontextProper)
      cases tree with
      | empty =>
          let opening := canonicalOpeningOfGood bits context phase hgood
          have hopen := opening.every_projection_stutter_of_not_candidate
            verify hnot
          have hbridge := opening.target_projection_stutter_of_not_candidate
            verify hnot
          cases bit with
          | false =>
              let childContext := context.extendLeft
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              have haddressChild :
                  (contextPath ++ [false]) ++ rest = a history payload := by
                simpa [List.append_assoc] using haddress
              have hchild := ih childContext (nextPhase phase) hgood.next
                PrefixTree.empty haddressChild (not_mem_paths_empty rest)
              have hchild' : Walk.BeforeTarget
                  (fun vertex => (projection verify vertex).Equivalent
                    (projection verify opening.source))
                  (insertPathWalk bits childContext (nextPhase phase)
                    hgood.next rest PrefixTree.empty) := by
                intro vertex hmem htarget
                exact HistoryIdeal.equivalent_trans
                  (hchild vertex hmem htarget)
                  (by simpa [opening, CanonicalOpening.source,
                    CanonicalOpening.target, buildFrom, phaseOpened,
                    childContext, seededFieldTerm] using hbridge)
              let openingWalk : Walk Step
                  (seededFieldTerm bits context
                    (buildFrom phase PrefixTree.empty))
                  (seededFieldTerm bits childContext
                    (buildFrom (nextPhase phase) PrefixTree.empty)) := by
                simpa [opening, CanonicalOpening.source,
                  CanonicalOpening.target, buildFrom, phaseOpened,
                  childContext, seededFieldTerm] using opening.walk
              have hopen' : Walk.Every
                  (fun vertex => (projection verify vertex).Equivalent
                    (projection verify opening.source)) openingWalk := by
                simpa [openingWalk, opening, CanonicalOpening.source,
                  CanonicalOpening.target, buildFrom, phaseOpened,
                  childContext, seededFieldTerm] using hopen
              have hcombined := Walk.BeforeTarget.append hopen' hchild'
              simpa [insertPathWalk, openingWalk, opening,
                CanonicalOpening.source,
                CanonicalOpening.target, buildFrom, insertPath, phaseOpened,
                childContext, seededFieldTerm] using hcombined
          | true =>
              let childContext := context.extendRight
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              have haddressChild :
                  (contextPath ++ [true]) ++ rest = a history payload := by
                simpa [List.append_assoc] using haddress
              have hchild := ih childContext (nextPhase phase) hgood.next
                PrefixTree.empty haddressChild (not_mem_paths_empty rest)
              have hchild' : Walk.BeforeTarget
                  (fun vertex => (projection verify vertex).Equivalent
                    (projection verify opening.source))
                  (insertPathWalk bits childContext (nextPhase phase)
                    hgood.next rest PrefixTree.empty) := by
                intro vertex hmem htarget
                exact HistoryIdeal.equivalent_trans
                  (hchild vertex hmem htarget)
                  (by simpa [opening, CanonicalOpening.source,
                    CanonicalOpening.target, buildFrom, phaseOpened,
                    childContext, seededFieldTerm] using hbridge)
              let openingWalk : Walk Step
                  (seededFieldTerm bits context
                    (buildFrom phase PrefixTree.empty))
                  (seededFieldTerm bits childContext
                    (buildFrom (nextPhase phase) PrefixTree.empty)) := by
                simpa [opening, CanonicalOpening.source,
                  CanonicalOpening.target, buildFrom, phaseOpened,
                  childContext, seededFieldTerm] using opening.walk
              have hopen' : Walk.Every
                  (fun vertex => (projection verify vertex).Equivalent
                    (projection verify opening.source)) openingWalk := by
                simpa [openingWalk, opening, CanonicalOpening.source,
                  CanonicalOpening.target, buildFrom, phaseOpened,
                  childContext, seededFieldTerm] using hopen
              have hcombined := Walk.BeforeTarget.append hopen' hchild'
              simpa [insertPathWalk, openingWalk, opening,
                CanonicalOpening.source,
                CanonicalOpening.target, buildFrom, insertPath, phaseOpened,
                childContext, seededFieldTerm] using hcombined
      | node left right =>
          cases bit with
          | false =>
              let childContext := context.extendLeft
                (buildFrom (nextPhase phase) right) (phaseJunk phase)
              have haddressChild :
                  (contextPath ++ [false]) ++ rest = a history payload := by
                simpa [List.append_assoc] using haddress
              have hmissingChild : Not (List.Mem rest left.paths) := by
                intro hmem
                apply hmissing
                exact (false_cons_mem_paths_node_iff rest left right).mpr hmem
              have hchild := ih childContext (nextPhase phase) hgood.next
                left haddressChild hmissingChild
              intro vertex hmem htarget
              have hmem' : List.Mem vertex
                  (insertPathWalk bits childContext (nextPhase phase)
                    hgood.next rest left).vertices := by
                simpa [insertPathWalk, buildFrom, insertPath, childContext,
                  seededFieldTerm] using hmem
              have htarget' : vertex ≠
                  seededFieldTerm bits childContext
                    (buildFrom (nextPhase phase) (insertPath rest left)) := by
                simpa [insertPathWalk, buildFrom, insertPath, childContext,
                  seededFieldTerm] using htarget
              have hvalue := hchild vertex hmem' htarget'
              simpa [childContext, seededFieldTerm, buildFrom] using hvalue
          | true =>
              let childContext := context.extendRight
                (buildFrom (nextPhase phase) left) (phaseJunk phase)
              have haddressChild :
                  (contextPath ++ [true]) ++ rest = a history payload := by
                simpa [List.append_assoc] using haddress
              have hmissingChild : Not (List.Mem rest right.paths) := by
                intro hmem
                apply hmissing
                exact (true_cons_mem_paths_node_iff rest left right).mpr hmem
              have hchild := ih childContext (nextPhase phase) hgood.next
                right haddressChild hmissingChild
              intro vertex hmem htarget
              have hmem' : List.Mem vertex
                  (insertPathWalk bits childContext (nextPhase phase)
                    hgood.next rest right).vertices := by
                simpa [insertPathWalk, buildFrom, insertPath, childContext,
                  seededFieldTerm] using hmem
              have htarget' : vertex ≠
                  seededFieldTerm bits childContext
                    (buildFrom (nextPhase phase) (insertPath rest right)) := by
                simpa [insertPathWalk, buildFrom, insertPath, childContext,
                  seededFieldTerm] using htarget
              have hvalue := hchild vertex hmem' htarget'
              simpa [childContext, seededFieldTerm, buildFrom] using hvalue
-/

/-- Insert a finite list in the same right-to-left order as `treeOfGenerators`. -/
def insertPaths : List BitWord -> PrefixTree -> PrefixTree
  | [], tree => tree
  | endpoint :: rest, tree => insertPath endpoint (insertPaths rest tree)

/-- A finite insertion block adds exactly prefixes of one listed endpoint. -/
theorem mem_paths_insertPaths_iff (endpoints : List BitWord)
    (tree : PrefixTree) (path : BitWord) :
    List.Mem path (insertPaths endpoints tree).paths <->
      List.Mem path tree.paths \/
        exists endpoint, List.Mem endpoint endpoints /\
          WordPrefix path endpoint := by
  induction endpoints with
  | nil =>
      constructor
      · exact Or.inl
      · intro h
        rcases h with hold | ⟨endpoint, hmem, hprefix⟩
        · exact hold
        · cases hmem
  | cons endpoint rest ih =>
      rw [insertPaths, mem_paths_insertPath_iff, ih]
      constructor
      · intro h
        rcases h with (hold | ⟨found, hfound, hprefix⟩) | hnew
        · exact Or.inl hold
        · exact Or.inr ⟨found, List.Mem.tail endpoint hfound, hprefix⟩
        · exact Or.inr ⟨endpoint, List.Mem.head rest, hnew⟩
      · intro h
        rcases h with hold | ⟨found, hfound, hprefix⟩
        · exact Or.inl (Or.inl hold)
        · cases hfound with
          | head => exact Or.inr hprefix
          | tail _ hrest => exact Or.inl (Or.inr ⟨found, hrest, hprefix⟩)

/-- A larger inserted path structurally absorbs an already inserted prefix. -/
theorem insertPath_prefix_absorbs {small large : BitWord}
    (hprefix : WordPrefix small large) (tree : PrefixTree) :
    insertPath large (insertPath small tree) = insertPath large tree := by
  induction hprefix generalizing tree with
  | nil large =>
      cases large with
      | nil => cases tree <;> rfl
      | cons bit rest => cases bit <;> cases tree <;> rfl
  | cons bit htail ih =>
      cases bit <;> cases tree <;> simp only [insertPath] <;> rw [ih]

/-- List insertion distributes over literal list concatenation. -/
theorem insertPaths_append (first second : List BitWord) (tree : PrefixTree) :
    insertPaths (first ++ second) tree =
      insertPaths first (insertPaths second tree) := by
  induction first with
  | nil => rfl
  | cons endpoint rest ih => simp [insertPaths, ih]

/-- Direct protected child below the source history's persistent router. -/
def subdivisionBranchPath (source : BitWord) (bit : Bool) : BitWord :=
  router source ++ [bit]

/-- The first branch field is a literal prefix of the target router. -/
theorem subdivisionBranchPath_prefix_targetRouter
    (source : BitWord) (bit : Bool) :
    WordPrefix (subdivisionBranchPath source bit)
      (router (source ++ [bit])) := by
  have hprefix := wordPrefix_self_append
    (subdivisionBranchPath source bit) [true]
  simpa [subdivisionBranchPath, router, r_append_singleton,
    List.append_assoc] using hprefix

/-- Preopening the first branch field does not alter the completed edge block. -/
theorem subdivisionBlock_absorbs_branch
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (tree : PrefixTree) :
    insertPaths (subdivisionGeneratorBlock witness bits (source ++ [bit]))
        (insertPath (subdivisionBranchPath source bit) tree) =
      insertPaths (subdivisionGeneratorBlock witness bits (source ++ [bit]))
        tree := by
  unfold subdivisionGeneratorBlock
  simp only [insertPaths, insertPaths_append]
  rw [insertPath_prefix_absorbs
    (subdivisionBranchPath_prefix_targetRouter source bit)]

/-- A strict one-bit extension cannot prefix its own source history. -/
theorem append_singleton_not_prefix_self (history : BitWord) (bit : Bool) :
    Not (WordPrefix (history ++ [bit]) history) := by
  intro hprefix
  have hlength := wordPrefix_length_le hprefix
  have himpossible : history.length + 1 ≤ history.length := by
    simpa using hlength
  exact (Nat.not_succ_le_self history.length) himpossible

/-- Structural source tree of an executable subdivision checkpoint. -/
def subdivisionSourceTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : PrefixTree :=
  treeOfGenerators (subdivisionCheckpointGenerators witness bits history)

/-- No source-checkpoint generator lies below either outgoing router field. -/
theorem subdivisionSourceGenerator_branch_free
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (generator : BitWord)
    (hgenerator : List.Mem generator
      (subdivisionCheckpointGenerators witness bits source)) :
    Not (WordPrefix (subdivisionBranchPath source bit) generator) := by
  intro hbranch
  obtain ⟨ancestor, hancestor, hblock⟩ :=
    (mem_subdivisionCheckpointGenerators_iff).mp hgenerator
  rcases List.mem_cons.mp hblock with hcertificate | htail
  · subst generator
    apply router_not_prefix_a_of_history_prefix hancestor
      (witness bits ancestor)
    exact wordPrefix_trans
      (wordPrefix_self_append (router source) [bit]) hbranch
  · rcases List.mem_append.mp htail with hproper | hrouter
    · have hp := (mem_properPrefixes_iff _ _).mp hproper
      apply router_not_prefix_a_of_history_prefix hancestor
        (witness bits ancestor)
      exact wordPrefix_trans
        (wordPrefix_self_append (router source) [bit])
        (wordPrefix_trans hbranch hp.1)
    · have hgenerator : generator = router ancestor := by simpa using hrouter
      subst generator
      apply append_singleton_not_prefix_self (router source) bit
      exact wordPrefix_trans hbranch
        (router_prefix_of_history_prefix hancestor)

/-- The router itself is one explicit source-checkpoint generator. -/
theorem router_mem_subdivisionCheckpointGenerators
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) :
    List.Mem (router source)
      (subdivisionCheckpointGenerators witness bits source) := by
  apply (mem_subdivisionCheckpointGenerators_iff).mpr
  refine ⟨source, WordPrefix.refl _, ?_⟩
  apply List.Mem.tail
  exact List.mem_append.mpr (Or.inr (List.Mem.head []))

/-- The current router node is opened in the source checkpoint tree. -/
theorem router_mem_subdivisionSourceTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) :
    List.Mem (router source)
      (subdivisionSourceTree witness bits source).paths := by
  apply (mem_paths_treeOfGenerators_iff _ _).mpr
  exact ⟨router source,
    router_mem_subdivisionCheckpointGenerators witness bits source,
    WordPrefix.refl _⟩

/-- Both outgoing fields of the current router are literal empty frontiers. -/
theorem subdivisionBranchPath_not_mem_sourceTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Not (List.Mem (subdivisionBranchPath source bit)
      (subdivisionSourceTree witness bits source).paths) := by
  intro hmem
  obtain ⟨generator, hgenerator, hprefix⟩ :=
    (mem_paths_treeOfGenerators_iff _ _).mp hmem
  exact subdivisionSourceGenerator_branch_free witness bits source bit
    generator hgenerator hprefix

/-- Every strict prefix of an outgoing field is already present. -/
theorem subdivisionBranchPath_proper_mem_sourceTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (small : BitWord)
    (hsmall : ProperWordPrefix small (subdivisionBranchPath source bit)) :
    List.Mem small (subdivisionSourceTree witness bits source).paths := by
  apply (mem_paths_treeOfGenerators_iff _ _).mpr
  refine ⟨router source,
    router_mem_subdivisionCheckpointGenerators witness bits source, ?_⟩
  exact proper_prefix_append_singleton_prefix_self hsmall

/-- Two different fields below one literal stem cannot prefix one another. -/
theorem wordPrefix_append_bits_incompatible (stem : BitWord)
    {left right : Bool} (hne : left ≠ right) (suffix : BitWord) :
    Not (WordPrefix (stem ++ [left]) ((stem ++ [right]) ++ suffix)) := by
  induction stem with
  | nil =>
      intro hprefix
      exact hne (WordPrefix.head_eq hprefix)
  | cons head rest ih =>
      intro hprefix
      apply ih
      simpa only [List.cons_append] using! WordPrefix.tail hprefix

/-- The unused sibling field cannot prefix the chosen child's certificate. -/
theorem oppositeBranch_not_prefix_targetCandidate
    (source : BitWord) (bit : Bool) (payload : BitWord) :
    Not (WordPrefix (subdivisionBranchPath source (!bit))
      (a (source ++ [bit]) payload)) := by
  have hshape : a (source ++ [bit]) payload =
      subdivisionBranchPath source bit ++ (false :: pc payload) := by
    simp [a, subdivisionBranchPath, router, r_append_singleton,
      List.append_assoc]
  rw [hshape]
  exact wordPrefix_append_bits_incompatible (router source)
    (by cases bit <;> decide) (false :: pc payload)

/-- The unused sibling field cannot prefix the chosen child's router. -/
theorem oppositeBranch_not_prefix_targetRouter
    (source : BitWord) (bit : Bool) :
    Not (WordPrefix (subdivisionBranchPath source (!bit))
      (router (source ++ [bit]))) := by
  have hshape : router (source ++ [bit]) =
      subdivisionBranchPath source bit ++ [true] := by
    simp [subdivisionBranchPath, router, r_append_singleton,
      List.append_assoc]
  rw [hshape]
  exact wordPrefix_append_bits_incompatible (router source)
    (by cases bit <;> decide) [true]

/-- No generator in the chosen target block enters its sibling field. -/
theorem oppositeBranch_not_prefix_targetBlock
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (generator : BitWord)
    (hgenerator : List.Mem generator
      (subdivisionGeneratorBlock witness bits (source ++ [bit]))) :
    Not (WordPrefix (subdivisionBranchPath source (!bit)) generator) := by
  rcases List.mem_cons.mp hgenerator with hcertificate | htail
  · subst generator
    exact oppositeBranch_not_prefix_targetCandidate source bit
      (witness bits (source ++ [bit]))
  · rcases List.mem_append.mp htail with hproper | hrouter
    · intro hprefix
      have hp := (mem_properPrefixes_iff _ _).mp hproper
      exact oppositeBranch_not_prefix_targetCandidate source bit
        (witness bits (source ++ [bit]))
        (wordPrefix_trans hprefix hp.1)
    · have heq : generator = router (source ++ [bit]) := by simpa using hrouter
      subst generator
      exact oppositeBranch_not_prefix_targetRouter source bit

/-- The chosen child field is open at the target checkpoint tree. -/
theorem subdivisionBranchPath_mem_targetTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    List.Mem (subdivisionBranchPath source bit)
      (subdivisionSourceTree witness bits (source ++ [bit])).paths := by
  unfold subdivisionSourceTree
  apply (mem_paths_treeOfGenerators_iff _ _).mpr
  refine ⟨router (source ++ [bit]), ?_,
    subdivisionBranchPath_prefix_targetRouter source bit⟩
  rw [subdivisionCheckpointGenerators_append_singleton]
  apply List.mem_append.mpr
  left
  apply List.Mem.tail
  exact List.mem_append.mpr (Or.inr (List.Mem.head []))

/-- Early local form of generator concatenation as structural insertion. -/
theorem treeOfGenerators_append_early (first second : List BitWord) :
    treeOfGenerators (first ++ second) =
      insertPaths first (treeOfGenerators second) := by
  induction first with
  | nil => rfl
  | cons endpoint rest ih =>
      simp [treeOfGenerators, insertPaths, ih]

/-- The unused sibling field remains closed at the target checkpoint tree. -/
theorem subdivisionOppositeBranch_not_mem_targetTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Not (List.Mem (subdivisionBranchPath source (!bit))
      (subdivisionSourceTree witness bits (source ++ [bit])).paths) := by
  unfold subdivisionSourceTree
  rw [subdivisionCheckpointGenerators_append_singleton,
    treeOfGenerators_append_early]
  intro hmem
  rcases (mem_paths_insertPaths_iff
      (subdivisionGeneratorBlock witness bits (source ++ [bit]))
      (treeOfGenerators (subdivisionCheckpointGenerators witness bits source))
      (subdivisionBranchPath source (!bit))).mp hmem with
    hold | ⟨generator, hgenerator, hprefix⟩
  · exact subdivisionBranchPath_not_mem_sourceTree
      witness bits source (!bit) hold
  · exact oppositeBranch_not_prefix_targetBlock
      witness bits source bit generator hgenerator hprefix

/-- Anchored parsing of a canonical tree is literal path membership. -/
theorem anchoredOpenedAt_seededTree_iff
    (bits path : BitWord) (tree : PrefixTree) :
    anchoredOpenedAt?
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0) tree)) path = true <->
      List.Mem path tree.paths := by
  rw [← mem_anchoredOpenedPaths_iff_anchoredOpenedAt?]
  simpa [seededFieldTerm, seededBuild, buildAt] using!
    mem_anchoredOpenedPaths_seededBuild_iff bits tree path

/-- The selected child parser bit is true at its target checkpoint. -/
theorem subdivisionCheckpoint_selectedBranch_open
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    anchoredOpenedAt?
      (subdivisionCheckpoint witness bits (source ++ [bit]))
      (subdivisionBranchPath source bit) = true := by
  apply (anchoredOpenedAt_seededTree_iff bits
    (subdivisionBranchPath source bit)
    (subdivisionSourceTree witness bits (source ++ [bit]))).mpr
  exact subdivisionBranchPath_mem_targetTree witness bits source bit

/-- The unused sibling parser bit is false at the target checkpoint. -/
theorem subdivisionCheckpoint_oppositeBranch_closed
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    anchoredOpenedAt?
      (subdivisionCheckpoint witness bits (source ++ [bit]))
      (subdivisionBranchPath source (!bit)) = false := by
  cases hopen : anchoredOpenedAt?
      (subdivisionCheckpoint witness bits (source ++ [bit]))
      (subdivisionBranchPath source (!bit)) with
  | false => rfl
  | true =>
      have hmem := (anchoredOpenedAt_seededTree_iff bits
        (subdivisionBranchPath source (!bit))
        (subdivisionSourceTree witness bits (source ++ [bit]))).mp hopen
      exact False.elim
        (subdivisionOppositeBranch_not_mem_targetTree
          witness bits source bit hmem)

/-- The current router is a literal protected binary leaf. -/
noncomputable def subdivisionRouterLeaf
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) :
    PrefixTree.BinaryLeafAt
      (subdivisionSourceTree witness bits source) (router source) :=
  PrefixTree.binaryLeafAtOfChildrenAbsent
    (router_mem_subdivisionSourceTree witness bits source)
    (subdivisionBranchPath_not_mem_sourceTree witness bits source false)
    (subdivisionBranchPath_not_mem_sourceTree witness bits source true)

/-- First local child-opening macro of an ordered source edge. -/
noncomputable def subdivisionFirstOpening
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    CanonicalOpening bits
      ((subdivisionRouterLeaf witness bits source).childContext
        (phaseAt 0) bit)
      (nextPhase
        ((subdivisionRouterLeaf witness bits source).focusPhase (phaseAt 0))) :=
  canonicalOpeningOfGood bits
    ((subdivisionRouterLeaf witness bits source).childContext
      (phaseAt 0) bit)
    (nextPhase
      ((subdivisionRouterLeaf witness bits source).focusPhase (phaseAt 0)))
    ((subdivisionRouterLeaf witness bits source).focus_good
      (goodPhase_phaseAt 0) |>.next)

/-- The first child opening starts at the public source checkpoint. -/
theorem subdivisionFirstOpening_source
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    (subdivisionFirstOpening witness bits source bit).source =
      subdivisionCheckpoint witness bits source := by
  unfold subdivisionFirstOpening CanonicalOpening.source seededFieldTerm
  unfold subdivisionCheckpoint seededPrefixBuild seededBuild buildAt
    treeOfPrefixSet subdivisionSourceTree
  exact congrArg (seededHeader bits)
    ((subdivisionRouterLeaf witness bits source).plug_childGenerator
      (phaseAt 0) bit)

/-- Its endpoint is exactly the source tree with that child opened. -/
theorem subdivisionFirstOpening_target
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    (subdivisionFirstOpening witness bits source bit).target =
      seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source))) := by
  unfold subdivisionFirstOpening CanonicalOpening.target seededFieldTerm
  exact congrArg (seededHeader bits)
    ((subdivisionRouterLeaf witness bits source).plug_childOpened
      (phaseAt 0) bit)

/-- Router/proper-prefix preparation performed before the target event. -/
def subdivisionPreparation
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) : List BitWord :=
  (subdivisionGeneratorBlock witness bits history).tail

/-- Tree immediately before the target certificate's canonical opening. -/
def subdivisionPreparedTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) : PrefixTree :=
  insertPaths
    (subdivisionPreparation witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)

/-- The target preparation already contains the selected router field. -/
theorem subdivisionPreparation_absorbs_branch
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (tree : PrefixTree) :
    insertPaths (subdivisionPreparation witness bits (source ++ [bit]))
        (insertPath (subdivisionBranchPath source bit) tree) =
      insertPaths (subdivisionPreparation witness bits (source ++ [bit]))
        tree := by
  unfold subdivisionPreparation subdivisionGeneratorBlock
  simp only [List.tail_cons]
  rw [insertPaths_append, insertPaths_append]
  have hrouter :
      insertPaths [router (source ++ [bit])]
          (insertPath (subdivisionBranchPath source bit) tree) =
        insertPaths [router (source ++ [bit])] tree := by
    simpa [insertPaths] using
      insertPath_prefix_absorbs
        (subdivisionBranchPath_prefix_targetRouter source bit) tree
  rw [hrouter]

/-- The target certificate is absent from its source checkpoint tree. -/
theorem target_candidate_not_mem_subdivisionSourceTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Not (List.Mem
      (a (source ++ [bit]) (witness bits (source ++ [bit])))
      (subdivisionSourceTree witness bits source).paths) := by
  intro hmem
  have hanchored : List.Mem
      (a (source ++ [bit]) (witness bits (source ++ [bit])))
      (anchoredOpenedPaths (subdivisionCheckpoint witness bits source)) := by
    simpa [subdivisionCheckpoint, subdivisionSourceTree,
      seededPrefixBuild, treeOfPrefixSet,
      anchoredOpenedPaths_seededBuild] using hmem
  have hprefix :=
    (candidate_mem_subdivisionCheckpoint_iff witness bits source
      (source ++ [bit]) (witness bits (source ++ [bit]))).mp hanchored |>.1
  exact append_singleton_not_prefix_self source bit hprefix

/-- The target certificate is still absent after all preparation stutters. -/
theorem target_candidate_not_mem_subdivisionPreparedTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Not (List.Mem
      (a (source ++ [bit]) (witness bits (source ++ [bit])))
      (subdivisionPreparedTree witness bits source bit).paths) := by
  intro hmem
  rcases (mem_paths_insertPaths_iff
      (subdivisionPreparation witness bits (source ++ [bit]))
      (subdivisionSourceTree witness bits source)
      (a (source ++ [bit]) (witness bits (source ++ [bit])))).mp hmem with
    hold | ⟨endpoint, hendpoint, hprefix⟩
  · exact target_candidate_not_mem_subdivisionSourceTree
      witness bits source bit hold
  · exact subdivisionBlock_tail_candidate_free witness bits
      (source ++ [bit]) endpoint hendpoint
      (source ++ [bit]) (witness bits (source ++ [bit])) hprefix

/-- Every strict target-certificate prefix has been opened before the event. -/
theorem target_candidate_proper_mem_subdivisionPreparedTree
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool)
    (small : BitWord)
    (hsmall : ProperWordPrefix small
      (a (source ++ [bit]) (witness bits (source ++ [bit])))) :
    List.Mem small (subdivisionPreparedTree witness bits source bit).paths := by
  apply (mem_paths_insertPaths_iff
    (subdivisionPreparation witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source) small).mpr
  right
  refine ⟨small, ?_, WordPrefix.refl _⟩
  apply List.mem_append.mpr
  exact Or.inl ((mem_properPrefixes_iff _ _).mpr hsmall)

/-- Structural frontier selected for the final target-certificate event. -/
noncomputable def subdivisionTargetFrontier
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    PrefixTree.Frontier
      (subdivisionPreparedTree witness bits source bit)
      (a (source ++ [bit]) (witness bits (source ++ [bit]))) :=
  PrefixTree.frontierOfProperPrefixes
    (target_candidate_not_mem_subdivisionPreparedTree witness bits source bit)
    (target_candidate_proper_mem_subdivisionPreparedTree witness bits source bit)

/-- Exact local opening that performs the unique target-certificate event. -/
noncomputable def subdivisionTargetOpening
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    CanonicalOpening bits
      ((subdivisionTargetFrontier witness bits source bit).fieldContext
        (phaseAt 0))
      ((subdivisionTargetFrontier witness bits source bit).focusPhase
        (phaseAt 0)) :=
  canonicalOpeningOfGood bits
    ((subdivisionTargetFrontier witness bits source bit).fieldContext
      (phaseAt 0))
    ((subdivisionTargetFrontier witness bits source bit).focusPhase
      (phaseAt 0))
    ((subdivisionTargetFrontier witness bits source bit).focus_good
      (goodPhase_phaseAt 0))

/-- Generator concatenation is structural list insertion. -/
theorem treeOfGenerators_append (first second : List BitWord) :
    treeOfGenerators (first ++ second) =
      insertPaths first (treeOfGenerators second) := by
  induction first with
  | nil => rfl
  | cons endpoint rest ih =>
      simp [treeOfGenerators, insertPaths, ih]

/-- Inserting a finite block of noncandidate paths preserves projection. -/
theorem insertPaths_projection_stutter
    (verify : CertificateVerifier) (bits : BitWord)
    {contextPath : BitWord} (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoints : List BitWord) (tree : PrefixTree)
    (hfree : forall endpoint, List.Mem endpoint endpoints ->
      forall history payload,
        Not (WordPrefix (a history payload) (contextPath ++ endpoint))) :
    (projection verify
      (seededFieldTerm bits context
        (buildFrom phase (insertPaths endpoints tree)))).Equivalent
      (projection verify
        (seededFieldTerm bits context (buildFrom phase tree))) := by
  induction endpoints with
  | nil => exact HistoryIdeal.equivalent_refl _
  | cons endpoint rest ih =>
      have hrest := ih (fun found hfound =>
        hfree found (List.Mem.tail endpoint hfound))
      have hendpoint := insertPath_projection_stutter verify bits context
        phase hgood endpoint (insertPaths rest tree)
        (hfree endpoint (List.Mem.head rest))
      exact HistoryIdeal.equivalent_trans hendpoint hrest

/-- Explicit walk inserting a finite generator block. -/
noncomputable def insertPathsWalk (bits : BitWord) {contextPath : BitWord}
    (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoints : List BitWord) (tree : PrefixTree) :
    Walk Step
      (seededFieldTerm bits context (buildFrom phase tree))
      (seededFieldTerm bits context
        (buildFrom phase (insertPaths endpoints tree))) := by
  induction endpoints with
  | nil => exact .refl _
  | cons endpoint rest ih =>
      exact Walk.append ih
        (insertPathWalk bits context phase hgood endpoint
          (insertPaths rest tree))

/-- Every vertex of a finite noncandidate preparation block is a stutter. -/
theorem insertPathsWalk_every_projection_stutter
    (verify : CertificateVerifier) (bits : BitWord)
    {contextPath : BitWord} (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoints : List BitWord) (tree : PrefixTree)
    (hreach : Steps (encoder bits)
      (seededFieldTerm bits context (buildFrom phase tree)))
    (hfree : forall endpoint, List.Mem endpoint endpoints ->
      forall history payload,
        Not (WordPrefix (a history payload) (contextPath ++ endpoint))) :
    Walk.Every
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify
          (seededFieldTerm bits context (buildFrom phase tree))))
      (insertPathsWalk bits context phase hgood endpoints tree) := by
  apply Walk.every_projection_equivalent_on_encoder_cone verify bits _ hreach
  exact insertPaths_projection_stutter verify bits context phase hgood
    endpoints tree hfree

/-- All router/proper-prefix preparation before one source event. -/
noncomputable def subdivisionPreparationWalk
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk Step
      (subdivisionCheckpoint witness bits source)
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (subdivisionPreparedTree witness bits source bit))) := by
  have walk := insertPathsWalk bits ProtectedFieldContext.hole
    (phaseAt 0) (goodPhase_phaseAt 0)
    (subdivisionPreparation witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)
  simpa [subdivisionCheckpoint, subdivisionPreparedTree,
    subdivisionSourceTree, seededPrefixBuild, seededBuild, buildAt,
    treeOfPrefixSet, seededFieldTerm] using! walk

/-- The final canonical opening, with literal public checkpoint endpoints. -/
noncomputable def subdivisionEventWalk
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk Step
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (subdivisionPreparedTree witness bits source bit)))
      (subdivisionCheckpoint witness bits (source ++ [bit])) := by
  let selected := subdivisionTargetFrontier witness bits source bit
  let opening := subdivisionTargetOpening witness bits source bit
  have hsource : opening.source =
      seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (subdivisionPreparedTree witness bits source bit)) := by
    unfold opening subdivisionTargetOpening
    unfold CanonicalOpening.source seededFieldTerm
    exact congrArg (seededHeader bits)
      (selected.plug_focusGenerator (phaseAt 0))
  have htarget : opening.target =
      subdivisionCheckpoint witness bits (source ++ [bit]) := by
    unfold opening subdivisionTargetOpening
    unfold CanonicalOpening.target seededFieldTerm
    rw [selected.plug_focusOpened]
    unfold subdivisionCheckpoint seededPrefixBuild seededBuild buildAt
      treeOfPrefixSet subdivisionPreparedTree subdivisionSourceTree
      subdivisionPreparation subdivisionGeneratorBlock
    rw [subdivisionCheckpointGenerators_append_singleton,
      treeOfGenerators_append]
    rfl
  exact Walk.castEndpoints hsource htarget opening.walk

/-- Concrete literal path for every ordered history extension. -/
noncomputable def subdivisionEdgeWalkExact
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk Step
      (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ [bit])) :=
  Walk.append
    (subdivisionPreparationWalk witness bits source bit)
    (subdivisionEventWalk witness bits source bit)

/-- The first protected child opening with its public checkpoint endpoints. -/
noncomputable def subdivisionFirstWalk
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk Step
      (subdivisionCheckpoint witness bits source)
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source)))) :=
  Walk.castEndpoints
    (subdivisionFirstOpening_source witness bits source bit)
    (subdivisionFirstOpening_target witness bits source bit)
    (subdivisionFirstOpening witness bits source bit).walk

/-- Remaining noncertificate preparation after the first child opening. -/
noncomputable def subdivisionAfterFirstPreparationWalk
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk Step
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source))))
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (subdivisionPreparedTree witness bits source bit))) := by
  let preparation := subdivisionPreparation witness bits (source ++ [bit])
  let tree := subdivisionSourceTree witness bits source
  have walk := insertPathsWalk bits ProtectedFieldContext.hole
    (phaseAt 0) (goodPhase_phaseAt 0) preparation
    (insertPath (subdivisionBranchPath source bit) tree)
  have htarget : insertPaths preparation
        (insertPath (subdivisionBranchPath source bit) tree) =
      subdivisionPreparedTree witness bits source bit := by
    rw [subdivisionPreparation_absorbs_branch]
    rfl
  exact Walk.castEndpoints rfl (congrArg
    (fun t => seededFieldTerm bits ProtectedFieldContext.hole
      (buildFrom (phaseAt 0) t)) htarget) walk

/-- After the selected child is open, the complete target block stays there. -/
noncomputable def subdivisionAfterFirstWalk
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk Step
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source))))
      (subdivisionCheckpoint witness bits (source ++ [bit])) := by
  exact Walk.append
    (subdivisionAfterFirstPreparationWalk witness bits source bit)
    (subdivisionEventWalk witness bits source bit)

/--
The separated macroedge performs its first nontrivial work in the selected
router field.  This literal factorization is used for sibling geometry.
-/
noncomputable def subdivisionSeparatedEdgeWalk
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk Step
      (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ [bit])) :=
  Walk.append
    (subdivisionFirstWalk witness bits source bit)
    (subdivisionAfterFirstWalk witness bits source bit)

/-- A protected router child is never itself a complete certificate address. -/
theorem subdivisionBranchPath_ne_candidate
    (source : BitWord) (bit : Bool) (history payload : BitWord) :
    subdivisionBranchPath source bit ≠ a history payload := by
  intro heq
  apply a_not_prefix_router history payload (source ++ [bit])
  rw [← heq]
  exact subdivisionBranchPath_prefix_targetRouter source bit

/-- The local first opening is a complete projection stutter. -/
theorem subdivisionFirstWalk_every_projection_stutter
    (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.Every
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)))
      (subdivisionFirstWalk witness bits source bit) := by
  have hevery :=
    CanonicalOpening.every_projection_stutter_of_not_candidate
      (subdivisionFirstOpening witness bits source bit) verify
      (subdivisionBranchPath_ne_candidate source bit)
  apply Walk.Every.of_mem (subdivisionFirstWalk witness bits source bit)
  intro vertex hmem
  have hmem' : List.Mem vertex
      (subdivisionFirstOpening witness bits source bit).walk.vertices := by
    simpa [subdivisionFirstWalk] using hmem
  have hvalue := Walk.Every.holdsAt hevery hmem'
  rw [subdivisionFirstOpening_source witness bits source bit] at hvalue
  exact hvalue

/-- The selected field is literally open at the first-opening endpoint. -/
theorem subdivisionFirstWalk_target_selected_open
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    anchoredOpenedAt?
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source))))
      (subdivisionBranchPath source bit) = true := by
  apply (anchoredOpenedAt_seededTree_iff bits
    (subdivisionBranchPath source bit)
    (insertPath (subdivisionBranchPath source bit)
      (subdivisionSourceTree witness bits source))).mpr
  exact (mem_paths_insertPath_iff _ _ _).mpr
    (Or.inr (WordPrefix.refl _))

/-- The sibling field stays closed at the first-opening endpoint. -/
theorem subdivisionFirstWalk_target_opposite_closed
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    anchoredOpenedAt?
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source))))
      (subdivisionBranchPath source (!bit)) = false := by
  cases hopen : anchoredOpenedAt?
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source))))
      (subdivisionBranchPath source (!bit)) with
  | false => rfl
  | true =>
      have hmem := (anchoredOpenedAt_seededTree_iff bits
        (subdivisionBranchPath source (!bit))
        (insertPath (subdivisionBranchPath source bit)
          (subdivisionSourceTree witness bits source))).mp hopen
      rcases (mem_paths_insertPath_iff _ _ _).mp hmem with hold | hprefix
      · exact False.elim (subdivisionBranchPath_not_mem_sourceTree
          witness bits source (!bit) hold)
      · exact False.elim
          (wordPrefix_append_bits_incompatible (router source)
            (left := !bit) (right := bit)
            (by cases bit <;> decide) [] (by simpa [subdivisionBranchPath]
              using hprefix))

/-- Every vertex of the first local macro keeps the unused sibling closed. -/
theorem subdivisionFirstWalk_every_opposite_closed
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.Every
      (fun vertex => anchoredOpenedAt? vertex
        (subdivisionBranchPath source (!bit)) = false)
      (subdivisionFirstWalk witness bits source bit) := by
  have hreach : Steps (encoder bits)
      (subdivisionCheckpoint witness bits source) :=
    encoder_steps_seededPrefixBuild bits
      ⟨subdivisionCheckpointGenerators witness bits source⟩
  exact Walk.every_anchoredOpenedAt_false_of_target_on_encoder_cone
    bits (subdivisionBranchPath source (!bit))
    (subdivisionFirstWalk witness bits source bit) hreach
    (subdivisionFirstWalk_target_opposite_closed witness bits source bit)

/-- Every vertex after the first opening retains the selected open field. -/
theorem subdivisionAfterFirstWalk_every_selected_open
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.Every
      (fun vertex => anchoredOpenedAt? vertex
        (subdivisionBranchPath source bit) = true)
      (subdivisionAfterFirstWalk witness bits source bit) := by
  have hcheckpointReach : Steps (encoder bits)
      (subdivisionCheckpoint witness bits source) :=
    encoder_steps_seededPrefixBuild bits
      ⟨subdivisionCheckpointGenerators witness bits source⟩
  have hreach : Steps (encoder bits)
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source)))) :=
    Steps.trans hcheckpointReach
      (subdivisionFirstWalk witness bits source bit).toSteps
  exact Walk.every_anchoredOpenedAt_of_source_on_encoder_cone
    bits (subdivisionBranchPath source bit)
    (subdivisionAfterFirstWalk witness bits source bit) hreach
    (subdivisionFirstWalk_target_selected_open witness bits source bit)

/-- Every vertex after the first opening keeps the unused sibling closed. -/
theorem subdivisionAfterFirstWalk_every_opposite_closed
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.Every
      (fun vertex => anchoredOpenedAt? vertex
        (subdivisionBranchPath source (!bit)) = false)
      (subdivisionAfterFirstWalk witness bits source bit) := by
  have hcheckpointReach : Steps (encoder bits)
      (subdivisionCheckpoint witness bits source) :=
    encoder_steps_seededPrefixBuild bits
      ⟨subdivisionCheckpointGenerators witness bits source⟩
  have hreach : Steps (encoder bits)
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source)))) :=
    Steps.trans hcheckpointReach
      (subdivisionFirstWalk witness bits source bit).toSteps
  exact Walk.every_anchoredOpenedAt_false_of_target_on_encoder_cone
    bits (subdivisionBranchPath source (!bit))
    (subdivisionAfterFirstWalk witness bits source bit) hreach
    (subdivisionCheckpoint_oppositeBranch_closed witness bits source bit)

/-- Proper first-opening stages have not yet exposed the selected field. -/
theorem subdivisionFirstWalk_interior_selected_closed
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (vertex : Term)
    (hvertex : (subdivisionFirstWalk witness bits source bit).Interior vertex) :
    anchoredOpenedAt? vertex (subdivisionBranchPath source bit) = false := by
  let opening := subdivisionFirstOpening witness bits source bit
  have hlocal : opening.walk.Interior vertex := by
    refine ⟨?_, ?_, ?_⟩
    · simpa [subdivisionFirstWalk, opening] using hvertex.1
    · intro heq
      apply hvertex.2.1
      rw [← subdivisionFirstOpening_source witness bits source bit]
      exact heq
    · intro heq
      apply hvertex.2.2
      rw [← subdivisionFirstOpening_target witness bits source bit]
      exact heq
  exact CanonicalOpening.interior_designated_closed opening vertex hlocal

/-- All remaining proper-prefix work after the first opening is a stutter. -/
theorem subdivisionAfterFirstPreparationWalk_every_projection_stutter
    (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.Every
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)))
      (subdivisionAfterFirstPreparationWalk witness bits source bit) := by
  have hsourceReach : Steps (encoder bits)
      (subdivisionCheckpoint witness bits source) := by
    exact encoder_steps_seededPrefixBuild bits
      ⟨subdivisionCheckpointGenerators witness bits source⟩
  have hreach : Steps (encoder bits)
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (insertPath (subdivisionBranchPath source bit)
            (subdivisionSourceTree witness bits source)))) := by
    exact Steps.trans hsourceReach
      (subdivisionFirstWalk witness bits source bit).toSteps
  have hend :
      (projection verify
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)))).Equivalent
        (projection verify
          (seededFieldTerm bits ProtectedFieldContext.hole
            (buildFrom (phaseAt 0)
              (insertPath (subdivisionBranchPath source bit)
                (subdivisionSourceTree witness bits source))))) := by
    have hstutter := insertPaths_projection_stutter verify bits
      ProtectedFieldContext.hole (phaseAt 0) (goodPhase_phaseAt 0)
      (subdivisionPreparation witness bits (source ++ [bit]))
      (insertPath (subdivisionBranchPath source bit)
        (subdivisionSourceTree witness bits source))
      (fun endpoint hendpoint history payload => by
        simpa [subdivisionPreparation] using
          subdivisionBlock_tail_candidate_free witness bits
            (source ++ [bit]) endpoint hendpoint history payload)
    simpa [subdivisionPreparedTree,
      subdivisionPreparation_absorbs_branch] using hstutter
  have hevery := Walk.every_projection_equivalent_on_encoder_cone
    verify bits
    (subdivisionAfterFirstPreparationWalk witness bits source bit)
    hreach hend
  have hfirstTarget := Walk.Every.holdsAt
    (subdivisionFirstWalk_every_projection_stutter
      verify witness bits source bit)
    (Walk.target_mem_vertices
      (subdivisionFirstWalk witness bits source bit))
  exact Walk.Every.imp hevery (fun _ hvertex =>
    HistoryIdeal.equivalent_trans hvertex hfirstTarget)

/-- Every vertex of the pre-event preparation retains the source projection. -/
theorem subdivisionPreparationWalk_every_projection_stutter
    (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.Every
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)))
      (subdivisionPreparationWalk witness bits source bit) := by
  have hreach : Steps (encoder bits)
      (seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (subdivisionSourceTree witness bits source))) := by
    simpa [subdivisionCheckpoint, subdivisionSourceTree, seededPrefixBuild,
      seededBuild, buildAt, treeOfPrefixSet, seededFieldTerm] using!
      (encoder_steps_seededPrefixBuild bits
        ⟨subdivisionCheckpointGenerators witness bits source⟩)
  have hevery := insertPathsWalk_every_projection_stutter verify bits
    ProtectedFieldContext.hole (phaseAt 0) (goodPhase_phaseAt 0)
    (subdivisionPreparation witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source) hreach
    (fun endpoint hendpoint history payload => by
      simpa using subdivisionBlock_tail_candidate_free witness bits
        (source ++ [bit]) endpoint hendpoint history payload)
  simpa [subdivisionPreparationWalk, subdivisionCheckpoint,
    subdivisionSourceTree, subdivisionPreparedTree, seededPrefixBuild,
    seededBuild, buildAt, treeOfPrefixSet, seededFieldTerm] using! hevery

/-- Every vertex before the final certificate opening remains a source stutter. -/
theorem subdivisionEventWalk_before_target_projection_stutter
    (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.BeforeTarget
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify
          (seededFieldTerm bits ProtectedFieldContext.hole
            (buildFrom (phaseAt 0)
              (subdivisionPreparedTree witness bits source bit)))))
      (subdivisionEventWalk witness bits source bit) := by
  let opening := subdivisionTargetOpening witness bits source bit
  have hsource : opening.source =
      seededFieldTerm bits ProtectedFieldContext.hole
        (buildFrom (phaseAt 0)
          (subdivisionPreparedTree witness bits source bit)) := by
    unfold opening subdivisionTargetOpening
    unfold CanonicalOpening.source seededFieldTerm
    exact congrArg (seededHeader bits)
      ((subdivisionTargetFrontier witness bits source bit).plug_focusGenerator
        (phaseAt 0))
  have htarget : opening.target =
      subdivisionCheckpoint witness bits (source ++ [bit]) := by
    unfold opening subdivisionTargetOpening
    unfold CanonicalOpening.target seededFieldTerm
    rw [(subdivisionTargetFrontier witness bits source bit).plug_focusOpened]
    unfold subdivisionCheckpoint seededPrefixBuild seededBuild buildAt
      treeOfPrefixSet subdivisionPreparedTree subdivisionSourceTree
      subdivisionPreparation subdivisionGeneratorBlock
    rw [subdivisionCheckpointGenerators_append_singleton,
      treeOfGenerators_append]
    rfl
  have hbefore := opening.before_target_projection_stutter verify
  intro vertex hmem hne
  have hvertices :
      (subdivisionEventWalk witness bits source bit).vertices =
        opening.walk.vertices := by
    unfold subdivisionEventWalk
    simp only [Walk.vertices_castEndpoints]
    rfl
  have hmem' : List.Mem vertex opening.walk.vertices := by
    rw [← hvertices]
    exact hmem
  have hne' : vertex ≠ opening.target := by
    intro heq
    apply hne
    rw [← htarget]
    exact heq
  have hvalue := hbefore vertex hmem' hne'
  rw [hsource] at hvalue
  exact hvalue

/-- Every proper vertex of the full macroedge has the source checkpoint ideal. -/
theorem subdivisionEdgeWalkExact_interior_projection
    (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (vertex : Term)
    (hvertex : (subdivisionEdgeWalkExact witness bits source bit).Interior
      vertex) :
    (projection verify vertex).Equivalent
      (projection verify (subdivisionCheckpoint witness bits source)) := by
  have hprep := subdivisionPreparationWalk_every_projection_stutter
    verify witness bits source bit
  have hprepEndpoint :
      (projection verify
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)))).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)) := by
    apply hprep.holdsAt
    exact Walk.target_mem_vertices
      (subdivisionPreparationWalk witness bits source bit)
  have hevent0 := subdivisionEventWalk_before_target_projection_stutter
    verify witness bits source bit
  have hevent : Walk.BeforeTarget
      (fun term => (projection verify term).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)))
      (subdivisionEventWalk witness bits source bit) := by
    intro term hmem hne
    exact HistoryIdeal.equivalent_trans (hevent0 term hmem hne) hprepEndpoint
  have hbefore := Walk.BeforeTarget.append hprep hevent
  exact hbefore vertex hvertex.1 hvertex.2.2

/-- Every proper vertex of the separated edge has the source branch ideal. -/
theorem subdivisionSeparatedEdgeWalk_interior_projection
    (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (vertex : Term)
    (hvertex : (subdivisionSeparatedEdgeWalk witness bits source bit).Interior
      vertex) :
    (projection verify vertex).Equivalent
      (projection verify (subdivisionCheckpoint witness bits source)) := by
  have hfirst := subdivisionFirstWalk_every_projection_stutter
    verify witness bits source bit
  have hrestPrep :=
    subdivisionAfterFirstPreparationWalk_every_projection_stutter
      verify witness bits source bit
  have hevent0 := subdivisionEventWalk_before_target_projection_stutter
    verify witness bits source bit
  have hprepared :
      (projection verify
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)))).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)) := by
    have hvalue := Walk.Every.holdsAt hrestPrep
      (Walk.target_mem_vertices
        (subdivisionAfterFirstPreparationWalk witness bits source bit))
    exact hvalue
  have hevent : Walk.BeforeTarget
      (fun term => (projection verify term).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)))
      (subdivisionEventWalk witness bits source bit) := by
    intro term hmem hne
    exact HistoryIdeal.equivalent_trans (hevent0 term hmem hne) hprepared
  have hrest : Walk.BeforeTarget
      (fun term => (projection verify term).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)))
      (subdivisionAfterFirstWalk witness bits source bit) := by
    exact Walk.BeforeTarget.append hrestPrep hevent
  have hbefore : Walk.BeforeTarget
      (fun term => (projection verify term).Equivalent
        (projection verify (subdivisionCheckpoint witness bits source)))
      (subdivisionSeparatedEdgeWalk witness bits source bit) := by
    exact Walk.BeforeTarget.append hfirst hrest
  exact hbefore vertex hvertex.1 hvertex.2.2

/--
The validity-indexed subdivision edge uses the exact target block: it first
opens the target router and every strict certificate prefix, then opens the
target certificate on the final local macro.
-/
noncomputable def subdivisionEdgeWalk
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) (bit : Bool) :
    Walk Step
      (subdivisionCheckpoint witness bits history)
      (subdivisionCheckpoint witness bits (history ++ [bit])) := by
  let block := subdivisionGeneratorBlock witness bits (history ++ [bit])
  let tree := treeOfGenerators
    (subdivisionCheckpointGenerators witness bits history)
  have walk := insertPathsWalk bits ProtectedFieldContext.hole
    (phaseAt 0) (goodPhase_phaseAt 0) block tree
  simpa [subdivisionCheckpoint, seededPrefixBuild, seededBuild, buildAt,
    treeOfPrefixSet, block, tree,
    subdivisionCheckpointGenerators_append_singleton,
    treeOfGenerators_append, seededFieldTerm] using! walk

/--
Concrete edge walk: prepare the target's enabled child paths first, then open
the target certificate.  The generator recurrence makes both endpoints the
public executable branch checkpoints definitionally.
-/
noncomputable def branchEdgeWalk
    (enabled : BitWord -> Bool -> Bool)
    (witness : BitWord -> BitWord -> BitWord)
    (bits history : BitWord) (bit : Bool) :
    Walk Step
      (branchCheckpoint enabled witness bits history)
      (branchCheckpoint enabled witness bits (history ++ [bit])) := by
  let block := branchGeneratorBlock enabled witness bits (history ++ [bit])
  let tree := treeOfGenerators
    (branchCheckpointGenerators enabled witness bits history)
  have walk := insertPathsWalk bits ProtectedFieldContext.hole
    (phaseAt 0) (goodPhase_phaseAt 0) block tree
  simpa [branchCheckpoint, seededPrefixBuild, seededBuild, buildAt,
    treeOfPrefixSet, block, tree,
    branchCheckpointGenerators_append_singleton,
    treeOfGenerators_append, seededFieldTerm] using! walk

/-! ## Concrete separation of sibling opening interiors -/

/-- Equality below the same frozen seed cancels the public header. -/
theorem seededFieldTerm_body_injective (bits : BitWord)
    {leftPath rightPath : BitWord}
    (leftContext : ProtectedFieldContext leftPath)
    (rightContext : ProtectedFieldContext rightPath)
    {leftTerm rightTerm : Term}
    (heq : seededFieldTerm bits leftContext leftTerm =
      seededFieldTerm bits rightContext rightTerm) :
    leftContext.plug leftTerm = rightContext.plug rightTerm := by
  simpa [seededFieldTerm, seededHeader, header, passive] using heq

/-- Every noninitial positive macro stage is structurally distinct. -/
theorem positiveProper_ne_source_constructive
    (m n : Nat) (stage : PositiveProperStage)
    (hstage : stage ≠ .zero) :
    positiveProperTerm m n stage ≠ positive0 m n := by
  cases stage with
  | zero => exact False.elim (hstage rfl)
  | one => simp [positiveProperTerm, positive0, positive1, D, C, b]
  | two =>
      simp [positiveProperTerm, positive0, positive2, D, C, b,
        openingChild]
  | three =>
      simp [positiveProperTerm, positive0, positive3, D, C, b,
        openingChild]
  | four =>
      simp [positiveProperTerm, positive0, positive4, D, C, b,
        openingChild]
  | five =>
      simp [positiveProperTerm, positive0, positive5, D, C, b,
        openingChild]

/-- Every non-source proper reset stage differs from its generator. -/
theorem zeroProper_ne_source (n : Nat) (stage : ZeroProperStage)
    (hstage : stage ≠ .source) :
    zeroProperTerm n stage ≠ D 0 (n + 2) := by
  cases stage with
  | source => exact False.elim (hstage rfl)
  | positive proper =>
      cases proper with
      | zero =>
          simp [zeroProperTerm, positiveProperTerm, positive0, D, C, b]
      | one =>
          simp [zeroProperTerm, positiveProperTerm, positive1, D, C, b]
      | two =>
          simp [zeroProperTerm, positiveProperTerm, positive2, D, C, b,
            openingChild]
      | three =>
          simp [zeroProperTerm, positiveProperTerm, positive3, D, C, b,
            openingChild]
      | four =>
          simp [zeroProperTerm, positiveProperTerm, positive4, D, C, b,
            openingChild]
      | five =>
          simp [zeroProperTerm, positiveProperTerm, positive5, D, C, b,
            openingChild]

/-- The two positive child-opening walks have disjoint interiors. -/
theorem positive_sibling_walks_disjoint (bits : BitWord)
    {path : BitWord} (parent : ProtectedFieldContext path)
    (m n : Nat) (junk : Term) :
    Walk.InternallyDisjoint
      (positiveWalk bits
        (parent.extendLeft (positive0 m n) junk) m n)
      (positiveWalk bits
        (parent.extendRight (positive0 m n) junk) m n) := by
  intro vertex hleft hright
  obtain ⟨leftStage, hleftStage, hleftTerm⟩ :=
    CanonicalOpening.positive_interior_cases bits
      (parent.extendLeft (positive0 m n) junk) m n vertex hleft
  obtain ⟨rightStage, hrightStage, hrightTerm⟩ :=
    CanonicalOpening.positive_interior_cases bits
      (parent.extendRight (positive0 m n) junk) m n vertex hright
  have hseeded :
      seededFieldTerm bits
          (parent.extendLeft (positive0 m n) junk)
          (positiveProperTerm m n leftStage) =
        seededFieldTerm bits
          (parent.extendRight (positive0 m n) junk)
          (positiveProperTerm m n rightStage) := by
    rw [← hleftTerm, ← hrightTerm]
  have hbody := seededFieldTerm_body_injective bits
    (parent.extendLeft (positive0 m n) junk)
    (parent.extendRight (positive0 m n) junk) hseeded
  exact ProtectedTrieSubdivisionMeasure.ProtectedFieldContext.left_right_interior_ne parent
    (positive0 m n)
    (positiveProperTerm m n leftStage)
    (positiveProperTerm m n rightStage) junk
    (positiveProper_ne_source_constructive m n leftStage hleftStage) hbody

/-- The two reset child-opening walks have disjoint interiors. -/
theorem zero_sibling_walks_disjoint (bits : BitWord)
    {path : BitWord} (parent : ProtectedFieldContext path)
    (n : Nat) (junk : Term) :
    Walk.InternallyDisjoint
      (zeroWalk bits (parent.extendLeft (D 0 (n + 2)) junk) n)
      (zeroWalk bits (parent.extendRight (D 0 (n + 2)) junk) n) := by
  intro vertex hleft hright
  obtain ⟨leftStage, hleftStage, hleftTerm⟩ :=
    CanonicalOpening.zero_interior_cases bits
      (parent.extendLeft (D 0 (n + 2)) junk) n vertex hleft
  obtain ⟨rightStage, hrightStage, hrightTerm⟩ :=
    CanonicalOpening.zero_interior_cases bits
      (parent.extendRight (D 0 (n + 2)) junk) n vertex hright
  have hseeded :
      seededFieldTerm bits
          (parent.extendLeft (D 0 (n + 2)) junk)
          (zeroProperTerm n leftStage) =
        seededFieldTerm bits
          (parent.extendRight (D 0 (n + 2)) junk)
          (zeroProperTerm n rightStage) := by
    rw [← hleftTerm, ← hrightTerm]
  have hbody := seededFieldTerm_body_injective bits
    (parent.extendLeft (D 0 (n + 2)) junk)
    (parent.extendRight (D 0 (n + 2)) junk) hseeded
  exact ProtectedTrieSubdivisionMeasure.ProtectedFieldContext.left_right_interior_ne parent
    (D 0 (n + 2))
    (zeroProperTerm n leftStage)
    (zeroProperTerm n rightStage) junk
    (zeroProper_ne_source n leftStage hleftStage) hbody

/-- Proof-directed phase classification preserves literal sibling separation. -/
theorem canonicalOpeningOfGood_sibling_disjoint (bits : BitWord)
    {path : BitWord} (parent : ProtectedFieldContext path)
    (phase : Nat × Nat) (hgood : GoodPhase phase) (junk : Term) :
    Walk.InternallyDisjoint
      (canonicalOpeningOfGood bits
        (parent.extendLeft (phaseGenerator phase) junk) phase hgood).walk
      (canonicalOpeningOfGood bits
        (parent.extendRight (phaseGenerator phase) junk) phase hgood).walk := by
  rcases phase with ⟨m, n⟩
  rcases hgood with ⟨hn, hm⟩
  cases n with
  | zero => exact False.elim ((by decide : Not (2 ≤ 0)) hn)
  | succ n =>
      cases n with
      | zero => exact False.elim ((by decide : Not (2 ≤ 1)) hn)
      | succ n =>
          cases m with
          | zero =>
              simpa [canonicalOpeningOfGood, CanonicalOpening.walk,
                CanonicalOpening.source, CanonicalOpening.target,
                phaseGenerator, phaseOpened, nextPhase, phaseJunk,
                positive0, opened, openingChild, Nat.add_assoc] using!
                zero_sibling_walks_disjoint bits parent n junk
          | succ m =>
              simpa [canonicalOpeningOfGood, CanonicalOpening.walk,
                CanonicalOpening.source, CanonicalOpening.target,
                phaseGenerator, phaseOpened, nextPhase, phaseJunk,
                positive0, opened, openingChild] using!
                positive_sibling_walks_disjoint bits parent m n junk

/-- The first literal macros of the two outgoing source edges are disjoint. -/
theorem subdivisionFirstWalks_disjoint
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) :
    Walk.InternallyDisjoint
      (subdivisionFirstWalk witness bits source false)
      (subdivisionFirstWalk witness bits source true) := by
  let leaf := subdivisionRouterLeaf witness bits source
  let parent := leaf.fieldContext (phaseAt 0)
  let phase := nextPhase (leaf.focusPhase (phaseAt 0))
  let junk := phaseJunk (leaf.focusPhase (phaseAt 0))
  let hgood : GoodPhase phase :=
    (leaf.focus_good (goodPhase_phaseAt 0)).next
  have hbase : Walk.InternallyDisjoint
      (subdivisionFirstOpening witness bits source false).walk
      (subdivisionFirstOpening witness bits source true).walk := by
    simpa [subdivisionFirstOpening, PrefixTree.BinaryLeafAt.childContext,
      leaf, parent, phase, junk, hgood] using
      canonicalOpeningOfGood_sibling_disjoint bits parent phase hgood junk
  intro vertex hleft hright
  apply hbase vertex
  · refine ⟨?_, ?_, ?_⟩
    · simpa [subdivisionFirstWalk] using hleft.1
    · intro heq
      apply hleft.2.1
      rw [← subdivisionFirstOpening_source witness bits source false]
      exact heq
    · intro heq
      apply hleft.2.2
      rw [← subdivisionFirstOpening_target witness bits source false]
      exact heq
  · refine ⟨?_, ?_, ?_⟩
    · simpa [subdivisionFirstWalk] using hright.1
    · intro heq
      apply hright.2.1
      rw [← subdivisionFirstOpening_source witness bits source true]
      exact heq
    · intro heq
      apply hright.2.2
      rw [← subdivisionFirstOpening_target witness bits source true]
      exact heq

/-- The complete separated false/true source-edge macros have disjoint interiors. -/
theorem subdivisionSeparatedSiblingWalks_disjoint
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) :
    Walk.InternallyDisjoint
      (subdivisionSeparatedEdgeWalk witness bits source false)
      (subdivisionSeparatedEdgeWalk witness bits source true) := by
  intro vertex hfalse htrue
  have hfalseCases := Walk.interior_append_cases
    (subdivisionFirstWalk witness bits source false)
    (subdivisionAfterFirstWalk witness bits source false)
    (by simpa [subdivisionSeparatedEdgeWalk] using hfalse)
  have htrueCases := Walk.interior_append_cases
    (subdivisionFirstWalk witness bits source true)
    (subdivisionAfterFirstWalk witness bits source true)
    (by simpa [subdivisionSeparatedEdgeWalk] using htrue)
  rcases hfalseCases with hfalseFirst | hfalseRest
  · rcases htrueCases with htrueFirst | htrueRest
    · exact subdivisionFirstWalks_disjoint witness bits source vertex
        hfalseFirst htrueFirst
    · have hclosed := Walk.Every.holdsAt
          (subdivisionFirstWalk_every_opposite_closed
            witness bits source false) hfalseFirst.1
      have hopen := Walk.Every.holdsAt
          (subdivisionAfterFirstWalk_every_selected_open
            witness bits source true) htrueRest
      have hclosed' : anchoredOpenedAt? vertex
          (subdivisionBranchPath source true) = false := by
        simpa using hclosed
      rw [hclosed'] at hopen
      cases hopen
  · rcases htrueCases with htrueFirst | htrueRest
    · have hopen := Walk.Every.holdsAt
          (subdivisionAfterFirstWalk_every_selected_open
            witness bits source false) hfalseRest
      have hclosed := Walk.Every.holdsAt
          (subdivisionFirstWalk_every_opposite_closed
            witness bits source true) htrueFirst.1
      have hclosed' : anchoredOpenedAt? vertex
          (subdivisionBranchPath source false) = false := by
        simpa using hclosed
      rw [hclosed'] at hopen
      cases hopen
    · have hopen := Walk.Every.holdsAt
          (subdivisionAfterFirstWalk_every_selected_open
            witness bits source false) hfalseRest
      have hclosed := Walk.Every.holdsAt
          (subdivisionAfterFirstWalk_every_opposite_closed
            witness bits source true) htrueRest
      have hclosed' : anchoredOpenedAt? vertex
          (subdivisionBranchPath source false) = false := by
        simpa using hclosed
      rw [hclosed'] at hopen
      cases hopen

/-! ## Concrete validity-indexed directed subdivision -/

/--
The executable checkpoints and explicit kernel-checked source-edge walks,
restricted to genuine valid source histories and enabled valid one-bit
extensions. The dependent `Walk` witnesses are proof-level objects.
-/
noncomputable def protectedTrieHistoryEdgePathFamily
    (verify : CertificateVerifier)
    (Valid : BitWord -> BitWord -> Prop)
    (witness : BitWord -> BitWord -> BitWord)
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits : BitWord) :
    HistoryEdgePathFamily (Valid bits) Step (projection verify) where
  checkpoint history _ := subdivisionCheckpoint witness bits history
  checkpointProjection history hvalid :=
    projection_subdivisionCheckpoint_equivalent
      hprefixClosed hcomplete bits history hvalid
  edgeWalk edge :=
    subdivisionSeparatedEdgeWalk witness bits edge.source edge.bit
  interiorProjection edge vertex hvertex :=
    HistoryIdeal.equivalent_trans
      (subdivisionSeparatedEdgeWalk_interior_projection
        verify witness bits edge.source edge.bit vertex hvertex)
      (projection_subdivisionCheckpoint_equivalent
        hprefixClosed hcomplete bits edge.source edge.sourceValid)
  siblingInteriors history hsource hfalse htrue :=
    subdivisionSeparatedSiblingWalks_disjoint witness bits history

/--
Full concrete incidence theorem: checkpoint injection, pairwise-disjoint edge
interiors, and exclusion of every proper edge vertex from every checkpoint.
-/
theorem protectedTrie_directed_subdivision
    (verify : CertificateVerifier)
    (Valid : BitWord -> BitWord -> Prop)
    (witness : BitWord -> BitWord -> BitWord)
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits : BitWord) :
    (forall {left right} (hleft : Valid bits left) (hright : Valid bits right),
      subdivisionCheckpoint witness bits left =
          subdivisionCheckpoint witness bits right ->
        left = right) /\
    (forall (left right : HistoryEdge (Valid bits)), left ≠ right ->
      Walk.InternallyDisjoint
        (subdivisionSeparatedEdgeWalk witness bits left.source left.bit)
        (subdivisionSeparatedEdgeWalk witness bits right.source right.bit)) /\
    (forall (edge : HistoryEdge (Valid bits)) (vertex : Term),
      (subdivisionSeparatedEdgeWalk witness bits edge.source edge.bit).Interior
        vertex ->
      forall history (hvalid : Valid bits history),
        vertex ≠ subdivisionCheckpoint witness bits history) := by
  simpa [protectedTrieHistoryEdgePathFamily] using!
    HistoryEdgePathFamily.directed_subdivision_gate
      (protectedTrieHistoryEdgePathFamily verify Valid witness
        hprefixClosed hcomplete bits)

/-- A finite ordered source branch whose every successive history is valid. -/
inductive ValidBranchFrom (Valid : BitWord -> Prop) :
    BitWord -> BitWord -> Type where
  | nil {source : BitWord} : ValidBranchFrom Valid source []
  | cons {source rest : BitWord} {bit : Bool}
      (targetValid : Valid (source ++ [bit]))
      (tail : ValidBranchFrom Valid (source ++ [bit]) rest) :
      ValidBranchFrom Valid source (bit :: rest)

/-- Every finite valid source branch concatenates to one literal target walk. -/
noncomputable def protectedTrieFiniteBranchWalk
    (Valid : BitWord -> Prop)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source branch : BitWord) (hsource : Valid source)
    (hbranch : ValidBranchFrom Valid source branch) :
    Walk Step (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ branch)) := by
  cases hbranch with
  | nil =>
      have walk : Walk Step
          (subdivisionCheckpoint witness bits source)
          (subdivisionCheckpoint witness bits source) :=
        Walk.refl (subdivisionCheckpoint witness bits source)
      simpa only [List.append_nil] using walk
  | @cons source rest bit htarget htail =>
      have first := subdivisionSeparatedEdgeWalk witness bits source bit
      have tailWalk := protectedTrieFiniteBranchWalk Valid witness bits
        (source ++ [bit]) rest htarget htail
      have combined := Walk.append first tailWalk
      exact Walk.castEndpoints rfl
        (congrArg (subdivisionCheckpoint witness bits)
          (by simpa using List.append_assoc source [bit] rest)) combined

/--
The two literal child-opening macros available at one protected binary node.
Their sources are the same term, while their proper vertices are disjoint.
This is the local geometric datum required by
`HistoryEdgePathFamily.siblingInteriors`.
-/
structure SiblingOpeningPair (bits : BitWord) {path : BitWord}
    (parent : ProtectedFieldContext path) (phase : Nat × Nat)
    (junk : Term) where
  left : CanonicalOpening bits
    (parent.extendLeft (phaseGenerator phase) junk) phase
  right : CanonicalOpening bits
    (parent.extendRight (phaseGenerator phase) junk) phase
  sameSource : left.source = right.source
  interiorsDisjoint : Walk.InternallyDisjoint left.walk right.walk

/-- Every good phase supplies the exact disjoint sibling opening pair. -/
theorem exists_siblingOpeningPair_of_good (bits : BitWord)
    {path : BitWord} (parent : ProtectedFieldContext path)
    (phase : Nat × Nat) (hgood : GoodPhase phase) (junk : Term) :
    exists pair : SiblingOpeningPair bits parent phase junk, True := by
  rcases phase with ⟨m, n⟩
  rcases hgood with ⟨hn, hm⟩
  cases n with
  | zero =>
      exact False.elim ((by decide : Not (2 ≤ 0)) hn)
  | succ n =>
      cases n with
      | zero =>
          exact False.elim ((by decide : Not (2 ≤ 1)) hn)
      | succ n =>
          cases m with
          | zero =>
              let left : CanonicalOpening bits
                  (parent.extendLeft (D 0 (n + 2)) junk) (0, n + 2) :=
                .zero n rfl
              let right : CanonicalOpening bits
                  (parent.extendRight (D 0 (n + 2)) junk) (0, n + 2) :=
                .zero n rfl
              refine ⟨⟨left, right, ?_, ?_⟩, trivial⟩
              · simp [left, right, CanonicalOpening.source,
                  seededFieldTerm, phaseGenerator]
              · simpa [left, right, CanonicalOpening.walk,
                  CanonicalOpening.source, CanonicalOpening.target,
                  phaseGenerator, phaseOpened, nextPhase, phaseJunk,
                  positive0, opened, openingChild, Nat.add_assoc] using!
                  zero_sibling_walks_disjoint bits parent n junk
          | succ m =>
              let left : CanonicalOpening bits
                  (parent.extendLeft (D (m + 1) (n + 2)) junk)
                  (m + 1, n + 2) := .positive m n rfl
              let right : CanonicalOpening bits
                  (parent.extendRight (D (m + 1) (n + 2)) junk)
                  (m + 1, n + 2) := .positive m n rfl
              refine ⟨⟨left, right, ?_, ?_⟩, trivial⟩
              · simp [left, right, CanonicalOpening.source,
                  seededFieldTerm, phaseGenerator, positive0]
              · simpa [left, right, CanonicalOpening.walk,
                  CanonicalOpening.source, CanonicalOpening.target,
                  phaseGenerator, phaseOpened, nextPhase, phaseJunk,
                  positive0, opened, openingChild] using!
                  positive_sibling_walks_disjoint bits parent m n junk

end PureSFormal.Research.ProtectedTrieSubdivision
