import PureSFormal.Research.RootResetNestedClockGrowthProbe
import PureSFormal.Research.RootResetClockParityWalker

/-! Finite unary-successor descent retaining only one parity bit. -/
namespace PureSFormal.Research.RootResetNestedUnaryScan
open PureSFormal.PureS
open FiniteController RootResetPatternFragment RootResetCarrierNonemptyProbe
open RootResetCarrierEdgePatterns RootResetCompletedLocalPatterns
open RootResetClockParityWalker (parity xor numeralParents)

def successorPattern : Pattern := .app (.app .s .s) .hole
def successorRow : EdgeRow := ⟨successorPattern, [.right]⟩
def rows : List EdgeRow := [successorRow]

theorem valid : RootResetEdgeFragment.Valid rows := by
  intro row member
  have equal := List.mem_singleton.mp member
  subst row
  exact ⟨(by intro h; cases h), RootResetCarrierNonemptyRows.supports_subterm _ _ rfl⟩

theorem selected_shape (source : Term) (row : EdgeRow)
    (selected : RootResetEdgeFragment.select rows source = some row) :
    row = successorRow ∧ ∃ tail, source = .app b tail := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound rows source row selected
  have equal := List.mem_singleton.mp member
  subst row
  refine ⟨rfl, ?_⟩
  obtain ⟨function, tail, sourceEq, functionMatches, _⟩ := app_matches matched
  obtain ⟨left, right, functionEq, leftMatches, rightMatches⟩ := app_matches functionMatches
  have leftEq := (Pattern.matches_s_iff left).mp (Pattern.matchesBool_sound leftMatches)
  have rightEq := (Pattern.matches_s_iff right).mp (Pattern.matchesBool_sound rightMatches)
  exact ⟨tail, by rw [sourceEq, functionEq, leftEq, rightEq]; rfl⟩

inductive Control where
  | scan (bit : Bool) (pc : RootResetEdgeFragment.Control rows)
  | done (bit : Bool)

def cover : List Control := [.done false, .done true] ++
  (RootResetEdgeFragment.machine rows).states.map (.scan false) ++
  (RootResetEdgeFragment.machine rows).states.map (.scan true)

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | done bit =>
      apply Or.inl ∘ Or.inl
      cases bit with
      | false => exact List.Mem.head _
      | true => exact List.Mem.tail _ (List.Mem.head _)
  | scan bit pc =>
      have member := RootResetCompletedLocalPatterns.map_member (Control.scan bit)
        ((RootResetEdgeFragment.machine rows).covers pc)
      cases bit with
      | false => exact Or.inl (Or.inr member)
      | true => exact Or.inr member

def transition (state : Control) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command Control :=
  match state with
  | .scan bit pc => match pc.val with
    | .answer true => .stay (.scan (!bit) ⟨RootResetEdgeFragment.familyCode rows, ProbeCompiler.Control.self_mem_nodes _⟩)
    | .answer false => .stay (.done bit)
    | _ => mapCommand (.scan bit) ((RootResetEdgeFragment.machine rows).transition pc node incoming)
  | .done bit => .stay (.done bit)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (bit : Bool) (origin : Cursor) : Configuration Control :=
  liftConfiguration (.scan bit) (RootResetEdgeFragment.initial rows origin)

theorem scanning_step (bit : Bool) (configuration : Configuration (RootResetEdgeFragment.Control rows))
    (running : anyAnswer? configuration = false) :
    step machine (liftConfiguration (Control.scan bit) configuration) =
      liftConfiguration (Control.scan bit) (step (RootResetEdgeFragment.machine rows) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases running
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem branch_runs (bit : Bool) (origin endpoint : Cursor) (ticks : Nat) (matched : Bool)
    (member : ProbeCompiler.Control.answer matched ∈ (RootResetEdgeFragment.familyCode rows).nodes)
    (execution : run (RootResetEdgeFragment.machine rows) ticks (RootResetEdgeFragment.initial rows origin) =
      ⟨some ⟨.answer matched, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks + 1 ∧ run machine used (initial bit origin) =
      if matched then initial (!bit) endpoint else ⟨some (.done bit), endpoint⟩ := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary (RootResetEdgeFragment.machine rows) machine (Control.scan bit)
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (scanning_step bit) ticks
    (RootResetEdgeFragment.initial rows origin) (by rw [execution]; rfl)
  rw [execution] at actual
  refine ⟨used + 1, Nat.succ_le_succ bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration (Control.scan bit) (RootResetEdgeFragment.initial rows origin)) = _
  rw [run_add, actual]
  cases matched <;> rfl

def coefficient : Nat := RootResetEdgeFragment.bound rows + 1

def wrap : Nat → Term → Term
  | 0, term => term
  | count + 1, term => .app b (wrap count term)

theorem wrap_C0 (count : Nat) : wrap count (C 0) = C count := by
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (Term.app b) ih

theorem scan_within (bit : Bool) (origin : Cursor) :
    ∃ ticks count endpoint,
      ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial bit origin) = ⟨some (.done (RootResetClockParityWalker.xor bit (parity count))), endpoint⟩ ∧
      origin.focus = wrap count endpoint.focus ∧
      endpoint.parents = numeralParents count origin.parents ∧
      RootResetEdgeFragment.select rows endpoint.focus = none := by
  have auxiliary : ∀ size, ∀ (bit : Bool) (origin : Cursor), origin.focus.size = size →
      ∃ ticks count endpoint,
        ticks ≤ coefficient * origin.focus.size ∧
        run machine ticks (initial bit origin) = ⟨some (.done (RootResetClockParityWalker.xor bit (parity count))), endpoint⟩ ∧
        origin.focus = wrap count endpoint.focus ∧
        endpoint.parents = numeralParents count origin.parents ∧
        RootResetEdgeFragment.select rows endpoint.focus = none := by
    intro size
    induction size using Nat.strongRecOn with
    | ind size ih =>
      intro bit origin sizeEq
      cases selected : RootResetEdgeFragment.select rows origin.focus with
      | none =>
          obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs rows origin selected
          obtain ⟨used, bounded, actual⟩ := branch_runs bit origin origin _ false member execution
          have localBound := Nat.add_le_add_right (RootResetEdgeFragment.ticks_bound rows origin.focus) 1
          have bound : used ≤ coefficient * origin.focus.size :=
            Nat.le_trans (Nat.le_trans bounded localBound)
              (by simpa only [Nat.mul_one] using! Nat.mul_le_mul_left coefficient (Term.size_pos origin.focus))
          exact ⟨used, 0, origin, bound, actual, rfl, rfl, selected⟩
      | some row =>
          obtain ⟨rowEq, tail, sourceEq⟩ := selected_shape origin.focus row selected
          subst row
          rcases origin with ⟨source, parents⟩
          change source = _ at sourceEq
          subst source
          let after : Cursor := ⟨tail, .right b :: parents⟩
          have followed : RootResetEdgeFragment.follow successorRow.address ⟨.app b tail, parents⟩ = some after := rfl
          have smaller := RootResetEdgeFragment.follow_size_lt successorRow.address ⟨.app b tail, parents⟩ after
            (by intro h; cases h) followed
          obtain ⟨member, execution⟩ := RootResetEdgeFragment.selected_runs rows ⟨.app b tail, parents⟩ after successorRow selected followed
          obtain ⟨used, bounded, actual⟩ := branch_runs bit ⟨.app b tail, parents⟩ after _ true member execution
          have smallerIndex : after.focus.size < size := by rw [← sizeEq]; exact smaller
          obtain ⟨tailTicks, count, endpoint, tailBound, tailRun, wrapped, parentEq, missed⟩ := ih _ smallerIndex (!bit) after rfl
          refine ⟨used + tailTicks, count + 1, endpoint, ?_, ?_, ?_, parentEq, missed⟩
          · exact RootResetEdgeSpine.combine_bound rows (.app b tail) tail _ _
              (Nat.le_trans bounded (Nat.add_le_add_right (RootResetEdgeFragment.ticks_bound rows _) 1)) tailBound smaller
          · simp only [↓reduceIte] at actual
            rw [run_add, actual, tailRun, RootResetClockParityWalker.xor_flip]
            rfl
          · exact congrArg (Term.app b) wrapped
  exact auxiliary origin.focus.size bit origin rfl

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done bit => rfl
      | scan bit pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly rows)
            ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) :
    runMutationCount machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem done_absorbs (bit : Bool) (origin : Cursor) (ticks : Nat) :
    run machine ticks ⟨some (.done bit), origin⟩ = ⟨some (.done bit), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

end PureSFormal.Research.RootResetNestedUnaryScan
