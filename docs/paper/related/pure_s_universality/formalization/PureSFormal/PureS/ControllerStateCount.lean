import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.SchedulerControl

/-!
# Exact size of the fixed scheduler's constructive state cover

`SchedulerControl.controlStates` is the structurally generated finite cover
before deduplication.  This module counts its entries without constructing the
enormous list.  The calculation factors the raw cover into macro, script-PC,
probe-PC, and register components.  `SchedulerControl.machine` instead exposes
`canonicalControlStates`, a proved duplicate-free enumeration with the same
membership; the raw-cover count is not its cardinality.
-/

namespace PureSFormal.PureS

namespace SchedulerControl

set_option maxRecDepth 10000

/-! ## List-length factorization -/

@[simp]
theorem boundedAttach_length (values : List α) :
    (boundedAttach values).length = values.length := by
  induction values with
  | nil => rfl
  | cons first rest ih => simp [boundedAttach, ih]

theorem sum_map_const (values : List α) (count : Nat) :
    (values.map fun _ => count).sum = count * values.length := by
  induction values with
  | nil => simp
  | cons first rest ih =>
      simp only [List.map_cons, List.sum_cons, ih, List.length_cons,
        Nat.mul_succ]
      simp [Nat.add_comm]

theorem sum_append_nat (left right : List Nat) :
    (left ++ right).sum = left.sum + right.sum := by
  induction left with
  | nil => simp
  | cons value left ih => simp [ih, Nat.add_assoc]

theorem length_flatMap_map_const (values : List α) (registers : List β)
    (make : α → β → γ) :
    (values.flatMap fun value => registers.map (make value)).length =
      values.length * registers.length := by
  induction values with
  | nil => simp
  | cons first rest ih =>
      simp only [List.flatMap_cons, List.length_append, List.length_map, ih,
        List.length_cons, Nat.succ_mul]
      simp [Nat.add_comm]

theorem length_flatMap_const_of_length (values : List α)
    (make : α → List β) (count : Nat)
    (hlength : ∀ value ∈ values, (make value).length = count) :
    (values.flatMap make).length = values.length * count := by
  induction values with
  | nil => simp
  | cons first rest ih =>
      rw [List.flatMap_cons, List.length_append,
        hlength first (List.Mem.head rest),
        ih (fun value hvalue =>
          hlength value (List.Mem.tail first hvalue)),
        List.length_cons, Nat.succ_mul]
      exact Nat.add_comm _ _

theorem length_dependent_flatMap_map_const
    {β : α → Type} (values : List α) (items : (value : α) → List (β value))
    (registers : List γ) (make : (value : α) → β value → γ → δ) :
    (values.flatMap fun value =>
      (items value).flatMap fun item =>
        registers.map (make value item)).length =
      ((values.map fun value => (items value).length).sum) *
        registers.length := by
  induction values with
  | nil => simp
  | cons first rest ih =>
      rw [List.flatMap_cons, List.length_append,
        length_flatMap_map_const, ih, List.map_cons, List.sum_cons,
        Nat.add_mul]

@[simp]
theorem registerStates_length (program : CTS.Program) :
    (registerStates program).length = 24 * program.period := by
  rw [registerStates, length_flatMap_const_of_length _ _ 24]
  · rw [List.length_finRange]
    exact Nat.mul_comm _ _
  · intro phase hphase
    rw [length_flatMap_const_of_length _ _ 8]
    · rfl
    · intro bit hbit
      rw [length_flatMap_const_of_length _ _ 4]
      · rfl
      · intro seen hseen
        rw [length_flatMap_const_of_length _ _ 2]
        · rfl
        · intro tail htail
          rw [List.length_map]
          rfl

@[simp]
theorem treeNodes_length (tree : Dispatcher.Tree Label) :
    (treeNodes tree).length + 1 = 2 * tree.leafCount := by
  induction tree with
  | leaf label => rfl
  | node left right ihLeft ihRight =>
      simp only [treeNodes, List.length_cons, List.length_append,
        Dispatcher.Tree.leafCount]
      rw [Nat.mul_add, ← ihLeft, ← ihRight]
      simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

@[simp]
theorem codeNodeStates_length (dispatcher : ActionDispatcher program) :
    (codeNodeStates dispatcher).length + 1 =
      2 * dispatcher.tree.leafCount := by
  rw [codeNodeStates, boundedAttach_length, treeNodes_length]

/-- Number of ordinary cover entries before multiplying by register values. -/
def controlTemplateCount (program : CTS.Program)
    (dispatcher : ActionDispatcher program) : Nat :=
  (macroStates program dispatcher).length +
  ((scriptJobStates program).map fun job =>
    (scriptPCStates program dispatcher job).length).sum +
  ((probeKindStates program dispatcher).map fun kind =>
    (probePCStates program dispatcher kind).length).sum

private theorem scriptControlBlock_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (jobs : List (ScriptJob program)) →
      (jobs.flatMap fun job =>
        (scriptPCStates program dispatcher job).flatMap fun pc =>
          (registerStates program).map fun registers =>
            Control.script job pc registers).length =
      ((jobs.map fun job =>
        (scriptPCStates program dispatcher job).length).sum) *
        (registerStates program).length
  | [] => by simp
  | job :: jobs => by
      simp only [List.flatMap_cons, List.length_append, List.map_cons,
        List.sum_cons, scriptControlBlock_length program dispatcher jobs,
        length_flatMap_map_const, Nat.add_mul]

private theorem probeControlBlock_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (kinds : List (ProbeKind program dispatcher)) →
      (kinds.flatMap fun kind =>
        (probePCStates program dispatcher kind).flatMap fun pc =>
          (registerStates program).map fun registers =>
            Control.probe kind pc registers).length =
      ((kinds.map fun kind =>
        (probePCStates program dispatcher kind).length).sum) *
        (registerStates program).length
  | [] => by simp
  | kind :: kinds => by
      simp only [List.flatMap_cons, List.length_append, List.map_cons,
        List.sum_cons, probeControlBlock_length program dispatcher kinds,
        length_flatMap_map_const, Nat.add_mul]

theorem controlStates_length_factor (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    (controlStates program dispatcher).length =
      controlTemplateCount program dispatcher *
        (registerStates program).length := by
  rw [controlStates, List.length_append, List.length_append,
    length_flatMap_map_const,
    length_dependent_flatMap_map_const,
    length_dependent_flatMap_map_const]
  simp only [controlTemplateCount, Nat.add_mul]

theorem runtimeStates_length {ControlType : Type}
    (machine : FiniteController.Machine ControlType) :
    (FiniteController.runtimeStates machine).length =
      machine.states.length + 1 := by
  simp [FiniteController.runtimeStates, Nat.add_comm]

/-! ## Macro and PC component counts -/

@[simp]
theorem scriptPCStates_length (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (job : ScriptJob program) :
    (scriptPCStates program dispatcher job).length =
      (jobScript program dispatcher job).length + 1 := by
  simp [scriptPCStates]

@[simp]
theorem probePCStates_length (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) :
    (probePCStates program dispatcher kind).length =
      (probeControl program dispatcher kind).size := by
  rw [probePCStates, boundedAttach_length, ProbeCompiler.Control.length_nodes]

theorem macroStates_length (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    (macroStates program dispatcher).length =
      29 + 3 * (codeNodeStates dispatcher).length := by
  simp only [macroStates, List.length_append, List.length_flatMap]
  change 29 +
    ((codeNodeStates dispatcher).map fun _ => 3).sum = _
  rw [sum_map_const]

def scriptTemplateCount (program : CTS.Program)
    (dispatcher : ActionDispatcher program) : Nat :=
  ((scriptJobStates program).map fun job =>
    (scriptPCStates program dispatcher job).length).sum

def probeTemplateCount (program : CTS.Program)
    (dispatcher : ActionDispatcher program) : Nat :=
  ((probeKindStates program dispatcher).map fun kind =>
    (probePCStates program dispatcher kind).length).sum

theorem controlTemplateCount_eq_components (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    controlTemplateCount program dispatcher =
      (macroStates program dispatcher).length +
        scriptTemplateCount program dispatcher +
        probeTemplateCount program dispatcher :=
  rfl

private def baseProbeKinds (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    List (ProbeKind program dispatcher) :=
  [.clockSuccessor, .clockZero, .fuelSuccessor, .fuelZero,
    .downLiveZero, .downLiveOne, .downTombstoneZero,
    .downTombstoneOne, .downLocal, .downBase, .pending .scan,
    .pending .normalReturn, .pending .emptyReturn,
    .growWrapper, .growEnvelope, .upLiveZero .left,
    .upLiveZero .right, .upLiveOne .left, .upLiveOne .right,
    .upRegistered .left, .upRegistered .right,
    .arityThree .growth, .arityFour .growth,
    .arityThree (.continuation false), .arityFour (.continuation false),
    .arityThree (.continuation true), .arityFour (.continuation true)]

private theorem probeKindStates_eq (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    probeKindStates program dispatcher =
      baseProbeKinds program dispatcher ++
      (codeNodeStates dispatcher).flatMap fun node =>
        [.routeLeft node, .routeRight node] :=
  rfl

private theorem clockSuccessor_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .clockSuccessor).length = 32 := by
  rfl

private theorem clockZero_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .clockZero).length = 66 := by
  rfl

private theorem fuelSuccessor_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .fuelSuccessor).length = 43 := by
  rfl

private theorem fuelZero_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .fuelZero).length = 82 := by
  rfl

private theorem downLiveZero_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .downLiveZero).length = 122 := by
  rfl

private theorem downLiveOne_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .downLiveOne).length = 146 := by
  rfl

private theorem downTombstoneZero_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .downTombstoneZero).length = 115 := by
  rfl

private theorem downTombstoneOne_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .downTombstoneOne).length = 139 := by
  rfl

private theorem downLocal_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .downLocal).length = 45 := by
  rfl

private theorem downBase_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .downBase).length = 48 := by
  rfl

private theorem pending_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (use : PendingUse) :
    (probePCStates program dispatcher (.pending use)).length = 119 := by
  cases use <;> rfl

private theorem growWrapper_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .growWrapper).length = 26 := by
  rfl

private theorem growEnvelope_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (probePCStates program dispatcher .growEnvelope).length = 101 := by
  rfl

private theorem upLiveZero_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (side : Direction) :
    (probePCStates program dispatcher (.upLiveZero side)).length = 122 := by
  cases side <;> rfl

private theorem upLiveOne_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (side : Direction) :
    (probePCStates program dispatcher (.upLiveOne side)).length = 146 := by
  cases side <;> rfl

private theorem upRegistered_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (side : Direction) :
    (probePCStates program dispatcher (.upRegistered side)).length = 7 := by
  cases side <;> rfl

private theorem arityThree_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (use : ArityUse) :
    (probePCStates program dispatcher (.arityThree use)).length = 27 := by
  cases use <;> rfl

private theorem arityFour_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (use : ArityUse) :
    (probePCStates program dispatcher (.arityFour use)).length = 37 := by
  cases use <;> rfl

private theorem baseProbeTemplateCount_eq (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    ((baseProbeKinds program dispatcher).map fun kind =>
      (probePCStates program dispatcher kind).length).sum = 2064 := by
  simp only [baseProbeKinds, List.map_cons, List.map_nil, List.sum_cons,
    List.sum_nil,
    clockSuccessor_probePCStates_length, clockZero_probePCStates_length,
    fuelSuccessor_probePCStates_length, fuelZero_probePCStates_length,
    downLiveZero_probePCStates_length, downLiveOne_probePCStates_length,
    downTombstoneZero_probePCStates_length,
    downTombstoneOne_probePCStates_length,
    downLocal_probePCStates_length, downBase_probePCStates_length,
    pending_probePCStates_length, growWrapper_probePCStates_length,
    growEnvelope_probePCStates_length, upLiveZero_probePCStates_length,
    upLiveOne_probePCStates_length, upRegistered_probePCStates_length,
    arityThree_probePCStates_length, arityFour_probePCStates_length]
  decide

private theorem routeLeft_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (node : CodeNode dispatcher) :
    (probePCStates program dispatcher (.routeLeft node)).length = 57 := by
  rfl

private theorem routeRight_probePCStates_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (node : CodeNode dispatcher) :
    (probePCStates program dispatcher (.routeRight node)).length = 57 := by
  rfl

private theorem flatMap_pair_sum (values : List α)
    (left right : α → Nat) (leftCount rightCount : Nat)
    (hleft : ∀ value ∈ values, left value = leftCount)
    (hright : ∀ value ∈ values, right value = rightCount) :
    (values.flatMap fun value => [left value, right value]).sum =
      (leftCount + rightCount) * values.length := by
  induction values with
  | nil => simp
  | cons first rest ih =>
      rw [List.flatMap_cons, sum_append_nat,
        hleft first (List.Mem.head rest),
        hright first (List.Mem.head rest),
        ih (fun value hvalue => hleft value (List.Mem.tail first hvalue))
          (fun value hvalue => hright value (List.Mem.tail first hvalue)),
        List.length_cons, Nat.mul_succ]
      exact Nat.add_comm _ _

private theorem routeProbeTemplateCount_eq
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (nodes : List (CodeNode dispatcher)) →
      (((nodes.flatMap fun node =>
        [.routeLeft node, .routeRight node]).map fun kind =>
          (probePCStates program dispatcher kind).length).sum) =
        114 * nodes.length
  | [] => rfl
  | node :: nodes => by
      rw [List.map_flatMap]
      change (((node :: nodes).flatMap fun item =>
        [(probePCStates program dispatcher (.routeLeft item)).length,
          (probePCStates program dispatcher (.routeRight item)).length]).sum) = _
      exact flatMap_pair_sum (node :: nodes)
          (fun item => (probePCStates program dispatcher (.routeLeft item)).length)
          (fun item => (probePCStates program dispatcher (.routeRight item)).length)
          57 57
          (fun item _ => routeLeft_probePCStates_length program dispatcher item)
          (fun item _ => routeRight_probePCStates_length program dispatcher item)

theorem probeTemplateCount_eq (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    probeTemplateCount program dispatcher =
      2064 + 114 * (codeNodeStates dispatcher).length := by
  rw [probeTemplateCount, probeKindStates_eq, List.map_append,
    sum_append_nat, baseProbeTemplateCount_eq,
    routeProbeTemplateCount_eq]

/-! ## Selected-route depth sum -/

private theorem mem_map_clean_elim (function : α → β)
    {target : β} : (values : List α) →
    target ∈ values.map function →
      ∃ value, value ∈ values ∧ function value = target
  | [], hmem => nomatch hmem
  | first :: rest, hmem => by
      rcases List.mem_cons.mp hmem with hfirst | hrest
      · exact ⟨first, List.Mem.head rest, hfirst.symm⟩
      · obtain ⟨value, hvalue, heq⟩ :=
          mem_map_clean_elim function rest hrest
        exact ⟨value, List.Mem.tail first hvalue, heq⟩

private theorem mem_map_clean_intro (function : α → β)
    {value : α} : (values : List α) →
    value ∈ values → function value ∈ values.map function
  | [], hmem => nomatch hmem
  | first :: rest, hmem => by
      rcases List.mem_cons.mp hmem with hfirst | hrest
      · exact List.mem_cons.mpr (Or.inl (congrArg function hfirst))
      · exact List.mem_cons.mpr
          (Or.inr (mem_map_clean_intro function rest hrest))

private theorem map_congr_left_clean (left right : α → β) :
    (values : List α) →
    (∀ value ∈ values, left value = right value) →
      values.map left = values.map right
  | [], _ => rfl
  | first :: rest, heq => by
      rw [List.map_cons, List.map_cons,
        heq first (List.Mem.head rest)]
      exact congrArg (List.cons (right first))
        (map_congr_left_clean left right rest
          (fun value hvalue => heq value (List.Mem.tail first hvalue)))

private theorem hasRoute_mem_routes_clean
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (hroute : Dispatcher.HasRoute tree route label) :
    (route, label) ∈ tree.routes := by
  induction hroute with
  | leaf => exact List.Mem.head []
  | @left route label left right hroute ih =>
      apply List.mem_append.mpr
      exact Or.inl (mem_map_clean_intro
        (fun entry => (.left :: entry.1, entry.2)) left.routes ih)
  | @right route label left right hroute ih =>
      apply List.mem_append.mpr
      exact Or.inr (mem_map_clean_intro
        (fun entry => (.right :: entry.1, entry.2)) right.routes ih)

private theorem nodup_map_of_injective (function : α → β)
    (hinjective : ∀ ⦃left right⦄,
      function left = function right → left = right) :
    (values : List α) → values.Nodup → (values.map function).Nodup
  | [], _ => by simp
  | first :: rest, hnodup => by
      simp only [List.map_cons]
      rw [List.nodup_cons] at hnodup ⊢
      constructor
      · intro hmem
        obtain ⟨value, hvalue, heq⟩ :=
          mem_map_clean_elim function rest hmem
        exact hnodup.1 (hinjective heq.symm ▸ hvalue)
      · exact nodup_map_of_injective function hinjective rest hnodup.2

private theorem map_finFoldr (mapFn : α → β) :
    (n : Nat) → (values : Fin n → α) →
      (Fin.foldr n (fun index result => values index :: result) []).map mapFn =
        Fin.foldr n (fun index result => mapFn (values index) :: result) []
  | 0, values => rfl
  | n + 1, values => by
      rw [Fin.foldr_succ, Fin.foldr_succ, List.map_cons,
        map_finFoldr mapFn n (fun index => values index.succ)]

private theorem finRange_succ_clean (n : Nat) :
    List.finRange (n + 1) =
      (0 : Fin (n + 1)) :: (List.finRange n).map Fin.succ := by
  unfold List.finRange List.ofFn
  rw [Fin.foldr_succ]
  apply congrArg (List.cons (0 : Fin (n + 1)))
  exact (map_finFoldr Fin.succ n (fun index => index)).symm

private theorem finRange_nodup : (period : Nat) →
    (List.finRange period).Nodup
  | 0 => by simp
  | period + 1 => by
      rw [finRange_succ_clean, List.nodup_cons]
      constructor
      · intro hmem
        obtain ⟨phase, _, heq⟩ :=
          mem_map_clean_elim Fin.succ _ hmem
        have hval := congrArg Fin.val heq
        simp at hval
      · exact nodup_map_of_injective Fin.succ (by
          intro left right heq
          apply Fin.ext
          have hval := congrArg Fin.val heq
          simp at hval
          exact hval) _
          (finRange_nodup period)

private theorem phase_mem_of_phaseAction_mem
    {phase : Fin period} {bit : Bool} {phases : List (Fin period)}
    (hmem : (phase, bit) ∈ phaseActions phases) : phase ∈ phases := by
  induction phases with
  | nil => cases hmem
  | cons first rest ih =>
      simp only [phaseActions, List.mem_cons] at hmem ⊢
      rcases hmem with hfirst | hsecond | hrest
      · exact Or.inl (congrArg Prod.fst hfirst)
      · exact Or.inl (congrArg Prod.fst hsecond)
      · exact Or.inr (ih hrest)

private theorem phaseActions_nodup
    (phases : List (Fin period)) (hnodup : phases.Nodup) :
    (phaseActions phases).Nodup := by
  induction phases with
  | nil => simp [phaseActions]
  | cons phase phases ih =>
      rw [List.nodup_cons] at hnodup
      have hfalse : (phase, false) ∉ phaseActions phases := by
        intro hmem
        exact hnodup.1 (phase_mem_of_phaseAction_mem hmem)
      have htrue : (phase, true) ∉ phaseActions phases := by
        intro hmem
        exact hnodup.1 (phase_mem_of_phaseAction_mem hmem)
      simp only [phaseActions, List.nodup_cons]
      constructor
      · simp [hfalse]
      · exact ⟨htrue, ih hnodup.2⟩

private theorem allActionLabels_nodup (program : CTS.Program) :
    (allActionLabels program).Nodup := by
  exact phaseActions_nodup _ (finRange_nodup program.period)

private theorem eq_of_nodup_map
    (function : α → β) {values : List α}
    (hnodup : (values.map function).Nodup)
    {left right : α} (hleft : left ∈ values) (hright : right ∈ values)
    (heq : function left = function right) : left = right := by
  induction values with
  | nil => cases hleft
  | cons first rest ih =>
      simp only [List.map_cons] at hnodup
      rw [List.nodup_cons] at hnodup
      rcases List.mem_cons.mp hleft with hleftFirst | hleftRest
      · rcases List.mem_cons.mp hright with hrightFirst | hrightRest
        · exact hleftFirst.trans hrightFirst.symm
        · exact False.elim (hnodup.1 (by
            have hrightMap := mem_map_clean_intro function rest hrightRest
            have hsame : function first = function right :=
              (congrArg function hleftFirst).symm.trans heq
            rw [hsame]
            exact hrightMap))
      · rcases List.mem_cons.mp hright with hrightFirst | hrightRest
        · exact False.elim (hnodup.1 (by
            have hleftMap := mem_map_clean_intro function rest hleftRest
            have hsame : function left = function first :=
              heq.trans (congrArg function hrightFirst)
            rw [← hsame]
            exact hleftMap))
        · exact ih hnodup.2 hleftRest hrightRest

private theorem routes_map_snd (tree : Dispatcher.Tree Label) :
    tree.routes.map Prod.snd = tree.leaves := by
  induction tree with
  | leaf label => rfl
  | node left right ihLeft ihRight =>
      simp only [Dispatcher.Tree.routes, List.map_append,
        Dispatcher.Tree.leaves, List.map_map]
      rw [← ihLeft, ← ihRight]
      rfl

/-- Sum of all root-to-leaf edge counts, computed structurally. -/
def treeRouteDepthSum : Dispatcher.Tree Label → Nat
  | .leaf _ => 0
  | .node left right =>
      treeRouteDepthSum left + left.leafCount +
        treeRouteDepthSum right + right.leafCount

private theorem sum_map_succ (values : List α) (measure : α → Nat) :
    (values.map fun value => measure value + 1).sum =
      (values.map measure).sum + values.length := by
  induction values with
  | nil => simp
  | cons first rest ih =>
      simp only [List.map_cons, List.sum_cons, List.length_cons, ih]
      simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

private theorem prefixedRouteDepthSum (direction : Direction)
    (routes : List (Dispatcher.Route × Label)) :
    ((routes.map fun entry => (direction :: entry.1, entry.2)).map
      fun entry => entry.1.length).sum =
      (routes.map fun entry => entry.1.length).sum + routes.length := by
  rw [List.map_map]
  exact sum_map_succ routes (fun entry => entry.1.length)

private theorem routes_depth_sum (tree : Dispatcher.Tree Label) :
    (tree.routes.map fun entry => entry.1.length).sum =
      treeRouteDepthSum tree := by
  induction tree with
  | leaf label => rfl
  | node left right ihLeft ihRight =>
      simp only [Dispatcher.Tree.routes, List.map_append, sum_append_nat,
        prefixedRouteDepthSum, ihLeft, ihRight,
        Dispatcher.Tree.routes_length, treeRouteDepthSum]
      simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

private theorem selectedRoute_eq_of_mem_routes
    (program : CTS.Program)
    {entry : Dispatcher.Route × ActionLabel program}
    (hentry : entry ∈ (BalancedActionTree.tree program).routes) :
    (BalancedActionTree.route program entry.2) = entry.1 := by
  have heq :
      (BalancedActionTree.route program entry.2, entry.2) = entry := by
    apply eq_of_nodup_map Prod.snd
      (values := (BalancedActionTree.tree program).routes)
    · rw [routes_map_snd, BalancedActionTree.tree_leaves]
      exact allActionLabels_nodup program
    · exact hasRoute_mem_routes_clean
        (BalancedActionTree.route_valid program entry.2)
    · exact hentry
    · rfl
  exact congrArg Prod.fst heq

theorem selectedRouteDepthSum_eq (program : CTS.Program) :
    ((allActionLabels program).map fun label =>
      (BalancedActionTree.route program label).length).sum =
      treeRouteDepthSum (BalancedActionTree.tree program) := by
  change ((BalancedActionTree.labels program).map fun label =>
      (BalancedActionTree.route program label).length).sum = _
  rw [← BalancedActionTree.tree_leaves, ← routes_map_snd, List.map_map,
    ← routes_depth_sum]
  apply congrArg List.sum
  apply map_congr_left_clean
  intro entry hentry
  change (BalancedActionTree.route program entry.2).length = entry.1.length
  rw [selectedRoute_eq_of_mem_routes program hentry]

/-! ## Script-PC arithmetic -/

private theorem forward_length (route : Dispatcher.Route) :
    (PrimitiveRoute.forward route).length = 4 * route.length + 2 := by
  induction route with
  | nil => rfl
  | cons direction rest ih =>
      cases direction <;>
        simp only [PrimitiveRoute.forward, List.length_append,
          List.length_cons, PrimitiveScripts.nodeLeft,
          PrimitiveScripts.nodeRight, List.length_nil, ih] <;>
        simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

private theorem backward_length (route : Dispatcher.Route) :
    (PrimitiveRoute.backward route).length = 2 * route.length + 1 := by
  induction route with
  | nil => rfl
  | cons direction rest ih =>
      simp only [PrimitiveRoute.backward, List.length_append,
        List.length_cons, List.length_nil, ih]
      simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

private theorem actionDescent_length_pos (first : Bool) (rest : List Bool) :
    (PrimitiveScripts.actionDescent (first :: rest)).length + 1 =
      3 * (first :: rest).length := by
  induction rest generalizing first with
  | nil => rfl
  | cons next rest ih =>
      simp only [PrimitiveScripts.actionDescent, List.length_append,
        List.length_cons, List.length_nil]
      have hnext := ih next
      simpa [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        using congrArg (Nat.add 3) hnext

private theorem actionReturn_length_pos (first : Bool) (rest : List Bool) :
    (PrimitiveScripts.actionReturn (first :: rest)).length + 1 =
      (first :: rest).length := by
  induction rest generalizing first with
  | nil => rfl
  | cons next rest ih =>
      simp only [PrimitiveScripts.actionReturn, List.length_append,
        List.length_cons, List.length_nil]
      have hnext := ih next
      simpa [Nat.add_assoc] using congrArg (Nat.add 1) hnext

private theorem action_length_pos (first : Bool) (rest : List Bool) :
    (PrimitiveScripts.action (first :: rest)).length + 2 =
      4 * (first :: rest).length := by
  rw [PrimitiveScripts.action, List.length_append]
  have hdescent := actionDescent_length_pos first rest
  have hreturn := actionReturn_length_pos first rest
  calc
    (PrimitiveScripts.actionDescent (first :: rest)).length +
          (PrimitiveScripts.actionReturn (first :: rest)).length + 2 =
        ((PrimitiveScripts.actionDescent (first :: rest)).length + 1) +
          ((PrimitiveScripts.actionReturn (first :: rest)).length + 1) := by
            simp only [show 2 = 1 + 1 from rfl, Nat.add_assoc,
              Nat.add_comm, Nat.add_left_comm]
    _ = 3 * (first :: rest).length + (first :: rest).length := by
      rw [hdescent, hreturn]
    _ = 4 * (first :: rest).length := by
      rw [show 4 = 3 + 1 from rfl, Nat.add_mul, Nat.one_mul]

private theorem execute_length_empty (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program)
    (hempty : PrimitiveLocalResponse.emitted program label = []) :
    (PrimitiveLocalResponse.execute program route label).length =
      14 + 6 * route.length := by
  simp only [PrimitiveLocalResponse.execute, List.length_append,
    hempty]
  have hframe : PrimitiveScripts.framePrefixScript.length = 8 := rfl
  have haction : (PrimitiveScripts.action []).length = 0 := rfl
  have hlocal : PrimitiveLocalResponse.localReturn.length = 3 := rfl
  rw [hframe, haction, hlocal, forward_length, backward_length]
  have hconstant : 8 + 2 + 1 + 3 = 14 := by decide
  have hcoefficient : 4 * route.length + 2 * route.length =
      6 * route.length := by
    rw [← Nat.add_mul]
  calc
    8 + (4 * route.length + 2) + 0 +
          (2 * route.length + 1) + 3 =
        (8 + 2 + 1 + 3) +
          (4 * route.length + 2 * route.length) := by
      simp only [Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]
    _ = 14 + 6 * route.length := by rw [hconstant, hcoefficient]

private theorem execute_length_nonempty (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program)
    (first : Bool) (rest : List Bool)
    (hemitted : PrimitiveLocalResponse.emitted program label = first :: rest) :
    (PrimitiveLocalResponse.execute program route label).length + 2 =
      14 + 6 * route.length +
        4 * (PrimitiveLocalResponse.emitted program label).length := by
  simp only [PrimitiveLocalResponse.execute, List.length_append,
    List.length_cons]
  have hframe : PrimitiveScripts.framePrefixScript.length = 8 := rfl
  have hlocal : PrimitiveLocalResponse.localReturn.length = 3 := rfl
  rw [hframe, hlocal]
  rw [forward_length, backward_length, hemitted]
  have haction := action_length_pos first rest
  have hconstant : 8 + 2 + 1 + 3 = 14 := by decide
  have hcoefficient : 4 * route.length + 2 * route.length =
      6 * route.length := by
    rw [← Nat.add_mul]
  calc
    (8 + (4 * route.length + 2) +
          (PrimitiveScripts.action (first :: rest)).length +
          (2 * route.length + 1) + 3) + 2 =
        (8 + 2 + 1 + 3) +
          (4 * route.length + 2 * route.length) +
          ((PrimitiveScripts.action (first :: rest)).length + 2) := by
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ = 14 + 6 * route.length + 4 * (first :: rest).length := by
      rw [hconstant, hcoefficient, haction]
    _ = 14 + 6 * route.length + 4 * (first :: rest).length := rfl

private def labelScriptTemplateCount (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (label : ActionLabel program) : Nat :=
  (scriptPCStates program dispatcher (.accumulator label)).length +
  (scriptPCStates program dispatcher (.normalResponse label)).length +
  (scriptPCStates program dispatcher (.emptyResponse label)).length

private theorem accumulatorScript_length (program : CTS.Program)
    (label : ActionLabel program) :
    (accumulatorScript program label).length =
      (PrimitiveLocalResponse.emitted program label).length + 1 := by
  simp [accumulatorScript]

private theorem labelScriptTemplateCount_empty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program)
    (hempty : PrimitiveLocalResponse.emitted program label = []) :
    labelScriptTemplateCount program dispatcher label =
      32 + 12 * (dispatcher.route label).length := by
  rw [labelScriptTemplateCount, scriptPCStates_length,
    scriptPCStates_length, scriptPCStates_length]
  simp only [jobScript, accumulatorScript_length, hempty, List.length_nil]
  rw [execute_length_empty program _ label hempty]
  simp only [Nat.zero_add]
  have hconstant : 1 + 1 + 1 + 1 + 14 + 14 = 32 := by decide
  have hcoefficient :
      6 * (dispatcher.route label).length +
          6 * (dispatcher.route label).length =
        12 * (dispatcher.route label).length := by
    rw [← Nat.add_mul]
  calc
    1 + 1 + (14 + 6 * (dispatcher.route label).length + 1) +
          (14 + 6 * (dispatcher.route label).length + 1) =
        (1 + 1 + 1 + 1 + 14 + 14) +
          (6 * (dispatcher.route label).length +
            6 * (dispatcher.route label).length) := by
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ = 32 + 12 * (dispatcher.route label).length := by
      rw [hconstant, hcoefficient]

private theorem labelScriptTemplateCount_nonempty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (first : Bool) (rest : List Bool)
    (hemitted : PrimitiveLocalResponse.emitted program label = first :: rest) :
    labelScriptTemplateCount program dispatcher label + 4 =
      32 + 12 * (dispatcher.route label).length +
        9 * (PrimitiveLocalResponse.emitted program label).length := by
  rw [labelScriptTemplateCount, scriptPCStates_length,
    scriptPCStates_length, scriptPCStates_length]
  simp only [jobScript, accumulatorScript_length]
  have hexecute := execute_length_nonempty program
    (dispatcher.route label) label first rest hemitted
  have hexecute' :
      (PrimitiveLocalResponse.execute program
          (dispatcher.route label) label).length + (1 + 1) =
        14 + 6 * (dispatcher.route label).length +
          4 * (PrimitiveLocalResponse.emitted program label).length := by
    simpa only [show 2 = 1 + 1 from rfl] using hexecute
  calc
    (PrimitiveLocalResponse.emitted program label).length + 1 + 1 +
          (PrimitiveLocalResponse.execute program
            (dispatcher.route label) label).length + 1 +
          ((PrimitiveLocalResponse.execute program
            (dispatcher.route label) label).length + 1) + 4 =
        (PrimitiveLocalResponse.emitted program label).length + 4 +
          ((PrimitiveLocalResponse.execute program
            (dispatcher.route label) label).length + (1 + 1)) +
          ((PrimitiveLocalResponse.execute program
            (dispatcher.route label) label).length + (1 + 1)) := by
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ = (PrimitiveLocalResponse.emitted program label).length + 4 +
          (14 + 6 * (dispatcher.route label).length +
            4 * (PrimitiveLocalResponse.emitted program label).length) +
          (14 + 6 * (dispatcher.route label).length +
            4 * (PrimitiveLocalResponse.emitted program label).length) := by
      rw [hexecute']
    _ = 32 + 12 * (dispatcher.route label).length +
          9 * (PrimitiveLocalResponse.emitted program label).length := by
      have hroute :
          6 * (dispatcher.route label).length +
              6 * (dispatcher.route label).length =
            12 * (dispatcher.route label).length := by
        rw [← Nat.add_mul]
      have hemits :
          (PrimitiveLocalResponse.emitted program label).length +
              4 * (PrimitiveLocalResponse.emitted program label).length +
              4 * (PrimitiveLocalResponse.emitted program label).length =
            9 * (PrimitiveLocalResponse.emitted program label).length := by
        calc
          _ = (1 + 4 + 4) *
              (PrimitiveLocalResponse.emitted program label).length := by
                rw [Nat.add_mul, Nat.add_mul, Nat.one_mul]
          _ = 9 * (PrimitiveLocalResponse.emitted program label).length := rfl
      have hconstant : 4 + 14 + 14 = 32 := by decide
      rw [← hconstant, ← hroute, ← hemits]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

private def nonemptyEmissionIndicator (program : CTS.Program)
    (label : ActionLabel program) : Nat :=
  match PrimitiveLocalResponse.emitted program label with
  | [] => 0
  | _ :: _ => 1

private theorem labelScriptTemplateCount_balance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) :
    labelScriptTemplateCount program dispatcher label +
        4 * nonemptyEmissionIndicator program label =
      32 + 12 * (dispatcher.route label).length +
        9 * (PrimitiveLocalResponse.emitted program label).length := by
  generalize hemitted : PrimitiveLocalResponse.emitted program label = emitted
  cases emitted with
  | nil =>
      simpa [nonemptyEmissionIndicator, hemitted] using
        labelScriptTemplateCount_empty program dispatcher label hemitted
  | cons first rest =>
      simpa [nonemptyEmissionIndicator, hemitted] using
        labelScriptTemplateCount_nonempty program dispatcher label
          first rest hemitted

private theorem labelScriptTemplateCount_sum_balance
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (labels : List (ActionLabel program)) →
      (labels.map (labelScriptTemplateCount program dispatcher)).sum +
          4 * (labels.map (nonemptyEmissionIndicator program)).sum =
        32 * labels.length +
          12 * (labels.map fun label => (dispatcher.route label).length).sum +
          9 * (labels.map fun label =>
            (PrimitiveLocalResponse.emitted program label).length).sum
  | [] => by simp
  | label :: labels => by
      simp only [List.map_cons, List.sum_cons, List.length_cons]
      have hlabel := labelScriptTemplateCount_balance program dispatcher label
      have hrest := labelScriptTemplateCount_sum_balance program dispatcher labels
      calc
        labelScriptTemplateCount program dispatcher label +
              (labels.map
                (labelScriptTemplateCount program dispatcher)).sum +
              4 * (nonemptyEmissionIndicator program label +
                (labels.map
                  (nonemptyEmissionIndicator program)).sum) =
            (labelScriptTemplateCount program dispatcher label +
                4 * nonemptyEmissionIndicator program label) +
              ((labels.map
                    (labelScriptTemplateCount program dispatcher)).sum +
                4 * (labels.map
                  (nonemptyEmissionIndicator program)).sum) := by
            simp [Nat.mul_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        _ = (32 + 12 * (dispatcher.route label).length +
              9 * (PrimitiveLocalResponse.emitted program label).length) +
            (32 * labels.length +
              12 * (labels.map fun item =>
                (dispatcher.route item).length).sum +
              9 * (labels.map fun item =>
                (PrimitiveLocalResponse.emitted program item).length).sum) := by
            rw [hlabel, hrest]
        _ = 32 * (labels.length + 1) +
              12 * ((dispatcher.route label).length +
                (labels.map fun item =>
                  (dispatcher.route item).length).sum) +
              9 * ((PrimitiveLocalResponse.emitted program label).length +
                (labels.map fun item =>
                  (PrimitiveLocalResponse.emitted program item).length).sum) := by
            simp [Nat.mul_succ, Nat.mul_add, Nat.add_assoc, Nat.add_comm,
              Nat.add_left_comm]

private def baseScriptJobs (program : CTS.Program) :
    List (ScriptJob program) :=
  [.clockEnter, .clockPositive, .clockZero, .fuelPositive, .fuelZero,
    .downLive, .downTombstone, .downLocal, .downBase, .markNormal,
    .markEmpty, .continuation]

private theorem scriptJobStates_eq (program : CTS.Program) :
    scriptJobStates program = baseScriptJobs program ++
      (allActionLabels program).flatMap fun label =>
        [.accumulator label, .normalResponse label, .emptyResponse label] :=
  rfl

private theorem baseScriptTemplateCount_eq (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    ((baseScriptJobs program).map fun job =>
      (scriptPCStates program dispatcher job).length).sum = 61 := by
  rfl

private theorem sum_map_flatMap_triple (values : List α)
    (first second third : α → β) (measure : β → Nat) :
    ((values.flatMap fun value =>
      [first value, second value, third value]).map measure).sum =
    (values.map fun value =>
      measure (first value) + measure (second value) +
        measure (third value)).sum := by
  induction values with
  | nil => rfl
  | cons value values ih =>
      rw [List.flatMap_cons, List.map_append, sum_append_nat,
        List.map_cons, List.sum_cons, ih]
      change
        (measure (first value) +
            (measure (second value) + measure (third value))) +
          ((values.map fun item =>
            measure (first item) + measure (second item) +
              measure (third item)).sum) =
        ((measure (first value) + measure (second value)) +
            measure (third value)) +
          ((values.map fun item =>
            measure (first item) + measure (second item) +
              measure (third item)).sum)
      exact congrArg
        (fun head => head +
          ((values.map fun item =>
            measure (first item) + measure (second item) +
              measure (third item)).sum))
        (Nat.add_assoc (measure (first value)) (measure (second value))
          (measure (third value))).symm

private theorem labelScriptTemplateCount_flatMap
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (labels : List (ActionLabel program)) →
      (((labels.flatMap fun label =>
        [.accumulator label, .normalResponse label, .emptyResponse label]).map
          fun job => (scriptPCStates program dispatcher job).length).sum) =
        (labels.map (labelScriptTemplateCount program dispatcher)).sum
  | labels =>
      sum_map_flatMap_triple labels
        (fun label => ScriptJob.accumulator label)
        (fun label => ScriptJob.normalResponse label)
        (fun label => ScriptJob.emptyResponse label)
        (fun job => (scriptPCStates program dispatcher job).length)

private theorem scriptTemplateCount_eq_labelSum (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    scriptTemplateCount program dispatcher = 61 +
      ((allActionLabels program).map
        (labelScriptTemplateCount program dispatcher)).sum := by
  rw [scriptTemplateCount, scriptJobStates_eq, List.map_append,
    sum_append_nat, baseScriptTemplateCount_eq,
    labelScriptTemplateCount_flatMap]

private theorem emittedLengthSum_phaseActions (program : CTS.Program) :
    (phases : List (CTS.Phase program)) →
      ((phaseActions phases).map fun label =>
        (PrimitiveLocalResponse.emitted program label).length).sum =
      (phases.map fun phase => (program.appendant phase).length).sum
  | [] => rfl
  | phase :: phases => by
      simp only [phaseActions, List.map_cons, List.sum_cons,
        PrimitiveLocalResponse.emitted, List.length_nil, Nat.zero_add,
        emittedLengthSum_phaseActions program phases]
      exact congrArg (Nat.add (program.appendant phase).length)
        (emittedLengthSum_phaseActions program phases)

private def nonemptyListIndicator (values : List α) : Nat :=
  match values with
  | [] => 0
  | _ :: _ => 1

private theorem nonemptyEmissionSum_phaseActions (program : CTS.Program) :
    (phases : List (CTS.Phase program)) →
      ((phaseActions phases).map
        (nonemptyEmissionIndicator program)).sum =
      (phases.map fun phase =>
        nonemptyListIndicator (program.appendant phase)).sum
  | [] => rfl
  | phase :: phases => by
      generalize happendant : program.appendant phase = appendant
      cases appendant with
      | nil =>
          simpa [phaseActions, nonemptyEmissionIndicator,
            nonemptyListIndicator, PrimitiveLocalResponse.emitted,
            happendant] using
            nonemptyEmissionSum_phaseActions program phases
      | cons first rest =>
          simpa [phaseActions, nonemptyEmissionIndicator,
            nonemptyListIndicator, PrimitiveLocalResponse.emitted,
            happendant] using
            congrArg (Nat.add 1)
              (nonemptyEmissionSum_phaseActions program phases)

private theorem sum_map_finFoldr (measure : α → Nat) :
    (n : Nat) → (values : Fin n → α) →
      ((Fin.foldr n (fun index result => values index :: result) []).map
        measure).sum =
      Fin.foldr n (fun index result => measure (values index) + result) 0
  | 0, values => rfl
  | n + 1, values => by
      rw [Fin.foldr_succ, List.map_cons, List.sum_cons, Fin.foldr_succ,
        sum_map_finFoldr measure n (fun index => values index.succ)]

private theorem finFoldr_get_sum (measure : α → Nat) :
    (values : List α) →
      Fin.foldr values.length
          (fun index result => measure (values.get index) + result) 0 =
        (values.map measure).sum
  | [] => rfl
  | first :: rest => by
      change Fin.foldr (rest.length + 1)
          (fun index result => measure ((first :: rest).get index) + result) 0 =
        (List.map measure (first :: rest)).sum
      rw [Fin.foldr_succ, List.map_cons, List.sum_cons]
      change measure first +
          Fin.foldr rest.length
            (fun index result => measure (rest.get index) + result) 0 =
        measure first + (rest.map measure).sum
      rw [finFoldr_get_sum measure rest]

private theorem finRange_get_sum (values : List α) (measure : α → Nat) :
    ((List.finRange values.length).map fun index =>
      measure (values.get index)).sum =
        (values.map measure).sum := by
  unfold List.finRange List.ofFn
  rw [sum_map_finFoldr (fun index => measure (values.get index))
      values.length (fun index => index),
    finFoldr_get_sum measure values]

private theorem finRange_cast_get_sum (values : List α) (measure : α → Nat)
    (period : Nat) (hlength : values.length = period) :
    ((List.finRange period).map fun index =>
      measure (values.get (Fin.cast hlength.symm index))).sum =
        (values.map measure).sum :=
  match hlength with
  | rfl => finRange_get_sum values measure

/-! ## Fixed Cook scheduler certificate -/

/-- The canonical Cook register cover has 912 phases and 24 Boolean tuples. -/
theorem cook_registerCoverEntryCount :
    (registerStates Cook.rogozhinCookProgram).length = 21888 := by
  rw [registerStates]
  rw [length_flatMap_const_of_length _ _ 24]
  · rw [List.length_finRange]
    rfl
  · intro phase hphase
    rw [length_flatMap_const_of_length _ _ 8]
    · rfl
    · intro bit hbit
      rw [length_flatMap_const_of_length _ _ 4]
      · rfl
      · intro seen hseen
        rw [length_flatMap_const_of_length _ _ 2]
        · rfl
        · intro tail htail
          rw [List.length_map]
          rfl

private theorem balanced_codeNodeStates_length (program : CTS.Program) :
    (codeNodeStates (BalancedActionTree.dispatcher program)).length + 1 =
      4 * program.period := by
  have hnodes := codeNodeStates_length (BalancedActionTree.dispatcher program)
  rw [BalancedActionTree.dispatcher_tree,
    BalancedActionTree.tree_leafCount] at hnodes
  simpa only [← Nat.mul_assoc] using hnodes

/-- The paired 1,824-leaf dispatcher contributes 3,647 subtree identifiers. -/
theorem cook_codeNodeCoverEntryCount :
    (codeNodeStates
      (BalancedActionTree.dispatcher Cook.rogozhinCookProgram)).length =
        3647 := by
  apply Nat.add_right_cancel (m := 1)
  exact balanced_codeNodeStates_length Cook.rogozhinCookProgram

/-- Exact macro-mode template count before register multiplication. -/
theorem cook_macroTemplateCount :
    (macroStates Cook.rogozhinCookProgram
      (BalancedActionTree.dispatcher Cook.rogozhinCookProgram)).length =
        10970 := by
  rw [macroStates_length, cook_codeNodeCoverEntryCount]

/-- Exact probe-PC template count before register multiplication. -/
theorem cook_probeTemplateCount :
    probeTemplateCount Cook.rogozhinCookProgram
      (BalancedActionTree.dispatcher Cook.rogozhinCookProgram) = 417822 := by
  rw [probeTemplateCount_eq, cook_codeNodeCoverEntryCount]

private def routeSummary (tree : Dispatcher.Tree Label) : Nat × Nat :=
  (tree.leafCount, treeRouteDepthSum tree)

private def mergeRouteSummary (left right : Nat × Nat) : Nat × Nat :=
  (left.1 + right.1, left.2 + left.1 + right.2 + right.1)

private def routeSummaryRound : List (Nat × Nat) → List (Nat × Nat)
  | [] => []
  | [item] => [item]
  | first :: second :: rest =>
      mergeRouteSummary first second :: routeSummaryRound rest

private def routeSummaryCollapse (fallback : Nat × Nat) :
    Nat → List (Nat × Nat) → Nat × Nat
  | 0, _ => fallback
  | _ + 1, [] => fallback
  | _ + 1, [item] => item
  | fuel + 1, first :: second :: rest =>
      routeSummaryCollapse fallback fuel
        (routeSummaryRound (first :: second :: rest))

private theorem routeSummary_pairRound :
    (forest : List (Dispatcher.Tree Label)) →
      (BalancedActionTree.pairRound forest).map routeSummary =
        routeSummaryRound (forest.map routeSummary)
  | [] => rfl
  | [_] => rfl
  | first :: second :: rest => by
      simp only [BalancedActionTree.pairRound, List.map_cons,
        routeSummaryRound, routeSummary, Dispatcher.Tree.leafCount,
        treeRouteDepthSum, mergeRouteSummary]
      exact congrArg (List.cons _) (routeSummary_pairRound rest)

private theorem routeSummary_collapse (fallback : Dispatcher.Tree Label) :
    (fuel : Nat) → (forest : List (Dispatcher.Tree Label)) →
      routeSummary (BalancedActionTree.collapse fallback fuel forest) =
        routeSummaryCollapse (routeSummary fallback) fuel (forest.map routeSummary)
  | 0, _ => rfl
  | _ + 1, [] => rfl
  | _ + 1, [_] => rfl
  | fuel + 1, first :: second :: rest => by
      change routeSummary (BalancedActionTree.collapse fallback fuel
          (BalancedActionTree.pairRound (first :: second :: rest))) = _
      rw [routeSummary_collapse, routeSummary_pairRound]
      rfl

private theorem routeSummaryRound_replicate (item : Nat × Nat) :
    (count : Nat) → routeSummaryRound (List.replicate (2 * count) item) =
      List.replicate count (mergeRouteSummary item item)
  | 0 => rfl
  | count + 1 => by
      rw [Nat.mul_succ]
      simp only [show 2 * count + 2 = (2 * count + 1) + 1 from rfl,
        List.replicate_succ, routeSummaryRound, routeSummaryRound_replicate]

private theorem routeSummaryCollapse_even (fallback item : Nat × Nat)
    (fuel count : Nat) :
    routeSummaryCollapse fallback (fuel + 1)
        (List.replicate (2 * (count + 1)) item) =
      routeSummaryCollapse fallback fuel
        (List.replicate (count + 1) (mergeRouteSummary item item)) := by
  conv => lhs; rw [Nat.mul_succ]
  simp only [show 2 * count + 2 = (2 * count + 1) + 1 from rfl,
    List.replicate_succ, routeSummaryCollapse, routeSummaryRound,
    routeSummaryRound_replicate]

private theorem routeSummary_map_leaf : (labels : List Label) →
    (labels.map Dispatcher.Tree.leaf).map routeSummary =
      List.replicate labels.length (1, 0)
  | [] => rfl
  | label :: rest => by
      simp only [List.map_cons, List.length_cons, List.replicate_succ,
        routeSummary, Dispatcher.Tree.leafCount, treeRouteDepthSum]
      exact congrArg (List.cons (1, 0)) (routeSummary_map_leaf rest)

private theorem routeSummary_tree (program : CTS.Program) :
    routeSummary (BalancedActionTree.tree program) =
      routeSummaryCollapse (1, 0) (2 * program.period)
        (List.replicate (2 * program.period) (1, 0)) := by
  unfold BalancedActionTree.tree BalancedActionTree.ofList
  rw [routeSummary_collapse, routeSummary_map_leaf, BalancedActionTree.labels_length]
  rfl

private theorem cook_treeRouteDepthSum :
    treeRouteDepthSum (BalancedActionTree.tree Cook.rogozhinCookProgram) = 19968 := by
  have summary := congrArg Prod.snd (routeSummary_tree Cook.rogozhinCookProgram)
  change treeRouteDepthSum (BalancedActionTree.tree Cook.rogozhinCookProgram) =
    (routeSummaryCollapse (1, 0) 1824 (List.replicate 1824 (1, 0))).2 at summary
  rw [show 1824 = 2 * (911 + 1) from rfl] at summary
  rw [routeSummaryCollapse_even] at summary
  change treeRouteDepthSum (BalancedActionTree.tree Cook.rogozhinCookProgram) =
    (routeSummaryCollapse (1, 0) 1823 (List.replicate 912 (2, 2))).2 at summary
  rw [show 912 = 2 * (455 + 1) from rfl, routeSummaryCollapse_even] at summary
  change treeRouteDepthSum (BalancedActionTree.tree Cook.rogozhinCookProgram) =
    (routeSummaryCollapse (1, 0) 1822 (List.replicate 456 (4, 8))).2 at summary
  rw [show 456 = 2 * (227 + 1) from rfl, routeSummaryCollapse_even] at summary
  change treeRouteDepthSum (BalancedActionTree.tree Cook.rogozhinCookProgram) =
    (routeSummaryCollapse (1, 0) 1821 (List.replicate 228 (8, 24))).2 at summary
  rw [show 228 = 2 * (113 + 1) from rfl, routeSummaryCollapse_even] at summary
  change treeRouteDepthSum (BalancedActionTree.tree Cook.rogozhinCookProgram) =
    (routeSummaryCollapse (1, 0) 1820 (List.replicate 114 (16, 64))).2 at summary
  rw [show 114 = 2 * (56 + 1) from rfl, routeSummaryCollapse_even] at summary
  exact summary

/-- Sum of the 1,824 selected route lengths in the canonical paired tree. -/
theorem cook_selectedRouteDepthSum :
    ((allActionLabels Cook.rogozhinCookProgram).map fun label =>
      ((BalancedActionTree.dispatcher Cook.rogozhinCookProgram).route
        label).length).sum = 19968 := by
  change ((allActionLabels Cook.rogozhinCookProgram).map fun label =>
    (BalancedActionTree.route Cook.rogozhinCookProgram label).length).sum = _
  exact (selectedRouteDepthSum_eq Cook.rogozhinCookProgram).trans cook_treeRouteDepthSum

/-- Across both bit actions, the fixed table exposes 303,468 emitted bits. -/
theorem cook_emittedBitCount :
    ((allActionLabels Cook.rogozhinCookProgram).map fun label =>
      (PrimitiveLocalResponse.emitted Cook.rogozhinCookProgram label).length).sum =
        303468 := by
  rw [allActionLabels, emittedLengthSum_phaseActions]
  change ((List.finRange Cook.ctsPeriod).map fun phase =>
    (Cook.appendantAt phase).length).sum = _
  unfold Cook.appendantAt
  rw [finRange_cast_get_sum Cook.ctsAppendants List.length Cook.ctsPeriod
    Cook.ctsAppendants_length]
  exact Cook.total_appendant_bit_count

/-- Exactly 106 of the 1,824 phase/bit actions emit a nonempty appendant. -/
theorem cook_nonemptyEmissionCount :
    ((allActionLabels Cook.rogozhinCookProgram).map
      (nonemptyEmissionIndicator Cook.rogozhinCookProgram)).sum = 106 := by
  rw [allActionLabels, nonemptyEmissionSum_phaseActions]
  change ((List.finRange Cook.ctsPeriod).map fun phase =>
    nonemptyListIndicator (Cook.appendantAt phase)).sum = _
  unfold Cook.appendantAt
  rw [finRange_cast_get_sum Cook.ctsAppendants nonemptyListIndicator
    Cook.ctsPeriod Cook.ctsAppendants_length]
  set_option maxHeartbeats 1000000 in
    decide

/-- Exact script-PC template count before register multiplication. -/
theorem cook_scriptTemplateCount :
    scriptTemplateCount Cook.rogozhinCookProgram
      (BalancedActionTree.dispatcher Cook.rogozhinCookProgram) = 3028833 := by
  have hbalance := labelScriptTemplateCount_sum_balance
    Cook.rogozhinCookProgram
    (BalancedActionTree.dispatcher Cook.rogozhinCookProgram)
    (allActionLabels Cook.rogozhinCookProgram)
  rw [cook_nonemptyEmissionCount, length_allActionLabels,
    Cook.rogozhinCookProgram_period, cook_selectedRouteDepthSum,
    cook_emittedBitCount] at hbalance
  rw [scriptTemplateCount_eq_labelSum]
  let labelSum :=
    ((allActionLabels Cook.rogozhinCookProgram).map
      (labelScriptTemplateCount Cook.rogozhinCookProgram
        (BalancedActionTree.dispatcher Cook.rogozhinCookProgram))).sum
  have hlabelSum : labelSum = 3028772 := by
    apply Nat.add_left_cancel (n := 424)
    calc
      424 + labelSum = labelSum + 4 * 106 := by
        change 424 + labelSum = labelSum + 424
        exact Nat.add_comm _ _
      _ = 32 * 1824 + 12 * 19968 + 9 * 303468 := hbalance
      _ = 424 + 3028772 := by decide
  change 61 + labelSum = 3028833
  rw [hlabelSum]

/-- The three ordinary control-template blocks contain 3,457,625 entries. -/
theorem cook_controlTemplateCount :
    controlTemplateCount Cook.rogozhinCookProgram
      (BalancedActionTree.dispatcher Cook.rogozhinCookProgram) = 3457625 := by
  rw [controlTemplateCount_eq_components, cook_macroTemplateCount,
    cook_scriptTemplateCount, cook_probeTemplateCount]

/--
The fixed scheduler's structurally generated ordinary-state cover has
75,680,496,000 entries before deduplication.  This raw list length is not the
cardinality of `canonicalControlStates`.
-/
theorem cook_controlCoverEntryCount :
    (controlStates Cook.rogozhinCookProgram
      (BalancedActionTree.dispatcher Cook.rogozhinCookProgram)).length =
        75680496000 := by
  rw [controlStates_length_factor, cook_controlTemplateCount,
    cook_registerCoverEntryCount]

/--
Adjoining one rejecting-sink entry to the raw generated cover gives
75,680,496,001 entries.  This accounting identity is independent of both the
duplicate-free machine list and the symbolic artifact rows.
-/
theorem cook_runtimeCoverEntryCount :
    (controlStates Cook.rogozhinCookProgram
      (BalancedActionTree.dispatcher Cook.rogozhinCookProgram)).length + 1 =
        75680496001 := by
  rw [cook_controlCoverEntryCount]

end SchedulerControl

end PureSFormal.PureS
