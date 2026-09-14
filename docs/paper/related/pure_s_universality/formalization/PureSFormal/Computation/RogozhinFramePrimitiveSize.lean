import PureSFormal.Computation.RogozhinSeedPrimitive

/-!
# Literal size of the recovered seed context

The measure includes each exponent's unary successors, each exponent-list
cell, and each frame-list cell. Every successful parse bounds this complete
measure by the consumed symbol input, even for malformed near-matches. These
bounds connect subsequent context-processing costs to the original bitword.
-/

namespace PureSFormal.Computation.RogozhinFramePrimitiveSize

open RogozhinFramePrimitive

def exponentSize : List Nat → Nat
  | [] => 0
  | first :: rest => first + 1 + exponentSize rest

def contextSize : List (List Nat) → Nat
  | [] => 0
  | first :: rest => 1 + exponentSize first + contextSize rest

theorem exponents_size (width : Nat) (cells : List Symbol) :
    exponentSize (exponents width cells).value.1 +
      (exponents width cells).value.2.length ≤ width + cells.length + 1 := by
  fun_induction exponents width cells
  · next width rest inner ih =>
      change exponentSize (exponents (Nat.succ width) rest).value.1 +
        (exponents (Nat.succ width) rest).value.2.length ≤ _
      simpa only [List.length_cons, Nat.succ_add, Nat.add_succ] using ih
  · next width rest inner ih =>
      change width + 1 + exponentSize (exponents 0 rest).value.1 +
        (exponents 0 rest).value.2.length ≤ _
      have bound := Nat.le_trans (Nat.add_le_add_left ih (width + 1)) (Nat.le_succ _)
      simpa only [List.length_cons, Nat.zero_add, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm] using! bound
  · next rest excludedZero excludedSeparator =>
      simp_all only [exponents, exponentSize, Nat.add_zero, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm, Nat.le_refl]

theorem frame_size {cells : List Symbol} {parsed : List Nat × List Symbol}
    (accepted : (frame cells).value = some parsed) :
    1 + exponentSize parsed.1 + parsed.2.length ≤ cells.length := by
  unfold frame at accepted
  split at accepted
  · next rest =>
      change some (exponents 0 rest).value = some parsed at accepted
      cases accepted
      have bound := exponents_size 0 rest
      have expanded := Nat.le_trans (Nat.add_le_add_left bound 1) (Nat.le_succ _)
      simpa only [List.length_cons, Nat.zero_add, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm] using expanded
  · cases accepted

theorem frames_size (fuel : Nat) (cells : List Symbol) (parsed : List (List Nat))
    (accepted : (frames fuel cells).value = some parsed) :
    contextSize parsed ≤ cells.length := by
  rw [frames_value] at accepted
  induction fuel generalizing cells parsed with
  | zero =>
      unfold RogozhinProgramReadback.parseFramesAux at accepted
      split at accepted
      · cases accepted; exact Nat.zero_le _
      · cases accepted
  | succ fuel ih =>
      unfold RogozhinProgramReadback.parseFramesAux at accepted
      split at accepted
      · cases accepted; exact Nat.zero_le _
      · cases firstFound : RogozhinProgramReadback.parseFrame? cells with
        | none => simp only [firstFound, Option.bind_none] at accepted; cases accepted
        | some first =>
            simp only [firstFound, Option.bind_some] at accepted
            change (RogozhinProgramReadback.parseFramesAux fuel first.2).map
              (List.cons first.1) = some parsed at accepted
            cases restFound : RogozhinProgramReadback.parseFramesAux fuel first.2 with
            | none => rw [restFound] at accepted; cases accepted
            | some rest =>
                rw [restFound] at accepted
                cases accepted
                have firstBound := frame_size ((frame_value cells).trans firstFound)
                have restBound := ih first.2 rest restFound
                change 1 + exponentSize first.1 + contextSize rest ≤ _
                exact Nat.le_trans (Nat.add_le_add_left restBound (1 + exponentSize first.1)) firstBound

theorem program_size (cells : List Symbol) (parsed : List (List Nat))
    (accepted : (program cells).value = some parsed) :
    contextSize parsed ≤ cells.length := by
  unfold program at accepted
  split at accepted
  · next rest =>
      change (frames (fuelLength rest).value rest).value = some parsed at accepted
      have bound := frames_size (fuelLength rest).value rest parsed accepted
      exact Nat.le_trans bound (Nat.le_trans (Nat.le_succ _) (Nat.le_succ _))
  · cases accepted

theorem seedBody_size (word : List Cook.TagSymbol) (parsed : List (List Nat))
    (accepted : (RogozhinSeedPrimitive.seedBody word).value = some parsed) :
    contextSize parsed ≤ word.length := by
  rw [RogozhinSeedPrimitive.seedBody_value] at accepted
  cases configFound : Cook.decodeCanonical? word with
  | none => simp only [configFound, Option.bind_none] at accepted; cases accepted
  | some config =>
      simp only [configFound, Option.bind_some] at accepted
      have bound := program_size config.left.reverse parsed
        ((program_value config.left.reverse).trans accepted)
      rw [List.length_reverse] at bound
      have fields := CookBoundaryPrimitive.canonical_fields word config
        ((CookBoundaryPrimitive.canonical_value word).trans configFound)
      exact Nat.le_trans bound fields.1

theorem seed_size (bits : List Bool) (parsed : List (List Nat))
    (accepted : (RogozhinSeedPrimitive.parse bits).value = some parsed) :
    contextSize parsed ≤ bits.length := by
  unfold RogozhinSeedPrimitive.parse at accepted
  rw [PureS.ParserRoutePrimitive.andThen_value] at accepted
  cases wordFound : (CookWordPrimitive.parse bits).value with
  | none => simp only [wordFound, Option.bind_none] at accepted; cases accepted
  | some word =>
      simp only [wordFound, Option.bind_some] at accepted
      exact Nat.le_trans (seedBody_size word parsed accepted)
        (CookPassPrimitive.word_length_le bits word wordFound)

theorem context_size (bits : List Bool) (parsed : CookSeedReadbackContext.Context)
    (accepted : (RogozhinSeedPrimitive.context bits).value = some parsed) :
    contextSize parsed.frames ≤ bits.length := by
  unfold RogozhinSeedPrimitive.context at accepted
  rw [PureS.ParserRoutePrimitive.andThen_value] at accepted
  cases framesFound : (RogozhinSeedPrimitive.parse bits).value with
  | none => simp only [framesFound, Option.bind_none] at accepted; cases accepted
  | some frames =>
      simp only [framesFound, Option.bind_some] at accepted
      cases accepted
      exact seed_size bits frames framesFound

end PureSFormal.Computation.RogozhinFramePrimitiveSize
