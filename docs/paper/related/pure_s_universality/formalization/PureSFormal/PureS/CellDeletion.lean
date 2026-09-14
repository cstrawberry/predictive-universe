import PureSFormal.PureS.CellSpine

/-!
# Canonical front-cell deletion

The logical front of a front-innermost cell spine is the first live cell seen
when the registered predecessor path is followed to `omega` and then read
back outward.  Tombstone histories are carried as arbitrary syntax and are
never inspected or compared.
-/

namespace PureSFormal.PureS

namespace CellDeletion

/-- Put a hole in the canonical predecessor field of a tombstone. -/
def tombstoneContext (bit : Bool) (audit : Term) (inner : Context) : Context :=
  .appLeft (.appRight .s inner) (.app (valueTag bit) audit)

/--
The canonical ancestors outside one selected cell.  The address records the
descent from the whole spine to the selected cell; `suffix` records exactly
the later live ancestors encountered while ascending.
-/
inductive OuterContext : Context → Address → List Bool → Prop where
  | hole : OuterContext .hole [] []
  | live {context : Context} {address : Address} {suffix : List Bool}
      (bit : Bool) (inner : OuterContext context address suffix) :
      OuterContext (.appRight (PureSFormal.PureS.live bit) context)
        (.right :: address) (suffix ++ [bit])
  | tombstone {context : Context} {address : Address} {suffix : List Bool}
      (bit : Bool) (audit : Term)
      (inner : OuterContext context address suffix) :
      OuterContext (tombstoneContext bit audit context)
        (.left :: .right :: address) suffix

namespace OuterContext

/-- The stored address selects the term placed in the stored context. -/
theorem subterm
    {context : Context} {address : Address} {suffix : List Bool}
    (outer : OuterContext context address suffix) (selected : Term) :
    (context.plug selected).subterm? address = some selected := by
  induction outer generalizing selected with
  | hole => simp
  | live bit inner ih =>
      simpa [Context.plug, Term.subterm?] using ih selected
  | tombstone bit audit inner ih =>
      simpa [tombstoneContext, Context.plug, Term.subterm?] using ih selected

/-- Replacing at the stored address is exactly context filling. -/
theorem replace
    {context : Context} {address : Address} {suffix : List Bool}
    (outer : OuterContext context address suffix)
    (selected replacement : Term) :
    (context.plug selected).replace? address replacement =
      some (context.plug replacement) := by
  induction outer generalizing selected replacement with
  | hole => simp
  | live bit inner ih =>
      simp [Context.plug, Term.replace?, ih]
  | tombstone bit audit inner ih =>
      simp [tombstoneContext, Context.plug, Term.replace?, ih]

/--
Filling the context around any decoded inner spine appends precisely the live
labels recorded by the outer context; tombstone audits contribute no bit.
-/
theorem plug_decodes
    {context : Context} {address : Address} {suffix : List Bool}
    (outer : OuterContext context address suffix)
    {innerTerm : Term} {innerBits : List Bool}
    (decoded : CellSpine.Decodes innerTerm innerBits) :
    CellSpine.Decodes (context.plug innerTerm) (innerBits ++ suffix) := by
  induction outer generalizing innerTerm innerBits with
  | hole => simpa using decoded
  | live bit inner ih =>
      have wrapped := CellSpine.Decodes.live bit (ih decoded)
      simpa [List.append_assoc] using wrapped
  | tombstone bit audit inner ih =>
      simpa [tombstoneContext, Context.plug] using!
        CellSpine.Decodes.tombstone bit audit (ih decoded)

end OuterContext

/-- The data returned by the executable canonical-front search. -/
structure Front where
  bit : Bool
  predecessor : Term
  address : Address
  context : Context

namespace Front

/-- A live cell with no inner live predecessor is itself the front. -/
def here (bit : Bool) (predecessor : Term) : Front :=
  ⟨bit, predecessor, [], .hole⟩

/-- Transport an already found front through one later live cell. -/
def underLive (front : Front) (outerBit : Bool) : Front :=
  { front with
    address := .right :: front.address
    context := .appRight (PureSFormal.PureS.live outerBit) front.context }

/-- Transport an already found front through one arbitrary-history tombstone. -/
def underTombstone (front : Front) (bit : Bool) (audit : Term) : Front :=
  { front with
    address := .left :: .right :: front.address
    context := tombstoneContext bit audit front.context }

/-- The diagonal C4 replacement at the selected live occurrence. -/
def endpoint (front : Front) : Term :=
  front.context.plug
    (Carrier.tombstone front.bit front.predecessor front.predecessor)

end Front

/--
Proof that a search result is the canonical logical front.  The predecessor
below it decodes empty, while its outer context records exactly the suffix.
-/
structure IsCanonicalFront (term : Term) (suffix : List Bool)
    (front : Front) : Prop where
  predecessorEmpty : CellSpine.Decodes front.predecessor []
  outer : OuterContext front.context front.address suffix
  source_eq :
    front.context.plug (.app (live front.bit) front.predecessor) = term

namespace IsCanonicalFront

/-- The selected occurrence is literally the registered live cell. -/
theorem selected_subterm
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    term.subterm? front.address =
      some (.app (live front.bit) front.predecessor) := by
  rw [← canonical.source_eq]
  exact canonical.outer.subterm _

/-- Every replacement at the selected occurrence fills the same context. -/
theorem replace
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) (replacement : Term) :
    term.replace? front.address replacement =
      some (front.context.plug replacement) := by
  rw [← canonical.source_eq]
  exact canonical.outer.replace _ replacement

/-- The diagonal tombstone is the literal address-level replacement. -/
theorem endpoint_replace
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    term.replace? front.address
        (Carrier.tombstone front.bit front.predecessor front.predecessor) =
      some front.endpoint := by
  simpa [Front.endpoint] using canonical.replace
    (Carrier.tombstone front.bit front.predecessor front.predecessor)

/-- The empty inner predecessor reaches `omega` through the queue grammar. -/
theorem predecessor_segment
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    Carrier.QueueSegment omega front.predecessor :=
  canonical.predecessorEmpty.queueSegment

/-- The selected source decodes as its front bit followed by the suffix. -/
theorem source_decodes
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    CellSpine.Decodes term (front.bit :: suffix) := by
  have selected :=
    CellSpine.Decodes.live front.bit canonical.predecessorEmpty
  have whole := canonical.outer.plug_decodes selected
  simpa [canonical.source_eq] using whole

/-- Deleting the selected front cell leaves exactly the decoded suffix. -/
theorem endpoint_decodes
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    CellSpine.Decodes front.endpoint suffix := by
  have diagonal := CellSpine.Decodes.tombstone front.bit front.predecessor
    canonical.predecessorEmpty
  simpa [Front.endpoint] using canonical.outer.plug_decodes diagonal

/-- The deletion endpoint remains a complete mutation-closed queue segment. -/
theorem endpoint_segment
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    Carrier.QueueSegment omega front.endpoint :=
  canonical.endpoint_decodes.queueSegment

/-- C4 contracts the selected live occurrence, in its context, exactly once. -/
theorem delete
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    StepsN 1 term front.endpoint := by
  have localSteps := C4_live_delete front.bit front.predecessor
  have lifted := localSteps.inContext front.context
  rw [canonical.source_eq] at lifted
  simpa [Front.endpoint, Carrier.tombstone] using lifted

end IsCanonicalFront

/-- Construct the base canonical-front certificate. -/
theorem canonical_here (bit : Bool) {predecessor : Term}
    (empty : CellSpine.Decodes predecessor []) :
    IsCanonicalFront (.app (live bit) predecessor) []
      (Front.here bit predecessor) :=
  ⟨empty, .hole, rfl⟩

/-- Extend a canonical-front certificate through one later live ancestor. -/
theorem IsCanonicalFront.underLive
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) (outerBit : Bool) :
    IsCanonicalFront (.app (live outerBit) term) (suffix ++ [outerBit])
      (front.underLive outerBit) := by
  refine ⟨canonical.predecessorEmpty, .live outerBit canonical.outer, ?_⟩
  simp [Front.underLive, canonical.source_eq]

/-- Extend a certificate through an arbitrary-history tombstone ancestor. -/
theorem IsCanonicalFront.underTombstone
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front)
    (bit : Bool) (audit : Term) :
    IsCanonicalFront (Carrier.tombstone bit term audit) suffix
      (front.underTombstone bit audit) := by
  refine ⟨canonical.predecessorEmpty,
    .tombstone bit audit canonical.outer, ?_⟩
  simp [Front.underTombstone, tombstoneContext, Carrier.tombstone,
    canonical.source_eq]

/--
Prepend the current live cell when no inner live cell was found; otherwise
transport the unique inner result through the current live ancestor.
-/
def receiveLive (bit : Bool) (tail : Term) : Option Front → Option Front
  | none => some (Front.here bit tail)
  | some front => some (front.underLive bit)

/-- Executable innermost-live search along only registered predecessor edges. -/
def findFront? : Term → Option Front
  | .s => none
  | .app (.app (.app .s .s) tag) tail =>
      if tag = valueTag false then
        receiveLive false tail (findFront? tail)
      else if tag = valueTag true then
        receiveLive true tail (findFront? tail)
      else
        none
  | .app (.app .s predecessor) (.app tag audit) =>
      if tag = valueTag false then
        (findFront? predecessor).map
          (fun front => front.underTombstone false audit)
      else if tag = valueTag true then
        (findFront? predecessor).map
          (fun front => front.underTombstone true audit)
      else
        none
  | _ => none
termination_by structural term => term

@[simp] theorem findFront?_omega : findFront? omega = none :=
  rfl

@[simp] theorem findFront?_live (bit : Bool) (tail : Term) :
    findFront? (.app (live bit) tail) = receiveLive bit tail (findFront? tail) := by
  cases bit <;> rfl

@[simp] theorem findFront?_tombstone
    (bit : Bool) (predecessor audit : Term) :
    findFront? (Carrier.tombstone bit predecessor audit) =
      (findFront? predecessor).map
        (fun front => front.underTombstone bit audit) := by
  cases bit <;> rfl

/-- The executable search is complete and produces its canonical certificate. -/
theorem findFront?_spec
    {term : Term} {bits : List Bool}
    (decoded : CellSpine.Decodes term bits) :
    match findFront? term with
    | none => bits = []
    | some front =>
        ∃ suffix, bits = front.bit :: suffix ∧
          IsCanonicalFront term suffix front := by
  induction decoded with
  | omega => rfl
  | @live tail bits outerBit inner ih =>
      rw [findFront?_live]
      cases hfind : findFront? tail with
      | none =>
          rw [hfind] at ih
          simp only [receiveLive]
          subst bits
          exact ⟨[], rfl, canonical_here outerBit inner⟩
      | some front =>
          rw [hfind] at ih
          simp only [receiveLive]
          obtain ⟨suffix, hbits, canonical⟩ := ih
          refine ⟨suffix ++ [outerBit], ?_, canonical.underLive outerBit⟩
          simp [hbits, Front.underLive]
  | @tombstone predecessor bits outerBit audit inner ih =>
      rw [findFront?_tombstone]
      cases hfind : findFront? predecessor with
      | none =>
          rw [hfind] at ih
          simp only [Option.map]
          exact ih
      | some front =>
          rw [hfind] at ih
          simp only [Option.map]
          obtain ⟨suffix, hbits, canonical⟩ := ih
          exact ⟨suffix, hbits,
            canonical.underTombstone outerBit audit⟩

/--
Canonical-front theorem.  The executable predecessor traversal yields exactly
one occurrence/context.  C4 replaces that live cell by its diagonal
tombstone in one contraction, and the endpoint decodes exactly the suffix.
-/
theorem canonicalFront
    {term : Term} {bit : Bool} {suffix : List Bool}
    (decoded : CellSpine.Decodes term (bit :: suffix)) :
    ∃ front : Front,
      (findFront? term = some front ∧
        front.bit = bit ∧
        IsCanonicalFront term suffix front ∧
        StepsN 1 term front.endpoint) ∧
      ∀ other : Front,
        (findFront? term = some other ∧
          other.bit = bit ∧
          IsCanonicalFront term suffix other ∧
          StepsN 1 term other.endpoint) →
        other = front := by
  have spec := findFront?_spec decoded
  cases hfind : findFront? term with
  | none =>
      rw [hfind] at spec
      cases spec
  | some front =>
      rw [hfind] at spec
      obtain ⟨foundSuffix, hword, canonical⟩ := spec
      injection hword with hbit hsuffix
      have canonical' : IsCanonicalFront term suffix front := by
        simpa [hsuffix] using canonical
      refine ⟨front, ⟨rfl, hbit.symm, canonical', canonical'.delete⟩, ?_⟩
      intro other otherSpec
      exact (Option.some.inj otherSpec.1).symm

/-! ## Later live ancestors -/

/-- A later live cell occurs among the registered ancestors of the front. -/
inductive HasLaterLive : Context → Prop where
  | here (bit : Bool) (inner : Context) :
      HasLaterLive (.appRight (live bit) inner)
  | tombstone (history : Term) {inner : Context} :
      HasLaterLive inner →
        HasLaterLive (.appLeft (.appRight .s inner) history)

@[simp] theorem hasLaterLive_hole : ¬ HasLaterLive .hole := by
  intro h
  cases h

theorem hasLaterLive_tombstone_iff
    (bit : Bool) (audit : Term) (inner : Context) :
    HasLaterLive (tombstoneContext bit audit inner) ↔ HasLaterLive inner := by
  constructor
  · intro h
    unfold tombstoneContext at h
    cases h with
    | tombstone _ hinner => exact hinner
  · exact HasLaterLive.tombstone (.app (valueTag bit) audit)

/-- A later live ancestor exists exactly when the decoded suffix is nonempty. -/
theorem OuterContext.hasLaterLive_iff
    {context : Context} {address : Address} {suffix : List Bool}
    (outer : OuterContext context address suffix) :
    HasLaterLive context ↔ suffix ≠ [] := by
  induction outer with
  | hole => simp
  | live bit inner ih =>
      constructor
      · intro _
        simp
      · intro _
        exact .here bit _
  | tombstone bit audit inner ih =>
      rw [hasLaterLive_tombstone_iff]
      exact ih

/-- Later-live characterization specialized to a canonical deletion witness. -/
theorem IsCanonicalFront.hasLaterLive_iff
    {term : Term} {suffix : List Bool} {front : Front}
    (canonical : IsCanonicalFront term suffix front) :
    HasLaterLive front.context ↔ suffix ≠ [] :=
  canonical.outer.hasLaterLive_iff

end CellDeletion

end PureSFormal.PureS
