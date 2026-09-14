import PureSFormal.Research.ProtectedTrieConfluence

/-!
# Confluence obstruction for exclusive source branching

This module states the boundary behind the persistent-history semantics.  A
total functional decoder that is forward sound on every pure-`S` reduct and
back-complete for every source descendant can exist only when the decoded
source cone is directed.  In particular it cannot preserve two distinct
terminal alternatives as exclusive states.
-/

namespace PureSFormal.Research.ProtectedTrieConfluenceObstruction

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieConfluence

/-- Reflexive-transitive closure of an arbitrary source relation. -/
inductive SourceSteps {State : Type} (Next : State -> State -> Prop) :
    State -> State -> Prop where
  | refl (state : State) : SourceSteps Next state state
  | tail {first middle last : State} :
      SourceSteps Next first middle -> Next middle last ->
        SourceSteps Next first last

namespace SourceSteps

theorem single {State : Type} {Next : State -> State -> Prop}
    {first last : State} (hstep : Next first last) :
    SourceSteps Next first last :=
  .tail (.refl first) hstep

theorem trans {State : Type} {Next : State -> State -> Prop}
    {first middle last : State}
    (hfirst : SourceSteps Next first middle)
    (hlast : SourceSteps Next middle last) :
    SourceSteps Next first last := by
  induction hlast with
  | refl => exact hfirst
  | tail hprefix hstep ih => exact .tail ih hstep

/-- A state with no outgoing transition has no distinct descendant. -/
theorem eq_of_sink {State : Type} {Next : State -> State -> Prop}
    {source target : State}
    (hsink : forall next, Not (Next source next))
    (hsteps : SourceSteps Next source target) :
    target = source := by
  induction hsteps with
  | refl => rfl
  | tail hprefix hstep ih =>
      exact False.elim (hsink _ (ih ▸ hstep))

end SourceSteps

/-! ## Relation-independent obstruction -/

/--
Confluence of a reachability relation: any two targets reachable from the
same source have a common successor.  The relation supplied here may already
be a reflexive-transitive closure; no target-specific syntax is assumed.
-/
def Confluent {Target : Type} (Reach : Target -> Target -> Prop) : Prop :=
  forall {source left right}, Reach source left -> Reach source right ->
    exists join, Reach left join /\ Reach right join

/--
For any confluent target reachability relation, forward soundness and
back-completeness force the decoded reachable source cone to be directed.
-/
theorem decoded_cone_directed_of_confluent
    {Target State : Type}
    (Reach : Target -> Target -> Prop) (hconfluent : Confluent Reach)
    (Next : State -> State -> Prop)
    (initial : State) (encoded : Target) (decode : Target -> State)
    (forward : forall {source target}, Reach encoded source ->
      Reach source target ->
        SourceSteps Next (decode source) (decode target))
    (back : forall {state}, SourceSteps Next initial state ->
      exists term, Reach encoded term /\ decode term = state)
    {left right : State}
    (hleft : SourceSteps Next initial left)
    (hright : SourceSteps Next initial right) :
    exists join,
      SourceSteps Next left join /\ SourceSteps Next right join := by
  obtain ⟨leftTerm, hencodedLeft, hdecodeLeft⟩ := back hleft
  obtain ⟨rightTerm, hencodedRight, hdecodeRight⟩ := back hright
  obtain ⟨joinTerm, hleftJoin, hrightJoin⟩ :=
    hconfluent hencodedLeft hencodedRight
  refine ⟨decode joinTerm, ?_, ?_⟩
  · simpa [hdecodeLeft] using forward hencodedLeft hleftJoin
  · simpa [hdecodeRight] using forward hencodedRight hrightJoin

/--
Two source descendants with no common continuation rule out a total
functional decoder that is forward sound and back-complete into any
confluent target relation.
-/
theorem no_exclusive_fork_decoder_of_confluent
    {Target State : Type}
    (Reach : Target -> Target -> Prop) (hconfluent : Confluent Reach)
    (Next : State -> State -> Prop)
    (initial left right : State)
    (hleft : SourceSteps Next initial left)
    (hright : SourceSteps Next initial right)
    (hseparate : Not (exists join,
      SourceSteps Next left join /\ SourceSteps Next right join)) :
    Not (exists (encoded : Target) (decode : Target -> State),
      decode encoded = initial /\
      (forall {source target}, Reach encoded source ->
        Reach source target ->
          SourceSteps Next (decode source) (decode target)) /\
      (forall {state}, SourceSteps Next initial state ->
        exists term, Reach encoded term /\ decode term = state)) := by
  rintro ⟨encoded, decode, _hinitial, forward, back⟩
  exact hseparate
    (decoded_cone_directed_of_confluent Reach hconfluent Next initial
      encoded decode forward back hleft hright)

/--
Two distinct reachable source sinks are a concrete exclusive fork, hence
they cannot be represented by such a decoder into any confluent target.
-/
theorem no_distinct_terminal_fork_decoder_of_confluent
    {Target State : Type}
    (Reach : Target -> Target -> Prop) (hconfluent : Confluent Reach)
    (Next : State -> State -> Prop)
    (initial left right : State)
    (hleft : SourceSteps Next initial left)
    (hright : SourceSteps Next initial right)
    (hleftSink : forall next, Not (Next left next))
    (hrightSink : forall next, Not (Next right next))
    (hne : left ≠ right) :
    Not (exists (encoded : Target) (decode : Target -> State),
      decode encoded = initial /\
      (forall {source target}, Reach encoded source ->
        Reach source target ->
          SourceSteps Next (decode source) (decode target)) /\
      (forall {state}, SourceSteps Next initial state ->
        exists term, Reach encoded term /\ decode term = state)) := by
  apply no_exclusive_fork_decoder_of_confluent Reach hconfluent Next
    initial left right hleft hright
  rintro ⟨join, hleftJoin, hrightJoin⟩
  have hjoinLeft : join = left := SourceSteps.eq_of_sink hleftSink hleftJoin
  have hjoinRight : join = right := SourceSteps.eq_of_sink hrightSink hrightJoin
  exact hne (hjoinLeft.symm.trans hjoinRight)

/-- Every pair of states in the decoded reachable cone has a common source descendant. -/
theorem decoded_cone_directed
    {State : Type} (Next : State -> State -> Prop)
    (initial : State) (encoded : Term) (decode : Term -> State)
    (forward : forall {source target}, Steps encoded source ->
      Steps source target ->
        SourceSteps Next (decode source) (decode target))
    (back : forall {state}, SourceSteps Next initial state ->
      exists term, Steps encoded term /\ decode term = state)
    {left right : State}
    (hleft : SourceSteps Next initial left)
    (hright : SourceSteps Next initial right) :
    exists join,
      SourceSteps Next left join /\ SourceSteps Next right join := by
  exact decoded_cone_directed_of_confluent Steps
    (fun hleft hright => steps_confluent hleft hright)
    Next initial encoded decode forward back hleft hright

/-- Two exclusive source descendants with no common continuation rule out such a decoder. -/
theorem no_exclusive_fork_decoder
    {State : Type} (Next : State -> State -> Prop)
    (initial left right : State)
    (hleft : SourceSteps Next initial left)
    (hright : SourceSteps Next initial right)
    (hseparate : Not (exists join,
      SourceSteps Next left join /\ SourceSteps Next right join)) :
    Not (exists (encoded : Term) (decode : Term -> State),
      decode encoded = initial /\
      (forall {source target}, Steps encoded source ->
        Steps source target ->
          SourceSteps Next (decode source) (decode target)) /\
      (forall {state}, SourceSteps Next initial state ->
        exists term, Steps encoded term /\ decode term = state)) := by
  exact no_exclusive_fork_decoder_of_confluent Steps
    (fun hleft hright => steps_confluent hleft hright)
    Next initial left right hleft hright hseparate

/-- Two distinct reachable sink states are a concrete exclusive terminal
fork, so confluence rules out a total functional all-reduct decoder that is
both forward sound and complete on the source cone. -/
theorem no_distinct_terminal_fork_decoder
    {State : Type} (Next : State -> State -> Prop)
    (initial left right : State)
    (hleft : SourceSteps Next initial left)
    (hright : SourceSteps Next initial right)
    (hleftSink : forall next, Not (Next left next))
    (hrightSink : forall next, Not (Next right next))
    (hne : left ≠ right) :
    Not (exists (encoded : Term) (decode : Term -> State),
      decode encoded = initial /\
      (forall {source target}, Steps encoded source ->
        Steps source target ->
          SourceSteps Next (decode source) (decode target)) /\
      (forall {state}, SourceSteps Next initial state ->
        exists term, Steps encoded term /\ decode term = state)) := by
  exact no_distinct_terminal_fork_decoder_of_confluent Steps
    (fun hleft hright => steps_confluent hleft hright)
    Next initial left right hleft hright hleftSink hrightSink hne

end PureSFormal.Research.ProtectedTrieConfluenceObstruction
