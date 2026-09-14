import PureSFormal.Research.ProtectedTrieParser

/-!
# Finite enumeration of opened protected-trie paths

This local Research module turns the exact protected-node parser into a finite
list of every abstract binary path opened in a finite pure-`S` term.  It is a
structural syntax traversal only: it performs no reduction, tableau checking,
or source-machine computation.
-/

namespace PureSFormal.Research.ProtectedTrieEnumeration

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieParser

/--
Enumerate opened paths in root/left/right order.  The empty path records the
current protected node; child paths receive their literal branch bit.
-/
def openedPaths : Term -> List (List Bool)
  | .app (.app .s left) (.app (.app .s right) _junk) =>
      [] ::
        (openedPaths left).map (List.cons false) ++
        (openedPaths right).map (List.cons true)
  | _ => []

@[simp]
theorem openedPaths_protectedNode (left right junk : Term) :
    openedPaths (protectedNode left right junk) =
      [] ::
        (openedPaths left).map (List.cons false) ++
        (openedPaths right).map (List.cons true) :=
  rfl

/-- Prefixing every list entry by one fixed bit preserves exact membership. -/
theorem mem_map_cons_iff (bit : Bool) (path : List Bool)
    (paths : List (List Bool)) :
    List.Mem (bit :: path) (paths.map (List.cons bit)) <->
      List.Mem path paths := by
  induction paths with
  | nil =>
      constructor <;> intro hmem <;> cases hmem
  | cons first rest ih =>
      simp only [List.map_cons]
      constructor
      · intro hmem
        rcases List.mem_cons.mp hmem with heq | hrest
        · have htail : first = path := (List.cons.inj heq).2.symm
          exact htail ▸ List.Mem.head rest
        · exact List.Mem.tail first (ih.mp hrest)
      · intro hmem
        rcases List.mem_cons.mp hmem with heq | hrest
        · subst path
          exact List.Mem.head _
        · exact List.Mem.tail _ (ih.mpr hrest)

/-- A false-prefixed path cannot occur in a true-prefixed mapped list. -/
theorem false_cons_not_mem_map_true (path : List Bool)
    (paths : List (List Bool)) :
    ¬ List.Mem (false :: path) (paths.map (List.cons true)) := by
  induction paths with
  | nil =>
      intro hmem
      cases hmem
  | cons first rest ih =>
      intro hmem
      simp only [List.map_cons] at hmem
      rcases List.mem_cons.mp hmem with heq | hrest
      · cases heq
      · exact ih hrest

/-- A true-prefixed path cannot occur in a false-prefixed mapped list. -/
theorem true_cons_not_mem_map_false (path : List Bool)
    (paths : List (List Bool)) :
    ¬ List.Mem (true :: path) (paths.map (List.cons false)) := by
  induction paths with
  | nil =>
      intro hmem
      cases hmem
  | cons first rest ih =>
      intro hmem
      simp only [List.map_cons] at hmem
      rcases List.mem_cons.mp hmem with heq | hrest
      · cases heq
      · exact ih hrest

/-- List membership agrees exactly with the existing executable path parser. -/
theorem mem_openedPaths_iff_openedAt? (term : Term) (path : List Bool) :
    List.Mem path (openedPaths term) <-> openedAt? term path = true := by
  induction term using openedPaths.induct generalizing path with
  | case1 left right junk ihleft ihright =>
      change
        List.Mem path (openedPaths (protectedNode left right junk)) <->
          openedAt? (protectedNode left right junk) path = true
      cases path with
      | nil =>
          constructor
          · intro hmem
            rfl
          · intro hopen
            rw [openedPaths_protectedNode]
            exact List.Mem.head _
      | cons bit path =>
          cases bit with
          | false =>
              constructor
              · intro hmem
                rw [openedPaths_protectedNode] at hmem
                rcases List.mem_cons.mp hmem with heq | hrest
                · cases heq
                · rcases List.mem_append.mp hrest with hleft | hright
                  · have hpath : List.Mem path (openedPaths left) :=
                      (mem_map_cons_iff false path (openedPaths left)).mp hleft
                    simpa only [openedAt?, parseProtected?_protectedNode] using
                      (ihleft path).mp hpath
                  · exact False.elim
                      (false_cons_not_mem_map_true path (openedPaths right) hright)
              · intro hopen
                have hleft : List.Mem path (openedPaths left) :=
                  (ihleft path).mpr
                    (by simpa only [openedAt?, parseProtected?_protectedNode]
                      using hopen)
                rw [openedPaths_protectedNode]
                exact List.Mem.tail []
                  (List.mem_append.mpr (Or.inl
                    ((mem_map_cons_iff false path (openedPaths left)).mpr hleft)))
          | true =>
              constructor
              · intro hmem
                rw [openedPaths_protectedNode] at hmem
                rcases List.mem_cons.mp hmem with heq | hrest
                · cases heq
                · rcases List.mem_append.mp hrest with hleft | hright
                  · exact False.elim
                      (true_cons_not_mem_map_false path (openedPaths left) hleft)
                  · have hpath : List.Mem path (openedPaths right) :=
                      (mem_map_cons_iff true path (openedPaths right)).mp hright
                    simpa only [openedAt?, parseProtected?_protectedNode] using
                      (ihright path).mp hpath
              · intro hopen
                have hright : List.Mem path (openedPaths right) :=
                  (ihright path).mpr
                    (by simpa only [openedAt?, parseProtected?_protectedNode]
                      using hopen)
                rw [openedPaths_protectedNode]
                exact List.Mem.tail []
                  (List.mem_append.mpr (Or.inr
                    ((mem_map_cons_iff true path (openedPaths right)).mpr hright)))
  | case2 term hnotProtected =>
      have hparse : parseProtected? term = none := by
        cases h : parseProtected? term with
        | none => rfl
        | some view =>
            have hterm : term = view.term := parseProtected?_sound h
            cases view with
            | mk left right junk =>
                exact False.elim
                  (hnotProtected left right junk
                    (by simpa [ProtectedView.term, protectedNode, passive]
                      using hterm))
      rw [openedPaths.eq_2 term hnotProtected]
      constructor
      · intro hmem
        cases hmem
      · intro hopen
        cases path with
        | nil =>
            simp only [openedAt?, hparse] at hopen
            cases hopen
        | cons bit path =>
            cases bit <;>
              simp only [openedAt?, hparse] at hopen <;>
              cases hopen

/-- List membership also agrees exactly with the declarative path predicate. -/
theorem mem_openedPaths_iff_openedAt (term : Term) (path : List Bool) :
    List.Mem path (openedPaths term) <-> OpenedAt term path :=
  (mem_openedPaths_iff_openedAt? term path).trans openedAt?_eq_true_iff

/-! ## Anchored enumeration -/

/--
Enumerate only paths below the body field of an exact inert outer header.
Malformed non-header terms have the empty enumeration.
-/
def anchoredOpenedPaths (term : Term) : List (List Bool) :=
  match parseHeader? term with
  | none => []
  | some view => openedPaths view.body

@[simp]
theorem anchoredOpenedPaths_header (seed body : Term) :
    anchoredOpenedPaths (header seed body) = openedPaths body :=
  rfl

/-- Anchored enumeration agrees exactly with the anchored executable parser. -/
theorem mem_anchoredOpenedPaths_iff_anchoredOpenedAt? (term : Term)
    (path : List Bool) :
    List.Mem path (anchoredOpenedPaths term) <->
      anchoredOpenedAt? term path = true := by
  unfold anchoredOpenedPaths anchoredOpenedAt?
  cases hparse : parseHeader? term with
  | none =>
      simp only [hparse]
      constructor
      · intro hmem
        cases hmem
      · intro hopen
        cases hopen
  | some view =>
      simp only [hparse]
      exact mem_openedPaths_iff_openedAt? view.body path

/-- Under a literal header, anchored membership is the body predicate. -/
theorem mem_anchoredOpenedPaths_header_iff (seed body : Term)
    (path : List Bool) :
    List.Mem path (anchoredOpenedPaths (header seed body)) <->
      OpenedAt body path := by
  rw [anchoredOpenedPaths_header]
  exact mem_openedPaths_iff_openedAt body path

end PureSFormal.Research.ProtectedTrieEnumeration
