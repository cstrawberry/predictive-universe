import PureSFormal.Research.ClosedSetCertificateSoundness

/-! A finite stabilized nonaccepting orbit supplies every mark in a local
tree certificate. Marks are executable bounded searches in the actual run. -/
namespace PureSFormal.Research.ClosedSetCertificateCompleteness
open PureSFormal.PureS FiniteController FiniteTreeAutomatonPowerset ClosedSetTreeAutomaton

structure ClosedMarking (machine : Machine (Fin n)) (accept : Fin n → Bool) where
  mark : Cursor → Bits n
  nonaccepting : ∀ cursor q, (mark cursor).get q = true → accept q = false
  closed : ∀ cursor q endpoint next, (mark cursor).get q = true →
    step machine ⟨some q, cursor⟩ = ⟨some next, endpoint⟩ → (mark endpoint).get next = true

def decorate (mark : Cursor → Bits n) : (source : Term) → List ParentFrame → Decoration n source
  | .s, parents => .leaf (mark ⟨.s, parents⟩)
  | .app left right, parents => .branch (mark ⟨.app left right, parents⟩)
      (decorate mark left (.left right :: parents)) (decorate mark right (.right left :: parents))

theorem decorate_boundary (mark : Cursor → Bits n) (source : Term)
    (parents : List ParentFrame) (incoming : Probe.Incoming) :
    (decorate mark source parents).boundary incoming =
      ⟨Probe.observeNode ⟨source, parents⟩, incoming, mark ⟨source, parents⟩⟩ := by
  cases source <;> rfl

def childMarks (mark : Cursor → Bits n) : Term → List ParentFrame → Bits n × Bits n
  | .s, _ => (emptyBits n, emptyBits n)
  | .app left right, parents =>
      (mark ⟨left, .left right :: parents⟩, mark ⟨right, .right left :: parents⟩)

theorem marking_rootClosed (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (marking : ClosedMarking machine accept) (source : Term) (parents : List ParentFrame) :
    rootClosed machine accept
      ⟨Probe.observeNode ⟨source, parents⟩, Probe.observeIncoming ⟨source, parents⟩,
        marking.mark ⟨source, parents⟩⟩
      (childMarks marking.mark source parents).1 (childMarks marking.mark source parents).2 = true := by
  apply (allIndex_iff _ _).mpr
  intro q
  cases marked : (marking.mark ⟨source, parents⟩).get q with
  | false => simp only [marked, Bool.false_eq_true, ↓reduceIte]
  | true =>
    simp only [marked, ↓reduceIte, marking.nonaccepting _ _ marked, Bool.not_false, Bool.true_and]
    generalize command : machine.transition q (Probe.observeNode ⟨source, parents⟩)
      (Probe.observeIncoming ⟨source, parents⟩) = instruction
    cases instruction with
    | reject => rfl
    | stay next =>
      exact marking.closed _ q _ next marked (by simp only [step, command])
    | exec primitive next =>
      cases primitive with
      | U => rfl
      | Rdx => rfl
      | L =>
        cases source with
        | s => rfl
        | app left right =>
          exact marking.closed _ q _ next marked (by simp only [step, command]; rfl)
      | R =>
        cases source with
        | s => rfl
        | app left right =>
          exact marking.closed _ q _ next marked (by simp only [step, command]; rfl)

theorem marking_upClosed_left (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (marking : ClosedMarking machine accept) (left right : Term) (parents : List ParentFrame) :
    upClosed machine
      ⟨Probe.observeNode ⟨left, .left right :: parents⟩, .left, marking.mark ⟨left, .left right :: parents⟩⟩
      ⟨.app, Probe.observeIncoming ⟨.app left right, parents⟩, marking.mark ⟨.app left right, parents⟩⟩ = true := by
  apply (allIndex_iff _ _).mpr
  intro q
  cases marked : (marking.mark ⟨left, .left right :: parents⟩).get q with
  | false => simp only [marked, Bool.false_eq_true, ↓reduceIte]
  | true =>
    simp only [marked, ↓reduceIte]
    generalize command : machine.transition q (Probe.observeNode ⟨left, .left right :: parents⟩) .left = instruction
    cases instruction with
    | reject => rfl
    | stay _ => rfl
    | exec primitive next =>
      cases primitive with
      | L => rfl
      | R => rfl
      | Rdx => rfl
      | U =>
        exact marking.closed _ q _ next marked (by simp only [step, Probe.observeIncoming_left, command]; rfl)

theorem marking_upClosed_right (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (marking : ClosedMarking machine accept) (left right : Term) (parents : List ParentFrame) :
    upClosed machine
      ⟨Probe.observeNode ⟨right, .right left :: parents⟩, .right, marking.mark ⟨right, .right left :: parents⟩⟩
      ⟨.app, Probe.observeIncoming ⟨.app left right, parents⟩, marking.mark ⟨.app left right, parents⟩⟩ = true := by
  apply (allIndex_iff _ _).mpr
  intro q
  cases marked : (marking.mark ⟨right, .right left :: parents⟩).get q with
  | false => simp only [marked, Bool.false_eq_true, ↓reduceIte]
  | true =>
    simp only [marked, ↓reduceIte]
    generalize command : machine.transition q (Probe.observeNode ⟨right, .right left :: parents⟩) .right = instruction
    cases instruction with
    | reject => rfl
    | stay _ => rfl
    | exec primitive next =>
      cases primitive with
      | L => rfl
      | R => rfl
      | Rdx => rfl
      | U =>
        exact marking.closed _ q _ next marked (by simp only [step, Probe.observeIncoming_right, command]; rfl)

theorem decorate_valid (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (marking : ClosedMarking machine accept) (source : Term) (parents : List ParentFrame) :
    (decorate marking.mark source parents).Valid machine accept
      (Probe.observeIncoming ⟨source, parents⟩) := by
  induction source generalizing parents with
  | s => exact marking_rootClosed machine accept marking .s parents
  | app left right leftIH rightIH =>
    refine ⟨leftIH _, rightIH _, ?_⟩
    change branchCheck machine accept _ _ _ = true
    rw [decorate_boundary, decorate_boundary]
    change ((rootClosed machine accept _ _ _ && _) && _) = true
    exact (Bool.and_eq_true _ _).mpr ⟨(Bool.and_eq_true _ _).mpr
      ⟨marking_rootClosed machine accept marking (.app left right) parents,
        marking_upClosed_left machine accept marking left right parents⟩,
      marking_upClosed_right machine accept marking left right parents⟩

theorem marking_certificate (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (marking : ClosedMarking machine accept) (start : Fin n) (source : Term)
    (initial : (marking.mark (Cursor.atRoot source)).get start = true) :
    Certificate machine accept start source := by
  refine ⟨decorate marking.mark source [], decorate_valid machine accept marking source [], ?_⟩
  rw [decorate_boundary]
  exact initial

def prefixMark (machine : Machine (Fin n)) (initial : Configuration (Fin n))
    (ticks : Nat) (cursor : Cursor) : Bits n :=
  Bits.tabulate n (fun q => anyIndex (ticks + 1) (fun index =>
    decide ((run machine index.val initial).control = some q) &&
      decide ((run machine index.val initial).cursor = cursor)))

theorem prefixMark_iff (machine : Machine (Fin n)) (initial : Configuration (Fin n))
    (ticks : Nat) (cursor : Cursor) (q : Fin n) :
    (prefixMark machine initial ticks cursor).get q = true ↔
      ∃ index, index ≤ ticks ∧ run machine index initial = ⟨some q, cursor⟩ := by
  rw [prefixMark, Bits.get_tabulate, anyIndex_iff]
  constructor
  · rintro ⟨index, accepted⟩
    obtain ⟨state, endpoint⟩ := (Bool.and_eq_true _ _).mp accepted
    have stateEq := of_decide_eq_true state
    have cursorEq := of_decide_eq_true endpoint
    refine ⟨index.val, Nat.le_of_lt_succ index.isLt, ?_⟩
    generalize actual : run machine index.val initial = configuration at *
    rcases configuration with ⟨control, returned⟩
    change control = some q at stateEq
    change returned = cursor at cursorEq
    cases stateEq; cases cursorEq; rfl
  · rintro ⟨index, bounded, actual⟩
    refine ⟨⟨index, Nat.lt_succ_of_le bounded⟩, ?_⟩
    rw [actual]
    exact (Bool.and_eq_true _ _).mpr ⟨decide_eq_true rfl, decide_eq_true rfl⟩

theorem prefixMark_closed (machine : Machine (Fin n)) (initial : Configuration (Fin n))
    (ticks : Nat) (stable : step machine (run machine ticks initial) = run machine ticks initial)
    (cursor endpoint : Cursor) (q next : Fin n)
    (marked : (prefixMark machine initial ticks cursor).get q = true)
    (actualStep : step machine ⟨some q, cursor⟩ = ⟨some next, endpoint⟩) :
    (prefixMark machine initial ticks endpoint).get next = true := by
  obtain ⟨index, bounded, actual⟩ := (prefixMark_iff _ _ _ _ _).mp marked
  apply (prefixMark_iff _ _ _ _ _).mpr
  cases Nat.lt_or_eq_of_le bounded with
  | inl before =>
    refine ⟨index + 1, Nat.succ_le_of_lt before, ?_⟩
    rw [run_add, actual]
    exact actualStep
  | inr atEnd =>
    subst index
    refine ⟨ticks, Nat.le_refl _, ?_⟩
    rw [actual] at stable
    exact actual.trans (stable.symm.trans actualStep)

def prefixMarking (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (initial : Configuration (Fin n)) (ticks : Nat)
    (stable : step machine (run machine ticks initial) = run machine ticks initial)
    (negative : ∀ index, index ≤ ticks → ∀ q,
      (run machine index initial).control = some q → accept q = false) : ClosedMarking machine accept where
  mark := prefixMark machine initial ticks
  nonaccepting cursor q marked := by
    obtain ⟨index, bounded, actual⟩ := (prefixMark_iff _ _ _ _ _).mp marked
    exact negative index bounded q (congrArg Configuration.control actual)
  closed cursor q endpoint next marked actual := prefixMark_closed machine initial ticks stable cursor endpoint q next marked actual

theorem stabilized_negative_certificate (machine : Machine (Fin n)) (accept : Fin n → Bool)
    (start : Fin n) (source : Term) (ticks : Nat)
    (stable : step machine (run machine ticks ⟨some start, Cursor.atRoot source⟩) =
      run machine ticks ⟨some start, Cursor.atRoot source⟩)
    (negative : ∀ index, index ≤ ticks → ∀ q,
      (run machine index ⟨some start, Cursor.atRoot source⟩).control = some q → accept q = false) :
    Certificate machine accept start source := by
  apply marking_certificate machine accept
    (prefixMarking machine accept ⟨some start, Cursor.atRoot source⟩ ticks stable negative) start source
  exact (prefixMark_iff _ _ _ _ _).mpr ⟨0, Nat.zero_le _, rfl⟩

end PureSFormal.Research.ClosedSetCertificateCompleteness
