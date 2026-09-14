import PureSFormal.PureS.Carrier

/-!
# Executable live/tombstone spine decoder

This is the registered cell layer of the canonical queue parser.  It accepts
only `Omega`, exact live constructors, and exact transparent tombstones.  A
tombstone's history is extracted as an opaque term and never compared with
its canonical predecessor.
-/

namespace PureSFormal.PureS

namespace CellSpine

/-- Declarative front-to-rear decoding of a complete cell spine. -/
inductive Decodes : Term → List Bool → Prop where
  | omega : Decodes PureSFormal.PureS.omega []
  | live {tail : Term} {bits : List Bool} (bit : Bool)
      (inner : Decodes tail bits) :
      Decodes (.app (PureSFormal.PureS.live bit) tail) (bits ++ [bit])
  | tombstone {predecessor : Term} {bits : List Bool}
      (bit : Bool) (audit : Term) (inner : Decodes predecessor bits) :
      Decodes (Carrier.tombstone bit predecessor audit) bits

namespace Decodes

/-- Every decoded cell spine belongs to the mutation-closed queue grammar. -/
theorem queueSegment {term : Term} {bits : List Bool}
    (h : Decodes term bits) :
    Carrier.QueueSegment PureSFormal.PureS.omega term := by
  induction h with
  | omega => exact .endpoint
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih => exact .tombstone bit audit ih

end Decodes

/--
Total executable decoding.  The output order is logical front-to-rear even
though the live constructors are stored with the front innermost.
-/
def decode? : Term → Option (List Bool)
  | .s => some []
  | .app (.app (.app .s .s) tag) tail =>
      if tag = valueTag false then
        (decode? tail).map (fun bits => bits ++ [false])
      else if tag = valueTag true then
        (decode? tail).map (fun bits => bits ++ [true])
      else
        none
  | .app (.app .s predecessor) (.app tag _audit) =>
      if tag = valueTag false then
        decode? predecessor
      else if tag = valueTag true then
        decode? predecessor
      else
        none
  | _ => none
termination_by structural term => term

@[simp] theorem valueTag_true_ne_false : valueTag true ≠ valueTag false := by
  decide

@[simp] theorem valueTag_false_ne_true : valueTag false ≠ valueTag true := by
  decide

@[simp]
theorem decode?_omega : decode? omega = some [] :=
  rfl

@[simp]
theorem decode?_live (bit : Bool) (tail : Term) :
    decode? (.app (live bit) tail) =
      (decode? tail).map (fun bits => bits ++ [bit]) := by
  cases bit <;> rfl

@[simp]
theorem decode?_tombstone (bit : Bool) (predecessor audit : Term) :
    decode? (Carrier.tombstone bit predecessor audit) = decode? predecessor := by
  cases bit <;>
    simp [decode?, Carrier.tombstone, valueTag, v0, v1]

/-- The executable decoder is sound for the independent-hole grammar. -/
theorem decode?_sound
    {term : Term} {bits : List Bool}
    (h : decode? term = some bits) : Decodes term bits := by
  fun_induction decode? term generalizing bits with
  | case1 =>
      cases h
      exact .omega
  | case2 tail ih =>
      generalize htail : decode? tail = decoded at h
      cases decoded with
      | none => simp [decode?, htail] at h
      | some tailBits =>
          simp [decode?, htail] at h
          subst bits
          exact .live false (ih htail)
  | case3 tail htag ih =>
      generalize htail : decode? tail = decoded at h
      cases decoded with
      | none => simp [decode?, htail] at h
      | some tailBits =>
          simp [decode?, htail] at h
          subst bits
          exact .live true (ih htail)
  | case4 tag tail hfalse htrue =>
      simp [decode?, hfalse, htrue] at h
  | case5 predecessor audit ih =>
      exact .tombstone false audit (ih h)
  | case6 predecessor audit htag ih =>
      exact .tombstone true audit (ih h)
  | case7 predecessor tag audit hfalse htrue =>
      simp [decode?, hfalse, htrue] at h
  | case8 term hs hlive htomb =>
      simp [decode?, hs, hlive, htomb] at h

/-- Every declaratively decoded cell spine is accepted with the same word. -/
theorem decode?_complete
    {term : Term} {bits : List Bool}
    (h : Decodes term bits) : decode? term = some bits := by
  induction h with
  | omega => rfl
  | live bit inner ih => simp [ih]
  | tombstone bit audit inner ih => simp [ih]

/-- Executable and declarative decoding coincide exactly. -/
theorem decode?_eq_some_iff (term : Term) (bits : List Bool) :
    decode? term = some bits ↔ Decodes term bits :=
  ⟨decode?_sound, decode?_complete⟩

/-- A bare cell spine has at most one front-to-rear decoding. -/
theorem Decodes.deterministic
    {term : Term} {first second : List Bool}
    (hfirst : Decodes term first) (hsecond : Decodes term second) :
    first = second := by
  have h : (some first : Option (List Bool)) = some second :=
    (decode?_complete hfirst).symm.trans (decode?_complete hsecond)
  exact Option.some.inj h

/-- Wrapping one exact live cell appends its bit to the decoded rear. -/
theorem decode?_appendLive
    {term : Term} {bits : List Bool} (bit : Bool)
    (h : decode? term = some bits) :
    decode? (.app (live bit) term) = some (bits ++ [bit]) := by
  simp [h]

/-- Folding live constructors appends their labels to the decoded word. -/
theorem decode?_foldlLive
    (suffix : List Bool) {start : Term} {decoded : List Bool}
    (h : decode? start = some decoded) :
    decode?
      (suffix.foldl (fun tail bit => .app (live bit) tail) start) =
      some (decoded ++ suffix) := by
  induction suffix generalizing start decoded with
  | nil => simpa using h
  | cons bit suffix ih =>
      have first :
          decode? (.app (live bit) start) = some (decoded ++ [bit]) :=
        decode?_appendLive bit h
      have rest := ih first
      simpa [List.append_assoc] using rest

/-- The literal front-innermost word encoding decodes to the original word. -/
theorem decode?_word (bits : List Bool) :
    decode? (word bits) = some bits := by
  simpa [word] using
    decode?_foldlLive bits (start := omega) (decoded := []) decode?_omega

/-- Literal words therefore have a declarative, uniquely decoded spine. -/
theorem decodes_word (bits : List Bool) : Decodes (word bits) bits :=
  decode?_sound (decode?_word bits)

end CellSpine

end PureSFormal.PureS
