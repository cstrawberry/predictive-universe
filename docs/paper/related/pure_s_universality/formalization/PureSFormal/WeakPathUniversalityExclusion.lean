import PureSFormal.WeakPathUniversalityTrajectory

/-!
# Global fixed-trajectory boundary classification and exclusion

This module supplies the reverse/exclusion halves of the fixed Rogozhin
versions of equations (20)--(21).  An executable dependent timeline retains
each registered first-arrival segment.  It proves that `passDecode?` succeeds
on the initialized Cook CTS trajectory exactly at those canonical/arrival
boundaries, with a unique represented machine-step index.  The result is then
lifted through the scheduler's public `acceptsOnly` theorem to every pure-`S`
contraction index.

The first halted configuration remains a registered boundary.  Every later
CTS horizon is rejected: unaligned points fail the phase gate, enabled cleanup
macroperiods are not arrivals, and the terminal tail has empty data.  This
module starts with an already initialized Rogozhin configuration; the external
compiler from an arbitrary Turing machine is intentionally not part of its
statement.
-/

namespace PureSFormal.WeakPathUniversality

open PureS
open Cook.PassClassification

def fixedRegisteredPath? (initial : MachineConfig) :
    (machineSteps : Nat) →
      Option (RegisteredPath initial (.canonical) machineSteps)
  | 0 => some (RegisteredPath.zero initial (.canonical))
  | machineSteps + 1 =>
      match fixedRegisteredPath? initial machineSteps with
      | none => none
      | some path =>
          match hcommand : Rogozhin46.transition path.config.state
              path.config.current with
          | .halt => none
          | .step next written move =>
              some (path.extend next written move hcommand)

@[simp] theorem fixedRegisteredPath?_zero (initial : MachineConfig) :
    fixedRegisteredPath? initial 0 =
      some (RegisteredPath.zero initial (.canonical)) := rfl

theorem fixedRegisteredPath?_succ
    (initial : MachineConfig) (machineSteps : Nat) :
    fixedRegisteredPath? initial (machineSteps + 1) =
      match fixedRegisteredPath? initial machineSteps with
      | none => none
      | some path =>
          match hcommand : Rogozhin46.transition path.config.state
              path.config.current with
          | .halt => none
          | .step next written move =>
              some (path.extend next written move hcommand) := rfl

theorem fixedRegisteredPath?_isSome_iff_running
    (initial : MachineConfig) : ∀ machineSteps : Nat,
    (∃ path, fixedRegisteredPath? initial machineSteps = some path) ↔
      ∀ earlier, earlier < machineSteps →
        ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial) := by
  intro machineSteps
  induction machineSteps with
  | zero =>
      constructor
      · intro _ earlier hlt
        exact (Nat.not_lt_zero earlier hlt).elim
      · intro _
        exact ⟨RegisteredPath.zero initial (.canonical), rfl⟩
  | succ machineSteps ih =>
      constructor
      · rintro ⟨path, hpath⟩
        rw [fixedRegisteredPath?_succ] at hpath
        cases hprevious : fixedRegisteredPath? initial machineSteps with
        | none =>
            rw [hprevious] at hpath
            contradiction
        | some previous =>
            rw [hprevious] at hpath
            have previousRunning := ih.mp ⟨previous, hprevious⟩
            change
              (match hcommand :
                  Rogozhin46.transition previous.config.state
                    previous.config.current with
                | .halt => none
                | .step next written move =>
                    some (previous.extend next written move hcommand)) =
                some path at hpath
            split at hpath
            · contradiction
            · rename_i next written move hcommand
              intro earlier hearlier
              have hle : earlier ≤ machineSteps :=
                Nat.le_of_lt_succ hearlier
              rcases Nat.lt_or_eq_of_le hle with hlt | rfl
              · exact previousRunning earlier hlt
              · rw [← previous.config_eq]
                simp [Rogozhin46.Halted, hcommand]
      · intro running
        have previousRunning : ∀ earlier, earlier < machineSteps →
            ¬ Rogozhin46.Halted
              (Rogozhin46.iterate earlier initial) := by
          intro earlier hearlier
          exact running earlier
            (Nat.lt_trans hearlier (Nat.lt_succ_self machineSteps))
        obtain ⟨previous, hprevious⟩ := ih.mpr previousRunning
        have hnot : ¬ Rogozhin46.Halted previous.config := by
          rw [previous.config_eq]
          exact running machineSteps (Nat.lt_succ_self machineSteps)
        rw [fixedRegisteredPath?_succ, hprevious]
        change
          ∃ path,
            (match hcommand :
                Rogozhin46.transition previous.config.state
                  previous.config.current with
              | .halt => none
              | .step next written move =>
                  some (previous.extend next written move hcommand)) =
              some path
        split
        · rename_i hcommand
          exact (hnot hcommand).elim
        · rename_i next written move hcommand
          exact ⟨previous.extend next written move hcommand, rfl⟩

theorem fixedRegisteredPath?_positive_is_arrival
    {initial : MachineConfig} {machineSteps : Nat}
    {path : RegisteredPath initial (.canonical) (machineSteps + 1)}
    (hpath : fixedRegisteredPath? initial (machineSteps + 1) = some path) :
    ∃ direction : ArrivalDirection, ∃ origin : ArrivalOrigin,
      ∃ valid : BoundaryValid direction origin path.config,
        path.boundary = .arrival direction origin valid := by
  rw [fixedRegisteredPath?_succ] at hpath
  cases hprevious : fixedRegisteredPath? initial machineSteps with
  | none =>
      rw [hprevious] at hpath
      contradiction
  | some previous =>
      rw [hprevious] at hpath
      change
        (match hcommand : Rogozhin46.transition previous.config.state
            previous.config.current with
          | .halt => none
          | .step next written move =>
              some (previous.extend next written move hcommand)) =
          some path at hpath
      split at hpath
      · contradiction
      · rename_i next written move hcommand
        have heq := Option.some.inj hpath
        subst path
        cases move with
        | left =>
            exact ⟨.left, leftOrigin previous.config,
              applyTransition_boundaryValid previous.config next written .left,
              rfl⟩
        | right =>
            exact ⟨.right, rightOrigin previous.config,
              applyTransition_boundaryValid previous.config next written .right,
              rfl⟩

theorem fixedRegisteredPath?_succ_decompose
    {initial : MachineConfig} {machineSteps : Nat}
    {path : RegisteredPath initial (.canonical) (machineSteps + 1)}
    (hpath : fixedRegisteredPath? initial (machineSteps + 1) = some path) :
    ∃ previous : RegisteredPath initial (.canonical) machineSteps,
      ∃ next written move,
        ∃ hcommand : Rogozhin46.transition previous.config.state
            previous.config.current = .step next written move,
          fixedRegisteredPath? initial machineSteps = some previous ∧
          path = previous.extend next written move hcommand := by
  rw [fixedRegisteredPath?_succ] at hpath
  cases hprevious : fixedRegisteredPath? initial machineSteps with
  | none =>
      rw [hprevious] at hpath
      contradiction
  | some previous =>
      rw [hprevious] at hpath
      change
        (match hcommand : Rogozhin46.transition previous.config.state
            previous.config.current with
          | .halt => none
          | .step next written move =>
              some (previous.extend next written move hcommand)) =
          some path at hpath
      split at hpath
      · contradiction
      · rename_i next written move hcommand
        exact ⟨previous, next, written, move, hcommand, rfl,
          (Option.some.inj hpath).symm⟩

theorem fixedRegisteredPath?_adjacent_tagSteps_lt
    {initial : MachineConfig} {machineSteps : Nat}
    {previous : RegisteredPath initial (.canonical) machineSteps}
    {nextPath : RegisteredPath initial (.canonical) (machineSteps + 1)}
    (hprevious : fixedRegisteredPath? initial machineSteps = some previous)
    (hnext : fixedRegisteredPath? initial (machineSteps + 1) = some nextPath) :
    previous.tagSteps < nextPath.tagSteps := by
  rw [fixedRegisteredPath?_succ, hprevious] at hnext
  change
    (match hcommand : Rogozhin46.transition previous.config.state
        previous.config.current with
      | .halt => none
      | .step next written move =>
          some (previous.extend next written move hcommand)) =
      some nextPath at hnext
  split at hnext
  · contradiction
  · rename_i next written move hcommand
    have heq := Option.some.inj hnext
    subst nextPath
    change previous.tagSteps <
      (registeredMachineStep_of_command previous.config previous.boundary
        next written move hcommand).arrival.steps + previous.tagSteps
    exact Nat.lt_add_of_pos_left
      (registeredMachineStep_of_command previous.config previous.boundary
        next written move hcommand).arrival.steps_pos

theorem fixedRegisteredPath?_tagSteps_strict
    {initial : MachineConfig} {firstIndex secondIndex : Nat}
    {firstPath : RegisteredPath initial (.canonical) firstIndex}
    {secondPath : RegisteredPath initial (.canonical) secondIndex}
    (hfirst : fixedRegisteredPath? initial firstIndex = some firstPath)
    (hsecond : fixedRegisteredPath? initial secondIndex = some secondPath)
    (hlt : firstIndex < secondIndex) :
    firstPath.tagSteps < secondPath.tagSteps := by
  induction secondIndex generalizing firstIndex firstPath with
  | zero => exact (Nat.not_lt_zero firstIndex hlt).elim
  | succ secondIndex ih =>
      have secondRunning :=
        (fixedRegisteredPath?_isSome_iff_running initial
          (secondIndex + 1)).mp ⟨secondPath, hsecond⟩
      have previousRunning : ∀ earlier, earlier < secondIndex →
          ¬ Rogozhin46.Halted
            (Rogozhin46.iterate earlier initial) := by
        intro earlier hearlier
        exact secondRunning earlier
          (Nat.lt_trans hearlier (Nat.lt_succ_self secondIndex))
      obtain ⟨previousPath, hprevious⟩ :=
        (fixedRegisteredPath?_isSome_iff_running initial secondIndex).mpr
          previousRunning
      have hadjacent : previousPath.tagSteps < secondPath.tagSteps :=
        fixedRegisteredPath?_adjacent_tagSteps_lt hprevious hsecond
      have hle : firstIndex ≤ secondIndex := Nat.le_of_lt_succ hlt
      rcases Nat.lt_or_eq_of_le hle with hbefore | rfl
      · exact Nat.lt_trans (ih hfirst hprevious hbefore) hadjacent
      · have hpaths : firstPath = previousPath :=
          Option.some.inj (hfirst.symm.trans hprevious)
        subst firstPath
        exact hadjacent

theorem arrivalReadable_run_classified_by_fixedRegisteredPath
    {initial : MachineConfig} {machineBound tagTime : Nat}
    {finalPath : RegisteredPath initial (.canonical) machineBound}
    (hfinal : fixedRegisteredPath? initial machineBound = some finalPath)
    (htagPositive : 0 < tagTime)
    (htagBound : tagTime ≤ finalPath.tagSteps)
    (hreadable : ArrivalReadable
      (Cook.TagTrajectory.run tagTime (canonicalWord initial))) :
    ∃ machineSteps : Nat,
      ∃ path : RegisteredPath initial (.canonical) machineSteps,
        0 < machineSteps ∧ machineSteps ≤ machineBound ∧
        fixedRegisteredPath? initial machineSteps = some path ∧
        tagTime = path.tagSteps := by
  induction machineBound generalizing tagTime with
  | zero =>
      have hpath : RegisteredPath.zero initial (.canonical) = finalPath :=
        Option.some.inj ((fixedRegisteredPath?_zero initial).symm.trans hfinal)
      subst finalPath
      exact (Nat.not_lt_of_ge htagBound htagPositive).elim
  | succ machineBound ih =>
      obtain ⟨previous, next, written, move, hcommand, hprevious, hpath⟩ :=
        fixedRegisteredPath?_succ_decompose hfinal
      subst finalPath
      let step := registeredMachineStep_of_command previous.config
        previous.boundary next written move hcommand
      by_cases hbeforeOrAt : tagTime ≤ previous.tagSteps
      · rcases Nat.lt_or_eq_of_le hbeforeOrAt with hbefore | hat
        · obtain ⟨machineSteps, path, hpositive, hmachineBound,
              hregistered, htime⟩ :=
            ih hprevious htagPositive (Nat.le_of_lt hbefore) hreadable
          exact ⟨machineSteps, path, hpositive,
            Nat.le_trans hmachineBound (Nat.le_succ machineBound),
            hregistered, htime⟩
        · subst tagTime
          cases machineBound with
          | zero =>
              have hzero : RegisteredPath.zero initial (.canonical) =
                  previous :=
                Option.some.inj
                  ((fixedRegisteredPath?_zero initial).symm.trans hprevious)
              subst previous
              exact (Nat.not_lt_zero 0 htagPositive).elim
          | succ previousIndex =>
              exact ⟨previousIndex + 1, previous,
                Nat.zero_lt_succ previousIndex,
                Nat.le_succ (previousIndex + 1), hprevious, rfl⟩
      · have hafter : previous.tagSteps < tagTime :=
          Nat.lt_of_not_ge hbeforeOrAt
        have htotal : tagTime ≤ step.arrival.steps + previous.tagSteps := by
          exact htagBound
        rcases Nat.lt_or_eq_of_le htotal with hinterior | hendpoint
        · let relative := tagTime - previous.tagSteps
          have hrelativePositive : 0 < relative :=
            Nat.sub_pos_of_lt hafter
          have hrelativeAdd : relative + previous.tagSteps = tagTime :=
            Nat.sub_add_cancel (Nat.le_of_lt hafter)
          have hrelativeLt : relative < step.arrival.steps := by
            apply Nat.lt_of_not_ge
            intro hge
            have hadd := Nat.add_le_add_right hge previous.tagSteps
            rw [hrelativeAdd] at hadd
            exact (Nat.not_le_of_gt hinterior) hadd
          have hrelativeTrace : Cook.HaltCleanup.TagStepsN relative
              (registeredWord previous.config previous.boundary)
              (Cook.TagTrajectory.run relative
                (registeredWord previous.config previous.boundary)) :=
            Cook.TagTrajectory.run_prefix_of_steps
              (Nat.le_of_lt hrelativeLt) step.arrival.reaches
          have hnotReadable : ¬ ArrivalReadable
              (Cook.TagTrajectory.run relative
                (registeredWord previous.config previous.boundary)) :=
            step.arrival.first hrelativePositive hrelativeLt hrelativeTrace
          have hglobal :
              Cook.TagTrajectory.run tagTime (canonicalWord initial) =
                Cook.TagTrajectory.run relative
                  (registeredWord previous.config previous.boundary) := by
            rw [← hrelativeAdd, Cook.TagTrajectory.run_add]
            have hpreviousRun :
                Cook.TagTrajectory.run previous.tagSteps
                    (canonicalWord initial) =
                  registeredWord previous.config previous.boundary := by
              simpa only [registeredWord] using
                (Cook.TagTrajectory.eq_run_of_steps previous.tagTrace).symm
            rw [hpreviousRun]
          exact (hnotReadable (hglobal ▸ hreadable)).elim
        · exact ⟨machineBound + 1,
            previous.extend next written move hcommand,
            Nat.zero_lt_succ machineBound, Nat.le_refl _, hfinal,
            hendpoint⟩

/-- A positive-horizon pass rejects a phase-zero encoded word that is not a
registered arrival. -/
theorem passDecode?_positive_notArrivalReadable
    (horizon : Nat) (hpositive : 0 < horizon)
    (word : List Cook.TagSymbol) (hnot : ¬ ArrivalReadable word) :
    Cook.passDecode? horizon
      (CTS.initial Cook.rogozhinCookProgram (Cook.encodeWord word)) = none := by
  have harrival : Cook.decodeArrival? word = none := by
    cases hdecode : Cook.decodeArrival? word with
    | none => rfl
    | some decoded =>
        exact (hnot (Cook.decodeArrival?_is_readable hdecode)).elim
  have hne : horizon ≠ 0 := Nat.ne_of_gt hpositive
  unfold Cook.passDecode?
  rw [if_pos (by rfl)]
  change
    (do
      let decodedWord ← Cook.decodeWord? (Cook.encodeWord word)
      if horizon = 0 then Cook.decodeCanonical? decodedWord
      else
        match Cook.decodeArrival? decodedWord with
        | none => none
        | some decoded => some decoded.config) = none
  rw [Cook.decodeWord?_encodeWord]
  change
    (if horizon = 0 then Cook.decodeCanonical? word
    else
      match Cook.decodeArrival? word with
      | none => none
      | some decoded => some decoded.config) = none
  rw [if_neg hne, harrival]

/-- Data-only form of positive rejection, usable after an empty-tail CTS
calculation without identifying the current phase. -/
theorem passDecode?_positive_notArrivalReadable_of_data
    (horizon : Nat) (hpositive : 0 < horizon)
    (snapshot : CTS.Config Cook.rogozhinCookProgram)
    (word : List Cook.TagSymbol)
    (hdata : snapshot.data = Cook.encodeWord word)
    (hnot : ¬ ArrivalReadable word) :
    Cook.passDecode? horizon snapshot = none := by
  by_cases hphase : snapshot.phase.val = 0
  · have harrival : Cook.decodeArrival? word = none := by
      cases hdecode : Cook.decodeArrival? word with
      | none => rfl
      | some decoded =>
          exact (hnot (Cook.decodeArrival?_is_readable hdecode)).elim
    have hne : horizon ≠ 0 := Nat.ne_of_gt hpositive
    unfold Cook.passDecode?
    rw [if_pos hphase]
    change
      (do
        let decodedWord ← Cook.decodeWord? snapshot.data
        if horizon = 0 then Cook.decodeCanonical? decodedWord
        else
          match Cook.decodeArrival? decodedWord with
          | none => none
          | some decoded => some decoded.config) = none
    rw [hdata, Cook.decodeWord?_encodeWord]
    change
      (if horizon = 0 then Cook.decodeCanonical? word
      else
        match Cook.decodeArrival? word with
        | none => none
        | some decoded => some decoded.config) = none
    rw [if_neg hne, harrival]
  · exact Cook.passDecode?_of_phase_ne_zero horizon snapshot hphase

/-- A relative CTS horizon not divisible by the Cook period cannot pass the
phase-zero gate. -/
theorem passDecode?_unaligned_relative_none
    (globalHorizon relative : Nat) (bits : List Bool)
    (hnotAligned : ¬ Cook.ctsPeriod ∣ relative) :
    Cook.passDecode? globalHorizon
      (CTS.iterate Cook.rogozhinCookProgram relative
        (CTS.initial Cook.rogozhinCookProgram bits)) = none := by
  apply Cook.passDecode?_of_phase_ne_zero
  intro hzero
  apply hnotAligned
  rw [CTS.iterate_phase_val, CTS.initial_phase,
    Cook.rogozhinCookProgram_zeroPhase_val, Nat.zero_add] at hzero
  exact (Nat.dvd_iff_mod_eq_zero).2 hzero

/-- Every positive deletion-one CTS horizon after a certified halting boundary
is rejected.  Aligned enabled prefixes are non-arrivals; unaligned points fail
the phase gate; sufficiently late aligned points have empty data. -/
theorem passDecode?_certifiedHalt_after_none
    (certificate : Cook.HaltCleanup.Certified)
    (globalHorizon relative : Nat)
    (hglobal : 0 < globalHorizon) (hrelative : 0 < relative) :
    Cook.passDecode? globalHorizon
      (CTS.iterate Cook.rogozhinCookProgram relative
        (CTS.initial Cook.rogozhinCookProgram
          (Cook.encodeWord certificate.word))) = none := by
  by_cases haligned : Cook.ctsPeriod ∣ relative
  · rcases haligned with ⟨tagOffset, rfl⟩
    have htagPositive : 0 < tagOffset :=
      Nat.pos_of_mul_pos_left hrelative
    let total := Cook.HaltCleanup.cleanupTagSteps certificate
    by_cases hbefore : tagOffset ≤ total
    · have hcleanup : Cook.HaltCleanup.TagStepsN total certificate.word
          certificate.residue := by
        simpa only [total, Cook.HaltCleanup.cleanupTagSteps] using
          Cook.HaltCleanup.TagStepsN.certified_cleanup certificate
      have hprefix := Cook.TagTrajectory.run_prefix_of_steps hbefore hcleanup
      have hnot := haltCleanup_run_notArrivalReadable certificate tagOffset
        htagPositive
      rw [hprefix.toCTS]
      exact passDecode?_positive_notArrivalReadable globalHorizon hglobal
        (Cook.TagTrajectory.run tagOffset certificate.word) hnot
    · have htotalLt : total < tagOffset := Nat.lt_of_not_ge hbefore
      have hsucc : total + 1 ≤ tagOffset :=
        Nat.add_one_le_iff.mpr htotalLt
      have hmul : Cook.ctsPeriod * (total + 1) ≤
          Cook.ctsPeriod * tagOffset :=
        Nat.mul_le_mul_left Cook.ctsPeriod hsucc
      have hfullFirst : Cook.HaltCleanup.fullCleanupHorizon certificate ≤
          Cook.ctsPeriod * (total + 1) := by
        change Cook.ctsPeriod * total + 570 ≤
          Cook.ctsPeriod * (total + 1)
        rw [Nat.mul_add, Nat.mul_one]
        exact Nat.add_le_add_left (by decide : 570 ≤ Cook.ctsPeriod)
          (Cook.ctsPeriod * total)
      have hfull : Cook.HaltCleanup.fullCleanupHorizon certificate ≤
          Cook.ctsPeriod * tagOffset := Nat.le_trans hfullFirst hmul
      obtain ⟨later, heq⟩ := Nat.exists_eq_add_of_le hfull
      rw [heq, Nat.add_comm, CTS.iterate_add,
        Cook.HaltCleanup.certified_empties_at_full_horizon]
      apply passDecode?_positive_notArrivalReadable_of_data
        globalHorizon hglobal _ []
      · change
          (CTS.iterate Cook.rogozhinCookProgram later
            { phase := Cook.HaltCleanup.residueEndPhase, data := [] }).data = []
        exact CTS.iterate_empty_data Cook.rogozhinCookProgram later
          Cook.HaltCleanup.residueEndPhase
      · intro hreadable
        obtain ⟨decoded, hdecode⟩ :=
          (Cook.arrivalReadable_iff_decodeArrival?_isSome []).1 hreadable
        have hnone : Cook.decodeArrival? [] = none := rfl
        rw [hnone] at hdecode
        cases hdecode
  · exact passDecode?_unaligned_relative_none globalHorizon relative
      (Cook.encodeWord certificate.word) haligned

/-- At every positive phase-zero macroperiod after a registered halting
boundary, the pass decoder rejects.  Enabled cleanup prefixes contain an
indexed symbol; after cleanup the CTS dataword has already become empty. -/
theorem passDecode?_haltedBoundary_positiveMacro_none
    (config : MachineConfig) (boundary : RegisteredBoundary config)
    (hhalted : Rogozhin46.Halted config) (horizon tagSteps : Nat)
    (hhorizon : 0 < horizon) (htagSteps : 0 < tagSteps) :
    Cook.passDecode? horizon
      (CTS.iterate Cook.rogozhinCookProgram
        (Cook.ctsPeriod * tagSteps)
        (CTS.initial Cook.rogozhinCookProgram
          (Cook.encodeWord (registeredWord config boundary)))) = none := by
  let form := registeredBoundaryForm boundary
  obtain ⟨bridge⟩ := cleanupBridge_of_halted form config hhalted
  have hregistered : registeredWord config boundary =
      bridge.certificate.word :=
    (registeredWord_eq_haltBoundaryWord_of_halted config boundary
      hhalted).trans bridge.word_eq.symm
  rw [hregistered]
  by_cases henabled : tagSteps ≤
      Cook.HaltCleanup.cleanupTagSteps bridge.certificate
  · have htrace : Cook.HaltCleanup.TagStepsN tagSteps
        bridge.certificate.word
        (Cook.TagTrajectory.run tagSteps bridge.certificate.word) :=
      Cook.TagTrajectory.run_prefix_of_steps henabled
        (Cook.HaltCleanup.TagStepsN.certified_cleanup bridge.certificate)
    rw [htrace.toCTS]
    cases hdecode : Cook.passDecode? horizon
        (CTS.initial Cook.rogozhinCookProgram
          (Cook.encodeWord
            (Cook.TagTrajectory.run tagSteps bridge.certificate.word))) with
    | none => rfl
    | some decoded =>
        obtain ⟨_, word, hword, hcase⟩ := Cook.passDecode?_sound hdecode
        rcases hcase with hzero | hpositive
        · exact (Nat.ne_of_gt hhorizon hzero.1).elim
        · obtain ⟨_, decodedArrival, harrival, _⟩ := hpositive
          have hbits := Cook.decodeWord?_sound hword
          have hwordEq : word =
              Cook.TagTrajectory.run tagSteps bridge.certificate.word := by
            have hroundtrip := Cook.decodeWord?_encodeWord
              (Cook.TagTrajectory.run tagSteps bridge.certificate.word)
            exact Option.some.inj (hword.symm.trans hroundtrip)
          have hreadable : ArrivalReadable word :=
            Cook.decodeArrival?_is_readable harrival
          exact ((haltCleanup_run_notArrivalReadable bridge.certificate
            tagSteps htagSteps) (hwordEq ▸ hreadable)).elim
  · have hcleanupLt :
        Cook.HaltCleanup.cleanupTagSteps bridge.certificate < tagSteps :=
      Nat.lt_of_not_ge henabled
    have hfullLeNext :
        Cook.HaltCleanup.fullCleanupHorizon bridge.certificate ≤
          Cook.ctsPeriod *
            (Cook.HaltCleanup.cleanupTagSteps bridge.certificate + 1) := by
      change 912 * (2 * (bridge.certificate.word.length / 8) + 1) + 570 ≤
        912 * ((2 * (bridge.certificate.word.length / 8) + 1) + 1)
      rw [Nat.mul_add, Nat.mul_one]
      exact Nat.add_le_add_left (by decide : 570 ≤ 912) _
    have hnextLe :
        Cook.HaltCleanup.cleanupTagSteps bridge.certificate + 1 ≤
          tagSteps := Nat.succ_le_of_lt hcleanupLt
    have hfullLe :
        Cook.HaltCleanup.fullCleanupHorizon bridge.certificate ≤
          Cook.ctsPeriod * tagSteps :=
      Nat.le_trans hfullLeNext
        (Nat.mul_le_mul_left Cook.ctsPeriod hnextLe)
    obtain ⟨later, htime⟩ := Nat.exists_eq_add_of_le hfullLe
    have hempty :
        (CTS.iterate Cook.rogozhinCookProgram
          (Cook.ctsPeriod * tagSteps)
          (CTS.initial Cook.rogozhinCookProgram
            (Cook.encodeWord bridge.certificate.word))).data = [] := by
      rw [htime, Nat.add_comm, CTS.iterate_add,
        Cook.HaltCleanup.certified_empties_at_full_horizon]
      exact CTS.iterate_empty_data Cook.rogozhinCookProgram later
        Cook.HaltCleanup.residueEndPhase
    unfold Cook.passDecode?
    simp only [hempty]
    by_cases hphase :
        (CTS.iterate Cook.rogozhinCookProgram
          (Cook.ctsPeriod * tagSteps)
          (CTS.initial Cook.rogozhinCookProgram
            (Cook.encodeWord bridge.certificate.word))).phase.val = 0
    · rw [if_pos hphase]
      have hdecodeEmpty : Cook.decodeWord? [] = some [] := by
        simpa using (Cook.decodeWord?_encodeWord ([] : List Cook.TagSymbol))
      rw [hdecodeEmpty]
      change
        (if horizon = 0 then Cook.decodeCanonical? []
        else
          match Cook.decodeArrival? [] with
          | none => none
          | some decoded => some decoded.config) = none
      rw [if_neg (Nat.ne_of_gt hhorizon)]
      rfl
    · rw [if_neg hphase]

/-- After the registered boundary of a halted configuration, the fixed CTS
trajectory is rejected at every later deletion-one horizon.  Nonzero phases
are rejected by the phase gate; phase zero reduces to the certified terminal
cleanup theorem above. -/
theorem fixedRogozhinPassDecoder_none_after_haltedPath
    {initial : MachineConfig} {machineSteps : Nat}
    (path : RegisteredPath initial (.canonical) machineSteps)
    (hhalted : Rogozhin46.Halted path.config) (horizon : Nat)
    (hafter : Cook.ctsPeriod * path.tagSteps < horizon) :
    fixedRogozhinPassDecoder horizon
      (CTS.iterate Cook.rogozhinCookProgram horizon
        (CTS.initial Cook.rogozhinCookProgram
          (fixedRogozhinCanonicalBits initial))) = none := by
  let kappa := Cook.ctsPeriod * path.tagSteps
  have hkappaLe : kappa ≤ horizon := Nat.le_of_lt hafter
  obtain ⟨relative, hhorizon⟩ := Nat.exists_eq_add_of_le hkappaLe
  have hrelativePositive : 0 < relative := by
    by_cases hzero : relative = 0
    · rw [hzero, Nat.add_zero] at hhorizon
      exact ((Nat.ne_of_gt hafter) (by
        simpa only [kappa] using hhorizon)).elim
    · exact Nat.pos_of_ne_zero hzero
  let form := registeredBoundaryForm path.boundary
  obtain ⟨bridge⟩ := cleanupBridge_of_halted form path.config hhalted
  have hword : registeredWord path.config path.boundary =
      bridge.certificate.word :=
    (registeredWord_eq_haltBoundaryWord_of_halted path.config path.boundary
      hhalted).trans bridge.word_eq.symm
  change Cook.passDecode? horizon
    (CTS.iterate Cook.rogozhinCookProgram horizon
      (CTS.initial Cook.rogozhinCookProgram
        (Cook.encodeWord (canonicalWord initial)))) = none
  rw [hhorizon, Nat.add_comm, CTS.iterate_add]
  rw [show canonicalWord initial =
    registeredWord initial
      (RegisteredBoundary.canonical : RegisteredBoundary initial) by rfl]
  change Cook.passDecode? (relative + kappa)
    (CTS.iterate Cook.rogozhinCookProgram relative
      (CTS.iterate Cook.rogozhinCookProgram
        (Cook.ctsPeriod * path.tagSteps)
        (CTS.initial Cook.rogozhinCookProgram
          (Cook.encodeWord
            (registeredWord initial
              (RegisteredBoundary.canonical :
                RegisteredBoundary initial)))))) = none
  rw [path.tagTrace.toCTS, hword]
  exact passDecode?_certifiedHalt_after_none bridge.certificate
    (relative + kappa) relative
    (Nat.add_pos_left hrelativePositive kappa)
    hrelativePositive

/-- A bounded deterministic execution either still has its exact registered
path at the bound, or has already reached a fixed registered halting path
strictly below it. -/
structure FixedHaltingPathBelow (initial : MachineConfig) (bound : Nat) where
  machineSteps : Nat
  below : machineSteps < bound
  path : RegisteredPath initial (.canonical) machineSteps
  fixed : fixedRegisteredPath? initial machineSteps = some path
  halted : Rogozhin46.Halted path.config

theorem fixedPathAtBound_or_haltingPathBelow (initial : MachineConfig) :
    ∀ bound : Nat,
      (∃ path : RegisteredPath initial (.canonical) bound,
        fixedRegisteredPath? initial bound = some path) ∨
      Nonempty (FixedHaltingPathBelow initial bound) := by
  intro bound
  induction bound with
  | zero =>
      exact .inl ⟨RegisteredPath.zero initial (.canonical), rfl⟩
  | succ bound ih =>
      rcases ih with running | ⟨halted⟩
      · obtain ⟨path, hpath⟩ := running
        cases hcommand : Rogozhin46.transition path.config.state
            path.config.current with
        | halt =>
            exact .inr ⟨
              { machineSteps := bound
                below := Nat.lt_succ_self bound
                path := path
                fixed := hpath
                halted := hcommand }⟩
        | step next written move =>
            refine .inl ⟨path.extend next written move hcommand, ?_⟩
            rw [fixedRegisteredPath?_succ, hpath]
            change
              (match h : Rogozhin46.transition path.config.state
                  path.config.current with
                | .halt => none
                | .step next written move =>
                    some (path.extend next written move h)) = _
            split
            · rename_i himpossible
              rw [hcommand] at himpossible
              contradiction
            · rename_i next' written' move' heq
              have hargs : Rogozhin46.Transition.step next' written' move' =
                  .step next written move := heq.symm.trans hcommand
              cases hargs
              rfl
      · obtain ⟨halted⟩ := halted
        exact .inr ⟨
          { machineSteps := halted.machineSteps
            below := Nat.lt_trans halted.below (Nat.lt_succ_self bound)
            path := halted.path
            fixed := halted.fixed
            halted := halted.halted }⟩

/-- Any successful pass decode no later than a fixed registered path endpoint
is exactly one of the accumulated registered boundary horizons. -/
theorem fixedRogozhinPassDecoder_some_classified_before_path
    {initial : MachineConfig} {machineBound horizon : Nat}
    {finalPath : RegisteredPath initial (.canonical) machineBound}
    (hfinal : fixedRegisteredPath? initial machineBound = some finalPath)
    (horizonBound : horizon ≤ Cook.ctsPeriod * finalPath.tagSteps)
    {config : MachineConfig}
    (hdecode : fixedRogozhinPassDecoder horizon
      (CTS.iterate Cook.rogozhinCookProgram horizon
        (CTS.initial Cook.rogozhinCookProgram
          (fixedRogozhinCanonicalBits initial))) = some config) :
    ∃ machineSteps : Nat,
      ∃ path : RegisteredPath initial (.canonical) machineSteps,
        fixedRegisteredPath? initial machineSteps = some path ∧
        horizon = Cook.ctsPeriod * path.tagSteps ∧
        config = path.config := by
  obtain ⟨hphase, word, hword, hcase⟩ := Cook.passDecode?_sound hdecode
  have hmod : horizon % Cook.ctsPeriod = 0 := by
    have hphase' := hphase
    simp only [fixedRogozhinCanonicalBits, CTS.iterate_phase_val,
      CTS.initial_phase, Cook.rogozhinCookProgram_zeroPhase_val,
      Nat.zero_add] at hphase'
    exact hphase'
  have hdvd : Cook.ctsPeriod ∣ horizon :=
    Nat.dvd_of_mod_eq_zero hmod
  obtain ⟨tagTime, hhorizon⟩ := hdvd
  have htagBound : tagTime ≤ finalPath.tagSteps := by
    apply Nat.le_of_mul_le_mul_left _ (by decide : 0 < Cook.ctsPeriod)
    simpa only [← hhorizon] using horizonBound
  by_cases hzero : horizon = 0
  · have hknown : fixedRogozhinPassDecoder 0
        (CTS.iterate Cook.rogozhinCookProgram 0
          (CTS.initial Cook.rogozhinCookProgram
            (fixedRogozhinCanonicalBits initial))) = some initial := by
      change Cook.passDecode? 0
        (CTS.initial Cook.rogozhinCookProgram
          (Cook.encodeWord (canonicalWord initial))) = some initial
      exact Cook.passDecode?_canonical initial
    have hconfig : config = initial := by
      exact Option.some.inj ((hzero ▸ hdecode).symm.trans hknown)
    exact ⟨0, RegisteredPath.zero initial (.canonical), rfl,
      hzero.trans (by rfl), hconfig⟩
  · have hpositive : 0 < horizon := Nat.pos_of_ne_zero hzero
    have htagPositive : 0 < tagTime := by
      rw [hhorizon] at hpositive
      exact Nat.pos_of_mul_pos_left hpositive
    rcases hcase with hcanonical | harrivalCase
    · exact (hzero hcanonical.1).elim
    · obtain ⟨_, decodedArrival, harrival, _⟩ := harrivalCase
      have hprefix : Cook.HaltCleanup.TagStepsN tagTime
          (registeredWord initial (.canonical))
          (Cook.TagTrajectory.run tagTime
            (registeredWord initial (.canonical))) :=
        Cook.TagTrajectory.run_prefix_of_steps htagBound finalPath.tagTrace
      have hword' := hword
      simp only [fixedRogozhinCanonicalBits] at hword'
      rw [hhorizon] at hword'
      rw [show canonicalWord initial =
        registeredWord initial
          (RegisteredBoundary.canonical : RegisteredBoundary initial) by rfl]
        at hword'
      rw [hprefix.toCTS, CTS.initial_data] at hword'
      have hwordEq : word = Cook.TagTrajectory.run tagTime
          (canonicalWord initial) := by
        have hdecoded := Cook.decodeWord?_encodeWord
          (Cook.TagTrajectory.run tagTime (canonicalWord initial))
        exact Option.some.inj (hword'.symm.trans hdecoded)
      have hreadable : ArrivalReadable
          (Cook.TagTrajectory.run tagTime (canonicalWord initial)) := by
        rw [← hwordEq]
        exact Cook.decodeArrival?_is_readable harrival
      obtain ⟨machineSteps, path, hmachinePositive, _, hpath, htag⟩ :=
        arrivalReadable_run_classified_by_fixedRegisteredPath hfinal
          htagPositive htagBound hreadable
      obtain ⟨previous, hmachineSteps⟩ :=
        Nat.exists_eq_succ_of_ne_zero (Nat.ne_of_gt hmachinePositive)
      subst machineSteps
      obtain ⟨direction, origin, valid, hboundary⟩ :=
        fixedRegisteredPath?_positive_is_arrival hpath
      have hpathHorizon : horizon = Cook.ctsPeriod * path.tagSteps := by
        rw [hhorizon, htag]
      have hknown := fixedRogozhinPassDecoder_registeredPath_arrival path
        hmachinePositive direction origin valid hboundary
      rw [← hpathHorizon] at hknown
      have hconfig : config = path.config :=
        Option.some.inj (hdecode.symm.trans hknown)
      exact ⟨previous + 1, path, hpath, hpathHorizon, hconfig⟩

/-- Global reverse direction for the fixed initialized CTS trajectory: every
successful pass decode is one of the deterministic registered boundaries.
The proof covers both an arbitrarily long running prefix and the complete
post-halt cleanup/empty tail. -/
theorem fixedRogozhinPassDecoder_some_only_at_fixedRegisteredBoundary
    (initial : MachineConfig) (horizon : Nat) {config : MachineConfig}
    (hdecode : fixedRogozhinPassDecoder horizon
      (CTS.iterate Cook.rogozhinCookProgram horizon
        (CTS.initial Cook.rogozhinCookProgram
          (fixedRogozhinCanonicalBits initial))) = some config) :
    ∃ machineSteps : Nat,
      ∃ path : RegisteredPath initial (.canonical) machineSteps,
        fixedRegisteredPath? initial machineSteps = some path ∧
        horizon = Cook.ctsPeriod * path.tagSteps ∧
        config = path.config := by
  rcases fixedPathAtBound_or_haltingPathBelow initial (horizon + 1) with
    running | terminalWitness
  · obtain ⟨finalPath, hfinal⟩ := running
    have htagBeyond : horizon < finalPath.tagSteps :=
      Nat.lt_of_succ_le finalPath.tagSteps_ge
    have hscale : finalPath.tagSteps ≤
        Cook.ctsPeriod * finalPath.tagSteps := by
      have hperiod : 1 ≤ Cook.ctsPeriod := by decide
      have hmul := Nat.mul_le_mul_right finalPath.tagSteps hperiod
      simpa only [Nat.one_mul] using hmul
    exact fixedRogozhinPassDecoder_some_classified_before_path hfinal
      (Nat.le_trans (Nat.le_of_lt htagBeyond) hscale) hdecode
  · obtain ⟨terminal⟩ := terminalWitness
    by_cases hbefore : horizon ≤
        Cook.ctsPeriod * terminal.path.tagSteps
    · exact fixedRogozhinPassDecoder_some_classified_before_path
        terminal.fixed hbefore hdecode
    · have hnone := fixedRogozhinPassDecoder_none_after_haltedPath
        terminal.path terminal.halted horizon (Nat.lt_of_not_ge hbefore)
      rw [hdecode] at hnone
      contradiction

/-- Forward direction at a boundary selected by the deterministic registered
timeline, including the canonical boundary at zero and every valid arrival. -/
theorem fixedRogozhinPassDecoder_at_fixedRegisteredBoundary
    {initial : MachineConfig} {machineSteps : Nat}
    {path : RegisteredPath initial (.canonical) machineSteps}
    (hpath : fixedRegisteredPath? initial machineSteps = some path) :
    fixedRogozhinPassDecoder (Cook.ctsPeriod * path.tagSteps)
      (CTS.iterate Cook.rogozhinCookProgram
        (Cook.ctsPeriod * path.tagSteps)
        (CTS.initial Cook.rogozhinCookProgram
          (fixedRogozhinCanonicalBits initial))) = some path.config := by
  cases machineSteps with
  | zero =>
      have hpathEq : RegisteredPath.zero initial (.canonical) = path :=
        Option.some.inj ((fixedRegisteredPath?_zero initial).symm.trans hpath)
      subst path
      change Cook.passDecode? 0
        (CTS.initial Cook.rogozhinCookProgram
          (Cook.encodeWord (canonicalWord initial))) = some initial
      exact Cook.passDecode?_canonical initial
  | succ previous =>
      obtain ⟨direction, origin, valid, hboundary⟩ :=
        fixedRegisteredPath?_positive_is_arrival hpath
      exact fixedRogozhinPassDecoder_registeredPath_arrival path
        (Nat.zero_lt_succ previous) direction origin valid hboundary

/-- Exact fixed-CTS / `Pass_R` equation: a configuration is
decoded at a horizon iff that horizon is one of the deterministic canonical /
arrival boundaries, and the decoded value is exactly the represented
Rogozhin iterate. -/
theorem fixedRogozhinPassDecoder_some_iff_fixedRegisteredBoundary
    (initial : MachineConfig) (horizon : Nat) (config : MachineConfig) :
    fixedRogozhinPassDecoder horizon
      (CTS.iterate Cook.rogozhinCookProgram horizon
        (CTS.initial Cook.rogozhinCookProgram
          (fixedRogozhinCanonicalBits initial))) = some config ↔
      ∃ machineSteps : Nat,
        ∃ path : RegisteredPath initial (.canonical) machineSteps,
          fixedRegisteredPath? initial machineSteps = some path ∧
          horizon = Cook.ctsPeriod * path.tagSteps ∧
          config = Rogozhin46.iterate machineSteps initial := by
  constructor
  · intro hdecode
    obtain ⟨machineSteps, path, hpath, hhorizon, hconfig⟩ :=
      fixedRogozhinPassDecoder_some_only_at_fixedRegisteredBoundary initial
        horizon hdecode
    exact ⟨machineSteps, path, hpath, hhorizon,
      hconfig.trans path.config_eq⟩
  · rintro ⟨machineSteps, path, hpath, rfl, hconfig⟩
    rw [← path.config_eq] at hconfig
    subst config
    exact fixedRogozhinPassDecoder_at_fixedRegisteredBoundary hpath

/-- Boundary times in the fixed timeline are injective in the represented
machine-step index. -/
theorem fixedRegisteredBoundary_machineSteps_unique
    {initial : MachineConfig} {firstIndex secondIndex horizon : Nat}
    {firstPath : RegisteredPath initial (.canonical) firstIndex}
    {secondPath : RegisteredPath initial (.canonical) secondIndex}
    (hfirst : fixedRegisteredPath? initial firstIndex = some firstPath)
    (hsecond : fixedRegisteredPath? initial secondIndex = some secondPath)
    (hfirstTime : horizon = Cook.ctsPeriod * firstPath.tagSteps)
    (hsecondTime : horizon = Cook.ctsPeriod * secondPath.tagSteps) :
    firstIndex = secondIndex := by
  have hscaled : Cook.ctsPeriod * firstPath.tagSteps =
      Cook.ctsPeriod * secondPath.tagSteps := hfirstTime.symm.trans hsecondTime
  have htag : firstPath.tagSteps = secondPath.tagSteps :=
    Nat.eq_of_mul_eq_mul_left (by decide : 0 < Cook.ctsPeriod) hscaled
  rcases Nat.lt_trichotomy firstIndex secondIndex with hlt | heq | hgt
  · have hstrict := fixedRegisteredPath?_tagSteps_strict hfirst hsecond hlt
    exact (Nat.ne_of_lt hstrict htag).elim
  · exact heq
  · have hstrict := fixedRegisteredPath?_tagSteps_strict hsecond hfirst hgt
    exact (Nat.ne_of_gt hstrict htag).elim

/-- The existential index in the exact decoder equation is unique. -/
theorem fixedRogozhinPassDecoder_some_iff_existsUnique_machineSteps
    (initial : MachineConfig) (horizon : Nat) (config : MachineConfig) :
    fixedRogozhinPassDecoder horizon
      (CTS.iterate Cook.rogozhinCookProgram horizon
        (CTS.initial Cook.rogozhinCookProgram
          (fixedRogozhinCanonicalBits initial))) = some config ↔
      ∃ machineSteps : Nat,
        (∃ path : RegisteredPath initial (.canonical) machineSteps,
            fixedRegisteredPath? initial machineSteps = some path ∧
            horizon = Cook.ctsPeriod * path.tagSteps ∧
            config = Rogozhin46.iterate machineSteps initial) ∧
        ∀ other : Nat,
          (∃ path : RegisteredPath initial (.canonical) other,
            fixedRegisteredPath? initial other = some path ∧
            horizon = Cook.ctsPeriod * path.tagSteps ∧
            config = Rogozhin46.iterate other initial) →
          other = machineSteps := by
  rw [fixedRogozhinPassDecoder_some_iff_fixedRegisteredBoundary]
  constructor
  · rintro ⟨machineSteps, path, hpath, hhorizon, hconfig⟩
    refine ⟨machineSteps, ⟨path, hpath, hhorizon, hconfig⟩, ?_⟩
    intro other hother
    obtain ⟨otherPath, hotherPath, hotherHorizon, _⟩ := hother
    exact fixedRegisteredBoundary_machineSteps_unique hotherPath hpath
      hotherHorizon hhorizon
  · rintro ⟨machineSteps, witness, _⟩
    exact ⟨machineSteps, witness⟩

/-- Successful bare decoding exposes the unique public checkpoint and its
successful pass decode. -/
theorem fixedRogozhinBareTermDecoder_some_decompose
    {term : Term} {config : MachineConfig}
    (hdecode : fixedRogozhinBareTermDecoder term = some config) :
    ∃ horizon : Nat,
      ∃ snapshot : CTS.Config Cook.rogozhinCookProgram,
        PublicDecoder.decode Cook.rogozhinCookProgram
            trajectoryDispatcher.tree term = some (horizon, snapshot) ∧
        fixedRogozhinPassDecoder horizon snapshot = some config := by
  unfold fixedRogozhinBareTermDecoder at hdecode
  cases hpublic : PublicDecoder.decode Cook.rogozhinCookProgram
      trajectoryDispatcher.tree term with
  | none =>
      rw [hpublic] at hdecode
      contradiction
  | some checkpoint =>
      rw [hpublic] at hdecode
      rcases checkpoint with ⟨horizon, snapshot⟩
      exact ⟨horizon, snapshot, rfl, hdecode⟩

/-- Exact equation (21) on the complete pure-`S` contraction trajectory.
Success occurs exactly at the scheduler checkpoint of a deterministic
registered Cook boundary; all other contractions are rejected. -/
theorem fixedRogozhinBareTermDecoder_run_some_iff_fixedRegisteredBoundary
    (initial : MachineConfig) (index : Nat) (config : MachineConfig) :
    fixedRogozhinBareTermDecoder
        ((fixedRogozhinCheckpointSystem initial).contractionRun index).cursor.erase =
      some config ↔
      ∃ horizon : Nat,
        ∃ machineSteps : Nat,
          ∃ path : RegisteredPath initial (.canonical) machineSteps,
            index = ExactCheckpointRun.checkpointTime
              Cook.rogozhinCookProgram trajectoryDispatcher
              (fixedRogozhinCanonicalBits initial) horizon ∧
            fixedRegisteredPath? initial machineSteps = some path ∧
            horizon = Cook.ctsPeriod * path.tagSteps ∧
            config = Rogozhin46.iterate machineSteps initial := by
  constructor
  · intro hbare
    obtain ⟨horizon, snapshot, hpublic, hpass⟩ :=
      fixedRogozhinBareTermDecoder_some_decompose hbare
    have accepted :=
      SchedulerInvariant.SampledGood.contractionRun_publicAcceptsOnly
        Cook.rogozhinCookProgram trajectoryDispatcher
        (fixedRogozhinCanonicalBits initial)
        (SchedulerBound.bound Cook.rogozhinCookProgram trajectoryDispatcher)
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          trajectoryDispatcher (fixedRogozhinCanonicalBits initial))
        (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram
          trajectoryDispatcher (fixedRogozhinCanonicalBits initial))
        index horizon snapshot (by
          simpa only [fixedRogozhinCheckpointSystem] using hpublic)
    rw [accepted.2] at hpass
    obtain ⟨machineSteps, path, hpath, hhorizon, hconfig⟩ :=
      fixedRogozhinPassDecoder_some_only_at_fixedRegisteredBoundary initial
        horizon hpass
    exact ⟨horizon, machineSteps, path, accepted.1, hpath, hhorizon,
      hconfig.trans path.config_eq⟩
  · rintro ⟨horizon, machineSteps, path, hindex, hpath, hhorizon,
      hconfig⟩
    subst index
    change fixedRogozhinBareTermDecoder
        (fixedRogozhinCheckpointTerm initial horizon) = some config
    rw [fixedRogozhinBareTermDecoder_checkpoint_eq_pass]
    exact (fixedRogozhinPassDecoder_some_iff_fixedRegisteredBoundary
      initial horizon config).2
        ⟨machineSteps, path, hpath, hhorizon, hconfig⟩

/-- Explicit exact-rejection form at the Cook CTS layer. -/
theorem fixedRogozhinPassDecoder_none_iff_no_fixedRegisteredBoundary
    (initial : MachineConfig) (horizon : Nat) :
    fixedRogozhinPassDecoder horizon
      (CTS.iterate Cook.rogozhinCookProgram horizon
        (CTS.initial Cook.rogozhinCookProgram
          (fixedRogozhinCanonicalBits initial))) = none ↔
      ¬ ∃ machineSteps : Nat,
        ∃ path : RegisteredPath initial (.canonical) machineSteps,
          fixedRegisteredPath? initial machineSteps = some path ∧
          horizon = Cook.ctsPeriod * path.tagSteps := by
  constructor
  · intro hnone
    rintro ⟨machineSteps, path, hpath, hhorizon⟩
    have hsome :=
      (fixedRogozhinPassDecoder_some_iff_fixedRegisteredBoundary initial
        horizon (Rogozhin46.iterate machineSteps initial)).2
        ⟨machineSteps, path, hpath, hhorizon, rfl⟩
    rw [hnone] at hsome
    contradiction
  · intro hno
    cases hdecoder : fixedRogozhinPassDecoder horizon
        (CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (fixedRogozhinCanonicalBits initial))) with
    | none => rfl
    | some config =>
        obtain ⟨machineSteps, path, hpath, hhorizon, _⟩ :=
          (fixedRogozhinPassDecoder_some_iff_fixedRegisteredBoundary initial
            horizon config).1 hdecoder
        exact (hno ⟨machineSteps, path, hpath, hhorizon⟩).elim

/-- Explicit exact-rejection form of equation (21): the total bare decoder is
`none` exactly away from the registered-boundary checkpoint indices. -/
theorem fixedRogozhinBareTermDecoder_run_none_iff_no_fixedRegisteredBoundary
    (initial : MachineConfig) (index : Nat) :
    fixedRogozhinBareTermDecoder
        ((fixedRogozhinCheckpointSystem initial).contractionRun index).cursor.erase =
      none ↔
      ¬ ∃ horizon : Nat,
        ∃ machineSteps : Nat,
          ∃ path : RegisteredPath initial (.canonical) machineSteps,
            index = ExactCheckpointRun.checkpointTime
              Cook.rogozhinCookProgram trajectoryDispatcher
              (fixedRogozhinCanonicalBits initial) horizon ∧
            fixedRegisteredPath? initial machineSteps = some path ∧
            horizon = Cook.ctsPeriod * path.tagSteps := by
  constructor
  · intro hnone
    rintro ⟨horizon, machineSteps, path, hindex, hpath, hhorizon⟩
    have hsome :=
      (fixedRogozhinBareTermDecoder_run_some_iff_fixedRegisteredBoundary
        initial index (Rogozhin46.iterate machineSteps initial)).2
        ⟨horizon, machineSteps, path, hindex, hpath, hhorizon, rfl⟩
    rw [hnone] at hsome
    contradiction
  · intro hno
    cases hdecoder : fixedRogozhinBareTermDecoder
        ((fixedRogozhinCheckpointSystem initial).contractionRun index).cursor.erase with
    | none => rfl
    | some config =>
        obtain ⟨horizon, machineSteps, path, hindex, hpath, hhorizon, _⟩ :=
          (fixedRogozhinBareTermDecoder_run_some_iff_fixedRegisteredBoundary
            initial index config).1 hdecoder
        exact (hno ⟨horizon, machineSteps, path, hindex, hpath, hhorizon⟩).elim


end PureSFormal.WeakPathUniversality
