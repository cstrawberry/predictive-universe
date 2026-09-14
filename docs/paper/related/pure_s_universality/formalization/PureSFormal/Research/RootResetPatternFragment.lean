import PureSFormal.PureS.ProbeCompiler
import PureSFormal.PureS.FiniteController

/-!
# Bounded pattern fragments in the finite-controller interface

A fixed compiled control tree supplies a finite subtype of its materialized
PCs. The transition table uses only node kind, incoming side, and one-edge
moves. This adapter preserves the compiled pattern execution exactly, so its
origin-restoring Boolean boundary can be composed with ordinary finite
controller movement and selection phases. Control-cover membership is proved
constructively without the stronger axioms used by the standard attach lemma.
-/
namespace PureSFormal.Research.RootResetPatternFragment

open PureSFormal.PureS
open FiniteController

abbrev Code := ProbeCompiler.Control

theorem nodes_trans {whole middle last : Code}
    (outer : middle ∈ whole.nodes) (inner : last ∈ middle.nodes) : last ∈ whole.nodes := by
  induction whole with
  | answer bit =>
      have equal : middle = .answer bit := List.mem_singleton.mp outer
      subst middle
      exact inner
  | observeNode left right ihLeft ihRight =>
      simp only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append] at outer ⊢
      rcases outer with equal | leftMember | rightMember
      · subst middle; simpa only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append] using inner
      · exact Or.inr (Or.inl (ihLeft leftMember))
      · exact Or.inr (Or.inr (ihRight rightMember))
  | observeIncoming root left right ihRoot ihLeft ihRight =>
      simp only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append] at outer ⊢
      rcases outer with equal | ((rootMember | leftMember) | rightMember)
      · subst middle; simpa only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append] using inner
      · exact Or.inr (Or.inl (Or.inl (ihRoot rootMember)))
      · exact Or.inr (Or.inl (Or.inr (ihLeft leftMember)))
      · exact Or.inr (Or.inr (ihRight rightMember))
  | move primitive next ih =>
      simp only [ProbeCompiler.Control.nodes, List.mem_cons] at outer ⊢
      rcases outer with equal | member
      · subst middle; simpa only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append] using inner
      · exact Or.inr (ih member)

abbrev PC (whole : Code) := {state : Code // state ∈ whole.nodes}

def nested {whole : Code} (state : PC whole) (child : Code)
    (inside : child ∈ state.val.nodes) : PC whole :=
  ⟨child, nodes_trans state.property inside⟩

def transition (whole : Code) : PC whole → Probe.NodeKind → Probe.Incoming → Command (PC whole)
  | state@⟨.answer _, _⟩, _, _ => .stay state
  | ⟨.observeNode onS onApp, member⟩, node, _ =>
      match node with
      | .s => .stay (⟨onS, nodes_trans member (by simp only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append]; exact Or.inr (Or.inl (ProbeCompiler.Control.self_mem_nodes onS)))⟩)
      | .app => .stay (⟨onApp, nodes_trans member (by simp only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append]; exact Or.inr (Or.inr (ProbeCompiler.Control.self_mem_nodes onApp)))⟩)
  | ⟨.observeIncoming onRoot onLeft onRight, member⟩, _, incoming =>
      match incoming with
      | .root => .stay (⟨onRoot, nodes_trans member (by simp only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append]; exact Or.inr (Or.inl (Or.inl (ProbeCompiler.Control.self_mem_nodes onRoot))))⟩)
      | .left => .stay (⟨onLeft, nodes_trans member (by simp only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append]; exact Or.inr (Or.inl (Or.inr (ProbeCompiler.Control.self_mem_nodes onLeft))))⟩)
      | .right => .stay (⟨onRight, nodes_trans member (by simp only [ProbeCompiler.Control.nodes, List.mem_cons, List.mem_append]; exact Or.inr (Or.inr (ProbeCompiler.Control.self_mem_nodes onRight)))⟩)
  | ⟨.move primitive next, member⟩, _, _ =>
      .exec primitive (⟨next, nodes_trans member (by simp only [ProbeCompiler.Control.nodes, List.mem_cons]; exact Or.inr (ProbeCompiler.Control.self_mem_nodes next))⟩)

theorem mem_attachWith_constructive {α : Type} {P : α → Prop} (list : List α)
    (valid : ∀ value ∈ list, P value) (value : α) (member : value ∈ list) :
    (⟨value, valid value member⟩ : {value // P value}) ∈ list.attachWith P valid := by
  induction member with
  | head => exact List.Mem.head _
  | tail head member ih =>
      exact List.Mem.tail _ (ih (fun value member => valid value (List.Mem.tail head member)))

theorem mem_attach_constructive {α : Type} (list : List α) (value : {value // value ∈ list}) :
    value ∈ list.attach := by
  exact mem_attachWith_constructive list (fun _ h => h) value.val value.property

def machine (whole : Code) : Machine (PC whole) :=
  ⟨fun _ => whole.nodes.attach, mem_attach_constructive _, transition whole⟩

def initial (whole : Code) (cursor : Cursor) : Configuration (PC whole) :=
  ⟨some ⟨whole, ProbeCompiler.Control.self_mem_nodes whole⟩, cursor⟩

theorem states_length (whole : Code) : (machine whole).states.length = whole.size := by
  change whole.nodes.attach.length = whole.size
  rw [List.length_attach, ProbeCompiler.Control.length_nodes]

theorem answer_absorbing (whole : Code) (bit : Bool) (member : ProbeCompiler.Control.answer bit ∈ whole.nodes)
    (cursor : Cursor) (ticks : Nat) :
    run (machine whole) ticks ⟨some ⟨.answer bit, member⟩, cursor⟩ =
      ⟨some ⟨.answer bit, member⟩, cursor⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih


inductive Embeds (whole : Code) : ProbeCompiler.State → Configuration (PC whole) → Prop where
  | running (code : Code) (member : code ∈ whole.nodes) (cursor : Cursor) :
      Embeds whole (.running code cursor) ⟨some ⟨code, member⟩, cursor⟩
  | done (bit : Bool) (member : ProbeCompiler.Control.answer bit ∈ whole.nodes) (cursor : Cursor) :
      Embeds whole (.done bit cursor) ⟨some ⟨.answer bit, member⟩, cursor⟩
  | reject (cursor : Cursor) : Embeds whole .reject ⟨none, cursor⟩

theorem step_embeds {whole : Code} {raw : ProbeCompiler.State} {configuration : Configuration (PC whole)}
    (embedded : Embeds whole raw configuration) :
    Embeds whole ((ProbeCompiler.Table.ofControl whole).step raw)
      (step (machine whole) configuration) := by
  cases embedded with
  | reject cursor => exact Embeds.reject cursor
  | done bit member cursor => exact Embeds.done bit member cursor
  | running code member cursor =>
      rw [ProbeCompiler.Table.step_running_of_mem member]
      cases code with
      | answer bit => exact Embeds.done bit member cursor
      | observeNode onS onApp =>
          simp only [step, machine, transition, ProbeCompiler.Control.instruction,
            ProbeCompiler.executeInstruction]
          cases Probe.observeNode cursor <;> exact Embeds.running _ _ cursor
      | observeIncoming onRoot onLeft onRight =>
          simp only [step, machine, transition, ProbeCompiler.Control.instruction,
            ProbeCompiler.executeInstruction]
          cases Probe.observeIncoming cursor <;> exact Embeds.running _ _ cursor
      | move primitive next =>
          simp only [step, machine, transition, ProbeCompiler.Control.instruction,
            ProbeCompiler.executeInstruction]
          cases primitive.exec cursor with
          | none => exact Embeds.reject cursor
          | some moved => exact Embeds.running _ _ moved

theorem run_embeds {whole : Code} {raw : ProbeCompiler.State} {configuration : Configuration (PC whole)}
    (embedded : Embeds whole raw configuration) (ticks : Nat) :
    Embeds whole ((ProbeCompiler.Table.ofControl whole).run ticks raw)
      (run (machine whole) ticks configuration) := by
  induction ticks generalizing raw configuration with
  | zero => exact embedded
  | succ ticks ih => exact ih (step_embeds embedded)

theorem Embeds.running_eq {whole code : Code} {cursor : Cursor}
    {configuration : Configuration (PC whole)} (embedded : Embeds whole (.running code cursor) configuration)
    (member : code ∈ whole.nodes) : configuration = ⟨some ⟨code, member⟩, cursor⟩ := by
  cases embedded
  rfl

theorem compile_runs (pattern : Pattern) (yes no whole : Code) (origin : Cursor)
    (included : ∀ pc, pc ∈ (ProbeCompiler.compile pattern yes no).nodes → pc ∈ whole.nodes) :
    let firstMember := included _ (ProbeCompiler.Control.self_mem_nodes _)
    let selected := if Pattern.matchesBool pattern origin.focus then yes else no
    ∃ selectedMember : selected ∈ whole.nodes,
      run (machine whole) (ProbeCompiler.probeCost pattern origin.focus)
        ⟨some ⟨ProbeCompiler.compile pattern yes no, firstMember⟩, origin⟩ =
      ⟨some ⟨selected, selectedMember⟩, origin⟩ := by
  dsimp only
  have raw := ProbeCompiler.compile_runs pattern yes no whole origin included
  have embedded := run_embeds
    (Embeds.running _ (included _ (ProbeCompiler.Control.self_mem_nodes _)) origin)
    (ProbeCompiler.probeCost pattern origin.focus)
  rw [raw.run_eq] at embedded
  have member := included _
    (ProbeCompiler.selected_nodes_in_compile pattern yes no origin.focus _
      (ProbeCompiler.Control.self_mem_nodes _))
  exact ⟨member, Embeds.running_eq embedded member⟩


theorem mutationCount_zero (whole : Code) (readOnly : whole.NoRdx)
    (configuration : Configuration (PC whole)) : mutationCount (machine whole) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rcases state with ⟨code, member⟩
      have localReadOnly := ProbeCompiler.Control.noRdx_of_mem_nodes readOnly member
      cases code with
      | answer bit => rfl
      | observeNode onS onApp =>
          simp only [mutationCount, machine, transition]
          cases Probe.observeNode cursor <;> rfl
      | observeIncoming onRoot onLeft onRight =>
          simp only [mutationCount, machine, transition]
          cases Probe.observeIncoming cursor <;> rfl
      | move primitive next =>
          cases primitive with
          | L => rfl
          | R => rfl
          | U => rfl
          | Rdx => exact False.elim localReadOnly

theorem runMutationCount_zero (whole : Code) (readOnly : whole.NoRdx) (ticks : Nat)
    (configuration : Configuration (PC whole)) : runMutationCount (machine whole) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero whole readOnly, ih, Nat.zero_add]

theorem erase_run (whole : Code) (readOnly : whole.NoRdx) (ticks : Nat)
    (configuration : Configuration (PC whole)) :
    (run (machine whole) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projection := run_projects_stepsN (machine whole) ticks configuration
  rw [runMutationCount_zero whole readOnly] at projection
  exact (StepsN.eq_of_zero projection).symm


end PureSFormal.Research.RootResetPatternFragment
