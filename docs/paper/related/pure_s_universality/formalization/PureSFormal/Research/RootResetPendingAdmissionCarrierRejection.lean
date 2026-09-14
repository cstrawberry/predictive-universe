import PureSFormal.Research.RootResetPendingAdmissionPatterns

/-! Generated terminal carriers must stop pending-child admission. This module
checks the actual clock-continuation Base syntax, including its mutable queue
and arbitrary retained beta field. -/
namespace PureSFormal.Research.RootResetPendingAdmissionCarrierRejection
open PureSFormal.PureS
open RootResetCompletedLocalPatterns RootResetPendingAdmissionPatterns

theorem C_s_misses (fuel : Nat) : Pattern.s.matchesBool (C fuel) = false := by
  cases fuel <;> rfl

theorem localPattern_base_misses (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern)
    (actions continuation queue beta : Term) (bits : List Bool) :
    (localPattern status dispatch).matchesBool (MutableBase.base actions bits continuation queue beta) = false := by
  cases continuation <;>
    simp only [MutableBase.base, MutableBase.activeAlpha, MutableBase.activeEnvironment,
      MutableBase.activeDispatcher, MutableBase.activeSeed, localPattern, Pattern.matchesBool,
      Bool.and_false, Bool.false_and]

theorem fixed_base_misses (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (stage remaining : Nat) (bits : List Bool) (queue beta : Term) :
    let actions := compileActions program tree
    let continuation := Dovetail.clockExit stage remaining (environmentCode actions bits)
    let source := MutableBase.base actions bits continuation queue beta
    (pendingPattern actions .hole).matchesBool source = false ∧
      RootResetNestedFramePatterns.firstPattern.matchesBool source = false ∧
      RootResetNestedFramePatterns.secondPattern.matchesBool source = false ∧
      ∀ kind, (RootResetPendingAdmissionFuelPatterns.pattern (environmentPattern actions) kind).matchesBool source = false := by
  dsimp only
  cases remaining with
  | zero =>
      simp only [Dovetail.clockExit, clockWrappers, clockBase, C, b, MutableBase.base,
        pendingPattern, environmentPattern, RootResetNestedFramePatterns.firstPattern,
        RootResetNestedFramePatterns.secondPattern, Pattern.matchesBool, Bool.and_false, Bool.false_and, true_and]
      intro kind
      cases kind <;> rfl
  | succ remaining =>
      cases stage with
      | zero =>
          simp only [Dovetail.clockExit, clockWrappers, C, b, MutableBase.base,
            pendingPattern, environmentPattern, RootResetNestedFramePatterns.firstPattern,
            RootResetNestedFramePatterns.secondPattern, literal, haltCode, haltTag,
            Pattern.matchesBool, C_s_misses, Bool.and_false, Bool.false_and, Bool.false_eq_true, and_self, true_and]
          intro kind
          cases kind <;> rfl
      | succ stage =>
          cases stage <;> simp only [Dovetail.clockExit, clockWrappers, C, b, MutableBase.base,
            pendingPattern, environmentPattern, RootResetNestedFramePatterns.firstPattern,
            RootResetNestedFramePatterns.secondPattern, literal, haltCode, haltTag,
            Pattern.matchesBool, C_s_misses, Bool.and_false, Bool.false_and, Bool.false_eq_true, and_self, true_and]
          all_goals intro kind; cases kind <;> rfl

theorem childAdmitted_false_of_misses (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term)
    (pending : (pendingPattern (compileActions program tree) .hole).matchesBool source = false)
    (first : RootResetNestedFramePatterns.firstPattern.matchesBool source = false)
    (second : RootResetNestedFramePatterns.secondPattern.matchesBool source = false)
    (fuels : ∀ kind, (RootResetPendingAdmissionFuelPatterns.pattern (environmentPattern (compileActions program tree)) kind).matchesBool source = false)
    (locals : ∀ status dispatch, (localPattern status dispatch).matchesBool source = false) :
    childAdmitted program tree source = false := by
  have localMiss (status : CheckpointDecoder.HaltStatus) (pattern : Pattern)
      (member : pattern ∈ localPatterns status program tree) : pattern.matchesBool source = false := by
    obtain ⟨dispatch, member, equal⟩ := map_member_inverse _ _ _ member
    subst pattern
    exact locals _ _
  have each (pattern : Pattern) (member : pattern ∈ childPatterns program tree) : pattern.matchesBool source = false := by
    rcases List.mem_append.mp member with earlier | fresh
    · rcases List.mem_append.mp earlier with earlier | marked
      · rcases List.mem_append.mp earlier with fixed | fuel
        · rcases List.mem_cons.mp fixed with equal | rest
          · subst pattern; exact pending
          · rcases List.mem_cons.mp rest with equal | rest
            · subst pattern; exact locals _ _
            · rcases List.mem_cons.mp rest with equal | rest
              · subst pattern; exact first
              · have equal := List.mem_singleton.mp rest
                subst pattern; exact second
        · obtain ⟨kind, member, equal⟩ := map_member_inverse _ _ _ fuel
          subst pattern; exact fuels _
      · exact localMiss _ _ marked
    · exact localMiss _ _ fresh
  have all (items : List Pattern) (miss : ∀ pattern ∈ items, pattern.matchesBool source = false) :
      items.any (fun pattern => pattern.matchesBool source) = false := by
    induction items with
    | nil => rfl
    | cons pattern items ih =>
        rw [List.any_cons, miss pattern (List.Mem.head _)]
        exact ih (fun next member => miss next (List.Mem.tail _ member))
  exact all _ each

theorem childAdmitted_base_false (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (stage remaining : Nat) (bits : List Bool) (queue beta : Term) :
    childAdmitted program tree (MutableBase.base (compileActions program tree) bits
      (Dovetail.clockExit stage remaining (environmentCode (compileActions program tree) bits)) queue beta) = false := by
  obtain ⟨pending, first, second, fuels⟩ := fixed_base_misses program tree stage remaining bits queue beta
  exact childAdmitted_false_of_misses program tree _ pending first second fuels
    (fun status dispatch => localPattern_base_misses status dispatch _ _ _ _ _)

theorem childAdmitted_live_false (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (carrier : Term) :
    childAdmitted program tree (.app (live bit) carrier) = false := by
  have locals (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern) :
      (localPattern status dispatch).matchesBool (.app (live bit) carrier) = false := by
    cases status <;> cases bit <;> rfl
  have fuels (kind : RootResetPendingAdmissionFuelPatterns.Kind) :
      (RootResetPendingAdmissionFuelPatterns.pattern (environmentPattern (compileActions program tree)) kind).matchesBool
        (.app (live bit) carrier) = false := by
    cases kind <;> cases bit <;> rfl
  exact childAdmitted_false_of_misses program tree _ (by cases bit <;> rfl)
    (by cases bit <;> rfl) (by cases bit <;> rfl) fuels locals

theorem childAdmitted_tombstone_false (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (leftCarrier rightCarrier : Term) :
    childAdmitted program tree (.app (.app .s leftCarrier) (.app (valueTag bit) rightCarrier)) = false := by
  have locals (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern) :
      (localPattern status dispatch).matchesBool (.app (.app .s leftCarrier) (.app (valueTag bit) rightCarrier)) = false := by
    cases status <;> rfl
  have fuels (kind : RootResetPendingAdmissionFuelPatterns.Kind) :
      (RootResetPendingAdmissionFuelPatterns.pattern (environmentPattern (compileActions program tree)) kind).matchesBool
        (.app (.app .s leftCarrier) (.app (valueTag bit) rightCarrier)) = false := by
    cases kind <;> rfl
  exact childAdmitted_false_of_misses program tree _ rfl rfl rfl fuels locals

theorem childAdmitted_path_nonlocal_false {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {stage remaining : Nat} {source : Term}
    (path : CarrierDecoder.PathDecodes program tree bits
      (Dovetail.clockExit stage remaining (environmentCode (compileActions program tree) bits)) source decoded)
    (notLocal : CheckpointDecoder.parseLocal? program tree source = none) :
    childAdmitted program tree source = false := by
  cases path with
  | live bit inner => exact childAdmitted_live_false program tree bit _
  | tombstone bit audit inner => exact childAdmitted_tombstone_false program tree bit _ audit
  | root inner =>
      cases inner with
      | base queue beta queueComplete => exact childAdmitted_base_false program tree stage remaining bits queue beta
      | @«local» accumulator dispatcher result decoded inner dispatch shell =>
          obtain ⟨route, label, dispatchShape⟩ := dispatch
          let continuation := Dovetail.clockExit stage remaining (environmentCode (compileActions program tree) bits)
          cases shell with
          | fresh haltAudit seedAudit continuationAudit =>
              let view : CheckpointDecoder.LocalView program := ⟨.fresh, route, label, accumulator, word bits, continuation⟩
              have shape : CheckpointDecoder.LocalShape program tree view
                  (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
                ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
              rw [CheckpointDecoder.parseLocal?_complete shape] at notLocal
              cases notLocal
          | marked leftAudit rightAudit seedAudit continuationAudit =>
              let view : CheckpointDecoder.LocalView program := ⟨.marked, route, label, accumulator, word bits, continuation⟩
              have shape : CheckpointDecoder.LocalShape program tree view
                  (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
                ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit,
                  .marked leftAudit rightAudit, dispatchShape, rfl⟩
              rw [CheckpointDecoder.parseLocal?_complete shape] at notLocal
              cases notLocal

theorem childAdmitted_path_eq_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {stage remaining : Nat} {source : Term}
    (path : CarrierDecoder.PathDecodes program tree bits
      (Dovetail.clockExit stage remaining (environmentCode (compileActions program tree) bits)) source decoded) :
    childAdmitted program tree source = (CheckpointDecoder.parseLocal? program tree source).isSome := by
  cases parsed : CheckpointDecoder.parseLocal? program tree source with
  | none => exact childAdmitted_path_nonlocal_false path parsed
  | some view => exact childAdmitted_local parsed

end PureSFormal.Research.RootResetPendingAdmissionCarrierRejection
