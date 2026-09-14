import PureSFormal.AppendixF.ProgramRecognition
import PureSFormal.AppendixF.RecursivePath

namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

def literalTable : Admissible → Admissible := id

def parseData : Term → Option (Data Admissible)
  | .app (.app .s left) (.app .s right) => do
      let l ← parseData left
      let r ← parseData right
      pure (.node l r)
  | .app .s p => (parseAdmissible p).map .leaf
  | _ => none

theorem parseData_term (d : Data Admissible) : parseData (d.term literalTable) = some d := by
  induction d with
  | leaf p =>
    change (parseAdmissible p.term).map Data.leaf = _
    rw [parseAdmissible_term]
    rfl
  | node left right ihl ihr =>
    simp [Data.term, parseData, ihl, ihr]

theorem parseData_sound (t : Term) (d : Data Admissible) (found : parseData t = some d) :
    t = d.term literalTable := by
  fun_induction parseData t generalizing d
  case case1 left right ihl ihr =>
    obtain ⟨l, lfound, rest⟩ := Option.bind_eq_some_iff.mp found
    obtain ⟨r, rfound, same⟩ := Option.bind_eq_some_iff.mp rest
    have dataEq : Data.node l r = d := Option.some.inj same
    subst d
    rw [ihl l lfound, ihr r rfound]
    rfl
  case case2 p =>
    obtain ⟨a, parsed, same⟩ := Option.map_eq_some_iff.mp found
    subst d
    rw [parseAdmissible_sound p a parsed]
    rfl
  case case3 t exclusion => simp_all

theorem Data.literal_term_injective {left right : Data Admissible}
    (same : left.term literalTable = right.term literalTable) : left = right := by
  have parsed := congrArg parseData same
  simpa only [parseData_term, Option.some.injEq] using parsed

def Data.mapLabels (f : Label → Other) : Data Label → Data Other
  | .leaf label => .leaf (f label)
  | .node left right => .node (left.mapLabels f) (right.mapLabels f)

theorem Data.mapLabels_term (f : Label → Other) (table : Other → Admissible) (d : Data Label) :
    (d.mapLabels f).term table = d.term (fun j => table (f j)) := by
  induction d with
  | leaf => rfl
  | node left right ihl ihr => simp only [Data.mapLabels, Data.term, ihl, ihr]

theorem Data.mapLabels_internal (f : Label → Other) (d : Data Label) :
    (d.mapLabels f).internal = d.internal := by cases d <;> rfl

def parseCall : Term → Option (Admissible × Data Admissible)
  | .app p x => do
      let program ← parseAdmissible p
      let data ← parseData x
      if data.internal then pure (program, data) else none
  | _ => none

theorem parseCall_term (p : Admissible) (d : Data Admissible) (internal : d.internal = true) :
    parseCall (p.term ⊙ d.term literalTable) = some (p, d) := by
  simp [parseCall, parseAdmissible_term, parseData_term, internal]

theorem parseCall_sound (t : Term) (p : Admissible) (d : Data Admissible)
    (found : parseCall t = some (p, d)) : t = p.term ⊙ d.term literalTable ∧ d.internal = true := by
  cases t with
  | s => cases found
  | app program data =>
    obtain ⟨p', pfound, rest⟩ := Option.bind_eq_some_iff.mp found
    obtain ⟨d', dfound, rest⟩ := Option.bind_eq_some_iff.mp rest
    by_cases internal : d'.internal = true
    · have same : (p', d') = (p, d) := by simpa [internal] using rest
      have peq : p' = p := congrArg Prod.fst same
      have deq : d' = d := congrArg Prod.snd same
      subst p'
      subst d'
      exact ⟨by rw [parseAdmissible_sound _ _ pfound, parseData_sound _ _ dfound], internal⟩
    · simp only [internal, if_false] at rest
      cases rest

theorem parseCall_covers_table (table : Label → Admissible) (p : Label) (d : Data Label)
    (internal : d.internal = true) :
    parseCall ((table p).term ⊙ d.term table) = some (table p, d.mapLabels table) := by
  have correct := parseCall_term (table p) (d.mapLabels table)
    ((d.mapLabels_internal table).trans internal)
  simpa only [Data.mapLabels_term, literalTable, id_eq] using correct

def Data.programs : Data Admissible → List Admissible
  | .leaf p => [p]
  | .node left right => left.programs ++ right.programs

/-- Labels are literal programs. Equal program codes therefore denote one
    label even when the finite cover lists a program more than once. -/
abbrev ExtractedLabel (p : Admissible) (d : Data Admissible) := {a : Admissible // a ∈ p :: d.programs}

def Data.reindex (d : Data Admissible) (labels : List Admissible)
    (covered : ∀ a ∈ d.programs, a ∈ labels) : Data {a : Admissible // a ∈ labels} :=
  match d with
  | .leaf p => .leaf ⟨p, covered p (List.Mem.head _)⟩
  | .node left right => .node
      (left.reindex labels (fun a member => covered a (List.mem_append_left _ member)))
      (right.reindex labels (fun a member => covered a (List.mem_append_right _ member)))

theorem Data.reindex_term (d : Data Admissible) (labels : List Admissible)
    (covered : ∀ a ∈ d.programs, a ∈ labels) :
    (d.reindex labels covered).term Subtype.val = d.term literalTable := by
  induction d with
  | leaf => rfl
  | node left right ihl ihr =>
    change .s ⊙ (left.reindex labels _).term Subtype.val ⊙ (.s ⊙ (right.reindex labels _).term Subtype.val) = _
    rw [ihl, ihr]
    rfl

theorem Data.reindex_internal (d : Data Admissible) (labels : List Admissible)
    (covered : ∀ a ∈ d.programs, a ∈ labels) : (d.reindex labels covered).internal = d.internal := by
  cases d <;> rfl

def extractedLabels (p : Admissible) (d : Data Admissible) : FiniteTables.Enumeration (ExtractedLabel p d) where
  values := (p :: d.programs).attach
  covers label := List.mem_attach _ label

def extractedConfiguration (p : Admissible) (d : Data Admissible) (context : Context) :
    Configuration (ExtractedLabel p d) :=
  ⟨⟨p, List.Mem.head _⟩, d.reindex (p :: d.programs) (fun a mem => List.Mem.tail p mem), context⟩

theorem extractedConfiguration_term (p : Admissible) (d : Data Admissible) (context : Context) :
    (extractedConfiguration p d context).term Subtype.val = context.plug (p.term ⊙ d.term literalTable) := by
  simp only [extractedConfiguration, Configuration.term, Data.reindex_term]

/-- Recognition supplies an actual finite table and typed internal datum for
    the uniform native-path decision theorem. -/
theorem recognized_call_has_finite_table (t : Term) (p : Admissible) (d : Data Admissible)
    (found : parseCall t = some (p, d)) (context : Context) :
    (extractedConfiguration p d context).data.internal = true ∧
    (extractedConfiguration p d context).term Subtype.val = context.plug t := by
  obtain ⟨same, internal⟩ := parseCall_sound t p d found
  exact ⟨(d.reindex_internal _ _).trans internal,
    (extractedConfiguration_term p d context).trans (congrArg context.plug same.symm)⟩

end PureSFormal.AppendixF.RecursiveCall
