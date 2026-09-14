import PureSFormal.PureS.MutableBase
import PureSFormal.PureS.CellDeletion
import PureSFormal.PureS.DispatchParser
import PureSFormal.PureS.LocalResponse

/-!
# Carrier roots and the intermediate queue path

Whole carriers and terms encountered while descending through their queue are
different syntactic classes.  `Root` contains only mutation-closed Base and
Local carriers.  `Path` injects a whole `Root` and closes it under live cells
and transparent tombstones.

A Base constructor carries a decoding certificate for its complete queue
spine and uses `MutableBase.mutableBase`, whose beta is fixed; the more
permissive arbitrary-beta parser boundary is not promoted to a root snapshot.
A Local constructor instead requires the accumulator recovered from its
dispatcher field to be a `Path`.  This is a static grammar: it neither defines
a recursive carrier parser nor asserts that every inhabitant is reachable by
the scheduler.
-/

namespace PureSFormal.PureS

namespace RootPath

mutual
  /-- A mutation-closed whole carrier, mutually defined with its queue path. -/
  inductive Root
      (program : CTS.Program)
      (tree : Dispatcher.Tree (ActionLabel program))
      (bits : List Bool) (continuation : Term) : Term → Prop where
    | base
        {queue : Term} {decoded : List Bool}
        (queueComplete : CellSpine.Decodes queue decoded) :
        Root program tree bits continuation
          (MutableBase.mutableBase (compileActions program tree) bits
            continuation queue)
    | local
        {accumulator dispatcher result : Term}
        (inner : Path program tree bits continuation accumulator)
        (dispatch : DispatchParser.dispatchesTo program tree dispatcher
          accumulator)
        (shell : Carrier.LocalShell bits continuation dispatcher result) :
        Root program tree bits continuation result

  /-- A whole root or an intermediate live/tombstone queue layer above it. -/
  inductive Path
      (program : CTS.Program)
      (tree : Dispatcher.Tree (ActionLabel program))
      (bits : List Bool) (continuation : Term) : Term → Prop where
    | root
        {carrier : Term}
        (inner : Root program tree bits continuation carrier) :
        Path program tree bits continuation carrier
    | live
        {tail : Term} (bit : Bool)
        (inner : Path program tree bits continuation tail) :
        Path program tree bits continuation (.app (PureSFormal.PureS.live bit) tail)
    | tombstone
        {predecessor : Term} (bit : Bool) (audit : Term)
        (inner : Path program tree bits continuation predecessor) :
        Path program tree bits continuation
          (Carrier.tombstone bit predecessor audit)
end

/-! ## Exact initial root and root boundary -/

/--
The literal equation-(9) Base is an exact initial `Root`: its active queue is
`word bits`, its beta field is the fixed original beta, and the queue
certificate is the registered complete-spine decoding theorem.  In
particular, this theorem does not promote the permissive arbitrary-beta
`MutableBase.base` boundary to snapshot provenance.
-/
theorem initial_exactBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term) :
    Root program tree bits continuation
      (baseCarrier
        (environmentCode (compileActions program tree) bits)
        continuation) := by
  rw [← MutableBase.mutableBase_word]
  exact .base (CellSpine.decodes_word bits)

namespace Root

/-- Every whole root has registered arity five or six. -/
theorem headArity
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation carrier : Term}
    (hadmissible : Carrier.Admissible continuation)
    (h : Root program tree bits continuation carrier) :
    carrier.headArity = 5 ∨ carrier.headArity = 6 := by
  cases h with
  | base queueComplete =>
      exact MutableBase.mutableBase_root_headArity
        (compileActions program tree) bits hadmissible _
  | «local» inner dispatch shell =>
      exact shell.result_headArity

/--
Delete the logical front cell inside an exact reachable mutable Base.

The returned `front` is the unique result of the executable canonical-front
search, carries the full address/context certificate, and records both the
one-step queue contraction and its one-step lifting through the fixed-beta
Base context.  The endpoint decodes exactly `suffix`, hence reconstructs a
whole `Root`.  This theorem does not lift deletion through a Local shell.
-/
theorem deleteBaseFront
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    {queue : Term} {bit : Bool} {suffix : List Bool}
    (decoded : CellSpine.Decodes queue (bit :: suffix)) :
    ∃ front : CellDeletion.Front,
      CellDeletion.findFront? queue = some front ∧
      front.bit = bit ∧
      CellDeletion.IsCanonicalFront queue suffix front ∧
      (∀ other : CellDeletion.Front,
        CellDeletion.findFront? queue = some other → other = front) ∧
      StepsN 1 queue front.endpoint ∧
      StepsN 1
        (MutableBase.mutableBase (compileActions program tree) bits
          continuation queue)
        (MutableBase.mutableBase (compileActions program tree) bits
          continuation front.endpoint) ∧
      CellSpine.Decodes front.endpoint suffix ∧
      Root program tree bits continuation
        (MutableBase.mutableBase (compileActions program tree) bits
          continuation front.endpoint) := by
  obtain ⟨front, certificate, _unique⟩ :=
    CellDeletion.canonicalFront decoded
  have endpointDecoded := certificate.2.2.1.endpoint_decodes
  have baseSteps := MutableBase.stepsN_mutableBase_queue
    (compileActions program tree) bits continuation certificate.2.2.2
  refine ⟨front, certificate.1, certificate.2.1, certificate.2.2.1,
    ?_, certificate.2.2.2, baseSteps, endpointDecoded, ?_⟩
  · intro other hother
    exact Option.some.inj (hother.symm.trans certificate.1)
  · exact .base endpointDecoded

end Root

/-! ## Pairwise separation of the three `Path` productions -/

namespace Path

/-- A whole carrier root cannot be a live-cell layer. -/
theorem root_ne_live
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation root tail : Term}
    (hadmissible : Carrier.Admissible continuation)
    (hroot : Root program tree bits continuation root)
    (bit : Bool) :
    root ≠ .app (PureSFormal.PureS.live bit) tail := by
  intro heq
  have harity := congrArg Term.headArity heq
  rcases Root.headArity hadmissible hroot with hfive | hsix
  · rw [hfive] at harity
    simp only [Carrier.headArity_liveCell] at harity
    cases harity
  · rw [hsix] at harity
    simp only [Carrier.headArity_liveCell] at harity
    cases harity

/-- A whole carrier root cannot be a transparent tombstone layer. -/
theorem root_ne_tombstone
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation root predecessor audit : Term}
    (hadmissible : Carrier.Admissible continuation)
    (hroot : Root program tree bits continuation root)
    (bit : Bool) :
    root ≠ Carrier.tombstone bit predecessor audit := by
  intro heq
  have harity := congrArg Term.headArity heq
  rcases Root.headArity hadmissible hroot with hfive | hsix
  · rw [hfive] at harity
    simp only [Carrier.headArity_tombstone] at harity
    cases harity
  · rw [hsix] at harity
    simp only [Carrier.headArity_tombstone] at harity
    cases harity

/-- Live and tombstone queue layers are disjoint independently of their holes. -/
theorem live_ne_tombstone
    (liveBit tombstoneBit : Bool) (tail predecessor audit : Term) :
    .app (PureSFormal.PureS.live liveBit) tail ≠
      Carrier.tombstone tombstoneBit predecessor audit :=
  Carrier.liveCell_ne_tombstone liveBit tombstoneBit tail predecessor audit

/-! ## Path closure under action accumulation -/

/-- Adding one selected live cell above a path preserves `Path`. -/
theorem extendAccumulator
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation initial : Term}
    (bit : Bool)
    (h : Path program tree bits continuation initial) :
    Path program tree bits continuation
      (PureSFormal.PureS.extendAccumulator bit initial) := by
  exact .live bit h

/-- Every finite appender accumulator remains on the same path. -/
theorem appenderAccumulator
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation initial : Term}
    (appendant : List Bool)
    (h : Path program tree bits continuation initial) :
    Path program tree bits continuation
      (PureSFormal.PureS.appenderAccumulator appendant initial) := by
  induction appendant generalizing initial with
  | nil => exact h
  | cons bit appendant ih =>
      exact ih (extendAccumulator bit h)

/-- Both Boolean branches of a selected action preserve the carrier path. -/
theorem actionAccumulator
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation carrier : Term}
    (label : ActionLabel program)
    (h : Path program tree bits continuation carrier) :
    Path program tree bits continuation
      (PureSFormal.PureS.actionAccumulator program label carrier) := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact h
  | true =>
      exact appenderAccumulator (program.appendant phase) h

end Path

/-! ## Generated Local roots -/

/-- A generated completed route parses to its exact action accumulator. -/
theorem completedRoute_dispatchesTo
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {carrier completedRoute : Term}
    (routeShape :
      RouteGrammar.ActivatedRoute (selectedAction program) tree route label
        (actionResult program label carrier) completedRoute) :
    DispatchParser.dispatchesTo program tree completedRoute
      (actionAccumulator program label carrier) := by
  refine ⟨route, label, actionResult program label carrier,
    actionHistories program label carrier, routeShape, ?_⟩
  exact ActionParser.actionResult_shape program label carrier

/--
Executing the exact frame/route/action response from a whole-root snapshot
produces a new whole Local root.  Its parsed accumulator may be a queue-layer
`Path`, which is why it is not required to be a `Root`.
-/
theorem execute_fromRoot
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (routePath : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    (snapshot : Root program tree bits continuation carrier) :
    ∃ completedRoute,
      StepsN (LocalResponse.completedCost program route label)
        (frame
          (environmentCode (compileActions program tree) bits)
          continuation carrier)
        (LocalResponse.completed bits continuation carrier completedRoute) ∧
      Root program tree bits continuation
        (LocalResponse.completed bits continuation carrier completedRoute) ∧
      DispatchParser.dispatchesTo program tree completedRoute
        (actionAccumulator program label carrier) := by
  obtain ⟨completedRoute, steps, routeShape⟩ :=
    LocalResponse.execute program routePath bits continuation carrier
  have dispatch := completedRoute_dispatchesTo program routeShape
  have accumulatorPath :
      Path program tree bits continuation
        (actionAccumulator program label carrier) :=
    Path.actionAccumulator program label (.root snapshot)
  have shell :=
    LocalResponse.completed_localShell bits continuation carrier completedRoute
  refine ⟨completedRoute, steps, ?_, dispatch⟩
  exact .local accumulatorPath dispatch shell

/--
The exact zero-action response followed by its halt marker likewise produces
a whole Local root, now parsing directly back to the root snapshot.
-/
theorem executeZeroMarked_fromRoot
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} (phase : CTS.Phase program)
    (routePath : Dispatcher.HasRoute tree route (phase, false))
    (bits : List Bool) (continuation carrier : Term)
    (snapshot : Root program tree bits continuation carrier) :
    ∃ completedRoute,
      StepsN (5 + 2 * route.length)
        (frame
          (environmentCode (compileActions program tree) bits)
          continuation carrier)
        (LocalResponse.markedCompleted bits continuation carrier
          completedRoute) ∧
      Root program tree bits continuation
        (LocalResponse.markedCompleted bits continuation carrier
          completedRoute) ∧
      DispatchParser.dispatchesTo program tree completedRoute carrier := by
  obtain ⟨completedRoute, steps, routeShape⟩ :=
    LocalResponse.executeZeroMarked program phase routePath bits continuation
      carrier
  have dispatch :
      DispatchParser.dispatchesTo program tree completedRoute carrier := by
    simpa using completedRoute_dispatchesTo program routeShape
  have shell :=
    LocalResponse.markedCompleted_localShell
      bits continuation carrier completedRoute
  refine ⟨completedRoute, steps, ?_, dispatch⟩
  exact .local (.root snapshot) dispatch shell

/-! ## One top-level live deletion -/

/--
A selected top live cell contracts once to its diagonal tombstone and remains
in `Path`.  This is a single local preservation fact, not a reachability
induction over arbitrary contexts.
-/
theorem topLive_delete_path
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation tail : Term}
    (bit : Bool)
    (inner : Path program tree bits continuation tail) :
    StepsN 1 (.app (PureSFormal.PureS.live bit) tail)
        (Carrier.tombstone bit tail tail) ∧
      Path program tree bits continuation
        (Carrier.tombstone bit tail tail) := by
  constructor
  · simpa [Carrier.tombstone] using C4_live_delete bit tail
  · exact .tombstone bit tail inner

end RootPath

end PureSFormal.PureS
