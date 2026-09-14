import PureSFormal.PureS.Probe

/-!
# Finite-control compilation of bounded probes

`Probe.run` is a compact recursive specification.  This module gives the
operational object required by Appendix A, Lemma A.1: an explicit finite
table whose rows perform one local observation, one cursor move, or return a
Boolean answer.  The generic move row admits `Rdx`, but the pattern and parent
compilers below are proved never to emit it.

A control value is the finite syntax used to name a row.  `Table.ofControl`
materializes every reachable control value as a finite row list; execution
uses lookup in that list rather than recursively interpreting a `Pattern`.
-/

namespace PureSFormal.PureS

namespace ProbeCompiler

private theorem move_trailing_one (left right : Nat) :
    (left + right) + 1 = (left + 1) + right := by
  calc
    (left + right) + 1 = left + (right + 1) := Nat.add_assoc _ _ _
    _ = left + (1 + right) := by rw [Nat.add_comm right 1]
    _ = (left + 1) + right := (Nat.add_assoc _ _ _).symm

private theorem three_step_count (n : Nat) :
    (2 + n) + 1 = 3 + n := by
  exact move_trailing_one 2 n

private theorem five_step_count (left right : Nat) :
    ((((2 + left) + 1) + 1) + right) + 1 = 5 + left + right := by
  rw [move_trailing_one 2 left, move_trailing_one 3 left,
    move_trailing_one (4 + left) right, move_trailing_one 4 left]

private theorem four_step_count (n : Nat) :
    ((2 + n) + 1) + 1 = n + 4 := by
  rw [move_trailing_one 2 n, move_trailing_one 3 n, Nat.add_comm 4 n]

/-- One deterministic finite-control row, parameterized by its PC type. -/
inductive Instruction (PC : Type) where
  | answer (accepted : Bool)
  | observeNode (onS onApp : PC)
  | observeIncoming (onRoot onLeft onRight : PC)
  | move (operation : Primitive) (next : PC)
  deriving Repr

/--
Finite control syntax.  Its proper subcontrols are precisely the possible
successor PCs of its row, so a closed code value determines a finite table.
-/
inductive Control where
  | answer (accepted : Bool)
  | observeNode (onS onApp : Control)
  | observeIncoming (onRoot onLeft onRight : Control)
  | move (operation : Primitive) (next : Control)
  deriving BEq, DecidableEq, Repr

namespace Control

/-- Read the row stored at a control value. -/
def instruction : Control → Instruction Control
  | .answer accepted => .answer accepted
  | .observeNode onS onApp => .observeNode onS onApp
  | .observeIncoming onRoot onLeft onRight =>
      .observeIncoming onRoot onLeft onRight
  | .move operation next => .move operation next

/-- The finite list of this PC and all syntactically reachable PCs. -/
def nodes : Control → List Control
  | control@(.answer _) => [control]
  | control@(.observeNode onS onApp) =>
      control :: (nodes onS ++ nodes onApp)
  | control@(.observeIncoming onRoot onLeft onRight) =>
      control :: (nodes onRoot ++ nodes onLeft ++ nodes onRight)
  | control@(.move _ next) => control :: nodes next

/-- Explicit structural row count, including terminal-answer rows. -/
def size : Control → Nat
  | .answer _ => 1
  | .observeNode onS onApp => 1 + onS.size + onApp.size
  | .observeIncoming onRoot onLeft onRight =>
      1 + onRoot.size + onLeft.size + onRight.size
  | .move _ next => 1 + next.size

@[simp]
theorem length_nodes (control : Control) : control.nodes.length = control.size := by
  induction control with
  | answer accepted => rfl
  | observeNode onS onApp ihS ihApp =>
      simp only [nodes, List.length_cons, List.length_append, ihS, ihApp, size]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  | observeIncoming onRoot onLeft onRight ihRoot ihLeft ihRight =>
      simp only [nodes, List.length_cons, List.length_append, ihRoot, ihLeft,
        ihRight, size]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  | move operation next ih =>
      simp only [nodes, List.length_cons, ih, size]
      exact Nat.add_comm _ _

@[simp]
theorem self_mem_nodes (control : Control) : control ∈ control.nodes := by
  cases control <;> simp [nodes]

theorem size_pos (control : Control) : 0 < control.size := by
  cases control with
  | answer accepted => exact Nat.zero_lt_succ 0
  | observeNode onS onApp =>
      exact Nat.add_pos_left
        (Nat.add_pos_left (Nat.zero_lt_succ 0) _) _
  | observeIncoming onRoot onLeft onRight =>
      exact Nat.add_pos_left
        (Nat.add_pos_left
          (Nat.add_pos_left (Nat.zero_lt_succ 0) _) _) _
  | move operation next =>
      exact Nat.add_pos_left (Nat.zero_lt_succ 0) _

/-- Pattern code is cursor-only: no row contains the mutating primitive. -/
def NoRdx : Control → Prop
  | .answer _ => True
  | .observeNode onS onApp => onS.NoRdx ∧ onApp.NoRdx
  | .observeIncoming onRoot onLeft onRight =>
      onRoot.NoRdx ∧ onLeft.NoRdx ∧ onRight.NoRdx
  | .move .Rdx _ => False
  | .move _ next => next.NoRdx

/-- Every row named by a mutation-free control tree is itself mutation-free. -/
theorem noRdx_of_mem_nodes {root node : Control}
    (rootNoRdx : root.NoRdx) (membership : node ∈ root.nodes) : node.NoRdx := by
  induction root with
  | answer accepted =>
      simp only [nodes, List.mem_singleton] at membership
      subst node
      exact rootNoRdx
  | observeNode onS onApp ihS ihApp =>
      rcases rootNoRdx with ⟨onSNoRdx, onAppNoRdx⟩
      simp only [nodes, List.mem_cons, List.mem_append] at membership
      rcases membership with rfl | membership | membership
      · exact ⟨onSNoRdx, onAppNoRdx⟩
      · exact ihS onSNoRdx membership
      · exact ihApp onAppNoRdx membership
  | observeIncoming onRoot onLeft onRight ihRoot ihLeft ihRight =>
      rcases rootNoRdx with ⟨onRootNoRdx, onLeftNoRdx, onRightNoRdx⟩
      simp only [nodes, List.mem_cons, List.mem_append] at membership
      rcases membership with rfl | membership
      · exact ⟨onRootNoRdx, onLeftNoRdx, onRightNoRdx⟩
      · rcases membership with membership | membership
        · rcases membership with membership | membership
          · exact ihRoot onRootNoRdx membership
          · exact ihLeft onLeftNoRdx membership
        · exact ihRight onRightNoRdx membership
  | move operation next ih =>
      cases operation with
      | L =>
          simp only [NoRdx] at rootNoRdx
          simp only [nodes, List.mem_cons] at membership
          rcases membership with rfl | membership
          · exact rootNoRdx
          · exact ih rootNoRdx membership
      | R =>
          simp only [NoRdx] at rootNoRdx
          simp only [nodes, List.mem_cons] at membership
          rcases membership with rfl | membership
          · exact rootNoRdx
          · exact ih rootNoRdx membership
      | U =>
          simp only [NoRdx] at rootNoRdx
          simp only [nodes, List.mem_cons] at membership
          rcases membership with rfl | membership
          · exact rootNoRdx
          · exact ih rootNoRdx membership
      | Rdx => exact False.elim rootNoRdx

end Control

/-- One materialized finite-table row. -/
structure Row where
  pc : Control
  instruction : Instruction Control
  deriving Repr

namespace Row

/-- Materialize the row named by `pc`. -/
def ofControl (pc : Control) : Row := ⟨pc, pc.instruction⟩

end Row

/-- Deterministic first-match lookup in a finite row list. -/
def lookupRows : List Row → Control → Option (Instruction Control)
  | [], _ => none
  | row :: rows, pc =>
      if row.pc = pc then some row.instruction else lookupRows rows pc

/-- A finite deterministic microprogram with one distinguished entry PC. -/
structure Table where
  entry : Control
  rows : List Row
  deriving Repr

namespace Table

/-- Materialize the complete subcontrol table rooted at `entry`. -/
def ofControl (entry : Control) : Table :=
  ⟨entry, entry.nodes.map Row.ofControl⟩

@[simp] theorem ofControl_entry (entry : Control) :
    (ofControl entry).entry = entry := rfl

/-- Lookup the unique operational row selected by the current PC. -/
def lookup (table : Table) (pc : Control) : Option (Instruction Control) :=
  lookupRows table.rows pc

theorem lookupRows_map_of_mem
    {states : List Control} {pc : Control} (h : pc ∈ states) :
    lookupRows (states.map Row.ofControl) pc = some pc.instruction := by
  induction states with
  | nil => cases h
  | cons head tail ih =>
      simp only [List.map_cons, lookupRows, Row.ofControl]
      by_cases heq : head = pc
      · subst head
        simp
      · simp only [heq, ↓reduceIte]
        apply ih
        rcases List.mem_cons.mp h with hhead | htail
        · exact (heq hhead.symm).elim
        · exact htail

/-- Every declared PC has exactly its syntactically specified row. -/
theorem lookup_of_mem
    {entry pc : Control} (h : pc ∈ entry.nodes) :
    (ofControl entry).lookup pc = some pc.instruction := by
  exact lookupRows_map_of_mem h

@[simp]
theorem rows_length (entry : Control) :
    (ofControl entry).rows.length = entry.size := by
  simp [ofControl, Control.length_nodes]

end Table

/-- Operational states of the table machine. -/
inductive State where
  | running (pc : Control) (cursor : Cursor)
  | done (accepted : Bool) (cursor : Cursor)
  | reject
  deriving BEq, DecidableEq, Repr

/-- Execute one already-looked-up row. -/
def executeInstruction : Instruction Control → Cursor → State
  | .answer accepted, cursor => .done accepted cursor
  | .observeNode onS onApp, cursor =>
      match Probe.observeNode cursor with
      | .s => .running onS cursor
      | .app => .running onApp cursor
  | .observeIncoming onRoot onLeft onRight, cursor =>
      match Probe.observeIncoming cursor with
      | .root => .running onRoot cursor
      | .left => .running onLeft cursor
      | .right => .running onRight cursor
  | .move operation next, cursor =>
      match operation.exec cursor with
      | none => .reject
      | some moved => .running next moved

namespace Table

/-- One genuine table step.  Missing rows and failed moves enter `Reject`. -/
def step (table : Table) : State → State
  | .running pc cursor =>
      match table.lookup pc with
      | none => .reject
      | some instruction => executeInstruction instruction cursor
  | terminal@(.done _ _) => terminal
  | .reject => .reject

/-- Execute exactly `fuel` table rows; terminal states are absorbing. -/
def run (table : Table) : Nat → State → State
  | 0, state => state
  | fuel + 1, state => run table fuel (table.step state)

@[simp]
theorem run_zero (table : Table) (state : State) : table.run 0 state = state :=
  rfl

@[simp]
theorem run_succ (table : Table) (fuel : Nat) (state : State) :
    table.run (fuel + 1) state = table.run fuel (table.step state) :=
  rfl

theorem run_add (table : Table) (first second : Nat) (state : State) :
    table.run (first + second) state =
      table.run second (table.run first state) := by
  induction first generalizing state with
  | zero => simp
  | succ first ih =>
      simp only [Nat.succ_add, run_succ]
      exact ih (table.step state)

@[simp]
theorem run_done (table : Table) (fuel : Nat) (accepted : Bool)
    (cursor : Cursor) :
    table.run fuel (.done accepted cursor) = .done accepted cursor := by
  induction fuel with
  | zero => rfl
  | succ fuel ih => simpa [run, step] using ih

@[simp]
theorem run_reject (table : Table) (fuel : Nat) :
    table.run fuel .reject = .reject := by
  induction fuel with
  | zero => rfl
  | succ fuel ih => simpa [run, step] using ih

theorem step_running_of_mem
    {entry pc : Control} {cursor : Cursor} (h : pc ∈ entry.nodes) :
    (ofControl entry).step (.running pc cursor) =
      executeInstruction pc.instruction cursor := by
  simp [step, lookup_of_mem h]

/-- A run which reaches an ordinary terminal result could not have visited
`Reject` earlier and can never visit it later, because both terminals absorb. -/
theorem neverRejects_of_run_done
    {table : Table} {bound : Nat} {start : State}
    {accepted : Bool} {cursor : Cursor}
    (hdone : table.run bound start = .done accepted cursor) :
    ∀ fuel, table.run fuel start ≠ .reject := by
  intro fuel hrejected
  rcases Nat.le_total fuel bound with hbefore | hafter
  · obtain ⟨remaining, hbound⟩ := Nat.exists_eq_add_of_le hbefore
    have reachesReject : table.run bound start = .reject := by
      rw [hbound, table.run_add, hrejected, table.run_reject]
    rw [hdone] at reachesReject
    cases reachesReject
  · obtain ⟨remaining, hfuel⟩ := Nat.exists_eq_add_of_le hafter
    have remainsDone : table.run fuel start = .done accepted cursor := by
      rw [hfuel, table.run_add, hdone, table.run_done]
    rw [remainsDone] at hrejected
    cases hrejected

end Table

/-! ## Exact small-step traces -/

/-- Exact-length closure of deterministic table stepping. -/
inductive RunsN (table : Table) : Nat → State → State → Prop where
  | refl (state : State) : RunsN table 0 state state
  | head {n : Nat} {source middle target : State} :
      table.step source = middle → RunsN table n middle target →
        RunsN table (n + 1) source target

namespace RunsN

theorem single {table : Table} {source target : State}
    (h : table.step source = target) : RunsN table 1 source target := by
  simpa using RunsN.head h (RunsN.refl target)

theorem trans {table : Table} {m n : Nat} {source middle target : State}
    (h₁ : RunsN table m source middle)
    (h₂ : RunsN table n middle target) :
    RunsN table (m + n) source target := by
  induction h₁ with
  | refl => simpa using h₂
  | @head k first next last hstep hrest ih =>
      have result := RunsN.head hstep (ih h₂)
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using result

theorem run_eq {table : Table} {n : Nat} {source target : State}
    (h : RunsN table n source target) : table.run n source = target := by
  induction h with
  | refl => rfl
  | head hstep hrest ih =>
      simp only [Table.run_succ, hstep]
      exact ih

end RunsN

/-! ## CPS compiler -/

/--
Compile a pattern with explicit successful and mismatch continuations.  Every
move is one edge; failed primitive moves retain the generic `Reject` behavior.
-/
def compile : Pattern → Control → Control → Control
  | .hole, yes, _ => yes
  | .s, yes, no => .observeNode yes no
  | .app fnPattern argPattern, yes, no =>
      let afterRight := compile argPattern (.move .U yes) (.move .U no)
      let afterLeft := .move .U (.move .R afterRight)
      let failedLeft := .move .U no
      .observeNode no (.move .L (compile fnPattern afterLeft failedLeft))

/-- Closed pattern-probe code. -/
def patternControl (pattern : Pattern) : Control :=
  compile pattern (.answer true) (.answer false)

/-- The explicit finite table compiled from a fixed pattern. -/
def patternTable (pattern : Pattern) : Table :=
  Table.ofControl (patternControl pattern)

/-- Exact number of nonterminal rows taken by this term-dependent walk. -/
def probeCost : Pattern → Term → Nat
  | .hole, _ => 0
  | .s, _ => 1
  | .app _ _, .s => 1
  | .app fnPattern argPattern, .app fn arg =>
      if Pattern.matchesBool fnPattern fn then
        5 + probeCost fnPattern fn + probeCost argPattern arg
      else
        3 + probeCost fnPattern fn

/-- A term-independent execution bound for a fixed bounded pattern. -/
def executionBound : Pattern → Nat
  | .hole => 1
  | .s => 2
  | .app fnPattern argPattern =>
      6 + executionBound fnPattern + executionBound argPattern

/-- Explicit number of materialized rows in the compiled table. -/
def stateBound (pattern : Pattern) : Nat :=
  (patternControl pattern).size

@[simp]
theorem patternTable_rows_length (pattern : Pattern) :
    (patternTable pattern).rows.length = stateBound pattern := by
  simp [patternTable, stateBound]

theorem stateBound_pos (pattern : Pattern) : 0 < stateBound pattern := by
  exact Control.size_pos (patternControl pattern)

theorem compile_noRdx (pattern : Pattern) {yes no : Control}
    (hyes : yes.NoRdx) (hno : no.NoRdx) :
    (compile pattern yes no).NoRdx := by
  induction pattern generalizing yes no with
  | hole => exact hyes
  | s => exact ⟨hyes, hno⟩
  | app fnPattern argPattern fnIH argIH =>
      simp only [compile, Control.NoRdx]
      exact ⟨hno,
        fnIH
          (by exact argIH (by exact hyes) (by exact hno))
          (by exact hno)⟩

theorem patternControl_noRdx (pattern : Pattern) :
    (patternControl pattern).NoRdx := by
  exact compile_noRdx pattern (by trivial) (by trivial)

/-- The operational path length is bounded solely by the fixed pattern. -/
theorem probeCost_lt_executionBound (pattern : Pattern) (term : Term) :
    probeCost pattern term < executionBound pattern := by
  induction pattern generalizing term with
  | hole => simp [probeCost, executionBound]
  | s => simp [probeCost, executionBound]
  | app fnPattern argPattern fnIH argIH =>
      cases term with
      | s =>
          simp only [probeCost, executionBound]
          exact Nat.lt_of_lt_of_le (by decide : 1 < 6)
            (Nat.le_trans (Nat.le_add_right 6 _)
              (Nat.le_add_right (6 + executionBound fnPattern) _))
      | app fn arg =>
          simp only [probeCost, executionBound]
          by_cases hfn : Pattern.matchesBool fnPattern fn = true
          · simp only [hfn, ↓reduceIte]
            have hleft := fnIH fn
            have hright := argIH arg
            have hsum :
                5 + probeCost fnPattern fn + probeCost argPattern arg <
                  5 + executionBound fnPattern + executionBound argPattern :=
              Nat.add_lt_add (Nat.add_lt_add_left hleft 5) hright
            have hsix :
                5 + executionBound fnPattern + executionBound argPattern <
                  6 + executionBound fnPattern + executionBound argPattern :=
              Nat.add_lt_add_right
                (Nat.add_lt_add_right (by decide : 5 < 6)
                  (executionBound fnPattern))
                (executionBound argPattern)
            exact Nat.lt_trans hsum hsix
          · have hfalse : Pattern.matchesBool fnPattern fn = false := by
              cases h : Pattern.matchesBool fnPattern fn
              · rfl
              · exact (hfn h).elim
            simp only [hfalse, Bool.false_eq_true, ↓reduceIte]
            have hleft := fnIH fn
            have hthree :
                3 + probeCost fnPattern fn <
                  3 + executionBound fnPattern :=
              Nat.add_lt_add_left hleft 3
            have hsix :
                3 + executionBound fnPattern ≤
                  6 + executionBound fnPattern + executionBound argPattern :=
              Nat.le_trans
                (Nat.add_le_add_right (by decide : 3 ≤ 6)
                  (executionBound fnPattern))
                (Nat.le_add_right (6 + executionBound fnPattern)
                  (executionBound argPattern))
            exact Nat.lt_of_lt_of_le hthree hsix

/-- Every row of the successful continuation is materialized by compilation. -/
theorem yes_nodes_in_compile (pattern : Pattern) (yes no : Control) :
    ∀ pc, pc ∈ yes.nodes → pc ∈ (compile pattern yes no).nodes := by
  induction pattern generalizing yes no with
  | hole =>
      intro pc membership
      simpa [compile] using membership
  | s =>
      intro pc membership
      simp [compile, Control.nodes, membership]
  | app fnPattern argPattern fnIH argIH =>
      intro pc membership
      let rightCode := compile argPattern (.move .U yes) (.move .U no)
      let leftYes : Control := .move .U (.move .R rightCode)
      let leftNo : Control := .move .U no
      have inRight : pc ∈ rightCode.nodes := by
        apply argIH
        simp [Control.nodes, membership]
      have inLeftYes : pc ∈ leftYes.nodes := by
        simp [leftYes, Control.nodes, inRight]
      have inLeft : pc ∈ (compile fnPattern leftYes leftNo).nodes := by
        exact fnIH leftYes leftNo pc inLeftYes
      simpa [compile, rightCode, leftYes, leftNo, Control.nodes, inLeft]

/-- The continuation selected by the matcher, including all of its rows, is
materialized inside the compiled fragment. -/
theorem selected_nodes_in_compile
    (pattern : Pattern) (yes no : Control) (term : Term) :
    ∀ pc,
      pc ∈ (if Pattern.matchesBool pattern term then yes else no).nodes →
      pc ∈ (compile pattern yes no).nodes := by
  induction pattern generalizing yes no term with
  | hole =>
      intro pc hpc
      simpa [compile, Pattern.matchesBool] using hpc
  | s =>
      cases term with
      | s =>
          intro pc hpc
          simp only [Pattern.matchesBool, ↓reduceIte] at hpc
          simp [compile, Control.nodes, hpc]
      | app fn arg =>
          intro pc hpc
          simp only [Pattern.matchesBool, Bool.false_eq_true, ↓reduceIte] at hpc
          simp [compile, Control.nodes, hpc]
  | app fnPattern argPattern fnIH argIH =>
      cases term with
      | s =>
          intro pc hpc
          simp only [Pattern.matchesBool, Bool.false_eq_true, ↓reduceIte] at hpc
          simp [compile, Control.nodes, hpc]
      | app fn arg =>
          intro pc hpc
          by_cases hfn : Pattern.matchesBool fnPattern fn = true
          · cases harg : Pattern.matchesBool argPattern arg with
            | false =>
                have hselectedArg :
                    pc ∈ (Control.move .U no).nodes := by
                  have hno : pc ∈ no.nodes := by
                    simpa [Pattern.matchesBool, hfn, harg] using hpc
                  simp [Control.nodes, hno]
                have hinArg := argIH (.move .U yes) (.move .U no) arg pc
                  (by simpa [harg] using hselectedArg)
                have hinLeftYes :
                    pc ∈ (Control.move .U
                      (.move .R
                        (compile argPattern (.move .U yes) (.move .U no)))).nodes := by
                  simp [Control.nodes, hinArg]
                have hinFn := fnIH
                  (.move .U (.move .R
                    (compile argPattern (.move .U yes) (.move .U no))))
                  (.move .U no) fn pc
                have hinFn' := hinFn (by simpa [hfn] using hinLeftYes)
                simp [compile, Control.nodes, hinFn']
            | true =>
                have hselectedArg :
                    pc ∈ (Control.move .U yes).nodes := by
                  have hyes : pc ∈ yes.nodes := by
                    simpa [Pattern.matchesBool, hfn, harg] using hpc
                  simp [Control.nodes, hyes]
                have hinArg := argIH (.move .U yes) (.move .U no) arg pc
                  (by simpa [harg] using hselectedArg)
                have hinLeftYes :
                    pc ∈ (Control.move .U
                      (.move .R
                        (compile argPattern (.move .U yes) (.move .U no)))).nodes := by
                  simp [Control.nodes, hinArg]
                have hinFn := fnIH
                  (.move .U (.move .R
                    (compile argPattern (.move .U yes) (.move .U no))))
                  (.move .U no) fn pc
                have hinFn' := hinFn (by simpa [hfn] using hinLeftYes)
                simp [compile, Control.nodes, hinFn']
          · have hfnFalse : Pattern.matchesBool fnPattern fn = false := by
              cases h : Pattern.matchesBool fnPattern fn
              · rfl
              · exact (hfn h).elim
            have hselectedNo : pc ∈ no.nodes := by
              simpa [Pattern.matchesBool, hfnFalse] using hpc
            have hinLeftNo : pc ∈ (Control.move .U no).nodes := by
              simp [Control.nodes, hselectedNo]
            have hinFn := fnIH
              (.move .U (.move .R
                (compile argPattern (.move .U yes) (.move .U no))))
              (.move .U no) fn pc
            have hinFn' := hinFn (by simpa [hfnFalse] using hinLeftNo)
            simp [compile, Control.nodes, hinFn']

/-!
The main compositional simulation theorem is stated for an arbitrary enclosing
control.  The membership hypothesis says that the finite enclosing row list
contains the compiled fragment; recursive calls therefore still execute by
actual table lookup.
-/
theorem compile_runs
    (pattern : Pattern) (yes no whole : Control) (origin : Cursor)
    (included : ∀ pc, pc ∈ (compile pattern yes no).nodes → pc ∈ whole.nodes) :
    RunsN (Table.ofControl whole) (probeCost pattern origin.focus)
      (.running (compile pattern yes no) origin)
      (.running
        (if Pattern.matchesBool pattern origin.focus then yes else no)
        origin) := by
  induction pattern generalizing yes no whole origin with
  | hole =>
      simp only [compile, Pattern.matchesBool, probeCost, ↓reduceIte]
      exact RunsN.refl _
  | s =>
      cases origin with
      | mk focus parents =>
          cases focus with
          | s =>
              apply RunsN.single
              rw [Table.step_running_of_mem (included _ (Control.self_mem_nodes _))]
              rfl
          | app fn arg =>
              apply RunsN.single
              rw [Table.step_running_of_mem (included _ (Control.self_mem_nodes _))]
              rfl
  | app fnPattern argPattern fnIH argIH =>
      cases origin with
      | mk focus parents =>
          cases focus with
          | s =>
              apply RunsN.single
              rw [Table.step_running_of_mem (included _ (Control.self_mem_nodes _))]
              rfl
          | app fn arg =>
              let rightCode :=
                compile argPattern (.move .U yes) (.move .U no)
              let leftYes : Control := .move .U (.move .R rightCode)
              let leftNo : Control := .move .U no
              let leftCode := compile fnPattern leftYes leftNo
              let appCode : Control := .observeNode no (.move .L leftCode)
              let leftCursor : Cursor :=
                ⟨fn, .left arg :: parents⟩
              let rightCursor : Cursor :=
                ⟨arg, .right fn :: parents⟩
              have happ : compile (.app fnPattern argPattern) yes no = appCode :=
                rfl
              have hroot : appCode ∈ whole.nodes := by
                apply included appCode
                simpa only [happ] using Control.self_mem_nodes appCode
              have hmoveLeft : (.move .L leftCode) ∈ whole.nodes := by
                apply included (.move .L leftCode)
                simp [compile, appCode, leftCode, leftYes, leftNo, rightCode,
                  Control.nodes]
              have hleftIncluded :
                  ∀ pc, pc ∈ leftCode.nodes → pc ∈ whole.nodes := by
                intro pc hpc
                apply included pc
                simp [compile, appCode, leftCode, leftYes, leftNo, rightCode,
                  Control.nodes, hpc]
              have hfirst : RunsN (Table.ofControl whole) 2
                  (.running appCode ⟨.app fn arg, parents⟩)
                  (.running leftCode leftCursor) := by
                have hnode : (Table.ofControl whole).step
                    (.running appCode ⟨.app fn arg, parents⟩) =
                    .running (.move .L leftCode) ⟨.app fn arg, parents⟩ := by
                  rw [Table.step_running_of_mem hroot]
                  simp [appCode, Control.instruction, executeInstruction]
                have hmove : (Table.ofControl whole).step
                    (.running (.move .L leftCode) ⟨.app fn arg, parents⟩) =
                    .running leftCode leftCursor := by
                  rw [Table.step_running_of_mem hmoveLeft]
                  simp [Control.instruction, executeInstruction, Primitive.exec,
                    Cursor.left?, leftCursor]
                exact RunsN.trans (RunsN.single hnode) (RunsN.single hmove)
              have hleft := fnIH leftYes leftNo whole leftCursor hleftIncluded
              cases hfn : Pattern.matchesBool fnPattern fn with
              | false =>
                  have hleftEnd : RunsN (Table.ofControl whole)
                      (probeCost fnPattern fn)
                      (.running leftCode leftCursor)
                      (.running leftNo leftCursor) := by
                    simpa [leftCode, leftCursor, hfn] using hleft
                  have hleftNo : leftNo ∈ whole.nodes := by
                    apply hleftIncluded leftNo
                    apply selected_nodes_in_compile fnPattern leftYes leftNo fn
                    simpa [hfn] using Control.self_mem_nodes leftNo
                  have hup : RunsN (Table.ofControl whole) 1
                      (.running leftNo leftCursor)
                      (.running no ⟨.app fn arg, parents⟩) := by
                    apply RunsN.single
                    rw [Table.step_running_of_mem hleftNo]
                    rfl
                  have hall := RunsN.trans (RunsN.trans hfirst hleftEnd) hup
                  have hcount :
                      (2 + probeCost fnPattern fn) + 1 =
                        3 + probeCost fnPattern fn := by
                    exact three_step_count _
                  rw [hcount] at hall
                  simpa [happ, appCode, leftCode, leftNo, leftCursor,
                    probeCost, Pattern.matchesBool, hfn] using hall
              | true =>
                  have hleftEnd : RunsN (Table.ofControl whole)
                      (probeCost fnPattern fn)
                      (.running leftCode leftCursor)
                      (.running leftYes leftCursor) := by
                    simpa [leftCode, leftCursor, hfn] using hleft
                  have hleftYes : leftYes ∈ whole.nodes := by
                    apply hleftIncluded leftYes
                    apply selected_nodes_in_compile fnPattern leftYes leftNo fn
                    simpa [hfn] using Control.self_mem_nodes leftYes
                  have hmoveRight : (.move .R rightCode) ∈ whole.nodes := by
                    apply hleftIncluded (.move .R rightCode)
                    apply selected_nodes_in_compile fnPattern leftYes leftNo fn
                    simpa [hfn, leftYes, Control.nodes] using
                      Control.self_mem_nodes (.move .R rightCode)
                  have hrightIncluded :
                      ∀ pc, pc ∈ rightCode.nodes → pc ∈ whole.nodes := by
                    intro pc hpc
                    apply hleftIncluded pc
                    apply selected_nodes_in_compile fnPattern leftYes leftNo fn
                    simpa [hfn, leftYes, Control.nodes, hpc]
                  have hupLeft : RunsN (Table.ofControl whole) 1
                      (.running leftYes leftCursor)
                      (.running (.move .R rightCode) ⟨.app fn arg, parents⟩) := by
                    apply RunsN.single
                    rw [Table.step_running_of_mem hleftYes]
                    rfl
                  have hrightMove : RunsN (Table.ofControl whole) 1
                      (.running (.move .R rightCode) ⟨.app fn arg, parents⟩)
                      (.running rightCode rightCursor) := by
                    apply RunsN.single
                    rw [Table.step_running_of_mem hmoveRight]
                    rfl
                  have hright :=
                    argIH (.move .U yes) (.move .U no) whole rightCursor
                      hrightIncluded
                  cases harg : Pattern.matchesBool argPattern arg with
                  | false =>
                      have hrightEnd : RunsN (Table.ofControl whole)
                          (probeCost argPattern arg)
                          (.running rightCode rightCursor)
                          (.running (.move .U no) rightCursor) := by
                        simpa [rightCode, rightCursor, harg] using hright
                      have hreturn : (.move .U no) ∈ whole.nodes := by
                        apply hrightIncluded (.move .U no)
                        apply selected_nodes_in_compile argPattern
                          (.move .U yes) (.move .U no) arg
                        simpa [harg] using Control.self_mem_nodes (.move .U no)
                      have hupRight : RunsN (Table.ofControl whole) 1
                          (.running (.move .U no) rightCursor)
                          (.running no ⟨.app fn arg, parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturn]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans
                          (RunsN.trans
                            (RunsN.trans
                              (RunsN.trans hfirst hleftEnd) hupLeft)
                            hrightMove)
                        hrightEnd)
                        hupRight
                      have hcount :
                          ((((2 + probeCost fnPattern fn) + 1) + 1) +
                              probeCost argPattern arg) + 1 =
                            5 + probeCost fnPattern fn +
                              probeCost argPattern arg := by
                        exact five_step_count _ _
                      rw [hcount] at hall
                      simpa [happ, appCode, leftCode, leftYes, rightCode,
                        leftCursor, rightCursor, probeCost, Pattern.matchesBool,
                        hfn, harg] using hall
                  | true =>
                      have hrightEnd : RunsN (Table.ofControl whole)
                          (probeCost argPattern arg)
                          (.running rightCode rightCursor)
                          (.running (.move .U yes) rightCursor) := by
                        simpa [rightCode, rightCursor, harg] using hright
                      have hreturn : (.move .U yes) ∈ whole.nodes := by
                        apply hrightIncluded (.move .U yes)
                        apply selected_nodes_in_compile argPattern
                          (.move .U yes) (.move .U no) arg
                        simpa [harg] using Control.self_mem_nodes (.move .U yes)
                      have hupRight : RunsN (Table.ofControl whole) 1
                          (.running (.move .U yes) rightCursor)
                          (.running yes ⟨.app fn arg, parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturn]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans
                          (RunsN.trans
                            (RunsN.trans
                              (RunsN.trans hfirst hleftEnd) hupLeft)
                            hrightMove)
                        hrightEnd)
                        hupRight
                      have hcount :
                          ((((2 + probeCost fnPattern fn) + 1) + 1) +
                              probeCost argPattern arg) + 1 =
                            5 + probeCost fnPattern fn +
                              probeCost argPattern arg := by
                        exact five_step_count _ _
                      rw [hcount] at hall
                      simpa [happ, appCode, leftCode, leftYes, rightCode,
                        leftCursor, rightCursor, probeCost, Pattern.matchesBool,
                        hfn, harg] using hall

/-- Pattern compilation reaches its selected answer row before executing it. -/
theorem pattern_runs_to_answer (pattern : Pattern) (origin : Cursor) :
    RunsN (patternTable pattern) (probeCost pattern origin.focus)
      (.running (patternTable pattern).entry origin)
      (.running (.answer (Pattern.matchesBool pattern origin.focus)) origin) := by
  let yes : Control := .answer true
  let no : Control := .answer false
  let entry := compile pattern yes no
  have hcompiled := compile_runs pattern yes no entry origin
    (fun _pc membership => membership)
  cases hmatch : Pattern.matchesBool pattern origin.focus with
  | false =>
      simpa [patternTable, patternControl, entry, yes, no, hmatch]
        using hcompiled
  | true =>
      simpa [patternTable, patternControl, entry, yes, no, hmatch]
        using hcompiled

/-- The selected Boolean row belongs to the closed local probe table. -/
theorem answer_mem_patternControl (pattern : Pattern) (term : Term) :
    .answer (Pattern.matchesBool pattern term) ∈
      (patternControl pattern).nodes := by
  apply selected_nodes_in_compile pattern (.answer true) (.answer false) term
  cases Pattern.matchesBool pattern term <;> simp [Control.nodes]

/-- The compiled table terminates normally with the exact matcher Boolean. -/
theorem pattern_runs (pattern : Pattern) (origin : Cursor) :
    RunsN (patternTable pattern) (probeCost pattern origin.focus + 1)
      (.running (patternTable pattern).entry origin)
      (.done (Pattern.matchesBool pattern origin.focus) origin) := by
  let yes : Control := .answer true
  let no : Control := .answer false
  let entry := compile pattern yes no
  have hcompiled : RunsN (Table.ofControl entry)
      (probeCost pattern origin.focus)
      (.running entry origin)
      (.running
        (if Pattern.matchesBool pattern origin.focus then yes else no)
        origin) := by
    apply compile_runs pattern yes no entry origin
    intro pc hpc
    exact hpc
  cases hmatch : Pattern.matchesBool pattern origin.focus with
  | false =>
      have hcompiled' : RunsN (Table.ofControl entry)
          (probeCost pattern origin.focus)
          (.running entry origin) (.running no origin) := by
        simpa [hmatch] using hcompiled
      have hanswer : RunsN (Table.ofControl entry) 1
          (.running no origin) (.done false origin) := by
        apply RunsN.single
        rw [Table.step_running_of_mem]
        · rfl
        · apply selected_nodes_in_compile pattern yes no origin.focus
          simpa [hmatch] using Control.self_mem_nodes no
      have hall := RunsN.trans hcompiled' hanswer
      simpa [patternTable, patternControl, entry, yes, no, hmatch] using hall
  | true =>
      have hcompiled' : RunsN (Table.ofControl entry)
          (probeCost pattern origin.focus)
          (.running entry origin) (.running yes origin) := by
        simpa [hmatch] using hcompiled
      have hanswer : RunsN (Table.ofControl entry) 1
          (.running yes origin) (.done true origin) := by
        apply RunsN.single
        rw [Table.step_running_of_mem]
        · rfl
        · apply selected_nodes_in_compile pattern yes no origin.focus
          simpa [hmatch] using Control.self_mem_nodes yes
      have hall := RunsN.trans hcompiled' hanswer
      simpa [patternTable, patternControl, entry, yes, no, hmatch] using hall

/-- Executable table form of `pattern_runs`. -/
theorem pattern_run (pattern : Pattern) (origin : Cursor) :
    (patternTable pattern).run (probeCost pattern origin.focus + 1)
      (.running (patternTable pattern).entry origin) =
      .done (Pattern.matchesBool pattern origin.focus) origin :=
  (pattern_runs pattern origin).run_eq

/-- The fixed pattern table finishes within its explicit structural bound. -/
theorem pattern_run_within_bound (pattern : Pattern) (origin : Cursor) :
    probeCost pattern origin.focus + 1 ≤ executionBound pattern := by
  exact probeCost_lt_executionBound pattern origin.focus

/-- Running for the fixed pattern-only bound reaches the same ordinary
terminal; no term-dependent fuel is required by the scheduler. -/
theorem pattern_run_at_bound (pattern : Pattern) (origin : Cursor) :
    (patternTable pattern).run (executionBound pattern)
      (.running (patternTable pattern).entry origin) =
      .done (Pattern.matchesBool pattern origin.focus) origin := by
  obtain ⟨remaining, hbound⟩ := Nat.exists_eq_add_of_le
    (pattern_run_within_bound pattern origin)
  rw [hbound, Table.run_add, pattern_run, Table.run_done]

/-- Normal termination rules out the table machine's `Reject` result. -/
theorem pattern_run_ne_reject (pattern : Pattern) (origin : Cursor) :
    (patternTable pattern).run (probeCost pattern origin.focus + 1)
      (.running (patternTable pattern).entry origin) ≠ .reject := by
  rw [pattern_run]
  intro h
  cases h

/-- No prefix or extension of the compiled execution enters `Reject`. -/
theorem pattern_never_rejects (pattern : Pattern) (origin : Cursor) :
    ∀ fuel,
      (patternTable pattern).run fuel
        (.running (patternTable pattern).entry origin) ≠ .reject := by
  exact Table.neverRejects_of_run_done (pattern_run pattern origin)

/-- Any ordinary result of the canonical execution has the specified Boolean
and the literal input cursor. -/
theorem pattern_run_restores
    (pattern : Pattern) (origin returned : Cursor) (accepted : Bool)
    (h : (patternTable pattern).run (probeCost pattern origin.focus + 1)
      (.running (patternTable pattern).entry origin) =
        .done accepted returned) :
    accepted = Pattern.matchesBool pattern origin.focus ∧ returned = origin := by
  rw [pattern_run] at h
  cases h
  exact ⟨rfl, rfl⟩

/-- Success restores the exact cursor and is equivalent to `Pattern.Matches`. -/
theorem pattern_success_iff (pattern : Pattern) (origin : Cursor) :
    (patternTable pattern).run (probeCost pattern origin.focus + 1)
        (.running (patternTable pattern).entry origin) = .done true origin ↔
      Pattern.Matches pattern origin.focus := by
  rw [pattern_run]
  simp [Pattern.matchesBool_eq_true_iff]

/-- Ordinary mismatch also restores the exact cursor. -/
theorem pattern_mismatch_iff (pattern : Pattern) (origin : Cursor) :
    (patternTable pattern).run (probeCost pattern origin.focus + 1)
        (.running (patternTable pattern).entry origin) = .done false origin ↔
      ¬ Pattern.Matches pattern origin.focus := by
  rw [pattern_run]
  rw [← Pattern.matchesBool_eq_true_iff]
  cases Pattern.matchesBool pattern origin.focus <;> simp

/-! ## Parent-probe compiler -/

/-- Parent-probe code, including the incoming-side observation and return. -/
def compileParent
    (side : Direction) (pattern : Pattern) (yes no : Control) : Control :=
  match side with
  | .left =>
      .observeIncoming no
        (.move .U (compile pattern (.move .L yes) (.move .L no))) no
  | .right =>
      .observeIncoming no no
        (.move .U (compile pattern (.move .R yes) (.move .R no)))

def parentControl (side : Direction) (pattern : Pattern) : Control :=
  compileParent side pattern (.answer true) (.answer false)

def parentTable (side : Direction) (pattern : Pattern) : Table :=
  Table.ofControl (parentControl side pattern)

/-- Both Boolean continuation rows occur in every closed parent probe. -/
theorem answer_mem_parentControl
    (side : Direction) (pattern : Pattern) (accepted : Bool) :
    .answer accepted ∈ (parentControl side pattern).nodes := by
  cases accepted with
  | false =>
      cases side <;>
        simp [parentControl, compileParent, Control.nodes]
  | true =>
      cases side with
      | left =>
          simp only [parentControl, compileParent, Control.nodes,
            List.mem_cons, List.mem_append]
          right
          left
          right
          right
          exact yes_nodes_in_compile pattern
            (.move .L (.answer true)) (.move .L (.answer false))
            (.answer true) (by simp [Control.nodes])
      | right =>
          simp only [parentControl, compileParent, Control.nodes,
            List.mem_cons, List.mem_append]
          right
          right
          right
          exact yes_nodes_in_compile pattern
            (.move .R (.answer true)) (.move .R (.answer false))
            (.answer true) (by simp [Control.nodes])

/-- Exact row count for a compiled parent probe. -/
def parentStateBound (side : Direction) (pattern : Pattern) : Nat :=
  (parentControl side pattern).size

@[simp]
theorem parentTable_rows_length (side : Direction) (pattern : Pattern) :
    (parentTable side pattern).rows.length = parentStateBound side pattern := by
  simp [parentTable, parentStateBound]

theorem parentStateBound_pos (side : Direction) (pattern : Pattern) :
    0 < parentStateBound side pattern := by
  exact Control.size_pos (parentControl side pattern)

theorem compileParent_noRdx (side : Direction) (pattern : Pattern)
    {yes no : Control} (hyes : yes.NoRdx) (hno : no.NoRdx) :
    (compileParent side pattern yes no).NoRdx := by
  cases side with
  | left =>
      change no.NoRdx ∧
        (compile pattern (.move .L yes) (.move .L no)).NoRdx ∧ no.NoRdx
      exact ⟨hno, compile_noRdx pattern hyes hno, hno⟩
  | right =>
      change no.NoRdx ∧ no.NoRdx ∧
        (compile pattern (.move .R yes) (.move .R no)).NoRdx
      exact ⟨hno, hno, compile_noRdx pattern hyes hno⟩

theorem parentControl_noRdx (side : Direction) (pattern : Pattern) :
    (parentControl side pattern).NoRdx := by
  exact compileParent_noRdx side pattern (by trivial) (by trivial)

/-- Term-dependent row count of the parent probe, including its answer row. -/
def parentCost (side : Direction) (pattern : Pattern) (origin : Cursor) : Nat :=
  match side, origin.parents with
  | .left, .left sibling :: _ =>
      probeCost pattern (.app origin.focus sibling) + 4
  | .right, .right sibling :: _ =>
      probeCost pattern (.app sibling origin.focus) + 4
  | _, _ => 2

/-- A fixed bound on every parent-probe execution. -/
def parentExecutionBound (pattern : Pattern) : Nat :=
  executionBound pattern + 3

theorem parentCost_le_bound
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    parentCost side pattern origin ≤ parentExecutionBound pattern := by
  cases origin with
  | mk focus parents =>
      cases parents with
      | nil => cases side <;> simp [parentCost, parentExecutionBound]
      | cons frame parents =>
          cases frame with
          | left sibling =>
              cases side with
              | left =>
                  simp only [parentCost, parentExecutionBound]
                  have h := probeCost_lt_executionBound pattern
                    (.app focus sibling)
                  have hadd := Nat.add_le_add_right (Nat.succ_le_of_lt h) 3
                  change (probeCost pattern (.app focus sibling) + 1) + 3 ≤
                    executionBound pattern + 3
                  exact hadd
              | right => simp [parentCost, parentExecutionBound]
          | right sibling =>
              cases side with
              | left => simp [parentCost, parentExecutionBound]
              | right =>
                  simp only [parentCost, parentExecutionBound]
                  have h := probeCost_lt_executionBound pattern
                    (.app sibling focus)
                  have hadd := Nat.add_le_add_right (Nat.succ_le_of_lt h) 3
                  change (probeCost pattern (.app sibling focus) + 1) + 3 ≤
                    executionBound pattern + 3
                  exact hadd

/-- Parent compilation executes by table lookup, restores origin, and agrees
with the parent-pattern Boolean specification. -/
theorem parent_runs (side : Direction) (pattern : Pattern) (origin : Cursor) :
    RunsN (parentTable side pattern) (parentCost side pattern origin)
      (.running (parentTable side pattern).entry origin)
      (.done (Probe.parentMatches side pattern origin) origin) := by
  let yes : Control := .answer true
  let no : Control := .answer false
  let entry := compileParent side pattern yes no
  cases origin with
  | mk focus parents =>
      cases parents with
      | nil =>
          cases side with
          | left =>
              have hentry : entry ∈ entry.nodes := Control.self_mem_nodes entry
              have hno : no ∈ entry.nodes := by
                simp [entry, compileParent, Control.nodes]
              have hobserve : (Table.ofControl entry).step
                  (.running entry ⟨focus, []⟩) =
                  .running no ⟨focus, []⟩ := by
                rw [Table.step_running_of_mem hentry]
                simp [entry, compileParent, Control.instruction,
                  executeInstruction]
              have hanswer : (Table.ofControl entry).step
                  (.running no ⟨focus, []⟩) =
                  .done false ⟨focus, []⟩ := by
                rw [Table.step_running_of_mem hno]
                rfl
              have hall := RunsN.trans (RunsN.single hobserve)
                (RunsN.single hanswer)
              simpa [parentTable, parentControl, entry, yes, no, parentCost,
                Probe.parentMatches] using hall
          | right =>
              have hentry : entry ∈ entry.nodes := Control.self_mem_nodes entry
              have hno : no ∈ entry.nodes := by
                simp [entry, compileParent, Control.nodes]
              have hobserve : (Table.ofControl entry).step
                  (.running entry ⟨focus, []⟩) =
                  .running no ⟨focus, []⟩ := by
                rw [Table.step_running_of_mem hentry]
                simp [entry, compileParent, Control.instruction,
                  executeInstruction]
              have hanswer : (Table.ofControl entry).step
                  (.running no ⟨focus, []⟩) =
                  .done false ⟨focus, []⟩ := by
                rw [Table.step_running_of_mem hno]
                rfl
              have hall := RunsN.trans (RunsN.single hobserve)
                (RunsN.single hanswer)
              simpa [parentTable, parentControl, entry, yes, no, parentCost,
                Probe.parentMatches] using hall
      | cons frame parents =>
          cases frame with
          | left sibling =>
              cases side with
              | right =>
                  have hentry : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hno : no ∈ entry.nodes := by
                    simp [entry, compileParent, Control.nodes]
                  have hobserve : (Table.ofControl entry).step
                      (.running entry ⟨focus, .left sibling :: parents⟩) =
                      .running no ⟨focus, .left sibling :: parents⟩ := by
                    rw [Table.step_running_of_mem hentry]
                    simp [entry, compileParent, Control.instruction,
                      executeInstruction]
                  have hanswer : (Table.ofControl entry).step
                      (.running no ⟨focus, .left sibling :: parents⟩) =
                      .done false ⟨focus, .left sibling :: parents⟩ := by
                    rw [Table.step_running_of_mem hno]
                    rfl
                  have hall := RunsN.trans (RunsN.single hobserve)
                    (RunsN.single hanswer)
                  simpa [parentTable, parentControl, entry, yes, no,
                    parentCost, Probe.parentMatches] using hall
              | left =>
                  let parent : Cursor :=
                    ⟨.app focus sibling, parents⟩
                  let patternCode :=
                    compile pattern (.move .L yes) (.move .L no)
                  let afterIncoming : Control := .move .U patternCode
                  have hincoming : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hafterIncoming : afterIncoming ∈ entry.nodes := by
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes]
                  have hpatternIncluded :
                      ∀ pc, pc ∈ patternCode.nodes → pc ∈ entry.nodes := by
                    intro pc hpc
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes, hpc]
                  have hprefix : RunsN (Table.ofControl entry) 2
                      (.running entry
                        ⟨focus, .left sibling :: parents⟩)
                      (.running patternCode parent) := by
                    have hobserve : (Table.ofControl entry).step
                        (.running entry
                          ⟨focus, .left sibling :: parents⟩) =
                        .running afterIncoming
                          ⟨focus, .left sibling :: parents⟩ := by
                      rw [Table.step_running_of_mem hincoming]
                      simp [entry, compileParent, afterIncoming, patternCode,
                        Control.instruction, executeInstruction]
                    have hup : (Table.ofControl entry).step
                        (.running afterIncoming
                          ⟨focus, .left sibling :: parents⟩) =
                        .running patternCode parent := by
                      rw [Table.step_running_of_mem hafterIncoming]
                      simp [afterIncoming, patternCode, parent,
                        Control.instruction, executeInstruction, Primitive.exec,
                        Cursor.up?]
                    exact RunsN.trans (RunsN.single hobserve)
                      (RunsN.single hup)
                  have hprobe := compile_runs pattern (.move .L yes)
                    (.move .L no) entry parent hpatternIncluded
                  cases hmatch : Pattern.matchesBool pattern
                      (.app focus sibling) with
                  | false =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app focus sibling))
                          (.running patternCode parent)
                          (.running (.move .L no) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .L no) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .L yes) (.move .L no) (.app focus sibling)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .L no)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .L no) parent)
                          (.running no
                            ⟨focus, .left sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hanswerMem : no ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .L yes) (.move .L no) (.app focus sibling)
                        simp [hmatch, Control.nodes]
                      have hanswer : RunsN (Table.ofControl entry) 1
                          (.running no ⟨focus, .left sibling :: parents⟩)
                          (.done false
                            ⟨focus, .left sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hanswerMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans (RunsN.trans hprefix hprobe') hreturn)
                        hanswer
                      have hcount :
                          ((2 + probeCost pattern (.app focus sibling)) + 1) +
                              1 =
                            probeCost pattern (.app focus sibling) + 4 := by
                        exact four_step_count _
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall
                  | true =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app focus sibling))
                          (.running patternCode parent)
                          (.running (.move .L yes) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .L yes) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .L yes) (.move .L no) (.app focus sibling)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .L yes)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .L yes) parent)
                          (.running yes
                            ⟨focus, .left sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hanswerMem : yes ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .L yes) (.move .L no) (.app focus sibling)
                        simp [hmatch, Control.nodes]
                      have hanswer : RunsN (Table.ofControl entry) 1
                          (.running yes ⟨focus, .left sibling :: parents⟩)
                          (.done true
                            ⟨focus, .left sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hanswerMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans (RunsN.trans hprefix hprobe') hreturn)
                        hanswer
                      have hcount :
                          ((2 + probeCost pattern (.app focus sibling)) + 1) +
                              1 =
                            probeCost pattern (.app focus sibling) + 4 := by
                        exact four_step_count _
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall
          | right sibling =>
              cases side with
              | left =>
                  have hentry : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hno : no ∈ entry.nodes := by
                    simp [entry, compileParent, Control.nodes]
                  have hobserve : (Table.ofControl entry).step
                      (.running entry ⟨focus, .right sibling :: parents⟩) =
                      .running no ⟨focus, .right sibling :: parents⟩ := by
                    rw [Table.step_running_of_mem hentry]
                    simp [entry, compileParent, Control.instruction,
                      executeInstruction]
                  have hanswer : (Table.ofControl entry).step
                      (.running no ⟨focus, .right sibling :: parents⟩) =
                      .done false ⟨focus, .right sibling :: parents⟩ := by
                    rw [Table.step_running_of_mem hno]
                    rfl
                  have hall := RunsN.trans (RunsN.single hobserve)
                    (RunsN.single hanswer)
                  simpa [parentTable, parentControl, entry, yes, no,
                    parentCost, Probe.parentMatches] using hall
              | right =>
                  let parent : Cursor :=
                    ⟨.app sibling focus, parents⟩
                  let patternCode :=
                    compile pattern (.move .R yes) (.move .R no)
                  let afterIncoming : Control := .move .U patternCode
                  have hincoming : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hafterIncoming : afterIncoming ∈ entry.nodes := by
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes]
                  have hpatternIncluded :
                      ∀ pc, pc ∈ patternCode.nodes → pc ∈ entry.nodes := by
                    intro pc hpc
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes, hpc]
                  have hprefix : RunsN (Table.ofControl entry) 2
                      (.running entry
                        ⟨focus, .right sibling :: parents⟩)
                      (.running patternCode parent) := by
                    have hobserve : (Table.ofControl entry).step
                        (.running entry
                          ⟨focus, .right sibling :: parents⟩) =
                        .running afterIncoming
                          ⟨focus, .right sibling :: parents⟩ := by
                      rw [Table.step_running_of_mem hincoming]
                      simp [entry, compileParent, afterIncoming, patternCode,
                        Control.instruction, executeInstruction]
                    have hup : (Table.ofControl entry).step
                        (.running afterIncoming
                          ⟨focus, .right sibling :: parents⟩) =
                        .running patternCode parent := by
                      rw [Table.step_running_of_mem hafterIncoming]
                      simp [afterIncoming, patternCode, parent,
                        Control.instruction, executeInstruction, Primitive.exec,
                        Cursor.up?]
                    exact RunsN.trans (RunsN.single hobserve)
                      (RunsN.single hup)
                  have hprobe := compile_runs pattern (.move .R yes)
                    (.move .R no) entry parent hpatternIncluded
                  cases hmatch : Pattern.matchesBool pattern
                      (.app sibling focus) with
                  | false =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app sibling focus))
                          (.running patternCode parent)
                          (.running (.move .R no) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .R no) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .R yes) (.move .R no) (.app sibling focus)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .R no)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .R no) parent)
                          (.running no
                            ⟨focus, .right sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hanswerMem : no ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .R yes) (.move .R no) (.app sibling focus)
                        simp [hmatch, Control.nodes]
                      have hanswer : RunsN (Table.ofControl entry) 1
                          (.running no ⟨focus, .right sibling :: parents⟩)
                          (.done false
                            ⟨focus, .right sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hanswerMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans (RunsN.trans hprefix hprobe') hreturn)
                        hanswer
                      have hcount :
                          ((2 + probeCost pattern (.app sibling focus)) + 1) +
                              1 =
                            probeCost pattern (.app sibling focus) + 4 := by
                        exact four_step_count _
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall
                  | true =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app sibling focus))
                          (.running patternCode parent)
                          (.running (.move .R yes) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .R yes) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .R yes) (.move .R no) (.app sibling focus)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .R yes)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .R yes) parent)
                          (.running yes
                            ⟨focus, .right sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hanswerMem : yes ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .R yes) (.move .R no) (.app sibling focus)
                        simp [hmatch, Control.nodes]
                      have hanswer : RunsN (Table.ofControl entry) 1
                          (.running yes ⟨focus, .right sibling :: parents⟩)
                          (.done true
                            ⟨focus, .right sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hanswerMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans (RunsN.trans hprefix hprobe') hreturn)
                        hanswer
                      have hcount :
                          ((2 + probeCost pattern (.app sibling focus)) + 1) +
                              1 =
                            probeCost pattern (.app sibling focus) + 4 := by
                        exact four_step_count _
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall

/--
The proper prefix of a parent-probe execution stops at the selected answer
row.  Keeping this boundary explicit lets clients replace the table's
terminal answer instruction with their own Boolean continuation.
-/
theorem parent_runs_to_answer
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    RunsN (parentTable side pattern) (parentCost side pattern origin - 1)
      (.running (parentTable side pattern).entry origin)
      (.running (.answer (Probe.parentMatches side pattern origin)) origin) := by
  let yes : Control := .answer true
  let no : Control := .answer false
  let entry := compileParent side pattern yes no
  cases origin with
  | mk focus parents =>
      cases parents with
      | nil =>
          cases side with
          | left =>
              have hentry : entry ∈ entry.nodes := Control.self_mem_nodes entry
              have hobserve : (Table.ofControl entry).step
                  (.running entry ⟨focus, []⟩) =
                  .running no ⟨focus, []⟩ := by
                rw [Table.step_running_of_mem hentry]
                simp [entry, compileParent, Control.instruction,
                  executeInstruction]
              simpa [parentTable, parentControl, entry, yes, no, parentCost,
                Probe.parentMatches] using RunsN.single hobserve
          | right =>
              have hentry : entry ∈ entry.nodes := Control.self_mem_nodes entry
              have hobserve : (Table.ofControl entry).step
                  (.running entry ⟨focus, []⟩) =
                  .running no ⟨focus, []⟩ := by
                rw [Table.step_running_of_mem hentry]
                simp [entry, compileParent, Control.instruction,
                  executeInstruction]
              simpa [parentTable, parentControl, entry, yes, no, parentCost,
                Probe.parentMatches] using RunsN.single hobserve
      | cons frame parents =>
          cases frame with
          | left sibling =>
              cases side with
              | right =>
                  have hentry : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hobserve : (Table.ofControl entry).step
                      (.running entry ⟨focus, .left sibling :: parents⟩) =
                      .running no ⟨focus, .left sibling :: parents⟩ := by
                    rw [Table.step_running_of_mem hentry]
                    simp [entry, compileParent, Control.instruction,
                      executeInstruction]
                  simpa [parentTable, parentControl, entry, yes, no,
                    parentCost, Probe.parentMatches] using RunsN.single hobserve
              | left =>
                  let parent : Cursor := ⟨.app focus sibling, parents⟩
                  let patternCode :=
                    compile pattern (.move .L yes) (.move .L no)
                  let afterIncoming : Control := .move .U patternCode
                  have hincoming : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hafterIncoming : afterIncoming ∈ entry.nodes := by
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes]
                  have hpatternIncluded :
                      ∀ pc, pc ∈ patternCode.nodes → pc ∈ entry.nodes := by
                    intro pc hpc
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes, hpc]
                  have hprefix : RunsN (Table.ofControl entry) 2
                      (.running entry ⟨focus, .left sibling :: parents⟩)
                      (.running patternCode parent) := by
                    have hobserve : (Table.ofControl entry).step
                        (.running entry ⟨focus, .left sibling :: parents⟩) =
                        .running afterIncoming
                          ⟨focus, .left sibling :: parents⟩ := by
                      rw [Table.step_running_of_mem hincoming]
                      simp [entry, compileParent, afterIncoming, patternCode,
                        Control.instruction, executeInstruction]
                    have hup : (Table.ofControl entry).step
                        (.running afterIncoming
                          ⟨focus, .left sibling :: parents⟩) =
                        .running patternCode parent := by
                      rw [Table.step_running_of_mem hafterIncoming]
                      simp [afterIncoming, patternCode, parent,
                        Control.instruction, executeInstruction, Primitive.exec,
                        Cursor.up?]
                    exact RunsN.trans (RunsN.single hobserve)
                      (RunsN.single hup)
                  have hprobe := compile_runs pattern (.move .L yes)
                    (.move .L no) entry parent hpatternIncluded
                  cases hmatch : Pattern.matchesBool pattern
                      (.app focus sibling) with
                  | false =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app focus sibling))
                          (.running patternCode parent)
                          (.running (.move .L no) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .L no) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .L yes) (.move .L no) (.app focus sibling)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .L no)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .L no) parent)
                          (.running no ⟨focus, .left sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans hprefix hprobe') hreturn
                      have hcount :
                          (2 + probeCost pattern (.app focus sibling)) + 1 =
                            (probeCost pattern (.app focus sibling) + 4) - 1 := by
                        let count := probeCost pattern (.app focus sibling)
                        change (2 + count) + 1 = (count + 4) - 1
                        rw [Nat.add_comm 2 count]
                        change count + 3 = (count + 3 + 1) - 1
                        rw [Nat.add_sub_cancel]
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall
                  | true =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app focus sibling))
                          (.running patternCode parent)
                          (.running (.move .L yes) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .L yes) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .L yes) (.move .L no) (.app focus sibling)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .L yes)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .L yes) parent)
                          (.running yes ⟨focus, .left sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans hprefix hprobe') hreturn
                      have hcount :
                          (2 + probeCost pattern (.app focus sibling)) + 1 =
                            (probeCost pattern (.app focus sibling) + 4) - 1 := by
                        let count := probeCost pattern (.app focus sibling)
                        change (2 + count) + 1 = (count + 4) - 1
                        rw [Nat.add_comm 2 count]
                        change count + 3 = (count + 3 + 1) - 1
                        rw [Nat.add_sub_cancel]
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall
          | right sibling =>
              cases side with
              | left =>
                  have hentry : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hobserve : (Table.ofControl entry).step
                      (.running entry ⟨focus, .right sibling :: parents⟩) =
                      .running no ⟨focus, .right sibling :: parents⟩ := by
                    rw [Table.step_running_of_mem hentry]
                    simp [entry, compileParent, Control.instruction,
                      executeInstruction]
                  simpa [parentTable, parentControl, entry, yes, no,
                    parentCost, Probe.parentMatches] using RunsN.single hobserve
              | right =>
                  let parent : Cursor := ⟨.app sibling focus, parents⟩
                  let patternCode :=
                    compile pattern (.move .R yes) (.move .R no)
                  let afterIncoming : Control := .move .U patternCode
                  have hincoming : entry ∈ entry.nodes :=
                    Control.self_mem_nodes entry
                  have hafterIncoming : afterIncoming ∈ entry.nodes := by
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes]
                  have hpatternIncluded :
                      ∀ pc, pc ∈ patternCode.nodes → pc ∈ entry.nodes := by
                    intro pc hpc
                    simp [entry, compileParent, afterIncoming, patternCode,
                      Control.nodes, hpc]
                  have hprefix : RunsN (Table.ofControl entry) 2
                      (.running entry ⟨focus, .right sibling :: parents⟩)
                      (.running patternCode parent) := by
                    have hobserve : (Table.ofControl entry).step
                        (.running entry ⟨focus, .right sibling :: parents⟩) =
                        .running afterIncoming
                          ⟨focus, .right sibling :: parents⟩ := by
                      rw [Table.step_running_of_mem hincoming]
                      simp [entry, compileParent, afterIncoming, patternCode,
                        Control.instruction, executeInstruction]
                    have hup : (Table.ofControl entry).step
                        (.running afterIncoming
                          ⟨focus, .right sibling :: parents⟩) =
                        .running patternCode parent := by
                      rw [Table.step_running_of_mem hafterIncoming]
                      simp [afterIncoming, patternCode, parent,
                        Control.instruction, executeInstruction, Primitive.exec,
                        Cursor.up?]
                    exact RunsN.trans (RunsN.single hobserve)
                      (RunsN.single hup)
                  have hprobe := compile_runs pattern (.move .R yes)
                    (.move .R no) entry parent hpatternIncluded
                  cases hmatch : Pattern.matchesBool pattern
                      (.app sibling focus) with
                  | false =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app sibling focus))
                          (.running patternCode parent)
                          (.running (.move .R no) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .R no) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .R yes) (.move .R no) (.app sibling focus)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .R no)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .R no) parent)
                          (.running no ⟨focus, .right sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans hprefix hprobe') hreturn
                      have hcount :
                          (2 + probeCost pattern (.app sibling focus)) + 1 =
                            (probeCost pattern (.app sibling focus) + 4) - 1 := by
                        let count := probeCost pattern (.app sibling focus)
                        change (2 + count) + 1 = (count + 4) - 1
                        rw [Nat.add_comm 2 count]
                        change count + 3 = (count + 3 + 1) - 1
                        rw [Nat.add_sub_cancel]
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall
                  | true =>
                      have hprobe' : RunsN (Table.ofControl entry)
                          (probeCost pattern (.app sibling focus))
                          (.running patternCode parent)
                          (.running (.move .R yes) parent) := by
                        simpa [patternCode, parent, hmatch] using hprobe
                      have hreturnMem : (.move .R yes) ∈ entry.nodes := by
                        apply hpatternIncluded
                        apply selected_nodes_in_compile pattern
                          (.move .R yes) (.move .R no) (.app sibling focus)
                        simpa [hmatch] using
                          Control.self_mem_nodes (.move .R yes)
                      have hreturn : RunsN (Table.ofControl entry) 1
                          (.running (.move .R yes) parent)
                          (.running yes ⟨focus, .right sibling :: parents⟩) := by
                        apply RunsN.single
                        rw [Table.step_running_of_mem hreturnMem]
                        rfl
                      have hall := RunsN.trans
                        (RunsN.trans hprefix hprobe') hreturn
                      have hcount :
                          (2 + probeCost pattern (.app sibling focus)) + 1 =
                            (probeCost pattern (.app sibling focus) + 4) - 1 := by
                        let count := probeCost pattern (.app sibling focus)
                        change (2 + count) + 1 = (count + 4) - 1
                        rw [Nat.add_comm 2 count]
                        change count + 3 = (count + 3 + 1) - 1
                        rw [Nat.add_sub_cancel]
                      rw [hcount] at hall
                      simpa [parentTable, parentControl, entry, yes, no,
                        parent, patternCode, parentCost, Probe.parentMatches,
                        hmatch] using hall

theorem parent_run (side : Direction) (pattern : Pattern) (origin : Cursor) :
    (parentTable side pattern).run (parentCost side pattern origin)
      (.running (parentTable side pattern).entry origin) =
      .done (Probe.parentMatches side pattern origin) origin :=
  (parent_runs side pattern origin).run_eq

/-- A parent probe also terminates under its fixed pattern-only fuel bound. -/
theorem parent_run_at_bound
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    (parentTable side pattern).run (parentExecutionBound pattern)
      (.running (parentTable side pattern).entry origin) =
      .done (Probe.parentMatches side pattern origin) origin := by
  obtain ⟨remaining, hbound⟩ := Nat.exists_eq_add_of_le
    (parentCost_le_bound side pattern origin)
  rw [hbound, Table.run_add, parent_run, Table.run_done]

theorem parent_run_ne_reject
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    (parentTable side pattern).run (parentCost side pattern origin)
      (.running (parentTable side pattern).entry origin) ≠ .reject := by
  rw [parent_run]
  intro h
  cases h

/-- Every prefix and every fuel extension of a parent probe avoids `Reject`. -/
theorem parent_never_rejects
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    ∀ fuel,
      (parentTable side pattern).run fuel
        (.running (parentTable side pattern).entry origin) ≠ .reject := by
  exact Table.neverRejects_of_run_done (parent_run side pattern origin)

theorem parent_run_restores
    (side : Direction) (pattern : Pattern) (origin returned : Cursor)
    (accepted : Bool)
    (h : (parentTable side pattern).run (parentCost side pattern origin)
      (.running (parentTable side pattern).entry origin) =
        .done accepted returned) :
    accepted = Probe.parentMatches side pattern origin ∧ returned = origin := by
  rw [parent_run] at h
  cases h
  exact ⟨rfl, rfl⟩

theorem parent_success_iff
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    (parentTable side pattern).run (parentCost side pattern origin)
        (.running (parentTable side pattern).entry origin) = .done true origin ↔
      Probe.parentMatches side pattern origin = true := by
  rw [parent_run]
  simp

theorem parent_left_success_iff
    (pattern : Pattern) (focus sibling : Term) (parents : List ParentFrame) :
    (parentTable .left pattern).run
        (parentCost .left pattern ⟨focus, .left sibling :: parents⟩)
        (.running (parentTable .left pattern).entry
          ⟨focus, .left sibling :: parents⟩) =
          .done true ⟨focus, .left sibling :: parents⟩ ↔
      Pattern.Matches pattern (.app focus sibling) := by
  rw [parent_success_iff]
  change Pattern.matchesBool pattern (.app focus sibling) = true ↔ _
  exact Pattern.matchesBool_eq_true_iff _ _

theorem parent_right_success_iff
    (pattern : Pattern) (focus sibling : Term) (parents : List ParentFrame) :
    (parentTable .right pattern).run
        (parentCost .right pattern ⟨focus, .right sibling :: parents⟩)
        (.running (parentTable .right pattern).entry
          ⟨focus, .right sibling :: parents⟩) =
          .done true ⟨focus, .right sibling :: parents⟩ ↔
      Pattern.Matches pattern (.app sibling focus) := by
  rw [parent_success_iff]
  change Pattern.matchesBool pattern (.app sibling focus) = true ↔ _
  exact Pattern.matchesBool_eq_true_iff _ _

theorem parent_mismatch_iff
    (side : Direction) (pattern : Pattern) (origin : Cursor) :
    (parentTable side pattern).run (parentCost side pattern origin)
        (.running (parentTable side pattern).entry origin) = .done false origin ↔
      Probe.parentMatches side pattern origin = false := by
  rw [parent_run]
  cases Probe.parentMatches side pattern origin <;> simp

end ProbeCompiler

end PureSFormal.PureS
