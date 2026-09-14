import PureSFormal.Research.ProtectedTrieExecutableSchedule
import PureSFormal.Research.ProtectedTrieLabelSemantics
import PureSFormal.Research.ProtectedTrieWholeObserverExactCost

/-!
# Bounded literal terminal certificates

This module isolates the quantitative bridge needed by bounded-reachability
complexity arguments.  A witness is a literal occurrence history together
with a literal tableau payload.  The Boolean checker is the existing local
tableau/terminal-label checker; the target program is the existing executable
root-relative insertion schedule for that one complete certificate address.

No complexity class is defined here.  The results instead expose the exact
finite objects that such a definition must charge: the history, payload,
address schedule, and a closed contraction bound linear in their literal
lengths.
-/

namespace PureSFormal.Research.ProtectedTrieBoundedTerminal

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieExecutableSchedule
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieSingleOpening
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongTheorem
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauExactCost
open PureSFormal.Research.ProtectedTrieTableauLabel
open PureSFormal.Research.ProtectedTrieWholeObserverExactCost

/-! ## Literal code lengths -/

/-- Every history bit occupies the literal route block `1b`. -/
@[simp]
theorem routeCode_length (history : BitWord) :
    (r history).length = 2 * history.length := by
  induction history with
  | nil => rfl
  | cons bit history ih =>
      simp [ih, Nat.mul_succ, Nat.add_assoc]

/-- The self-delimiting payload has one delimiter and two payload-length
blocks: the unary length and the payload itself. -/
@[simp]
theorem payloadCode_length (payload : BitWord) :
    (pc payload).length = 2 * payload.length + 1 := by
  rw [pc_eq_replicate, List.length_append, List.length_replicate,
    List.length_cons]
  simp [Nat.two_mul, Nat.add_assoc]

/-- Closed literal length of a complete protected certificate address. -/
@[simp]
theorem candidateAddress_length (history payload : BitWord) :
    (a history payload).length =
      2 * history.length + 2 * payload.length + 2 := by
  simp only [a, List.length_append, List.length_cons, routeCode_length,
    payloadCode_length]
  simp [Nat.add_assoc]

/-- Closed literal length of the next-child router below a history region. -/
@[simp]
theorem router_length (history : BitWord) :
    (router history).length = 2 * history.length + 1 := by
  simp only [router, List.length_append, List.length_cons, List.length_nil,
    routeCode_length]

/-! ## One supplied certificate as an executable bounded target program -/

/-- Root-relative contractions that open exactly one supplied candidate
address from the finite encoder's unopened trie. -/
def candidateSchedule (history payload : BitWord) : List Address :=
  insertPathSchedule ProtectedFieldContext.hole (phaseAt 0)
    (a history payload) PrefixTree.empty

/-- Canonical endpoint of the one-candidate insertion program. -/
def candidateTerm (source : Instance) (history payload : BitWord) : Term :=
  seededBuild (encodeInstance source)
    (insertPath (a history payload) PrefixTree.empty)

/-- Executing the supplied candidate program from the actual finite encoder
reaches its canonical one-candidate endpoint exactly. -/
theorem replay_candidateSchedule (source : Instance)
    (history payload : BitWord) :
    replayAddresses (strongEncoder source) (candidateSchedule history payload) =
      some (candidateTerm source history payload) := by
  have hreplay := replay_insertPathSchedule (encodeInstance source)
    ProtectedFieldContext.hole (phaseAt 0) (goodPhase_phaseAt 0)
    (a history payload) PrefixTree.empty
  simpa [candidateSchedule, candidateTerm, strongEncoder, encoder,
    seededBuild, buildAt, seededFieldTerm, ProtectedFieldContext.plug,
    phaseGenerator, phaseAt] using! hreplay

/-- The program is a genuine finite pure-`S` reduction, not merely a list of
addresses with a claimed endpoint. -/
theorem candidateSchedule_steps (source : Instance)
    (history payload : BitWord) :
    Steps (strongEncoder source) (candidateTerm source history payload) :=
  replayAddresses_sound (replay_candidateSchedule source history payload)

/-- The endpoint literally exposes the complete supplied candidate address. -/
theorem candidateAddress_mem_openedPaths (source : Instance)
    (history payload : BitWord) :
    List.Mem (a history payload)
      (anchoredOpenedPaths (candidateTerm source history payload)) := by
  rw [candidateTerm, anchoredOpenedPaths_seededBuild]
  exact (mem_paths_insertPath_iff (a history payload) (a history payload)
    PrefixTree.empty).mpr (Or.inr (WordPrefix.refl _))

/-- At most seven contractions are used per opened address node. -/
theorem candidateSchedule_length_le_address (history payload : BitWord) :
    (candidateSchedule history payload).length <=
      7 * ((a history payload).length + 1) := by
  exact insertPathSchedule_length_le ProtectedFieldContext.hole (phaseAt 0)
    (a history payload) PrefixTree.empty

/-- Closed contraction budget for inserting one supplied literal
history/tableau certificate. -/
theorem candidateSchedule_length_le (history payload : BitWord) :
    (candidateSchedule history payload).length <=
      14 * history.length + 14 * payload.length + 21 := by
  have hbound := candidateSchedule_length_le_address history payload
  rw [candidateAddress_length] at hbound
  simp only [Nat.mul_add, Nat.add_assoc] at hbound
  rw [← Nat.mul_assoc 7 2 history.length,
    ← Nat.mul_assoc 7 2 payload.length] at hbound
  exact hbound

/-- Every local opening script contains at least six contractions. -/
theorem openingSchedule_length_ge_six {path : BitWord}
    (context : ProtectedFieldContext path) (phase : Nat × Nat) :
    6 <= (openingSchedule context phase).length := by
  rcases phase with ⟨m, n⟩
  cases m <;> simp [openingSchedule, openingLocalSchedule,
    zeroLocalSchedule, positiveLocalSchedule]

/-- Opening an endpoint from an empty trie performs one local opening per
literal address node, including the endpoint itself. -/
theorem insertPathSchedule_empty_length_ge {contextPath : BitWord}
    (context : ProtectedFieldContext contextPath) (phase : Nat × Nat)
    (endpoint : BitWord) :
    6 * (endpoint.length + 1) <=
      (insertPathSchedule context phase endpoint PrefixTree.empty).length := by
  induction endpoint generalizing contextPath phase context with
  | nil =>
      simpa [insertPathSchedule] using
        openingSchedule_length_ge_six context phase
  | cons bit rest ih =>
      cases bit with
      | false =>
          have hopen := openingSchedule_length_ge_six context phase
          have hrest := ih
            (context := context.extendLeft
              (phaseGenerator (nextPhase phase)) (phaseJunk phase))
            (phase := nextPhase phase)
          have hsum := Nat.add_le_add hopen hrest
          simpa only [insertPathSchedule, List.length_append,
            List.length_cons, Nat.mul_add, Nat.mul_one, Nat.add_assoc,
            Nat.add_comm, Nat.add_left_comm] using hsum
      | true =>
          have hopen := openingSchedule_length_ge_six context phase
          have hrest := ih
            (context := context.extendRight
              (phaseGenerator (nextPhase phase)) (phaseJunk phase))
            (phase := nextPhase phase)
          have hsum := Nat.add_le_add hopen hrest
          simpa only [insertPathSchedule, List.length_append,
            List.length_cons, Nat.mul_add, Nat.mul_one, Nat.add_assoc,
            Nat.add_comm, Nat.add_left_comm] using hsum

/-- Closed lower contraction bound for one supplied certificate address. -/
theorem candidateSchedule_length_ge_address (history payload : BitWord) :
    6 * ((a history payload).length + 1) <=
      (candidateSchedule history payload).length := by
  exact insertPathSchedule_empty_length_ge ProtectedFieldContext.hole
    (phaseAt 0) (a history payload)

/-- The complete literal certificate address is no longer than its explicit
contraction schedule. -/
theorem candidateAddress_length_le_schedule (history payload : BitWord) :
    (a history payload).length <=
      (candidateSchedule history payload).length := by
  let addressLength := (a history payload).length
  have hfirst : addressLength <= addressLength + 1 :=
    Nat.le_add_right addressLength 1
  have hfactor : addressLength + 1 <= 6 * (addressLength + 1) := by
    have hmul := Nat.mul_le_mul_right (addressLength + 1)
      (by decide : 1 <= 6)
    simpa only [Nat.one_mul, Nat.mul_comm] using hmul
  exact Nat.le_trans hfirst (Nat.le_trans hfactor
    (candidateSchedule_length_ge_address history payload))

/-- In particular, a contraction budget for this canonical program also
bounds the combined literal history and tableau lengths. -/
theorem candidateLiteral_length_le_schedule (history payload : BitWord) :
    history.length + payload.length <=
      (candidateSchedule history payload).length := by
  have hdouble : history.length + payload.length <=
      2 * (history.length + payload.length) := by
    simpa only [Nat.two_mul] using
      Nat.le_add_right (history.length + payload.length)
        (history.length + payload.length)
  have hpad : 2 * (history.length + payload.length) <=
      2 * (history.length + payload.length) + 2 :=
    Nat.le_add_right _ 2
  have hcode : 2 * (history.length + payload.length) + 2 =
      (a history payload).length := by
    rw [candidateAddress_length]
    simp only [Nat.mul_add, Nat.add_assoc]
  rw [hcode] at hpad
  exact Nat.le_trans hdouble (Nat.le_trans hpad
    (candidateAddress_length_le_schedule history payload))

/-! ## Root-relative address serialization bounds -/

/-- A protected field uses two application edges for a left trie edge and
three for a right trie edge, hence at most three physical edges per abstract
trie bit. -/
theorem protectedFieldAddress_length_le {path : BitWord}
    (context : ProtectedFieldContext path) :
    context.address.length <= 3 * path.length := by
  induction context with
  | hole => simp [ProtectedFieldContext.address]
  | left inner right junk ih =>
      have hprefix : 2 + inner.address.length <= 3 + inner.address.length :=
        Nat.add_le_add_right (by decide : 2 <= 3) inner.address.length
      have hsmall := Nat.le_trans hprefix (Nat.add_le_add_left ih 3)
      simp only [ProtectedFieldContext.address, List.length_append,
        List.length_cons, List.length_nil, Nat.mul_succ]
      simpa only [show (2 : Nat) = 1 + 1 by decide,
        show (3 : Nat) = 1 + 1 + 1 by decide, Nat.zero_add,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hsmall
  | right left junk inner ih =>
      have hsmall := Nat.add_le_add_left ih 3
      simp only [ProtectedFieldContext.address, List.length_append,
        List.length_cons, List.length_nil, Nat.mul_succ]
      simpa only [show (3 : Nat) = 1 + 1 + 1 by decide, Nat.zero_add,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hsmall

/-- Structural map-membership equivalence, avoiding quotient-backed generic
finite-set infrastructure in the trusted theorem profile. -/
theorem mem_map_iff_literal {alpha beta : Type} (value : beta)
    (items : List alpha) (f : alpha -> beta) :
    List.Mem value (items.map f) <->
      exists item, List.Mem item items /\ f item = value := by
  induction items with
  | nil =>
      constructor
      · intro hmem
        cases hmem
      · rintro ⟨item, hmem, _⟩
        cases hmem
  | cons head tail ih =>
      constructor
      · intro hmem
        rcases List.mem_cons.mp hmem with heq | htail
        · exact ⟨head, List.Mem.head tail, heq.symm⟩
        · obtain ⟨item, hitem, heq⟩ := ih.mp htail
          exact ⟨item, List.Mem.tail head hitem, heq⟩
      · rintro ⟨item, hitem, heq⟩
        rcases List.mem_cons.mp hitem with hhead | htail
        · subst item
          exact heq ▸ List.Mem.head _
        · exact List.Mem.tail (f head) (ih.mpr ⟨item, htail, heq⟩)

/-- Structural append-membership equivalence with no finite-set quotient. -/
theorem mem_append_iff_literal {alpha : Type} (value : alpha)
    (first second : List alpha) :
    List.Mem value (first ++ second) <->
      List.Mem value first \/ List.Mem value second := by
  induction first with
  | nil =>
      constructor
      · exact Or.inr
      · intro hmem
        cases hmem with
        | inl hnil => cases hnil
        | inr hsecond => exact hsecond
  | cons head tail ih =>
      constructor
      · intro hmem
        rcases List.mem_cons.mp hmem with hhead | htail
        · subst value
          exact Or.inl (List.Mem.head _)
        · rcases ih.mp htail with htail' | hsecond
          · exact Or.inl (List.Mem.tail head htail')
          · exact Or.inr hsecond
      · intro hmem
        rcases hmem with hfirst | hsecond
        · rcases List.mem_cons.mp hfirst with hhead | htail
          · subst value
            exact List.Mem.head _
          · exact List.Mem.tail head (ih.mpr (Or.inl htail))
        · exact List.Mem.tail head (ih.mpr (Or.inr hsecond))

/-- Every local redex suffix in either the six-step or seven-step opening
script has length at most two. -/
theorem mem_openingLocalSchedule_length_le (phase : Nat × Nat)
    {suffix : Address} (hmem : List.Mem suffix (openingLocalSchedule phase)) :
    suffix.length <= 2 := by
  rcases phase with ⟨m, n⟩
  cases m with
  | zero =>
      exact (by decide : forall item,
        List.Mem item zeroLocalSchedule -> item.length <= 2) suffix hmem
  | succ m =>
      exact (by decide : forall item,
        List.Mem item positiveLocalSchedule -> item.length <= 2) suffix hmem

/-- Lifting one local opening below the frozen header gives a linear physical
address bound in the abstract field depth. -/
theorem mem_openingSchedule_address_length_le {path : BitWord}
    (context : ProtectedFieldContext path) (phase : Nat × Nat)
    {address : Address} (hmem : List.Mem address (openingSchedule context phase)) :
    address.length <= 3 * path.length + 3 := by
  rw [openingSchedule] at hmem
  obtain ⟨suffix, hsuffix, rfl⟩ :=
    (mem_map_iff_literal address (openingLocalSchedule phase)
      (fieldAddress context)).mp hmem
  have hlocal := mem_openingLocalSchedule_length_le phase hsuffix
  have hcontext := protectedFieldAddress_length_le context
  have hcombined0 :
      1 + context.address.length + suffix.length <= 1 + 3 * path.length + 2 :=
    Nat.add_le_add (Nat.add_le_add_left hcontext 1) hlocal
  have hcombined :
      1 + context.address.length + suffix.length <= 3 * path.length + 3 := by
    have hreorder : 1 + 3 * path.length + 2 = 3 * path.length + 3 := by
      calc
        1 + 3 * path.length + 2 = 3 * path.length + 1 + 2 := by
          rw [Nat.add_comm 1 (3 * path.length)]
        _ = 3 * path.length + (1 + 2) := by
          rw [Nat.add_assoc]
        _ = 3 * path.length + 3 := rfl
    rw [hreorder] at hcombined0
    exact hcombined0
  simp only [fieldAddress, List.length_append, List.length_cons,
    List.length_nil, Nat.zero_add]
  exact hcombined

/-- Every address emitted while inserting one endpoint is linear in the
initial protected depth plus the remaining abstract endpoint length. -/
theorem mem_insertPathSchedule_address_length_le {contextPath : BitWord}
    (context : ProtectedFieldContext contextPath) (phase : Nat × Nat)
    (endpoint : BitWord) (tree : PrefixTree) {address : Address}
    (hmem : List.Mem address (insertPathSchedule context phase endpoint tree)) :
    address.length <= 3 * (contextPath.length + endpoint.length) + 3 := by
  induction endpoint generalizing contextPath phase tree context address with
  | nil =>
      cases tree with
      | empty =>
          simpa [insertPathSchedule] using
            mem_openingSchedule_address_length_le context phase hmem
      | node left right =>
          change List.Mem address [] at hmem
          cases hmem
  | cons bit rest ih =>
      cases tree with
      | empty =>
          cases bit with
          | false =>
              rcases (mem_append_iff_literal address _ _).mp hmem with
                hopen | hrest
              · have hcurrent :=
                  mem_openingSchedule_address_length_le context phase hopen
                have hpad : 3 * contextPath.length + 3 <=
                    (3 * contextPath.length + 3) +
                      (3 * rest.length + 3) :=
                  Nat.le_add_right _ _
                simpa [Nat.mul_add, Nat.mul_succ, Nat.add_assoc,
                  Nat.add_comm, Nat.add_left_comm] using
                    Nat.le_trans hcurrent hpad
              · have hnext := ih
                  (context := context.extendLeft
                    (phaseGenerator (nextPhase phase)) (phaseJunk phase))
                  (phase := nextPhase phase) (tree := PrefixTree.empty) hrest
                simp only [List.length_append, List.length_cons, List.length_nil]
                  at hnext
                simpa [Nat.mul_add, Nat.mul_succ, Nat.add_assoc,
                  Nat.add_comm, Nat.add_left_comm] using hnext
          | true =>
              rcases (mem_append_iff_literal address _ _).mp hmem with
                hopen | hrest
              · have hcurrent :=
                  mem_openingSchedule_address_length_le context phase hopen
                have hpad : 3 * contextPath.length + 3 <=
                    (3 * contextPath.length + 3) +
                      (3 * rest.length + 3) :=
                  Nat.le_add_right _ _
                simpa [Nat.mul_add, Nat.mul_succ, Nat.add_assoc,
                  Nat.add_comm, Nat.add_left_comm] using
                    Nat.le_trans hcurrent hpad
              · have hnext := ih
                  (context := context.extendRight
                    (phaseGenerator (nextPhase phase)) (phaseJunk phase))
                  (phase := nextPhase phase) (tree := PrefixTree.empty) hrest
                simp only [List.length_append, List.length_cons, List.length_nil]
                  at hnext
                simpa [Nat.mul_add, Nat.mul_succ, Nat.add_assoc,
                  Nat.add_comm, Nat.add_left_comm] using hnext
      | node left right =>
          cases bit with
          | false =>
              have hnext := ih
                (context := context.extendLeft
                  (buildFrom (nextPhase phase) right) (phaseJunk phase))
                (phase := nextPhase phase) (tree := left) hmem
              simp only [List.length_append, List.length_cons, List.length_nil]
                at hnext
              simpa [Nat.mul_add, Nat.mul_succ, Nat.add_assoc,
                Nat.add_comm, Nat.add_left_comm] using hnext
          | true =>
              have hnext := ih
                (context := context.extendRight
                  (buildFrom (nextPhase phase) left) (phaseJunk phase))
                (phase := nextPhase phase) (tree := right) hmem
              simp only [List.length_append, List.length_cons, List.length_nil]
                at hnext
              simpa [Nat.mul_add, Nat.mul_succ, Nat.add_assoc,
                Nat.add_comm, Nat.add_left_comm] using hnext

/-- Closed maximum root-relative address length in a supplied certificate
program. -/
theorem mem_candidateSchedule_address_length_le (history payload : BitWord)
    {address : Address} (hmem : List.Mem address (candidateSchedule history payload)) :
    address.length <= 6 * history.length + 6 * payload.length + 9 := by
  have hbound := mem_insertPathSchedule_address_length_le
    ProtectedFieldContext.hole (phaseAt 0) (a history payload)
    PrefixTree.empty hmem
  rw [candidateAddress_length] at hbound
  simp only [List.length_nil, Nat.zero_add] at hbound
  simp only [Nat.mul_add, Nat.add_assoc] at hbound
  rw [← Nat.mul_assoc 3 2 history.length,
    ← Nat.mul_assoc 3 2 payload.length] at hbound
  exact hbound

/-- Literal number of direction symbols in an address program. -/
def addressCells (schedule : List Address) : Nat :=
  (schedule.map List.length).sum

theorem addressCells_le_length_mul (schedule : List Address) (bound : Nat)
    (hall : forall address, List.Mem address schedule -> address.length <= bound) :
    addressCells schedule <= schedule.length * bound := by
  induction schedule with
  | nil => simp [addressCells]
  | cons address rest ih =>
      have hhead := hall address (List.Mem.head rest)
      have htail : forall item, List.Mem item rest -> item.length <= bound := by
        intro item hmem
        exact hall item (List.Mem.tail address hmem)
      have hrest := ih htail
      change address.length + addressCells rest <= (rest.length + 1) * bound
      calc
        address.length + addressCells rest <=
            bound + rest.length * bound := Nat.add_le_add hhead hrest
        _ = (rest.length + 1) * bound := by
          simp [Nat.add_mul, Nat.add_comm]

/-- The complete root-relative address-list serialization is quadratic in
the supplied literal history and tableau lengths. -/
theorem candidateSchedule_addressCells_le (history payload : BitWord) :
    addressCells (candidateSchedule history payload) <=
      (14 * history.length + 14 * payload.length + 21) *
        (6 * history.length + 6 * payload.length + 9) := by
  have hcells := addressCells_le_length_mul
    (candidateSchedule history payload)
    (6 * history.length + 6 * payload.length + 9)
    (fun address hmem =>
      mem_candidateSchedule_address_length_le history payload hmem)
  have hlength := candidateSchedule_length_le history payload
  exact Nat.le_trans hcells
    (Nat.mul_le_mul_right _ hlength)

/-! ## A precise bounded terminal-candidate language -/

/-- Total Boolean check of one supplied history/tableau pair.  It succeeds
only when the local tableau verifier returns a label whose literal final row
has neither ordered successor slot enabled. -/
def terminalCandidate? (source : Instance) (history payload : BitWord) : Bool :=
  match verifyLabel? source history payload with
  | none => false
  | some label => label.terminal

/-- The executed terminal checker reuses the counted literal-label verifier
and charges one final inspection of the returned terminal flag. -/
def runTerminalCandidate (source : Instance) (history payload : BitWord) :
    Meter Bool :=
  let checked := runLocalLabelVerifier source history payload
  ⟨match checked.value with
    | none => false
    | some label => label.terminal,
   checked.ticks + 1,
   checked.peak⟩

def terminalCandidateTimeBound (source : Instance)
    (history payload : BitWord) : Nat :=
  localLabelTimeBound source history payload + 1

def terminalCandidateSpaceBound (source : Instance)
    (history payload : BitWord) : Nat :=
  localLabelPeakBound source history payload

@[simp]
theorem runTerminalCandidate_value (source : Instance)
    (history payload : BitWord) :
    (runTerminalCandidate source history payload).value =
      terminalCandidate? source history payload := by
  unfold runTerminalCandidate terminalCandidate?
  simp only [Meter.value, runLocalLabelVerifier_value]

theorem runTerminalCandidate_ticks_le (source : Instance)
    (history payload : BitWord) :
    (runTerminalCandidate source history payload).ticks <=
      terminalCandidateTimeBound source history payload := by
  unfold runTerminalCandidate terminalCandidateTimeBound
  exact Nat.add_le_add_right
    (runLocalLabelVerifier_ticks_le source history payload) 1

theorem runTerminalCandidate_peak_le (source : Instance)
    (history payload : BitWord) :
    (runTerminalCandidate source history payload).peak <=
      terminalCandidateSpaceBound source history payload := by
  unfold runTerminalCandidate terminalCandidateSpaceBound
  exact runLocalLabelVerifier_peak_le source history payload

/-- Extensional specification of the total terminal-candidate checker. -/
theorem terminalCandidate?_eq_true_iff (source : Instance)
    (history payload : BitWord) :
    terminalCandidate? source history payload = true <->
      exists label,
        verifyLabel? source history payload = some label /\
        label.terminal = true := by
  unfold terminalCandidate?
  cases verifyLabel? source history payload with
  | none =>
      constructor
      · intro hfalse
        exact Bool.noConfusion hfalse
      · rintro ⟨label, heq, _⟩
        cases heq
  | some label =>
      constructor
      · intro hflag
        exact ⟨label, rfl, hflag⟩
      · rintro ⟨other, heq, hflag⟩
        cases heq
        exact hflag

/-- Unary-bounded observed reachability certificate.  The only target work
charged here is the explicit root-relative pure-`S` contraction schedule;
the history and tableau remain literal verifier inputs. -/
def BoundedTerminalCandidate (source : Instance) (bound : Nat) : Prop :=
  exists history payload,
    terminalCandidate? source history payload = true /\
    (candidateSchedule history payload).length <= bound

/-- A bounded candidate cannot hide an oversized literal verifier input:
the combined history/tableau length is bounded by the same unary contraction
budget. -/
theorem boundedTerminalCandidate_has_bounded_literals
    (source : Instance) (bound : Nat) :
    BoundedTerminalCandidate source bound ->
      exists history payload,
        terminalCandidate? source history payload = true /\
        (candidateSchedule history payload).length <= bound /\
        history.length + payload.length <= bound := by
  rintro ⟨history, payload, hterminal, hschedule⟩
  exact ⟨history, payload, hterminal, hschedule,
    Nat.le_trans (candidateLiteral_length_le_schedule history payload)
      hschedule⟩

/-- A locally accepted candidate is present as a literal labelled record at
the endpoint of its executable insertion schedule. -/
theorem terminalCandidate_reaches_label
    (source : Instance) (history payload : BitWord)
    (hterminal : terminalCandidate? source history payload = true) :
    exists label,
      Steps (strongEncoder source) (candidateTerm source history payload) /\
      List.Mem ⟨history, payload, label⟩
        (labelledProjection (candidateTerm source history payload)) /\
      label.terminal = true := by
  obtain ⟨label, hlabel, hflag⟩ :=
    (terminalCandidate?_eq_true_iff source history payload).mp hterminal
  refine ⟨label, candidateSchedule_steps source history payload, ?_, hflag⟩
  have hheader :
      headerBits? (candidateTerm source history payload) =
        some (encodeInstance source) := by
    simp [candidateTerm, seededBuild, headerBits?_seededHeader]
  simp only [labelledProjection, hheader, decodeInstance?_encodeInstance]
  exact mem_collectLabels_of_candidate source _ history payload label
    (candidateAddress_mem_openedPaths source history payload) hlabel

/-- Every bounded accepted target certificate denotes a genuine terminal
source history. -/
theorem boundedTerminalCandidate_sound (source : Instance) (bound : Nat) :
    BoundedTerminalCandidate source bound -> SourceBranchHalts source := by
  rintro ⟨history, payload, hterminal, _hbound⟩
  obtain ⟨label, hreach, hmem, hflag⟩ :=
    terminalCandidate_reaches_label source history payload hterminal
  apply (sourceBranchHalts_iff_targetTerminalObservation source).mpr
  exact ⟨candidateTerm source history payload,
    ⟨history, payload, label⟩, hreach, hmem, hflag⟩

/-- A terminal source history supplies a canonical literal tableau whose
one-candidate target program fits the displayed linear budget. -/
theorem sourceBranchHalts_boundedTerminalCandidate
    (source : Instance) (hhalts : SourceBranchHalts source) :
    exists (history payload : BitWord),
      BoundedTerminalCandidate source
        (14 * history.length + 14 * payload.length + 21) := by
  rcases hhalts with ⟨history, finalRow, hrun, hfinalTerminal⟩
  let payload := sourceWitness (encodeInstance source) history
  have hvalid : ValidHistory source history := ⟨finalRow, hrun⟩
  have hisSome := sourceWitness_verifyLabel?_isSome source history hvalid
  cases hlabel : verifyLabel? source history payload with
  | none => simp [payload, hlabel] at hisSome
  | some label =>
      have hreach := candidateSchedule_steps source history payload
      have hmem : List.Mem ⟨history, payload, label⟩
          (labelledProjection (candidateTerm source history payload)) := by
        have hheader :
            headerBits? (candidateTerm source history payload) =
              some (encodeInstance source) := by
          simp [candidateTerm, seededBuild, headerBits?_seededHeader]
        simp only [labelledProjection, hheader, decodeInstance?_encodeInstance]
        exact mem_collectLabels_of_candidate source _ history payload label
          (candidateAddress_mem_openedPaths source history payload) hlabel
      have hrunLabel := labelledProjection_finalRow_eq_sourceRun source hreach hmem
      rw [hrun] at hrunLabel
      have hrow : label.finalRow = finalRow := (Option.some.inj hrunLabel).symm
      have hterminalLabel : label.terminal = true :=
        (verifyLabel?_terminal_iff hlabel).mpr (by simpa [hrow] using hfinalTerminal)
      refine ⟨history, payload, history, payload, ?_,
        candidateSchedule_length_le history payload⟩
      unfold terminalCandidate?
      rw [hlabel]
      exact hterminalLabel

/-- Existence of some unary contraction budget is exactly source branch
halting; no search or normalization premise is hidden in either direction. -/
theorem exists_boundedTerminalCandidate_iff (source : Instance) :
    (exists bound, BoundedTerminalCandidate source bound) <->
      SourceBranchHalts source := by
  constructor
  · rintro ⟨bound, hbounded⟩
    exact boundedTerminalCandidate_sound source bound hbounded
  · intro hhalts
    obtain ⟨history, payload, hbounded⟩ :=
      sourceBranchHalts_boundedTerminalCandidate source hhalts
    exact ⟨14 * history.length + 14 * payload.length + 21, hbounded⟩

end PureSFormal.Research.ProtectedTrieBoundedTerminal
