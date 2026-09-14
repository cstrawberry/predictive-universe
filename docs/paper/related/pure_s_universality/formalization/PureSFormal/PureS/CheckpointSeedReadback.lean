import PureSFormal.PureS.SchedulerStageAssembly

/-!
# Immutable seed and current checkpoint readback

The seed parser follows the same completed continuation chain as the checkpoint
decoder and reads the literal word in its terminal environment. It neither
replays source transitions nor compares dormant copies. Pairing this seed with
the existing public decoder preserves rejection of every noncheckpoint on the
selected run. Both the original seed and current cyclic-tag configuration are
recovered at each actual checkpoint.
-/

namespace PureSFormal.PureS.CheckpointSeedReadback

/-- Read the initial generator payload or the terminal payload of a completed chain. -/
def seed? (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (List Bool) :=
  match CheckpointDecoder.parseGenerator? (compileActions program tree) term with
  | some bits => some bits
  | none =>
      match CheckpointDecoder.parseChain? program tree term with
      | some chain => CheckpointDecoder.parseWord? chain.terminal.seedPayload
      | none => none

/-- Fixed bare-term observation of the immutable seed and current checkpoint. -/
def decode? (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (List Bool × WeakPath.DecodedCheckpoint program) :=
  match PublicDecoder.decode program tree term with
  | none => none
  | some checkpoint =>
      (seed? program tree term).map (fun bits => (bits, checkpoint))

theorem seed?_generator (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    seed? program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits) = some bits := by
  rw [seed?, CheckpointDecoder.parseGenerator?_generator]

theorem decode?_generator (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    decode? program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits) =
      some (bits, 0, CTS.initial program bits) := by
  rw [decode?, PublicDecoder.decode_timeZero, seed?_generator]
  rfl

theorem seed?_positivePrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat} {term : Term} {contractions : Nat}
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher bits horizon
      term contractions activeContext chain) :
    seed? program dispatcher.tree term = some bits := by
  rw [seed?, CheckpointRun.parseGenerator?_none_of_completedChain certificate.chainShape,
    CheckpointDecoder.parseChain?_complete certificate.chainShape]
  change CheckpointDecoder.parseWord? chain.terminal.seedPayload = some bits
  rw [certificate.terminal]
  exact CheckpointDecoder.parseWord?_word bits

theorem decode?_positivePrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat} {term : Term} {contractions : Nat}
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher bits horizon
      term contractions activeContext chain) :
    decode? program dispatcher.tree term =
      some (bits, horizon, CTS.iterate program horizon (CTS.initial program bits)) := by
  rw [decode?, PublicDecoder.decode_positivePrefix certificate, seed?_positivePrefix certificate]
  rfl

theorem decode?_public
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {checkpoint : WeakPath.DecodedCheckpoint program}
    (found : decode? program tree term = some (bits, checkpoint)) :
    PublicDecoder.decode program tree term = some checkpoint := by
  unfold decode? at found
  cases current : PublicDecoder.decode program tree term with
  | none => simp only [current] at found; cases found
  | some decoded =>
      rw [current] at found
      cases seed : seed? program tree term with
      | none => simp only [seed, Option.map] at found; cases found
      | some original =>
          rw [seed] at found
          have pairEq := Option.some.inj found
          have checkpointEq := congrArg Prod.snd pairEq
          exact congrArg Option.some checkpointEq

theorem decode?_none_of_public_none
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (rejected : PublicDecoder.decode program tree term = none) :
    decode? program tree term = none := by
  rw [decode?, rejected]

/-- The certificate is used only in the proof; observation receives the bare term. -/
theorem decode?_actualCheckpoint
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)
    decode? program dispatcher.tree
      (system.contractionRun
        (ExactCheckpointRun.checkpointTime program dispatcher bits horizon)).cursor.erase =
      some (bits, horizon, CTS.iterate program horizon (CTS.initial program bits)) := by
  cases horizon with
  | zero => simpa using! decode?_generator program dispatcher bits
  | succ offset =>
      obtain ⟨stages⟩ := SchedulerRecurrence.positiveStages program dispatcher bits offset
      dsimp only
      rw [stages.contractionRun_checkpoint (SchedulerRecurrence.initialGood program dispatcher bits)]
      exact decode?_positivePrefix stages.certificate

end PureSFormal.PureS.CheckpointSeedReadback
