import PureSFormal.PureS.FiniteController
import PureSFormal.WeakPath.Interface

/-!
# From a productive cursor controller to weak-path realization

This module contains no construction-specific scheduler argument.  It turns
an executable productive finite-controller system, together with exact
checkpoint facts about its contraction-sampled run, into the public
weak-path interface.  In particular, the reduction path is the definitional
bounded-search projection from `FiniteController`; it is not selected from an
existence theorem.
-/

namespace PureSFormal.PureS

namespace ControllerProjection

open FiniteController

/--
The concrete projection relation for one finite controller and one fixed
initial control.  The witness is a productive system that starts with that
control at the literal root of the advertised term and whose executable
contraction projection is the advertised path.
-/
def Projects {Control : Type} (initialControl : Control)
    (machine : Machine Control) :
    WeakPath.SchedulerProjection (Machine Control) :=
  fun scheduler initialTerm path =>
    scheduler = machine ∧
      ∃ system : ProductiveSystem machine,
        system.initial =
            ⟨some initialControl, Cursor.atRoot initialTerm⟩ ∧
          system.reductionPath = path

/--
All construction-specific facts needed for one input.  `checkpointTime`
counts strict contractions in the sampled path, not controller ticks.
-/
structure Certificate
    (program : CTS.Program)
    {Control : Type}
    {machine : Machine Control}
    (initialControl : Control)
    (initialTerm : Term)
    (initialConfig : CTS.Config program)
    (decoder : WeakPath.BareTermDecoder program) where
  system : ProductiveSystem machine
  startsAt : system.initial =
    ⟨some initialControl, Cursor.atRoot initialTerm⟩
  checkpointTime : Nat → Nat
  checkpointZero : checkpointTime 0 = 0
  checkpointsIncrease : WeakPath.StrictlyIncreasing checkpointTime
  exactCheckpoint : ∀ horizon,
    decoder (system.reductionPath.term (checkpointTime horizon)) =
      some (horizon, CTS.iterate program horizon initialConfig)
  acceptsOnly : ∀ index horizon config,
    decoder (system.reductionPath.term index) = some (horizon, config) →
      index = checkpointTime horizon ∧
        config = CTS.iterate program horizon initialConfig

namespace Certificate

/-- A checked controller certificate instantiates the public realization. -/
theorem realizes
    {program : CTS.Program}
    {Control : Type}
    {machine : Machine Control}
    {initialControl : Control}
    {initialTerm : Term}
    {initialConfig : CTS.Config program}
    {decoder : WeakPath.BareTermDecoder program}
    (certificate : Certificate program initialControl initialTerm initialConfig decoder
      (machine := machine)) :
    WeakPath.Realizes program (Projects initialControl machine) machine initialTerm
      initialConfig decoder certificate.system.reductionPath
      certificate.checkpointTime := by
  refine
    { startsAt := ?_
      isProjection := ?_
      checkpointZero := certificate.checkpointZero
      checkpointsIncrease := certificate.checkpointsIncrease
      exactCheckpoint := certificate.exactCheckpoint
      acceptsOnly := certificate.acceptsOnly }
  · rw [certificate.system.reductionPath_zero, certificate.startsAt]
    rfl
  · exact ⟨rfl, certificate.system, certificate.startsAt, rfl⟩

end Certificate

/--
Uniform construction data for all binary inputs of one finite CTS.  The
controller and decoder are fixed; only the encoded initial cursor, its
productive logical invariant, and checkpoint indices depend on the word.
-/
structure UniformCertificate
    (program : CTS.Program)
    {Control : Type}
    (initialControl : Control)
    (machine : Machine Control)
    (decoder : WeakPath.BareTermDecoder program) where
  encode : List Bool → Term
  certificate : ∀ word,
    Certificate program initialControl (encode word)
      (CTS.initial program word) decoder
      (machine := machine)

namespace UniformCertificate

/-- A uniform certificate exports one fixed finite scheduler for all words. -/
def uniformRealizes
    {program : CTS.Program}
    {Control : Type}
    {initialControl : Control}
    {machine : Machine Control}
    {decoder : WeakPath.BareTermDecoder program}
    (certificate : UniformCertificate program initialControl machine decoder) :
    WeakPath.UniformRealizes program
      (Projects initialControl machine) machine decoder where
  encode := certificate.encode
  path word := (certificate.certificate word).system.reductionPath
  checkpointTime word := (certificate.certificate word).checkpointTime
  realizes word := (certificate.certificate word).realizes

end UniformCertificate

end ControllerProjection

end PureSFormal.PureS
