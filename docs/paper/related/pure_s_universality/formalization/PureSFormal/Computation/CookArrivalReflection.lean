import PureSFormal.Cook.PassDecoder

/-!
# Operational reflection of decoded Cook arrivals

Every decoded arrival on the actual deletion-eight trajectory represents a
reachable Rogozhin configuration. The proof uses the first-return property
of each simulated machine transition. Positive cleanup prefixes are excluded
by their indexed symbols, including the final absorbing tag residue.
-/

namespace PureSFormal.Computation.CookArrivalReflection

open Cook Cook.PassClassification

theorem decodeArrival?_registered_sound (source : MachineConfig)
    (boundary : RegisteredBoundary source) (decoded : DecodedArrival)
    (accepted : decodeArrival? (registeredWord source boundary) = some decoded) :
    decoded.config = source := by
  cases boundary with
  | canonical =>
      rw [registeredWord, decodeArrival?_canonicalWord] at accepted
      cases accepted
  | arrival direction origin valid =>
      rw [registeredWord, decodeArrival?_validArrivalWord direction origin source valid] at accepted
      have same := Option.some.inj accepted
      exact (congrArg DecodedArrival.config same).symm

theorem halted_run_notArrivalReadable (source : MachineConfig)
    (boundary : RegisteredBoundary source) (halted : Rogozhin46.Halted source)
    (steps : Nat) (positive : 0 < steps) :
    ¬ ArrivalReadable (TagTrajectory.run steps (registeredWord source boundary)) := by
  obtain ⟨bridge⟩ := cleanupBridge_of_halted (registeredBoundaryForm boundary) source halted
  have wordEq : registeredWord source boundary = bridge.certificate.word :=
    (registeredWord_eq_haltBoundaryWord_of_halted source boundary halted).trans bridge.word_eq.symm
  rw [wordEq]
  exact haltCleanup_run_notArrivalReadable bridge.certificate steps positive

theorem decodeArrival?_actual_reflects (steps : Nat) (source : MachineConfig)
    (boundary : RegisteredBoundary source) (decoded : DecodedArrival)
    (accepted : decodeArrival? (TagTrajectory.run steps (registeredWord source boundary)) = some decoded) :
    ∃ machineSteps, decoded.config = Rogozhin46.iterate machineSteps source := by
  induction steps using Nat.strongRecOn generalizing source boundary decoded with
  | ind steps ih =>
      by_cases zero : steps = 0
      · subst steps
        exact ⟨0, decodeArrival?_registered_sound source boundary decoded accepted⟩
      · have positive : 0 < steps := Nat.pos_of_ne_zero zero
        cases command : Rogozhin46.transition source.state source.current with
        | halt =>
            exact (halted_run_notArrivalReadable source boundary command steps positive
              (decodeArrival?_is_readable accepted)).elim
        | step next written move =>
            let transition := registeredMachineStep_of_command source boundary next written move command
            by_cases before : steps < transition.arrival.steps
            · have trace := TagTrajectory.run_prefix_of_steps (Nat.le_of_lt before) transition.arrival.reaches
              exact (transition.arrival.first positive before trace
                (decodeArrival?_is_readable accepted)).elim
            · have reached : transition.arrival.steps ≤ steps := Nat.le_of_not_gt before
              have remainderLt : steps - transition.arrival.steps < steps :=
                Nat.sub_lt positive transition.arrival.steps_pos
              have endpoint := TagTrajectory.eq_run_of_steps transition.arrival.reaches
              have runEq : TagTrajectory.run steps (registeredWord source boundary) =
                  TagTrajectory.run (steps - transition.arrival.steps)
                    (registeredWord transition.nextConfig transition.nextBoundary) := by
                calc
                  _ = TagTrajectory.run ((steps - transition.arrival.steps) + transition.arrival.steps)
                      (registeredWord source boundary) :=
                    congrArg (fun time => TagTrajectory.run time (registeredWord source boundary))
                      (Nat.sub_add_cancel reached).symm
                  _ = _ := by rw [TagTrajectory.run_add, ← endpoint]
              rw [runEq] at accepted
              obtain ⟨machineSteps, reflected⟩ := ih _ remainderLt transition.nextConfig
                transition.nextBoundary decoded accepted
              refine ⟨machineSteps + 1, ?_⟩
              rw [Rogozhin46.iterate_add]
              change decoded.config = Rogozhin46.iterate machineSteps (Rogozhin46.absorbingStep source)
              rw [Rogozhin46.absorbingStep_of_step? transition.machineStep]
              exact reflected

/-- Literal arrival parsing; phase alignment is supplied by the CTS theorem. -/
def arrivalSnapshot? (snapshot : CTS.Config rogozhinCookProgram) : Option DecodedArrival :=
  (decodeWord? snapshot.data).bind decodeArrival?

theorem arrivalSnapshot?_encoded (word : List TagSymbol) :
    arrivalSnapshot? (CTS.initial rogozhinCookProgram (encodeWord word)) = decodeArrival? word := by
  change (decodeWord? (encodeWord word)).bind decodeArrival? = _
  rw [decodeWord?_encodeWord]
  rfl

theorem arrivalSnapshot?_empty (snapshot : CTS.Config rogozhinCookProgram)
    (empty : snapshot.data = []) : arrivalSnapshot? snapshot = none := by
  cases snapshot with
  | mk phase data =>
      change data = [] at empty
      subst data
      simp [arrivalSnapshot?, decodeWord?, decodeWordRaw?, decodeArrival?, decodeArrivalRaw?, parseRunWord?]

theorem certified_arrivalSnapshot?_none (certificate : HaltCleanup.Certified)
    (steps : Nat) (positive : 0 < steps) :
    arrivalSnapshot?
      (CTS.iterate rogozhinCookProgram (ctsPeriod * steps)
        (CTS.initial rogozhinCookProgram (encodeWord certificate.word))) = none := by
  by_cases before : steps ≤ HaltCleanup.cleanupTagSteps certificate
  · have trace := TagTrajectory.run_prefix_of_steps before
      (HaltCleanup.TagStepsN.certified_cleanup certificate)
    rw [trace.toCTS, arrivalSnapshot?_encoded]
    cases parsed : decodeArrival? (TagTrajectory.run steps certificate.word) with
    | none => rfl
    | some decoded =>
        exact (haltCleanup_run_notArrivalReadable certificate steps positive
          (decodeArrival?_is_readable parsed)).elim
  · have after : HaltCleanup.cleanupTagSteps certificate + 1 ≤ steps := Nat.lt_of_not_ge before
    have fullLe : HaltCleanup.fullCleanupHorizon certificate ≤ ctsPeriod * steps := by
      change ctsPeriod * HaltCleanup.cleanupTagSteps certificate + 570 ≤ _
      apply Nat.le_trans
        (Nat.add_le_add_left (by decide : 570 ≤ ctsPeriod) _)
      rw [← Nat.mul_succ]
      exact Nat.mul_le_mul_left ctsPeriod after
    apply arrivalSnapshot?_empty
    rw [show ctsPeriod * steps =
      (ctsPeriod * steps - HaltCleanup.fullCleanupHorizon certificate) +
        HaltCleanup.fullCleanupHorizon certificate from (Nat.sub_add_cancel fullLe).symm,
      CTS.iterate_add, HaltCleanup.certified_empties_at_full_horizon]
    exact CTS.iterate_empty_data _ _ _

theorem halted_arrivalSnapshot?_none (source : MachineConfig)
    (boundary : RegisteredBoundary source) (halted : Rogozhin46.Halted source)
    (steps : Nat) (positive : 0 < steps) :
    arrivalSnapshot?
      (CTS.iterate rogozhinCookProgram (ctsPeriod * steps)
        (CTS.initial rogozhinCookProgram (encodeWord (registeredWord source boundary)))) = none := by
  obtain ⟨bridge⟩ := cleanupBridge_of_halted (registeredBoundaryForm boundary) source halted
  have wordEq : registeredWord source boundary = bridge.certificate.word :=
    (registeredWord_eq_haltBoundaryWord_of_halted source boundary halted).trans bridge.word_eq.symm
  rw [wordEq]
  exact certified_arrivalSnapshot?_none bridge.certificate steps positive

theorem arrivalSnapshot?_actual_reflects (steps : Nat) (source : MachineConfig)
    (boundary : RegisteredBoundary source) (decoded : DecodedArrival)
    (accepted : arrivalSnapshot?
      (CTS.iterate rogozhinCookProgram (ctsPeriod * steps)
        (CTS.initial rogozhinCookProgram (encodeWord (registeredWord source boundary)))) = some decoded) :
    ∃ machineSteps, decoded.config = Rogozhin46.iterate machineSteps source := by
  induction steps using Nat.strongRecOn generalizing source boundary decoded with
  | ind steps ih =>
      by_cases zero : steps = 0
      · subst steps
        rw [Nat.mul_zero, CTS.iterate_zero, arrivalSnapshot?_encoded] at accepted
        exact ⟨0, decodeArrival?_registered_sound source boundary decoded accepted⟩
      · have positive : 0 < steps := Nat.pos_of_ne_zero zero
        cases command : Rogozhin46.transition source.state source.current with
        | halt =>
            rw [halted_arrivalSnapshot?_none source boundary command steps positive] at accepted
            cases accepted
        | step next written move =>
            let transition := registeredMachineStep_of_command source boundary next written move command
            by_cases before : steps < transition.arrival.steps
            · have trace := TagTrajectory.run_prefix_of_steps (Nat.le_of_lt before) transition.arrival.reaches
              rw [trace.toCTS, arrivalSnapshot?_encoded] at accepted
              exact (transition.arrival.first positive before trace
                (decodeArrival?_is_readable accepted)).elim
            · have reached : transition.arrival.steps ≤ steps := Nat.le_of_not_gt before
              have remainderLt : steps - transition.arrival.steps < steps :=
                Nat.sub_lt positive transition.arrival.steps_pos
              have runEq : CTS.iterate rogozhinCookProgram (ctsPeriod * steps)
                  (CTS.initial rogozhinCookProgram (encodeWord (registeredWord source boundary))) =
                  CTS.iterate rogozhinCookProgram (ctsPeriod * (steps - transition.arrival.steps))
                    (CTS.initial rogozhinCookProgram
                      (encodeWord (registeredWord transition.nextConfig transition.nextBoundary))) := by
                calc
                  _ = CTS.iterate rogozhinCookProgram
                      (ctsPeriod * ((steps - transition.arrival.steps) + transition.arrival.steps))
                      (CTS.initial rogozhinCookProgram (encodeWord (registeredWord source boundary))) :=
                    congrArg (fun time => CTS.iterate rogozhinCookProgram (ctsPeriod * time)
                      (CTS.initial rogozhinCookProgram (encodeWord (registeredWord source boundary))))
                      (Nat.sub_add_cancel reached).symm
                  _ = _ := by rw [Nat.mul_add, CTS.iterate_add, transition.arrival.reaches.toCTS]
              rw [runEq] at accepted
              obtain ⟨machineSteps, reflected⟩ := ih _ remainderLt transition.nextConfig
                transition.nextBoundary decoded accepted
              refine ⟨machineSteps + 1, ?_⟩
              rw [Rogozhin46.iterate_add]
              change decoded.config = Rogozhin46.iterate machineSteps (Rogozhin46.absorbingStep source)
              rw [Rogozhin46.absorbingStep_of_step? transition.machineStep]
              exact reflected

theorem passDecode?_actual_reflects (initial : MachineConfig) (horizon : Nat)
    (configuration : MachineConfig)
    (accepted : passDecode? horizon
      (CTS.iterate rogozhinCookProgram horizon
        (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial)))) = some configuration) :
    ∃ machineSteps, configuration = Rogozhin46.iterate machineSteps initial := by
  obtain ⟨phaseZero, word, wordParsed, form⟩ := passDecode?_sound accepted
  rcases form with canonical | arrival
  · obtain ⟨zero, _⟩ := canonical
    subst horizon
    rw [CTS.iterate_zero, passDecode?_canonical] at accepted
    exact ⟨0, (Option.some.inj accepted).symm⟩
  · obtain ⟨positive, decoded, arrivalParsed, configEq⟩ := arrival
    have periodZero : horizon % ctsPeriod = 0 := by
      simpa only [CTS.iterate_phase_val, CTS.initial, CTS.zeroPhase, Nat.zero_add] using! phaseZero
    have aligned : horizon = ctsPeriod * (horizon / ctsPeriod) := by
      have decomposition := Nat.mod_add_div horizon ctsPeriod
      rw [periodZero, Nat.zero_add] at decomposition
      exact decomposition.symm
    have snapshotParsed : arrivalSnapshot?
        (CTS.iterate rogozhinCookProgram horizon
          (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial)))) = some decoded := by
      unfold arrivalSnapshot?
      rw [wordParsed]
      exact arrivalParsed
    rw [aligned] at snapshotParsed
    obtain ⟨machineSteps, reflected⟩ :=
      arrivalSnapshot?_actual_reflects (horizon / ctsPeriod) initial .canonical decoded snapshotParsed
    exact ⟨machineSteps, configEq.symm.trans reflected⟩

theorem passDecode?_successor (source : MachineConfig) (next : MachineState)
    (written : MachineSymbol) (move : Rogozhin46.Direction)
    (horizon : Nat) (positive : 0 < horizon) :
    passDecode? horizon
      (CTS.initial rogozhinCookProgram
        (encodeWord (registeredWord (Rogozhin46.applyTransition source next written move)
          (successorBoundary source next written move)))) =
      some (Rogozhin46.applyTransition source next written move) := by
  cases move with
  | left =>
      exact passDecode?_validArrival horizon positive .left (leftOrigin source) _
        (applyTransition_boundaryValid source next written .left)
  | right =>
      exact passDecode?_validArrival horizon positive .right (rightOrigin source) _
        (applyTransition_boundaryValid source next written .right)

theorem exists_passDecode?_actual (initial : MachineConfig) (machineSteps : Nat)
    (running : ∀ earlier, earlier < machineSteps →
      ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial)) :
    ∃ horizon, passDecode? horizon
      (CTS.iterate rogozhinCookProgram horizon
        (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial)))) =
      some (Rogozhin46.iterate machineSteps initial) := by
  cases machineSteps with
  | zero => exact ⟨0, passDecode?_canonical initial⟩
  | succ steps =>
      have prefixRun : ∀ earlier, earlier < steps →
          ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial) := by
        intro earlier earlierLt
        exact running earlier (Nat.lt_trans earlierLt (Nat.lt_succ_self steps))
      obtain ⟨path⟩ := exists_registeredPath_of_running initial .canonical steps prefixRun
      have live : ¬ Rogozhin46.Halted path.config := by
        rw [path.config_eq]
        exact running steps (Nat.lt_succ_self steps)
      cases command : Rogozhin46.transition path.config.state path.config.current with
      | halt => exact (live command).elim
      | step next written move =>
          let transition := registeredMachineStep_of_command path.config path.boundary next written move command
          let total := transition.arrival.steps + path.tagSteps
          have trace := HaltCleanup.TagStepsN.append path.tagTrace transition.arrival.reaches
          have positive : 0 < ctsPeriod * total := Nat.mul_pos (by decide : 0 < ctsPeriod)
            (Nat.add_pos_left transition.arrival.steps_pos _)
          refine ⟨ctsPeriod * total, ?_⟩
          have ctsTrace := trace.toCTS
          change CTS.iterate rogozhinCookProgram (ctsPeriod * total)
            (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial))) = _ at ctsTrace
          rw [ctsTrace]
          have finalEq : transition.nextConfig = Rogozhin46.iterate (steps + 1) initial := by
            rw [Rogozhin46.iterate_succ, ← path.config_eq,
              Rogozhin46.absorbingStep_of_step? transition.machineStep]
          rw [← finalEq]
          exact passDecode?_successor path.config next written move _ positive

end PureSFormal.Computation.CookArrivalReflection
