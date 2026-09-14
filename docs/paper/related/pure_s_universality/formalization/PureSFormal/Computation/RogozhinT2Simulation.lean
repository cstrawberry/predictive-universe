import PureSFormal.Computation.RogozhinT2Semantics

set_option backward.isDefEq.respectTransparency false

/-!
# Structural sweep invariants for Rogozhin's T2 simulation

This file proves the first, unbounded sweep of the fixed four-state machine.
The proof is over a symbolic family of tape blocks, not over a bounded list of
fixtures.  A `gap` records the run of unary `1` symbols immediately to the
right of one program mark, with gaps listed from the data boundary towards the
left.  There is one data `1` for every program mark.

The state-`A` sweep repeatedly makes an excursion from the next data `1` to
the next unmarked program mark and back.  The local excursion and the complete
arbitrary-length sweep both carry exact executable step counts.
-/

namespace PureSFormal.Computation

namespace RogozhinT2Simulation

open Rogozhin46

/-! ## One left-and-right excursion -/

/-- The three kinds of cells which a first-sweep excursion may cross. -/
inductive CrossingLetter where
  /-- An as-yet-unvisited unary `1`. -/
  | plainOne
  /-- A unary `1` already changed to the printed blank `0`. -/
  | markedOne
  /-- A program mark already changed from `b` to right-marked `b`. -/
  | markedMark
  deriving DecidableEq, Repr

/-- Cell seen while an excursion is travelling left. -/
def CrossingLetter.before : CrossingLetter → Symbol
  | .plainOne => .s0
  | .markedOne => .s4
  | .markedMark => .s2

/-- Temporary cell left behind on the left-going half of an excursion. -/
def CrossingLetter.transient : CrossingLetter → Symbol
  | .plainOne => .s3
  | .markedOne => .s3
  | .markedMark => .s1

/-- Restored/marked cell after the right-going half of an excursion. -/
def CrossingLetter.after : CrossingLetter → Symbol
  | .plainOne => .s4
  | .markedOne => .s4
  | .markedMark => .s2

def beforeCode (letters : List CrossingLetter) : List Symbol :=
  letters.map CrossingLetter.before

def transientCode (letters : List CrossingLetter) : List Symbol :=
  letters.map CrossingLetter.transient

def afterCode (letters : List CrossingLetter) : List Symbol :=
  letters.map CrossingLetter.after

/-- A left-going position, including the unmarked boundary `b` at the end. -/
def leftPosition (remaining : List CrossingLetter)
    (farLeft writtenRight : List Symbol) : Config :=
  match remaining with
  | [] => ⟨.A, .s1, farLeft, writtenRight⟩
  | letter :: rest =>
      ⟨.A, letter.before,
        beforeCode rest ++ .s1 :: farLeft, writtenRight⟩

/-- A right-going position, ending at the temporary mark on the data cell. -/
def rightPosition (remaining : List CrossingLetter)
    (writtenLeft farRight : List Symbol) : Config :=
  match remaining with
  | [] => ⟨.A, .s3, writtenLeft, farRight⟩
  | letter :: rest =>
      ⟨.A, letter.transient, writtenLeft,
        transientCode rest ++ .s3 :: farRight⟩

@[simp]
theorem step_leftPosition_cons (letter : CrossingLetter)
    (rest : List CrossingLetter) (farLeft writtenRight : List Symbol) :
    absorbingStep (leftPosition (letter :: rest) farLeft writtenRight) =
      leftPosition rest farLeft (letter.transient :: writtenRight) := by
  cases letter <;> cases rest <;> rfl

@[simp]
theorem step_rightPosition_cons (letter : CrossingLetter)
    (rest : List CrossingLetter) (writtenLeft farRight : List Symbol) :
    absorbingStep (rightPosition (letter :: rest) writtenLeft farRight) =
      rightPosition rest (letter.after :: writtenLeft) farRight := by
  cases letter <;> cases rest <;> rfl

/-- Exact structural induction for the left-going half of an excursion. -/
theorem iterate_leftPosition (remaining : List CrossingLetter)
    (farLeft writtenRight : List Symbol) :
    iterate remaining.length
        (leftPosition remaining farLeft writtenRight) =
      leftPosition [] farLeft
        ((transientCode remaining).reverse ++ writtenRight) := by
  induction remaining generalizing writtenRight with
  | nil => rfl
  | cons letter rest ih =>
      rw [List.length_cons]
      change iterate (rest.length + 1)
        (leftPosition (letter :: rest) farLeft writtenRight) = _
      rw [iterate_add, iterate_succ, iterate_zero,
        step_leftPosition_cons, ih]
      simp [transientCode, List.reverse_cons, List.append_assoc]

/-- Exact structural induction for the right-going half of an excursion. -/
theorem iterate_rightPosition (remaining : List CrossingLetter)
    (writtenLeft farRight : List Symbol) :
    iterate remaining.length
        (rightPosition remaining writtenLeft farRight) =
      rightPosition []
        ((afterCode remaining).reverse ++ writtenLeft) farRight := by
  induction remaining generalizing writtenLeft with
  | nil => rfl
  | cons letter rest ih =>
      rw [List.length_cons]
      change iterate (rest.length + 1)
        (rightPosition (letter :: rest) writtenLeft farRight) = _
      rw [iterate_add, iterate_succ, iterate_zero,
        step_rightPosition_cons, ih]
      simp [afterCode, List.reverse_cons, List.append_assoc]

@[simp]
theorem step_into_leftPosition (letters : List CrossingLetter)
    (farLeft farRight : List Symbol) :
    absorbingStep
        ⟨State.A, Symbol.s0,
          beforeCode letters ++ .s1 :: farLeft, farRight⟩ =
      leftPosition letters farLeft (.s3 :: farRight) := by
  cases letters <;> rfl

@[simp]
theorem step_across_boundary (remaining : List CrossingLetter)
    (farLeft farRight : List Symbol) :
    absorbingStep
        (leftPosition [] farLeft
          (transientCode remaining ++ .s3 :: farRight)) =
      rightPosition remaining (.s2 :: farLeft) farRight := by
  cases remaining <;> rfl

@[simp]
theorem step_out_of_rightPosition (writtenLeft : List Symbol)
    (next : Symbol) (farRight : List Symbol) :
    absorbingStep
        (rightPosition [] writtenLeft (next :: farRight)) =
      ⟨.A, next, .s4 :: writtenLeft, farRight⟩ := by
  rfl

/-- Exact number of machine steps in one complete first-sweep excursion. -/
def excursionFuel (letters : List CrossingLetter) : Nat :=
  1 + (letters.length + (1 + (letters.length + 1)))

/--
One arbitrary-length excursion converts every crossed cell to its marked form,
marks the next program `b`, consumes one data `1`, and stops on the following
cell.  The two side lists outside the displayed family are completely opaque.
-/
theorem iterate_excursion (letters : List CrossingLetter)
    (farLeft : List Symbol) (next : Symbol) (farRight : List Symbol) :
    iterate (excursionFuel letters)
        ⟨.A, .s0, beforeCode letters ++ .s1 :: farLeft,
          next :: farRight⟩ =
      ⟨.A, next,
        .s4 :: afterCode letters ++ .s2 :: farLeft, farRight⟩ := by
  let start : Config :=
    ⟨.A, .s0, beforeCode letters ++ .s1 :: farLeft,
      next :: farRight⟩
  have hstart : iterate 1 start =
      leftPosition letters farLeft (.s3 :: next :: farRight) := by
    rw [iterate_succ, iterate_zero]
    exact step_into_leftPosition letters farLeft (next :: farRight)
  have hleft : iterate letters.length
      (leftPosition letters farLeft (.s3 :: next :: farRight)) =
      leftPosition [] farLeft
        ((transientCode letters).reverse ++ .s3 :: next :: farRight) :=
    iterate_leftPosition letters farLeft (.s3 :: next :: farRight)
  have hboundary : iterate 1
      (leftPosition [] farLeft
        ((transientCode letters).reverse ++ .s3 :: next :: farRight)) =
      rightPosition letters.reverse (.s2 :: farLeft)
        (next :: farRight) := by
    rw [iterate_succ, iterate_zero]
    simpa [transientCode, List.map_reverse] using
      step_across_boundary letters.reverse farLeft (next :: farRight)
  have hright : iterate letters.length
      (rightPosition letters.reverse (.s2 :: farLeft)
        (next :: farRight)) =
      rightPosition [] (afterCode letters ++ .s2 :: farLeft)
        (next :: farRight) := by
    simpa [afterCode, List.map_reverse] using
      iterate_rightPosition letters.reverse (.s2 :: farLeft)
        (next :: farRight)
  have hfinish : iterate 1
      (rightPosition [] (afterCode letters ++ .s2 :: farLeft)
        (next :: farRight)) =
      ⟨.A, next, .s4 :: afterCode letters ++ .s2 :: farLeft,
        farRight⟩ := by
    rw [iterate_succ, iterate_zero]
    exact step_out_of_rightPosition
      (afterCode letters ++ .s2 :: farLeft) next farRight
  change iterate (excursionFuel letters) start = _
  unfold excursionFuel
  rw [iterate_add, iterate_add, iterate_add, iterate_add,
    hstart, hleft, hboundary, hright, hfinish]

/-! ## The complete state-A first sweep -/

/-- Plain, not-yet-visited cells between the next two program marks. -/
def plainGap (length : Nat) : List CrossingLetter :=
  List.replicate length .plainOne

/-- The same gap after the first sweep has marked every unary cell. -/
def markedGap (length : Nat) : List CrossingLetter :=
  List.replicate length .markedOne

/-- A processed first-sweep cell; the type excludes an unmarked unary cell. -/
inductive MarkedLetter where
  | one
  | mark
  deriving DecidableEq, Repr

/-- Embed a processed cell into the crossing alphabet. -/
def MarkedLetter.crossing : MarkedLetter → CrossingLetter
  | .one => .markedOne
  | .mark => .markedMark

/-- Literal nearest-first code of a processed segment. -/
def processedCode (processed : List MarkedLetter) : List Symbol :=
  processed.map fun letter => letter.crossing.before

/-- A processed segment viewed as input to another excursion. -/
def processedCrossing (processed : List MarkedLetter) :
    List CrossingLetter :=
  processed.map MarkedLetter.crossing

/--
Unprocessed program suffix, nearest cell first.  Each natural records the run
of unary cells encountered before the next unmarked program `b`.
-/
def unprocessedNear : List Nat → List Symbol
  | [] => []
  | gap :: rest =>
      List.replicate gap .s0 ++ .s1 :: unprocessedNear rest

/-- The fully marked version of `unprocessedNear`. -/
def markedNear : List Nat → List Symbol
  | [] => []
  | gap :: rest =>
      List.replicate gap .s4 ++ .s2 :: markedNear rest

/-- Accumulator update performed by one excursion. -/
def advance (processed : List MarkedLetter) (gap : Nat) :
    List MarkedLetter :=
  .one :: (processed ++ List.replicate gap .one ++ [.mark])

/-- Boundary family for every intermediate excursion of the first sweep. -/
def FirstBoundary (processed : List MarkedLetter) (gaps : List Nat)
    (farLeft farRight : List Symbol) : Config :=
  match gaps with
  | [] =>
      ⟨.A, .s5, processedCode processed ++ farLeft, farRight⟩
  | gap :: rest =>
      ⟨.A, .s0,
        processedCode processed ++ unprocessedNear (gap :: rest) ++ farLeft,
        List.replicate rest.length .s0 ++ .s5 :: farRight⟩

/-- Exact remaining first-sweep time from a boundary-family member. -/
def firstSweepFuel : List MarkedLetter → List Nat → Nat
  | _, [] => 0
  | processed, gap :: rest =>
      firstSweepFuel (advance processed gap) rest +
        excursionFuel (processedCrossing processed ++ plainGap gap)

/-- Final marked accumulator after all gaps have been consumed. -/
def finish : List MarkedLetter → List Nat → List MarkedLetter
  | processed, [] => processed
  | processed, gap :: rest => finish (advance processed gap) rest

theorem beforeCode_plainGap (gap : Nat) :
    beforeCode (plainGap gap) = List.replicate gap .s0 := by
  simp [plainGap, beforeCode, CrossingLetter.before]

theorem beforeCode_markedGap (gap : Nat) :
    beforeCode (markedGap gap) = List.replicate gap .s4 := by
  simp [markedGap, beforeCode, CrossingLetter.before]

theorem beforeCode_processedCrossing (processed : List MarkedLetter) :
    beforeCode (processedCrossing processed) = processedCode processed := by
  induction processed with
  | nil => rfl
  | cons letter rest ih =>
      cases letter with
      | one =>
          change .s4 :: beforeCode (processedCrossing rest) =
            .s4 :: processedCode rest
          rw [ih]
      | mark =>
          change .s2 :: beforeCode (processedCrossing rest) =
            .s2 :: processedCode rest
          rw [ih]

@[simp]
theorem crossing_after_eq_before (letter : MarkedLetter) :
    letter.crossing.after = letter.crossing.before := by
  cases letter <;> rfl

theorem afterCode_processedCrossing (processed : List MarkedLetter) :
    afterCode (processedCrossing processed) = processedCode processed := by
  induction processed with
  | nil => rfl
  | cons letter rest ih =>
      cases letter with
      | one =>
          change .s4 :: afterCode (processedCrossing rest) =
            .s4 :: processedCode rest
          rw [ih]
      | mark =>
          change .s2 :: afterCode (processedCrossing rest) =
            .s2 :: processedCode rest
          rw [ih]

theorem afterCode_append_plainGap (processed : List MarkedLetter)
    (gap : Nat) :
    afterCode (processedCrossing processed ++ plainGap gap) =
      processedCode processed ++ List.replicate gap .s4 := by
  rw [afterCode, List.map_append]
  change afterCode (processedCrossing processed) ++
    afterCode (plainGap gap) = _
  rw [afterCode_processedCrossing]
  simp [plainGap, afterCode, CrossingLetter.after]

theorem beforeCode_append (left right : List CrossingLetter) :
    beforeCode (left ++ right) = beforeCode left ++ beforeCode right := by
  simp [beforeCode]

theorem processedCode_advance (processed : List MarkedLetter) (gap : Nat) :
    processedCode (advance processed gap) =
      .s4 :: processedCode processed ++
        List.replicate gap .s4 ++ [.s2] := by
  simp [advance, processedCode, MarkedLetter.crossing,
    CrossingLetter.before, List.append_assoc]

/-- One boundary-family member advances to the next one at the exact fuel. -/
theorem iterate_firstBoundary_step (processed : List MarkedLetter)
    (gap : Nat) (rest : List Nat)
    (farLeft farRight : List Symbol) :
    iterate (excursionFuel (processedCrossing processed ++ plainGap gap))
        (FirstBoundary processed (gap :: rest) farLeft farRight) =
      FirstBoundary (advance processed gap) rest farLeft farRight := by
  cases rest with
  | nil =>
      simpa [FirstBoundary, unprocessedNear, beforeCode_append,
        beforeCode_processedCrossing, beforeCode_plainGap,
        processedCode_advance, afterCode_append_plainGap,
        List.append_assoc] using
        iterate_excursion
          (processedCrossing processed ++ plainGap gap)
          farLeft .s5 farRight
  | cons nextGap tail =>
      simpa [FirstBoundary, unprocessedNear, beforeCode_append,
        beforeCode_processedCrossing, beforeCode_plainGap,
        processedCode_advance, afterCode_append_plainGap,
        List.append_assoc] using!
        iterate_excursion
          (processedCrossing processed ++ plainGap gap)
          (unprocessedNear (nextGap :: tail) ++ farLeft) .s0
          (List.replicate tail.length .s0 ++ .s5 :: farRight)

/--
Every member of the first-sweep boundary family reaches its terminal member.
This is the arbitrary-length structural induction for the complete A-state
sweep, with an executable (input-dependent) exact time.
-/
theorem iterate_firstSweepFuel (processed : List MarkedLetter)
    (gaps : List Nat) (farLeft farRight : List Symbol) :
    iterate (firstSweepFuel processed gaps)
        (FirstBoundary processed gaps farLeft farRight) =
      FirstBoundary (finish processed gaps) [] farLeft farRight := by
  induction gaps generalizing processed with
  | nil => rfl
  | cons gap rest ih =>
      unfold firstSweepFuel finish
      rw [iterate_add, iterate_firstBoundary_step, ih]

theorem replicate_s4_cross (length : Nat) (tail : List Symbol) :
    List.replicate length .s4 ++ .s4 :: tail =
      .s4 :: List.replicate length .s4 ++ tail := by
  induction length with
  | zero => rfl
  | succ length ih => simp [List.replicate_succ, ih]

/-- Closed form of the final accumulator, including the consumed data ones. -/
theorem processedCode_finish (processed : List MarkedLetter)
    (gaps : List Nat) :
    processedCode (finish processed gaps) =
      List.replicate gaps.length .s4 ++
        processedCode processed ++ markedNear gaps := by
  induction gaps generalizing processed with
  | nil => simp [finish, markedNear]
  | cons gap rest ih =>
      unfold finish
      rw [ih]
      rw [processedCode_advance]
      simp only [markedNear, List.length_cons, List.replicate_succ]
      simp only [List.cons_append, List.append_assoc]
      rw [replicate_s4_cross]
      simp [List.append_assoc]

/--
Headline first-sweep theorem.  For every nonempty gap list, the machine starts
on the first of exactly `gaps.length` data ones, marks the entire displayed
program suffix, consumes those data ones, and arrives in state `A` on `c`.
-/
theorem firstSweep_nonempty (gap : Nat) (rest : List Nat)
    (farLeft farRight : List Symbol) :
    iterate (firstSweepFuel [] (gap :: rest))
        ⟨.A, .s0,
          unprocessedNear (gap :: rest) ++ farLeft,
          List.replicate rest.length .s0 ++ .s5 :: farRight⟩ =
      ⟨.A, .s5,
        List.replicate (gap :: rest).length .s4 ++
          markedNear (gap :: rest) ++ farLeft,
        farRight⟩ := by
  have hsweep := iterate_firstSweepFuel [] (gap :: rest) farLeft farRight
  simp only [FirstBoundary] at hsweep
  rw [processedCode_finish] at hsweep
  simpa [FirstBoundary, processedCode] using hsweep

/-! ## Binding the boundary family to the literal Section-8 encoder -/

/-- Source alphabet of the program region during the first sweep. -/
inductive PlainLetter where
  | one
  | mark
  deriving DecidableEq, Repr

def PlainLetter.symbol : PlainLetter → Symbol
  | .one => .s0
  | .mark => .s1

def plainSymbols (letters : List PlainLetter) : List Symbol :=
  letters.map PlainLetter.symbol

theorem plainSymbols_append (left right : List PlainLetter) :
    plainSymbols (left ++ right) =
      plainSymbols left ++ plainSymbols right := by
  simp [plainSymbols]

theorem plainSymbols_reverse (letters : List PlainLetter) :
    plainSymbols letters.reverse = (plainSymbols letters).reverse := by
  simp [plainSymbols, List.map_reverse]

/-- Number of program marks in a plain symbolic word. -/
def markCount : List PlainLetter → Nat
  | [] => 0
  | .one :: rest => markCount rest
  | .mark :: rest => markCount rest + 1

/-- Parse nearest-first unary gaps, rejecting a final unterminated unary run. -/
def gapsOfNear : List PlainLetter → List Nat
  | [] => []
  | .mark :: rest => 0 :: gapsOfNear rest
  | .one :: rest =>
      match gapsOfNear rest with
      | [] => []
      | gap :: gaps => (gap + 1) :: gaps

/-- A nonempty nearest-first word whose farthest cell is a mark. -/
inductive NearWellFormed : List PlainLetter → Prop
  | singleton : NearWellFormed [.mark]
  | one {rest} : NearWellFormed rest →
      NearWellFormed (.one :: rest)
  | mark {rest} : NearWellFormed rest →
      NearWellFormed (.mark :: rest)

/-- Appending a final mark makes every finite plain prefix well formed. -/
theorem nearWellFormed_append_mark (stem : List PlainLetter) :
    NearWellFormed (stem ++ [.mark]) := by
  induction stem with
  | nil => exact .singleton
  | cons letter rest ih =>
      cases letter with
      | one => exact .one ih
      | mark => exact .mark ih

/-- Reversing a word that begins with a mark gives a valid nearest-first word. -/
theorem nearWellFormed_reverse_cons_mark (tail : List PlainLetter) :
    NearWellFormed ((.mark :: tail).reverse) := by
  simpa [List.reverse_cons] using nearWellFormed_append_mark tail.reverse

/-- The gap parser is nonempty and exactly reconstructs every valid word. -/
theorem gapsOfNear_correct {letters : List PlainLetter}
    (hvalid : NearWellFormed letters) :
    gapsOfNear letters ≠ [] ∧
      unprocessedNear (gapsOfNear letters) = plainSymbols letters := by
  induction hvalid
  case singleton =>
      constructor <;> decide
  case one rest hvalid ih =>
      obtain ⟨hnonempty, hcode⟩ := ih
      cases hgap : gapsOfNear rest with
      | nil => exact False.elim (hnonempty hgap)
      | cons gap gaps =>
          have hcode' : unprocessedNear (gap :: gaps) =
              plainSymbols rest := by
            simpa [hgap] using hcode
          constructor
          · simp [gapsOfNear, hgap]
          · simp only [gapsOfNear, hgap, unprocessedNear, plainSymbols,
              PlainLetter.symbol, List.map_cons, List.replicate_succ]
            simpa [unprocessedNear] using! hcode'
  case mark rest hvalid ih =>
      obtain ⟨_, hcode⟩ := ih
      constructor
      · simp [gapsOfNear]
      · simp [gapsOfNear, unprocessedNear, plainSymbols,
          PlainLetter.symbol, hcode]

/-- A parsed gap is present for exactly every mark in a valid word. -/
theorem length_gapsOfNear {letters : List PlainLetter}
    (hvalid : NearWellFormed letters) :
    (gapsOfNear letters).length = markCount letters := by
  induction hvalid
  case singleton => rfl
  case one rest hvalid ih =>
      have hnonempty := (gapsOfNear_correct hvalid).1
      cases hgap : gapsOfNear rest with
      | nil => exact False.elim (hnonempty hgap)
      | cons gap gaps =>
          have ih' : gaps.length + 1 = markCount rest := by
            simpa [hgap] using ih
          simp [gapsOfNear, hgap, markCount, ih']
  case mark rest hvalid ih =>
      simp [gapsOfNear, markCount, ih]

/-- Plain symbolic form of a unary run. -/
def plainOnes (length : Nat) : List PlainLetter :=
  List.replicate length .one

/-- Plain symbolic form of `exponentCode`. -/
def exponentPlain : List Nat → List PlainLetter
  | [] => []
  | exponent :: rest =>
      .mark :: (plainOnes exponent ++
        rest.flatMap fun next => [.mark, .mark] ++ plainOnes next)

/-- Plain symbolic form of one printed production block. -/
def productionPlain (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label) : List PlainLetter :=
  [.mark, .one] ++
    exponentPlain (RogozhinTagInput.productionExponents program label)

/-- Low program suffix `P_label ... P_1 P_0`, in left-to-right order. -/
def lowerProgramPlain (program : RogozhinTagInput.Program) : Nat →
    List PlainLetter
  | 0 => [.mark]
  | label + 1 =>
      productionPlain program label ++ lowerProgramPlain program label

/-- Literal-symbol version of `lowerProgramPlain`. -/
def lowerProgramCode (program : RogozhinTagInput.Program) : Nat →
    List Symbol
  | 0 => RogozhinTagInput.separatorCode
  | label + 1 =>
      RogozhinTagInput.productionCode program label ++
        lowerProgramCode program label

theorem plainSymbols_plainOnes (length : Nat) :
    plainSymbols (plainOnes length) = RogozhinTagInput.ones length := by
  simp [plainSymbols, plainOnes, PlainLetter.symbol,
    RogozhinTagInput.ones]

theorem plainSymbols_exponentTail (rest : List Nat) :
    plainSymbols
        (rest.flatMap fun next => [.mark, .mark] ++ plainOnes next) =
      rest.flatMap fun next =>
        [.s1, .s1] ++ RogozhinTagInput.ones next := by
  induction rest with
  | nil => rfl
  | cons next rest ih =>
      change plainSymbols
          (([.mark, .mark] ++ plainOnes next) ++
            rest.flatMap fun following =>
              [.mark, .mark] ++ plainOnes following) =
        ([.s1, .s1] ++ RogozhinTagInput.ones next) ++
          rest.flatMap fun following =>
            [.s1, .s1] ++ RogozhinTagInput.ones following
      rw [plainSymbols_append, plainSymbols_append,
        plainSymbols_plainOnes, ih]
      rfl

theorem plainSymbols_exponentPlain (exponents : List Nat) :
    plainSymbols (exponentPlain exponents) =
      RogozhinTagInput.exponentCode exponents := by
  cases exponents with
  | nil => rfl
  | cons exponent rest =>
      change .s1 ::
          plainSymbols
            (plainOnes exponent ++
              rest.flatMap fun next =>
                [.mark, .mark] ++ plainOnes next) =
        .s1 ::
          (RogozhinTagInput.ones exponent ++
            rest.flatMap fun next =>
              [.s1, .s1] ++ RogozhinTagInput.ones next)
      rw [plainSymbols_append, plainSymbols_plainOnes,
        plainSymbols_exponentTail]

theorem plainSymbols_productionPlain
    (program : RogozhinTagInput.Program) (label : Nat) :
    plainSymbols (productionPlain program label) =
      RogozhinTagInput.productionCode program label := by
  change [.s1, .s0] ++
      plainSymbols
        (exponentPlain
          (RogozhinTagInput.productionExponents program label)) =
    [.s1, .s0] ++
      RogozhinTagInput.exponentCode
        (RogozhinTagInput.productionExponents program label)
  rw [plainSymbols_exponentPlain]

theorem plainSymbols_lowerProgramPlain
    (program : RogozhinTagInput.Program) (label : Nat) :
    plainSymbols (lowerProgramPlain program label) =
      lowerProgramCode program label := by
  induction label with
  | zero => rfl
  | succ label ih =>
      rw [lowerProgramPlain, lowerProgramCode, plainSymbols_append,
        plainSymbols_productionPlain, ih]

/-- Every low program suffix begins with the printed mark `b`. -/
theorem lowerProgramPlain_cons_mark
    (program : RogozhinTagInput.Program) (label : Nat) :
    ∃ tail, lowerProgramPlain program label = .mark :: tail := by
  cases label with
  | zero => exact ⟨[], rfl⟩
  | succ label =>
      refine ⟨.one ::
        (exponentPlain
          (RogozhinTagInput.productionExponents program label) ++
          lowerProgramPlain program label), ?_⟩
      rfl

/-- Parsed low-program gaps used by the concrete first-sweep clock. -/
def programGaps (program : RogozhinTagInput.Program) (label : Nat) :
    List Nat :=
  gapsOfNear (lowerProgramPlain program label).reverse

theorem programGaps_nonempty
    (program : RogozhinTagInput.Program) (label : Nat) :
    programGaps program label ≠ [] := by
  obtain ⟨tail, hlower⟩ := lowerProgramPlain_cons_mark program label
  unfold programGaps
  rw [hlower]
  exact (gapsOfNear_correct
    (nearWellFormed_reverse_cons_mark tail)).1

/-- The parsed gaps reconstruct the exact literal low program suffix. -/
theorem unprocessedNear_programGaps
    (program : RogozhinTagInput.Program) (label : Nat) :
    unprocessedNear (programGaps program label) =
      (lowerProgramCode program label).reverse := by
  obtain ⟨tail, hlower⟩ := lowerProgramPlain_cons_mark program label
  unfold programGaps
  rw [hlower]
  rw [(gapsOfNear_correct
    (nearWellFormed_reverse_cons_mark tail)).2]
  rw [← hlower]
  rw [plainSymbols_reverse, plainSymbols_lowerProgramPlain]

theorem markCount_append (left right : List PlainLetter) :
    markCount (left ++ right) = markCount left + markCount right := by
  induction left with
  | nil => simp [markCount]
  | cons letter rest ih =>
      cases letter <;>
        simp [markCount, ih, Nat.add_assoc, Nat.add_comm,
          Nat.add_left_comm]

theorem markCount_reverse (letters : List PlainLetter) :
    markCount letters.reverse = markCount letters := by
  induction letters with
  | nil => rfl
  | cons letter rest ih =>
      rw [List.reverse_cons, markCount_append, ih]
      cases letter <;> simp [markCount, Nat.add_comm]

theorem markCount_plainOnes (length : Nat) :
    markCount (plainOnes length) = 0 := by
  induction length with
  | zero => rfl
  | succ length ih =>
      change markCount (.one :: plainOnes length) = 0
      simp [markCount, ih]

theorem markCount_exponentTail (rest : List Nat) :
    markCount
        (rest.flatMap fun next => [.mark, .mark] ++ plainOnes next) =
      2 * rest.length := by
  induction rest with
  | nil => rfl
  | cons exponent rest ih =>
      rw [List.flatMap_cons, markCount_append, ih]
      simp [markCount_append, markCount_plainOnes, markCount,
        Nat.mul_succ, Nat.add_assoc, Nat.add_comm]

theorem markCount_exponentPlain_cons (exponent : Nat) (rest : List Nat) :
    markCount (exponentPlain (exponent :: rest)) =
      2 * rest.length + 1 := by
  simp only [exponentPlain, markCount]
  rw [markCount_append, markCount_plainOnes, markCount_exponentTail]
  simp

theorem markCount_productionPlain_of_cons
    (program : RogozhinTagInput.Program) (label exponent : Nat)
    (rest : List Nat)
    (hexponents : RogozhinTagInput.productionExponents program label =
      exponent :: rest) :
    markCount (productionPlain program label) =
      2 * (RogozhinTagInput.productionExponents program label).length := by
  unfold productionPlain
  rw [markCount_append]
  simp only [markCount]
  rw [hexponents, markCount_exponentPlain_cons]
  simp only [List.length_cons, Nat.mul_succ]
  rw [Nat.zero_add, ← Nat.add_assoc,
    Nat.add_comm 1 (2 * rest.length)]

theorem productionExponents_nonempty
    (program : RogozhinTagInput.Program) (label : Nat) :
    RogozhinTagInput.productionExponents program label ≠ [] := by
  simp [RogozhinTagInput.productionExponents]

theorem markCount_productionPlain
    (program : RogozhinTagInput.Program) (label : Nat) :
    markCount (productionPlain program label) =
      2 * (RogozhinTagInput.productionExponents program label).length := by
  cases h : RogozhinTagInput.productionExponents program label with
  | nil => exact False.elim (productionExponents_nonempty program label h)
  | cons exponent rest =>
      simpa [h] using markCount_productionPlain_of_cons
        program label exponent rest h

theorem length_productionExponents_of_two_le
    (program : RogozhinTagInput.Program) (label : Nat)
    (hlength : 2 ≤ (RogozhinTagInput.productionAt program label).length) :
    (RogozhinTagInput.productionExponents program label).length =
      (RogozhinTagInput.productionAt program label).length := by
  simp [RogozhinTagInput.productionExponents, List.length_drop,
    Nat.sub_add_cancel hlength]

theorem production_length_two_le_of_isT2
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label : Nat) (hlabel : label < RogozhinTagInput.symbolCount program) :
    2 ≤ (RogozhinTagInput.productionAt program label).length := by
  obtain ⟨hpositive, hdistinguished, hother⟩ := hT2
  have hle : label ≤ RogozhinTagInput.distinguished program := by
    exact Nat.le_sub_one_of_lt hlabel
  rcases Nat.eq_or_lt_of_le hle with heq | hlt
  · rw [heq, hdistinguished]
    simp
  · obtain ⟨suffix, _, hproduction, _⟩ := hother label hlt
    rw [hproduction]
    simp

theorem markCount_productionPlain_of_isT2
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label : Nat) (hlabel : label < RogozhinTagInput.symbolCount program) :
    markCount (productionPlain program label) =
      2 * (RogozhinTagInput.productionAt program label).length := by
  rw [markCount_productionPlain]
  rw [length_productionExponents_of_two_le program label
    (production_length_two_le_of_isT2 program hT2 label hlabel)]

/-- The number of parsed low-program marks is the printed unary weight. -/
theorem markCount_lowerProgramPlain_eq_weight
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label : Nat) (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    markCount (lowerProgramPlain program label) =
      RogozhinTagInput.weight program label := by
  induction label with
  | zero => rfl
  | succ label ih =>
      have hlt : label < RogozhinTagInput.symbolCount program :=
        Nat.lt_of_succ_le hlabel
      have hle : label ≤ RogozhinTagInput.symbolCount program :=
        Nat.le_trans (Nat.le_succ label) hlabel
      rw [lowerProgramPlain, markCount_append,
        markCount_productionPlain_of_isT2 program hT2 label hlt,
        ih hle, RogozhinTagInput.weight]
      exact Nat.add_comm _ _

/-- Concrete parsed gap count is definitionally the encoder weight. -/
theorem length_programGaps_eq_weight
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label : Nat) (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    (programGaps program label).length =
      RogozhinTagInput.weight program label := by
  obtain ⟨tail, hlower⟩ := lowerProgramPlain_cons_mark program label
  unfold programGaps
  rw [hlower]
  rw [length_gapsOfNear (nearWellFormed_reverse_cons_mark tail)]
  rw [markCount_reverse, ← hlower]
  exact markCount_lowerProgramPlain_eq_weight program hT2 label hlabel

/-- Range-based form of the recursively accumulated low program suffix. -/
theorem lowerProgramCode_eq_range
    (program : RogozhinTagInput.Program) (label : Nat) :
    lowerProgramCode program label =
      (List.range label).reverse.flatMap
          (RogozhinTagInput.productionCode program) ++
        RogozhinTagInput.separatorCode := by
  induction label with
  | zero => rfl
  | succ label ih =>
      simp [lowerProgramCode, List.range_succ, ih]

/-- Program region strictly to the left of `lowerProgramCode label`. -/
def upperProgramCode (program : RogozhinTagInput.Program) (label : Nat) :
    List Symbol :=
  RogozhinTagInput.haltingCode ++
    ((List.range (RogozhinTagInput.symbolCount program - label)).map
      (fun offset => label + offset)).reverse.flatMap
        (RogozhinTagInput.productionCode program)

/-- Exact split of the printed finite program at a source-symbol label. -/
theorem programCode_eq_upper_append_lower
    (program : RogozhinTagInput.Program) (label : Nat)
    (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    RogozhinTagInput.programCode program =
      upperProgramCode program label ++ lowerProgramCode program label := by
  have hsum : label + (RogozhinTagInput.symbolCount program - label) =
      RogozhinTagInput.symbolCount program := Nat.add_sub_of_le hlabel
  have hrange :
      List.range (RogozhinTagInput.symbolCount program) =
        List.range label ++
          (List.range (RogozhinTagInput.symbolCount program - label)).map
            (fun offset => label + offset) := by
    calc
      List.range (RogozhinTagInput.symbolCount program) =
          List.range
            (label + (RogozhinTagInput.symbolCount program - label)) :=
        congrArg List.range hsum.symm
      _ = List.range label ++
          (List.range (RogozhinTagInput.symbolCount program - label)).map
            (fun offset => label + offset) := by
        rw [List.range_add]
  unfold RogozhinTagInput.programCode upperProgramCode
  rw [hrange, List.reverse_append, List.flatMap_append]
  rw [lowerProgramCode_eq_range]
  simp [List.append_assoc]

/-- Nearest-first side-list split used by the concrete first-sweep theorem. -/
theorem programCode_reverse_split
    (program : RogozhinTagInput.Program) (label : Nat)
    (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    (RogozhinTagInput.programCode program).reverse =
      unprocessedNear (programGaps program label) ++
        (upperProgramCode program label).reverse := by
  rw [programCode_eq_upper_append_lower program label hlabel,
    List.reverse_append, unprocessedNear_programGaps]

/-- Literal data region strictly to the right of the first separator `c`. -/
def followingData (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label) :
    List Symbol :=
  RogozhinTagInput.ones (RogozhinTagInput.weight program second) ++
    RogozhinTagInput.dataTail program rest

/-- Exact executable first-sweep time for one encoded source symbol. -/
def concreteFirstSweepTime (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label) : Nat :=
  firstSweepFuel [] (programGaps program label)

/--
The literal compiler output is exactly the initial member of the structural
first-boundary family.  No representation premise is supplied by a caller.
-/
theorem compile_eq_firstBoundary
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    RogozhinTagInput.compile ⟨program, label :: second :: rest⟩ =
      FirstBoundary [] (programGaps program label)
        (upperProgramCode program label).reverse
        (followingData program second rest) := by
  have hcount := length_programGaps_eq_weight
    program hT2 label hlabel
  have hnonempty := programGaps_nonempty program label
  cases hgap : programGaps program label with
  | nil => exact False.elim (hnonempty hgap)
  | cons gap gaps =>
      have hweight : RogozhinTagInput.weight program label =
          gaps.length + 1 := by
        rw [← hcount, hgap]
        rfl
      simpa [RogozhinTagInput.compile, RogozhinTagInput.dataCode,
        RogozhinTagInput.dataTail, followingData, RogozhinTagInput.ones,
        hweight, programCode_reverse_split program label hlabel,
        FirstBoundary, processedCode, hgap, List.replicate_succ,
        List.append_assoc]

/--
Concrete first-sweep theorem for every encoded nonhalting deletion-two input.
The fixed machine reaches state `A` scanning the first `c`; the low program
suffix and exactly `weight label` data cells have their printed marked forms.
-/
theorem iterate_compile_firstSweep
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    iterate (concreteFirstSweepTime program label)
        (RogozhinTagInput.compile
          ⟨program, label :: second :: rest⟩) =
      ⟨.A, .s5,
        List.replicate (RogozhinTagInput.weight program label) .s4 ++
          markedNear (programGaps program label) ++
          (upperProgramCode program label).reverse,
        followingData program second rest⟩ := by
  rw [compile_eq_firstBoundary program hT2 label second rest hlabel]
  unfold concreteFirstSweepTime
  rw [iterate_firstSweepFuel]
  simp only [FirstBoundary]
  rw [processedCode_finish]
  rw [length_programGaps_eq_weight program hT2 label hlabel]
  simp [processedCode, List.append_assoc]

/-! ## Beginning the D/B/C second sweep: append the right marker -/

/-- Data cells crossed by the initial state-`D` right sweep. -/
inductive DScanLetter where
  | one
  | programMark
  | separator
  deriving DecidableEq, Repr

def DScanLetter.before : DScanLetter → Symbol
  | .one => .s0
  | .programMark => .s2
  | .separator => .s5

def DScanLetter.after : DScanLetter → Symbol
  | .one => .s4
  | .programMark => .s3
  | .separator => .s1

def dBeforeCode (letters : List DScanLetter) : List Symbol :=
  letters.map DScanLetter.before

def dAfterCode (letters : List DScanLetter) : List Symbol :=
  letters.map DScanLetter.after

/-- State-`D` right-going boundary family, terminated by the implicit blank. -/
def DRightBoundary (remaining : List DScanLetter)
    (writtenLeft : List Symbol) : Config :=
  match remaining with
  | [] => ⟨.D, .s4, writtenLeft, []⟩
  | letter :: rest =>
      ⟨.D, letter.before, writtenLeft, dBeforeCode rest⟩

@[simp]
theorem step_DRightBoundary_cons (letter : DScanLetter)
    (rest : List DScanLetter) (writtenLeft : List Symbol) :
    absorbingStep (DRightBoundary (letter :: rest) writtenLeft) =
      DRightBoundary rest (letter.after :: writtenLeft) := by
  cases letter <;> cases rest <;> rfl

/-- Arbitrary-length state-`D` scan to the blank at exact time. -/
theorem iterate_DRightBoundary (remaining : List DScanLetter)
    (writtenLeft : List Symbol) :
    iterate remaining.length (DRightBoundary remaining writtenLeft) =
      DRightBoundary []
        ((dAfterCode remaining).reverse ++ writtenLeft) := by
  induction remaining generalizing writtenLeft with
  | nil => rfl
  | cons letter rest ih =>
      rw [List.length_cons]
      change iterate (rest.length + 1)
        (DRightBoundary (letter :: rest) writtenLeft) = _
      rw [iterate_add, iterate_succ, iterate_zero,
        step_DRightBoundary_cons, ih]
      simp [dAfterCode, List.reverse_cons, List.append_assoc]

@[simp]
theorem step_D_blank_after_nonempty_scan (front : List DScanLetter)
    (last : DScanLetter) (writtenLeft : List Symbol) :
    absorbingStep
        (DRightBoundary []
          ((dAfterCode (front ++ [last])).reverse ++ writtenLeft)) =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ writtenLeft, [.s5]⟩ := by
  simp [DRightBoundary, dAfterCode, List.map_reverse,
    List.reverse_append, List.append_assoc]
  cases last <;> rfl

/-- Exact scan time including the blank-cell turn from `D` to `B`. -/
def dRightScanFuel (letters : List DScanLetter) : Nat :=
  1 + letters.length

/--
The complete initial state-`D` scan converts arbitrary data cells, appends `c`
at the first blank to their right, and turns left in state `B`.
-/
theorem iterate_DRightScan (front : List DScanLetter)
    (last : DScanLetter) (writtenLeft : List Symbol) :
    iterate (dRightScanFuel (front ++ [last]))
        (DRightBoundary (front ++ [last]) writtenLeft) =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ writtenLeft, [.s5]⟩ := by
  unfold dRightScanFuel
  rw [iterate_add, iterate_DRightBoundary,
    iterate_succ, iterate_zero, step_D_blank_after_nonempty_scan]

@[simp]
theorem step_A_c_into_DRightScan (front : List DScanLetter)
    (last : DScanLetter) (left : List Symbol) :
    absorbingStep
        ⟨State.A, Symbol.s5, left,
          dBeforeCode (front ++ [last])⟩ =
      DRightBoundary (front ++ [last]) (.s4 :: left) := by
  cases front with
  | nil => cases last <;> rfl
  | cons first rest => cases first <;> rfl

/-- Exact time for deleting the old `c` and appending a new rightmost `c`. -/
def beginSecondSweepFuel (letters : List DScanLetter) : Nat :=
  dRightScanFuel letters + 1

/--
First unbounded boundary theorem of the second sweep: from state `A` on the
old separator to state `B` on the final converted data cell.
-/
theorem iterate_beginSecondSweep (front : List DScanLetter)
    (last : DScanLetter) (left : List Symbol) :
    iterate (beginSecondSweepFuel (front ++ [last]))
        ⟨.A, .s5, left, dBeforeCode (front ++ [last])⟩ =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ .s4 :: left, [.s5]⟩ := by
  unfold beginSecondSweepFuel
  rw [iterate_add, iterate_succ, iterate_zero,
    step_A_c_into_DRightScan, iterate_DRightScan]

/-- Symbolic form of every data block to the right of the first `c`. -/
def dataScanLetters (program : RogozhinTagInput.Program) :
    List RogozhinTagInput.Label → List DScanLetter
  | [] => []
  | label :: rest =>
      List.replicate (RogozhinTagInput.weight program label) .one ++
        match rest with
        | [] => []
        | next :: tail => .separator :: dataScanLetters program (next :: tail)

theorem dBeforeCode_dataScanLetters
    (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label) :
    dBeforeCode (dataScanLetters program word) =
      RogozhinTagInput.dataCode program word := by
  induction word with
  | nil => rfl
  | cons label rest ih =>
      cases rest with
      | nil =>
          simp [dataScanLetters, dBeforeCode, RogozhinTagInput.dataCode,
            RogozhinTagInput.dataTail, RogozhinTagInput.ones,
            DScanLetter.before]
      | cons next tail =>
          simp [dataScanLetters, dBeforeCode, RogozhinTagInput.dataCode,
            RogozhinTagInput.dataTail, RogozhinTagInput.ones, ih,
            DScanLetter.before, List.map_replicate, List.append_assoc]
          change dBeforeCode (dataScanLetters program (next :: tail)) =
            RogozhinTagInput.dataCode program (next :: tail)
          exact ih

/-- Every nonempty encoded data word ends in a unary `1` cell. -/
theorem dataScanLetters_eq_append_one
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    ∃ front, dataScanLetters program (label :: rest) =
      front ++ [.one] := by
  induction rest generalizing label with
  | nil =>
      obtain ⟨predecessor, hweight⟩ :=
        RogozhinTagInput.weight_is_succ program label
      refine ⟨List.replicate predecessor .one, ?_⟩
      simp [dataScanLetters, hweight, List.replicate_succ']
  | cons next tail ih =>
      obtain ⟨front, hfront⟩ := ih next
      refine ⟨List.replicate
          (RogozhinTagInput.weight program label) .one ++
        .separator :: front, ?_⟩
      simp [dataScanLetters, hfront, List.append_assoc]

theorem followingData_eq_dBeforeCode
    (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    followingData program second rest =
      dBeforeCode (dataScanLetters program (second :: rest)) := by
  rw [dBeforeCode_dataScanLetters]
  rfl

/-- Exact executable duration of the initial D-scan on literal encoded data. -/
def concreteBeginSecondSweepTime
    (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  beginSecondSweepFuel (dataScanLetters program (second :: rest))

/-- Literal encoded-data instance of `iterate_beginSecondSweep`. -/
theorem iterate_beginSecondSweep_encoded
    (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (left : List Symbol) :
    ∃ front,
      dataScanLetters program (second :: rest) = front ++ [.one] ∧
      iterate (concreteBeginSecondSweepTime program second rest)
          ⟨.A, .s5, left, followingData program second rest⟩ =
        ⟨.B, .s4,
          (dAfterCode front).reverse ++ .s4 :: left, [.s5]⟩ := by
  obtain ⟨front, hfront⟩ :=
    dataScanLetters_eq_append_one program second rest
  refine ⟨front, hfront, ?_⟩
  unfold concreteBeginSecondSweepTime
  rw [followingData_eq_dBeforeCode, hfront]
  exact iterate_beginSecondSweep front .one left

/-! ## State-B left sweep across the converted data region -/

/--
One structural unit of the state-`B` left sweep.  A separator is coupled with
the guaranteed unary cell immediately to its left; this is exactly the
six-transition `B/C/A/D/B` macro printed in Rogozhin's second stage.
-/
inductive BChunk where
  | one
  | markedMark
  | separatorOne
  deriving DecidableEq, Repr

def BChunk.inputNear : BChunk → List Symbol
  | .one => [.s4]
  | .markedMark => [.s3]
  | .separatorOne => [.s1, .s4]

def BChunk.outputNear : BChunk → List Symbol
  | .one => [.s0]
  | .markedMark => [.s2]
  | .separatorOne => [.s0, .s5]

def BChunk.fuel : BChunk → Nat
  | .one => 1
  | .markedMark => 1
  | .separatorOne => 6

def bInputNear (chunks : List BChunk) : List Symbol :=
  chunks.flatMap BChunk.inputNear

/-- Boundary family before each local state-`B` leftward macro. -/
def BLeftBoundary (chunks : List BChunk) (next : Symbol)
    (farLeft writtenRight : List Symbol) : Config :=
  match chunks with
  | [] => ⟨.B, next, farLeft, writtenRight⟩
  | .one :: rest =>
      ⟨.B, .s4, bInputNear rest ++ next :: farLeft, writtenRight⟩
  | .markedMark :: rest =>
      ⟨.B, .s3, bInputNear rest ++ next :: farLeft, writtenRight⟩
  | .separatorOne :: rest =>
      ⟨.B, .s1,
        .s4 :: bInputNear rest ++ next :: farLeft, writtenRight⟩

@[simp]
theorem iterate_BChunk_one (rest : List BChunk) (next : Symbol)
    (farLeft writtenRight : List Symbol) :
    iterate BChunk.one.fuel
        (BLeftBoundary (.one :: rest) next farLeft writtenRight) =
      BLeftBoundary rest next farLeft (.s0 :: writtenRight) := by
  cases rest with
  | nil => rfl
  | cons chunk tail => cases chunk <;> rfl

@[simp]
theorem iterate_BChunk_markedMark (rest : List BChunk) (next : Symbol)
    (farLeft writtenRight : List Symbol) :
    iterate BChunk.markedMark.fuel
        (BLeftBoundary (.markedMark :: rest)
          next farLeft writtenRight) =
      BLeftBoundary rest next farLeft (.s2 :: writtenRight) := by
  cases rest with
  | nil => rfl
  | cons chunk tail => cases chunk <;> rfl

/-- Exact six-step `B/C/A/D/B` separator macro with opaque outer tape. -/
@[simp]
theorem iterate_BChunk_separatorOne (rest : List BChunk) (next : Symbol)
    (farLeft writtenRight : List Symbol) :
    iterate BChunk.separatorOne.fuel
        (BLeftBoundary (.separatorOne :: rest)
          next farLeft writtenRight) =
      BLeftBoundary rest next farLeft (.s0 :: .s5 :: writtenRight) := by
  cases rest with
  | nil => rfl
  | cons chunk tail => cases chunk <;> rfl

/-- Exact remaining duration of an arbitrary converted-data B-scan. -/
def bLeftFuel : List BChunk → Nat
  | [] => 0
  | chunk :: rest => bLeftFuel rest + chunk.fuel

/-- Literal right-side accumulator after all B chunks have run. -/
def bFinishRight : List BChunk → List Symbol → List Symbol
  | [], writtenRight => writtenRight
  | chunk :: rest, writtenRight =>
      bFinishRight rest (chunk.outputNear ++ writtenRight)

/--
Arbitrary-length state-`B` sweep through converted data, including every
six-step separator crossing, with exact executable fuel.
-/
theorem iterate_BLeftBoundary (chunks : List BChunk) (next : Symbol)
    (farLeft writtenRight : List Symbol) :
    iterate (bLeftFuel chunks)
        (BLeftBoundary chunks next farLeft writtenRight) =
      BLeftBoundary [] next farLeft
        (bFinishRight chunks writtenRight) := by
  induction chunks generalizing writtenRight with
  | nil => rfl
  | cons chunk rest ih =>
      cases chunk with
      | one =>
          unfold bLeftFuel bFinishRight
          rw [iterate_add, iterate_BChunk_one, ih]
          rfl
      | markedMark =>
          unfold bLeftFuel bFinishRight
          rw [iterate_add, iterate_BChunk_markedMark, ih]
          rfl
      | separatorOne =>
          unfold bLeftFuel bFinishRight
          rw [iterate_add, iterate_BChunk_separatorOne, ih]
          rfl

/-- B-chunks traversing an encoded data word from right to left. -/
def reverseDataChunks (program : RogozhinTagInput.Program) :
    List RogozhinTagInput.Label → List BChunk
  | [] => []
  | [label] =>
      List.replicate (RogozhinTagInput.weight program label) .one
  | label :: next :: rest =>
      reverseDataChunks program (next :: rest) ++
        .separatorOne ::
          List.replicate (RogozhinTagInput.weight program label - 1) .one

/-- Add the deleted separator and first data block to the B-scan. -/
def encodedBChunks (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List BChunk :=
  reverseDataChunks program word ++ List.replicate extraOnes .one

theorem bInputNear_append (left right : List BChunk) :
    bInputNear (left ++ right) = bInputNear left ++ bInputNear right := by
  simp [bInputNear, List.flatMap_append]

theorem bInputNear_replicate_one (length : Nat) :
    bInputNear (List.replicate length .one) =
      List.replicate length .s4 := by
  induction length with
  | zero => rfl
  | succ length ih =>
      simp [bInputNear, BChunk.inputNear, List.replicate_succ, ih]
      change bInputNear (List.replicate length .one) =
        List.replicate length .s4
      exact ih

theorem cons_replicate_eq_replicate_append (symbol : Symbol)
    (length : Nat) :
    symbol :: List.replicate length symbol =
      List.replicate length symbol ++ [symbol] := by
  rw [← List.replicate_succ, List.replicate_succ']

theorem replicate_same_cross (symbol : Symbol) (length : Nat)
    (tail : List Symbol) :
    List.replicate length symbol ++ symbol :: tail =
      symbol :: List.replicate length symbol ++ tail := by
  induction length with
  | zero => rfl
  | succ length ih => simp [List.replicate_succ, ih]

/-- Literal converted-data tape equals the structurally generated B input. -/
theorem bInputNear_reverseDataChunks
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    bInputNear (reverseDataChunks program (label :: rest)) =
      (dAfterCode (dataScanLetters program (label :: rest))).reverse := by
  induction rest generalizing label with
  | nil =>
      simp [reverseDataChunks, dataScanLetters, bInputNear_replicate_one,
        dAfterCode, DScanLetter.after]
  | cons next tail ih =>
      obtain ⟨predecessor, hweight⟩ :=
        RogozhinTagInput.weight_is_succ program label
      rw [reverseDataChunks, bInputNear_append, ih next]
      simp [dataScanLetters, dAfterCode, DScanLetter.after,
        BChunk.inputNear, bInputNear, bInputNear_replicate_one,
        hweight, List.replicate_succ, List.reverse_append,
        List.map_reverse, List.append_assoc,
        cons_replicate_eq_replicate_append]
      change .s4 :: bInputNear (List.replicate predecessor .one) =
        List.replicate predecessor .s4 ++ [.s4]
      rw [bInputNear_replicate_one,
        cons_replicate_eq_replicate_append]

theorem bInputNear_encodedBChunks
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    bInputNear (encodedBChunks program (label :: rest) extraOnes) =
      (dAfterCode (dataScanLetters program (label :: rest))).reverse ++
        List.replicate extraOnes .s4 := by
  simp [encodedBChunks, bInputNear_append,
    bInputNear_reverseDataChunks, bInputNear_replicate_one]

theorem bFinishRight_append (left right : List BChunk)
    (writtenRight : List Symbol) :
    bFinishRight (left ++ right) writtenRight =
      bFinishRight right (bFinishRight left writtenRight) := by
  induction left generalizing writtenRight with
  | nil => rfl
  | cons chunk rest ih =>
      simp [bFinishRight, ih]

theorem bFinishRight_replicate_one (length : Nat)
    (writtenRight : List Symbol) :
    bFinishRight (List.replicate length .one) writtenRight =
      List.replicate length .s0 ++ writtenRight := by
  induction length generalizing writtenRight with
  | zero => rfl
  | succ length ih =>
      simp [List.replicate_succ, bFinishRight, BChunk.outputNear, ih,
        replicate_same_cross, List.append_assoc]

/-- The B sweep restores the literal source data code in forward order. -/
theorem bFinishRight_reverseDataChunks
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (writtenRight : List Symbol) :
    bFinishRight (reverseDataChunks program (label :: rest)) writtenRight =
      dBeforeCode (dataScanLetters program (label :: rest)) ++ writtenRight := by
  induction rest generalizing label writtenRight with
  | nil =>
      simp [reverseDataChunks, dataScanLetters,
        bFinishRight_replicate_one, dBeforeCode,
        DScanLetter.before, List.append_assoc]
  | cons next tail ih =>
      obtain ⟨predecessor, hweight⟩ :=
        RogozhinTagInput.weight_is_succ program label
      rw [reverseDataChunks, bFinishRight_append, ih next]
      simp [bFinishRight, bFinishRight_replicate_one,
        BChunk.outputNear, dataScanLetters, dBeforeCode,
        DScanLetter.before, hweight, List.replicate_succ,
        replicate_same_cross, List.append_assoc]

theorem bFinishRight_encodedBChunks
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (writtenRight : List Symbol) :
    bFinishRight
        (encodedBChunks program (label :: rest) extraOnes) writtenRight =
      List.replicate extraOnes .s0 ++
        dBeforeCode (dataScanLetters program (label :: rest)) ++
        writtenRight := by
  rw [encodedBChunks, bFinishRight_append,
    bFinishRight_reverseDataChunks, bFinishRight_replicate_one]
  simp [List.append_assoc]

/-- Exact B-sweep theorem specialized to arbitrary encoded data blocks. -/
theorem iterate_BEncodedData
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (next : Symbol) (farLeft writtenRight : List Symbol) :
    iterate
        (bLeftFuel
          (encodedBChunks program (label :: rest) extraOnes))
        (BLeftBoundary
          (encodedBChunks program (label :: rest) extraOnes)
          next farLeft writtenRight) =
      ⟨.B, next, farLeft,
        List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (label :: rest) ++
          writtenRight⟩ := by
  rw [iterate_BLeftBoundary]
  simp only [BLeftBoundary]
  rw [bFinishRight_encodedBChunks,
    dBeforeCode_dataScanLetters]

/-- The nearest low-program gap is zero because `P_0` is the single mark `b`. -/
theorem programGaps_eq_zero_cons
    (program : RogozhinTagInput.Program) (label : Nat) :
    ∃ rest, programGaps program label = 0 :: rest := by
  have lowerProgramPlain_eq_append_mark :
      ∀ horizon : Nat, ∃ front,
        lowerProgramPlain program horizon = front ++ [.mark] := by
    intro horizon
    induction horizon with
    | zero => exact ⟨[], rfl⟩
    | succ horizon ih =>
        obtain ⟨front, hfront⟩ := ih
        exact ⟨productionPlain program horizon ++ front, by
          simp [lowerProgramPlain, hfront, List.append_assoc]⟩
  unfold programGaps
  obtain ⟨front, hfront⟩ := lowerProgramPlain_eq_append_mark label
  rw [hfront, List.reverse_append]
  exact ⟨gapsOfNear front.reverse, rfl⟩

/-- Recover a literal B-boundary configuration from its nonempty input code. -/
theorem BLeftBoundary_eq_of_bInputNear
    (chunks : List BChunk) (current : Symbol) (nearLeft : List Symbol)
    (next : Symbol) (farLeft writtenRight : List Symbol)
    (hinput : bInputNear chunks = current :: nearLeft) :
    BLeftBoundary chunks next farLeft writtenRight =
      ⟨.B, current, nearLeft ++ next :: farLeft, writtenRight⟩ := by
  cases chunks with
  | nil => cases hinput
  | cons chunk rest =>
      cases chunk <;> cases hinput <;> rfl

/-- Program-gap tail after removing the nearest `P₀` mark. -/
def programGapTail (program : RogozhinTagInput.Program) (label : Nat) :
    List Nat :=
  (programGaps program label).tail

/-- B chunks from the restored suffix data through the first source block. -/
def secondSweepBChunks (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : List BChunk :=
  encodedBChunks program (second :: rest)
    (RogozhinTagInput.weight program first + 1)

/-- Exact time from state `A` on the old `c` to state `B` at `P₀`. -/
def secondSweepToProgramFuel (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  bLeftFuel (secondSweepBChunks program first second rest) +
    concreteBeginSecondSweepTime program second rest

/--
The D scan and the complete B/C/A/D/B data scan, composed.  Starting at the
separator exposed by the first sweep, the machine reaches the nearest marked
program cell (`P₀`) in state `B`, with the data restored and the new rightmost
`c` installed.  Both nested scans are unbounded structural inductions.
-/
theorem iterate_secondSweep_toProgram
    (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    iterate (secondSweepToProgramFuel program first second rest)
        ⟨.A, .s5,
          List.replicate (RogozhinTagInput.weight program first) .s4 ++
            markedNear (programGaps program first) ++
            (upperProgramCode program first).reverse,
          followingData program second rest⟩ =
      ⟨.B, .s2,
        markedNear (programGapTail program first) ++
          (upperProgramCode program first).reverse,
        List.replicate
            (RogozhinTagInput.weight program first + 1) .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ := by
  obtain ⟨dataFront, hdata, hbegin⟩ :=
    iterate_beginSecondSweep_encoded program second rest
      (List.replicate (RogozhinTagInput.weight program first) .s4 ++
        markedNear (programGaps program first) ++
        (upperProgramCode program first).reverse)
  obtain ⟨gapRest, hgap⟩ := programGaps_eq_zero_cons program first
  let chunks := secondSweepBChunks program first second rest
  have hinput : bInputNear chunks =
      .s4 ::
        ((dAfterCode dataFront).reverse ++
          .s4 ::
            List.replicate
              (RogozhinTagInput.weight program first) .s4) := by
    unfold chunks secondSweepBChunks
    rw [bInputNear_encodedBChunks, hdata]
    simp [dAfterCode, DScanLetter.after, List.map_reverse,
      List.reverse_append, List.replicate_succ, List.append_assoc]
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks .s4
    ((dAfterCode dataFront).reverse ++
      .s4 :: List.replicate
        (RogozhinTagInput.weight program first) .s4)
    .s2
    (markedNear gapRest ++ (upperProgramCode program first).reverse)
    [.s5] hinput
  have hconfig :
      ⟨State.B, Symbol.s4,
        (dAfterCode dataFront).reverse ++ .s4 ::
          (List.replicate
              (RogozhinTagInput.weight program first) .s4 ++
            markedNear (programGaps program first) ++
            (upperProgramCode program first).reverse),
        [.s5]⟩ =
      BLeftBoundary chunks .s2
        (markedNear gapRest ++ (upperProgramCode program first).reverse)
        [.s5] := by
    rw [hboundary]
    simp [hgap, markedNear, List.append_assoc]
  unfold secondSweepToProgramFuel
  rw [iterate_add, hbegin, hconfig]
  change iterate
      (bLeftFuel
        (encodedBChunks program (second :: rest)
          (RogozhinTagInput.weight program first + 1)))
      (BLeftBoundary
        (encodedBChunks program (second :: rest)
          (RogozhinTagInput.weight program first + 1)) .s2
        (markedNear gapRest ++ (upperProgramCode program first).reverse)
        [.s5]) = _
  rw [iterate_BEncodedData]
  simp [chunks, secondSweepBChunks, hgap, programGapTail,
    List.append_assoc]

/-! ## One marked-program excursion -/

/-- State-`B` right scan used after activating one marked program cell. -/
def BRightBoundary (remaining : List DScanLetter)
    (writtenLeft : List Symbol) : Config :=
  match remaining with
  | [] => ⟨.B, .s4, writtenLeft, []⟩
  | letter :: rest =>
      ⟨.B, letter.before, writtenLeft, dBeforeCode rest⟩

@[simp]
theorem step_BRightBoundary_cons (letter : DScanLetter)
    (rest : List DScanLetter) (writtenLeft : List Symbol) :
    absorbingStep (BRightBoundary (letter :: rest) writtenLeft) =
      BRightBoundary rest (letter.after :: writtenLeft) := by
  cases letter <;> cases rest <;> rfl

theorem iterate_BRightBoundary (remaining : List DScanLetter)
    (writtenLeft : List Symbol) :
    iterate remaining.length (BRightBoundary remaining writtenLeft) =
      BRightBoundary []
        ((dAfterCode remaining).reverse ++ writtenLeft) := by
  induction remaining generalizing writtenLeft with
  | nil => rfl
  | cons letter rest ih =>
      rw [List.length_cons]
      change iterate (rest.length + 1)
        (BRightBoundary (letter :: rest) writtenLeft) = _
      rw [iterate_add, iterate_succ, iterate_zero,
        step_BRightBoundary_cons, ih]
      simp [dAfterCode, List.reverse_cons, List.append_assoc]

@[simp]
theorem step_B_blank_after_right_scan (front : List DScanLetter)
    (last : DScanLetter) (writtenLeft : List Symbol) :
    absorbingStep
        (BRightBoundary []
          ((dAfterCode (front ++ [last])).reverse ++ writtenLeft)) =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ writtenLeft, [.s0]⟩ := by
  simp [BRightBoundary, dAfterCode, List.map_reverse,
    List.reverse_append, List.append_assoc]
  cases last <;> rfl

def bRightScanFuel (letters : List DScanLetter) : Nat :=
  1 + letters.length

theorem iterate_BRightScan (front : List DScanLetter)
    (last : DScanLetter) (writtenLeft : List Symbol) :
    iterate (bRightScanFuel (front ++ [last]))
        (BRightBoundary (front ++ [last]) writtenLeft) =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ writtenLeft, [.s0]⟩ := by
  unfold bRightScanFuel
  rw [iterate_add, iterate_BRightBoundary,
    iterate_succ, iterate_zero, step_B_blank_after_right_scan]

@[simp]
theorem step_B_mark_into_right_scan (front : List DScanLetter)
    (last : DScanLetter) (left : List Symbol) :
    absorbingStep
        ⟨State.B, Symbol.s2, left,
          dBeforeCode (front ++ [last])⟩ =
      BRightBoundary (front ++ [last]) (.s3 :: left) := by
  cases front with
  | nil => cases last <;> rfl
  | cons first rest => cases first <;> rfl

/-- Right-scan time including activation of the marked program cell. -/
def activateMarkFuel (letters : List DScanLetter) : Nat :=
  bRightScanFuel letters + 1

theorem iterate_activateMark (front : List DScanLetter)
    (last : DScanLetter) (left : List Symbol) :
    iterate (activateMarkFuel (front ++ [last]))
        ⟨.B, .s2, left, dBeforeCode (front ++ [last])⟩ =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ .s3 :: left, [.s0]⟩ := by
  unfold activateMarkFuel
  rw [iterate_add, iterate_succ, iterate_zero,
    step_B_mark_into_right_scan, iterate_BRightScan]

/-- Literal right word scanned by one marked-program excursion. -/
def markRightFront (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List DScanLetter :=
  List.replicate extraOnes .one ++
    dataScanLetters program (second :: rest)

def markRightLetters (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List DScanLetter :=
  markRightFront program second rest extraOnes ++ [.separator]

/-- Replace the first unary B chunk by a trailing-separator chunk. -/
def capFirstOne : List BChunk → List BChunk
  | .one :: rest => .separatorOne :: rest
  | chunks => chunks

def markExcursionChunks (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List BChunk :=
  capFirstOne
    (encodedBChunks program (second :: rest) extraOnes)

theorem reverseDataChunks_eq_one_cons
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    ∃ tail, reverseDataChunks program (label :: rest) = .one :: tail := by
  induction rest generalizing label with
  | nil =>
      obtain ⟨predecessor, hweight⟩ :=
        RogozhinTagInput.weight_is_succ program label
      exact ⟨List.replicate predecessor .one, by
        simp [reverseDataChunks, hweight, List.replicate_succ]⟩
  | cons next tail ih =>
      obtain ⟨suffix, hsuffix⟩ := ih next
      refine ⟨suffix ++
        .separatorOne ::
          List.replicate
            (RogozhinTagInput.weight program label - 1) .one, ?_⟩
      simp [reverseDataChunks, hsuffix, List.append_assoc]

theorem encodedBChunks_eq_one_cons
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    ∃ tail, encodedBChunks program (label :: rest) extraOnes =
      .one :: tail := by
  obtain ⟨tail, htail⟩ := reverseDataChunks_eq_one_cons program label rest
  exact ⟨tail ++ List.replicate extraOnes .one, by
    simp [encodedBChunks, htail, List.append_assoc]⟩

/-- Converted marked-excursion word is exactly the capped B-chunk input. -/
theorem bInputNear_markExcursionChunks
    (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    bInputNear
        (markExcursionChunks program second rest extraOnes) =
      .s1 ::
        (dAfterCode
          (markRightFront program second rest extraOnes)).reverse := by
  obtain ⟨tail, htail⟩ :=
    encodedBChunks_eq_one_cons program second rest extraOnes
  have hbase := bInputNear_encodedBChunks
    program second rest extraOnes
  rw [htail] at hbase
  unfold markExcursionChunks capFirstOne
  rw [htail]
  simpa [markRightFront, bInputNear, BChunk.inputNear, dAfterCode,
    DScanLetter.after, List.map_reverse, List.reverse_append,
    List.append_assoc] using
      congrArg (fun symbols => Symbol.s1 :: symbols) hbase

/-- Capped B chunks restore the old rightmost `c` before the appended `1`. -/
theorem bFinishRight_markExcursionChunks
    (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    bFinishRight
        (markExcursionChunks program second rest extraOnes) [.s0] =
      List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++
        [.s5, .s0] := by
  obtain ⟨tail, htail⟩ :=
    encodedBChunks_eq_one_cons program second rest extraOnes
  have hbase := bFinishRight_encodedBChunks
    program second rest extraOnes [.s5, .s0]
  rw [htail] at hbase
  rw [dBeforeCode_dataScanLetters] at hbase
  unfold markExcursionChunks capFirstOne
  rw [htail]
  simpa [bFinishRight, BChunk.outputNear,
    List.append_assoc] using hbase

theorem dBeforeCode_markRightLetters
    (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    dBeforeCode (markRightLetters program second rest extraOnes) =
      List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] := by
  unfold markRightLetters markRightFront dBeforeCode
  rw [List.map_append, List.map_append, List.map_replicate]
  change (List.replicate extraOnes .s0 ++
      dBeforeCode (dataScanLetters program (second :: rest))) ++ [.s5] = _
  rw [dBeforeCode_dataScanLetters, List.append_assoc]

@[simp]
theorem step_B_return_mark (next : Symbol) (farLeft right : List Symbol) :
    absorbingStep ⟨State.B, Symbol.s3, next :: farLeft, right⟩ =
      ⟨.B, next, farLeft, .s2 :: right⟩ := by
  rfl

/-- Exact duration of one complete marked-program excursion. -/
def markExcursionFuel (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) : Nat :=
  1 +
    (bLeftFuel (markExcursionChunks program second rest extraOnes) +
      activateMarkFuel
        (markRightLetters program second rest extraOnes))

/--
One marked program cell causes a full right-and-left data excursion, appends
one unary `1` beyond the rightmost `c`, restores the data, restores the marked
program cell, and advances the head one cell left in state `B`.
-/
theorem iterate_markExcursion
    (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate (markExcursionFuel program second rest extraOnes)
        ⟨.B, .s2, next :: farLeft,
          List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ =
      ⟨.B, next, farLeft,
        .s2 ::
          (List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++
            [.s5, .s0])⟩ := by
  let front := markRightFront program second rest extraOnes
  let chunks := markExcursionChunks program second rest extraOnes
  have hactivate := iterate_activateMark front .separator
    (next :: farLeft)
  have hright := dBeforeCode_markRightLetters
    program second rest extraOnes
  have hletters : markRightLetters program second rest extraOnes =
      front ++ [.separator] := rfl
  rw [← hletters, hright] at hactivate
  simp only [DScanLetter.after] at hactivate
  have hinput := bInputNear_markExcursionChunks
    program second rest extraOnes
  change bInputNear chunks =
    .s1 :: (dAfterCode front).reverse at hinput
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks .s1
    (dAfterCode front).reverse .s3 (next :: farLeft) [.s0] hinput
  have hfinish := bFinishRight_markExcursionChunks
    program second rest extraOnes
  unfold markExcursionFuel
  rw [iterate_add, iterate_add, hactivate]
  rw [← hboundary]
  rw [iterate_BLeftBoundary]
  simp only [BLeftBoundary]
  rw [hfinish]
  rw [iterate_succ, iterate_zero, step_B_return_mark]

/-! ## Mark excursions with processed program cells and appended output -/

/-- A restored program cell already lying to the right of the head. -/
inductive ProgramRightLetter where
  | unary
  | mark
  deriving DecidableEq, Repr

def ProgramRightLetter.scan : ProgramRightLetter → DScanLetter
  | .unary => .one
  | .mark => .programMark

def ProgramRightLetter.chunk : ProgramRightLetter → BChunk
  | .unary => .one
  | .mark => .markedMark

def ProgramRightLetter.symbol : ProgramRightLetter → Symbol
  | .unary => .s0
  | .mark => .s2

def programRightScan (processed : List ProgramRightLetter) :
    List DScanLetter :=
  processed.map ProgramRightLetter.scan

def programRightChunks (processed : List ProgramRightLetter) :
    List BChunk :=
  processed.reverse.map ProgramRightLetter.chunk

def programRightCode (processed : List ProgramRightLetter) : List Symbol :=
  processed.map ProgramRightLetter.symbol

theorem bInputNear_programRightChunks
    (processed : List ProgramRightLetter) :
    bInputNear (programRightChunks processed) =
      (dAfterCode (programRightScan processed)).reverse := by
  induction processed with
  | nil => rfl
  | cons letter rest ih =>
      have hchunks : programRightChunks (letter :: rest) =
          programRightChunks rest ++ [letter.chunk] := by
        simp [programRightChunks, List.map_reverse]
      have hscan : dAfterCode (programRightScan (letter :: rest)) =
          letter.scan.after :: dAfterCode (programRightScan rest) := by
        rfl
      rw [hchunks, bInputNear_append, hscan, List.reverse_cons, ih]
      cases letter <;> rfl

theorem bFinishRight_programRightChunks
    (processed : List ProgramRightLetter) (writtenRight : List Symbol) :
    bFinishRight (programRightChunks processed) writtenRight =
      programRightCode processed ++ writtenRight := by
  induction processed generalizing writtenRight with
  | nil => rfl
  | cons letter rest ih =>
      rw [programRightChunks, List.reverse_cons, List.map_append,
        bFinishRight_append]
      change bFinishRight [letter.chunk]
          (bFinishRight (programRightChunks rest) writtenRight) = _
      rw [ih]
      cases letter <;>
        simp [bFinishRight, BChunk.outputNear, programRightCode,
          ProgramRightLetter.symbol, ProgramRightLetter.chunk]

/-- The right-scan core before its terminating `c` and appended unary tail. -/
def fullMarkCoreFront (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List DScanLetter :=
  programRightScan processed ++
    List.replicate extraOnes .one ++
    dataScanLetters program (second :: rest)

/-- Return chunks for the core, before adding the far-right unary tail. -/
def fullMarkCoreChunks (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List BChunk :=
  encodedBChunks program (second :: rest) extraOnes ++
    programRightChunks processed

theorem bInputNear_fullMarkCoreChunks
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    bInputNear
        (fullMarkCoreChunks program processed second rest extraOnes) =
      (dAfterCode
        (fullMarkCoreFront program processed second rest extraOnes)).reverse := by
  simp [fullMarkCoreChunks, fullMarkCoreFront, bInputNear_append,
    bInputNear_encodedBChunks, bInputNear_programRightChunks,
    dAfterCode, DScanLetter.after, List.map_reverse,
    List.reverse_append, List.append_assoc]

theorem fullMarkCoreChunks_eq_one_cons
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    ∃ tail,
      fullMarkCoreChunks program processed second rest extraOnes =
        .one :: tail := by
  obtain ⟨tail, htail⟩ :=
    encodedBChunks_eq_one_cons program second rest extraOnes
  exact ⟨tail ++ programRightChunks processed, by
    simp [fullMarkCoreChunks, htail, List.append_assoc]⟩

theorem bFinishRight_fullMarkCoreChunks
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (writtenRight : List Symbol) :
    bFinishRight
        (fullMarkCoreChunks program processed second rest extraOnes)
        writtenRight =
      programRightCode processed ++
        List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++
        writtenRight := by
  rw [fullMarkCoreChunks, bFinishRight_append,
    bFinishRight_encodedBChunks,
    bFinishRight_programRightChunks]
  rw [dBeforeCode_dataScanLetters]
  simp only [List.append_assoc]

/-- Cap the core at its rightmost separator. -/
def cappedFullMarkCoreChunks (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List BChunk :=
  capFirstOne
    (fullMarkCoreChunks program processed second rest extraOnes)

theorem bInputNear_cappedFullMarkCoreChunks
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    bInputNear
        (cappedFullMarkCoreChunks
          program processed second rest extraOnes) =
      .s1 ::
        (dAfterCode
          (fullMarkCoreFront
            program processed second rest extraOnes)).reverse := by
  obtain ⟨tail, htail⟩ := fullMarkCoreChunks_eq_one_cons
    program processed second rest extraOnes
  have hbase := bInputNear_fullMarkCoreChunks
    program processed second rest extraOnes
  rw [htail] at hbase
  unfold cappedFullMarkCoreChunks capFirstOne
  rw [htail]
  simpa [bInputNear, BChunk.inputNear] using
    congrArg (fun symbols => Symbol.s1 :: symbols) hbase

theorem bFinishRight_cappedFullMarkCoreChunks
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (writtenRight : List Symbol) :
    bFinishRight
        (cappedFullMarkCoreChunks
          program processed second rest extraOnes) writtenRight =
      programRightCode processed ++
        List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++
        .s5 :: writtenRight := by
  obtain ⟨tail, htail⟩ := fullMarkCoreChunks_eq_one_cons
    program processed second rest extraOnes
  have hbase := bFinishRight_fullMarkCoreChunks
    program processed second rest extraOnes (.s5 :: writtenRight)
  rw [htail] at hbase
  unfold cappedFullMarkCoreChunks capFirstOne
  rw [htail]
  simpa [bFinishRight, BChunk.outputNear,
    List.append_assoc] using hbase

/-- Prefix before the last cell of a complete marked-program right scan. -/
def fullMarkCycleFront (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) :
    List DScanLetter :=
  match appended with
  | 0 => fullMarkCoreFront program processed second rest extraOnes
  | count + 1 =>
      fullMarkCoreFront program processed second rest extraOnes ++
        .separator :: List.replicate count .one

def fullMarkCycleLast : Nat → DScanLetter
  | 0 => .separator
  | _ + 1 => .one

def fullMarkCycleLetters (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) :
    List DScanLetter :=
  fullMarkCycleFront program processed second rest extraOnes appended ++
    [fullMarkCycleLast appended]

theorem dBeforeCode_programRightScan
    (processed : List ProgramRightLetter) :
    dBeforeCode (programRightScan processed) =
      programRightCode processed := by
  induction processed with
  | nil => rfl
  | cons letter rest ih =>
      change letter.scan.before ::
          dBeforeCode (programRightScan rest) =
        letter.symbol :: programRightCode rest
      rw [ih]
      cases letter <;> rfl

theorem dBeforeCode_append (left right : List DScanLetter) :
    dBeforeCode (left ++ right) =
      dBeforeCode left ++ dBeforeCode right := by
  simp [dBeforeCode]

theorem dBeforeCode_replicate_one (length : Nat) :
    dBeforeCode (List.replicate length .one) =
      List.replicate length .s0 := by
  simp [dBeforeCode, DScanLetter.before]

theorem dBeforeCode_fullMarkCoreFront
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    dBeforeCode
        (fullMarkCoreFront program processed second rest extraOnes) =
      programRightCode processed ++
        List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) := by
  unfold fullMarkCoreFront
  rw [dBeforeCode_append, dBeforeCode_append,
    dBeforeCode_programRightScan, dBeforeCode_replicate_one,
    dBeforeCode_dataScanLetters]

/-- Literal right side represented by the complete cycle alphabet. -/
theorem dBeforeCode_fullMarkCycleLetters
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) :
    dBeforeCode
        (fullMarkCycleLetters
          program processed second rest extraOnes appended) =
      programRightCode processed ++
        List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
        List.replicate appended .s0 := by
  cases appended with
  | zero =>
      unfold fullMarkCycleLetters fullMarkCycleFront fullMarkCycleLast
      rw [dBeforeCode_append, dBeforeCode_fullMarkCoreFront]
      simp [dBeforeCode, DScanLetter.before, List.append_assoc]
  | succ appended =>
      unfold fullMarkCycleLetters fullMarkCycleFront fullMarkCycleLast
      rw [dBeforeCode_append, dBeforeCode_append,
        dBeforeCode_fullMarkCoreFront]
      simp [dBeforeCode, DScanLetter.before, List.replicate_succ',
        List.append_assoc]

/-- Return chunks including unary output already lying beyond the final `c`. -/
def fullMarkReturnChunks (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) :
    List BChunk :=
  List.replicate appended .one ++
    cappedFullMarkCoreChunks program processed second rest extraOnes

theorem bInputNear_fullMarkReturnChunks
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) :
    bInputNear
        (fullMarkReturnChunks
          program processed second rest extraOnes appended) =
      (fullMarkCycleLast appended).after ::
        (dAfterCode
          (fullMarkCycleFront
            program processed second rest extraOnes appended)).reverse := by
  cases appended with
  | zero =>
      simp [fullMarkReturnChunks, fullMarkCycleLast,
        fullMarkCycleFront, bInputNear_cappedFullMarkCoreChunks,
        DScanLetter.after]
  | succ appended =>
      rw [fullMarkReturnChunks, bInputNear_append,
        bInputNear_replicate_one,
        bInputNear_cappedFullMarkCoreChunks]
      simp [fullMarkCycleLast, fullMarkCycleFront, dAfterCode,
        DScanLetter.after, List.map_reverse, List.reverse_append,
        List.replicate_succ, List.append_assoc,
        replicate_same_cross]

theorem bFinishRight_fullMarkReturnChunks
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) :
    bFinishRight
        (fullMarkReturnChunks
          program processed second rest extraOnes appended) [.s0] =
      programRightCode processed ++
        List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++
        .s5 :: List.replicate (appended + 1) .s0 := by
  rw [fullMarkReturnChunks, bFinishRight_append,
    bFinishRight_replicate_one,
    bFinishRight_cappedFullMarkCoreChunks]
  simp [List.replicate_succ', List.append_assoc]

def fullMarkExcursionFuel (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) : Nat :=
  1 +
    (bLeftFuel
        (fullMarkReturnChunks
          program processed second rest extraOnes appended) +
      activateMarkFuel
        (fullMarkCycleLetters
          program processed second rest extraOnes appended))

/--
Complete marked-cell excursion with arbitrary processed-program prefix and an
arbitrary unary tail already appended beyond the rightmost `c`.
-/
theorem iterate_fullMarkExcursion
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (fullMarkExcursionFuel
          program processed second rest extraOnes appended)
        ⟨.B, .s2, next :: farLeft,
          programRightCode processed ++
            List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate appended .s0⟩ =
      ⟨.B, next, farLeft,
        programRightCode (.mark :: processed) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate (appended + 1) .s0⟩ := by
  let front := fullMarkCycleFront
    program processed second rest extraOnes appended
  let last := fullMarkCycleLast appended
  let chunks := fullMarkReturnChunks
    program processed second rest extraOnes appended
  have hactivate := iterate_activateMark front last (next :: farLeft)
  have hright := dBeforeCode_fullMarkCycleLetters
    program processed second rest extraOnes appended
  have hletters : fullMarkCycleLetters
      program processed second rest extraOnes appended = front ++ [last] := rfl
  rw [← hletters, hright] at hactivate
  have hinput := bInputNear_fullMarkReturnChunks
    program processed second rest extraOnes appended
  change bInputNear chunks =
    last.after :: (dAfterCode front).reverse at hinput
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks last.after
    (dAfterCode front).reverse .s3 (next :: farLeft) [.s0] hinput
  have hfinish := bFinishRight_fullMarkReturnChunks
    program processed second rest extraOnes appended
  unfold fullMarkExcursionFuel
  rw [iterate_add, iterate_add, hactivate]
  rw [← hboundary]
  rw [iterate_BLeftBoundary]
  simp only [BLeftBoundary]
  rw [hfinish]
  rw [iterate_succ, iterate_zero, step_B_return_mark]
  simp [programRightCode, ProgramRightLetter.symbol,
    List.append_assoc]

/-! ## Complete marked-program selector -/

/-- Marked low-program cells in nearest-first order. -/
def selectorCells : List Nat → List MarkedLetter
  | [] => []
  | gap :: rest =>
      List.replicate gap .one ++ .mark :: selectorCells rest

theorem processedCode_append (left right : List MarkedLetter) :
    processedCode (left ++ right) =
      processedCode left ++ processedCode right := by
  simp [processedCode]

theorem processedCode_replicate_one (length : Nat) :
    processedCode (List.replicate length .one) =
      List.replicate length .s4 := by
  simp [processedCode, MarkedLetter.crossing,
    CrossingLetter.before]

theorem processedCode_selectorCells (gaps : List Nat) :
    processedCode (selectorCells gaps) = markedNear gaps := by
  induction gaps with
  | nil => rfl
  | cons gap rest ih =>
      rw [selectorCells, processedCode_append,
        processedCode_replicate_one]
      simp [processedCode, MarkedLetter.crossing,
        CrossingLetter.before, markedNear, ih, List.append_assoc]
      change processedCode (selectorCells rest) = markedNear rest
      exact ih

/-- Literal right side carried by every selector boundary. -/
def selectorRight (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) :
    List Symbol :=
  programRightCode processed ++
    List.replicate extraOnes .s0 ++
    RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
    List.replicate appended .s0

/-- Boundary family before each marked-program selector cell. -/
def SelectorBoundary (program : RogozhinTagInput.Program)
    (remaining : List MarkedLetter)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) : Config :=
  match remaining with
  | [] =>
      ⟨.B, next, farLeft,
        selectorRight program processed second rest extraOnes appended⟩
  | letter :: tail =>
      ⟨.B, letter.crossing.before,
        processedCode tail ++ next :: farLeft,
        selectorRight program processed second rest extraOnes appended⟩

@[simp]
theorem iterate_SelectorBoundary_one
    (program : RogozhinTagInput.Program)
    (remaining : List MarkedLetter)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate 1
        (SelectorBoundary program (.one :: remaining) processed
          second rest extraOnes appended next farLeft) =
      SelectorBoundary program remaining (.unary :: processed)
        second rest extraOnes appended next farLeft := by
  cases remaining with
  | nil => rfl
  | cons letter tail => cases letter <;> rfl

theorem iterate_SelectorBoundary_mark
    (program : RogozhinTagInput.Program)
    (remaining : List MarkedLetter)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (fullMarkExcursionFuel
          program processed second rest extraOnes appended)
        (SelectorBoundary program (.mark :: remaining) processed
          second rest extraOnes appended next farLeft) =
      SelectorBoundary program remaining (.mark :: processed)
        second rest extraOnes (appended + 1) next farLeft := by
  cases remaining with
  | nil =>
      simpa [SelectorBoundary, selectorRight, processedCode,
        MarkedLetter.crossing, CrossingLetter.before,
        List.append_assoc] using
        iterate_fullMarkExcursion program processed second rest
          extraOnes appended next farLeft
  | cons letter tail =>
      cases letter with
      | one =>
          simpa [SelectorBoundary, selectorRight, processedCode,
            MarkedLetter.crossing, CrossingLetter.before,
            List.append_assoc] using
            iterate_fullMarkExcursion program processed second rest
              extraOnes appended .s4
              (processedCode tail ++ next :: farLeft)
      | mark =>
          simpa [SelectorBoundary, selectorRight, processedCode,
            MarkedLetter.crossing, CrossingLetter.before,
            List.append_assoc] using
            iterate_fullMarkExcursion program processed second rest
              extraOnes appended .s2
              (processedCode tail ++ next :: farLeft)

/-- Exact remaining selector time from an arbitrary accumulator boundary. -/
def selectorFuel (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List ProgramRightLetter → Nat → List MarkedLetter → Nat
  | _, _, [] => 0
  | processed, appended, .one :: remaining =>
      selectorFuel program second rest extraOnes
          (.unary :: processed) appended remaining + 1
  | processed, appended, .mark :: remaining =>
      selectorFuel program second rest extraOnes
          (.mark :: processed) (appended + 1) remaining +
        fullMarkExcursionFuel
          program processed second rest extraOnes appended

def selectorFinishProcessed :
    List ProgramRightLetter → List MarkedLetter → List ProgramRightLetter
  | processed, [] => processed
  | processed, .one :: remaining =>
      selectorFinishProcessed (.unary :: processed) remaining
  | processed, .mark :: remaining =>
      selectorFinishProcessed (.mark :: processed) remaining

def selectorFinishAppended : Nat → List MarkedLetter → Nat
  | appended, [] => appended
  | appended, .one :: remaining =>
      selectorFinishAppended appended remaining
  | appended, .mark :: remaining =>
      selectorFinishAppended (appended + 1) remaining

/--
Unbounded structural induction for the complete marked-program selection
phase.  Every marked unary cell is restored locally; every marked program `b`
executes one complete full-tape excursion and appends one unary output cell.
-/
theorem iterate_SelectorBoundary
    (program : RogozhinTagInput.Program)
    (remaining : List MarkedLetter)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (selectorFuel program second rest extraOnes
          processed appended remaining)
        (SelectorBoundary program remaining processed
          second rest extraOnes appended next farLeft) =
      SelectorBoundary program []
        (selectorFinishProcessed processed remaining)
        second rest extraOnes
        (selectorFinishAppended appended remaining) next farLeft := by
  induction remaining generalizing processed appended with
  | nil => rfl
  | cons letter remaining ih =>
      cases letter with
      | one =>
          unfold selectorFuel selectorFinishProcessed selectorFinishAppended
          rw [iterate_add, iterate_SelectorBoundary_one, ih]
      | mark =>
          unfold selectorFuel selectorFinishProcessed selectorFinishAppended
          rw [iterate_add, iterate_SelectorBoundary_mark, ih]

def selectorMarkCount : List MarkedLetter → Nat
  | [] => 0
  | .one :: remaining => selectorMarkCount remaining
  | .mark :: remaining => selectorMarkCount remaining + 1

theorem selectorFinishAppended_eq (appended : Nat)
    (remaining : List MarkedLetter) :
    selectorFinishAppended appended remaining =
      appended + selectorMarkCount remaining := by
  induction remaining generalizing appended with
  | nil => simp [selectorFinishAppended, selectorMarkCount]
  | cons letter remaining ih =>
      cases letter with
      | one =>
          simp [selectorFinishAppended, selectorMarkCount, ih]
      | mark =>
          rw [selectorFinishAppended, ih]
          simp [selectorMarkCount, Nat.add_assoc, Nat.add_comm,
            Nat.add_left_comm]

theorem selectorMarkCount_append
    (left right : List MarkedLetter) :
    selectorMarkCount (left ++ right) =
      selectorMarkCount left + selectorMarkCount right := by
  induction left with
  | nil => simp [selectorMarkCount]
  | cons letter left ih =>
      cases letter with
      | one => simpa [selectorMarkCount] using ih
      | mark =>
          simp [selectorMarkCount, ih, Nat.add_assoc,
            Nat.add_comm, Nat.add_left_comm]

theorem selectorMarkCount_replicate_one (length : Nat) :
    selectorMarkCount (List.replicate length .one) = 0 := by
  induction length with
  | zero => rfl
  | succ length ih =>
      simp [List.replicate_succ, selectorMarkCount, ih]

theorem selectorMarkCount_selectorCells (gaps : List Nat) :
    selectorMarkCount (selectorCells gaps) = gaps.length := by
  induction gaps with
  | nil => rfl
  | cons gap rest ih =>
      rw [selectorCells, selectorMarkCount_append,
        selectorMarkCount_replicate_one]
      simp [selectorMarkCount, ih]

theorem upperProgramCode_nonempty
    (program : RogozhinTagInput.Program) (label : Nat) :
    upperProgramCode program label ≠ [] := by
  simp [upperProgramCode, RogozhinTagInput.haltingCode]

theorem upperProgramCode_reverse_eq_cons
    (program : RogozhinTagInput.Program) (label : Nat) :
    ∃ next farLeft,
      (upperProgramCode program label).reverse = next :: farLeft := by
  cases hreverse : (upperProgramCode program label).reverse with
  | nil =>
      have hempty : upperProgramCode program label = [] := by
        have := congrArg List.reverse hreverse
        simpa using this
      exact False.elim (upperProgramCode_nonempty program label hempty)
  | cons next farLeft => exact ⟨next, farLeft, rfl⟩

/-- Processed low-program code after the selector has crossed every cell. -/
def selectedProgramRight (program : RogozhinTagInput.Program) (label : Nat) :
    List ProgramRightLetter :=
  selectorFinishProcessed []
    (selectorCells (programGaps program label))

def concreteSelectorTime (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  selectorFuel program second rest
    (RogozhinTagInput.weight program first + 1)
    [] 0 (selectorCells (programGaps program first))

/--
Concrete encoder instance of the complete marked-program selector.  The
terminal head/tail pair is derived from the literal unmarked upper program;
the appended unary count is proved equal to the source weight.
-/
theorem iterate_concreteSelector
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first ≤ RogozhinTagInput.symbolCount program) :
    ∃ next farLeft,
      (upperProgramCode program first).reverse = next :: farLeft ∧
      iterate (concreteSelectorTime program first second rest)
          ⟨.B, .s2,
            markedNear (programGapTail program first) ++
              (upperProgramCode program first).reverse,
            List.replicate
                (RogozhinTagInput.weight program first + 1) .s0 ++
              RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ =
        ⟨.B, next, farLeft,
          programRightCode (selectedProgramRight program first) ++
            List.replicate
                (RogozhinTagInput.weight program first + 1) .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate
              (RogozhinTagInput.weight program first) .s0⟩ := by
  obtain ⟨next, farLeft, hupper⟩ :=
    upperProgramCode_reverse_eq_cons program first
  obtain ⟨gapRest, hgap⟩ := programGaps_eq_zero_cons program first
  refine ⟨next, farLeft, hupper, ?_⟩
  have hsweep := iterate_SelectorBoundary program
    (selectorCells (programGaps program first)) [] second rest
    (RogozhinTagInput.weight program first + 1) 0 next farLeft
  have hlength :=
    length_programGaps_eq_weight program hT2 first hfirst
  have hgapLength : gapRest.length + 1 =
      RogozhinTagInput.weight program first := by
    simpa [hgap] using hlength
  simpa [concreteSelectorTime, selectedProgramRight,
    SelectorBoundary, selectorRight, hgap, hupper, programGapTail,
    selectorCells, processedCode_selectorCells,
    selectorFinishAppended_eq, selectorMarkCount,
    selectorMarkCount_selectorCells, hlength, hgapLength,
    programRightCode,
    MarkedLetter.crossing, CrossingLetter.before,
    List.append_assoc] using hsweep

/-! ## Selected-production unary excursions -/

@[simp]
theorem step_B_one_into_right_scan (front : List DScanLetter)
    (last : DScanLetter) (left : List Symbol) :
    absorbingStep
        ⟨State.B, Symbol.s0, left,
          dBeforeCode (front ++ [last])⟩ =
      BRightBoundary (front ++ [last]) (.s4 :: left) := by
  cases front with
  | nil => cases last <;> rfl
  | cons first rest => cases first <;> rfl

/-- Right-scan time including activation of one selected-production `1`. -/
def activateOneFuel (letters : List DScanLetter) : Nat :=
  bRightScanFuel letters + 1

theorem iterate_activateOne (front : List DScanLetter)
    (last : DScanLetter) (left : List Symbol) :
    iterate (activateOneFuel (front ++ [last]))
        ⟨.B, .s0, left, dBeforeCode (front ++ [last])⟩ =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ .s4 :: left, [.s0]⟩ := by
  unfold activateOneFuel
  rw [iterate_add, iterate_succ, iterate_zero,
    step_B_one_into_right_scan, iterate_BRightScan]

@[simp]
theorem step_B_return_one (next : Symbol) (farLeft right : List Symbol) :
    absorbingStep ⟨State.B, Symbol.s4, next :: farLeft, right⟩ =
      ⟨.B, next, farLeft, .s0 :: right⟩ := by
  rfl

/-- Exact duration of one selected-production unary excursion. -/
def fullOneExcursionFuel (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) : Nat :=
  1 +
    (bLeftFuel
        (fullMarkReturnChunks
          program processed second rest extraOnes appended) +
      activateOneFuel
        (fullMarkCycleLetters
          program processed second rest extraOnes appended))

/--
One unmarked unary cell of the selected production performs a complete
right-and-left tape excursion.  It is restored, exactly one unary cell is
appended beyond the rightmost separator, and the head advances one cell left.
The processed suffix and already-appended output are arbitrary.
-/
theorem iterate_fullOneExcursion
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (fullOneExcursionFuel
          program processed second rest extraOnes appended)
        ⟨.B, .s0, next :: farLeft,
          programRightCode processed ++
            List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate appended .s0⟩ =
      ⟨.B, next, farLeft,
        programRightCode (.unary :: processed) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate (appended + 1) .s0⟩ := by
  let front := fullMarkCycleFront
    program processed second rest extraOnes appended
  let last := fullMarkCycleLast appended
  let chunks := fullMarkReturnChunks
    program processed second rest extraOnes appended
  have hactivate := iterate_activateOne front last (next :: farLeft)
  have hright := dBeforeCode_fullMarkCycleLetters
    program processed second rest extraOnes appended
  have hletters : fullMarkCycleLetters
      program processed second rest extraOnes appended = front ++ [last] := rfl
  rw [← hletters, hright] at hactivate
  have hinput := bInputNear_fullMarkReturnChunks
    program processed second rest extraOnes appended
  change bInputNear chunks =
    last.after :: (dAfterCode front).reverse at hinput
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks last.after
    (dAfterCode front).reverse .s4 (next :: farLeft) [.s0] hinput
  have hfinish := bFinishRight_fullMarkReturnChunks
    program processed second rest extraOnes appended
  unfold fullOneExcursionFuel
  rw [iterate_add, iterate_add, hactivate]
  rw [← hboundary]
  rw [iterate_BLeftBoundary]
  simp only [BLeftBoundary]
  rw [hfinish]
  rw [iterate_succ, iterate_zero, step_B_return_one]
  simp [programRightCode, ProgramRightLetter.symbol,
    List.append_assoc]

/-! ## Selected-production double-mark excursions -/

/-- State-`D` right scan after a selected production delimiter is activated. -/
def DProductionRightBoundary (remaining : List DScanLetter)
    (writtenLeft : List Symbol) : Config :=
  match remaining with
  | [] => ⟨.D, .s4, writtenLeft, []⟩
  | letter :: rest =>
      ⟨.D, letter.before, writtenLeft, dBeforeCode rest⟩

@[simp]
theorem step_DProductionRightBoundary_cons (letter : DScanLetter)
    (rest : List DScanLetter) (writtenLeft : List Symbol) :
    absorbingStep
        (DProductionRightBoundary (letter :: rest) writtenLeft) =
      DProductionRightBoundary rest (letter.after :: writtenLeft) := by
  cases letter <;> cases rest <;> rfl

theorem iterate_DProductionRightBoundary
    (remaining : List DScanLetter) (writtenLeft : List Symbol) :
    iterate remaining.length
        (DProductionRightBoundary remaining writtenLeft) =
      DProductionRightBoundary []
        ((dAfterCode remaining).reverse ++ writtenLeft) := by
  induction remaining generalizing writtenLeft with
  | nil => rfl
  | cons letter rest ih =>
      rw [List.length_cons]
      change iterate (rest.length + 1)
        (DProductionRightBoundary (letter :: rest) writtenLeft) = _
      rw [iterate_add, iterate_succ, iterate_zero,
        step_DProductionRightBoundary_cons, ih]
      simp [dAfterCode, List.reverse_cons, List.append_assoc]

@[simp]
theorem step_D_blank_after_production_scan
    (front : List DScanLetter) (last : DScanLetter)
    (writtenLeft : List Symbol) :
    absorbingStep
        (DProductionRightBoundary []
          ((dAfterCode (front ++ [last])).reverse ++ writtenLeft)) =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ writtenLeft, [.s5]⟩ := by
  simp [DProductionRightBoundary, dAfterCode, List.map_reverse,
    List.reverse_append, List.append_assoc]
  cases last <;> rfl

def dProductionRightScanFuel (letters : List DScanLetter) : Nat :=
  1 + letters.length

theorem iterate_DProductionRightScan (front : List DScanLetter)
    (last : DScanLetter) (writtenLeft : List Symbol) :
    iterate (dProductionRightScanFuel (front ++ [last]))
        (DProductionRightBoundary (front ++ [last]) writtenLeft) =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ writtenLeft, [.s5]⟩ := by
  unfold dProductionRightScanFuel
  rw [iterate_add, iterate_DProductionRightBoundary,
    iterate_succ, iterate_zero, step_D_blank_after_production_scan]

/-- The three local transitions which activate an adjacent `bb` delimiter. -/
@[simp]
theorem iterate_B_doubleMark_into_D_scan
    (letters : List DScanLetter) (left : List Symbol) :
    iterate 3
        ⟨.B, .s1, .s1 :: left, dBeforeCode letters⟩ =
      DProductionRightBoundary letters (.s3 :: .s3 :: left) := by
  cases letters with
  | nil => rfl
  | cons letter rest => cases letter <;> rfl

/-- Right-scan time including activation of an adjacent `bb` delimiter. -/
def activateDoubleMarkFuel (letters : List DScanLetter) : Nat :=
  dProductionRightScanFuel letters + 3

theorem iterate_activateDoubleMark (front : List DScanLetter)
    (last : DScanLetter) (left : List Symbol) :
    iterate (activateDoubleMarkFuel (front ++ [last]))
        ⟨.B, .s1, .s1 :: left,
          dBeforeCode (front ++ [last])⟩ =
      ⟨.B, last.after,
        (dAfterCode front).reverse ++ .s3 :: .s3 :: left, [.s5]⟩ := by
  unfold activateDoubleMarkFuel
  rw [iterate_add, iterate_B_doubleMark_into_D_scan,
    iterate_DProductionRightScan]

theorem bFinishRight_fullMarkReturnChunks_general
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (writtenRight : List Symbol) :
    bFinishRight
        (fullMarkReturnChunks
          program processed second rest extraOnes appended) writtenRight =
      programRightCode processed ++
        List.replicate extraOnes .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++
        .s5 :: (List.replicate appended .s0 ++ writtenRight) := by
  rw [fullMarkReturnChunks, bFinishRight_append,
    bFinishRight_replicate_one,
    bFinishRight_cappedFullMarkCoreChunks]

@[simp]
theorem iterate_B_return_doubleMark
    (next : Symbol) (farLeft right : List Symbol) :
    iterate 2 ⟨State.B, Symbol.s3,
        .s3 :: next :: farLeft, right⟩ =
      ⟨.B, next, farLeft, .s2 :: .s2 :: right⟩ := by
  rfl

/-- Exact duration of one selected-production adjacent-`bb` excursion. -/
def fullDoubleMarkExcursionFuel (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat) : Nat :=
  2 +
    (bLeftFuel
        (fullMarkReturnChunks
          program processed second rest extraOnes appended) +
      activateDoubleMarkFuel
        (fullMarkCycleLetters
          program processed second rest extraOnes appended))

/--
One adjacent `bb` delimiter performs the complete state-`D` excursion,
appends exactly one new separator after the current unary output block,
restores both program marks as processed marks, and advances two cells left.
-/
theorem iterate_fullDoubleMarkExcursion
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (fullDoubleMarkExcursionFuel
          program processed second rest extraOnes appended)
        ⟨.B, .s1, .s1 :: next :: farLeft,
          programRightCode processed ++
            List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate appended .s0⟩ =
      ⟨.B, next, farLeft,
        programRightCode (.mark :: .mark :: processed) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate appended .s0 ++ [.s5]⟩ := by
  let front := fullMarkCycleFront
    program processed second rest extraOnes appended
  let last := fullMarkCycleLast appended
  let chunks := fullMarkReturnChunks
    program processed second rest extraOnes appended
  have hactivate := iterate_activateDoubleMark
    front last (next :: farLeft)
  have hright := dBeforeCode_fullMarkCycleLetters
    program processed second rest extraOnes appended
  have hletters : fullMarkCycleLetters
      program processed second rest extraOnes appended = front ++ [last] := rfl
  rw [← hletters, hright] at hactivate
  have hinput := bInputNear_fullMarkReturnChunks
    program processed second rest extraOnes appended
  change bInputNear chunks =
    last.after :: (dAfterCode front).reverse at hinput
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks last.after
    (dAfterCode front).reverse .s3
    (.s3 :: next :: farLeft) [.s5] hinput
  have hfinish := bFinishRight_fullMarkReturnChunks_general
    program processed second rest extraOnes appended [.s5]
  unfold fullDoubleMarkExcursionFuel
  rw [iterate_add, iterate_add, hactivate]
  rw [← hboundary]
  rw [iterate_BLeftBoundary]
  simp only [BLeftBoundary]
  rw [hfinish]
  rw [iterate_B_return_doubleMark]
  simp [programRightCode, ProgramRightLetter.symbol,
    List.append_assoc]

/-! ## Arbitrary unary output blocks -/

theorem programRightCode_replicate_unary (length : Nat) :
    programRightCode (List.replicate length .unary) =
      List.replicate length .s0 := by
  simp [programRightCode, ProgramRightLetter.symbol]

theorem replicate_unary_cross (length : Nat)
    (tail : List ProgramRightLetter) :
    List.replicate length .unary ++ .unary :: tail =
      .unary :: (List.replicate length .unary ++ tail) := by
  induction length with
  | zero => rfl
  | succ length ih => simp [List.replicate_succ, ih]

/-- Boundary family while crossing one arbitrary unary exponent right-to-left. -/
def UnaryOutputBoundary (program : RogozhinTagInput.Program)
    (remaining : Nat) (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) : Config :=
  match remaining with
  | 0 =>
      ⟨.B, next, farLeft,
        programRightCode processed ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate appended .s0⟩
  | count + 1 =>
      ⟨.B, .s0,
        List.replicate count .s0 ++ next :: farLeft,
        programRightCode processed ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate appended .s0⟩

/-- Exact recursive duration of an arbitrary unary output block. -/
def unaryOutputFuel (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List ProgramRightLetter → Nat → Nat → Nat
  | _, _, 0 => 0
  | processed, appended, count + 1 =>
      unaryOutputFuel program second rest extraOnes
          (.unary :: processed) (appended + 1) count +
        fullOneExcursionFuel
          program processed second rest extraOnes appended

theorem iterate_UnaryOutputBoundary_step
    (program : RogozhinTagInput.Program)
    (count : Nat) (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (fullOneExcursionFuel
          program processed second rest extraOnes appended)
        (UnaryOutputBoundary program (count + 1) processed second rest
          extraOnes appended next farLeft) =
      UnaryOutputBoundary program count (.unary :: processed)
        second rest extraOnes (appended + 1) next farLeft := by
  cases count with
  | zero =>
      simpa [UnaryOutputBoundary] using
        iterate_fullOneExcursion program processed second rest
          extraOnes appended next farLeft
  | succ count =>
      simpa [UnaryOutputBoundary, List.replicate_succ,
        List.append_assoc] using
        iterate_fullOneExcursion program processed second rest
          extraOnes appended .s0
          (List.replicate count .s0 ++ next :: farLeft)

/--
Structural induction over an arbitrary unary exponent.  Every source cell
makes one complete excursion; the theorem records both the restored program
prefix and the exact appended-cell count.
-/
theorem iterate_UnaryOutputBoundary
    (program : RogozhinTagInput.Program)
    (count : Nat) (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (unaryOutputFuel program second rest extraOnes
          processed appended count)
        (UnaryOutputBoundary program count processed second rest
          extraOnes appended next farLeft) =
      UnaryOutputBoundary program 0
        (List.replicate count .unary ++ processed)
        second rest extraOnes (appended + count) next farLeft := by
  induction count generalizing processed appended with
  | zero => rfl
  | succ count ih =>
      unfold unaryOutputFuel
      rw [iterate_add, iterate_UnaryOutputBoundary_step, ih]
      simp [UnaryOutputBoundary, List.replicate_succ,
        List.replicate_succ', Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm, List.append_assoc, replicate_unary_cross]

theorem dataTail_append_singleton
    (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label)
    (label : RogozhinTagInput.Label) :
    RogozhinTagInput.dataTail program (word ++ [label]) =
      RogozhinTagInput.dataTail program word ++ [.s5] ++
        List.replicate (RogozhinTagInput.weight program label) .s0 := by
  induction word with
  | nil =>
      simp [RogozhinTagInput.dataTail, RogozhinTagInput.ones]
  | cons first word ih =>
      simp only [List.cons_append, RogozhinTagInput.dataTail]
      rw [ih]
      simp [RogozhinTagInput.ones, List.append_assoc]

/-- Appending one represented source label extends a nonempty data code. -/
theorem dataCode_append_singleton
    (program : RogozhinTagInput.Program)
    (first : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (label : RogozhinTagInput.Label) :
    RogozhinTagInput.dataCode program
        ((first :: rest) ++ [label]) =
      RogozhinTagInput.dataCode program (first :: rest) ++ [.s5] ++
        List.replicate (RogozhinTagInput.weight program label) .s0 := by
  simp only [List.cons_append, RogozhinTagInput.dataCode]
  rw [dataTail_append_singleton]
  simp [RogozhinTagInput.ones, List.append_assoc]

/--
Semantic form of the adjacent-`bb` macro: if the completed unary block is the
weight of `label`, the new separator turns it into one more literal source
symbol in the encoded data word and resets the open output block to length
zero.
-/
theorem iterate_completeOutputLabel
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (label : RogozhinTagInput.Label)
    (next : Symbol) (farLeft : List Symbol) :
    iterate
        (fullDoubleMarkExcursionFuel program processed second rest
          extraOnes (RogozhinTagInput.weight program label))
        ⟨.B, .s1, .s1 :: next :: farLeft,
          programRightCode processed ++
            List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate (RogozhinTagInput.weight program label) .s0⟩ =
      ⟨.B, next, farLeft,
        programRightCode (.mark :: .mark :: processed) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode
            program ((second :: rest) ++ [label]) ++ [.s5]⟩ := by
  rw [iterate_fullDoubleMarkExcursion]
  rw [dataCode_append_singleton]
  simp [List.append_assoc]

/-! ## Arbitrary production-output sequences -/

/--
Nearest-first selected-production cells for a nonempty sequence of output
labels.  Adjacent `bb` cells separate successive unary weight blocks; the
terminal `b1b` is the control pattern which starts the third sweep.
-/
def outputCells (program : RogozhinTagInput.Program) :
    List RogozhinTagInput.Label → List Symbol
  | [] => [.s1, .s0, .s1]
  | label :: remaining =>
      List.replicate (RogozhinTagInput.weight program label) .s0 ++
        match remaining with
        | [] => [.s1, .s0, .s1]
        | _ => [.s1, .s1] ++ outputCells program remaining

/-- All output labels except the last, accumulated in source order. -/
def outputCompleted (first : RogozhinTagInput.Label) :
    List RogozhinTagInput.Label → List RogozhinTagInput.Label
  | [] => []
  | next :: remaining => first :: outputCompleted next remaining

/-- Last output label of a source sequence presented as head and tail. -/
def outputLast (first : RogozhinTagInput.Label) :
    List RogozhinTagInput.Label → RogozhinTagInput.Label
  | [] => first
  | next :: remaining => outputLast next remaining

/-- Restored program suffix after every output block has been crossed. -/
def outputFinishProcessed (program : RogozhinTagInput.Program) :
    List ProgramRightLetter → RogozhinTagInput.Label →
      List RogozhinTagInput.Label → List ProgramRightLetter
  | processed, label, [] =>
      List.replicate (RogozhinTagInput.weight program label) .unary ++
        processed
  | processed, label, next :: remaining =>
      outputFinishProcessed program
        (.mark :: .mark ::
          (List.replicate (RogozhinTagInput.weight program label) .unary ++
            processed)) next remaining

/-- Exact executable time for a complete nonempty output-label sequence. -/
def outputLabelsFuel (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) :
    List ProgramRightLetter → RogozhinTagInput.Label →
      List RogozhinTagInput.Label → Nat
  | processed, label, [] =>
      unaryOutputFuel program second rest extraOnes processed 0
        (RogozhinTagInput.weight program label)
  | processed, label, next :: remaining =>
      let afterUnary :=
        List.replicate (RogozhinTagInput.weight program label) .unary ++
          processed
      outputLabelsFuel program second (rest ++ [label]) extraOnes
          (.mark :: .mark :: afterUnary) next remaining +
        (fullDoubleMarkExcursionFuel program afterUnary second rest
            extraOnes (RogozhinTagInput.weight program label) +
          unaryOutputFuel program second rest extraOnes processed 0
            (RogozhinTagInput.weight program label))

/-- Every nonempty output code begins with a unary cell. -/
theorem outputCells_cons_shape
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) :
    ∃ tail, outputCells program (label :: remaining) = .s0 :: tail := by
  obtain ⟨predecessor, hweight⟩ :=
    RogozhinTagInput.weight_is_succ program label
  refine ⟨List.replicate predecessor .s0 ++
    (match remaining with
      | [] => [.s1, .s0, .s1]
      | _ => [.s1, .s1] ++ outputCells program remaining), ?_⟩
  simp [outputCells, hweight, List.replicate_succ]

/--
Unbounded production-payload induction.  It processes every unary exponent
and every adjacent-`bb` separator, extends the literal encoded data after each
completed output label, and stops exactly on the terminal `b` of `b1b` with
the last output block still open.
-/
theorem iterate_outputLabels
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (farLeft : List Symbol) :
    iterate
        (outputLabelsFuel program second rest extraOnes
          processed first remaining)
        ⟨.B, .s0,
          (outputCells program (first :: remaining)).tail ++ farLeft,
          programRightCode processed ++
            List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ =
      ⟨.B, .s1, .s0 :: .s1 :: farLeft,
        programRightCode
            (outputFinishProcessed program processed first remaining) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program
              (second :: (rest ++ outputCompleted first remaining)) ++
            [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast first remaining)) .s0⟩ := by
  induction remaining generalizing processed rest first with
  | nil =>
      obtain ⟨predecessor, hweight⟩ :=
        RogozhinTagInput.weight_is_succ program first
      have hunary := iterate_UnaryOutputBoundary program
        (RogozhinTagInput.weight program first) processed second rest
        extraOnes 0 .s1 (.s0 :: .s1 :: farLeft)
      simpa [outputLabelsFuel, outputCells, hweight,
        UnaryOutputBoundary, outputFinishProcessed,
        outputCompleted, outputLast, List.replicate_succ,
        List.append_assoc] using hunary
  | cons next remaining ih =>
      obtain ⟨predecessor, hweight⟩ :=
        RogozhinTagInput.weight_is_succ program first
      obtain ⟨nextPredecessor, hnextWeight⟩ :=
        RogozhinTagInput.weight_is_succ program next
      let afterUnary : List ProgramRightLetter :=
        List.replicate (RogozhinTagInput.weight program first) .unary ++
          processed
      have hunary := iterate_UnaryOutputBoundary program
        (RogozhinTagInput.weight program first) processed second rest
        extraOnes 0 .s1
        (.s1 :: outputCells program (next :: remaining) ++ farLeft)
      have hdelimiter := iterate_completeOutputLabel program afterUnary
        second rest extraOnes first .s0
        ((outputCells program (next :: remaining)).tail ++ farLeft)
      have hrecursive := ih
        (.mark :: .mark :: afterUnary) next (rest ++ [first])
      unfold outputLabelsFuel
      rw [iterate_add, iterate_add]
      have hstartUnary :
          ⟨State.B, Symbol.s0,
            (outputCells program (first :: next :: remaining)).tail ++
              farLeft,
            programRightCode processed ++
              List.replicate extraOnes .s0 ++
              RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ =
          UnaryOutputBoundary program
            (RogozhinTagInput.weight program first) processed second rest
            extraOnes 0 .s1
            (.s1 :: outputCells program (next :: remaining) ++ farLeft) := by
        simp [outputCells, UnaryOutputBoundary, hweight,
          List.replicate_succ, List.append_assoc]
      have hunary' :
          iterate
              (unaryOutputFuel program second rest extraOnes processed 0
                (RogozhinTagInput.weight program first))
              (UnaryOutputBoundary program
                (RogozhinTagInput.weight program first) processed second rest
                extraOnes 0 .s1
                (.s1 :: outputCells program (next :: remaining) ++ farLeft)) =
            UnaryOutputBoundary program 0 afterUnary second rest extraOnes
              (RogozhinTagInput.weight program first) .s1
              (.s1 :: outputCells program (next :: remaining) ++ farLeft) := by
        simpa [afterUnary] using hunary
      rw [hstartUnary, hunary']
      obtain ⟨nextTail, hnextCells⟩ :=
        outputCells_cons_shape program next remaining
      have hafterUnary :
          UnaryOutputBoundary program 0 afterUnary second rest
              extraOnes (RogozhinTagInput.weight program first) .s1
              (.s1 :: outputCells program (next :: remaining) ++ farLeft) =
            ⟨.B, .s1,
              .s1 :: .s0 ::
                ((outputCells program (next :: remaining)).tail ++ farLeft),
              programRightCode afterUnary ++
                List.replicate extraOnes .s0 ++
                RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
                List.replicate
                  (RogozhinTagInput.weight program first) .s0⟩ := by
        rw [hnextCells]
        simp [UnaryOutputBoundary, afterUnary, List.append_assoc]
      rw [hafterUnary, hdelimiter]
      have hrecursive' := hrecursive
      rw [hnextCells] at hrecursive'
      simp only [List.tail_cons] at hrecursive'
      rw [hnextCells]
      simp only [List.tail_cons]
      simp only [List.cons_append] at hrecursive' ⊢
      rw [hrecursive']
      simp [outputFinishProcessed, outputCompleted, outputLast,
        afterUnary, List.append_assoc]

/-! ## Binding output blocks to the literal selected production -/

theorem exponentCode_append_singleton
    (first : Nat) (rest : List Nat) (last : Nat) :
    RogozhinTagInput.exponentCode ((first :: rest) ++ [last]) =
      RogozhinTagInput.exponentCode (first :: rest) ++ [.s1, .s1] ++
        List.replicate last .s0 := by
  simp [RogozhinTagInput.exponentCode, RogozhinTagInput.ones,
    List.flatMap_append, List.append_assoc]

theorem reverse_replicate_symbol (length : Nat) (symbol : Symbol) :
    (List.replicate length symbol).reverse =
      List.replicate length symbol := by
  induction length with
  | zero => rfl
  | succ length ih =>
      rw [List.replicate_succ, List.reverse_cons, ih,
        cons_replicate_eq_replicate_append]

/-- Reversing the printed exponent stream exposes output blocks in order. -/
theorem exponentCode_reverse_weights
    (program : RogozhinTagInput.Program)
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) :
    (RogozhinTagInput.exponentCode
        ((first :: remaining).reverse.map
          (RogozhinTagInput.weight program))).reverse ++ [.s0, .s1] =
      outputCells program (first :: remaining) := by
  induction remaining generalizing first with
  | nil =>
      simp [RogozhinTagInput.exponentCode, RogozhinTagInput.ones,
        outputCells]
  | cons next remaining ih =>
      have hnonempty :
          ((next :: remaining).reverse.map
            (RogozhinTagInput.weight program)) ≠ [] := by
        simp
      cases hreverse :
          ((next :: remaining).reverse.map
            (RogozhinTagInput.weight program)) with
      | nil => exact False.elim (hnonempty hreverse)
      | cons exponent exponents =>
          have happend' := exponentCode_append_singleton exponent exponents
            (RogozhinTagInput.weight program first)
          have hlist :
              (first :: next :: remaining).reverse.map
                  (RogozhinTagInput.weight program) =
                (exponent :: exponents) ++
                  [RogozhinTagInput.weight program first] := by
            rw [List.reverse_cons, List.map_append, hreverse]
            rfl
          have hcore := ih next
          rw [hreverse] at hcore
          rw [hlist, happend']
          simp [List.reverse_append, List.reverse_cons,
            reverse_replicate_symbol, outputCells,
            RogozhinTagInput.ones, hcore, List.append_assoc]

theorem exponentCode_reverse_append_last
    (program : RogozhinTagInput.Program)
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) (last : Nat) :
    (RogozhinTagInput.exponentCode
        ((first :: remaining).reverse.map
            (RogozhinTagInput.weight program) ++ [last])).reverse ++
        [.s0, .s1] =
      List.replicate last .s0 ++ [.s1, .s1] ++
        outputCells program (first :: remaining) := by
  have hnonempty :
      ((first :: remaining).reverse.map
        (RogozhinTagInput.weight program)) ≠ [] := by
    simp
  cases hreverse :
      ((first :: remaining).reverse.map
        (RogozhinTagInput.weight program)) with
  | nil => exact False.elim (hnonempty hreverse)
  | cons exponent exponents =>
      rw [exponentCode_append_singleton]
      have hcore := exponentCode_reverse_weights program first remaining
      rw [hreverse] at hcore
      simp [List.reverse_append, List.reverse_cons,
        reverse_replicate_symbol, hcore, List.append_assoc]

/-- Literal selected-production code in its nearest-first scan order. -/
theorem productionCode_reverse_output_shape
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label : RogozhinTagInput.Label)
    (hlabel : label < RogozhinTagInput.symbolCount program) :
    ∃ suffix,
      RogozhinTagInput.productionAt program label =
          RogozhinTagInput.distinguished program ::
            RogozhinTagInput.distinguished program :: suffix ∧
      (RogozhinTagInput.productionCode program label).reverse =
        List.replicate
            (RogozhinTagInput.weight program
                (RogozhinTagInput.distinguished program) -
              RogozhinTagInput.weight program label) .s0 ++
          [.s1, .s1] ++
          outputCells program
            (RogozhinTagInput.distinguished program :: suffix) := by
  obtain ⟨suffix, hproduction, hvalid⟩ :=
    RogozhinTagInput.production_shape hT2 hlabel
  refine ⟨suffix, hproduction, ?_⟩
  have hexponents :
      RogozhinTagInput.productionExponents program label =
        ((RogozhinTagInput.distinguished program :: suffix).reverse.map
            (RogozhinTagInput.weight program)) ++
          [RogozhinTagInput.weight program
              (RogozhinTagInput.distinguished program) -
            RogozhinTagInput.weight program label] := by
    simp [RogozhinTagInput.productionExponents, hproduction,
      List.map_reverse, List.append_assoc]
  unfold RogozhinTagInput.productionCode
  rw [hexponents]
  simpa [List.reverse_append] using
    exponentCode_reverse_append_last program
      (RogozhinTagInput.distinguished program) suffix
      (RogozhinTagInput.weight program
          (RogozhinTagInput.distinguished program) -
        RogozhinTagInput.weight program label)

theorem drop_two_of_eq_two_cons {alpha : Type}
    (word : List alpha) (first second : alpha) (suffix : List alpha)
    (hword : word = first :: second :: suffix) :
    word.drop 2 = suffix := by
  rw [hword]
  rfl

theorem weight_step_le (program : RogozhinTagInput.Program) (label : Nat) :
    RogozhinTagInput.weight program label ≤
      RogozhinTagInput.weight program (label + 1) := by
  simp [RogozhinTagInput.weight]

theorem weight_mono (program : RogozhinTagInput.Program)
    {left right : Nat} (hle : left ≤ right) :
    RogozhinTagInput.weight program left ≤
      RogozhinTagInput.weight program right := by
  induction hle with
  | refl => exact Nat.le_refl _
  | @step right hle ih =>
      exact Nat.le_trans ih (weight_step_le program right)

theorem append_cancel_left_clean {alpha : Type}
    (front left right : List alpha)
    (happend : front ++ left = front ++ right) : left = right := by
  induction front with
  | nil => exact happend
  | cons head front ih =>
      exact ih (List.cons.inj happend).2

theorem append_cancel_right_clean {alpha : Type}
    (left right suffix : List alpha)
    (happend : left ++ suffix = right ++ suffix) : left = right := by
  have hreverse := congrArg List.reverse happend
  rw [List.reverse_append, List.reverse_append] at hreverse
  have hcancel := append_cancel_left_clean suffix.reverse
    left.reverse right.reverse hreverse
  have hback := congrArg List.reverse hcancel
  rw [List.reverse_reverse, List.reverse_reverse] at hback
  exact hback

/-- The upper literal program loses exactly the selected production at `+1`. -/
theorem upperProgramCode_eq_succ_append
    (program : RogozhinTagInput.Program) (label : Nat)
    (hlabel : label < RogozhinTagInput.symbolCount program) :
    upperProgramCode program label =
      upperProgramCode program (label + 1) ++
        RogozhinTagInput.productionCode program label := by
  have hle : label ≤ RogozhinTagInput.symbolCount program :=
    Nat.le_of_lt hlabel
  have hsucc : label + 1 ≤ RogozhinTagInput.symbolCount program :=
    hlabel
  have hsplit :
      upperProgramCode program label ++ lowerProgramCode program label =
        (upperProgramCode program (label + 1) ++
          RogozhinTagInput.productionCode program label) ++
            lowerProgramCode program label := by
    calc
      upperProgramCode program label ++ lowerProgramCode program label =
          RogozhinTagInput.programCode program :=
        (programCode_eq_upper_append_lower program label hle).symm
      _ = upperProgramCode program (label + 1) ++
          lowerProgramCode program (label + 1) :=
        programCode_eq_upper_append_lower program (label + 1) hsucc
      _ = (upperProgramCode program (label + 1) ++
          RogozhinTagInput.productionCode program label) ++
            lowerProgramCode program label := by
        simp [lowerProgramCode, List.append_assoc]
  exact append_cancel_right_clean _ _ _ hsplit

theorem upperProgramCode_reverse_succ_split
    (program : RogozhinTagInput.Program) (label : Nat)
    (hlabel : label < RogozhinTagInput.symbolCount program) :
    (upperProgramCode program label).reverse =
      (RogozhinTagInput.productionCode program label).reverse ++
        (upperProgramCode program (label + 1)).reverse := by
  rw [upperProgramCode_eq_succ_append program label hlabel,
    List.reverse_append]

/-- Exact time from the selected-production entry through terminal `b1b`. -/
def selectedProductionFuel (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  let distinguished := RogozhinTagInput.distinguished program
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let processed := selectedProgramRight program first
  let difference :=
    RogozhinTagInput.weight program distinguished -
      RogozhinTagInput.weight program first
  let afterDifference :=
    List.replicate difference .unary ++ processed
  outputLabelsFuel program second (rest ++ [distinguished])
      (RogozhinTagInput.weight program first + 1)
      (.mark :: .mark :: afterDifference) distinguished payload +
    (fullDoubleMarkExcursionFuel program afterDifference second rest
        (RogozhinTagInput.weight program first + 1)
        (RogozhinTagInput.weight program distinguished) +
      unaryOutputFuel program second rest
        (RogozhinTagInput.weight program first + 1)
        processed (RogozhinTagInput.weight program first) difference)

/--
The complete second-stage selected-production computation, stated at its
literal structural entry boundary.  It is unconditional for every nonhalting
T2 label and carries an exact executable time.
-/
theorem iterate_selectedProductionBoundary
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedProgramRight program first
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++ processed
    iterate (selectedProductionFuel program first second rest)
        (UnaryOutputBoundary program difference processed second rest
          (RogozhinTagInput.weight program first + 1)
          (RogozhinTagInput.weight program first) .s1
          (.s1 :: outputCells program (distinguished :: payload) ++
            (upperProgramCode program (first + 1)).reverse)) =
      ⟨.B, .s1, .s0 :: .s1 ::
          (upperProgramCode program (first + 1)).reverse,
        programRightCode
            (outputFinishProcessed program
              (.mark :: .mark :: afterDifference)
              distinguished payload) ++
          List.replicate
              (RogozhinTagInput.weight program first + 1) .s0 ++
          RogozhinTagInput.dataCode program
              (second ::
                ((rest ++ [distinguished]) ++
                  outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast distinguished payload)) .s0⟩ := by
  dsimp only
  obtain ⟨suffix, hproduction, hvalid⟩ :=
    RogozhinTagInput.production_shape hT2 hfirst
  have hpayload :
      (RogozhinTagInput.productionAt program first).drop 2 = suffix := by
    exact drop_two_of_eq_two_cons _ _ _ _ hproduction
  let distinguished := RogozhinTagInput.distinguished program
  let processed := selectedProgramRight program first
  let difference :=
    RogozhinTagInput.weight program distinguished -
      RogozhinTagInput.weight program first
  let afterDifference :=
    List.replicate difference .unary ++ processed
  have hfirstLe : first ≤ distinguished := by
    unfold distinguished RogozhinTagInput.distinguished
    exact Nat.le_sub_one_of_lt hfirst
  have hweightLe : RogozhinTagInput.weight program first ≤
      RogozhinTagInput.weight program distinguished :=
    weight_mono program hfirstLe
  have hweightSum :
      RogozhinTagInput.weight program first + difference =
        RogozhinTagInput.weight program distinguished := by
    unfold difference
    exact Nat.add_sub_of_le hweightLe
  have hunary := iterate_UnaryOutputBoundary program difference processed
    second rest (RogozhinTagInput.weight program first + 1)
    (RogozhinTagInput.weight program first) .s1
    (.s1 :: outputCells program (distinguished :: suffix) ++
      (upperProgramCode program (first + 1)).reverse)
  have hdelimiter := iterate_completeOutputLabel program afterDifference
    second rest (RogozhinTagInput.weight program first + 1)
    distinguished .s0
    ((outputCells program (distinguished :: suffix)).tail ++
      (upperProgramCode program (first + 1)).reverse)
  have hpayloadRun := iterate_outputLabels program
    (.mark :: .mark :: afterDifference) distinguished suffix second
    (rest ++ [distinguished])
    (RogozhinTagInput.weight program first + 1)
    (upperProgramCode program (first + 1)).reverse
  unfold selectedProductionFuel
  rw [iterate_add, iterate_add]
  rw [hpayload]
  rw [hunary]
  rw [hweightSum]
  have houtputShape := outputCells_cons_shape program distinguished suffix
  obtain ⟨outputTail, houtput⟩ := houtputShape
  have hzero :
      UnaryOutputBoundary program 0 afterDifference second rest
          (RogozhinTagInput.weight program first + 1)
          (RogozhinTagInput.weight program distinguished) .s1
          (.s1 :: outputCells program (distinguished :: suffix) ++
            (upperProgramCode program (first + 1)).reverse) =
        ⟨.B, .s1,
          .s1 :: .s0 ::
            ((outputCells program (distinguished :: suffix)).tail ++
              (upperProgramCode program (first + 1)).reverse),
          programRightCode afterDifference ++
            List.replicate
                (RogozhinTagInput.weight program first + 1) .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate
              (RogozhinTagInput.weight program distinguished) .s0⟩ := by
    rw [houtput]
    simp [UnaryOutputBoundary, List.append_assoc]
  rw [hzero, hdelimiter]
  simp only [List.cons_append]
  rw [hpayloadRun]

/-- The structural selected-production boundary is the literal upper code. -/
def selectedEntryCurrent : Nat → Symbol
  | 0 => .s1
  | _ + 1 => .s0

def selectedEntryLeft (program : RogozhinTagInput.Program)
    (output : List RogozhinTagInput.Label) (upper : List Symbol) :
    Nat → List Symbol
  | 0 => .s1 :: outputCells program output ++ upper
  | count + 1 =>
      List.replicate count .s0 ++
        .s1 :: .s1 :: (outputCells program output ++ upper)

theorem upperProgramCode_reverse_selectedEntry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first : RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let difference :=
      RogozhinTagInput.weight program
          (RogozhinTagInput.distinguished program) -
        RogozhinTagInput.weight program first
    (upperProgramCode program first).reverse =
      selectedEntryCurrent difference ::
        selectedEntryLeft program
          (RogozhinTagInput.distinguished program :: payload)
          (upperProgramCode program (first + 1)).reverse difference := by
  dsimp only
  obtain ⟨suffix, hproduction, hcode⟩ :=
    productionCode_reverse_output_shape program hT2 first hfirst
  have hpayload :
      (RogozhinTagInput.productionAt program first).drop 2 = suffix :=
    drop_two_of_eq_two_cons _ _ _ _ hproduction
  rw [hpayload]
  have hupper := upperProgramCode_reverse_succ_split
    program first hfirst
  rw [hcode] at hupper
  cases hdifference :
      RogozhinTagInput.weight program
          (RogozhinTagInput.distinguished program) -
        RogozhinTagInput.weight program first with
  | zero =>
      rw [hdifference] at hupper
      change (upperProgramCode program first).reverse =
        .s1 ::
          (.s1 :: outputCells program
            (RogozhinTagInput.distinguished program :: suffix) ++
              (upperProgramCode program (first + 1)).reverse)
      rw [hupper]
      rfl
  | succ difference =>
      rw [hdifference] at hupper
      change (upperProgramCode program first).reverse =
        .s0 ::
          (List.replicate difference .s0 ++
            .s1 :: .s1 ::
              (outputCells program
                  (RogozhinTagInput.distinguished program :: suffix) ++
                (upperProgramCode program (first + 1)).reverse))
      rw [hupper, List.replicate_succ,
        List.append_assoc, List.append_assoc]
      rfl

theorem selectedProduction_entry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedProgramRight program first
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    ∃ current left,
      (upperProgramCode program first).reverse = current :: left ∧
      ⟨State.B, current, left,
        programRightCode processed ++
          List.replicate
              (RogozhinTagInput.weight program first + 1) .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate (RogozhinTagInput.weight program first) .s0⟩ =
        UnaryOutputBoundary program difference processed second rest
          (RogozhinTagInput.weight program first + 1)
          (RogozhinTagInput.weight program first) .s1
          (.s1 :: outputCells program (distinguished :: payload) ++
            (upperProgramCode program (first + 1)).reverse) := by
  dsimp only
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let difference :=
    RogozhinTagInput.weight program
        (RogozhinTagInput.distinguished program) -
      RogozhinTagInput.weight program first
  have hupper := upperProgramCode_reverse_selectedEntry
    program hT2 first hfirst
  have hupper' :
      (upperProgramCode program first).reverse =
        selectedEntryCurrent difference ::
          selectedEntryLeft program
            (RogozhinTagInput.distinguished program :: payload)
            (upperProgramCode program (first + 1)).reverse difference := by
    simpa only [payload, difference] using hupper
  refine ⟨selectedEntryCurrent difference,
    selectedEntryLeft program
      (RogozhinTagInput.distinguished program :: payload)
      (upperProgramCode program (first + 1)).reverse difference,
    hupper', ?_⟩
  change
    ⟨State.B, selectedEntryCurrent difference,
      selectedEntryLeft program
        (RogozhinTagInput.distinguished program :: payload)
        (upperProgramCode program (first + 1)).reverse difference,
      programRightCode (selectedProgramRight program first) ++
        List.replicate
            (RogozhinTagInput.weight program first + 1) .s0 ++
        RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
        List.replicate (RogozhinTagInput.weight program first) .s0⟩ =
      UnaryOutputBoundary program difference
        (selectedProgramRight program first) second rest
        (RogozhinTagInput.weight program first + 1)
        (RogozhinTagInput.weight program first) .s1
        (.s1 :: outputCells program
          (RogozhinTagInput.distinguished program :: payload) ++
            (upperProgramCode program (first + 1)).reverse)
  cases difference <;> rfl

/-- Exact selector-plus-selected-production duration. -/
def selectorAndProductionFuel (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  selectedProductionFuel program first second rest +
    concreteSelectorTime program first second rest

/--
Complete unbounded second-stage program pass, starting at the literal marked
`P₀` boundary produced by `iterate_secondSweep_toProgram` and ending at the
terminal `b1b` boundary which starts the third sweep.
-/
theorem iterate_selectorAndProduction
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedProgramRight program first
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++ processed
    iterate (selectorAndProductionFuel program first second rest)
        ⟨.B, .s2,
          markedNear (programGapTail program first) ++
            (upperProgramCode program first).reverse,
          List.replicate
              (RogozhinTagInput.weight program first + 1) .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ =
      ⟨.B, .s1, .s0 :: .s1 ::
          (upperProgramCode program (first + 1)).reverse,
        programRightCode
            (outputFinishProcessed program
              (.mark :: .mark :: afterDifference)
              distinguished payload) ++
          List.replicate
              (RogozhinTagInput.weight program first + 1) .s0 ++
          RogozhinTagInput.dataCode program
              (second ::
                ((rest ++ [distinguished]) ++
                  outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast distinguished payload)) .s0⟩ := by
  dsimp only
  obtain ⟨selectedCurrent, selectedLeft, hselectedCode, hselector⟩ :=
    iterate_concreteSelector program hT2 first second rest
      (Nat.le_of_lt hfirst)
  obtain ⟨entryCurrent, entryLeft, hentryCode, hentry⟩ :=
    selectedProduction_entry program hT2 first second rest hfirst
  have hcurrent : selectedCurrent = entryCurrent := by
    rw [hentryCode] at hselectedCode
    exact (List.cons.inj hselectedCode).1.symm
  have hleft : selectedLeft = entryLeft := by
    rw [hentryCode] at hselectedCode
    exact (List.cons.inj hselectedCode).2.symm
  subst selectedCurrent
  subst selectedLeft
  have hproduction := iterate_selectedProductionBoundary
    program hT2 first second rest hfirst
  unfold selectorAndProductionFuel
  rw [iterate_add, hselector, hentry]
  exact hproduction

/-! ## The complete state-`C` third sweep -/

def ProgramRightLetter.restored : ProgramRightLetter → Symbol
  | .unary => .s0
  | .mark => .s1

def restoredProgramCode (processed : List ProgramRightLetter) :
    List Symbol :=
  processed.map ProgramRightLetter.restored

/-- State-`C` position while restoring the processed program suffix. -/
def CProgramBoundary (remaining : List ProgramRightLetter)
    (writtenLeft : List Symbol) (next : Symbol)
    (farRight : List Symbol) : Config :=
  match remaining with
  | [] => ⟨.C, next, writtenLeft, farRight⟩
  | letter :: rest =>
      ⟨.C, letter.symbol, writtenLeft,
        programRightCode rest ++ next :: farRight⟩

@[simp]
theorem step_CProgramBoundary_cons (letter : ProgramRightLetter)
    (remaining : List ProgramRightLetter)
    (writtenLeft : List Symbol) (next : Symbol)
    (farRight : List Symbol) :
    absorbingStep
        (CProgramBoundary (letter :: remaining)
          writtenLeft next farRight) =
      CProgramBoundary remaining (letter.restored :: writtenLeft)
        next farRight := by
  cases letter <;> cases remaining <;> rfl

theorem iterate_CProgramBoundary
    (remaining : List ProgramRightLetter)
    (writtenLeft : List Symbol) (next : Symbol)
    (farRight : List Symbol) :
    iterate remaining.length
        (CProgramBoundary remaining writtenLeft next farRight) =
      CProgramBoundary []
        ((restoredProgramCode remaining).reverse ++ writtenLeft)
        next farRight := by
  induction remaining generalizing writtenLeft with
  | nil => rfl
  | cons letter remaining ih =>
      rw [List.length_cons]
      change iterate (remaining.length + 1)
        (CProgramBoundary (letter :: remaining)
          writtenLeft next farRight) = _
      rw [iterate_add, iterate_succ, iterate_zero,
        step_CProgramBoundary_cons, ih]
      simp [restoredProgramCode, List.reverse_cons, List.append_assoc]

/-- The terminal `b1b` control pattern enters state `C` in exactly 3 steps. -/
theorem iterate_beginThirdSweep
    (first : ProgramRightLetter) (remaining : List ProgramRightLetter)
    (farLeft : List Symbol) (next : Symbol)
    (farRight : List Symbol) :
    iterate 3
        ⟨.B, .s1, .s0 :: .s1 :: farLeft,
          programRightCode (first :: remaining) ++ next :: farRight⟩ =
      CProgramBoundary (first :: remaining)
        (.s1 :: .s0 :: .s1 :: farLeft) next farRight := by
  cases first <;> cases remaining <;> rfl

/-- State-`C` position while crossing a finite unary garbage/data prefix. -/
def COnesBoundary (remaining : Nat) (writtenLeft : List Symbol)
    (next : Symbol) (farRight : List Symbol) : Config :=
  match remaining with
  | 0 => ⟨.C, next, writtenLeft, farRight⟩
  | count + 1 =>
      ⟨.C, .s0, writtenLeft,
        List.replicate count .s0 ++ next :: farRight⟩

@[simp]
theorem step_COnesBoundary_succ (remaining : Nat)
    (writtenLeft : List Symbol) (next : Symbol)
    (farRight : List Symbol) :
    absorbingStep
        (COnesBoundary (remaining + 1) writtenLeft next farRight) =
      COnesBoundary remaining (.s0 :: writtenLeft) next farRight := by
  cases remaining <;> rfl

theorem iterate_COnesBoundary (remaining : Nat)
    (writtenLeft : List Symbol) (next : Symbol)
    (farRight : List Symbol) :
    iterate remaining
        (COnesBoundary remaining writtenLeft next farRight) =
      COnesBoundary 0
        (List.replicate remaining .s0 ++ writtenLeft)
        next farRight := by
  induction remaining generalizing writtenLeft with
  | zero => rfl
  | succ remaining ih =>
      change iterate (remaining + 1)
        (COnesBoundary (remaining + 1) writtenLeft next farRight) = _
      rw [iterate_add, iterate_succ, iterate_zero,
        step_COnesBoundary_succ, ih]
      simp [COnesBoundary, List.replicate_succ,
        replicate_same_cross, List.append_assoc]

@[simp]
theorem step_C_separator_to_next
    (writtenLeft : List Symbol) (next : Symbol)
    (farRight : List Symbol) :
    absorbingStep ⟨State.C, Symbol.s5,
        writtenLeft, next :: farRight⟩ =
      ⟨.A, next, .s0 :: writtenLeft, farRight⟩ := by
  rfl

/-! ## Literal restoration identities -/

theorem outputCompleted_append_last
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) :
    outputCompleted first remaining ++ [outputLast first remaining] =
      first :: remaining := by
  induction remaining generalizing first with
  | nil => rfl
  | cons next remaining ih =>
      unfold outputCompleted outputLast
      rw [List.cons_append, ih]

theorem completedOutputWord_eq
    (rest : List RogozhinTagInput.Label)
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) :
    ((rest ++ [first]) ++ outputCompleted first remaining) ++
        [outputLast first remaining] =
      rest ++ first :: first :: remaining := by
  calc
    ((rest ++ [first]) ++ outputCompleted first remaining) ++
          [outputLast first remaining] =
        (rest ++ [first]) ++
          (outputCompleted first remaining ++
            [outputLast first remaining]) := by
      rw [List.append_assoc]
    _ = (rest ++ [first]) ++ (first :: remaining) := by
      rw [outputCompleted_append_last]
    _ = rest ++ first :: first :: remaining := by
      simp [List.append_assoc]

/-- The output accumulator at second-stage exit is the literal next dataword. -/
theorem selectedProductionData_eq
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    RogozhinTagInput.dataCode program
          (second ::
            ((rest ++ [distinguished]) ++
              outputCompleted distinguished payload)) ++ [.s5] ++
        List.replicate
          (RogozhinTagInput.weight program
            (outputLast distinguished payload)) .s0 =
      RogozhinTagInput.dataCode program
        (second :: (rest ++ RogozhinTagInput.productionAt program first)) := by
  dsimp only
  obtain ⟨suffix, hproduction, hvalid⟩ :=
    RogozhinTagInput.production_shape hT2 hfirst
  have hpayload :
      (RogozhinTagInput.productionAt program first).drop 2 = suffix := by
    exact drop_two_of_eq_two_cons _ _ _ _ hproduction
  rw [hpayload]
  rw [← dataCode_append_singleton]
  congr 2
  simpa [hproduction, List.append_assoc] using
    congrArg (fun word => second :: word)
      (completedOutputWord_eq rest
        (RogozhinTagInput.distinguished program) suffix)

def MarkedLetter.programRight : MarkedLetter → ProgramRightLetter
  | .one => .unary
  | .mark => .mark

theorem selectorFinishProcessed_eq
    (processed : List ProgramRightLetter)
    (remaining : List MarkedLetter) :
    selectorFinishProcessed processed remaining =
      remaining.reverse.map MarkedLetter.programRight ++ processed := by
  induction remaining generalizing processed with
  | nil => rfl
  | cons letter remaining ih =>
      cases letter <;>
        simp [selectorFinishProcessed, ih, MarkedLetter.programRight,
          List.reverse_cons, List.append_assoc]

theorem restoredProgramCode_append
    (left right : List ProgramRightLetter) :
    restoredProgramCode (left ++ right) =
      restoredProgramCode left ++ restoredProgramCode right := by
  simp [restoredProgramCode]

theorem restoredProgramCode_replicate_unary (length : Nat) :
    restoredProgramCode (List.replicate length .unary) =
      List.replicate length .s0 := by
  simp [restoredProgramCode, ProgramRightLetter.restored]

theorem restoredSelectorCells (gaps : List Nat) :
    (selectorCells gaps).map
        (fun letter => letter.programRight.restored) =
      unprocessedNear gaps := by
  induction gaps with
  | nil => rfl
  | cons gap gaps ih =>
      simp [selectorCells, unprocessedNear, List.map_append,
        MarkedLetter.programRight, ProgramRightLetter.restored]
      exact ih

/-- Restoring the selected low-program accumulator gives its literal bytes. -/
theorem restored_selectedProgramRight
    (program : RogozhinTagInput.Program) (label : Nat) :
    restoredProgramCode (selectedProgramRight program label) =
      lowerProgramCode program label := by
  unfold selectedProgramRight
  rw [selectorFinishProcessed_eq]
  simp only [List.append_nil, restoredProgramCode,
    List.map_append, List.map_reverse, List.map_map]
  change
    ((selectorCells (programGaps program label)).map
      (fun letter => letter.programRight.restored)).reverse = _
  rw [restoredSelectorCells]
  rw [unprocessedNear_programGaps]
  simp

/-- Forward literal suffix represented by a completed output scan. -/
def outputForwardCells (program : RogozhinTagInput.Program) :
    RogozhinTagInput.Label → List RogozhinTagInput.Label → List Symbol
  | first, [] =>
      List.replicate (RogozhinTagInput.weight program first) .s0
  | first, next :: remaining =>
      outputForwardCells program next remaining ++ [.s1, .s1] ++
        List.replicate (RogozhinTagInput.weight program first) .s0

theorem outputCells_reverse
    (program : RogozhinTagInput.Program)
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) :
    (outputCells program (first :: remaining)).reverse =
      [.s1, .s0, .s1] ++
        outputForwardCells program first remaining := by
  induction remaining generalizing first with
  | nil =>
      simp [outputCells, outputForwardCells,
        reverse_replicate_symbol, List.append_assoc]
  | cons next remaining ih =>
      have hcells : outputCells program (first :: next :: remaining) =
          List.replicate (RogozhinTagInput.weight program first) .s0 ++
            ([.s1, .s1] ++
              outputCells program (next :: remaining)) := rfl
      have hforward : outputForwardCells program first (next :: remaining) =
          outputForwardCells program next remaining ++ [.s1, .s1] ++
            List.replicate
              (RogozhinTagInput.weight program first) .s0 := rfl
      rw [hcells, hforward]
      rw [List.reverse_append, List.reverse_append,
        reverse_replicate_symbol, ih]
      simp [List.append_assoc]

theorem restored_outputFinishProcessed
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) :
    restoredProgramCode
        (outputFinishProcessed program processed first remaining) =
      outputForwardCells program first remaining ++
        restoredProgramCode processed := by
  induction remaining generalizing processed first with
  | nil =>
      simp [outputFinishProcessed, outputForwardCells,
        restoredProgramCode_append,
        restoredProgramCode_replicate_unary]
  | cons next remaining ih =>
      unfold outputFinishProcessed outputForwardCells
      rw [ih]
      simp [restoredProgramCode, restoredProgramCode_append,
        restoredProgramCode_replicate_unary,
        ProgramRightLetter.restored, List.append_assoc]

theorem productionCode_forward_output_shape
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (label : RogozhinTagInput.Label)
    (hlabel : label < RogozhinTagInput.symbolCount program) :
    ∃ suffix,
      RogozhinTagInput.productionAt program label =
          RogozhinTagInput.distinguished program ::
            RogozhinTagInput.distinguished program :: suffix ∧
      RogozhinTagInput.productionCode program label =
        [.s1, .s0, .s1] ++
          outputForwardCells program
            (RogozhinTagInput.distinguished program) suffix ++
          [.s1, .s1] ++
          List.replicate
            (RogozhinTagInput.weight program
                (RogozhinTagInput.distinguished program) -
              RogozhinTagInput.weight program label) .s0 := by
  obtain ⟨suffix, hproduction, hreverse⟩ :=
    productionCode_reverse_output_shape program hT2 label hlabel
  refine ⟨suffix, hproduction, ?_⟩
  have hboth := congrArg List.reverse hreverse
  rw [List.reverse_reverse] at hboth
  rw [List.reverse_append, List.reverse_append,
    reverse_replicate_symbol,
    outputCells_reverse] at hboth
  simpa [List.append_assoc] using hboth

/--
The third-sweep restoration projection of the complete processed accumulator
is exactly `P_first ... P₀`, including the three terminal control cells which
are restored by `iterate_beginThirdSweep`.
-/
theorem restored_selectedProductionProgram
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first : RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++
        selectedProgramRight program first
    [.s1, .s0, .s1] ++
        restoredProgramCode
          (outputFinishProcessed program
            (.mark :: .mark :: afterDifference)
            distinguished payload) =
      lowerProgramCode program (first + 1) := by
  dsimp only
  obtain ⟨suffix, hproduction, hforward⟩ :=
    productionCode_forward_output_shape program hT2 first hfirst
  have hpayload :
      (RogozhinTagInput.productionAt program first).drop 2 = suffix := by
    exact drop_two_of_eq_two_cons _ _ _ _ hproduction
  rw [hpayload]
  rw [restored_outputFinishProcessed]
  have hafter :
      restoredProgramCode
          (.mark :: .mark ::
            (List.replicate
                (RogozhinTagInput.weight program
                    (RogozhinTagInput.distinguished program) -
                  RogozhinTagInput.weight program first) .unary ++
              selectedProgramRight program first)) =
        [.s1, .s1] ++
          List.replicate
              (RogozhinTagInput.weight program
                  (RogozhinTagInput.distinguished program) -
                RogozhinTagInput.weight program first) .s0 ++
          lowerProgramCode program first := by
    change [.s1, .s1] ++
        restoredProgramCode
          (List.replicate
              (RogozhinTagInput.weight program
                  (RogozhinTagInput.distinguished program) -
                RogozhinTagInput.weight program first) .unary ++
            selectedProgramRight program first) = _
    rw [restoredProgramCode_append,
      restoredProgramCode_replicate_unary,
      restored_selectedProgramRight]
    simp [List.append_assoc]
  rw [hafter]
  rw [lowerProgramCode]
  rw [hforward]
  simp [List.append_assoc]

/-! ## Returned source boundary -/

/-- The same literal encoder with a finite unary audit prefix left of the head. -/
def compileWithPadding (program : RogozhinTagInput.Program)
    (padding : Nat) (word : List RogozhinTagInput.Label) : Config :=
  let left := List.replicate padding .s0 ++
    (RogozhinTagInput.programCode program).reverse
  match RogozhinTagInput.dataCode program word with
  | [] => ⟨.A, .s4, left, []⟩
  | current :: right => ⟨.A, current, left, right⟩

theorem compileWithPadding_zero
    (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label) :
    compileWithPadding program 0 word =
      RogozhinTagInput.compile ⟨program, word⟩ := by
  unfold compileWithPadding RogozhinTagInput.compile
  cases RogozhinTagInput.dataCode program word <;> rfl

theorem dataCode_cons_nonempty
    (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    RogozhinTagInput.dataCode program (first :: second :: rest) =
      List.replicate (RogozhinTagInput.weight program first) .s0 ++
        .s5 :: RogozhinTagInput.dataCode program (second :: rest) := by
  simp [RogozhinTagInput.dataCode, RogozhinTagInput.dataTail,
    RogozhinTagInput.ones, List.append_assoc]

/-- Moving one unary cell through a finite run of identical unary cells. -/
theorem cons_replicate_zero_append (count : Nat) (tail : List Symbol) :
    .s0 :: (List.replicate count .s0 ++ tail) =
      List.replicate count .s0 ++ .s0 :: tail := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append]
      exact congrArg (List.cons Symbol.s0) ih

theorem compileWithPadding_nonempty
    (program : RogozhinTagInput.Program) (padding : Nat)
    (first : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    compileWithPadding program padding (first :: rest) =
      ⟨.A, .s0,
        List.replicate padding .s0 ++
          (RogozhinTagInput.programCode program).reverse,
        List.replicate
            (RogozhinTagInput.weight program first - 1) .s0 ++
          RogozhinTagInput.dataTail program rest⟩ := by
  obtain ⟨predecessor, hweight⟩ :=
    RogozhinTagInput.weight_is_succ program first
  unfold compileWithPadding RogozhinTagInput.dataCode
  simp [RogozhinTagInput.ones, hweight, List.replicate_succ,
    List.append_assoc]

/-! ## First sweep with the carried unary audit prefix -/

/-- Replace the nearest zero-length `P₀` gap by the carried audit length. -/
def paddedProgramGaps (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label) (padding : Nat) : List Nat :=
  padding :: programGapTail program label

theorem unprocessedNear_paddedProgramGaps
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label) (padding : Nat) :
    unprocessedNear (paddedProgramGaps program label padding) =
      List.replicate padding .s0 ++
        unprocessedNear (programGaps program label) := by
  obtain ⟨rest, hgap⟩ := programGaps_eq_zero_cons program label
  simp [paddedProgramGaps, programGapTail, hgap, unprocessedNear,
    List.append_assoc]

theorem markedNear_paddedProgramGaps
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label) (padding : Nat) :
    markedNear (paddedProgramGaps program label padding) =
      List.replicate padding .s4 ++
        markedNear (programGaps program label) := by
  obtain ⟨rest, hgap⟩ := programGaps_eq_zero_cons program label
  simp [paddedProgramGaps, programGapTail, hgap, markedNear,
    List.append_assoc]

theorem length_paddedProgramGaps
    (program : RogozhinTagInput.Program)
    (label : RogozhinTagInput.Label) (padding : Nat) :
    (paddedProgramGaps program label padding).length =
      (programGaps program label).length := by
  obtain ⟨rest, hgap⟩ := programGaps_eq_zero_cons program label
  simp [paddedProgramGaps, programGapTail, hgap]

/-- The padded literal encoder is the corresponding first-sweep boundary. -/
theorem compileWithPadding_eq_firstBoundary
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (label second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    compileWithPadding program padding (label :: second :: rest) =
      FirstBoundary [] (paddedProgramGaps program label padding)
        (upperProgramCode program label).reverse
        (followingData program second rest) := by
  have hcount := length_programGaps_eq_weight
    program hT2 label hlabel
  obtain ⟨gapRest, hgap⟩ := programGaps_eq_zero_cons program label
  have hweight : RogozhinTagInput.weight program label =
      gapRest.length + 1 := by
    rw [← hcount, hgap]
    rfl
  rw [compileWithPadding_nonempty]
  simp [FirstBoundary, paddedProgramGaps, programGapTail, hgap,
    processedCode, followingData, RogozhinTagInput.dataTail,
    RogozhinTagInput.ones, hweight,
    programCode_reverse_split program label hlabel,
    List.replicate_succ, List.append_assoc]
  simp [unprocessedNear, List.append_assoc]

/-- Exact first sweep from every padded nonhalting source boundary. -/
theorem iterate_compileWithPadding_firstSweep
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (label second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    iterate
        (firstSweepFuel []
          (paddedProgramGaps program label padding))
        (compileWithPadding program padding
          (label :: second :: rest)) =
      ⟨.A, .s5,
        List.replicate (RogozhinTagInput.weight program label) .s4 ++
          List.replicate padding .s4 ++
          markedNear (programGaps program label) ++
          (upperProgramCode program label).reverse,
        followingData program second rest⟩ := by
  rw [compileWithPadding_eq_firstBoundary program hT2 padding
    label second rest hlabel]
  rw [iterate_firstSweepFuel]
  simp only [FirstBoundary]
  rw [processedCode_finish, length_paddedProgramGaps,
    length_programGaps_eq_weight program hT2 label hlabel,
    markedNear_paddedProgramGaps]
  simp [processedCode, List.append_assoc]
  rw [← List.append_assoc, List.replicate_append_replicate]

/-! ## Second sweep with an arbitrary carried unary prefix -/

def secondSweepBChunksWithCarry (program : RogozhinTagInput.Program)
    (carried : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : List BChunk :=
  encodedBChunks program (second :: rest) (carried + 1)

def secondSweepToProgramFuelWithCarry
    (program : RogozhinTagInput.Program)
    (carried : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  bLeftFuel (secondSweepBChunksWithCarry program carried second rest) +
    concreteBeginSecondSweepTime program second rest

/--
The D/B/C second sweep carries an arbitrary finite unary audit prefix.  Its
only effect is to increase the restored right-side prefix by one cell.
-/
theorem iterate_secondSweep_toProgram_withCarry
    (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (carried : Nat) :
    iterate
        (secondSweepToProgramFuelWithCarry
          program carried second rest)
        ⟨.A, .s5,
          List.replicate carried .s4 ++
            markedNear (programGaps program first) ++
            (upperProgramCode program first).reverse,
          followingData program second rest⟩ =
      ⟨.B, .s2,
        markedNear (programGapTail program first) ++
          (upperProgramCode program first).reverse,
        List.replicate (carried + 1) .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ := by
  obtain ⟨dataFront, hdata, hbegin⟩ :=
    iterate_beginSecondSweep_encoded program second rest
      (List.replicate carried .s4 ++
        markedNear (programGaps program first) ++
        (upperProgramCode program first).reverse)
  obtain ⟨gapRest, hgap⟩ := programGaps_eq_zero_cons program first
  let chunks := secondSweepBChunksWithCarry program carried second rest
  have hinput : bInputNear chunks =
      .s4 ::
        ((dAfterCode dataFront).reverse ++
          .s4 :: List.replicate carried .s4) := by
    unfold chunks secondSweepBChunksWithCarry
    rw [bInputNear_encodedBChunks, hdata]
    simp [dAfterCode, DScanLetter.after, List.map_reverse,
      List.reverse_append, List.replicate_succ, List.append_assoc]
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks .s4
    ((dAfterCode dataFront).reverse ++
      .s4 :: List.replicate carried .s4)
    .s2
    (markedNear gapRest ++ (upperProgramCode program first).reverse)
    [.s5] hinput
  have hconfig :
      ⟨State.B, Symbol.s4,
        (dAfterCode dataFront).reverse ++ .s4 ::
          (List.replicate carried .s4 ++
            markedNear (programGaps program first) ++
            (upperProgramCode program first).reverse),
        [.s5]⟩ =
      BLeftBoundary chunks .s2
        (markedNear gapRest ++ (upperProgramCode program first).reverse)
        [.s5] := by
    rw [hboundary]
    simp [hgap, markedNear, List.append_assoc]
  unfold secondSweepToProgramFuelWithCarry
  rw [iterate_add, hbegin, hconfig]
  change iterate
      (bLeftFuel
        (encodedBChunks program (second :: rest) (carried + 1)))
      (BLeftBoundary
        (encodedBChunks program (second :: rest) (carried + 1)) .s2
        (markedNear gapRest ++ (upperProgramCode program first).reverse)
        [.s5]) = _
  rw [iterate_BEncodedData]
  simp [chunks, secondSweepBChunksWithCarry, hgap, programGapTail,
    List.append_assoc]

def concreteSelectorTimeWithCarry (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) : Nat :=
  selectorFuel program second rest extraOnes
    [] 0 (selectorCells (programGaps program first))

/-- The complete selector preserves an arbitrary right-side audit prefix. -/
theorem iterate_concreteSelector_withCarry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (hfirst : first ≤ RogozhinTagInput.symbolCount program) :
    ∃ next farLeft,
      (upperProgramCode program first).reverse = next :: farLeft ∧
      iterate
          (concreteSelectorTimeWithCarry
            program first second rest extraOnes)
          ⟨.B, .s2,
            markedNear (programGapTail program first) ++
              (upperProgramCode program first).reverse,
            List.replicate extraOnes .s0 ++
              RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ =
        ⟨.B, next, farLeft,
          programRightCode (selectedProgramRight program first) ++
            List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate
              (RogozhinTagInput.weight program first) .s0⟩ := by
  obtain ⟨next, farLeft, hupper⟩ :=
    upperProgramCode_reverse_eq_cons program first
  obtain ⟨gapRest, hgap⟩ := programGaps_eq_zero_cons program first
  refine ⟨next, farLeft, hupper, ?_⟩
  have hsweep := iterate_SelectorBoundary program
    (selectorCells (programGaps program first)) [] second rest
    extraOnes 0 next farLeft
  have hlength :=
    length_programGaps_eq_weight program hT2 first hfirst
  have hgapLength : gapRest.length + 1 =
      RogozhinTagInput.weight program first := by
    simpa [hgap] using hlength
  simpa [concreteSelectorTimeWithCarry, selectedProgramRight,
    SelectorBoundary, selectorRight, hgap, hupper, programGapTail,
    selectorCells, processedCode_selectorCells,
    selectorFinishAppended_eq, selectorMarkCount,
    selectorMarkCount_selectorCells, hlength, hgapLength,
    programRightCode,
    MarkedLetter.crossing, CrossingLetter.before,
    List.append_assoc] using hsweep

def selectedProductionFuelWithCarry
    (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) : Nat :=
  let distinguished := RogozhinTagInput.distinguished program
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let processed := selectedProgramRight program first
  let difference :=
    RogozhinTagInput.weight program distinguished -
      RogozhinTagInput.weight program first
  let afterDifference :=
    List.replicate difference .unary ++ processed
  outputLabelsFuel program second (rest ++ [distinguished])
      extraOnes (.mark :: .mark :: afterDifference) distinguished payload +
    (fullDoubleMarkExcursionFuel program afterDifference second rest
        extraOnes (RogozhinTagInput.weight program distinguished) +
      unaryOutputFuel program second rest extraOnes processed
        (RogozhinTagInput.weight program first) difference)

/-- Selected-production evaluation preserves any finite audit prefix. -/
theorem iterate_selectedProductionBoundary_withCarry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedProgramRight program first
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++ processed
    iterate
        (selectedProductionFuelWithCarry
          program first second rest extraOnes)
        (UnaryOutputBoundary program difference processed second rest
          extraOnes (RogozhinTagInput.weight program first) .s1
          (.s1 :: outputCells program (distinguished :: payload) ++
            (upperProgramCode program (first + 1)).reverse)) =
      ⟨.B, .s1, .s0 :: .s1 ::
          (upperProgramCode program (first + 1)).reverse,
        programRightCode
            (outputFinishProcessed program
              (.mark :: .mark :: afterDifference)
              distinguished payload) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program
              (second ::
                ((rest ++ [distinguished]) ++
                  outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast distinguished payload)) .s0⟩ := by
  dsimp only
  obtain ⟨suffix, hproduction, hvalid⟩ :=
    RogozhinTagInput.production_shape hT2 hfirst
  have hpayload :
      (RogozhinTagInput.productionAt program first).drop 2 = suffix := by
    exact drop_two_of_eq_two_cons _ _ _ _ hproduction
  let distinguished := RogozhinTagInput.distinguished program
  let processed := selectedProgramRight program first
  let difference :=
    RogozhinTagInput.weight program distinguished -
      RogozhinTagInput.weight program first
  let afterDifference :=
    List.replicate difference .unary ++ processed
  have hfirstLe : first ≤ distinguished := by
    unfold distinguished RogozhinTagInput.distinguished
    exact Nat.le_sub_one_of_lt hfirst
  have hweightLe : RogozhinTagInput.weight program first ≤
      RogozhinTagInput.weight program distinguished :=
    weight_mono program hfirstLe
  have hweightSum :
      RogozhinTagInput.weight program first + difference =
        RogozhinTagInput.weight program distinguished := by
    unfold difference
    exact Nat.add_sub_of_le hweightLe
  have hunary := iterate_UnaryOutputBoundary program difference processed
    second rest extraOnes (RogozhinTagInput.weight program first) .s1
    (.s1 :: outputCells program (distinguished :: suffix) ++
      (upperProgramCode program (first + 1)).reverse)
  have hdelimiter := iterate_completeOutputLabel program afterDifference
    second rest extraOnes distinguished .s0
    ((outputCells program (distinguished :: suffix)).tail ++
      (upperProgramCode program (first + 1)).reverse)
  have hpayloadRun := iterate_outputLabels program
    (.mark :: .mark :: afterDifference) distinguished suffix second
    (rest ++ [distinguished]) extraOnes
    (upperProgramCode program (first + 1)).reverse
  unfold selectedProductionFuelWithCarry
  rw [iterate_add, iterate_add]
  rw [hpayload]
  rw [hunary]
  rw [hweightSum]
  obtain ⟨outputTail, houtput⟩ :=
    outputCells_cons_shape program distinguished suffix
  have hzero :
      UnaryOutputBoundary program 0 afterDifference second rest
          extraOnes
          (RogozhinTagInput.weight program distinguished) .s1
          (.s1 :: outputCells program (distinguished :: suffix) ++
            (upperProgramCode program (first + 1)).reverse) =
        ⟨.B, .s1,
          .s1 :: .s0 ::
            ((outputCells program (distinguished :: suffix)).tail ++
              (upperProgramCode program (first + 1)).reverse),
          programRightCode afterDifference ++
            List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
            List.replicate
              (RogozhinTagInput.weight program distinguished) .s0⟩ := by
    rw [houtput]
    simp [UnaryOutputBoundary, List.append_assoc]
  rw [hzero, hdelimiter]
  simp only [List.cons_append]
  rw [hpayloadRun]

/-- Literal selected-production entry with an arbitrary audit prefix. -/
theorem selectedProduction_entry_withCarry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedProgramRight program first
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    ∃ current left,
      (upperProgramCode program first).reverse = current :: left ∧
      ⟨State.B, current, left,
        programRightCode processed ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate (RogozhinTagInput.weight program first) .s0⟩ =
        UnaryOutputBoundary program difference processed second rest
          extraOnes (RogozhinTagInput.weight program first) .s1
          (.s1 :: outputCells program (distinguished :: payload) ++
            (upperProgramCode program (first + 1)).reverse) := by
  dsimp only
  obtain ⟨suffix, hproduction, hcode⟩ :=
    productionCode_reverse_output_shape program hT2 first hfirst
  have hpayload :
      (RogozhinTagInput.productionAt program first).drop 2 = suffix := by
    exact drop_two_of_eq_two_cons _ _ _ _ hproduction
  rw [hpayload]
  have hupper := upperProgramCode_reverse_succ_split
    program first hfirst
  rw [hcode] at hupper
  cases hdifference :
      RogozhinTagInput.weight program
          (RogozhinTagInput.distinguished program) -
        RogozhinTagInput.weight program first with
  | zero =>
      rw [hdifference] at hupper
      refine ⟨.s1,
        .s1 :: outputCells program
            (RogozhinTagInput.distinguished program :: suffix) ++
          (upperProgramCode program (first + 1)).reverse,
        ?_, ?_⟩
      · rw [hupper]
        rfl
      · rfl
  | succ difference =>
      rw [hdifference] at hupper
      refine ⟨.s0,
        List.replicate difference .s0 ++
          .s1 :: .s1 ::
            (outputCells program
                (RogozhinTagInput.distinguished program :: suffix) ++
              (upperProgramCode program (first + 1)).reverse),
        ?_, ?_⟩
      · rw [hupper, List.replicate_succ]
        rw [List.append_assoc, List.append_assoc]
        rfl
      · rfl

def selectorAndProductionFuelWithCarry
    (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) : Nat :=
  selectedProductionFuelWithCarry
      program first second rest extraOnes +
    concreteSelectorTimeWithCarry
      program first second rest extraOnes

/-- Complete selector and production pass with arbitrary carried prefix. -/
theorem iterate_selectorAndProduction_withCarry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedProgramRight program first
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++ processed
    iterate
        (selectorAndProductionFuelWithCarry
          program first second rest extraOnes)
        ⟨.B, .s2,
          markedNear (programGapTail program first) ++
            (upperProgramCode program first).reverse,
          List.replicate extraOnes .s0 ++
            RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ =
      ⟨.B, .s1, .s0 :: .s1 ::
          (upperProgramCode program (first + 1)).reverse,
        programRightCode
            (outputFinishProcessed program
              (.mark :: .mark :: afterDifference)
              distinguished payload) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program
              (second ::
                ((rest ++ [distinguished]) ++
                  outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast distinguished payload)) .s0⟩ := by
  dsimp only
  obtain ⟨selectedCurrent, selectedLeft, hselectedCode, hselector⟩ :=
    iterate_concreteSelector_withCarry program hT2 first second rest
      extraOnes (Nat.le_of_lt hfirst)
  obtain ⟨entryCurrent, entryLeft, hentryCode, hentry⟩ :=
    selectedProduction_entry_withCarry program hT2 first second rest
      extraOnes hfirst
  have hcurrent : selectedCurrent = entryCurrent := by
    rw [hentryCode] at hselectedCode
    exact (List.cons.inj hselectedCode).1.symm
  have hleft : selectedLeft = entryLeft := by
    rw [hentryCode] at hselectedCode
    exact (List.cons.inj hselectedCode).2.symm
  subst selectedCurrent
  subst selectedLeft
  have hproduction := iterate_selectedProductionBoundary_withCarry
    program hT2 first second rest extraOnes hfirst
  unfold selectorAndProductionFuelWithCarry
  rw [iterate_add, hselector, hentry]
  exact hproduction

theorem outputFinishProcessed_nonempty
    (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter)
    (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) :
    ∃ head tail,
      outputFinishProcessed program processed first remaining =
        head :: tail := by
  induction remaining generalizing processed first with
  | nil =>
      obtain ⟨predecessor, hweight⟩ :=
        RogozhinTagInput.weight_is_succ program first
      refine ⟨.unary,
        List.replicate predecessor .unary ++ processed, ?_⟩
      unfold outputFinishProcessed
      rw [hweight, List.replicate_succ]
      rw [List.cons_append]
  | cons next remaining ih =>
      obtain ⟨head, tail, hshape⟩ := ih
        (.mark :: .mark ::
          (List.replicate (RogozhinTagInput.weight program first) .unary ++
            processed)) next
      exact ⟨head, tail, hshape⟩

theorem nextTagWord_two_prefix
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    ∃ next nextSecond nextRest,
      rest ++ RogozhinTagInput.productionAt program first =
        next :: nextSecond :: nextRest := by
  obtain ⟨suffix, hproduction, hvalid⟩ :=
    RogozhinTagInput.production_shape hT2 hfirst
  cases rest with
  | nil =>
      exact ⟨RogozhinTagInput.distinguished program,
        RogozhinTagInput.distinguished program, suffix, hproduction⟩
  | cons next tail =>
      cases tail with
      | nil =>
          exact ⟨next, RogozhinTagInput.distinguished program,
            RogozhinTagInput.distinguished program :: suffix, by
              simp [hproduction]⟩
      | cons nextSecond nextRest =>
          exact ⟨next, nextSecond,
            nextRest ++ RogozhinTagInput.productionAt program first, rfl⟩

/-- Exact third-sweep duration with an arbitrary carried unary prefix. -/
def thirdSweepFuelWithCarry (program : RogozhinTagInput.Program)
    (carried : Nat) (second : RogozhinTagInput.Label) :
    List ProgramRightLetter → Nat
  | processed =>
      1 +
        ((carried + 1 + RogozhinTagInput.weight program second) +
          (processed.length + 3))

/-- The normalized third sweep for every finite carried audit prefix. -/
theorem iterate_thirdSweep_coreWithCarry
    (program : RogozhinTagInput.Program)
    (carried : Nat) (second : RogozhinTagInput.Label)
    (nextWord : List RogozhinTagInput.Label)
    (processed : List ProgramRightLetter)
    (upper : List Symbol)
    (processedHead : ProgramRightLetter)
    (processedTail : List ProgramRightLetter)
    (next nextSecond : RogozhinTagInput.Label)
    (nextRest : List RogozhinTagInput.Label)
    (hprocessed : processed = processedHead :: processedTail)
    (hleft :
      (restoredProgramCode processed).reverse ++
          .s1 :: .s0 :: .s1 :: upper =
        (RogozhinTagInput.programCode program).reverse)
    (hnextWord : nextWord = next :: nextSecond :: nextRest) :
    iterate (thirdSweepFuelWithCarry program carried second processed)
        ⟨.B, .s1, .s0 :: .s1 :: upper,
          programRightCode processed ++
            List.replicate (carried + 1) .s0 ++
            RogozhinTagInput.dataCode program (second :: nextWord)⟩ =
      compileWithPadding program
        (carried + 1 + RogozhinTagInput.weight program second + 1)
        nextWord := by
  have hbegin := iterate_beginThirdSweep processedHead processedTail
    upper .s0
    (List.replicate carried .s0 ++
      RogozhinTagInput.dataCode program (second :: nextWord))
  rw [← hprocessed] at hbegin
  have hbegin' :
      iterate 3
          ⟨State.B, Symbol.s1, .s0 :: .s1 :: upper,
            programRightCode processed ++
              List.replicate (carried + 1) .s0 ++
              RogozhinTagInput.dataCode program (second :: nextWord)⟩ =
        CProgramBoundary processed (.s1 :: .s0 :: .s1 :: upper) .s0
          (List.replicate carried .s0 ++
            RogozhinTagInput.dataCode program (second :: nextWord)) := by
    simpa [List.replicate_succ, List.append_assoc] using hbegin
  have hprogramScan := iterate_CProgramBoundary processed
    (.s1 :: .s0 :: .s1 :: upper) .s0
    (List.replicate carried .s0 ++
      RogozhinTagInput.dataCode program (second :: nextWord))
  let onesCount := carried + 1 +
    RogozhinTagInput.weight program second
  have hones := iterate_COnesBoundary onesCount
    (RogozhinTagInput.programCode program).reverse .s5
    (RogozhinTagInput.dataCode program nextWord)
  have hseparator := step_C_separator_to_next
    (List.replicate onesCount .s0 ++
      (RogozhinTagInput.programCode program).reverse)
    .s0
    (List.replicate
        (RogozhinTagInput.weight program next - 1) .s0 ++
      RogozhinTagInput.dataTail program (nextSecond :: nextRest))
  have hnextData :
      RogozhinTagInput.dataCode program nextWord =
        .s0 ::
          (List.replicate
              (RogozhinTagInput.weight program next - 1) .s0 ++
            RogozhinTagInput.dataTail program (nextSecond :: nextRest)) := by
    rw [hnextWord]
    obtain ⟨predecessor, hweight⟩ :=
      RogozhinTagInput.weight_is_succ program next
    simp [RogozhinTagInput.dataCode, RogozhinTagInput.ones,
      hweight, List.replicate_succ, List.append_assoc]
  have hdataScanShape :
      ⟨State.C, Symbol.s0,
        (RogozhinTagInput.programCode program).reverse,
        List.replicate carried .s0 ++
          RogozhinTagInput.dataCode program (second :: nextWord)⟩ =
      COnesBoundary onesCount
        (RogozhinTagInput.programCode program).reverse .s5
        (RogozhinTagInput.dataCode program nextWord) := by
    obtain ⟨secondPredecessor, hsecondWeight⟩ :=
      RogozhinTagInput.weight_is_succ program second
    rw [hnextWord]
    simp [onesCount, COnesBoundary, dataCode_cons_nonempty,
      hsecondWeight, List.replicate_succ,
      ← List.replicate_append_replicate, Nat.add_assoc,
      List.append_assoc]
  have hcompile :
      ⟨State.A, Symbol.s0,
        .s0 :: List.replicate onesCount .s0 ++
          (RogozhinTagInput.programCode program).reverse,
        List.replicate
            (RogozhinTagInput.weight program next - 1) .s0 ++
          RogozhinTagInput.dataTail program (nextSecond :: nextRest)⟩ =
      compileWithPadding program (onesCount + 1) nextWord := by
    rw [hnextWord, compileWithPadding_nonempty]
    simp [List.replicate_succ, List.append_assoc]
  change iterate
      (1 + (onesCount + (processed.length + 3))) _ = _
  rw [iterate_add 1 (onesCount + (processed.length + 3))]
  rw [iterate_add onesCount (processed.length + 3)]
  rw [iterate_add processed.length 3]
  rw [hbegin', hprogramScan]
  simp only [CProgramBoundary]
  rw [hleft, hdataScanShape, hones]
  simp only [COnesBoundary]
  rw [hnextData, iterate_succ, iterate_zero, hseparator]
  simpa [onesCount, Nat.add_assoc, List.append_assoc] using hcompile

/-- Exact third-sweep duration from terminal `b1b` to the next source boundary. -/
def thirdSweepFuel (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label) :
    List ProgramRightLetter → Nat
  | processed =>
      1 +
        ((RogozhinTagInput.weight program first + 1 +
            RogozhinTagInput.weight program second) +
          (processed.length + 3))

/--
The third sweep on its normalized structural boundary.  The three hypotheses
are literal representation facts: the processed program is nonempty, restoring
it reconstructs the whole printed program, and the returned tag word has the
two-symbol prefix guaranteed by a T2 production.
-/
theorem iterate_thirdSweep_core
    (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (nextWord : List RogozhinTagInput.Label)
    (processed : List ProgramRightLetter)
    (upper : List Symbol)
    (processedHead : ProgramRightLetter)
    (processedTail : List ProgramRightLetter)
    (next nextSecond : RogozhinTagInput.Label)
    (nextRest : List RogozhinTagInput.Label)
    (hprocessed : processed = processedHead :: processedTail)
    (hleft :
      (restoredProgramCode processed).reverse ++
          .s1 :: .s0 :: .s1 :: upper =
        (RogozhinTagInput.programCode program).reverse)
    (hnextWord : nextWord = next :: nextSecond :: nextRest) :
    iterate (thirdSweepFuel program first second processed)
        ⟨.B, .s1, .s0 :: .s1 :: upper,
          programRightCode processed ++
            List.replicate
                (RogozhinTagInput.weight program first + 1) .s0 ++
            RogozhinTagInput.dataCode program (second :: nextWord)⟩ =
      compileWithPadding program
        (RogozhinTagInput.weight program first + 1 +
          RogozhinTagInput.weight program second + 1)
        nextWord := by
  have hbegin := iterate_beginThirdSweep processedHead processedTail
    upper .s0
    (List.replicate (RogozhinTagInput.weight program first) .s0 ++
      RogozhinTagInput.dataCode program (second :: nextWord))
  rw [← hprocessed] at hbegin
  have hbegin' :
      iterate 3
          ⟨State.B, Symbol.s1, .s0 :: .s1 :: upper,
            programRightCode processed ++
              List.replicate
                  (RogozhinTagInput.weight program first + 1) .s0 ++
              RogozhinTagInput.dataCode program (second :: nextWord)⟩ =
        CProgramBoundary processed (.s1 :: .s0 :: .s1 :: upper) .s0
          (List.replicate (RogozhinTagInput.weight program first) .s0 ++
            RogozhinTagInput.dataCode program (second :: nextWord)) := by
    simpa [List.replicate_succ, List.append_assoc] using hbegin
  have hprogramScan := iterate_CProgramBoundary processed
    (.s1 :: .s0 :: .s1 :: upper) .s0
    (List.replicate (RogozhinTagInput.weight program first) .s0 ++
      RogozhinTagInput.dataCode program (second :: nextWord))
  let onesCount := RogozhinTagInput.weight program first + 1 +
    RogozhinTagInput.weight program second
  have hones := iterate_COnesBoundary onesCount
    (RogozhinTagInput.programCode program).reverse .s5
    (RogozhinTagInput.dataCode program nextWord)
  have hseparator := step_C_separator_to_next
    (List.replicate onesCount .s0 ++
      (RogozhinTagInput.programCode program).reverse)
    .s0
    (List.replicate
        (RogozhinTagInput.weight program next - 1) .s0 ++
      RogozhinTagInput.dataTail program (nextSecond :: nextRest))
  have hnextData :
      RogozhinTagInput.dataCode program nextWord =
        .s0 ::
          (List.replicate
              (RogozhinTagInput.weight program next - 1) .s0 ++
            RogozhinTagInput.dataTail program (nextSecond :: nextRest)) := by
    rw [hnextWord]
    obtain ⟨predecessor, hweight⟩ :=
      RogozhinTagInput.weight_is_succ program next
    simp [RogozhinTagInput.dataCode, RogozhinTagInput.ones,
      hweight, List.replicate_succ, List.append_assoc]
  have hdataScanShape :
      ⟨State.C, Symbol.s0,
        (RogozhinTagInput.programCode program).reverse,
        List.replicate (RogozhinTagInput.weight program first) .s0 ++
          RogozhinTagInput.dataCode program (second :: nextWord)⟩ =
      COnesBoundary onesCount
        (RogozhinTagInput.programCode program).reverse .s5
        (RogozhinTagInput.dataCode program nextWord) := by
    obtain ⟨firstPredecessor, hfirstWeight⟩ :=
      RogozhinTagInput.weight_is_succ program first
    obtain ⟨secondPredecessor, hsecondWeight⟩ :=
      RogozhinTagInput.weight_is_succ program second
    have hcount :
        firstPredecessor + (1 + (1 + secondPredecessor)) =
          (firstPredecessor + 1) + (secondPredecessor + 1) := by
      rw [← Nat.add_assoc, Nat.add_comm 1 secondPredecessor]
    rw [hnextWord]
    simp [onesCount, COnesBoundary, dataCode_cons_nonempty,
      hfirstWeight, hsecondWeight, List.replicate_succ,
      hcount, ← List.replicate_append_replicate, Nat.add_assoc,
      List.append_assoc]
    exact cons_replicate_zero_append firstPredecessor _
  have hcompile :
      ⟨State.A, Symbol.s0,
        .s0 :: List.replicate onesCount .s0 ++
          (RogozhinTagInput.programCode program).reverse,
        List.replicate
            (RogozhinTagInput.weight program next - 1) .s0 ++
          RogozhinTagInput.dataTail program (nextSecond :: nextRest)⟩ =
      compileWithPadding program (onesCount + 1) nextWord := by
    rw [hnextWord, compileWithPadding_nonempty]
    simp [List.replicate_succ, List.append_assoc]
  change iterate
      (1 + (onesCount + (processed.length + 3))) _ = _
  rw [iterate_add 1 (onesCount + (processed.length + 3))]
  rw [iterate_add onesCount (processed.length + 3)]
  rw [iterate_add processed.length 3]
  rw [hbegin', hprogramScan]
  simp only [CProgramBoundary]
  rw [hleft, hdataScanShape, hones]
  simp only [COnesBoundary]
  rw [hnextData, iterate_succ, iterate_zero, hseparator]
  simpa [onesCount, Nat.add_assoc, List.append_assoc] using hcompile

/--
Complete unbounded third sweep.  It restores the literal program, crosses the
finite audit prefix and the deleted second data block, removes exactly the
next separator, and returns the literal encoding of the deletion-two result
with a new unary audit prefix.
-/
theorem iterate_thirdSweep
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++
        selectedProgramRight program first
    let processed :=
      outputFinishProcessed program
        (.mark :: .mark :: afterDifference) distinguished payload
    let nextWord := rest ++ RogozhinTagInput.productionAt program first
    let nextPadding :=
      RogozhinTagInput.weight program first + 1 +
        RogozhinTagInput.weight program second + 1
    iterate (thirdSweepFuel program first second processed)
        ⟨.B, .s1, .s0 :: .s1 ::
            (upperProgramCode program (first + 1)).reverse,
          programRightCode processed ++
            List.replicate
                (RogozhinTagInput.weight program first + 1) .s0 ++
            RogozhinTagInput.dataCode program
                (second ::
                  ((rest ++ [distinguished]) ++
                    outputCompleted distinguished payload)) ++ [.s5] ++
            List.replicate
              (RogozhinTagInput.weight program
                (outputLast distinguished payload)) .s0⟩ =
      compileWithPadding program nextPadding nextWord := by
  dsimp only
  let distinguished := RogozhinTagInput.distinguished program
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let difference :=
    RogozhinTagInput.weight program distinguished -
      RogozhinTagInput.weight program first
  let afterDifference :=
    List.replicate difference .unary ++
      selectedProgramRight program first
  let processed := outputFinishProcessed program
    (.mark :: .mark :: afterDifference) distinguished payload
  let nextWord := rest ++ RogozhinTagInput.productionAt program first
  have hdata := selectedProductionData_eq
    program hT2 first second rest hfirst
  have hrestored := restored_selectedProductionProgram
    program hT2 first hfirst
  have hprogramSplit := programCode_eq_upper_append_lower
    program (first + 1) hfirst
  have hdata' :
      RogozhinTagInput.dataCode program
            (second ::
              ((rest ++ [distinguished]) ++
                outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast distinguished payload)) .s0 =
        RogozhinTagInput.dataCode program (second :: nextWord) := by
    simpa [distinguished, payload, nextWord] using hdata
  have hrestored' :
      [.s1, .s0, .s1] ++ restoredProgramCode processed =
        lowerProgramCode program (first + 1) := by
    simpa [processed, afterDifference, difference, payload,
      distinguished] using hrestored
  have hleft :
      (restoredProgramCode processed).reverse ++
          .s1 :: .s0 :: .s1 ::
            (upperProgramCode program (first + 1)).reverse =
        (RogozhinTagInput.programCode program).reverse := by
    have hreverse := congrArg List.reverse hrestored'
    simp only [List.reverse_append, List.reverse_cons, List.reverse_nil,
      List.nil_append] at hreverse
    rw [hprogramSplit, List.reverse_append, ← hreverse]
    simp [List.reverse_append, List.append_assoc]
  obtain ⟨processedHead, processedTail, hprocessed⟩ :=
    outputFinishProcessed_nonempty program
      (.mark :: .mark :: afterDifference) distinguished payload
  obtain ⟨next, nextSecond, nextRest, hnextWord⟩ :=
    nextTagWord_two_prefix program hT2 first rest hfirst
  have hnextWord' : nextWord = next :: nextSecond :: nextRest := by
    simpa [nextWord] using hnextWord
  have hprocessed' : processed = processedHead :: processedTail := by
    simpa [processed] using hprocessed
  have hcore := iterate_thirdSweep_core program first second nextWord
    processed (upperProgramCode program (first + 1)).reverse
    processedHead processedTail next nextSecond nextRest
    hprocessed' hleft hnextWord'
  simp only [List.append_assoc]
  simp only [List.append_assoc] at hdata'
  rw [hdata']
  simpa only [processed, nextWord, List.append_assoc] using hcore

/-- Complete literal third sweep with an arbitrary carried audit prefix. -/
theorem iterate_thirdSweep_withCarry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (carried : Nat)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++
        selectedProgramRight program first
    let processed :=
      outputFinishProcessed program
        (.mark :: .mark :: afterDifference) distinguished payload
    let nextWord := rest ++ RogozhinTagInput.productionAt program first
    iterate
        (thirdSweepFuelWithCarry program carried second processed)
        ⟨.B, .s1, .s0 :: .s1 ::
            (upperProgramCode program (first + 1)).reverse,
          programRightCode processed ++
            List.replicate (carried + 1) .s0 ++
            RogozhinTagInput.dataCode program
                (second ::
                  ((rest ++ [distinguished]) ++
                    outputCompleted distinguished payload)) ++ [.s5] ++
            List.replicate
              (RogozhinTagInput.weight program
                (outputLast distinguished payload)) .s0⟩ =
      compileWithPadding program
        (carried + 1 + RogozhinTagInput.weight program second + 1)
        nextWord := by
  dsimp only
  let distinguished := RogozhinTagInput.distinguished program
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let difference :=
    RogozhinTagInput.weight program distinguished -
      RogozhinTagInput.weight program first
  let afterDifference :=
    List.replicate difference .unary ++
      selectedProgramRight program first
  let processed := outputFinishProcessed program
    (.mark :: .mark :: afterDifference) distinguished payload
  let nextWord := rest ++ RogozhinTagInput.productionAt program first
  have hdata := selectedProductionData_eq
    program hT2 first second rest hfirst
  have hrestored := restored_selectedProductionProgram
    program hT2 first hfirst
  have hprogramSplit := programCode_eq_upper_append_lower
    program (first + 1) hfirst
  have hdata' :
      RogozhinTagInput.dataCode program
            (second ::
              ((rest ++ [distinguished]) ++
                outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast distinguished payload)) .s0 =
        RogozhinTagInput.dataCode program (second :: nextWord) := by
    simpa [distinguished, payload, nextWord] using hdata
  have hrestored' :
      [.s1, .s0, .s1] ++ restoredProgramCode processed =
        lowerProgramCode program (first + 1) := by
    simpa [processed, afterDifference, difference, payload,
      distinguished] using hrestored
  have hleft :
      (restoredProgramCode processed).reverse ++
          .s1 :: .s0 :: .s1 ::
            (upperProgramCode program (first + 1)).reverse =
        (RogozhinTagInput.programCode program).reverse := by
    have hreverse := congrArg List.reverse hrestored'
    simp only [List.reverse_append, List.reverse_cons, List.reverse_nil,
      List.nil_append] at hreverse
    rw [hprogramSplit, List.reverse_append, ← hreverse]
    simp [List.reverse_append, List.append_assoc]
  obtain ⟨processedHead, processedTail, hprocessed⟩ :=
    outputFinishProcessed_nonempty program
      (.mark :: .mark :: afterDifference) distinguished payload
  obtain ⟨next, nextSecond, nextRest, hnextWord⟩ :=
    nextTagWord_two_prefix program hT2 first rest hfirst
  have hnextWord' : nextWord = next :: nextSecond :: nextRest := by
    simpa [nextWord] using hnextWord
  have hprocessed' : processed = processedHead :: processedTail := by
    simpa [processed] using hprocessed
  have hcore := iterate_thirdSweep_coreWithCarry program carried second
    nextWord processed (upperProgramCode program (first + 1)).reverse
    processedHead processedTail next nextSecond nextRest
    hprocessed' hleft hnextWord'
  simp only [List.append_assoc]
  simp only [List.append_assoc] at hdata'
  rw [hdata']
  simpa only [processed, nextWord, List.append_assoc] using hcore

/-! ## Complete nonhalting deletion-two macro -/

def selectedFinalProcessed (program : RogozhinTagInput.Program)
    (first : RogozhinTagInput.Label) : List ProgramRightLetter :=
  let distinguished := RogozhinTagInput.distinguished program
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let difference :=
    RogozhinTagInput.weight program distinguished -
      RogozhinTagInput.weight program first
  let afterDifference :=
    List.replicate difference .unary ++
      selectedProgramRight program first
  outputFinishProcessed program
    (.mark :: .mark :: afterDifference) distinguished payload

/-- Exact duration of one complete nonhalting T2 step at a padded boundary. -/
def nonhaltingMacroFuel (program : RogozhinTagInput.Program)
    (padding : Nat) (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  let carried := RogozhinTagInput.weight program first + padding
  let extraOnes := carried + 1
  thirdSweepFuelWithCarry program carried second
      (selectedFinalProcessed program first) +
    (selectorAndProductionFuelWithCarry
        program first second rest extraOnes +
      (secondSweepToProgramFuelWithCarry
          program carried second rest +
        firstSweepFuel []
          (paddedProgramGaps program first padding)))

/--
One complete unbounded nonhalting T2 macro.  This is an endpoint theorem only;
the phase-indexed no-premature-halt invariant is stated separately below.
-/
theorem iterate_compileWithPadding_nonhaltingMacro
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let nextWord := rest ++ RogozhinTagInput.productionAt program first
    let nextPadding :=
      RogozhinTagInput.weight program first + padding + 1 +
        RogozhinTagInput.weight program second + 1
    iterate
        (nonhaltingMacroFuel program padding first second rest)
        (compileWithPadding program padding (first :: second :: rest)) =
      compileWithPadding program nextPadding nextWord := by
  dsimp only
  let carried := RogozhinTagInput.weight program first + padding
  let extraOnes := carried + 1
  have hfirstSweep := iterate_compileWithPadding_firstSweep
    program hT2 padding first second rest (Nat.le_of_lt hfirst)
  have hfirstSweep' :
      iterate
          (firstSweepFuel []
            (paddedProgramGaps program first padding))
          (compileWithPadding program padding (first :: second :: rest)) =
        ⟨State.A, Symbol.s5,
          List.replicate carried .s4 ++
            markedNear (programGaps program first) ++
            (upperProgramCode program first).reverse,
          followingData program second rest⟩ := by
    simpa [carried, List.replicate_append_replicate,
      List.append_assoc] using hfirstSweep
  have hsecondSweep := iterate_secondSweep_toProgram_withCarry
    program first second rest carried
  have hselector := iterate_selectorAndProduction_withCarry
    program hT2 first second rest extraOnes hfirst
  have hthird := iterate_thirdSweep_withCarry
    program hT2 carried first second rest hfirst
  unfold nonhaltingMacroFuel
  change iterate
      (thirdSweepFuelWithCarry program carried second
          (selectedFinalProcessed program first) +
        (selectorAndProductionFuelWithCarry
            program first second rest extraOnes +
          (secondSweepToProgramFuelWithCarry
              program carried second rest +
            firstSweepFuel []
              (paddedProgramGaps program first padding)))) _ = _
  rw [iterate_add
    (thirdSweepFuelWithCarry program carried second
      (selectedFinalProcessed program first))]
  rw [iterate_add
    (selectorAndProductionFuelWithCarry
      program first second rest extraOnes)]
  rw [iterate_add
    (secondSweepToProgramFuelWithCarry program carried second rest)]
  rw [hfirstSweep', hsecondSweep, hselector]
  change iterate
      (thirdSweepFuelWithCarry program carried second
        (selectedFinalProcessed program first)) _ = _
  simpa [selectedFinalProcessed, carried, extraOnes,
    Nat.add_assoc] using hthird

/-! ## Phase-indexed no-premature-halt certificates -/

/-- Every configuration through the stated inclusive horizon is nonhalting. -/
def SafeThrough (fuel : Nat) (start : Config) : Prop :=
  ∀ k, k ≤ fuel → ¬ Halted (iterate k start)

theorem stateA_not_halted (current : Symbol)
    (left right : List Symbol) :
    ¬ Halted ⟨State.A, current, left, right⟩ := by
  rw [halted_iff]
  simp

theorem stateB_not_halted (current : Symbol)
    (left right : List Symbol) :
    ¬ Halted ⟨State.B, current, left, right⟩ := by
  rw [halted_iff]
  simp

theorem compileWithPadding_not_halted
    (program : RogozhinTagInput.Program) (padding : Nat)
    (word : List RogozhinTagInput.Label) :
    ¬ Halted (compileWithPadding program padding word) := by
  unfold compileWithPadding
  cases RogozhinTagInput.dataCode program word with
  | nil => exact stateA_not_halted _ _ _
  | cons current right => exact stateA_not_halted _ _ _

/--
For the absorbing machine semantics, a nonhalting exact endpoint certifies
every earlier point.  If a prefix halted, all later iterates would be frozen at
that same halting configuration.
-/
theorem safeThrough_of_endpoint_not_halted
    (fuel : Nat) (start endpoint : Config)
    (hrun : iterate fuel start = endpoint)
    (hendpoint : ¬ Halted endpoint) :
    SafeThrough fuel start := by
  intro k hk hhalt
  have hfinal : iterate fuel start = iterate k start := by
    rw [← Nat.sub_add_cancel hk, iterate_add,
      iterate_of_halted hhalt]
  apply hendpoint
  rw [← hrun, hfinal]
  exact hhalt

/-- Inclusive safety certificate for the complete padded first sweep. -/
theorem safeThrough_compileWithPadding_firstSweep
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (label second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hlabel : label ≤ RogozhinTagInput.symbolCount program) :
    SafeThrough
      (firstSweepFuel [] (paddedProgramGaps program label padding))
      (compileWithPadding program padding (label :: second :: rest)) := by
  apply safeThrough_of_endpoint_not_halted
    (endpoint :=
      ⟨State.A, .s5,
        List.replicate (RogozhinTagInput.weight program label) .s4 ++
          List.replicate padding .s4 ++
          markedNear (programGaps program label) ++
          (upperProgramCode program label).reverse,
        followingData program second rest⟩)
  · exact iterate_compileWithPadding_firstSweep
      program hT2 padding label second rest hlabel
  · exact stateA_not_halted _ _ _

/-- Inclusive safety certificate for the D/B/C carried-prefix sweep. -/
theorem safeThrough_secondSweep_toProgram_withCarry
    (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (carried : Nat) :
    SafeThrough
      (secondSweepToProgramFuelWithCarry program carried second rest)
      ⟨.A, .s5,
        List.replicate carried .s4 ++
          markedNear (programGaps program first) ++
          (upperProgramCode program first).reverse,
        followingData program second rest⟩ := by
  apply safeThrough_of_endpoint_not_halted
    (endpoint :=
      ⟨State.B, .s2,
        markedNear (programGapTail program first) ++
          (upperProgramCode program first).reverse,
        List.replicate (carried + 1) .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩)
  · exact iterate_secondSweep_toProgram_withCarry
      program first second rest carried
  · exact stateB_not_halted _ _ _

/-- Inclusive safety certificate for selector plus selected production. -/
theorem safeThrough_selectorAndProduction_withCarry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    SafeThrough
      (selectorAndProductionFuelWithCarry
        program first second rest extraOnes)
      ⟨.B, .s2,
        markedNear (programGapTail program first) ++
          (upperProgramCode program first).reverse,
        List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ := by
  have hrun := iterate_selectorAndProduction_withCarry
    program hT2 first second rest extraOnes hfirst
  dsimp only at hrun
  apply safeThrough_of_endpoint_not_halted
    (endpoint :=
      ⟨State.B, Symbol.s1,
        .s0 :: .s1 ::
          (upperProgramCode program (first + 1)).reverse,
        programRightCode
            (outputFinishProcessed program
              (.mark :: .mark ::
                (List.replicate
                    (RogozhinTagInput.weight program
                        (RogozhinTagInput.distinguished program) -
                      RogozhinTagInput.weight program first) .unary ++
                  selectedProgramRight program first))
              (RogozhinTagInput.distinguished program)
              ((RogozhinTagInput.productionAt program first).drop 2)) ++
          List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program
              (second ::
                ((rest ++ [RogozhinTagInput.distinguished program]) ++
                  outputCompleted
                    (RogozhinTagInput.distinguished program)
                    ((RogozhinTagInput.productionAt program first).drop 2))) ++
            [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast
                (RogozhinTagInput.distinguished program)
                ((RogozhinTagInput.productionAt program first).drop 2))) .s0⟩)
  · exact hrun
  · exact stateB_not_halted _ _ _

/-- Inclusive safety certificate for the literal carried third sweep. -/
theorem safeThrough_thirdSweep_withCarry
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (carried : Nat)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let difference :=
      RogozhinTagInput.weight program distinguished -
        RogozhinTagInput.weight program first
    let afterDifference :=
      List.replicate difference .unary ++
        selectedProgramRight program first
    let processed :=
      outputFinishProcessed program
        (.mark :: .mark :: afterDifference) distinguished payload
    SafeThrough
      (thirdSweepFuelWithCarry program carried second processed)
      ⟨.B, .s1, .s0 :: .s1 ::
          (upperProgramCode program (first + 1)).reverse,
        programRightCode processed ++
          List.replicate (carried + 1) .s0 ++
          RogozhinTagInput.dataCode program
              (second ::
                ((rest ++ [distinguished]) ++
                  outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate
            (RogozhinTagInput.weight program
              (outputLast distinguished payload)) .s0⟩ := by
  dsimp only
  have hrun := iterate_thirdSweep_withCarry
    program hT2 carried first second rest hfirst
  dsimp only at hrun
  apply safeThrough_of_endpoint_not_halted
    (endpoint := compileWithPadding program
      (carried + 1 + RogozhinTagInput.weight program second + 1)
      (rest ++ RogozhinTagInput.productionAt program first))
  · exact hrun
  · exact compileWithPadding_not_halted _ _ _

/--
Inclusive no-premature-halt theorem for a whole nonhalting source macro.  In
particular it excludes both `(C,s3)` and `(D,s3)` at every strict prefix.
-/
theorem safeThrough_compileWithPadding_nonhaltingMacro
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    SafeThrough
      (nonhaltingMacroFuel program padding first second rest)
      (compileWithPadding program padding (first :: second :: rest)) := by
  have hrun := iterate_compileWithPadding_nonhaltingMacro
    program hT2 padding first second rest hfirst
  dsimp only at hrun
  apply safeThrough_of_endpoint_not_halted
    (endpoint := compileWithPadding program
      (RogozhinTagInput.weight program first + padding + 1 +
        RogozhinTagInput.weight program second + 1)
      (rest ++ RogozhinTagInput.productionAt program first))
  · exact hrun
  · exact compileWithPadding_not_halted _ _ _

end RogozhinT2Simulation

end PureSFormal.Computation
