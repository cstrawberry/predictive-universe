import PureSFormal.PureS.SchedulerControl

/-!
# Whole-program execution lemmas for the scheduler compiler

The scheduler stores bounded program counters for literal cursor scripts and
for compiled probes.  This module proves once, at that implementation level,
that running all remaining rows has the same result as the corresponding
compact `Script.run` or probe-table execution.  The reachable-mode proof can
therefore compose semantic phases without reopening every program-counter
case.
-/

namespace PureSFormal.PureS

namespace SchedulerExecution

open FiniteController SchedulerControl

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

private theorem rdxCount_singleton_add (operation : Primitive)
    (rest : Script) :
    Script.rdxCount [operation] + Script.rdxCount rest =
      Script.rdxCount (operation :: rest) := by
  cases operation <;> simp [Script.rdxCount]

/-! ## Literal fixed scripts -/

/-- One successful nonterminal script row is exactly one machine row. -/
theorem step_script
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : ScriptJob program) (registers : Registers program)
    (pc : ScriptPC program dispatcher job)
    (before after : Cursor)
    (pc_lt : pc.val < (jobScript program dispatcher job).length)
    (executes :
      ((jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩).exec before =
        some after) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        ⟨some (.script job pc registers), before⟩ =
      ⟨some (.script job
        (nextScriptPC program dispatcher job pc pc_lt) registers), after⟩ := by
  unfold FiniteController.step SchedulerControl.machine
  simp only
  rw [SchedulerControl.transition_script_step job pc registers
    (Probe.observeNode before) (Probe.observeIncoming before) pc_lt]
  change (match
      ((jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩).exec before with
    | none => (⟨none, before⟩ : Configuration program dispatcher)
    | some cursor =>
        (⟨some (.script job
          (nextScriptPC program dispatcher job pc pc_lt) registers), cursor⟩ :
          Configuration program dispatcher)) = _
  rw [executes]

/-- The mutation counter of a successful script row matches its instruction. -/
theorem mutationCount_script
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : ScriptJob program) (registers : Registers program)
    (pc : ScriptPC program dispatcher job)
    (before after : Cursor)
    (pc_lt : pc.val < (jobScript program dispatcher job).length)
    (executes :
      ((jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩).exec before =
        some after) :
    FiniteController.mutationCount
        (SchedulerControl.machine program dispatcher)
        ⟨some (.script job pc registers), before⟩ =
      Script.rdxCount
        [((jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩)] := by
  unfold FiniteController.mutationCount SchedulerControl.machine
  simp only [FiniteController.Configuration.control,
    FiniteController.Configuration.cursor]
  rw [SchedulerControl.transition_script_step job pc registers
    (Probe.observeNode before) (Probe.observeIncoming before) pc_lt]
  generalize operation_eq :
    (jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩ = operation
  cases operation with
  | L => rfl
  | R => rfl
  | U => rfl
  | Rdx =>
      rw [operation_eq] at executes
      have hrdx : before.rdx? = some after := by
        simpa only [Primitive.exec] using executes
      simp [hrdx, Script.rdxCount]

/--
Execute the exact unconsumed suffix of a scheduler script, followed by its
single epsilon exit row.  The arithmetic premise identifies the suffix
length without any minimization or hidden runtime counter.
-/
theorem run_script_suffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : ScriptJob program) (registers : Registers program)
    (pc : ScriptPC program dispatcher job) (remaining : Nat)
    (before after : Cursor)
    (length_eq : pc.val + remaining =
      (jobScript program dispatcher job).length)
    (executes : Script.run
      (List.drop pc.val (jobScript program dispatcher job)) before =
        some after) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (remaining + 1)
        ⟨some (.script job pc registers), before⟩ =
      ⟨some (afterScript program dispatcher job registers), after⟩ := by
  induction remaining generalizing pc before with
  | zero =>
      have pc_at_end : pc.val =
          (jobScript program dispatcher job).length := by
        simpa only [Nat.add_zero] using length_eq
      have not_lt : ¬pc.val <
          (jobScript program dispatcher job).length := by
        rw [pc_at_end]
        exact Nat.lt_irrefl _
      have dropped : List.drop pc.val
          (jobScript program dispatcher job) = [] := by
        apply List.drop_eq_nil_of_le
        exact Nat.le_of_eq pc_at_end.symm
      rw [dropped] at executes
      have after_eq : after = before := by
        exact Option.some.inj executes.symm
      subst after
      simp only [Nat.zero_add]
      simp [FiniteController.run, FiniteController.step,
        SchedulerControl.machine, SchedulerControl.transition, not_lt]
  | succ remaining ih =>
      have positive : 0 < remaining + 1 := Nat.zero_lt_succ remaining
      have pc_lt : pc.val <
          (jobScript program dispatcher job).length := by
        exact Nat.lt_of_lt_of_eq (Nat.lt_add_of_pos_right positive) length_eq
      have dropped := List.drop_eq_getElem_cons pc_lt
      rw [dropped] at executes
      obtain ⟨middle, firstExec, restExec⟩ :=
        (Script.run_cons_eq_some_iff
          ((jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩)
          (List.drop (pc.val + 1) (jobScript program dispatcher job))
          before after).mp executes
      let next := nextScriptPC program dispatcher job pc pc_lt
      have next_length : next.val + remaining =
          (jobScript program dispatcher job).length := by
        change (pc.val + 1) + remaining = _
        calc
          (pc.val + 1) + remaining = pc.val + (1 + remaining) :=
            Nat.add_assoc _ _ _
          _ = pc.val + (remaining + 1) := by rw [Nat.add_comm 1 remaining]
          _ = (jobScript program dispatcher job).length := length_eq
      have tail := ih next middle next_length restExec
      rw [FiniteController.run_succ]
      have oneStep :
          FiniteController.step (SchedulerControl.machine program dispatcher)
              ⟨some (.script job pc registers), before⟩ =
            ⟨some (.script job next registers), middle⟩ := by
        exact step_script program dispatcher job registers pc before middle
          pc_lt firstExec
      rw [oneStep]
      exact tail

/-- A whole fixed script starts at PC zero and exits at its prescribed mode. -/
theorem run_script
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : ScriptJob program) (registers : Registers program)
    (before after : Cursor)
    (executes : Script.run (jobScript program dispatcher job) before =
      some after) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        ((jobScript program dispatcher job).length + 1)
        ⟨some (startScript (dispatcher := dispatcher) job registers), before⟩ =
      ⟨some (afterScript program dispatcher job registers), after⟩ := by
  apply run_script_suffix program dispatcher job registers
    (firstScriptPC program dispatcher job)
    (jobScript program dispatcher job).length before after
  · simp [firstScriptPC]
  · simpa [firstScriptPC] using executes

/-- Exact mutation count of an unconsumed script suffix plus its exit row. -/
theorem runMutationCount_script_suffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : ScriptJob program) (registers : Registers program)
    (pc : ScriptPC program dispatcher job) (remaining : Nat)
    (before after : Cursor)
    (length_eq : pc.val + remaining =
      (jobScript program dispatcher job).length)
    (executes : Script.run
      (List.drop pc.val (jobScript program dispatcher job)) before =
        some after) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher) (remaining + 1)
        ⟨some (.script job pc registers), before⟩ =
      Script.rdxCount
        (List.drop pc.val (jobScript program dispatcher job)) := by
  induction remaining generalizing pc before with
  | zero =>
      have pc_at_end : pc.val =
          (jobScript program dispatcher job).length := by
        simpa only [Nat.add_zero] using length_eq
      have not_lt : ¬pc.val <
          (jobScript program dispatcher job).length := by
        rw [pc_at_end]
        exact Nat.lt_irrefl _
      have dropped : List.drop pc.val
          (jobScript program dispatcher job) = [] := by
        apply List.drop_eq_nil_of_le
        exact Nat.le_of_eq pc_at_end.symm
      simp [FiniteController.runMutationCount,
        FiniteController.mutationCount, SchedulerControl.machine,
        SchedulerControl.transition, not_lt, dropped]
  | succ remaining ih =>
      have positive : 0 < remaining + 1 := Nat.zero_lt_succ remaining
      have pc_lt : pc.val <
          (jobScript program dispatcher job).length := by
        exact Nat.lt_of_lt_of_eq (Nat.lt_add_of_pos_right positive) length_eq
      have dropped := List.drop_eq_getElem_cons pc_lt
      rw [dropped] at executes
      obtain ⟨middle, firstExec, restExec⟩ :=
        (Script.run_cons_eq_some_iff
          ((jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩)
          (List.drop (pc.val + 1) (jobScript program dispatcher job))
          before after).mp executes
      let next := nextScriptPC program dispatcher job pc pc_lt
      have next_length : next.val + remaining =
          (jobScript program dispatcher job).length := by
        change (pc.val + 1) + remaining = _
        calc
          (pc.val + 1) + remaining = pc.val + (1 + remaining) :=
            Nat.add_assoc _ _ _
          _ = pc.val + (remaining + 1) := by rw [Nat.add_comm 1 remaining]
          _ = (jobScript program dispatcher job).length := length_eq
      have tail := ih next middle next_length restExec
      have oneStep := step_script program dispatcher job registers pc before
        middle pc_lt firstExec
      have oneCount := mutationCount_script program dispatcher job registers pc
        before middle pc_lt firstExec
      have tail' :
          FiniteController.runMutationCount
              (SchedulerControl.machine program dispatcher) (remaining + 1)
              ⟨some (.script job next registers), middle⟩ =
            Script.rdxCount
              (List.drop (pc.val + 1)
                (jobScript program dispatcher job)) := by
        simpa [next, nextScriptPC] using tail
      change
        FiniteController.mutationCount
            (SchedulerControl.machine program dispatcher)
            ⟨some (.script job pc registers), before⟩ +
          FiniteController.runMutationCount
            (SchedulerControl.machine program dispatcher) (remaining + 1)
            (FiniteController.step
              (SchedulerControl.machine program dispatcher)
              ⟨some (.script job pc registers), before⟩) =
          Script.rdxCount
            (List.drop pc.val (jobScript program dispatcher job))
      rw [oneStep, tail', oneCount, dropped]
      simpa using rdxCount_singleton_add
        ((jobScript program dispatcher job).get ⟨pc.val, pc_lt⟩)
        (List.drop (pc.val + 1) (jobScript program dispatcher job))

/-- A whole fixed script has exactly its syntactic number of contractions. -/
theorem runMutationCount_script
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : ScriptJob program) (registers : Registers program)
    (before after : Cursor)
    (executes : Script.run (jobScript program dispatcher job) before =
      some after) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher)
        ((jobScript program dispatcher job).length + 1)
        ⟨some (startScript (dispatcher := dispatcher) job registers), before⟩ =
      Script.rdxCount (jobScript program dispatcher job) := by
  apply runMutationCount_script_suffix program dispatcher job registers
    (firstScriptPC program dispatcher job)
    (jobScript program dispatcher job).length before after
  · simp [firstScriptPC]
  · simpa [firstScriptPC] using executes

/-! ## Compiled probes -/

/-- Every row of a compiled probe is mutation-free, including answer rows. -/
theorem mutationCount_probe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (pc : ProbePC program dispatcher kind) (cursor : Cursor) :
    FiniteController.mutationCount
        (SchedulerControl.machine program dispatcher)
        ⟨some (.probe kind pc registers), cursor⟩ = 0 := by
  rcases pc with ⟨raw, rawMem⟩
  have rawNoRdx : raw.NoRdx :=
    ProbeCompiler.Control.noRdx_of_mem_nodes
      (SchedulerControl.probeControl_noRdx kind) rawMem
  unfold FiniteController.mutationCount SchedulerControl.machine
  simp only [FiniteController.Configuration.control,
    FiniteController.Configuration.cursor]
  unfold SchedulerControl.transition SchedulerControl.probeTransition
  cases raw with
  | answer accepted =>
      cases kind <;> cases accepted <;>
        simp [SchedulerControl.probeAnswer]
      case pending.false use => cases use <;> rfl
  | observeNode onS onApp =>
      cases Probe.observeNode cursor <;> rfl
  | observeIncoming onRoot onLeft onRight =>
      cases Probe.observeIncoming cursor <;> rfl
  | move operation next =>
      cases operation with
      | L => rfl
      | R => rfl
      | U => rfl
      | Rdx => exact False.elim rawNoRdx

private theorem runsN_from_done
    (table : ProbeCompiler.Table) (accepted : Bool) (cursor : Cursor) :
    ∀ (ticks : Nat) (target : ProbeCompiler.State),
      ProbeCompiler.RunsN table ticks (.done accepted cursor) target →
        target = .done accepted cursor
  | 0, _target, trace => by
      cases trace
      rfl
  | ticks + 1, target, trace => by
      cases trace with
      | @head _ _ middle _ first rest =>
          have middle_eq : middle = ProbeCompiler.State.done accepted cursor := by
            simpa [ProbeCompiler.Table.step] using first.symm
          subst_vars
          exact runsN_from_done table accepted cursor ticks target rest

private theorem runsN_from_reject (table : ProbeCompiler.Table) :
    ∀ (ticks : Nat) (target : ProbeCompiler.State),
      ProbeCompiler.RunsN table ticks .reject target → target = .reject
  | 0, _target, trace => by
      cases trace
      rfl
  | ticks + 1, target, trace => by
      cases trace with
      | @head _ _ middle _ first rest =>
          have middle_eq : middle = ProbeCompiler.State.reject := by
            simpa [ProbeCompiler.Table.step] using first.symm
          subst_vars
          exact runsN_from_reject table ticks target rest

/--
One table row that remains inside a compiled probe is exactly one scheduler
row.  The returned subtype proof shows that the successor PC still belongs
to the same fixed probe table.
-/
theorem step_probe_running
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (pc : ProbePC program dispatcher kind) (before : Cursor)
    (targetRaw : ProbeCompiler.Control) (targetCursor : Cursor)
    (tableStep :
      (compiledProbeTable program dispatcher kind).step
          (.running pc.val before) = .running targetRaw targetCursor) :
    ∃ next : ProbePC program dispatcher kind,
      next.val = targetRaw ∧
      FiniteController.step (SchedulerControl.machine program dispatcher)
          ⟨some (.probe kind pc registers), before⟩ =
        ⟨some (.probe kind next registers), targetCursor⟩ := by
  rcases pc with ⟨raw, rawMem⟩
  simp only at tableStep
  unfold compiledProbeTable at tableStep
  rw [ProbeCompiler.Table.step_running_of_mem rawMem] at tableStep
  cases raw with
  | answer accepted =>
      simp [ProbeCompiler.Control.instruction,
        ProbeCompiler.executeInstruction] at tableStep
  | observeNode onS onApp =>
      cases observed : Probe.observeNode before with
      | s =>
          have targetEq : ProbeCompiler.State.running onS before =
              .running targetRaw targetCursor := by
            simpa [ProbeCompiler.Control.instruction,
              ProbeCompiler.executeInstruction, observed] using tableStep
          cases targetEq
          let next : ProbePC program dispatcher kind :=
            ⟨targetRaw, SchedulerControl.probeNodes_closed rawMem (by
              simp [ProbeCompiler.Control.nodes])⟩
          refine ⟨next, rfl, ?_⟩
          simp [FiniteController.step, SchedulerControl.machine,
            SchedulerControl.transition, SchedulerControl.probeTransition,
            observed, next]
      | app =>
          have targetEq : ProbeCompiler.State.running onApp before =
              .running targetRaw targetCursor := by
            simpa [ProbeCompiler.Control.instruction,
              ProbeCompiler.executeInstruction, observed] using tableStep
          cases targetEq
          let next : ProbePC program dispatcher kind :=
            ⟨targetRaw, SchedulerControl.probeNodes_closed rawMem (by
              simp [ProbeCompiler.Control.nodes])⟩
          refine ⟨next, rfl, ?_⟩
          simp [FiniteController.step, SchedulerControl.machine,
            SchedulerControl.transition, SchedulerControl.probeTransition,
            observed, next]
  | observeIncoming onRoot onLeft onRight =>
      cases observed : Probe.observeIncoming before with
      | root =>
          have targetEq : ProbeCompiler.State.running onRoot before =
              .running targetRaw targetCursor := by
            simpa [ProbeCompiler.Control.instruction,
              ProbeCompiler.executeInstruction, observed] using tableStep
          cases targetEq
          let next : ProbePC program dispatcher kind :=
            ⟨targetRaw, SchedulerControl.probeNodes_closed rawMem (by
              simp [ProbeCompiler.Control.nodes])⟩
          refine ⟨next, rfl, ?_⟩
          simp [FiniteController.step, SchedulerControl.machine,
            SchedulerControl.transition, SchedulerControl.probeTransition,
            observed, next]
      | left =>
          have targetEq : ProbeCompiler.State.running onLeft before =
              .running targetRaw targetCursor := by
            simpa [ProbeCompiler.Control.instruction,
              ProbeCompiler.executeInstruction, observed] using tableStep
          cases targetEq
          let next : ProbePC program dispatcher kind :=
            ⟨targetRaw, SchedulerControl.probeNodes_closed rawMem (by
              simp [ProbeCompiler.Control.nodes])⟩
          refine ⟨next, rfl, ?_⟩
          simp [FiniteController.step, SchedulerControl.machine,
            SchedulerControl.transition, SchedulerControl.probeTransition,
            observed, next]
      | right =>
          have targetEq : ProbeCompiler.State.running onRight before =
              .running targetRaw targetCursor := by
            simpa [ProbeCompiler.Control.instruction,
              ProbeCompiler.executeInstruction, observed] using tableStep
          cases targetEq
          let next : ProbePC program dispatcher kind :=
            ⟨targetRaw, SchedulerControl.probeNodes_closed rawMem (by
              simp [ProbeCompiler.Control.nodes])⟩
          refine ⟨next, rfl, ?_⟩
          simp [FiniteController.step, SchedulerControl.machine,
            SchedulerControl.transition, SchedulerControl.probeTransition,
            observed, next]
  | move operation successor =>
      cases moved : operation.exec before with
      | none =>
          simp [ProbeCompiler.Control.instruction,
            ProbeCompiler.executeInstruction, moved] at tableStep
      | some movedCursor =>
          have targetEq : ProbeCompiler.State.running successor movedCursor =
              .running targetRaw targetCursor := by
            simpa [ProbeCompiler.Control.instruction,
              ProbeCompiler.executeInstruction, moved] using tableStep
          cases targetEq
          let next : ProbePC program dispatcher kind :=
            ⟨targetRaw, SchedulerControl.probeNodes_closed rawMem (by
              simp [ProbeCompiler.Control.nodes])⟩
          refine ⟨next, rfl, ?_⟩
          simp [FiniteController.step, SchedulerControl.machine,
            SchedulerControl.transition, SchedulerControl.probeTransition,
            moved, next]

/-- Every exact table trace between running probe PCs is an exact scheduler run. -/
theorem run_probe_running_trace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program) :
    ∀ (ticks : Nat) (source target : ProbePC program dispatcher kind)
      (before after : Cursor),
      ProbeCompiler.RunsN (compiledProbeTable program dispatcher kind) ticks
          (.running source.val before) (.running target.val after) →
        FiniteController.run (SchedulerControl.machine program dispatcher) ticks
            ⟨some (.probe kind source registers), before⟩ =
          ⟨some (.probe kind target registers), after⟩
  | 0, _source, _target, _before, _after, trace => by
      have stateEq : ProbeCompiler.State.running _source.val _before =
          .running _target.val _after := by
        simpa using trace.run_eq
      have parts := ProbeCompiler.State.running.inj stateEq
      have controlEq : _source = _target := Subtype.ext parts.1
      have cursorEq : _before = _after := parts.2
      subst _target
      rw [cursorEq]
      rfl
  | ticks + 1, source, target, before, after, trace => by
      cases trace with
      | @head _ _ middle _ first rest =>
          cases middle with
          | done accepted cursor =>
              have impossible := runsN_from_done
                (compiledProbeTable program dispatcher kind) accepted cursor
                ticks (.running target.val after) rest
              cases impossible
          | reject =>
              have impossible := runsN_from_reject
                (compiledProbeTable program dispatcher kind) ticks
                (.running target.val after) rest
              cases impossible
          | running middleRaw middleCursor =>
              obtain ⟨middlePC, middleValue, schedulerStep⟩ :=
                step_probe_running program dispatcher kind registers source
                  before middleRaw middleCursor first
              have rest' : ProbeCompiler.RunsN
                  (compiledProbeTable program dispatcher kind) ticks
                  (.running middlePC.val middleCursor)
                  (.running target.val after) := by
                simpa [middleValue] using rest
              have tail := run_probe_running_trace program dispatcher kind
                registers ticks middlePC target middleCursor after rest'
              rw [FiniteController.run_succ, schedulerStep]
              exact tail

/-- A running-to-running compiled-probe trace performs no S contractions. -/
theorem runMutationCount_probe_running_trace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program) :
    ∀ (ticks : Nat) (source target : ProbePC program dispatcher kind)
      (before after : Cursor),
      ProbeCompiler.RunsN (compiledProbeTable program dispatcher kind) ticks
          (.running source.val before) (.running target.val after) →
        FiniteController.runMutationCount
            (SchedulerControl.machine program dispatcher) ticks
            ⟨some (.probe kind source registers), before⟩ = 0
  | 0, _source, _target, _before, _after, _trace => rfl
  | ticks + 1, source, target, before, after, trace => by
      cases trace with
      | @head _ _ middle _ first rest =>
          cases middle with
          | done accepted cursor =>
              have impossible := runsN_from_done
                (compiledProbeTable program dispatcher kind) accepted cursor
                ticks (.running target.val after) rest
              cases impossible
          | reject =>
              have impossible := runsN_from_reject
                (compiledProbeTable program dispatcher kind) ticks
                (.running target.val after) rest
              cases impossible
          | running middleRaw middleCursor =>
              obtain ⟨middlePC, middleValue, schedulerStep⟩ :=
                step_probe_running program dispatcher kind registers source
                  before middleRaw middleCursor first
              have rest' : ProbeCompiler.RunsN
                  (compiledProbeTable program dispatcher kind) ticks
                  (.running middlePC.val middleCursor)
                  (.running target.val after) := by
                simpa [middleValue] using rest
              have tail := runMutationCount_probe_running_trace
                program dispatcher kind registers ticks middlePC target
                middleCursor after rest'
              simp only [FiniteController.runMutationCount]
              rw [mutationCount_probe, schedulerStep, tail]

/-- Adding the terminal Boolean row to a probe prefix still has zero count. -/
theorem runMutationCount_probe_to_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (ticks : Nat) (source : ProbePC program dispatcher kind)
    (accepted : Bool)
    (answerMem : ProbeCompiler.Control.answer accepted ∈
      (probeControl program dispatcher kind).nodes)
    (origin : Cursor)
    (trace : ProbeCompiler.RunsN
      (compiledProbeTable program dispatcher kind) ticks
      (.running source.val origin)
      (.running (.answer accepted) origin)) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher) (ticks + 1)
        ⟨some (.probe kind source registers), origin⟩ = 0 := by
  let answerPC : ProbePC program dispatcher kind :=
    ⟨.answer accepted, answerMem⟩
  have trace' : ProbeCompiler.RunsN
      (compiledProbeTable program dispatcher kind) ticks
      (.running source.val origin) (.running answerPC.val origin) := by
    simpa [answerPC] using trace
  have prefixCount := runMutationCount_probe_running_trace
    program dispatcher kind registers ticks source answerPC origin origin trace'
  have prefixRun := run_probe_running_trace
    program dispatcher kind registers ticks source answerPC origin origin trace'
  rw [FiniteController.runMutationCount_add]
  rw [prefixCount, prefixRun]
  simp [FiniteController.runMutationCount, mutationCount_probe]

/-- A probe answer row applies its fixed Boolean continuation without moving. -/
theorem step_probe_answer_stay
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (accepted : Bool)
    (answerMem : ProbeCompiler.Control.answer accepted ∈
      (probeControl program dispatcher kind).nodes)
    (cursor : Cursor) (next : SchedulerControl.Control program dispatcher)
    (answer : probeAnswer program dispatcher kind accepted registers =
      .stay next) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        ⟨some (.probe kind ⟨.answer accepted, answerMem⟩ registers), cursor⟩ =
      ⟨some next, cursor⟩ := by
  simp [FiniteController.step, SchedulerControl.machine,
    SchedulerControl.transition, SchedulerControl.probeTransition, answer]

/-- A rejecting Boolean continuation reaches the unique rejecting sink. -/
theorem step_probe_answer_reject
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (accepted : Bool)
    (answerMem : ProbeCompiler.Control.answer accepted ∈
      (probeControl program dispatcher kind).nodes)
    (cursor : Cursor)
    (answer : probeAnswer program dispatcher kind accepted registers =
      .reject) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        ⟨some (.probe kind ⟨.answer accepted, answerMem⟩ registers), cursor⟩ =
      ⟨none, cursor⟩ := by
  simp [FiniteController.step, SchedulerControl.machine,
    SchedulerControl.transition, SchedulerControl.probeTransition, answer]

/-- Execute a controller command at one cursor, in the same form used by `step`. -/
def commandResult
    (command : FiniteController.Command
      (SchedulerControl.Control program dispatcher))
    (cursor : Cursor) : Configuration program dispatcher :=
  match command with
  | .stay next => ⟨some next, cursor⟩
  | .reject => ⟨none, cursor⟩
  | .exec primitive next =>
      match primitive.exec cursor with
      | none => ⟨none, cursor⟩
      | some after => ⟨some next, after⟩

/-- General form of a probe answer row. -/
theorem step_probe_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (accepted : Bool)
    (answerMem : ProbeCompiler.Control.answer accepted ∈
      (probeControl program dispatcher kind).nodes)
    (cursor : Cursor) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        ⟨some (.probe kind ⟨.answer accepted, answerMem⟩ registers), cursor⟩ =
      commandResult
        (probeAnswer program dispatcher kind accepted registers) cursor := by
  generalize command_eq :
    probeAnswer program dispatcher kind accepted registers = command
  unfold FiniteController.step SchedulerControl.machine
  simp only
  rw [show SchedulerControl.transition program dispatcher
      (.probe kind ⟨.answer accepted, answerMem⟩ registers)
      (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command by
    simp [SchedulerControl.transition, SchedulerControl.probeTransition,
      command_eq]]
  unfold commandResult
  cases command with
  | stay next => rfl
  | reject => rfl
  | exec primitive next =>
      cases primitive.exec cursor <;> rfl

/--
A local-site compiled probe runs through its exact pattern trace, restores the
origin cursor, and executes precisely the Boolean continuation row.
-/
theorem run_localProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (origin : Cursor) (localSite : probeSite kind = .local) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (compiledProbeCost program dispatcher kind origin)
        ⟨some (startProbe kind registers), origin⟩ =
      commandResult
        (probeAnswer program dispatcher kind
          (compiledProbeAnswer program dispatcher kind origin) registers)
        origin := by
  let pattern := probePattern program dispatcher kind
  let accepted := Pattern.matchesBool pattern origin.focus
  let selected : ProbeCompiler.Control := .answer accepted
  have selectedMem : selected ∈ (probeControl program dispatcher kind).nodes := by
    unfold probeControl
    rw [localSite]
    dsimp [selected, accepted, ProbeCompiler.patternControl, pattern]
    cases matched : Pattern.matchesBool
        (probePattern program dispatcher kind) origin.focus with
    | false =>
        apply ProbeCompiler.selected_nodes_in_compile
          (probePattern program dispatcher kind) (.answer true) (.answer false)
          origin.focus
        simpa [matched] using
          ProbeCompiler.Control.self_mem_nodes (.answer false)
    | true =>
        apply ProbeCompiler.selected_nodes_in_compile
          (probePattern program dispatcher kind) (.answer true) (.answer false)
          origin.focus
        simpa [matched] using
          ProbeCompiler.Control.self_mem_nodes (.answer true)
  let selectedPC : ProbePC program dispatcher kind := ⟨selected, selectedMem⟩
  have coreTrace : ProbeCompiler.RunsN
      (compiledProbeTable program dispatcher kind)
      (ProbeCompiler.probeCost pattern origin.focus)
      (.running (firstProbePC program dispatcher kind).val origin)
      (.running selectedPC.val origin) := by
    have trace := ProbeCompiler.compile_runs pattern (.answer true) (.answer false)
      (ProbeCompiler.patternControl pattern) origin (fun _pc membership => membership)
    cases matched : Pattern.matchesBool
        (probePattern program dispatcher kind) origin.focus with
    | false =>
        simpa [compiledProbeTable, probeControl, localSite,
          ProbeCompiler.patternControl, firstProbePC, pattern, selectedPC, selected,
          accepted, matched] using trace
    | true =>
        simpa [compiledProbeTable, probeControl, localSite,
          ProbeCompiler.patternControl, firstProbePC, pattern, selectedPC, selected,
          accepted, matched] using trace
  have coreRun := run_probe_running_trace program dispatcher kind registers
    (ProbeCompiler.probeCost pattern origin.focus)
    (firstProbePC program dispatcher kind) selectedPC origin origin coreTrace
  have answerStep := step_probe_answer program dispatcher kind registers accepted
    selectedMem origin
  unfold compiledProbeCost compiledProbeAnswer
  rw [localSite]
  change FiniteController.run (SchedulerControl.machine program dispatcher)
      (ProbeCompiler.probeCost pattern origin.focus + 1)
      ⟨some (startProbe kind registers), origin⟩ = _
  rw [FiniteController.run_add]
  change FiniteController.run (SchedulerControl.machine program dispatcher) 1
      (FiniteController.run (SchedulerControl.machine program dispatcher)
        (ProbeCompiler.probeCost pattern origin.focus)
        ⟨some (.probe kind (firstProbePC program dispatcher kind) registers),
          origin⟩) =
      commandResult
        (probeAnswer program dispatcher kind accepted registers) origin
  rw [coreRun]
  change FiniteController.step (SchedulerControl.machine program dispatcher)
      ⟨some (.probe kind selectedPC registers), origin⟩ = _
  simpa [selectedPC, selected, accepted, pattern] using answerStep

/-- A complete local-site probe contributes zero scheduler contractions. -/
theorem runMutationCount_localProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (origin : Cursor) (localSite : probeSite kind = .local) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher)
        (compiledProbeCost program dispatcher kind origin)
        ⟨some (startProbe kind registers), origin⟩ = 0 := by
  let pattern := probePattern program dispatcher kind
  let accepted := Pattern.matchesBool pattern origin.focus
  have answerMem : ProbeCompiler.Control.answer accepted ∈
      (probeControl program dispatcher kind).nodes := by
    unfold probeControl
    rw [localSite]
    exact ProbeCompiler.answer_mem_patternControl pattern origin.focus
  have trace : ProbeCompiler.RunsN
      (compiledProbeTable program dispatcher kind)
      (ProbeCompiler.probeCost pattern origin.focus)
      (.running (firstProbePC program dispatcher kind).val origin)
      (.running (.answer accepted) origin) := by
    simpa [compiledProbeTable, probeControl, localSite,
      ProbeCompiler.patternTable, firstProbePC, accepted, pattern]
      using ProbeCompiler.pattern_runs_to_answer pattern origin
  have count := runMutationCount_probe_to_answer program dispatcher kind
    registers (ProbeCompiler.probeCost pattern origin.focus)
    (firstProbePC program dispatcher kind) accepted answerMem origin trace
  simpa [compiledProbeCost, localSite, startProbe, pattern] using count

/--
A parent-site compiled probe executes its incoming-edge test and bounded
parent walk, restores the original cursor, and applies the exact Boolean
continuation row.
-/
theorem run_parentProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (origin : Cursor) (side : Direction)
    (parentSite : probeSite kind = .parent side) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (compiledProbeCost program dispatcher kind origin)
        ⟨some (startProbe kind registers), origin⟩ =
      commandResult
        (probeAnswer program dispatcher kind
          (compiledProbeAnswer program dispatcher kind origin) registers)
        origin := by
  let pattern := probePattern program dispatcher kind
  let accepted := Probe.parentMatches side pattern origin
  have selectedMem : ProbeCompiler.Control.answer accepted ∈
      (probeControl program dispatcher kind).nodes := by
    unfold probeControl
    rw [parentSite]
    exact ProbeCompiler.answer_mem_parentControl side pattern accepted
  let selectedPC : ProbePC program dispatcher kind :=
    ⟨.answer accepted, selectedMem⟩
  have coreTrace : ProbeCompiler.RunsN
      (compiledProbeTable program dispatcher kind)
      (ProbeCompiler.parentCost side pattern origin - 1)
      (.running (firstProbePC program dispatcher kind).val origin)
      (.running selectedPC.val origin) := by
    simpa [compiledProbeTable, probeControl, parentSite,
      ProbeCompiler.parentTable, firstProbePC, selectedPC, accepted, pattern]
      using ProbeCompiler.parent_runs_to_answer side pattern origin
  have coreRun := run_probe_running_trace program dispatcher kind registers
    (ProbeCompiler.parentCost side pattern origin - 1)
    (firstProbePC program dispatcher kind) selectedPC origin origin coreTrace
  have answerStep := step_probe_answer program dispatcher kind registers accepted
    selectedMem origin
  have positive : 0 < ProbeCompiler.parentCost side pattern origin := by
    cases origin with
    | mk focus parents =>
        cases parents with
        | nil => cases side <;> simp [ProbeCompiler.parentCost]
        | cons frame parents =>
            cases frame <;> cases side <;> simp [ProbeCompiler.parentCost]
  have costSplit :
      ProbeCompiler.parentCost side pattern origin =
        (ProbeCompiler.parentCost side pattern origin - 1) + 1 := by
    exact (Nat.sub_add_cancel positive).symm
  unfold compiledProbeCost compiledProbeAnswer
  simp only [parentSite]
  rw [costSplit, FiniteController.run_add]
  change FiniteController.run (SchedulerControl.machine program dispatcher) 1
      (FiniteController.run (SchedulerControl.machine program dispatcher)
        (ProbeCompiler.parentCost side pattern origin - 1)
        ⟨some (.probe kind (firstProbePC program dispatcher kind) registers),
          origin⟩) =
      commandResult
        (probeAnswer program dispatcher kind accepted registers) origin
  rw [coreRun]
  change FiniteController.step (SchedulerControl.machine program dispatcher)
      ⟨some (.probe kind selectedPC registers), origin⟩ = _
  simpa [selectedPC, accepted, pattern] using answerStep

/-- A complete parent-site probe contributes zero scheduler contractions. -/
theorem runMutationCount_parentProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (origin : Cursor) (side : Direction)
    (parentSite : probeSite kind = .parent side) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher)
        (compiledProbeCost program dispatcher kind origin)
        ⟨some (startProbe kind registers), origin⟩ = 0 := by
  let pattern := probePattern program dispatcher kind
  let accepted := Probe.parentMatches side pattern origin
  have answerMem : ProbeCompiler.Control.answer accepted ∈
      (probeControl program dispatcher kind).nodes := by
    unfold probeControl
    rw [parentSite]
    exact ProbeCompiler.answer_mem_parentControl side pattern accepted
  have trace : ProbeCompiler.RunsN
      (compiledProbeTable program dispatcher kind)
      (ProbeCompiler.parentCost side pattern origin - 1)
      (.running (firstProbePC program dispatcher kind).val origin)
      (.running (.answer accepted) origin) := by
    simpa [compiledProbeTable, probeControl, parentSite,
      ProbeCompiler.parentTable, firstProbePC, accepted, pattern]
      using ProbeCompiler.parent_runs_to_answer side pattern origin
  have count := runMutationCount_probe_to_answer program dispatcher kind
    registers (ProbeCompiler.parentCost side pattern origin - 1)
    (firstProbePC program dispatcher kind) accepted answerMem origin trace
  have positive : 0 < ProbeCompiler.parentCost side pattern origin := by
    cases origin with
    | mk focus parents =>
        cases parents with
        | nil => cases side <;> simp [ProbeCompiler.parentCost]
        | cons frame parents =>
            cases frame <;> cases side <;> simp [ProbeCompiler.parentCost]
  have costSplit :
      ProbeCompiler.parentCost side pattern origin =
        (ProbeCompiler.parentCost side pattern origin - 1) + 1 := by
    exact (Nat.sub_add_cancel positive).symm
  unfold compiledProbeCost
  simp only [parentSite]
  rw [costSplit]
  simpa [startProbe] using count

end SchedulerExecution

end PureSFormal.PureS
