import PureSFormal.Computation.RogozhinT2BoundaryReadback
import PureSFormal.Computation.RogozhinT2Cook
import PureSFormal.Cook.PassDecoder

/-!
# Structural readback of Rogozhin's immutable program region

The program region uses a leading halting delimiter, a sequence of production
frames, and one final separator. Within each frame, doubled separators delimit
unary exponents; the next frame starts with a single separator followed by the
unary symbol. The parser follows these literal delimiters with structural fuel
equal to the input length.

The first inverse recovers every printed exponent frame. This retains the
weights needed by the tag-word observer without assuming that arbitrary
primitive instruction tables are recoverable from their compiled behavior.
-/

namespace PureSFormal.Computation.RogozhinProgramReadback

open RogozhinTagInput

abbrev Symbol := Rogozhin46.Symbol

def frameCode (exponents : List Nat) : List Symbol :=
  [.s1, .s0] ++ exponentCode exponents

def framesCode (frames : List (List Nat)) : List Symbol :=
  frames.flatMap frameCode ++ [.s1]

def BoundarySuffix (suffix : List Symbol) : Prop :=
  suffix = [.s1] ∨ ∃ tail, suffix = .s1 :: .s0 :: tail

/-- Read one exponent and each following doubled-separator exponent. -/
def parseExponentsAux (width : Nat) : List Symbol → List Nat × List Symbol
  | .s0 :: rest => parseExponentsAux (width + 1) rest
  | .s1 :: .s1 :: rest =>
      let parsed := parseExponentsAux 0 rest
      (width :: parsed.1, parsed.2)
  | rest => ([width], rest)

theorem parseExponentsAux_boundary (width : Nat) (suffix : List Symbol)
    (boundary : BoundarySuffix suffix) :
    parseExponentsAux width suffix = ([width], suffix) := by
  rcases boundary with rfl | ⟨tail, rfl⟩ <;> rfl

theorem parseExponentsAux_ones (count width : Nat) (rest : List Symbol) :
    parseExponentsAux width (ones count ++ rest) =
      parseExponentsAux (width + count) rest := by
  induction count generalizing width with
  | zero => rfl
  | succ count ih =>
      change parseExponentsAux (width + 1) (ones count ++ rest) = _
      rw [ih, Nat.add_assoc, Nat.add_comm 1 count]

def exponentTail (exponents : List Nat) : List Symbol :=
  exponents.flatMap fun width => [.s1, .s1] ++ ones width

theorem parseExponentsAux_tail (exponents : List Nat) (width : Nat)
    (suffix : List Symbol) (boundary : BoundarySuffix suffix) :
    parseExponentsAux width (exponentTail exponents ++ suffix) =
      (width :: exponents, suffix) := by
  induction exponents generalizing width with
  | nil => exact parseExponentsAux_boundary width suffix boundary
  | cons exponent exponents ih =>
      change (width :: (parseExponentsAux 0
        ((ones exponent ++ exponentTail exponents) ++ suffix)).1,
        (parseExponentsAux 0
          ((ones exponent ++ exponentTail exponents) ++ suffix)).2) = _
      simp only [List.append_assoc, parseExponentsAux_ones, Nat.zero_add, ih]

/-- Parse one production frame, returning its unconsumed following delimiter. -/
def parseFrame? : List Symbol → Option (List Nat × List Symbol)
  | .s1 :: .s0 :: .s1 :: rest => some (parseExponentsAux 0 rest)
  | _ => none

theorem parseFrame?_frameCode (first : Nat) (rest : List Nat)
    (suffix : List Symbol) (boundary : BoundarySuffix suffix) :
    parseFrame? (frameCode (first :: rest) ++ suffix) = some (first :: rest, suffix) := by
  change some (parseExponentsAux 0
    ((ones first ++ exponentTail rest) ++ suffix)) = _
  rw [List.append_assoc, parseExponentsAux_ones, Nat.zero_add,
    parseExponentsAux_tail rest first suffix boundary]

theorem framesCode_boundary (frames : List (List Nat)) :
    BoundarySuffix (framesCode frames) := by
  cases frames with
  | nil => exact Or.inl rfl
  | cons first rest =>
      refine Or.inr ⟨exponentCode first ++ framesCode rest, ?_⟩
      simp only [framesCode, List.flatMap_cons, frameCode, List.cons_append,
        List.nil_append, List.append_assoc]

theorem framesCode_cons (first : List Nat) (rest : List (List Nat)) :
    framesCode (first :: rest) = frameCode first ++ framesCode rest := by
  exact List.append_assoc _ _ _

theorem framesCode_cons_ne_separator (first : List Nat) (rest : List (List Nat)) :
    framesCode (first :: rest) ≠ [.s1] := by
  rw [framesCode_cons]
  intro equal
  have tails := (List.cons.inj equal).2
  cases tails

/-- A finite frame parser whose only recursion bound is input length. -/
def parseFramesAux : Nat → List Symbol → Option (List (List Nat))
  | 0, cells => if cells = [.s1] then some [] else none
  | fuel + 1, cells =>
      if cells = [.s1] then some [] else
        (parseFrame? cells).bind fun parsed =>
          (parseFramesAux fuel parsed.2).map (List.cons parsed.1)

def FramesNonempty (frames : List (List Nat)) : Prop :=
  ∀ frame, frame ∈ frames → frame ≠ []

theorem parseFramesAux_framesCode (frames : List (List Nat))
    (nonempty : FramesNonempty frames) (fuel : Nat) (enough : frames.length ≤ fuel) :
    parseFramesAux fuel (framesCode frames) = some frames := by
  induction frames generalizing fuel with
  | nil => cases fuel <;> rfl
  | cons first rest ih =>
      cases fuel with
      | zero => exact False.elim (Nat.not_succ_le_zero _ enough)
      | succ fuel =>
          have firstNonempty := nonempty first (List.Mem.head _)
          have restNonempty : FramesNonempty rest :=
            fun frame member => nonempty frame (List.Mem.tail first member)
          cases first with
          | nil => exact False.elim (firstNonempty rfl)
          | cons exponent exponents =>
              rw [parseFramesAux, if_neg (framesCode_cons_ne_separator _ _),
                framesCode_cons, parseFrame?_frameCode _ _ _ (framesCode_boundary rest)]
              change (parseFramesAux fuel (framesCode rest)).map
                (List.cons (exponent :: exponents)) = _
              rw [ih restNonempty fuel (Nat.le_of_succ_le_succ enough)]
              rfl

theorem frames_length_le_code_length (frames : List (List Nat)) :
    frames.length ≤ (framesCode frames).length := by
  induction frames with
  | nil => exact Nat.zero_le _
  | cons first rest ih =>
      rw [List.length_cons, framesCode_cons, List.length_append]
      have oneLe : 1 ≤ (frameCode first).length := by
        rw [frameCode, List.length_append]
        change 1 ≤ 2 + (exponentCode first).length
        exact Nat.le_trans (by decide : 1 ≤ 2) (Nat.le_add_right _ _)
      have summed := Nat.add_le_add_right oneLe (framesCode rest).length
      rw [Nat.add_comm 1 (framesCode rest).length] at summed
      exact Nat.le_trans (Nat.succ_le_succ ih) summed

/-- Recover all production exponents in their printed, descending-label order. -/
def parseProgram? : List Symbol → Option (List (List Nat))
  | .s3 :: .s1 :: rest => parseFramesAux rest.length rest
  | _ => none

def programFrames (program : Program) : List (List Nat) :=
  (List.range (symbolCount program)).reverse.map (productionExponents program)

theorem frameCode_productionExponents (program : Program) (label : Label) :
    frameCode (productionExponents program label) = productionCode program label := rfl

theorem flatMap_frameCode_map (program : Program) (labels : List Label) :
    (labels.map (productionExponents program)).flatMap frameCode =
      labels.flatMap (productionCode program) := by
  induction labels with
  | nil => rfl
  | cons first rest ih =>
      rw [List.map_cons, List.flatMap_cons, List.flatMap_cons,
        frameCode_productionExponents, ih]

theorem programCode_frames (program : Program) :
    programCode program = .s3 :: .s1 :: framesCode (programFrames program) := by
  unfold programCode haltingCode separatorCode framesCode programFrames
  rw [flatMap_frameCode_map]
  rfl

theorem productionExponents_ne_nil (program : Program) (label : Label) :
    productionExponents program label ≠ [] := by
  intro empty
  have lastMember : weight program (distinguished program) - weight program label ∈
      productionExponents program label :=
    List.mem_append_right _ (List.Mem.tail _ (List.Mem.head _))
  rw [empty] at lastMember
  cases lastMember

theorem programFrames_nonempty (program : Program) : FramesNonempty (programFrames program) := by
  have go : ∀ labels : List Label,
      FramesNonempty (labels.map (productionExponents program)) := by
    intro labels
    induction labels with
    | nil => intro frame member; cases member
    | cons label labels ih =>
        intro frame member
        rcases List.mem_cons.mp member with equal | inRest
        · rw [equal]
          exact productionExponents_ne_nil program label
        · exact ih frame inRest
  exact go _

/-- Exact inversion of the immutable program region's complete frame syntax. -/
theorem parseProgram?_programCode (program : Program) :
    parseProgram? (programCode program) = some (programFrames program) := by
  rw [programCode_frames, parseProgram?]
  exact parseFramesAux_framesCode (programFrames program) (programFrames_nonempty program)
    _ (frames_length_le_code_length _)

/-- Read the immutable exponent frames from the existing literal seed bits. -/
def parseSeedFrames? (bits : List Bool) : Option (List (List Nat)) := do
  let word ← Cook.decodeWord? bits
  let configuration ← Cook.decodeCanonical? word
  parseProgram? configuration.left.reverse

theorem compile_left_reverse (job : Job) :
    (compile job).left.reverse = programCode job.program := by
  unfold compile
  cases dataCode job.program job.word <;> exact List.reverse_reverse _

/-- The seed parser has no program input and recovers every printed frame of
the actual existing compiled seed, including its outer delimiters. -/
theorem parseSeedFrames?_encodeBits (job : Job) :
    parseSeedFrames? (RogozhinT2Cook.encodeBits job) = some (programFrames job.program) := by
  unfold parseSeedFrames? RogozhinT2Cook.encodeBits
  rw [Cook.decodeWord?_encodeWord]
  change (Cook.decodeCanonical? (Cook.PassClassification.canonicalWord (compile job))).bind
    (fun configuration => parseProgram? configuration.left.reverse) = _
  rw [Cook.decodeCanonical?_canonicalWord]
  change parseProgram? (compile job).left.reverse = _
  rw [compile_left_reverse, parseProgram?_programCode]

end PureSFormal.Computation.RogozhinProgramReadback
