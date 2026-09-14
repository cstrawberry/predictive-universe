import PureSFormal.AppendixF.Carrier

/-! The recursive I/G program and data grammar, with every native step in one
feedback macro. The outer context and its frozen terms are unrestricted. -/
namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS
open PureSFormal.AppendixF.Carrier (Trace)
local infixl:70 " ⊙ " => Term.app
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000

inductive Program where
  | stop
  | hold (tail : Program)
  | grow (tail : Program)
  deriving DecidableEq, Repr

def Program.term : Program → Term
  | .stop => .s
  | .hold tail => .s ⊙ tail.term ⊙ .s
  | .grow tail => .s ⊙ (.s ⊙ tail.term) ⊙ .s

def Program.holds : Nat → Program → Program
  | 0, tail => tail
  | n + 1, tail => .hold (holds n tail)

/-- The two disjoint forms of admissible programs: initial holds ending at
the first G, or at least two holds ending in S. -/
inductive Admissible where
  | grow (initialHolds : Nat) (tail : Program)
  | holds (additionalHolds : Nat)
  deriving DecidableEq, Repr

def Admissible.program : Admissible → Program
  | .grow n tail => Program.holds n (.grow tail)
  | .holds n => Program.holds (n + 2) .stop

def Admissible.term (p : Admissible) : Term := p.program.term

def Admissible.hold : Admissible → Admissible
  | .grow n tail => .grow (n + 1) tail
  | .holds n => .holds (n + 1)

theorem Admissible.hold_term (p : Admissible) : p.hold.term = .s ⊙ p.term ⊙ .s := by
  cases p <;> rfl

def Admissible.programContext : Admissible → Term → Context
  | .grow 0 tail, x => .appRight (tail.term ⊙ (.s ⊙ x)) .hole
  | .grow (n + 1) tail, x => .appLeft ((Admissible.grow n tail).programContext x) (.s ⊙ x)
  | .holds 0, x => .appLeft .hole ((.s ⊙ x) ⊙ (.s ⊙ x))
  | .holds (n + 1), x => .appLeft ((Admissible.holds n).programContext x) (.s ⊙ x)

def Admissible.programTerms : Admissible → Term → List Term
  | .grow 0 tail, x =>
      [(Admissible.grow 0 tail).term ⊙ x, (.s ⊙ tail.term ⊙ x) ⊙ (.s ⊙ x)]
  | .grow (n + 1) tail, x =>
      (Admissible.grow (n + 1) tail).term ⊙ x ::
        ((Admissible.grow n tail).programTerms x).map (fun t => t ⊙ (.s ⊙ x))
  | .holds 0, x =>
      [(Admissible.holds 0).term ⊙ x,
       ((Program.hold .stop).term ⊙ x) ⊙ (.s ⊙ x),
       (.s ⊙ x ⊙ (.s ⊙ x)) ⊙ (.s ⊙ x)]
  | .holds (n + 1), x =>
      (Admissible.holds (n + 1)).term ⊙ x ::
        ((Admissible.holds n).programTerms x).map (fun t => t ⊙ (.s ⊙ x))

theorem Admissible.program_native (p : Admissible) (x : Term) :
    Trace (p.term ⊙ x) (p.programTerms x) ((p.programContext x).plug (x ⊙ (.s ⊙ x))) := by
  cases p with
  | grow n tail =>
    induction n with
    | zero =>
      simp only [programTerms, programContext]
      exact .cons (Step.root (.s ⊙ tail.term) .s x)
        (.cons (Step.root tail.term x (.s ⊙ x)) (.nil _))
    | succ n ih =>
      simp only [programTerms, programContext]
      exact .cons (Step.root (Admissible.grow n tail).term .s x)
        (ih.inContext (.appLeft .hole (.s ⊙ x)))
  | holds n =>
    induction n with
    | zero =>
      simp only [programTerms, programContext]
      exact .cons (Step.root (Program.hold .stop).term .s x)
        (.cons ((Step.root .s .s x).appLeft (.s ⊙ x))
          (.cons (Step.root x (.s ⊙ x) (.s ⊙ x)) (.nil _)))
    | succ n ih =>
      simp only [programTerms, programContext]
      exact .cons (Step.root (Admissible.holds n).term .s x)
        (ih.inContext (.appLeft .hole (.s ⊙ x)))

theorem Admissible.program_positive (p : Admissible) (x : Term) :
    2 ≤ (p.programTerms x).length := by
  cases p with
  | grow n tail =>
    induction n with
    | zero => simp [programTerms]
    | succ n ih => simp only [programTerms, List.length_cons, List.length_map]; omega
  | holds n =>
    induction n with
    | zero => simp [programTerms]
    | succ n ih => simp only [programTerms, List.length_cons, List.length_map]; omega

inductive Data (Label : Type) where
  | leaf (label : Label)
  | node (left right : Data Label)
  deriving DecidableEq, Repr

def Data.term (table : Label → Admissible) : Data Label → Term
  | .leaf j => .s ⊙ (table j).term
  | .node left right => .s ⊙ left.term table ⊙ (.s ⊙ right.term table)

def Data.label : Data Label → Label
  | .leaf j => j
  | .node left _ => left.label

def Data.internal : Data Label → Bool
  | .leaf _ => false
  | .node _ _ => true

def Data.rightmost : Data Label → Data Label
  | .leaf j => .leaf j
  | .node (.leaf _) right => right
  | .node (.node a b) _ => (Data.node a b).rightmost

def Data.feedback (x : Data Label) : Data Label := .node x.rightmost x

@[simp] theorem Data.feedback_internal (x : Data Label) : x.feedback.internal = true := rfl

def Data.descentContext (table : Label → Admissible) : Data Label → Term → Context
  | .leaf _, _ => .hole
  | .node (.leaf _) right, b => .appLeft .hole (b ⊙ (.s ⊙ right.term table ⊙ b))
  | .node (.node a c) right, b =>
      .appLeft ((Data.node a c).descentContext table b) (.s ⊙ right.term table ⊙ b)

def Data.descentTerms (table : Label → Admissible) : Data Label → Term → List Term
  | .leaf _, _ => []
  | .node (.leaf j) right, b =>
      [(Data.node (.leaf j) right).term table ⊙ b,
       (Data.leaf j).term table ⊙ b ⊙ (.s ⊙ right.term table ⊙ b)]
  | .node (.node a c) right, b =>
      (Data.node (.node a c) right).term table ⊙ b ::
        ((Data.node a c).descentTerms table b).map (fun t => t ⊙ (.s ⊙ right.term table ⊙ b))

theorem Data.descent_native (table : Label → Admissible) (x : Data Label) (b : Term)
    (internal : x.internal = true) :
    Trace (x.term table ⊙ b) (x.descentTerms table b)
      ((x.descentContext table b).plug
        ((table x.label).term ⊙ (.s ⊙ x.rightmost.term table ⊙ b))) := by
  induction x with
  | leaf j => cases internal
  | node left right ih _ =>
    cases left with
    | leaf j =>
      exact .cons (Step.root ((Data.leaf j).term table) (.s ⊙ right.term table) b)
        (.cons (Step.root (table j).term b (.s ⊙ right.term table ⊙ b)) (.nil _))
    | node a c =>
      exact .cons (Step.root ((Data.node a c).term table) (.s ⊙ right.term table) b)
        ((ih rfl).inContext (.appLeft .hole (.s ⊙ right.term table ⊙ b)))

theorem Data.descent_positive (table : Label → Admissible) (x : Data Label) (b : Term)
    (internal : x.internal = true) : 2 ≤ (x.descentTerms table b).length := by
  induction x with
  | leaf j => cases internal
  | node left right ih _ =>
    cases left with
    | leaf => exact Nat.le_refl _
    | node a c =>
      have bound := ih rfl
      simp only [descentTerms, List.length_cons, List.length_map]
      omega

theorem trace_append {a b c : Term} {left right : List Term}
    (first : Trace a left b) (second : Trace b right c) : Trace a (left ++ right) c := by
  induction first with
  | nil => exact second
  | cons step _ ih => exact .cons step (ih second)

structure Configuration (Label : Type) where
  label : Label
  data : Data Label
  context : Context

def Configuration.term (table : Label → Admissible) (c : Configuration Label) : Term :=
  c.context.plug ((table c.label).term ⊙ c.data.term table)

def Configuration.terms (table : Label → Admissible) (c : Configuration Label) : List Term :=
  ((table c.label).programTerms (c.data.term table) ++
    (c.data.descentTerms table (.s ⊙ c.data.term table)).map
      ((table c.label).programContext (c.data.term table)).plug).map c.context.plug

def Configuration.next (table : Label → Admissible) (c : Configuration Label) : Configuration Label where
  label := c.data.label
  data := c.data.feedback
  context := c.context.comp (((table c.label).programContext (c.data.term table)).comp
    (c.data.descentContext table (.s ⊙ c.data.term table)))

/-- The first assertion of Lemma F.4.1, with all literal intermediates. -/
theorem Configuration.native (table : Label → Admissible) (c : Configuration Label)
    (internal : c.data.internal = true) :
    Trace (c.term table) (c.terms table) ((c.next table).term table) := by
  have program := (table c.label).program_native (c.data.term table)
  have descent := (c.data.descent_native table (.s ⊙ c.data.term table) internal).inContext
    ((table c.label).programContext (c.data.term table))
  have combined := (trace_append program descent).inContext c.context
  simpa only [Configuration.term, Configuration.terms, Configuration.next,
    Data.feedback, Data.term, Context.plug_comp] using combined

theorem Configuration.positive (table : Label → Admissible) (c : Configuration Label) :
    2 ≤ (c.terms table).length := by
  have bound := (table c.label).program_positive (c.data.term table)
  simp only [Configuration.terms, List.length_map, List.length_append]
  omega

end PureSFormal.AppendixF.RecursiveCall
