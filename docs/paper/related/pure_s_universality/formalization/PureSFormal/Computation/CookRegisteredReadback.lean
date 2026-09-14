import PureSFormal.Cook.PassDecoder
import PureSFormal.Computation.RogozhinT2BoundaryReadback

/-!
# Literal registered-boundary readback from the Cook CTS

Canonical and arrival words have disjoint checked parsers. Their sum therefore
recovers a registered machine configuration without a machine-step count. The
snapshot decoder receives only the current CTS configuration. The tag decoder
additionally receives the fixed finite tag program.

These are boundary readback theorems: they do not classify arbitrary accepted
snapshots as reachable checkpoints, nor recover data already erased by an
upstream halting encoding.
-/

namespace PureSFormal.Computation.CookRegisteredReadback

open Cook Cook.PassClassification RogozhinTagInput RogozhinT2Simulation

/-- Checked syntactic choice between the canonical and arrival codecs. -/
def decodeRegisteredWord? (word : List TagSymbol) : Option MachineConfig :=
  match decodeCanonical? word with
  | some config => some config
  | none => (decodeArrival? word).map DecodedArrival.config

theorem decodeRegisteredWord?_registered (config : MachineConfig)
    (boundary : RegisteredBoundary config) :
    decodeRegisteredWord? (registeredWord config boundary) = some config := by
  cases boundary with
  | canonical =>
      rw [registeredWord, decodeRegisteredWord?, decodeCanonical?_canonicalWord]
  | arrival direction origin valid =>
      rw [registeredWord, decodeRegisteredWord?, decodeCanonical?_arrivalWord,
        decodeArrival?_arrivalWord]
      change some (normalizeArrivalConfig direction origin config) = some config
      rw [normalizeArrivalConfig_of_boundaryValid direction origin config valid]

/-- Decode either registered form from a literal phase-zero CTS snapshot. -/
def decodeSnapshot? (snapshot : CTS.Config rogozhinCookProgram) : Option MachineConfig :=
  if snapshot.phase.val = 0 then
    (Cook.decodeWord? snapshot.data).bind decodeRegisteredWord?
  else none

theorem decodeSnapshot?_registered (config : MachineConfig)
    (boundary : RegisteredBoundary config) :
    decodeSnapshot?
      (CTS.initial rogozhinCookProgram (encodeWord (registeredWord config boundary))) =
      some config := by
  rw [decodeSnapshot?, if_pos (by rfl)]
  change (Cook.decodeWord? (encodeWord (registeredWord config boundary))).bind
    decodeRegisteredWord? = some config
  rw [Cook.decodeWord?_encodeWord]
  exact decodeRegisteredWord?_registered config boundary

/-- Every finite running machine prefix has an actual CTS endpoint decoded
from that endpoint alone. The registered path is used only in the proof. -/
theorem exists_decodeSnapshot?_iterate (initial : MachineConfig) (machineSteps : Nat)
    (running : ∀ earlier, earlier < machineSteps →
      ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial)) :
    ∃ ticks,
      decodeSnapshot?
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial)))) =
        some (Rogozhin46.iterate machineSteps initial) := by
  obtain ⟨path⟩ := exists_registeredPath_of_running initial .canonical machineSteps running
  refine ⟨ctsPeriod * path.tagSteps, ?_⟩
  rw [show CTS.iterate rogozhinCookProgram (ctsPeriod * path.tagSteps)
      (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial))) =
      CTS.initial rogozhinCookProgram
        (encodeWord (registeredWord path.config path.boundary)) from path.tagTrace.toCTS]
  rw [decodeSnapshot?_registered]
  exact congrArg some path.config_eq

/-- Recover the tag word visible at a returned fixed-machine sweep. -/
def decodeTag? (program : Program) (snapshot : CTS.Config rogozhinCookProgram) :
    Option (List Label) :=
  (decodeSnapshot? snapshot).bind (RogozhinT2BoundaryReadback.decodeBoundary? program)

theorem decodeTag?_registered_compileWithPadding (program : Program)
    (isT2 : IsT2 program) (padding : Nat) (word : List Label)
    (valid : LabelsValid program word)
    (boundary : RegisteredBoundary (compileWithPadding program padding word)) :
    decodeTag? program
      (CTS.initial rogozhinCookProgram
        (encodeWord (registeredWord (compileWithPadding program padding word) boundary))) =
      some word := by
  rw [decodeTag?, decodeSnapshot?_registered]
  exact RogozhinT2BoundaryReadback.decodeBoundary?_compileWithPadding
    program isT2 padding word valid

/-- Every actual nonhalting tag prefix is recoverable at an actual Cook CTS
endpoint. Neither the source horizon nor the CTS tick witness is a decoder input. -/
theorem exists_decodeTag?_iterate {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) (horizon : Nat)
    (before : NonhaltingBefore program word horizon) :
    ∃ ticks,
      decodeTag? program
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram
            (encodeWord (canonicalWord (compile ⟨program, word⟩))))) =
        some (RogozhinTagInput.iterate program horizon word) := by
  have safe := safeThrough_compileWithPadding_nonhaltingRun wellFormed horizon before
  obtain ⟨ticks, decoded⟩ := exists_decodeSnapshot?_iterate
    (compile ⟨program, word⟩) (boundaryTime program word horizon)
    (fun earlier earlierLt => safe earlier (Nat.le_of_lt earlierLt))
  refine ⟨ticks, ?_⟩
  rw [decodeTag?, decoded]
  exact RogozhinT2BoundaryReadback.decodeBoundary?_iterate_nonhaltingRun
    wellFormed horizon before

/-- Compose the sweep inverse with deletion-two alignment recovery. -/
def decodeOrdinary? (program : Program) (snapshot : CTS.Config rogozhinCookProgram) :
    Option (List Label) :=
  (decodeTag? (DeletionTwoT2Normalizer.normalizeProgram program) snapshot).bind
    (DeletionTwoT2Readback.decodeWord? program)

/-- At each nonhalting normalized-tag prefix, an actual CTS endpoint exposes
the exact ordinary word represented by that alignment. This theorem gives no
claim that every desired ordinary horizon has already been reached. -/
theorem exists_decodeOrdinary?_iterate (program : Program) (word : List Label)
    (productions : DeletionTwoT2Readback.ProductionsValid program)
    (trajectory : ∀ horizon,
      DeletionTwoT2Normalizer.Boundary program (RogozhinTagInput.iterate program horizon word))
    (normalizedWellFormed : WellFormed
      (DeletionTwoT2Normalizer.normalizeProgram program)
      (DeletionTwoT2Normalizer.normalizeWord program word))
    (targetHorizon : Nat)
    (before : NonhaltingBefore (DeletionTwoT2Normalizer.normalizeProgram program)
      (DeletionTwoT2Normalizer.normalizeWord program word) targetHorizon) :
    ∃ ticks sourceHorizon,
      decodeOrdinary? program
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram
            (encodeWord (canonicalWord (compile
              ⟨DeletionTwoT2Normalizer.normalizeProgram program,
                DeletionTwoT2Normalizer.normalizeWord program word⟩))))) =
        some (RogozhinTagInput.iterate program sourceHorizon word) := by
  obtain ⟨ticks, decoded⟩ := exists_decodeTag?_iterate normalizedWellFormed targetHorizon before
  obtain ⟨sourceHorizon, aligned⟩ := DeletionTwoT2Readback.decodeWord?_iterate
    program word productions trajectory targetHorizon
  refine ⟨ticks, sourceHorizon, ?_⟩
  rw [decodeOrdinary?, decoded]
  exact aligned

end PureSFormal.Computation.CookRegisteredReadback
