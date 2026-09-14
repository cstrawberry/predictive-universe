import PureSFormal.Research.ClosedSetTreeAutomaton

/-! A local closed-set certificate excludes acceptance by the actual
one-cursor controller, including moves to either child and back to a parent. -/
namespace PureSFormal.Research.ClosedSetCertificateSoundness
open PureSFormal.PureS FiniteController FiniteTreeAutomatonPowerset ClosedSetTreeAutomaton

abbrev Focus (n : Nat) := (source : Term) × Decoration n source

inductive Frame (n : Nat) where
  | left (marked : Bits n) (sibling : Focus n)
  | right (sibling : Focus n) (marked : Bits n)

def Frame.forget : Frame n → ParentFrame
  | .left _ sibling => .left sibling.1
  | .right sibling _ => .right sibling.1

structure MarkedCursor (n : Nat) where
  focus : Focus n
  parents : List (Frame n)

def MarkedCursor.forget (cursor : MarkedCursor n) : Cursor :=
  ⟨cursor.focus.1, cursor.parents.map Frame.forget⟩

def MarkedCursor.incoming (cursor : MarkedCursor n) : Probe.Incoming :=
  match cursor.parents with
  | [] => .root
  | .left _ _ :: _ => .left
  | .right _ _ :: _ => .right

def MarkedCursor.boundary (cursor : MarkedCursor n) : Boundary n :=
  cursor.focus.2.boundary cursor.incoming

inductive Good (machine : Machine (Fin n)) (accept : Fin n → Bool) : MarkedCursor n → Prop where
  | root {source} (decoration : Decoration n source)
      (valid : decoration.Valid machine accept .root) : Good machine accept ⟨⟨source, decoration⟩, []⟩
  | left {l r} (marked : Bits n) (left : Decoration n l) (right : Decoration n r)
      (parents : List (Frame n))
      (parent : Good machine accept ⟨⟨.app l r, .branch marked left right⟩, parents⟩) :
      Good machine accept ⟨⟨l, left⟩, .left marked ⟨r, right⟩ :: parents⟩
  | right {l r} (marked : Bits n) (left : Decoration n l) (right : Decoration n r)
      (parents : List (Frame n))
      (parent : Good machine accept ⟨⟨.app l r, .branch marked left right⟩, parents⟩) :
      Good machine accept ⟨⟨r, right⟩, .right ⟨l, left⟩ marked :: parents⟩

theorem Good.valid {machine : Machine (Fin n)} {accept : Fin n → Bool}
    {cursor : MarkedCursor n} (good : Good machine accept cursor) :
    cursor.focus.2.Valid machine accept cursor.incoming := by
  induction good with
  | root decoration valid => exact valid
  | left marked left right parents parent ih => exact ih.1
  | right marked left right parents parent ih => exact ih.2.1

theorem forget_observations (cursor : MarkedCursor n) :
    Probe.observeNode cursor.forget = cursor.boundary.node ∧
      Probe.observeIncoming cursor.forget = cursor.boundary.incoming := by
  rcases cursor with ⟨⟨source, decoration⟩, parents⟩
  cases decoration <;> cases parents with
  | nil => exact ⟨rfl, rfl⟩
  | cons head tail => cases head <;> exact ⟨rfl, rfl⟩

theorem rootClosed_spec (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (state : Boundary n) (left right : Bits n)
    (closed : rootClosed machine accept state left right = true)
    (q : Fin n) (marked : state.marked.get q = true) :
    accept q = false ∧
      (match machine.transition q state.node state.incoming with
      | .stay next => state.marked.get next
      | .exec .L next => match state.node with | .s => true | .app => left.get next
      | .exec .R next => match state.node with | .s => true | .app => right.get next
      | .exec .U _ => true
      | .exec .Rdx _ => true
      | .reject => true) = true := by
  have localRule := (allIndex_iff _ _).mp closed q
  rw [marked] at localRule
  simp only [↓reduceIte] at localRule
  obtain ⟨notAccepted, successor⟩ := (Bool.and_eq_true _ _).mp localRule
  refine ⟨?_, successor⟩
  cases result : accept q with
  | false => rfl
  | true => rw [result] at notAccepted; cases notAccepted

theorem upClosed_spec (machine : Machine (Fin n)) (child parent : Boundary n)
    (closed : upClosed machine child parent = true) (q next : Fin n)
    (marked : child.marked.get q = true)
    (command : machine.transition q child.node child.incoming = .exec .U next) :
    parent.marked.get next = true := by
  have localRule := (allIndex_iff _ _).mp closed q
  rw [marked, command] at localRule
  exact localRule

def childMarks : {source : Term} → Decoration n source → Bits n × Bits n
  | _, .leaf _ => (emptyBits n, emptyBits n)
  | _, .branch _ left right => ((left.boundary .left).marked, (right.boundary .right).marked)

theorem Good.rootClosed {machine : Machine (Fin n)} {accept : Fin n → Bool}
    {cursor : MarkedCursor n} (good : Good machine accept cursor) :
    rootClosed machine accept cursor.boundary (childMarks cursor.focus.2).1 (childMarks cursor.focus.2).2 = true := by
  have valid := good.valid
  rcases cursor with ⟨⟨source, decoration⟩, parents⟩
  cases decoration with
  | leaf marked => exact valid
  | branch marked left right =>
    have branch := valid.2.2
    simp only [branchCheck, Decoration.boundary_incoming] at branch
    exact ((Bool.and_eq_true _ _).mp ((Bool.and_eq_true _ _).mp branch).1).1

def Safe (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (configuration : Configuration (Fin n)) : Prop :=
  configuration.control = none ∨
    ∃ cursor : MarkedCursor n, ∃ q : Fin n, Good machine accept cursor ∧
      configuration = ⟨some q, cursor.forget⟩ ∧ cursor.boundary.marked.get q = true

theorem safe_not_accepting (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (configuration : Configuration (Fin n)) (safe : Safe machine accept configuration)
    (q : Fin n) (state : configuration.control = some q) : accept q = false := by
  cases safe with
  | inl rejected => rw [rejected] at state; cases state
  | inr witness =>
    obtain ⟨cursor, actualQ, good, equal, marked⟩ := witness
    subst configuration
    cases Option.some.inj state
    exact (rootClosed_spec machine accept _ _ _ good.rootClosed _ marked).1

theorem safe_step (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (readOnly : ∀ configuration, mutationCount machine configuration = 0)
    (configuration : Configuration (Fin n)) (safe : Safe machine accept configuration) :
    Safe machine accept (step machine configuration) := by
  cases safe with
  | inl rejected =>
    rcases configuration with ⟨control, cursor⟩
    change control = none at rejected
    subst control
    exact Or.inl rfl
  | inr witness =>
    obtain ⟨cursor, q, good, equal, marked⟩ := witness
    subst configuration
    have closed := (rootClosed_spec machine accept _ _ _ good.rootClosed q marked).2
    have observations := forget_observations cursor
    generalize command : machine.transition q cursor.boundary.node cursor.boundary.incoming = instruction at closed
    have observedCommand : machine.transition q (Probe.observeNode cursor.forget)
        (Probe.observeIncoming cursor.forget) = instruction := by rw [observations.1, observations.2]; exact command
    cases instruction with
    | reject => exact Or.inl (by simp only [step, observedCommand])
    | stay next =>
      exact Or.inr ⟨cursor, next, good, by simp only [step, observedCommand], closed⟩
    | exec primitive next =>
      cases primitive with
      | Rdx =>
        have zero := readOnly ⟨some q, cursor.forget⟩
        simp only [mutationCount, observedCommand] at zero
        cases contraction : cursor.forget.rdx? with
        | none => exact Or.inl (by simp only [step, observedCommand, Primitive.exec, contraction])
        | some after => rw [contraction] at zero; cases zero
      | L =>
        rcases cursor with ⟨⟨source, decoration⟩, parents⟩
        cases decoration with
        | leaf marks => exact Or.inl (by simp only [step, observedCommand]; rfl)
        | branch marks left right =>
          refine Or.inr ⟨⟨⟨_, left⟩, .left marks ⟨_, right⟩ :: parents⟩, next,
            Good.left marks left right parents good, ?_, ?_⟩
          · simp only [step, observedCommand]; rfl
          · exact closed
      | R =>
        rcases cursor with ⟨⟨source, decoration⟩, parents⟩
        cases decoration with
        | leaf marks => exact Or.inl (by simp only [step, observedCommand]; rfl)
        | branch marks left right =>
          refine Or.inr ⟨⟨⟨_, right⟩, .right ⟨_, left⟩ marks :: parents⟩, next,
            Good.right marks left right parents good, ?_, ?_⟩
          · simp only [step, observedCommand]; rfl
          · exact closed
      | U =>
        cases good with
        | root decoration valid => exact Or.inl (by simp only [step, observedCommand]; rfl)
        | left marks left right parents parent =>
          refine Or.inr ⟨⟨⟨_, .branch marks left right⟩, parents⟩, next, parent, ?_, ?_⟩
          · simp only [step, observedCommand]; rfl
          · have branch := parent.valid.2.2
            simp only [branchCheck, Decoration.boundary_incoming] at branch
            have up := ((Bool.and_eq_true _ _).mp ((Bool.and_eq_true _ _).mp branch).1).2
            exact upClosed_spec machine _ _ up q next marked command
        | right marks left right parents parent =>
          refine Or.inr ⟨⟨⟨_, .branch marks left right⟩, parents⟩, next, parent, ?_, ?_⟩
          · simp only [step, observedCommand]; rfl
          · have branch := parent.valid.2.2
            simp only [branchCheck, Decoration.boundary_incoming] at branch
            have up := ((Bool.and_eq_true _ _).mp branch).2
            exact upClosed_spec machine _ _ up q next marked command

theorem safe_run (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (readOnly : ∀ configuration, mutationCount machine configuration = 0)
    (configuration : Configuration (Fin n)) (safe : Safe machine accept configuration)
    (ticks : Nat) : Safe machine accept (run machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => exact safe
  | succ ticks ih => exact ih _ (safe_step machine accept readOnly _ safe)

theorem certificate_excludes_acceptance (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (readOnly : ∀ configuration, mutationCount machine configuration = 0)
    (start : Fin n) (source : Term) (certificate : Certificate machine accept start source)
    (ticks : Nat) (q : Fin n)
    (state : (run machine ticks ⟨some start, Cursor.atRoot source⟩).control = some q) :
    accept q = false := by
  obtain ⟨decoration, valid, marked⟩ := certificate
  have initialSafe : Safe machine accept ⟨some start, Cursor.atRoot source⟩ :=
    Or.inr ⟨⟨⟨source, decoration⟩, []⟩, start, Good.root decoration valid, rfl, marked⟩
  exact safe_not_accepting machine accept _ (safe_run machine accept readOnly _ initialSafe ticks) q state

end PureSFormal.Research.ClosedSetCertificateSoundness
