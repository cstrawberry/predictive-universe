import PureSFormal.Research.ProtectedTrieSubdivision

/-!
# Executable address schedules for protected-trie source branches

The subdivision development gives literal dependent `Walk` witnesses.  This
module supplies the complementary executable object: finite lists of ordinary
root-relative pure-`S` redex addresses, interpreted by `Term.contractAt?`.
The local six- and seven-contraction scripts are data, not proof witnesses.
-/

namespace PureSFormal.Research.ProtectedTrieExecutableSchedule

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieSingleOpening
open PureSFormal.Research.ProtectedTrieSubdivision

/-- Execute a finite list of root-relative redex addresses. -/
def replayAddresses : Term -> List Address -> Option Term
  | term, [] => some term
  | term, address :: rest => do
      let next <- term.contractAt? address
      replayAddresses next rest

@[simp]
theorem replayAddresses_nil (term : Term) : replayAddresses term [] = some term :=
  rfl

theorem replayAddresses_append (term : Term) (first second : List Address) :
    replayAddresses term (first ++ second) =
      (replayAddresses term first).bind (fun middle =>
        replayAddresses middle second) := by
  induction first generalizing term with
  | nil => rfl
  | cons address rest ih =>
      simp only [List.cons_append, replayAddresses]
      cases hstep : term.contractAt? address with
      | none => rfl
      | some next => exact ih next

/-- Execute addresses, retaining the endpoint and every post-step term. -/
def replayWithTrace : Term -> List Address -> Option (Term × List Term)
  | term, [] => some (term, [])
  | term, address :: rest => do
      let next <- term.contractAt? address
      let result <- replayWithTrace next rest
      some (result.1, next :: result.2)

/-- Forgetting an executable trace gives the ordinary executable replay. -/
theorem replayWithTrace_endpoint (term : Term) (schedule : List Address) :
    (replayWithTrace term schedule).map Prod.fst =
      replayAddresses term schedule := by
  induction schedule generalizing term with
  | nil => rfl
  | cons address rest ih =>
      simp only [replayWithTrace, replayAddresses]
      cases hstep : term.contractAt? address with
      | none => rfl
      | some next =>
          dsimp
          cases htrace : replayWithTrace next rest with
          | none =>
              have hvalue := ih next
              rw [htrace] at hvalue
              simpa [Option.bind, htrace] using hvalue
          | some result =>
              have hvalue := ih next
              rw [htrace] at hvalue
              simpa [Option.bind, htrace] using hvalue

/-- Concatenated address programs concatenate traces at their common vertex. -/
theorem replayWithTrace_append (term : Term) (first second : List Address) :
    replayWithTrace term (first ++ second) = (do
      let firstResult <- replayWithTrace term first
      let secondResult <- replayWithTrace firstResult.1 second
      some (secondResult.1, firstResult.2 ++ secondResult.2)) := by
  induction first generalizing term with
  | nil =>
      simp only [List.nil_append, replayWithTrace, Option.bind]
      cases htrace : replayWithTrace term second <;> simp [htrace]
  | cons address rest ih =>
      simp only [List.cons_append, replayWithTrace]
      cases hstep : term.contractAt? address with
      | none => rfl
      | some next =>
          dsimp
          rw [ih next]
          cases hrest : replayWithTrace next rest with
          | none =>
              dsimp
          | some restResult =>
              dsimp
              cases hsecond : replayWithTrace restResult.1 second with
              | none =>
                  dsimp
              | some secondResult =>
                  dsimp

theorem contractAt?_appLeft (source right : Term) (address : Address) :
    (Term.app source right).contractAt? (Direction.left :: address) =
      (source.contractAt? address).map
        (fun target => Term.app target right) := by
  simp only [Term.contractAt?, Term.subterm?]
  cases hselected : source.subterm? address with
  | none => rfl
  | some selected =>
      simp only
      cases hroot : selected.contractRoot? with
      | none => rfl
      | some replacement =>
          simp only
          cases hreplace : source.replace? address replacement with
          | none => simp [Term.replace?, hreplace]
          | some target => simp [Term.replace?, hreplace]

theorem contractAt?_appRight (left source : Term) (address : Address) :
    (Term.app left source).contractAt? (Direction.right :: address) =
      (source.contractAt? address).map
        (fun target => Term.app left target) := by
  simp only [Term.contractAt?, Term.subterm?]
  cases hselected : source.subterm? address with
  | none => rfl
  | some selected =>
      simp only
      cases hroot : selected.contractRoot? with
      | none => rfl
      | some replacement =>
          simp only
          cases hreplace : source.replace? address replacement with
          | none => simp [Term.replace?, hreplace]
          | some target => simp [Term.replace?, hreplace]

/-- Address contraction commutes with filling a protected-field context. -/
theorem contractAt?_protectedField {path : BitWord}
    (context : ProtectedFieldContext path) (source : Term)
    (suffix : Address) :
    (context.plug source).contractAt? (context.address ++ suffix) =
      (source.contractAt? suffix).map context.plug := by
  induction context with
  | hole =>
      simp only [ProtectedFieldContext.plug, ProtectedFieldContext.address,
        List.nil_append]
      cases source.contractAt? suffix <;> rfl
  | left inner sibling debris ih =>
      simp only [ProtectedFieldContext.plug, ProtectedFieldContext.address,
        protectedNode, passive, List.append_assoc, List.cons_append,
        List.nil_append]
      rw [contractAt?_appLeft, contractAt?_appRight, ih]
      cases source.contractAt? suffix <;> rfl
  | right sibling debris inner ih =>
      simp only [ProtectedFieldContext.plug, ProtectedFieldContext.address,
        protectedNode, passive, List.append_assoc, List.cons_append,
        List.nil_append]
      rw [contractAt?_appRight, contractAt?_appLeft, contractAt?_appRight, ih]
      cases source.contractAt? suffix <;> rfl

/-- Every successful executable replay is a finite pure-`S` reduction. -/
theorem replayAddresses_sound {source target : Term} {schedule : List Address}
    (hreplay : replayAddresses source schedule = some target) :
    Steps source target := by
  induction schedule generalizing source with
  | nil =>
      simp only [replayAddresses, Option.some.injEq] at hreplay
      subst target
      exact .refl _
  | cons address rest ih =>
      simp only [replayAddresses] at hreplay
      cases hstep : source.contractAt? address with
      | none => simp [hstep] at hreplay
      | some middle =>
          have htail : replayAddresses middle rest = some target := by
            simpa [hstep] using hreplay
          exact Steps.trans (Steps.single (Term.contractAt?_sound hstep))
            (ih htail)

/-- Every reported trace vertex lies on genuine reductions to and from the
replay endpoints. -/
theorem replayWithTrace_mem_steps {source target vertex : Term}
    {schedule : List Address} {trace : List Term}
    (hreplay : replayWithTrace source schedule = some (target, trace))
    (hvertex : List.Mem vertex trace) :
    Steps source vertex /\ Steps vertex target := by
  induction schedule generalizing source target trace vertex with
  | nil =>
      simp [replayWithTrace] at hreplay
      rcases hreplay with ⟨rfl, rfl⟩
      cases hvertex
  | cons address rest ih =>
      cases hstep : source.contractAt? address with
      | none => simp [replayWithTrace, hstep] at hreplay
      | some next =>
          cases htail : replayWithTrace next rest with
          | none => simp [replayWithTrace, hstep, htail] at hreplay
          | some result =>
              simp [replayWithTrace, hstep, htail] at hreplay
              rcases hreplay with ⟨htarget, htrace⟩
              subst target
              subst trace
              rcases List.mem_cons.mp hvertex with hnext | hrest
              · subst vertex
                have htailReplay : replayAddresses next rest = some result.1 := by
                  have hendpoint := replayWithTrace_endpoint next rest
                  rw [htail] at hendpoint
                  exact hendpoint.symm
                exact ⟨Steps.single (Term.contractAt?_sound hstep),
                  replayAddresses_sound htailReplay⟩
              · obtain ⟨hnextVertex, hvertexTarget⟩ := ih htail hrest
                exact ⟨Steps.trans
                    (Steps.single (Term.contractAt?_sound hstep)) hnextVertex,
                  hvertexTarget⟩

/-- If a successful executable replay has semantically equal endpoint
projections, monotonicity squeezes every reported trace vertex to that same
projection. -/
theorem replayWithTrace_every_projection_stutter
    (verify : CertificateVerifier) (bits : BitWord)
    {source target : Term} {schedule : List Address} {trace : List Term}
    (hreplay : replayWithTrace source schedule = some (target, trace))
    (hreach : Steps (encoder bits) source)
    (hend : (projection verify target).Equivalent
      (projection verify source)) :
    forall vertex, List.Mem vertex trace ->
      (projection verify vertex).Equivalent (projection verify source) := by
  intro vertex hvertex
  obtain ⟨hsourceVertex, hvertexTarget⟩ :=
    replayWithTrace_mem_steps hreplay hvertex
  have hsourceLE := projection_steps_mono_on_encoder_cone verify
    hreach hsourceVertex
  have hvertexReach : Steps (encoder bits) vertex :=
    Steps.trans hreach hsourceVertex
  have hvertexLE := projection_steps_mono_on_encoder_cone verify
    hvertexReach hvertexTarget
  intro history
  constructor
  · intro hhistory
    exact (hend history).mp (hvertexLE history hhistory)
  · exact hsourceLE history

/-- Physical address of a local occurrence below the frozen header and field. -/
def fieldAddress {path : BitWord} (context : ProtectedFieldContext path)
    (suffix : Address) : Address :=
  [.right] ++ context.address ++ suffix

/-- Address contraction commutes with both the frozen seed and field context. -/
theorem contractAt?_seededField {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (source : Term) (suffix : Address) :
    (seededFieldTerm bits context source).contractAt?
        (fieldAddress context suffix) =
      (source.contractAt? suffix).map
        (fun target => seededFieldTerm bits context target) := by
  unfold seededFieldTerm fieldAddress seededHeader
    PureSFormal.Research.ProtectedTrieParser.header passive
  simp only [List.cons_append, List.nil_append, List.append_assoc]
  rw [contractAt?_appRight, contractAt?_protectedField]
  cases source.contractAt? suffix <;> rfl

/-- Replaying mapped field addresses is exactly replaying the local script. -/
theorem replayAddresses_field {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (source : Term) (schedule : List Address) :
    replayAddresses (seededFieldTerm bits context source)
        (schedule.map (fieldAddress context)) =
      (replayAddresses source schedule).map
        (fun target => seededFieldTerm bits context target) := by
  induction schedule generalizing source with
  | nil => rfl
  | cons address rest ih =>
      simp only [List.map_cons, replayAddresses]
      rw [contractAt?_seededField]
      cases hstep : source.contractAt? address with
      | none => rfl
      | some next =>
          exact ih next

/-- Executable traces map pointwise through a frozen protected field. -/
theorem replayWithTrace_field {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (source : Term) (schedule : List Address) :
    replayWithTrace (seededFieldTerm bits context source)
        (schedule.map (fieldAddress context)) =
      (replayWithTrace source schedule).map (fun result =>
        (seededFieldTerm bits context result.1,
          result.2.map (fun term => seededFieldTerm bits context term))) := by
  induction schedule generalizing source with
  | nil => rfl
  | cons address rest ih =>
      simp only [List.map_cons, replayWithTrace]
      rw [contractAt?_seededField]
      cases hstep : source.contractAt? address with
      | none => rfl
      | some next =>
          dsimp
          rw [ih next]
          cases replayWithTrace next rest <;> rfl

/-- Removing the source from concatenated walk vertices concatenates tails. -/
theorem walkVerticesTail_append {Vertex : Type} {Edge : Vertex -> Vertex -> Prop}
    {source middle target : Vertex}
    (first : Walk Edge source middle) (second : Walk Edge middle target) :
    (Walk.append first second).vertices.tail =
      first.vertices.tail ++ second.vertices.tail := by
  rw [Walk.vertices_append]
  have hnonempty := first.vertices_ne_nil
  cases hvertices : first.vertices with
  | nil => exact False.elim (hnonempty hvertices)
  | cons head tail => simp [hvertices]

/-- The six literal local addresses of a positive opening. -/
def positiveLocalSchedule : List Address :=
  [[.left], [], [.left], [], [.right, .left], [.right]]

/-- The seven literal local addresses of a reset opening. -/
def zeroLocalSchedule : List Address :=
  [[.left], [.left], [], [.left], [], [.right, .left], [.right]]

/-- Total phase-indexed local schedule; good phases use only the two live rows. -/
def openingLocalSchedule : Nat × Nat -> List Address
  | (0, _) => zeroLocalSchedule
  | (_ + 1, _) => positiveLocalSchedule

/-- Lift a local schedule to root-relative addresses in the public term. -/
def openingSchedule {path : BitWord} (context : ProtectedFieldContext path)
    (phase : Nat × Nat) : List Address :=
  (openingLocalSchedule phase).map (fieldAddress context)

/-- Every local generator opening uses at most seven contractions. -/
theorem openingLocalSchedule_length_le_seven (phase : Nat × Nat) :
    (openingLocalSchedule phase).length <= 7 := by
  rcases phase with ⟨m, n⟩
  cases m <;> simp [openingLocalSchedule, zeroLocalSchedule,
    positiveLocalSchedule]

/-- Lifting a local opening into the whole term does not change its length. -/
theorem openingSchedule_length_le_seven {path : BitWord}
    (context : ProtectedFieldContext path) (phase : Nat × Nat) :
    (openingSchedule context phase).length <= 7 := by
  simpa [openingSchedule] using openingLocalSchedule_length_le_seven phase

/-- The six executable addresses replay to the displayed positive endpoint. -/
theorem replay_positiveLocalSchedule (m n : Nat) :
    replayAddresses (positive0 m n) positiveLocalSchedule = some (opened m n) := by
  rfl

/-- The seven executable addresses replay reset and opening to its endpoint. -/
theorem replay_zeroLocalSchedule (n : Nat) :
    replayAddresses (D 0 (n + 2)) zeroLocalSchedule =
      some (opened (n + 2) (n + 1)) := by
  rfl

/-- The positive address program exposes exactly the proof-level walk trace. -/
theorem replayWithTrace_positiveLocalSchedule (m n : Nat) :
    replayWithTrace (positive0 m n) positiveLocalSchedule =
      some (opened m n,
        [positive1 m n, positive2 m n, positive3 m n,
          positive4 m n, positive5 m n, opened m n]) := by
  rfl

/-- The reset address program exposes exactly the proof-level walk trace. -/
theorem replayWithTrace_zeroLocalSchedule (n : Nat) :
    replayWithTrace (D 0 (n + 2)) zeroLocalSchedule =
      some (opened (n + 2) (n + 1),
        [positive0 (n + 2) (n + 1), positive1 (n + 2) (n + 1),
          positive2 (n + 2) (n + 1), positive3 (n + 2) (n + 1),
          positive4 (n + 2) (n + 1), positive5 (n + 2) (n + 1),
          opened (n + 2) (n + 1)]) := by
  rfl

/-- Every good phase has a successful executable public opening schedule. -/
theorem replay_openingSchedule {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (phase : Nat × Nat) (hgood : GoodPhase phase) :
    replayAddresses
        (seededFieldTerm bits context (phaseGenerator phase))
        (openingSchedule context phase) =
      some (seededFieldTerm bits context (phaseOpened phase)) := by
  rcases phase with ⟨m, n⟩
  rcases hgood with ⟨hn, hm⟩
  cases n with
  | zero => exact False.elim ((by decide : Not (2 ≤ 0)) hn)
  | succ n =>
      cases n with
      | zero => exact False.elim ((by decide : Not (2 ≤ 1)) hn)
      | succ n =>
          cases m with
          | zero =>
              rw [show openingSchedule context (0, n + 2) =
                  zeroLocalSchedule.map (fieldAddress context) by rfl]
              rw [replayAddresses_field]
              change Option.map (fun target => seededFieldTerm bits context target)
                  (replayAddresses (D 0 (n + 2)) zeroLocalSchedule) =
                some (seededFieldTerm bits context
                  (opened (n + 2) (n + 1)))
              rw [replay_zeroLocalSchedule]
              rfl
          | succ m =>
              rw [show openingSchedule context (m + 1, n + 2) =
                  positiveLocalSchedule.map (fieldAddress context) by rfl]
              rw [replayAddresses_field]
              change Option.map (fun target => seededFieldTerm bits context target)
                  (replayAddresses (positive0 m n) positiveLocalSchedule) =
                some (seededFieldTerm bits context (opened m n))
              rw [replay_positiveLocalSchedule]
              rfl

/-- The good-phase classifier has one proof-independent opening value. -/
theorem canonicalOpening_unique {path bits : BitWord}
    {context : ProtectedFieldContext path} {phase : Nat × Nat}
    (first second : CanonicalOpening bits context phase) : first = second := by
  cases first with
  | positive m n hfirst =>
      cases second with
      | positive m' n' hsecond =>
          have hpairs : (m + 1, n + 2) = (m' + 1, n' + 2) :=
            hfirst.symm.trans hsecond
          have hm : m = m' := Nat.add_right_cancel (congrArg Prod.fst hpairs)
          have hn : n = n' := Nat.add_right_cancel (congrArg Prod.snd hpairs)
          subst m'
          subst n'
          rfl
      | zero n' hsecond =>
          have hfirstCoordinate : m + 1 = 0 :=
            congrArg Prod.fst (hfirst.symm.trans hsecond)
          exact False.elim (Nat.succ_ne_zero m (by simpa using hfirstCoordinate))
  | zero n hfirst =>
      cases second with
      | positive m' n' hsecond =>
          have hfirstCoordinate : 0 = m' + 1 :=
            congrArg Prod.fst (hfirst.symm.trans hsecond)
          exact False.elim
            (Nat.succ_ne_zero m' (by simpa using hfirstCoordinate.symm))
      | zero n' hsecond =>
          have hn : n = n' := Nat.add_right_cancel
            (congrArg Prod.snd (hfirst.symm.trans hsecond))
          subst n'
          rfl

/-- Executable opening traces are the literal canonical-opening vertices. -/
theorem replayWithTrace_openingSchedule {path : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext path)
    (phase : Nat × Nat) (hgood : GoodPhase phase) :
    replayWithTrace
        (seededFieldTerm bits context (phaseGenerator phase))
        (openingSchedule context phase) =
      some (seededFieldTerm bits context (phaseOpened phase),
        (canonicalOpeningOfGood bits context phase hgood).walk.vertices.tail) := by
  rcases phase with ⟨m, n⟩
  rcases hgood with ⟨hn, hm⟩
  cases n with
  | zero => exact False.elim ((by decide : Not (2 ≤ 0)) hn)
  | succ n =>
      cases n with
      | zero => exact False.elim ((by decide : Not (2 ≤ 1)) hn)
      | succ n =>
          cases m with
          | zero =>
              have hopen :
                  canonicalOpeningOfGood bits context (0, n + 2) ⟨hn, hm⟩ =
                    CanonicalOpening.zero n rfl :=
                canonicalOpening_unique _ _
              rw [show openingSchedule context (0, n + 2) =
                  zeroLocalSchedule.map (fieldAddress context) by rfl]
              rw [replayWithTrace_field]
              change Option.map (fun result =>
                  (seededFieldTerm bits context result.1,
                    result.2.map
                      (fun term => seededFieldTerm bits context term)))
                  (replayWithTrace (D 0 (n + 2)) zeroLocalSchedule) = _
              rw [replayWithTrace_zeroLocalSchedule]
              rw [hopen]
              simp [canonicalOpeningOfGood, CanonicalOpening.walk,
                CanonicalOpening.source, CanonicalOpening.target,
                phaseGenerator, phaseOpened, nextPhase, phaseJunk,
                zeroWalk_vertices, positive0, opened, openingChild,
                seededFieldTerm, Nat.add_assoc, id, Eq.mp, Eq.mpr]
              simpa [positive0, opened, openingChild, seededFieldTerm, Nat.add_assoc] using!
                (congrArg List.tail (zeroWalk_vertices bits context n)).symm
          | succ m =>
              have hopen :
                  canonicalOpeningOfGood bits context (m + 1, n + 2) ⟨hn, hm⟩ =
                    CanonicalOpening.positive m n rfl :=
                canonicalOpening_unique _ _
              rw [show openingSchedule context (m + 1, n + 2) =
                  positiveLocalSchedule.map (fieldAddress context) by rfl]
              rw [replayWithTrace_field]
              change Option.map (fun result =>
                  (seededFieldTerm bits context result.1,
                    result.2.map
                      (fun term => seededFieldTerm bits context term)))
                  (replayWithTrace (positive0 m n) positiveLocalSchedule) = _
              rw [replayWithTrace_positiveLocalSchedule]
              rw [hopen]
              simp [canonicalOpeningOfGood, CanonicalOpening.walk,
                CanonicalOpening.source, CanonicalOpening.target,
                phaseGenerator, phaseOpened, nextPhase, phaseJunk,
                positiveWalk_vertices, positive0, opened, openingChild,
                seededFieldTerm, id, Eq.mp, Eq.mpr]
              simpa [positive0, opened, openingChild, seededFieldTerm] using!
                (congrArg List.tail (positiveWalk_vertices bits context m n)).symm

/-! ## Executable insertion of one abstract trie path -/

/-- Root-relative address schedule that inserts one path in a canonical trie. -/
def insertPathSchedule : {contextPath : BitWord} ->
    (context : ProtectedFieldContext contextPath) ->
    (phase : Nat × Nat) -> BitWord -> PrefixTree -> List Address
  | _, context, phase, [], .empty => openingSchedule context phase
  | _, _, _, [], .node _ _ => []
  | _, context, phase, false :: rest, .empty =>
      openingSchedule context phase ++
        insertPathSchedule
          (context.extendLeft
            (phaseGenerator (nextPhase phase)) (phaseJunk phase))
          (nextPhase phase) rest .empty
  | _, context, phase, true :: rest, .empty =>
      openingSchedule context phase ++
        insertPathSchedule
          (context.extendRight
            (phaseGenerator (nextPhase phase)) (phaseJunk phase))
          (nextPhase phase) rest .empty
  | _, context, phase, false :: rest, .node left right =>
      insertPathSchedule
        (context.extendLeft (buildFrom (nextPhase phase) right)
          (phaseJunk phase))
        (nextPhase phase) rest left
  | _, context, phase, true :: rest, .node left right =>
      insertPathSchedule
        (context.extendRight (buildFrom (nextPhase phase) left)
          (phaseJunk phase))
        (nextPhase phase) rest right

/-- Inserting one endpoint uses at most seven contractions per path node. -/
theorem insertPathSchedule_length_le {contextPath : BitWord}
    (context : ProtectedFieldContext contextPath) (phase : Nat × Nat)
    (endpoint : BitWord) (tree : PrefixTree) :
    (insertPathSchedule context phase endpoint tree).length <=
      7 * (endpoint.length + 1) := by
  induction endpoint generalizing contextPath phase tree context with
  | nil =>
      cases tree with
      | empty =>
          simpa [insertPathSchedule] using
            openingSchedule_length_le_seven context phase
      | node left right => simp [insertPathSchedule]
  | cons bit rest ih =>
      cases tree with
      | empty =>
          cases bit with
          | false =>
            have hopen := openingSchedule_length_le_seven context phase
            have hrest := ih
              (context := context.extendLeft
                (phaseGenerator (nextPhase phase)) (phaseJunk phase))
              (phase := nextPhase phase) (tree := PrefixTree.empty)
            simp only [insertPathSchedule, List.length_append]
            calc
              (openingSchedule context phase).length +
                    (insertPathSchedule
                      (context.extendLeft
                        (phaseGenerator (nextPhase phase)) (phaseJunk phase))
                      (nextPhase phase) rest PrefixTree.empty).length <=
                  7 + 7 * (rest.length + 1) := Nat.add_le_add hopen hrest
              _ = 7 * ((false :: rest).length + 1) := by
                simp only [List.length_cons, Nat.mul_add, Nat.mul_one]
                exact Nat.add_comm 7 (7 * rest.length + 7)
          | true =>
            have hopen := openingSchedule_length_le_seven context phase
            have hrest := ih
              (context := context.extendRight
                (phaseGenerator (nextPhase phase)) (phaseJunk phase))
              (phase := nextPhase phase) (tree := PrefixTree.empty)
            simp only [insertPathSchedule, List.length_append]
            calc
              (openingSchedule context phase).length +
                    (insertPathSchedule
                      (context.extendRight
                        (phaseGenerator (nextPhase phase)) (phaseJunk phase))
                      (nextPhase phase) rest PrefixTree.empty).length <=
                  7 + 7 * (rest.length + 1) := Nat.add_le_add hopen hrest
              _ = 7 * ((true :: rest).length + 1) := by
                simp only [List.length_cons, Nat.mul_add, Nat.mul_one]
                exact Nat.add_comm 7 (7 * rest.length + 7)
      | node left right =>
          cases bit with
          | false =>
              have hrest := ih
                (context := context.extendLeft
                  (buildFrom (nextPhase phase) right) (phaseJunk phase))
                (phase := nextPhase phase) (tree := left)
              apply Nat.le_trans hrest
              exact Nat.mul_le_mul_left 7 (by simp)
          | true =>
              have hrest := ih
                (context := context.extendRight
                  (buildFrom (nextPhase phase) left) (phaseJunk phase))
                (phase := nextPhase phase) (tree := right)
              apply Nat.le_trans hrest
              exact Nat.mul_le_mul_left 7 (by simp)

/-- The executable one-path schedule reaches exactly structural insertion. -/
theorem replay_insertPathSchedule {contextPath : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoint : BitWord) (tree : PrefixTree) :
    replayAddresses
        (seededFieldTerm bits context (buildFrom phase tree))
        (insertPathSchedule context phase endpoint tree) =
      some (seededFieldTerm bits context
        (buildFrom phase (insertPath endpoint tree))) := by
  induction endpoint generalizing contextPath phase tree context with
  | nil =>
      cases tree with
      | empty =>
          simpa [insertPathSchedule, buildFrom, insertPath, phaseOpened] using
            replay_openingSchedule bits context phase hgood
      | node left right => rfl
  | cons bit rest ih =>
      cases tree with
      | empty =>
          cases bit with
          | false =>
              simp only [buildFrom]
              rw [insertPathSchedule, replayAddresses_append,
                replay_openingSchedule bits context phase hgood]
              let childContext := context.extendLeft
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              have hchild := ih (context := childContext)
                (phase := nextPhase phase) hgood.next (tree := PrefixTree.empty)
              simpa [childContext, buildFrom, insertPath, phaseOpened,
                seededFieldTerm] using hchild
          | true =>
              simp only [buildFrom]
              rw [insertPathSchedule, replayAddresses_append,
                replay_openingSchedule bits context phase hgood]
              let childContext := context.extendRight
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              have hchild := ih (context := childContext)
                (phase := nextPhase phase) hgood.next (tree := PrefixTree.empty)
              simpa [childContext, buildFrom, insertPath, phaseOpened,
                seededFieldTerm] using hchild
      | node left right =>
          cases bit with
          | false =>
              let childContext := context.extendLeft
                (buildFrom (nextPhase phase) right) (phaseJunk phase)
              have hchild := ih (context := childContext)
                (phase := nextPhase phase) hgood.next (tree := left)
              simpa [insertPathSchedule, childContext, buildFrom, insertPath,
                seededFieldTerm] using hchild
          | true =>
              let childContext := context.extendRight
                (buildFrom (nextPhase phase) left) (phaseJunk phase)
              have hchild := ih (context := childContext)
                (phase := nextPhase phase) hgood.next (tree := right)
              simpa [insertPathSchedule, childContext, buildFrom, insertPath,
                seededFieldTerm] using hchild

/-- Substitute an inner protected-field context into the hole of an outer
one.  Recursing over the outer context keeps the root-to-hole path index in
literal list-append order. -/
def composeContext : {outerPath innerPath : BitWord} ->
    ProtectedFieldContext outerPath -> ProtectedFieldContext innerPath ->
      ProtectedFieldContext (outerPath ++ innerPath)
  | _, _, .hole, inner => inner
  | _, _, .left outer sibling debris, inner =>
      .left (composeContext outer inner) sibling debris
  | _, _, .right sibling debris outer, inner =>
      .right sibling debris (composeContext outer inner)

/-- Context substitution concatenates literal application-tree addresses. -/
theorem composeContext_address {outerPath innerPath : BitWord}
    (outer : ProtectedFieldContext outerPath)
    (inner : ProtectedFieldContext innerPath) :
    (composeContext outer inner).address = outer.address ++ inner.address := by
  induction outer with
  | hole => rfl
  | left outer sibling debris ih =>
      simp only [composeContext, ProtectedFieldContext.address, ih,
        List.append_assoc]
  | right sibling debris outer ih =>
      simp only [composeContext, ProtectedFieldContext.address, ih,
        List.append_assoc]

/-- A lifted local program depends on a context only through its literal
application-tree address. -/
theorem openingSchedule_eq_of_address {firstPath secondPath : BitWord}
    (first : ProtectedFieldContext firstPath)
    (second : ProtectedFieldContext secondPath) (phase : Nat × Nat)
    (haddress : first.address = second.address) :
    openingSchedule first phase = openingSchedule second phase := by
  unfold openingSchedule fieldAddress
  exact congrArg (fun address => (openingLocalSchedule phase).map
    (fun suffix => [.right] ++ address ++ suffix)) haddress

/-- At a structural frontier, the computable one-path insertion program is
exactly the one local opening program lifted through the outer context and
then through the frontier context.  The compiler itself remains independent
of the dependent frontier witness. -/
theorem insertPathSchedule_of_frontier {contextPath : BitWord}
    {tree : PrefixTree} {endpoint : BitWord}
    (context : ProtectedFieldContext contextPath) (phase : Nat × Nat)
    (frontier : PrefixTree.Frontier tree endpoint) :
    insertPathSchedule context phase endpoint tree =
      openingSchedule
        (composeContext context (frontier.fieldContext phase))
        (frontier.focusPhase phase) := by
  induction frontier generalizing contextPath context phase with
  | root =>
      rw [insertPathSchedule]
      apply openingSchedule_eq_of_address
      simp only [composeContext_address,
        PrefixTree.Frontier.fieldContext,
        ProtectedFieldContext.address, List.append_nil]
  | left inner right ih =>
      rw [insertPathSchedule]
      rw [ih (context := context.extendLeft
        (buildFrom (nextPhase phase) right) (phaseJunk phase))
        (phase := nextPhase phase)]
      apply openingSchedule_eq_of_address
      simp only [composeContext_address,
        ProtectedFieldContext.address_extendLeft,
        PrefixTree.Frontier.focusPhase,
        PrefixTree.Frontier.fieldContext, ProtectedFieldContext.address,
        List.append_assoc]
  | right left inner ih =>
      rw [insertPathSchedule]
      rw [ih (context := context.extendRight
        (buildFrom (nextPhase phase) left) (phaseJunk phase))
        (phase := nextPhase phase)]
      apply openingSchedule_eq_of_address
      simp only [composeContext_address,
        ProtectedFieldContext.address_extendRight,
        PrefixTree.Frontier.focusPhase,
        PrefixTree.Frontier.fieldContext, ProtectedFieldContext.address,
        List.append_assoc]

/-! ## Executable finite blocks and source edges -/

/-- Insert a finite generator block in `treeOfGenerators` order. -/
def insertPathsSchedule {contextPath : BitWord}
    (context : ProtectedFieldContext contextPath) (phase : Nat × Nat) :
    List BitWord -> PrefixTree -> List Address
  | [], _ => []
  | endpoint :: rest, tree =>
      insertPathsSchedule context phase rest tree ++
        insertPathSchedule context phase endpoint (insertPaths rest tree)

/-- A literal size bound for a finite block of requested trie endpoints. -/
def insertionScheduleBound (endpoints : List BitWord) : Nat :=
  7 * (endpoints.map (fun endpoint => endpoint.length + 1)).sum

/-- The finite block compiler stays within its explicit literal path budget. -/
theorem insertPathsSchedule_length_le {contextPath : BitWord}
    (context : ProtectedFieldContext contextPath) (phase : Nat × Nat)
    (endpoints : List BitWord) (tree : PrefixTree) :
    (insertPathsSchedule context phase endpoints tree).length <=
      insertionScheduleBound endpoints := by
  induction endpoints with
  | nil => simp [insertPathsSchedule, insertionScheduleBound]
  | cons endpoint rest ih =>
      rw [insertPathsSchedule, List.length_append]
      have hone := insertPathSchedule_length_le context phase endpoint
        (insertPaths rest tree)
      have ih' :
          (insertPathsSchedule context phase rest tree).length <=
            7 * (rest.map (fun path => path.length + 1)).sum := by
        simpa [insertionScheduleBound] using ih
      simp only [insertionScheduleBound, List.map_cons, List.sum_cons]
      calc
        (insertPathsSchedule context phase rest tree).length +
              (insertPathSchedule context phase endpoint
                (insertPaths rest tree)).length <=
            7 * (rest.map (fun path => path.length + 1)).sum +
              7 * (endpoint.length + 1) := Nat.add_le_add ih' hone
        _ = 7 * ((endpoint.length + 1) +
            (rest.map (fun path => path.length + 1)).sum) := by
          simp [Nat.mul_add, Nat.add_comm]

/-- A finite executable block reaches exactly `insertPaths`. -/
theorem replay_insertPathsSchedule {contextPath : BitWord}
    (bits : BitWord) (context : ProtectedFieldContext contextPath)
    (phase : Nat × Nat) (hgood : GoodPhase phase)
    (endpoints : List BitWord) (tree : PrefixTree) :
    replayAddresses
        (seededFieldTerm bits context (buildFrom phase tree))
        (insertPathsSchedule context phase endpoints tree) =
      some (seededFieldTerm bits context
        (buildFrom phase (insertPaths endpoints tree))) := by
  induction endpoints with
  | nil => rfl
  | cons endpoint rest ih =>
      rw [insertPathsSchedule, replayAddresses_append, ih]
      exact replay_insertPathSchedule bits context phase hgood endpoint
        (insertPaths rest tree)

/-- Computable root-relative address schedule for one ordered history edge. -/
def subdivisionEdgeSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) : List Address :=
  insertPathsSchedule ProtectedFieldContext.hole (phaseAt 0)
    (subdivisionGeneratorBlock witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)

/-- The public edge compiler has a closed literal endpoint-length budget. -/
theorem subdivisionEdgeSchedule_length_le
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    (subdivisionEdgeSchedule witness bits source bit).length <=
      insertionScheduleBound
        (subdivisionGeneratorBlock witness bits (source ++ [bit])) := by
  exact insertPathsSchedule_length_le ProtectedFieldContext.hole (phaseAt 0)
    (subdivisionGeneratorBlock witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)

/-- The computable router/proper-prefix part of one source-edge schedule. -/
def subdivisionPreparationSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) : List Address :=
  insertPathsSchedule ProtectedFieldContext.hole (phaseAt 0)
    (subdivisionPreparation witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)

/-- The final computable insertion program for the distinguished certificate. -/
def subdivisionEventSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) : List Address :=
  insertPathSchedule ProtectedFieldContext.hole (phaseAt 0)
    (a (source ++ [bit]) (witness bits (source ++ [bit])))
    (subdivisionPreparedTree witness bits source bit)

/-- The public edge program definitionally factors into preparation and the
final computable certificate insertion. -/
theorem subdivisionEdgeSchedule_split_computable
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    subdivisionEdgeSchedule witness bits source bit =
      subdivisionPreparationSchedule witness bits source bit ++
        subdivisionEventSchedule witness bits source bit := by
  rfl

/-- The final segment computed from the prepared trie is literally the
canonical local opening program at its uniquely determined frontier. -/
theorem subdivisionEventSchedule_eq_openingSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    subdivisionEventSchedule witness bits source bit =
      openingSchedule
        ((subdivisionTargetFrontier witness bits source bit).fieldContext
          (phaseAt 0))
        ((subdivisionTargetFrontier witness bits source bit).focusPhase
          (phaseAt 0)) := by
  have hfrontier := insertPathSchedule_of_frontier
    ProtectedFieldContext.hole (phaseAt 0)
    (subdivisionTargetFrontier witness bits source bit)
  simpa [subdivisionEventSchedule, openingSchedule, fieldAddress,
    ProtectedFieldContext.address] using! hfrontier

/-- The final computable insertion program reaches the child checkpoint. -/
theorem replay_subdivisionEventSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    replayAddresses
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)))
        (subdivisionEventSchedule witness bits source bit) =
      some (subdivisionCheckpoint witness bits (source ++ [bit])) := by
  have hreplay := replay_insertPathSchedule bits
    ProtectedFieldContext.hole (phaseAt 0) (goodPhase_phaseAt 0)
    (a (source ++ [bit]) (witness bits (source ++ [bit])))
    (subdivisionPreparedTree witness bits source bit)
  simpa [subdivisionEventSchedule, subdivisionCheckpoint,
    subdivisionPreparedTree, subdivisionSourceTree, subdivisionPreparation,
    subdivisionGeneratorBlock, seededPrefixBuild, seededBuild, buildAt,
    treeOfPrefixSet, seededFieldTerm,
    subdivisionCheckpointGenerators_append_singleton,
    treeOfGenerators_append, treeOfGenerators, insertPaths_append,
    ProtectedFieldContext.plug] using! hreplay

/-- Preparation has a concrete successful trace ending at the literal
pre-event trie. -/
theorem replayWithTrace_subdivisionPreparationSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    exists trace,
      replayWithTrace (subdivisionCheckpoint witness bits source)
          (subdivisionPreparationSchedule witness bits source bit) =
        some (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)), trace) := by
  have hreplay := replay_insertPathsSchedule bits
    ProtectedFieldContext.hole (phaseAt 0) (goodPhase_phaseAt 0)
    (subdivisionPreparation witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)
  have hendpoint := replayWithTrace_endpoint
    (subdivisionCheckpoint witness bits source)
    (subdivisionPreparationSchedule witness bits source bit)
  have hreplay' : replayAddresses (subdivisionCheckpoint witness bits source)
      (subdivisionPreparationSchedule witness bits source bit) =
    some (seededFieldTerm bits ProtectedFieldContext.hole
      (buildFrom (phaseAt 0)
        (subdivisionPreparedTree witness bits source bit))) := by
    simpa [subdivisionCheckpoint, subdivisionSourceTree,
      subdivisionPreparationSchedule, subdivisionPreparedTree,
      seededPrefixBuild, seededBuild, buildAt, treeOfPrefixSet,
      seededFieldTerm] using! hreplay
  rw [hreplay'] at hendpoint
  cases htrace : replayWithTrace (subdivisionCheckpoint witness bits source)
      (subdivisionPreparationSchedule witness bits source bit) with
  | none => simp [htrace] at hendpoint
  | some result =>
      have hresult : result.1 = seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)) := by
        simpa [htrace] using hendpoint
      refine ⟨result.2, ?_⟩
      exact congrArg some (Prod.ext hresult rfl)

/-- Every concrete preparation-trace vertex has exactly the source checkpoint
projection. -/
theorem subdivisionPreparationSchedule_trace_stutter
    (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    exists trace,
      replayWithTrace (subdivisionCheckpoint witness bits source)
          (subdivisionPreparationSchedule witness bits source bit) =
        some (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)), trace) /\
      forall vertex, List.Mem vertex trace ->
        (projection verify vertex).Equivalent
          (projection verify
            (subdivisionCheckpoint witness bits source)) := by
  obtain ⟨trace, htrace⟩ :=
    replayWithTrace_subdivisionPreparationSchedule witness bits source bit
  refine ⟨trace, htrace, ?_⟩
  have hreach : Steps (encoder bits)
      (subdivisionCheckpoint witness bits source) := by
    simpa [subdivisionCheckpoint, subdivisionSourceTree, seededPrefixBuild,
      seededBuild, buildAt, treeOfPrefixSet, seededFieldTerm] using
      (encoder_steps_seededPrefixBuild bits
        ⟨subdivisionCheckpointGenerators witness bits source⟩)
  have hend := insertPaths_projection_stutter verify bits
    ProtectedFieldContext.hole (phaseAt 0) (goodPhase_phaseAt 0)
    (subdivisionPreparation witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)
    (fun endpoint hendpoint history payload => by
      simpa using subdivisionBlock_tail_candidate_free witness bits
        (source ++ [bit]) endpoint hendpoint history payload)
  have hend' :
      (projection verify
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)))).Equivalent
      (projection verify
        (subdivisionCheckpoint witness bits source)) := by
    simpa [subdivisionCheckpoint, subdivisionPreparedTree,
      subdivisionSourceTree, seededPrefixBuild, seededBuild, buildAt,
      treeOfPrefixSet, seededFieldTerm] using! hend
  exact replayWithTrace_every_projection_stutter verify bits htrace
    hreach hend'

/-- The final executable schedule segment is exactly the canonical local
opening trace, with the public pre-event and child-checkpoint endpoints. -/
theorem replayWithTrace_subdivisionEventSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    replayWithTrace
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)))
        (subdivisionEventSchedule witness bits source bit) =
      some (subdivisionCheckpoint witness bits (source ++ [bit]),
        (subdivisionTargetOpening witness bits source bit).walk.vertices.tail) := by
  rw [subdivisionEventSchedule_eq_openingSchedule]
  let selected := subdivisionTargetFrontier witness bits source bit
  have hlocal := replayWithTrace_openingSchedule bits
    (selected.fieldContext (phaseAt 0))
    (selected.focusPhase (phaseAt 0))
    (selected.focus_good (goodPhase_phaseAt 0))
  have hsource : seededFieldTerm bits (selected.fieldContext (phaseAt 0))
      (phaseGenerator (selected.focusPhase (phaseAt 0))) =
    seededFieldTerm bits ProtectedFieldContext.hole
      (buildFrom (phaseAt 0)
        (subdivisionPreparedTree witness bits source bit)) := by
    unfold seededFieldTerm
    exact congrArg (seededHeader bits)
      (selected.plug_focusGenerator (phaseAt 0))
  have htarget : seededFieldTerm bits (selected.fieldContext (phaseAt 0))
      (phaseOpened (selected.focusPhase (phaseAt 0))) =
    subdivisionCheckpoint witness bits (source ++ [bit]) := by
    unfold seededFieldTerm
    rw [selected.plug_focusOpened]
    unfold subdivisionCheckpoint seededPrefixBuild seededBuild buildAt
      treeOfPrefixSet subdivisionPreparedTree subdivisionSourceTree
      subdivisionPreparation subdivisionGeneratorBlock
    rw [subdivisionCheckpointGenerators_append_singleton,
      treeOfGenerators_append]
    rfl
  rw [hsource, htarget] at hlocal
  simpa [selected, subdivisionTargetOpening] using hlocal

/-- The source-edge address schedule replays between the public checkpoints. -/
theorem replay_subdivisionEdgeSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    replayAddresses (subdivisionCheckpoint witness bits source)
        (subdivisionEdgeSchedule witness bits source bit) =
      some (subdivisionCheckpoint witness bits (source ++ [bit])) := by
  have hreplay := replay_insertPathsSchedule bits ProtectedFieldContext.hole
    (phaseAt 0) (goodPhase_phaseAt 0)
    (subdivisionGeneratorBlock witness bits (source ++ [bit]))
    (subdivisionSourceTree witness bits source)
  simpa [subdivisionEdgeSchedule, subdivisionCheckpoint,
    subdivisionSourceTree, seededPrefixBuild, seededBuild, buildAt,
    treeOfPrefixSet, seededFieldTerm,
    subdivisionCheckpointGenerators_append_singleton,
    treeOfGenerators_append] using! hreplay

/-- Every executable source-edge schedule is a genuine finite reduction. -/
theorem subdivisionEdgeSchedule_steps
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) :
    Steps (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ [bit])) :=
  replayAddresses_sound
    (replay_subdivisionEdgeSchedule witness bits source bit)

/-- A genuine valid source edge always has a nonempty executable program. -/
theorem subdivisionEdgeSchedule_nonempty
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits source : BitWord) (bit : Bool)
    (hsource : Valid bits source)
    (htarget : Valid bits (source ++ [bit])) :
    subdivisionEdgeSchedule witness bits source bit ≠ [] := by
  intro hempty
  have hreplay := replay_subdivisionEdgeSchedule witness bits source bit
  rw [hempty] at hreplay
  have hterms : subdivisionCheckpoint witness bits source =
      subdivisionCheckpoint witness bits (source ++ [bit]) := by
    simpa [replayAddresses] using hreplay
  have hsourceProjection := projection_subdivisionCheckpoint_equivalent
    hprefixClosed hcomplete bits source hsource
  have htargetProjection := projection_subdivisionCheckpoint_equivalent
    hprefixClosed hcomplete bits (source ++ [bit]) htarget
  rw [hterms] at hsourceProjection
  have hideals : (branchIdeal source).Equivalent
      (branchIdeal (source ++ [bit])) :=
    HistoryIdeal.equivalent_trans
      (HistoryIdeal.equivalent_symm hsourceProjection) htargetProjection
  have hhist : source = source ++ [bit] :=
    (branchIdeal_equivalent_iff source (source ++ [bit])).mp hideals
  have hsuffix : [bit] = [] :=
    (List.append_right_eq_self).mp hhist.symm
  exact List.cons_ne_nil bit [] hsuffix

/--
The executable address list and the canonical one-event macroedge share the
same public checkpoints.  The list is nonempty and replays exactly; the
literal canonical macroedge stutters at every proper vertex, and its last
opening adds precisely the target history ideal.
-/
theorem subdivisionEdgeSchedule_exact_spec
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits source : BitWord) (bit : Bool)
    (hsource : Valid bits source)
    (htarget : Valid bits (source ++ [bit])) :
    subdivisionEdgeSchedule witness bits source bit ≠ [] /\
    replayAddresses (subdivisionCheckpoint witness bits source)
        (subdivisionEdgeSchedule witness bits source bit) =
      some (subdivisionCheckpoint witness bits (source ++ [bit])) /\
    Steps (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ [bit])) /\
    (projection verify
      (subdivisionCheckpoint witness bits source)).Equivalent
        (branchIdeal source) /\
    (projection verify
      (subdivisionCheckpoint witness bits (source ++ [bit]))).Equivalent
        (branchIdeal (source ++ [bit])) /\
    (forall vertex,
      (subdivisionEdgeWalkExact witness bits source bit).Interior vertex ->
      (projection verify vertex).Equivalent
        (projection verify
          (subdivisionCheckpoint witness bits source))) /\
    exists before,
      Step before (subdivisionCheckpoint witness bits (source ++ [bit])) /\
      forall small,
        (projection verify
          (subdivisionCheckpoint witness bits (source ++ [bit]))).Contains small <->
          (projection verify before).Contains small \/
            WordPrefix small (source ++ [bit]) := by
  refine ⟨subdivisionEdgeSchedule_nonempty hprefixClosed hcomplete
      bits source bit hsource htarget,
    replay_subdivisionEdgeSchedule witness bits source bit,
    subdivisionEdgeSchedule_steps witness bits source bit,
    projection_subdivisionCheckpoint_equivalent
      hprefixClosed hcomplete bits source hsource,
    projection_subdivisionCheckpoint_equivalent
      hprefixClosed hcomplete bits (source ++ [bit]) htarget,
    subdivisionEdgeWalkExact_interior_projection
      verify witness bits source bit, ?_⟩
  let opening := subdivisionTargetOpening witness bits source bit
  have hopenTarget : opening.target =
      subdivisionCheckpoint witness bits (source ++ [bit]) := by
    unfold opening subdivisionTargetOpening
    unfold CanonicalOpening.target seededFieldTerm
    rw [(subdivisionTargetFrontier witness bits source bit).plug_focusOpened]
    unfold subdivisionCheckpoint seededPrefixBuild seededBuild buildAt
      treeOfPrefixSet subdivisionPreparedTree subdivisionSourceTree
      subdivisionPreparation subdivisionGeneratorBlock
    rw [subdivisionCheckpointGenerators_append_singleton,
      treeOfGenerators_append]
    rfl
  have hfinal := opening.final_projection_event verify
    (source ++ [bit]) (witness bits (source ++ [bit])) rfl
      (hcomplete bits (source ++ [bit]) htarget)
  rcases hfinal with ⟨before, hstep, hdelta⟩
  refine ⟨before, ?_, ?_⟩
  · rw [← hopenTarget]
    exact hstep
  · intro small
    rw [← hopenTarget]
    exact hdelta small

/-- Data-level and projection-timing contract for one executable history edge. -/
def ExecutableEdgeCertificate (verify : CertificateVerifier)
    (witness : BitWord -> BitWord -> BitWord)
    (bits source : BitWord) (bit : Bool) : Prop :=
    exists preparationTrace before,
      subdivisionEdgeSchedule witness bits source bit ≠ [] /\
      replayAddresses (subdivisionCheckpoint witness bits source)
          (subdivisionEdgeSchedule witness bits source bit) =
        some (subdivisionCheckpoint witness bits (source ++ [bit])) /\
      subdivisionEdgeSchedule witness bits source bit =
        subdivisionPreparationSchedule witness bits source bit ++
          subdivisionEventSchedule witness bits source bit /\
      replayWithTrace (subdivisionCheckpoint witness bits source)
          (subdivisionPreparationSchedule witness bits source bit) =
        some (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)), preparationTrace) /\
      (forall vertex, List.Mem vertex preparationTrace ->
        (projection verify vertex).Equivalent
          (projection verify
            (subdivisionCheckpoint witness bits source))) /\
      replayWithTrace
          (seededFieldTerm bits ProtectedFieldContext.hole
            (buildFrom (phaseAt 0)
              (subdivisionPreparedTree witness bits source bit)))
          (subdivisionEventSchedule witness bits source bit) =
        some (subdivisionCheckpoint witness bits (source ++ [bit]),
          (subdivisionTargetOpening witness bits source bit).walk.vertices.tail) /\
      Walk.BeforeTarget
        (fun vertex => (projection verify vertex).Equivalent
          (projection verify
            (subdivisionCheckpoint witness bits source)))
        (subdivisionEventWalk witness bits source bit) /\
      Step before (subdivisionCheckpoint witness bits (source ++ [bit])) /\
      forall small,
        (projection verify
          (subdivisionCheckpoint witness bits (source ++ [bit]))).Contains small <->
          (projection verify before).Contains small \/
            WordPrefix small (source ++ [bit])

/--
Executable certificate for one valid history event.  The full computable
address program is nonempty and replays to the exact child checkpoint; its
computable preparation subprogram has a projection-stuttering trace; its
computable event subprogram replays exactly along the canonical event walk;
and that event walk stutters before its final, exact projection update.
-/
theorem subdivisionEdgeSchedule_executable_certificate
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits source : BitWord) (bit : Bool)
    (hsource : Valid bits source)
    (htarget : Valid bits (source ++ [bit])) :
    ExecutableEdgeCertificate verify witness bits source bit := by
  obtain ⟨preparationTrace, hpreparation, hpreparationStutter⟩ :=
    subdivisionPreparationSchedule_trace_stutter verify witness bits source bit
  have hprepared :
      (projection verify
        (seededFieldTerm bits ProtectedFieldContext.hole
          (buildFrom (phaseAt 0)
            (subdivisionPreparedTree witness bits source bit)))).Equivalent
        (projection verify
          (subdivisionCheckpoint witness bits source)) := by
    exact (subdivisionPreparationWalk_every_projection_stutter
      verify witness bits source bit).holdsAt
        (Walk.target_mem_vertices
          (subdivisionPreparationWalk witness bits source bit))
  have hevent0 := subdivisionEventWalk_before_target_projection_stutter
    verify witness bits source bit
  have hevent : Walk.BeforeTarget
      (fun vertex => (projection verify vertex).Equivalent
        (projection verify
          (subdivisionCheckpoint witness bits source)))
      (subdivisionEventWalk witness bits source bit) := by
    intro vertex hmem hne
    exact HistoryIdeal.equivalent_trans (hevent0 vertex hmem hne) hprepared
  obtain ⟨_, _, _, _, _, _, before, hstep, hdelta⟩ :=
    subdivisionEdgeSchedule_exact_spec hprefixClosed hcomplete
      bits source bit hsource htarget
  exact ⟨preparationTrace, before,
    subdivisionEdgeSchedule_nonempty hprefixClosed hcomplete
      bits source bit hsource htarget,
    replay_subdivisionEdgeSchedule witness bits source bit,
    subdivisionEdgeSchedule_split_computable witness bits source bit,
    hpreparation, hpreparationStutter,
    replayWithTrace_subdivisionEventSchedule witness bits source bit,
    hevent, hstep, hdelta⟩

/-! ## Finite branch concatenation -/

/-- Concatenate the executable edge schedules along a requested bit branch. -/
def finiteBranchSchedule
    (witness : BitWord -> BitWord -> BitWord) (bits : BitWord) :
    BitWord -> BitWord -> List Address
  | _, [] => []
  | source, bit :: rest =>
      subdivisionEdgeSchedule witness bits source bit ++
        finiteBranchSchedule witness bits (source ++ [bit]) rest

/-- The concatenated schedule reaches the checkpoint at the requested branch. -/
theorem replay_finiteBranchSchedule
    (witness : BitWord -> BitWord -> BitWord)
    (bits source branch : BitWord) :
    replayAddresses (subdivisionCheckpoint witness bits source)
        (finiteBranchSchedule witness bits source branch) =
      some (subdivisionCheckpoint witness bits (source ++ branch)) := by
  induction branch generalizing source with
  | nil => simp [finiteBranchSchedule]
  | cons bit rest ih =>
      rw [finiteBranchSchedule, replayAddresses_append,
        replay_subdivisionEdgeSchedule]
      simpa [List.append_assoc] using ih (source ++ [bit])

/-- Every requested finite branch schedule is a genuine pure-`S` reduction. -/
theorem finiteBranchSchedule_steps
    (witness : BitWord -> BitWord -> BitWord)
    (bits source branch : BitWord) :
    Steps (subdivisionCheckpoint witness bits source)
      (subdivisionCheckpoint witness bits (source ++ branch)) :=
  replayAddresses_sound
    (replay_finiteBranchSchedule witness bits source branch)

/-- Validity at the endpoint of a finite validity-indexed branch. -/
theorem validBranchFrom_targetValid {Valid : BitWord -> Prop}
    {source branch : BitWord} (hsource : Valid source)
    (hbranch : ValidBranchFrom Valid source branch) :
    Valid (source ++ branch) := by
  induction hbranch with
  | nil => simpa using hsource
  | @cons source rest bit htarget tail ih =>
      simpa [List.append_assoc] using ih htarget

/-- Valid finite branches have exact source and target branch-ideal projections. -/
theorem finiteBranchSchedule_exact_projections
    {verify : CertificateVerifier}
    {Valid : BitWord -> BitWord -> Prop}
    {witness : BitWord -> BitWord -> BitWord}
    (hprefixClosed : ValidPrefixClosed Valid)
    (hcomplete : VerifierComplete verify Valid witness)
    (bits source branch : BitWord) (hsource : Valid bits source)
    (hbranch : ValidBranchFrom (Valid bits) source branch) :
    replayAddresses (subdivisionCheckpoint witness bits source)
        (finiteBranchSchedule witness bits source branch) =
        some (subdivisionCheckpoint witness bits (source ++ branch)) /\
      (projection verify (subdivisionCheckpoint witness bits source)).Equivalent
        (branchIdeal source) /\
      (projection verify
        (subdivisionCheckpoint witness bits (source ++ branch))).Equivalent
        (branchIdeal (source ++ branch)) := by
  refine ⟨replay_finiteBranchSchedule witness bits source branch,
    projection_subdivisionCheckpoint_equivalent
      hprefixClosed hcomplete bits source hsource, ?_⟩
  exact projection_subdivisionCheckpoint_equivalent
    hprefixClosed hcomplete bits (source ++ branch)
      (validBranchFrom_targetValid hsource hbranch)

end PureSFormal.Research.ProtectedTrieExecutableSchedule
