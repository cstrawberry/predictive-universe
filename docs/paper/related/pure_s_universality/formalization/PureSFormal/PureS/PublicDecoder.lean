import PureSFormal.PureS.CheckpointRun
import PureSFormal.PureS.CheckpointExclusion

/-!
# Public weak-path decoder

The internal checkpoint parser returns the syntactic evidence needed by the
paper (route, selected label, and literal queue).  The public interface keeps
only the horizon and CTS configuration.  Its phase is computed from the
horizon alone; its dataword is the literal carrier spine returned by the
history-free parser.  No CTS transition is replayed.
-/

namespace PureSFormal.PureS

namespace PublicDecoder

/-- Reconstruct the phase paired with a literally decoded queue. -/
def decodedConfig (program : CTS.Program) (horizon : Nat)
    (queue : List Bool) : CTS.Config program :=
  ⟨CTS.iteratePhase program horizon (CTS.zeroPhase program), queue⟩

/-- Repack the detailed term-only parser result for the public interface. -/
def repack (program : CTS.Program) :
    CheckpointDecoder.Result program → WeakPath.DecodedCheckpoint program
  | .zero bits => (0, CTS.initial program bits)
  | .positive view =>
      (view.horizon, decodedConfig program view.horizon view.queue)

/-- One total bare-term decoder, fixed by the CTS and dispatcher. -/
def decode (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    WeakPath.BareTermDecoder program :=
  fun term => (CheckpointDecoder.decode? program tree term).map (repack program)

/-! ## Literal-readback factorization -/

/-- The data extracted syntactically before it is repacked as a CTS state. -/
structure LiteralCheckpoint where
  horizon : Nat
  data : List Bool
  deriving BEq, DecidableEq, Repr

/-- Forget parser audit fields while retaining the literal carrier data. -/
def literalResult (program : CTS.Program) :
    CheckpointDecoder.Result program → LiteralCheckpoint
  | .zero bits => ⟨0, bits⟩
  | .positive view => ⟨view.horizon, view.queue⟩

/-- Total history-free extraction of the horizon and literal queue only. -/
def decodeLiteral? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option LiteralCheckpoint :=
  (CheckpointDecoder.decode? program tree term).map (literalResult program)

/-- Materialize a literal readback without applying the CTS transition map. -/
def materializeLiteral (program : CTS.Program)
    (view : LiteralCheckpoint) : WeakPath.DecodedCheckpoint program :=
  (view.horizon, decodedConfig program view.horizon view.data)

/-- The public decoder factors exactly through syntactic literal readback. -/
theorem decode_eq_decodeLiteral
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    decode program tree term =
      (decodeLiteral? program tree term).map (materializeLiteral program) := by
  unfold decode decodeLiteral?
  cases decoded : CheckpointDecoder.decode? program tree term with
  | none => rfl
  | some result =>
      cases result <;> rfl

/--
Every accepted dataword is exactly the queue returned by the structural term
parser; only the cyclic phase is reconstructed from the reported horizon.
-/
theorem exists_literal_of_decode
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {horizon : Nat} {config : CTS.Config program}
    (decoded : decode program tree term = some (horizon, config)) :
    ∃ view : LiteralCheckpoint,
      decodeLiteral? program tree term = some view ∧
        view.horizon = horizon ∧
        view.data = config.data ∧
        config.phase = CTS.iteratePhase program horizon
          (CTS.zeroPhase program) := by
  rw [decode_eq_decodeLiteral] at decoded
  cases literal : decodeLiteral? program tree term with
  | none => simp [literal] at decoded
  | some view =>
      rw [literal] at decoded
      have pairEq : materializeLiteral program view = (horizon, config) :=
        Option.some.inj decoded
      refine ⟨view, rfl, ?_, ?_, ?_⟩
      · exact congrArg Prod.fst pairEq
      · have configEq : decodedConfig program view.horizon view.data = config :=
          congrArg Prod.snd pairEq
        exact congrArg CTS.Config.data configEq
      · have horizonEq : view.horizon = horizon := congrArg Prod.fst pairEq
        have configEq : decodedConfig program view.horizon view.data = config :=
          congrArg Prod.snd pairEq
        rw [← configEq, ← horizonEq]
        rfl

/-- Pairing the phase formula with an iterate's literal data reconstructs it. -/
theorem decodedConfig_iterate_data
    (program : CTS.Program) (horizon : Nat) (bits : List Bool) :
    decodedConfig program horizon
        (CTS.iterate program horizon (CTS.initial program bits)).data =
      CTS.iterate program horizon (CTS.initial program bits) := by
  generalize hresult :
    CTS.iterate program horizon (CTS.initial program bits) = result
  have hphase := CTS.iterate_phase program horizon
    (CTS.initial program bits)
  rw [hresult] at hphase
  cases result with
  | mk phase data =>
      simp only [CTS.initial_phase] at hphase
      unfold decodedConfig
      rw [← hphase]

/-- The generator is exactly the public horizon-zero checkpoint. -/
@[simp]
theorem decode_timeZero
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    decode program actions.tree
        (generator (compileActions program actions.tree) bits) =
      some (0, CTS.initial program bits) := by
  unfold decode
  rw [CheckpointRun.decode?_timeZero]
  rfl

/-- Every checked positive prefix returns the exact current CTS iterate. -/
theorem decode_positivePrefix
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program actions bits horizon
      result contractions activeContext chain) :
    decode program actions.tree result =
      some (horizon,
        CTS.iterate program horizon (CTS.initial program bits)) := by
  rw [decode, certificate.decode]
  simp only [Option.map, repack, Option.some.injEq, Prod.mk.injEq, true_and]
  exact decodedConfig_iterate_data program horizon bits

/-- Every explicit noncheckpoint family shape is rejected by the public map. -/
theorem decode_none_of_noncheckpoint
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : SchedulerControl.Family} {term : Term}
    (shape : CheckpointExclusion.Noncheckpoint program tree family term) :
    decode program tree term = none := by
  rw [decode, shape.decode?_none]
  rfl

/-- Public decoder success has exactly one detailed internal source result. -/
theorem exists_internal_of_decode
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {checkpoint : WeakPath.DecodedCheckpoint program}
    (hdecode : decode program tree term = some checkpoint) :
    ∃ result,
      CheckpointDecoder.decode? program tree term = some result ∧
        repack program result = checkpoint := by
  unfold decode at hdecode
  cases hresult : CheckpointDecoder.decode? program tree term with
  | none => simp [hresult] at hdecode
  | some result =>
      rw [hresult] at hdecode
      change (some (repack program result) :
        Option (WeakPath.DecodedCheckpoint program)) = some checkpoint at hdecode
      exact ⟨result, rfl, Option.some.inj hdecode⟩

end PublicDecoder

end PureSFormal.PureS
