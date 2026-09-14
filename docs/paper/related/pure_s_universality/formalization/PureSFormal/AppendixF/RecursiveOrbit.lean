import PureSFormal.AppendixF.RecursiveObservation

/-! The finite initial phase and two-macro finite orbit in Theorem F.4.3. -/
namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
set_option maxHeartbeats 1000000
set_option maxRecDepth 10000

def Data.size : Data Label → Nat
  | .leaf _ => 1
  | .node left right => 1 + left.size + right.size

theorem Data.size_positive (x : Data Label) : 0 < x.size := by
  cases x <;> simp [size] <;> omega

theorem Data.rightmost_smaller (x : Data Label) (internal : x.internal = true) :
    x.rightmost.size < x.size := by
  induction x with
  | leaf => cases internal
  | node left right ih _ =>
    cases left with
    | leaf j => simp only [rightmost, size]; omega
    | node l r =>
      have earlier := ih rfl
      change (Data.node l r).rightmost.size < 1 + (Data.node l r).size + right.size
      omega

theorem Data.rightmost_feedback_internal (x : Data Label)
    (internal : x.rightmost.internal = true) :
    x.feedback.rightmost = x.rightmost.rightmost := by
  unfold feedback
  cases h : x.rightmost with
  | leaf j => simp [h, Data.internal] at internal
  | node l r => rfl

theorem Data.rightmost_feedback_leaf (x : Data Label)
    (leaf : x.rightmost.internal = false) : x.feedback.rightmost = x := by
  unfold feedback
  cases h : x.rightmost with
  | leaf j => rfl
  | node l r => simp [h, Data.internal] at leaf

theorem Data.feedback_twice_rightmost (x : Data Label) (internal : x.internal = true)
    (leaf : x.rightmost.internal = false) : x.feedback.feedback.rightmost = x.rightmost := by
  have once := x.rightmost_feedback_leaf leaf
  change (Data.node x.feedback.rightmost x.feedback).rightmost = x.rightmost
  rw [once]
  cases x with
  | leaf j => cases internal
  | node l r => rfl

structure Prepared (x : Data Label) where
  steps : Nat
  stable : (FiniteOrbit.iterate Data.feedback steps x).rightmost.internal = false

def prepare (x : Data Label) : Prepared x :=
  if h : x.rightmost.internal = true then
    let result := prepare x.feedback
    ⟨1 + result.steps, by
      rw [FiniteOrbit.iterate_add]
      exact result.stable⟩
  else ⟨0, by change x.rightmost.internal = false; cases eq : x.rightmost.internal <;> simp_all⟩
termination_by x.rightmost.size
decreasing_by
  rw [x.rightmost_feedback_internal h]
  exact x.rightmost.rightmost_smaller h

theorem Configuration.iterate_data (table : Label → Admissible) (c : Configuration Label) (n : Nat) :
    (FiniteOrbit.iterate (Configuration.next table) n c).data =
      FiniteOrbit.iterate Data.feedback n c.data := by
  induction n with
  | zero => rfl
  | succ n ih => exact congrArg Data.feedback ih

theorem Configuration.iterate_internal (table : Label → Admissible) (c : Configuration Label)
    (internal : c.data.internal = true) (n : Nat) :
    (FiniteOrbit.iterate (Configuration.next table) n c).data.internal = true := by
  cases n with
  | zero => exact internal
  | succ => rfl

theorem Configuration.prepared_stable (table : Label → Admissible) (c : Configuration Label) :
    (FiniteOrbit.iterate (Configuration.next table) (prepare c.data).steps c).data.rightmost.internal = false := by
  rw [Configuration.iterate_data]
  exact (prepare c.data).stable

abbrev DataSummary.Tuple (Label State : Type) :=
  State × Bool × Label × State × (State → State → Bool) × (State → State → State)
def DataSummary.encode (d : DataSummary Label State) : DataSummary.Tuple Label State :=
  (d.value, d.internal, d.label, d.rightmost, d.observations, d.context)
def DataSummary.decode (t : DataSummary.Tuple Label State) : DataSummary Label State :=
  ⟨t.1, t.2.1, t.2.2.1, t.2.2.2.1, t.2.2.2.2.1, t.2.2.2.2.2⟩
theorem DataSummary.inverse (d : DataSummary Label State) : DataSummary.decode d.encode = d := by cases d; rfl

def DataSummary.enumeration [DecidableEq State] (a : Deterministic State) (labels : FiniteTables.Enumeration Label) :
    FiniteTables.Enumeration (DataSummary Label State) := by
  let q : FiniteTables.Enumeration State := ⟨a.cover, a.covers⟩
  let maps := FiniteTables.functions q q a.leaf
  let tables := FiniteTables.functions q maps (fun _ => a.leaf)
  let sets := FiniteTables.functions q FiniteTables.boolean false
  let observations := FiniteTables.functions q sets (fun _ => false)
  exact FiniteTables.transport (FiniteTables.product q (FiniteTables.product FiniteTables.boolean
    (FiniteTables.product labels (FiniteTables.product q (FiniteTables.product observations tables)))))
      DataSummary.encode DataSummary.decode DataSummary.inverse

def DataSummary.equality [DecidableEq State] [DecidableEq Label] (a : Deterministic State) :
    DecidableEq (DataSummary Label State) := by
  let q : FiniteTables.Enumeration State := ⟨a.cover, a.covers⟩
  letI : DecidableEq (State → State) := FiniteTables.functionEquality q
  letI : DecidableEq (State → State → State) := FiniteTables.functionEquality q
  letI : DecidableEq (State → Bool) := FiniteTables.functionEquality q
  letI : DecidableEq (State → State → Bool) := FiniteTables.functionEquality q
  exact FiniteTables.equality DataSummary.encode DataSummary.decode DataSummary.inverse

def Observation.encode (o : Observation Label State) := (o.label, o.data, o.context)
def Observation.decode (t : Label × DataSummary Label State × (State → State)) : Observation Label State :=
  ⟨t.1, t.2.1, t.2.2⟩
theorem Observation.inverse (o : Observation Label State) : Observation.decode o.encode = o := by cases o; rfl

def Observation.enumeration [DecidableEq State] (a : Deterministic State) (labels : FiniteTables.Enumeration Label) :
    FiniteTables.Enumeration (Observation Label State) := by
  let q : FiniteTables.Enumeration State := ⟨a.cover, a.covers⟩
  exact FiniteTables.transport (FiniteTables.product labels
    (FiniteTables.product (DataSummary.enumeration a labels) (FiniteTables.functions q q a.leaf)))
    Observation.encode Observation.decode Observation.inverse

def Observation.equality [DecidableEq State] [DecidableEq Label] (a : Deterministic State) :
    DecidableEq (Observation Label State) := by
  let q : FiniteTables.Enumeration State := ⟨a.cover, a.covers⟩
  letI : DecidableEq (State → State) := FiniteTables.functionEquality q
  letI : DecidableEq (DataSummary Label State) := DataSummary.equality a
  exact FiniteTables.equality Observation.encode Observation.decode Observation.inverse

def Configuration.blockNext (table : Label → Admissible) (c : Configuration Label) : Configuration Label :=
  (c.next table).next table

def Observation.blockNext [DecidableEq State] (a : Deterministic State) (table : Label → Admissible)
    (leaf : DataSummary Label State) (o : Observation Label State) : Observation Label State :=
  (o.next a table leaf).next a table o.data

def Observation.blockAccepts [DecidableEq State] (a : Deterministic State) (table : Label → Admissible)
    (leaf : DataSummary Label State) (o : Observation Label State) : Bool :=
  o.accepts a table || (o.next a table leaf).accepts a table

theorem observation_blockNext [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (c : Configuration Label) (leaf : c.data.rightmost.internal = false) :
    observation a table (c.blockNext table) =
      (observation a table c).blockNext a table (dataSummary a table c.data.rightmost) := by
  rw [Configuration.blockNext, observation_next, observation_next]
  have rightmost := c.data.rightmost_feedback_leaf leaf
  change ((observation a table c).next a table (dataSummary a table c.data.rightmost)).next a table
    (dataSummary a table c.data.feedback.rightmost) = _
  rw [rightmost]
  rfl

theorem Configuration.block_invariant (table : Label → Admissible) (c : Configuration Label)
    (internal : c.data.internal = true) (leaf : c.data.rightmost.internal = false) (k : Nat) :
    (FiniteOrbit.iterate (Configuration.blockNext table) k c).data.internal = true ∧
      (FiniteOrbit.iterate (Configuration.blockNext table) k c).data.rightmost = c.data.rightmost := by
  induction k with
  | zero => exact ⟨internal, rfl⟩
  | succ k ih =>
    refine ⟨rfl, ?_⟩
    change (FiniteOrbit.iterate (Configuration.blockNext table) k c).data.feedback.feedback.rightmost = _
    rw [Data.feedback_twice_rightmost _ ih.1 (by rw [ih.2]; exact leaf), ih.2]

theorem observation_block_iterate [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (c : Configuration Label)
    (internal : c.data.internal = true) (leaf : c.data.rightmost.internal = false) (k : Nat) :
    observation a table (FiniteOrbit.iterate (Configuration.blockNext table) k c) =
      FiniteOrbit.iterate (Observation.blockNext a table (dataSummary a table c.data.rightmost)) k
        (observation a table c) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    have inv := c.block_invariant table internal leaf k
    change observation a table ((FiniteOrbit.iterate (Configuration.blockNext table) k c).blockNext table) = _
    rw [observation_blockNext a table _ (by rw [inv.2]; exact leaf), inv.2, ih]
    rfl

def macroAccepts [DecidableEq State] (a : Deterministic State) (table : Label → Admissible)
    (c : Configuration Label) : Bool := (observation a table c).accepts a table

def stableDecision [DecidableEq State] (a : Deterministic State) (labels : FiniteTables.Enumeration Label)
    (table : Label → Admissible) (c : Configuration Label) : Bool :=
  FiniteOrbit.acceptsWithin
    (Observation.blockNext a table (dataSummary a table c.data.rightmost))
    (Observation.blockAccepts a table (dataSummary a table c.data.rightmost))
    (Observation.enumeration a labels).values.length (observation a table c)

theorem Configuration.block_iterate (table : Label → Admissible) (c : Configuration Label) (k : Nat) :
    FiniteOrbit.iterate (Configuration.blockNext table) k c =
      FiniteOrbit.iterate (Configuration.next table) (2 * k) c := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (FiniteOrbit.iterate (Configuration.blockNext table) k c).blockNext table = _
    rw [ih]
    have count : 2 * (k + 1) = (2 * k + 1) + 1 := by omega
    rw [count]
    rfl

theorem stableDecision_correct [DecidableEq State] [DecidableEq Label] (a : Deterministic State)
    (labels : FiniteTables.Enumeration Label) (table : Label → Admissible) (c : Configuration Label)
    (internal : c.data.internal = true) (leaf : c.data.rightmost.internal = false) :
    stableDecision a labels table c = true ↔
      ∃ n, macroAccepts a table (FiniteOrbit.iterate (Configuration.next table) n c) = true := by
  letI : DecidableEq (Observation Label State) := Observation.equality a
  rw [stableDecision, FiniteOrbit.acceptsWithin_iff _ _ _ (Observation.enumeration a labels).covers]
  have atBlock (k : Nat) :
      Observation.blockAccepts a table (dataSummary a table c.data.rightmost)
        (FiniteOrbit.iterate (Observation.blockNext a table (dataSummary a table c.data.rightmost)) k
          (observation a table c)) =
        (macroAccepts a table (FiniteOrbit.iterate (Configuration.next table) (2 * k) c) ||
         macroAccepts a table (FiniteOrbit.iterate (Configuration.next table) (2 * k + 1) c)) := by
    rw [← observation_block_iterate a table c internal leaf]
    have inv := c.block_invariant table internal leaf k
    unfold Observation.blockAccepts
    rw [← inv.2, ← observation_next]
    rw [Configuration.block_iterate]
    rfl
  constructor
  · rintro ⟨k, yes⟩
    rw [atBlock, Bool.or_eq_true] at yes
    cases yes with
    | inl yes => exact ⟨2 * k, yes⟩
    | inr yes => exact ⟨2 * k + 1, yes⟩
  · rintro ⟨n, yes⟩
    refine ⟨n / 2, ?_⟩
    rw [atBlock, Bool.or_eq_true]
    have division := Nat.div_add_mod n 2
    have remainder := Nat.mod_lt n (by decide : 0 < 2)
    by_cases even : n % 2 = 0
    · exact Or.inl (by simpa only [show 2 * (n / 2) = n by omega] using yes)
    · exact Or.inr (by simpa only [show 2 * (n / 2) + 1 = n by omega] using yes)

def prefixDecision [DecidableEq State] (a : Deterministic State) (table : Label → Admissible)
    (n : Nat) (c : Configuration Label) : Bool :=
  (List.range n).any (fun k => macroAccepts a table (FiniteOrbit.iterate (Configuration.next table) k c))

theorem prefixDecision_iff [DecidableEq State] (a : Deterministic State) (table : Label → Admissible)
    (n : Nat) (c : Configuration Label) :
    prefixDecision a table n c = true ↔
      ∃ k, k < n ∧ macroAccepts a table (FiniteOrbit.iterate (Configuration.next table) k c) = true := by
  simp only [prefixDecision, List.any_eq_true, List.mem_range]

def eventuallyAccepts [DecidableEq State] (a : Deterministic State) (labels : FiniteTables.Enumeration Label)
    (table : Label → Admissible) (c : Configuration Label) : Bool :=
  prefixDecision a table (prepare c.data).steps c ||
    stableDecision a labels table (FiniteOrbit.iterate (Configuration.next table) (prepare c.data).steps c)

theorem eventuallyAccepts_macro_iff [DecidableEq State] [DecidableEq Label] (a : Deterministic State)
    (labels : FiniteTables.Enumeration Label) (table : Label → Admissible) (c : Configuration Label)
    (internal : c.data.internal = true) :
    eventuallyAccepts a labels table c = true ↔
      ∃ n, macroAccepts a table (FiniteOrbit.iterate (Configuration.next table) n c) = true := by
  rw [eventuallyAccepts, Bool.or_eq_true, prefixDecision_iff,
    stableDecision_correct a labels table _
      (c.iterate_internal table internal _) (c.prepared_stable table)]
  constructor
  · intro yes
    cases yes with
    | inl yes => obtain ⟨n, _, yes⟩ := yes; exact ⟨n, yes⟩
    | inr yes =>
      obtain ⟨n, yes⟩ := yes
      exact ⟨(prepare c.data).steps + n, by simpa only [FiniteOrbit.iterate_add] using yes⟩
  · rintro ⟨n, yes⟩
    by_cases before : n < (prepare c.data).steps
    · exact Or.inl ⟨n, before, yes⟩
    · refine Or.inr ⟨n - (prepare c.data).steps, ?_⟩
      rw [← FiniteOrbit.iterate_add,
        show (prepare c.data).steps + (n - (prepare c.data).steps) = n by omega]
      exact yes

/-- Theorem F.4.3's effective all-macro observation decision. The native trace
and its positive length are established by `Configuration.native/positive`. -/
theorem eventuallyAccepts_correct [DecidableEq State] [DecidableEq Label] (a : Deterministic State)
    (labels : FiniteTables.Enumeration Label) (table : Label → Admissible) (c : Configuration Label)
    (internal : c.data.internal = true) :
    eventuallyAccepts a labels table c = true ↔
      ∃ n term, term ∈ (FiniteOrbit.iterate (Configuration.next table) n c).terms table ∧
        a.accepts term = true := by
  rw [eventuallyAccepts_macro_iff a labels table c internal]
  constructor
  · rintro ⟨n, yes⟩
    obtain ⟨term, member, accepted⟩ :=
      (observation_accepts a table _ (c.iterate_internal table internal n)).mp yes
    exact ⟨n, term, member, accepted⟩
  · rintro ⟨n, term, member, accepted⟩
    exact ⟨n, (observation_accepts a table _ (c.iterate_internal table internal n)).mpr
      ⟨term, member, accepted⟩⟩

end PureSFormal.AppendixF.RecursiveCall
