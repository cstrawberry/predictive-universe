import PureSFormal.Research.ProtectedTrieSubdivision

/-!
# Simple directed paths for the protected-trie subdivision

The concrete subdivision construction already supplies a finite directed
`Walk` for every ordered source edge.  This module constructively erases any
loops from an arbitrary finite walk.  The result retains the literal endpoints
and carries a `Nodup` certificate for its complete vertex list.

No choice principle is used: when a newly appended target already occurs in
the simplified prefix, structural recursion extracts the unique prefix ending
at that occurrence; otherwise the target is appended with the proved
freshness condition.
-/

namespace PureSFormal.Research.ProtectedTrieSubdivision

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieProjection

namespace Walk

/-- A finite directed walk whose complete literal vertex list has no repeats. -/
structure SimplePath {Vertex : Type} (Edge : Vertex -> Vertex -> Prop)
    (source target : Vertex) : Type where
  walk : Walk Edge source target
  verticesNodup : walk.vertices.Nodup

namespace SimplePath

/-- Removing the final singleton from a no-duplicate list preserves
no-duplication. -/
theorem nodup_of_append_singleton {Vertex : Type} {vertices : List Vertex}
    {target : Vertex} (hnodup : (vertices ++ [target]).Nodup) :
    vertices.Nodup := by
  induction vertices with
  | nil => exact .nil
  | cons vertex rest ih =>
      simp only [List.cons_append] at hnodup ⊢
      rw [List.nodup_cons] at hnodup ⊢
      constructor
      · intro hmem
        apply hnodup.1
        exact List.mem_append.mpr (Or.inl hmem)
      · apply ih
        exact hnodup.2

/-- Appending a vertex absent from a no-duplicate list preserves
no-duplication. -/
theorem nodup_append_singleton {Vertex : Type} {vertices : List Vertex}
    {target : Vertex} (hnodup : vertices.Nodup)
    (hfresh : Not (List.Mem target vertices)) :
    (vertices ++ [target]).Nodup := by
  induction vertices with
  | nil => simp
  | cons vertex rest ih =>
      simp only [List.cons_append] at hnodup ⊢
      rw [List.nodup_cons] at hnodup ⊢
      constructor
      · intro hmem
        rcases List.mem_append.mp hmem with hrest | htarget
        · exact hnodup.1 hrest
        · have heq : vertex = target := by simpa using htarget
          apply hfresh
          subst target
          exact List.Mem.head rest
      · apply ih hnodup.2
        intro hmem
        apply hfresh
        exact List.Mem.tail vertex hmem

/-- The one-vertex reflexive simple path. -/
def refl {Vertex : Type} {Edge : Vertex -> Vertex -> Prop} (vertex : Vertex) :
    SimplePath Edge vertex vertex :=
  ⟨Walk.refl vertex, by simp [Walk.vertices]⟩

/-- Append a genuinely fresh target vertex to a simple directed path. -/
def tail {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source middle target : Vertex}
    (initial : SimplePath Edge source middle) (last : Edge middle target)
    (hfresh : Not (List.Mem target initial.walk.vertices)) :
    SimplePath Edge source target :=
  ⟨Walk.tail initial.walk last, by
    rw [Walk.vertices]
    exact nodup_append_singleton initial.verticesNodup hfresh⟩

/--
An extracted simple prefix, together with the fact that all of its vertices
occurred on the original walk.
-/
structure PrefixOf {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target : Vertex} (walk : Walk Edge source target)
    (vertex : Vertex) : Type where
  path : SimplePath Edge source vertex
  vertices_subset : forall current,
    List.Mem current path.walk.vertices -> List.Mem current walk.vertices

/-- Extract the simple prefix ending at a vertex already present on a simple
path, preserving a literal vertex-subset certificate. -/
noncomputable def prefixOf {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} {source target : Vertex}
    (walk : Walk Edge source target) (hnodup : walk.vertices.Nodup)
    (vertex : Vertex) (hmem : List.Mem vertex walk.vertices) :
    PrefixOf walk vertex := by
  induction walk generalizing vertex with
  | refl =>
      have heq : vertex = source := by
        simp only [Walk.vertices] at hmem
        cases hmem with
        | head => rfl
        | tail _ htail => cases htail
      subst vertex
      exact ⟨SimplePath.refl source, fun _ hcurrent => hcurrent⟩
  | @tail middle target initial last ih =>
      have hinitialNodup : initial.vertices.Nodup := by
        apply nodup_of_append_singleton
        simpa only [Walk.vertices] using hnodup
      by_cases htarget : vertex = target
      · subst vertex
        exact ⟨⟨Walk.tail initial last, hnodup⟩,
          fun _ hcurrent => hcurrent⟩
      · have hmemInitial : List.Mem vertex initial.vertices := by
          rw [Walk.vertices] at hmem
          rcases List.mem_append.mp hmem with hprefix | hlast
          · exact hprefix
          · have heq : vertex = target := by simpa using hlast
            exact False.elim (htarget heq)
        let result := ih hinitialNodup vertex hmemInitial
        exact ⟨result.path, fun current hcurrent => by
          rw [Walk.vertices]
          exact List.mem_append.mpr
            (Or.inl (result.vertices_subset current hcurrent))⟩

/-- The simple prefix itself. -/
noncomputable def prefixTo {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} {source target : Vertex}
    (walk : Walk Edge source target) (hnodup : walk.vertices.Nodup)
    (vertex : Vertex) (hmem : List.Mem vertex walk.vertices) :
    SimplePath Edge source vertex :=
  (prefixOf walk hnodup vertex hmem).path

/-- Every vertex retained by `prefixTo` was already a vertex of the input
walk. -/
theorem prefixTo_vertices_subset {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} {source target : Vertex}
    (walk : Walk Edge source target) (hnodup : walk.vertices.Nodup)
    (vertex : Vertex) (hmem : List.Mem vertex walk.vertices) :
    forall current,
      List.Mem current (prefixTo walk hnodup vertex hmem).walk.vertices ->
      List.Mem current walk.vertices :=
  (prefixOf walk hnodup vertex hmem).vertices_subset

end SimplePath

/-- Explicit membership decision derived solely from the supplied equality
decision.  This avoids importing propositional choice when loop-erasing a
generic walk. -/
def memDecidable {Vertex : Type} (decEq : DecidableEq Vertex)
    (target : Vertex) : (vertices : List Vertex) ->
    Decidable (List.Mem target vertices)
  | [] => isFalse (by intro hmem; cases hmem)
  | vertex :: rest =>
      match decEq target vertex with
      | isTrue heq => isTrue (by
          subst target
          exact List.Mem.head rest)
      | isFalse hne =>
          match memDecidable decEq target rest with
          | isTrue hmem => isTrue (List.Mem.tail vertex hmem)
          | isFalse hnot => isFalse (by
              intro hmem
              cases hmem with
              | head => exact hne rfl
              | tail _ htail => exact hnot htail)

/-- A simple path obtained from an original walk, bundled with the literal
vertex-subset relation needed to inherit subdivision separation. -/
structure SimplePathOf {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source target : Vertex} (original : Walk Edge source target) : Type where
  path : SimplePath Edge source target
  vertices_subset : forall vertex,
    List.Mem vertex path.walk.vertices -> List.Mem vertex original.vertices

/-- Deterministically erase loops from a finite directed walk while retaining
its literal endpoints.  This definition is marked `noncomputable` only because
Lean's code generator does not compile the dependent walk recursor used by
`SimplePath.prefixTo`; its equality and membership branches are explicit. -/
noncomputable def toSimplePathOf {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} :
    {source target : Vertex} -> (walk : Walk Edge source target) ->
      SimplePathOf walk
  | _, _, .refl vertex =>
      ⟨SimplePath.refl vertex, fun _ hcurrent => hcurrent⟩
  | _, target, .tail initial last =>
      let initialPath := toSimplePathOf initial
      match memDecidable (inferInstance : DecidableEq Vertex)
          target initialPath.path.walk.vertices with
      | isTrue hmem =>
          let result := SimplePath.prefixOf initialPath.path.walk
            initialPath.path.verticesNodup target hmem
          ⟨result.path, fun vertex hvertex => by
            rw [Walk.vertices]
            exact List.mem_append.mpr (Or.inl
              (initialPath.vertices_subset vertex
                (result.vertices_subset vertex hvertex)))⟩
      | isFalse hfresh =>
          let result := SimplePath.tail initialPath.path last hfresh
          ⟨result, fun vertex hvertex => by
            dsimp [result, SimplePath.tail] at hvertex
            rw [Walk.vertices] at hvertex
            rw [Walk.vertices]
            rcases List.mem_append.mp hvertex with hprefix | hlast
            · exact List.mem_append.mpr (Or.inl
                (initialPath.vertices_subset vertex hprefix))
            · exact List.mem_append.mpr (Or.inr hlast)⟩

/-- The loop-erased simple path underlying `toSimplePathOf`. -/
noncomputable def toSimplePath {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} {source target : Vertex}
    (walk : Walk Edge source target) : SimplePath Edge source target :=
  (toSimplePathOf walk).path

/-- Loop erasure never introduces a vertex absent from the original walk. -/
theorem toSimplePath_vertices_subset {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} {source target vertex : Vertex}
    (walk : Walk Edge source target)
    (hvertex : List.Mem vertex (toSimplePath walk).walk.vertices) :
    List.Mem vertex walk.vertices :=
  (toSimplePathOf walk).vertices_subset vertex hvertex

/-- Every internal vertex of the loop-erased path was an internal vertex of
the original walk with the same literal endpoints. -/
theorem toSimplePath_interior_of_interior
    {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} {source target vertex : Vertex}
    (walk : Walk Edge source target)
    (hvertex : (toSimplePath walk).walk.Interior vertex) :
    walk.Interior vertex :=
  ⟨toSimplePath_vertices_subset walk hvertex.1,
    hvertex.2.1, hvertex.2.2⟩

/-- Every finite directed walk has a simple directed path with the same
endpoints. -/
theorem simplePath_nonempty {Vertex : Type} [DecidableEq Vertex]
    {Edge : Vertex -> Vertex -> Prop} {source target : Vertex}
    (walk : Walk Edge source target) :
    Nonempty (SimplePath Edge source target) :=
  ⟨toSimplePath walk⟩

end Walk

/-! ## Concrete protected-trie source-edge paths -/

/-- The concrete protected-trie macroedge with every loop erased and its
definitionally exact checkpoint endpoints retained. -/
noncomputable def subdivisionSimpleEdgePath
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Walk.SimplePath Step
      (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ [bit])) :=
  Walk.toSimplePath
    (subdivisionSeparatedEdgeWalk witness bits source bit)

/-- Every ordered source edge has a simple pure-S path between its exact
protected-trie checkpoints. -/
theorem subdivisionSimpleEdgePath_nonempty
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Nonempty (Walk.SimplePath Step
      (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ [bit]))) :=
  ⟨subdivisionSimpleEdgePath witness bits source bit⟩

/-- Every vertex retained by the concrete simple macroedge occurs on the
original separated macroedge. -/
theorem subdivisionSimpleEdgePath_vertices_subset
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (vertex : Term)
    (hvertex : List.Mem vertex
      (subdivisionSimpleEdgePath witness bits source bit).walk.vertices) :
    List.Mem vertex
      (subdivisionSeparatedEdgeWalk witness bits source bit).vertices := by
  exact Walk.toSimplePath_vertices_subset
    (subdivisionSeparatedEdgeWalk witness bits source bit) hvertex

/-- Every interior vertex of the simple macroedge is an interior vertex of
the original separated macroedge. -/
theorem subdivisionSimpleEdgePath_interior_original
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) (vertex : Term)
    (hvertex : (subdivisionSimpleEdgePath witness bits source bit).walk.Interior
      vertex) :
    (subdivisionSeparatedEdgeWalk witness bits source bit).Interior vertex := by
  exact Walk.toSimplePath_interior_of_interior
    (subdivisionSeparatedEdgeWalk witness bits source bit) hvertex

/-- Distinct valid source edges have internally vertex-disjoint simple
pure-S paths. -/
theorem protectedTrie_simple_edge_paths_pairwise_disjoint
    (verify : CertificateVerifier)
    (Valid : BitWord -> BitWord -> Prop)
    (witness : BitWord -> BitWord -> BitWord)
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits : BitWord) (left right : HistoryEdge (Valid bits))
    (hne : left ≠ right) :
    Walk.InternallyDisjoint
      (subdivisionSimpleEdgePath witness bits left.source left.bit).walk
      (subdivisionSimpleEdgePath witness bits right.source right.bit).walk := by
  have horiginal :=
    (protectedTrie_directed_subdivision verify Valid witness
      hprefixClosed hcomplete bits).2.1 left right hne
  intro vertex hleft hright
  exact horiginal vertex
    (subdivisionSimpleEdgePath_interior_original witness bits
      left.source left.bit vertex hleft)
    (subdivisionSimpleEdgePath_interior_original witness bits
      right.source right.bit vertex hright)

/-- No interior vertex of a valid simple source-edge path is any valid
checkpoint vertex. -/
theorem protectedTrie_simple_edge_path_checkpoint_disjoint
    (verify : CertificateVerifier)
    (Valid : BitWord -> BitWord -> Prop)
    (witness : BitWord -> BitWord -> BitWord)
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits : BitWord) (edge : HistoryEdge (Valid bits)) (vertex : Term)
    (hinterior :
      (subdivisionSimpleEdgePath witness bits edge.source edge.bit).walk.Interior
        vertex) :
    forall history (hvalid : Valid bits history),
      vertex ≠ subdivisionCheckpoint witness bits history := by
  have horiginal :=
    (protectedTrie_directed_subdivision verify Valid witness
      hprefixClosed hcomplete bits).2.2 edge vertex
      (subdivisionSimpleEdgePath_interior_original witness bits
        edge.source edge.bit vertex hinterior)
  exact horiginal

/-- Literal directed-subdivision theorem for the loop-erased family: checkpoint
injection, pairwise internal vertex-disjointness of the same simple path
family, and exclusion of every proper path vertex from every checkpoint. -/
theorem protectedTrie_simple_directed_subdivision
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
        (subdivisionSimpleEdgePath witness bits left.source left.bit).walk
        (subdivisionSimpleEdgePath witness bits right.source right.bit).walk) /\
    (forall (edge : HistoryEdge (Valid bits)) (vertex : Term),
      (subdivisionSimpleEdgePath witness bits edge.source edge.bit).walk.Interior
        vertex ->
      forall history (hvalid : Valid bits history),
        vertex ≠ subdivisionCheckpoint witness bits history) := by
  exact ⟨(protectedTrie_directed_subdivision verify Valid witness
      hprefixClosed hcomplete bits).1,
    protectedTrie_simple_edge_paths_pairwise_disjoint verify Valid witness
      hprefixClosed hcomplete bits,
    protectedTrie_simple_edge_path_checkpoint_disjoint verify Valid witness
      hprefixClosed hcomplete bits⟩

end PureSFormal.Research.ProtectedTrieSubdivision
