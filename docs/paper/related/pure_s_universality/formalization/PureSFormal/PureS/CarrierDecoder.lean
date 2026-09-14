import PureSFormal.PureS.CanonicalStep
import PureSFormal.PureS.RootPath

/-!
# Total decoding of the permissive public carrier grammar

This module decodes the live queue represented by a bare pure-`S` term.  A
Base contributes the complete cell spine stored at its registered queue
child.  A Local root continues at the accumulator recovered by the public
dispatcher/action parser.  Live layers append their bit and tombstones retain
their predecessor's queue.

The grammar here is intentionally more permissive than scheduler provenance:
Base beta fields, Local audit fields, route audits, and action histories are
independent.  Fixed public constructors and codes are checked, but those
independent payloads are never compared.  This is neither checkpoint-chain
acceptance nor a scheduler-reachability theorem.
-/

namespace PureSFormal.PureS

namespace CarrierDecoder

/-! ## Strict occurrence descent -/

/-- Looking up a subtree never increases syntax-tree size. -/
theorem subterm_size_le
    {term found : Term} {address : Address}
    (h : term.subterm? address = some found) :
    found.size ≤ term.size := by
  induction address generalizing term with
  | nil =>
      simp only [Term.subterm?] at h
      have hterm : term = found := Option.some.inj h
      subst found
      exact Nat.le_refl _
  | cons direction rest ih =>
      cases term with
      | s =>
          cases direction <;> simp [Term.subterm?] at h
      | app fn arg =>
          cases direction with
          | left =>
              have hchild : fn.subterm? rest = some found := by
                simpa only [Term.subterm?] using h
              exact Nat.le_trans (ih hchild)
                (Nat.le_of_lt
                  (Nat.lt_succ_of_le (Nat.le_add_right fn.size arg.size)))
          | right =>
              have hchild : arg.subterm? rest = some found := by
                simpa only [Term.subterm?] using h
              exact Nat.le_trans (ih hchild)
                (Nat.le_of_lt
                  (Nat.lt_succ_of_le (Nat.le_add_left arg.size fn.size)))

/-- A lookup below at least one occurrence edge strictly decreases size. -/
theorem subterm_size_lt
    {term found : Term} {direction : Direction} {rest : Address}
    (h : term.subterm? (direction :: rest) = some found) :
    found.size < term.size := by
  cases term with
  | s =>
      cases direction <;> simp [Term.subterm?] at h
  | app fn arg =>
      cases direction with
      | left =>
          have hchild : fn.subterm? rest = some found := by
            simpa only [Term.subterm?] using h
          exact Nat.lt_of_le_of_lt (subterm_size_le hchild)
            (Nat.lt_succ_of_le (Nat.le_add_right fn.size arg.size))
      | right =>
          have hchild : arg.subterm? rest = some found := by
            simpa only [Term.subterm?] using h
          exact Nat.lt_of_le_of_lt (subterm_size_le hchild)
            (Nat.lt_succ_of_le (Nat.le_add_left arg.size fn.size))

/-- Either immediate application child is strictly smaller than its parent. -/
theorem size_app_left_lt (fn arg : Term) :
    fn.size < (Term.app fn arg).size :=
  Nat.lt_succ_of_le (Nat.le_add_right fn.size arg.size)

theorem size_app_right_lt (fn arg : Term) :
    arg.size < (Term.app fn arg).size :=
  Nat.lt_succ_of_le (Nat.le_add_left arg.size fn.size)

/-- Lookup through an appended address factors through the prefix lookup. -/
theorem subterm?_append (term : Term) (addressPrefix suffix : Address) :
    term.subterm? (addressPrefix ++ suffix) =
      (term.subterm? addressPrefix).bind
        (fun child => child.subterm? suffix) := by
  induction addressPrefix generalizing term with
  | nil => simp [Term.subterm?]
  | cons direction rest ih =>
      cases term with
      | s => cases direction <;> simp [Term.subterm?]
      | app fn arg =>
          cases direction <;> simp only [List.cons_append, Term.subterm?, ih]

/-- A subtree reached by at least one left/right occurrence edge. -/
def ProperDescendant (ancestor descendant : Term) : Prop :=
  ∃ direction rest,
    ancestor.subterm? (direction :: rest) = some descendant

namespace ProperDescendant

theorem appLeft (fn arg : Term) : ProperDescendant (.app fn arg) fn :=
  ⟨Direction.left, [], by simp [Term.subterm?]⟩

theorem appRight (fn arg : Term) : ProperDescendant (.app fn arg) arg :=
  ⟨Direction.right, [], by simp [Term.subterm?]⟩

theorem trans
    {outer middle inner : Term}
    (houter : ProperDescendant outer middle)
    (hinner : ProperDescendant middle inner) :
    ProperDescendant outer inner := by
  rcases houter with ⟨outerDirection, outerRest, houter⟩
  rcases hinner with ⟨innerDirection, innerRest, hinner⟩
  refine ⟨outerDirection,
    outerRest ++ (innerDirection :: innerRest), ?_⟩
  change outer.subterm?
      ((outerDirection :: outerRest) ++ (innerDirection :: innerRest)) =
    some inner
  rw [subterm?_append, houter]
  exact hinner

theorem size_lt
    {ancestor descendant : Term}
    (h : ProperDescendant ancestor descendant) :
    descendant.size < ancestor.size := by
  rcases h with ⟨direction, rest, hsubterm⟩
  exact subterm_size_lt hsubterm

end ProperDescendant

/-- Prefixing an address by left edges preserves nonemptiness. -/
theorem prefixLeft_ne_nil
    (count : Nat) {suffix : Address} (hsuffix : suffix ≠ []) :
    ActionParser.prefixLeft count suffix ≠ [] := by
  induction count generalizing suffix with
  | zero => exact hsuffix
  | succ count ih =>
      exact ih (by intro h; cases h)

/-- Every equation-(8b) accumulator address contains at least one edge. -/
theorem accumulatorAddress_ne_nil (count : Nat) :
    ActionParser.accumulatorAddress count ≠ [] := by
  exact prefixLeft_ne_nil count (by intro h; cases h)

/-- A parsed equation-(8b) accumulator is a strict response subtree. -/
theorem actionShape_accumulator_size_lt
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {response : Term}
    (h : ActionParser.ActionShape program label accumulator histories
      response) :
    accumulator.size < response.size := by
  have hsubterm := h.accumulator_subterm
  cases haddress : ActionParser.accumulatorAddress
      (ActionParser.historyCount program label) with
  | nil =>
      exact False.elim
        (accumulatorAddress_ne_nil (ActionParser.historyCount program label)
          haddress)
  | cons direction rest =>
      rw [haddress] at hsubterm
      exact subterm_size_lt hsubterm

/-- Equation-(8b) exposes its accumulator at a proper occurrence. -/
theorem actionShape_accumulator_descendant
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {response : Term}
    (h : ActionParser.ActionShape program label accumulator histories
      response) :
    ProperDescendant response accumulator := by
  have hsubterm := h.accumulator_subterm
  cases haddress : ActionParser.accumulatorAddress
      (ActionParser.historyCount program label) with
  | nil =>
      exact False.elim
        (accumulatorAddress_ne_nil (ActionParser.historyCount program label)
          haddress)
  | cons direction rest =>
      refine ⟨direction, rest, ?_⟩
      rw [haddress] at hsubterm
      exact hsubterm

/-- The selected response is a strict subtree of its activated dispatcher. -/
theorem activatedRoute_response_size_lt
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : RouteGrammar.ActivatedRoute encode tree route label response result) :
    response.size < result.size := by
  induction h with
  | leaf label audit response =>
      exact size_app_right_lt (Term.app Term.s audit) response
  | @left left right route label response activatedChild outerAudit
      dormantAudit inner ih =>
      exact Nat.lt_trans ih
        (Nat.lt_trans
          (size_app_left_lt activatedChild
            (RouteGrammar.compiledCall encode right dormantAudit))
          (size_app_right_lt (Term.app Term.s outerAudit)
            (Term.app activatedChild
              (RouteGrammar.compiledCall encode right dormantAudit))))
  | @right left right route label response activatedChild outerAudit
      dormantAudit inner ih =>
      exact Nat.lt_trans ih
        (Nat.lt_trans
          (size_app_right_lt
            (RouteGrammar.compiledCall encode left dormantAudit)
            activatedChild)
          (size_app_right_lt (Term.app Term.s outerAudit)
            (Term.app (RouteGrammar.compiledCall encode left dormantAudit)
              activatedChild)))

/-- The selected response is reached through a proper activated-route path. -/
theorem activatedRoute_response_descendant
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : RouteGrammar.ActivatedRoute encode tree route label response result) :
    ProperDescendant result response := by
  induction h with
  | leaf label audit response =>
      exact ProperDescendant.appRight (Term.app Term.s audit) response
  | @left left right route label response activatedChild outerAudit
      dormantAudit inner ih =>
      have hselected : ProperDescendant
          (RouteGrammar.selectedLeft outerAudit activatedChild
            (RouteGrammar.compiledCall encode right dormantAudit))
          activatedChild := by
        apply ProperDescendant.trans
          (ProperDescendant.appRight (Term.app Term.s outerAudit)
            (Term.app activatedChild
              (RouteGrammar.compiledCall encode right dormantAudit)))
        exact ProperDescendant.appLeft activatedChild
          (RouteGrammar.compiledCall encode right dormantAudit)
      exact ProperDescendant.trans hselected ih
  | @right left right route label response activatedChild outerAudit
      dormantAudit inner ih =>
      have hselected : ProperDescendant
          (RouteGrammar.selectedRight outerAudit
            (RouteGrammar.compiledCall encode left dormantAudit)
            activatedChild)
          activatedChild := by
        apply ProperDescendant.trans
          (ProperDescendant.appRight (Term.app Term.s outerAudit)
            (Term.app (RouteGrammar.compiledCall encode left dormantAudit)
              activatedChild))
        exact ProperDescendant.appRight
          (RouteGrammar.compiledCall encode left dormantAudit) activatedChild
      exact ProperDescendant.trans hselected ih

/-- A completed dispatcher contains its returned accumulator strictly below it. -/
theorem dispatchShape_accumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {accumulator dispatcher : Term}
    (h : DispatchParser.DispatchShape program tree route label accumulator
      dispatcher) :
    accumulator.size < dispatcher.size := by
  rcases h with ⟨response, histories, routeShape, actionShape⟩
  exact Nat.lt_trans (actionShape_accumulator_size_lt actionShape)
    (activatedRoute_response_size_lt routeShape)

/-- A completed dispatcher contains its accumulator at a proper occurrence. -/
theorem dispatchShape_accumulator_descendant
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {accumulator dispatcher : Term}
    (h : DispatchParser.DispatchShape program tree route label accumulator
      dispatcher) :
    ProperDescendant dispatcher accumulator := by
  rcases h with ⟨response, histories, routeShape, actionShape⟩
  exact ProperDescendant.trans
    (activatedRoute_response_descendant routeShape)
    (actionShape_accumulator_descendant actionShape)

/-- The public dispatcher relation always selects a strict subtree. -/
theorem dispatchesTo_accumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {dispatcher accumulator : Term}
    (h : DispatchParser.dispatchesTo program tree dispatcher accumulator) :
    accumulator.size < dispatcher.size := by
  rcases h with ⟨route, label, shape⟩
  exact dispatchShape_accumulator_size_lt shape

theorem dispatchesTo_accumulator_descendant
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {dispatcher accumulator : Term}
    (h : DispatchParser.dispatchesTo program tree dispatcher accumulator) :
    ProperDescendant dispatcher accumulator := by
  rcases h with ⟨route, label, shape⟩
  exact dispatchShape_accumulator_descendant shape

/-- Declarative Local data also exhibits its strict recursive child. -/
theorem localChild_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation result dispatcher accumulator : Term}
    (shell : Carrier.LocalShell bits continuation dispatcher result)
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher
      accumulator) :
    accumulator.size < result.size := by
  exact Nat.lt_trans (dispatchesTo_accumulator_size_lt dispatch)
    (subterm_size_lt shell.dispatcher_subterm)

/-- The recursive child of a Local root is a proper occurrence descendant. -/
theorem localChild_descendant
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation result dispatcher accumulator : Term}
    (shell : Carrier.LocalShell bits continuation dispatcher result)
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher
      accumulator) :
    ProperDescendant result accumulator := by
  have hdispatcher : ProperDescendant result dispatcher :=
    ⟨Direction.left, [.left, .right], shell.dispatcher_subterm⟩
  exact ProperDescendant.trans hdispatcher
    (dispatchesTo_accumulator_descendant dispatch)

/-- A Local accumulator is a strict descendant of the whole Local root. -/
theorem localAccumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term accumulator : Term}
    (h : CanonicalStep.localAccumulator? program tree bits continuation term =
      some accumulator) :
    accumulator.size < term.size := by
  obtain ⟨dispatcher, shell, dispatch⟩ :=
    CanonicalStep.localAccumulator?_sound h
  exact localChild_size_lt shell dispatch

theorem classifiedLocal_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term accumulator : Term}
    {hadmissible : Carrier.Admissible continuation}
    (h : CanonicalStep.classify program tree bits continuation hadmissible term =
      .local accumulator) :
    accumulator.size < term.size := by
  have hshape := (CanonicalStep.classify_eq_local_iff program tree bits
    continuation hadmissible term accumulator).mp h
  rcases hshape.2 with ⟨dispatcher, shell, dispatch⟩
  exact localAccumulator_size_lt
    (CanonicalStep.localAccumulator?_complete shell dispatch)

/-- Local classification returns a strict occurrence descendant. -/
theorem classifiedLocal_descendant
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term accumulator : Term}
    {hadmissible : Carrier.Admissible continuation}
    (h : CanonicalStep.classify program tree bits continuation hadmissible term =
      .local accumulator) :
    ProperDescendant term accumulator := by
  have hshape := (CanonicalStep.classify_eq_local_iff program tree bits
    continuation hadmissible term accumulator).mp h
  rcases hshape.2 with ⟨dispatcher, shell, dispatch⟩
  exact localChild_descendant shell dispatch

theorem classifiedLive_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term predecessor : Term}
    {hadmissible : Carrier.Admissible continuation} {bit : Bool}
    (h : CanonicalStep.classify program tree bits continuation hadmissible term =
      .live bit predecessor) :
    predecessor.size < term.size := by
  have hshape := (CanonicalStep.classify_eq_live_iff program tree bits
    continuation hadmissible term bit predecessor).mp h
  rw [hshape.2.2]
  exact size_app_right_lt (PureSFormal.PureS.live bit) predecessor

/-- Live classification returns its exact right-child predecessor occurrence. -/
theorem classifiedLive_descendant
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term predecessor : Term}
    {hadmissible : Carrier.Admissible continuation} {bit : Bool}
    (h : CanonicalStep.classify program tree bits continuation hadmissible term =
      .live bit predecessor) :
    ProperDescendant term predecessor := by
  have hshape := (CanonicalStep.classify_eq_live_iff program tree bits
    continuation hadmissible term bit predecessor).mp h
  rw [hshape.2.2]
  exact ProperDescendant.appRight (PureSFormal.PureS.live bit) predecessor

theorem classifiedTombstone_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term predecessor : Term}
    {hadmissible : Carrier.Admissible continuation} {bit : Bool}
    (h : CanonicalStep.classify program tree bits continuation hadmissible term =
      .tombstone bit predecessor) :
    predecessor.size < term.size := by
  have hshape := (CanonicalStep.classify_eq_tombstone_iff program tree bits
    continuation hadmissible term bit predecessor).mp h
  obtain ⟨audit, rfl⟩ := hshape.2.2
  exact Nat.lt_trans
    (size_app_right_lt Term.s predecessor)
    (size_app_left_lt (Term.app Term.s predecessor)
      (Term.app (valueTag bit) audit))

/-- Tombstone classification follows its exact left-right predecessor path. -/
theorem classifiedTombstone_descendant
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term predecessor : Term}
    {hadmissible : Carrier.Admissible continuation} {bit : Bool}
    (h : CanonicalStep.classify program tree bits continuation hadmissible term =
      .tombstone bit predecessor) :
    ProperDescendant term predecessor := by
  have hshape := (CanonicalStep.classify_eq_tombstone_iff program tree bits
    continuation hadmissible term bit predecessor).mp h
  obtain ⟨audit, rfl⟩ := hshape.2.2
  exact ProperDescendant.trans
    (ProperDescendant.appLeft (Term.app Term.s predecessor)
      (Term.app (valueTag bit) audit))
    (ProperDescendant.appRight Term.s predecessor)

/-! ## Executable recursive decoder -/

set_option linter.unusedVariables false in
/--
Decode the live queue at one public carrier/path boundary.  Recursive calls
are made only to the Local accumulator or exact live/tombstone predecessor,
each proved above to be a strict occurrence descendant.
-/
def decode? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) (term : Term) :
    Option (List Bool) :=
  match hclassify : CanonicalStep.classify program tree bits continuation
      hadmissible term with
  | .base queue => CellSpine.decode? queue
  | .local accumulator =>
      decode? program tree bits continuation hadmissible accumulator
  | .live bit predecessor =>
      (decode? program tree bits continuation hadmissible predecessor).map
        (fun decoded => decoded ++ [bit])
  | .tombstone _ predecessor =>
      decode? program tree bits continuation hadmissible predecessor
  | .malformed => none
termination_by term.size
decreasing_by
  · exact classifiedLocal_size_lt hclassify
  · exact classifiedLive_size_lt hclassify
  · exact classifiedTombstone_size_lt hclassify

/-! ## Declarative permissive grammar -/

mutual
  /--
  A whole public root with its decoded live queue.  Unlike `RootPath.Root`,
  the Base production deliberately permits an independent beta field.
  -/
  inductive RootDecodes
      (program : CTS.Program)
      (tree : Dispatcher.Tree (ActionLabel program))
      (bits : List Bool) (continuation : Term) :
      Term → List Bool → Prop where
    | base
        (queue beta : Term) {decoded : List Bool}
        (queueComplete : CellSpine.Decodes queue decoded) :
        RootDecodes program tree bits continuation
          (MutableBase.base (compileActions program tree) bits continuation
            queue beta)
          decoded
    | local
        {accumulator dispatcher result : Term} {decoded : List Bool}
        (inner : PathDecodes program tree bits continuation accumulator decoded)
        (dispatch : DispatchParser.dispatchesTo program tree dispatcher
          accumulator)
        (shell : Carrier.LocalShell bits continuation dispatcher result) :
        RootDecodes program tree bits continuation result decoded

  /--
  A whole public root or a live/tombstone layer on its recursive queue path.
  -/
  inductive PathDecodes
      (program : CTS.Program)
      (tree : Dispatcher.Tree (ActionLabel program))
      (bits : List Bool) (continuation : Term) :
      Term → List Bool → Prop where
    | root
        {root : Term} {decoded : List Bool}
        (inner : RootDecodes program tree bits continuation root decoded) :
        PathDecodes program tree bits continuation root decoded
    | live
        {tail : Term} {decoded : List Bool} (bit : Bool)
        (inner : PathDecodes program tree bits continuation tail decoded) :
        PathDecodes program tree bits continuation
          (.app (PureSFormal.PureS.live bit) tail) (decoded ++ [bit])
    | tombstone
        {predecessor : Term} {decoded : List Bool}
        (bit : Bool) (audit : Term)
        (inner : PathDecodes program tree bits continuation predecessor decoded) :
        PathDecodes program tree bits continuation
          (Carrier.tombstone bit predecessor audit) decoded
end

/-! ## Public computation equations -/

/-- Decoding a permissive Base delegates exactly to its active queue child. -/
theorem decode?_permissiveBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (queue beta : Term) :
    decode? program tree bits continuation hadmissible
        (MutableBase.base (compileActions program tree) bits continuation queue
          beta) =
      CellSpine.decode? queue := by
  rw [decode?]
  rw [CanonicalStep.classify_permissiveBase]

/-- Decoding an exact reachable mutable Base uses its evolving queue. -/
theorem decode?_mutableBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (queue : Term) :
    decode? program tree bits continuation hadmissible
        (MutableBase.mutableBase (compileActions program tree) bits continuation
          queue) =
      CellSpine.decode? queue := by
  rw [decode?]
  rw [CanonicalStep.classify_mutableBase]

/-- A generated Local continues exactly at its parsed action accumulator. -/
theorem decode?_local
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {dispatcher accumulator result : Term}
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher accumulator)
    (shell : Carrier.LocalShell bits continuation dispatcher result) :
    decode? program tree bits continuation hadmissible result =
      decode? program tree bits continuation hadmissible accumulator := by
  rw [decode?]
  rw [CanonicalStep.classify_local program tree bits continuation hadmissible
    dispatch shell]

/-- A live layer appends its label to the recursively decoded queue. -/
theorem decode?_live
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (bit : Bool) (predecessor : Term) :
    decode? program tree bits continuation hadmissible
        (.app (PureSFormal.PureS.live bit) predecessor) =
      (decode? program tree bits continuation hadmissible predecessor).map
        (fun decoded => decoded ++ [bit]) := by
  rw [decode?]
  rw [CanonicalStep.classify_live]

/-- A tombstone contributes no live bit and follows its predecessor. -/
theorem decode?_tombstone
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (bit : Bool) (predecessor audit : Term) :
    decode? program tree bits continuation hadmissible
        (Carrier.tombstone bit predecessor audit) =
      decode? program tree bits continuation hadmissible predecessor := by
  rw [decode?]
  rw [CanonicalStep.classify_tombstone]

/-! ## Soundness and completeness -/

/-- Every successful bare-term decoding has a public-path certificate. -/
theorem decode?_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {term : Term} {decoded : List Bool}
    (hdecode : decode? program tree bits continuation hadmissible term =
      some decoded) :
    PathDecodes program tree bits continuation term decoded := by
  generalize hclassify : CanonicalStep.classify program tree bits continuation
    hadmissible term = classified
  cases classified with
  | base queue =>
      rw [decode?, hclassify] at hdecode
      obtain ⟨beta, hbase⟩ :=
        (CanonicalStep.classify_eq_base_iff program tree bits continuation
          hadmissible term queue).mp hclassify
      have hterm := MutableBase.parse?_sound hbase
      rw [hterm]
      exact .root (.base queue beta (CellSpine.decode?_sound hdecode))
  | «local» accumulator =>
      rw [decode?, hclassify] at hdecode
      have inner := decode?_sound program tree bits continuation hadmissible
        hdecode
      obtain ⟨notBase, dispatcher, shell, dispatch⟩ :=
        (CanonicalStep.classify_eq_local_iff program tree bits continuation
          hadmissible term accumulator).mp hclassify
      exact .root (.local inner dispatch shell)
  | live bit predecessor =>
      rw [decode?, hclassify] at hdecode
      generalize hpredecessor :
        decode? program tree bits continuation hadmissible predecessor =
          predecessorResult at hdecode
      cases predecessorResult with
      | none => simp [hpredecessor] at hdecode
      | some predecessorBits =>
          simp [hpredecessor] at hdecode
          subst decoded
          have hshape :=
            (CanonicalStep.classify_eq_live_iff program tree bits continuation
              hadmissible term bit predecessor).mp hclassify
          rw [hshape.2.2]
          exact .live bit
            (decode?_sound program tree bits continuation hadmissible
              hpredecessor)
  | tombstone bit predecessor =>
      rw [decode?, hclassify] at hdecode
      have hshape :=
        (CanonicalStep.classify_eq_tombstone_iff program tree bits continuation
          hadmissible term bit predecessor).mp hclassify
      obtain ⟨audit, hterm⟩ := hshape.2.2
      rw [hterm]
      exact .tombstone bit audit
        (decode?_sound program tree bits continuation hadmissible hdecode)
  | malformed =>
      rw [decode?, hclassify] at hdecode
      cases hdecode
termination_by term.size
decreasing_by
  · exact classifiedLocal_size_lt hclassify
  · exact classifiedLive_size_lt hclassify
  · exact classifiedTombstone_size_lt hclassify

/-- Every declarative public path is accepted with its indexed live queue. -/
theorem decode?_complete
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {term : Term} {decoded : List Bool}
    (hpath : PathDecodes program tree bits continuation term decoded) :
    decode? program tree bits continuation hadmissible term = some decoded := by
  cases hpath with
  | root inner =>
      cases inner with
      | base queue beta queueComplete =>
          rw [decode?_permissiveBase]
          exact CellSpine.decode?_complete queueComplete
      | «local» inner dispatch shell =>
          rw [decode?_local program tree bits continuation hadmissible dispatch
            shell]
          exact decode?_complete program tree bits continuation hadmissible inner
  | live bit inner =>
      rw [decode?_live]
      rw [decode?_complete program tree bits continuation hadmissible inner]
      rfl
  | tombstone bit audit inner =>
      rw [decode?_tombstone]
      exact decode?_complete program tree bits continuation hadmissible inner
termination_by term.size
decreasing_by
  · have hsize := localChild_size_lt shell dispatch
    simp_all only
  · exact size_app_right_lt (PureSFormal.PureS.live bit) _
  · exact Nat.lt_trans (size_app_right_lt Term.s _)
      (size_app_left_lt (Term.app Term.s _) (Term.app (valueTag bit) audit))

/-- Executable decoding and the permissive public grammar agree exactly. -/
theorem decode?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term : Term) (decoded : List Bool) :
    decode? program tree bits continuation hadmissible term = some decoded ↔
      PathDecodes program tree bits continuation term decoded :=
  ⟨decode?_sound program tree bits continuation hadmissible,
    decode?_complete program tree bits continuation hadmissible⟩

/-- One bare public path has at most one decoded live queue. -/
theorem PathDecodes.deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    {first second : List Bool}
    (hadmissible : Carrier.Admissible continuation)
    (hfirst : PathDecodes program tree bits continuation term first)
    (hsecond : PathDecodes program tree bits continuation term second) :
    first = second := by
  have h : (some first : Option (List Bool)) = some second :=
    (decode?_complete program tree bits continuation hadmissible hfirst).symm.trans
      (decode?_complete program tree bits continuation hadmissible hsecond)
  exact Option.some.inj h

/-- Whole-root decoding is unique as a corollary of path uniqueness. -/
theorem RootDecodes.deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    {first second : List Bool}
    (hadmissible : Carrier.Admissible continuation)
    (hfirst : RootDecodes program tree bits continuation term first)
    (hsecond : RootDecodes program tree bits continuation term second) :
    first = second := by
  exact PathDecodes.deterministic hadmissible (.root hfirst) (.root hsecond)

/-! ## Canonical generated cases -/

/-- Any independently retained beta decodes once its active queue is complete. -/
theorem decode?_permissiveBase_of_decodes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (queue beta : Term) {decoded : List Bool}
    (hqueue : CellSpine.Decodes queue decoded) :
    decode? program tree bits continuation hadmissible
        (MutableBase.base (compileActions program tree) bits continuation queue
          beta) =
      some decoded := by
  rw [decode?_permissiveBase]
  exact CellSpine.decode?_complete hqueue

/-- A reachable queue mutation preserves decoding through the exact Base. -/
theorem decode?_mutableBase_of_decodes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (queue : Term) {decoded : List Bool}
    (hqueue : CellSpine.Decodes queue decoded) :
    decode? program tree bits continuation hadmissible
        (MutableBase.mutableBase (compileActions program tree) bits continuation
          queue) =
      some decoded := by
  rw [decode?_mutableBase]
  exact CellSpine.decode?_complete hqueue

/-- The literal equation-(9) initial Base decodes to its supplied input bits. -/
@[simp]
theorem decode?_initial
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) :
    decode? program tree bits continuation hadmissible
        (baseCarrier
          (environmentCode (compileActions program tree) bits) continuation) =
      some bits := by
  rw [← MutableBase.mutableBase_word]
  exact decode?_mutableBase_of_decodes program tree bits continuation
    hadmissible (word bits) (CellSpine.decodes_word bits)

/-- A generated Local inherits any successful decoding of its accumulator. -/
theorem decode?_local_of_some
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {dispatcher accumulator result : Term} {decoded : List Bool}
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher accumulator)
    (shell : Carrier.LocalShell bits continuation dispatcher result)
    (hinner : decode? program tree bits continuation hadmissible accumulator =
      some decoded) :
    decode? program tree bits continuation hadmissible result = some decoded := by
  rw [decode?_local program tree bits continuation hadmissible dispatch shell]
  exact hinner

/--
An explicitly generated route/action response gives the same Local decoding;
its route audits and action histories remain independent constructor fields.
-/
theorem decode?_local_of_route_action
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {response accumulator dispatcher result : Term}
    {histories : List Term} {decoded : List Bool}
    (routeShape : RouteGrammar.ActivatedRoute (selectedAction program) tree
      route label response dispatcher)
    (actionShape : ActionParser.ActionShape program label accumulator histories
      response)
    (shell : Carrier.LocalShell bits continuation dispatcher result)
    (hinner : decode? program tree bits continuation hadmissible accumulator =
      some decoded) :
    decode? program tree bits continuation hadmissible result = some decoded := by
  apply decode?_local_of_some program tree bits continuation hadmissible
    (dispatcher := dispatcher) (accumulator := accumulator)
  · exact ⟨route, label, response, histories, routeShape, actionShape⟩
  · exact shell
  · exact hinner

end CarrierDecoder

end PureSFormal.PureS
