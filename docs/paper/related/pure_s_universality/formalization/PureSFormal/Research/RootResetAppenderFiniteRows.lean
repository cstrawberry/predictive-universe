import PureSFormal.Research.RootResetEdgeFragment
import PureSFormal.Research.RootResetAppenderStages

/-! Fixed finite pattern/address rows for the live Push contractions. -/
namespace PureSFormal.Research.RootResetAppenderFiniteRows
open PureSFormal.PureS
open RootResetCompletedLocalPatterns RootResetCarrierEdgePatterns

def historyPattern (base : Pattern) : Nat → Pattern
  | 0 => base
  | count + 1 => .app (historyPattern base count) .hole

def lefts : Nat → Address
  | 0 => []
  | count + 1 => .left :: lefts count

theorem historyPattern_shift (base : Pattern) (count : Nat) :
    historyPattern (.app base .hole) count = historyPattern base (count + 1) := by
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (fun pattern => Pattern.app pattern .hole) ih

theorem historyPattern_matches (base : Pattern) (source : Term)
    (matched : base.matchesBool source = true) (histories : List Term) :
    (historyPattern base histories.length).matchesBool (Term.applyArgs source histories) = true := by
  induction histories generalizing base source with
  | nil => exact matched
  | cons history rest ih =>
      have inner : (Pattern.app base .hole).matchesBool (.app source history) = true := by
        simp only [Pattern.matchesBool, matched, Bool.and_true]
      have result := ih (.app base .hole) (.app source history) inner
      rw [historyPattern_shift] at result
      exact result

theorem historyPattern_subterm (base : Pattern) (count : Nat) (source : Term)
    (matched : (historyPattern base count).matchesBool source = true) :
    ∃ focus, source.subterm? (lefts count) = some focus ∧ base.matchesBool focus = true ∧
      source.headArity = focus.headArity + count := by
  induction count generalizing source with
  | zero => exact ⟨source, by cases source <;> rfl, matched, (Nat.add_zero _).symm⟩
  | succ count ih =>
      obtain ⟨fn, arg, sourceEq, fnMatched, _⟩ := app_matches matched
      obtain ⟨focus, subterm, focusMatched, arity⟩ := ih fn fnMatched
      refine ⟨focus, ?_, focusMatched, ?_⟩
      · rw [sourceEq]
        exact subterm
      · rw [sourceEq, Term.headArity, arity]
        exact (Nat.add_succ _ _).symm

inductive Spec where
  | first (bit : Bool) (rest : List Bool) (histories : Nat)
  | second (next : Bool) (tail : List Bool) (histories : Nat)

def Spec.basePattern : Spec → Pattern
  | .first bit rest _ =>
      .app (.app (.app .s (literal (appender rest))) .hole) (.app (literal (live bit)) .hole)
  | .second next tail _ =>
      .app (.app (literal (appender (next :: tail))) .hole) .hole

def Spec.histories : Spec → Nat
  | .first _ _ count => count
  | .second _ _ count => count

def Spec.localAddress : Spec → Address
  | .first .. => []
  | .second .. => [.left]

def Spec.address (spec : Spec) : Address := lefts spec.histories ++ spec.localAddress

def Spec.pattern (spec : Spec) : Pattern := historyPattern spec.basePattern spec.histories

def Spec.edge (spec : Spec) : EdgeRow := ⟨spec.pattern, spec.address⟩

def specsFrom : Nat → List Bool → List Spec
  | _, [] => []
  | count, bit :: rest =>
      .first bit rest count ::
        ((match rest with
          | [] => []
          | next :: tail => [.second next tail count]) ++ specsFrom (count + 1) rest)

def rows (emitted : List Bool) : List EdgeRow := (specsFrom 0 emitted).map Spec.edge

theorem Spec.base_sound (spec : Spec) (source : Term)
    (matched : spec.basePattern.matchesBool source = true) :
    ∃ focus, source.subterm? spec.localAddress = some focus ∧
      focus.contractRoot?.isSome = true ∧
      source.headArity = spec.localAddress.length + 3 := by
  cases spec with
  | first bit rest count =>
      obtain ⟨a, z, sourceEq, am, _⟩ := app_matches matched
      obtain ⟨b, y, aEq, bm, _⟩ := app_matches am
      obtain ⟨head, x, bEq, sm, _⟩ := app_matches bm
      have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound sm)
      refine ⟨Term.redex x y z, ?_, rfl, ?_⟩
      · rw [sourceEq, aEq, bEq, headEq]
        rfl
      · rw [sourceEq, aEq, bEq, headEq]
        rfl
  | second next tail count =>
      obtain ⟨a, history, sourceEq, am, _⟩ := app_matches matched
      obtain ⟨head, accumulator, aEq, hm, _⟩ := app_matches am
      have headEq : head = appender (next :: tail) := (literal_matches _ _).mp hm
      refine ⟨.app (appender (next :: tail)) accumulator, ?_, rfl, ?_⟩
      · rw [sourceEq, aEq, headEq]
        rfl
      · rw [sourceEq, aEq, headEq]
        rfl

theorem subterm_append (source : Term) (first second : Address) :
    source.subterm? (first ++ second) = (source.subterm? first).bind (fun focus => focus.subterm? second) := by
  induction first generalizing source with
  | nil => cases source <;> rfl
  | cons side rest ih =>
      cases source with
      | s => cases side <;> rfl
      | app fn arg => cases side <;> exact ih _

theorem lefts_length (count : Nat) : (lefts count).length = count := by
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg Nat.succ ih

theorem Spec.sound (spec : Spec) (source : Term)
    (matched : spec.pattern.matchesBool source = true) :
    ∃ focus, source.subterm? spec.address = some focus ∧ focus.contractRoot?.isSome = true ∧
      source.headArity = spec.address.length + 3 := by
  obtain ⟨inner, outerSubterm, innerMatched, outerArity⟩ :=
    historyPattern_subterm spec.basePattern spec.histories source matched
  obtain ⟨focus, innerSubterm, redex, innerArity⟩ := spec.base_sound inner innerMatched
  refine ⟨focus, ?_, redex, ?_⟩
  · rw [Spec.address, subterm_append, outerSubterm]
    exact innerSubterm
  · rw [outerArity, innerArity, Spec.address, List.length_append, lefts_length]
    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem first_matches (bit : Bool) (rest : List Bool) (accumulator duplicate : Term)
    (histories : List Term) :
    (Spec.first bit rest histories.length).pattern.matchesBool
      (Term.applyArgs (RootResetAppenderStages.firstRow bit rest accumulator duplicate) histories) = true := by
  apply historyPattern_matches
  simp only [Spec.basePattern, RootResetAppenderStages.firstRow, Pattern.matchesBool,
    literal_self, Bool.true_and, Bool.and_true]

theorem second_matches (next : Bool) (tail : List Bool) (accumulator history : Term)
    (histories : List Term) :
    (Spec.second next tail histories.length).pattern.matchesBool
      (Term.applyArgs (RootResetAppenderStages.secondRow (next :: tail) accumulator history) histories) = true := by
  apply historyPattern_matches
  simp only [Spec.basePattern, RootResetAppenderStages.secondRow, Pattern.matchesBool,
    literal_self, Bool.true_and, Bool.and_true]

theorem lefts_append (first second : Nat) : lefts first ++ lefts second = lefts (first + second) := by
  induction first with
  | zero => simp only [lefts, List.nil_append, Nat.zero_add]
  | succ first ih =>
      simpa only [lefts, List.cons_append, Nat.succ_add] using congrArg (List.cons Direction.left) ih

theorem Spec.address_lefts (spec : Spec) : spec.address = lefts spec.address.length := by
  cases spec with
  | first bit rest count => simp only [Spec.address, Spec.histories, Spec.localAddress, List.append_nil, lefts_length]
  | second next tail count =>
      change lefts count ++ lefts 1 = lefts (lefts count ++ [Direction.left]).length
      rw [List.length_append, lefts_length, List.length_singleton]
      exact lefts_append count 1

theorem matching_addresses_eq (first second : Spec) (source : Term)
    (firstMatches : first.pattern.matchesBool source = true)
    (secondMatches : second.pattern.matchesBool source = true) : first.address = second.address := by
  obtain ⟨_, _, _, firstArity⟩ := first.sound source firstMatches
  obtain ⟨_, _, _, secondArity⟩ := second.sound source secondMatches
  have lengths := Nat.add_right_cancel (firstArity.symm.trans secondArity)
  rw [first.address_lefts, second.address_lefts, lengths]

theorem select_exists (list : List EdgeRow) (source : Term) (wanted : EdgeRow)
    (member : wanted ∈ list) (matched : wanted.pattern.matchesBool source = true) :
    ∃ selected, RootResetEdgeFragment.select list source = some selected := by
  induction list with
  | nil => cases member
  | cons first rest ih =>
      cases firstMatched : first.pattern.matchesBool source with
      | true => exact ⟨first, by simp only [RootResetEdgeFragment.select, firstMatched, ↓reduceIte]⟩
      | false =>
          have inRest : wanted ∈ rest := by
            rcases List.mem_cons.mp member with same | inRest
            · subst first
              cases firstMatched.symm.trans matched
            · exact inRest
          obtain ⟨selected, selectedEq⟩ := ih inRest
          exact ⟨selected, by simpa only [RootResetEdgeFragment.select, firstMatched, Bool.false_eq_true, ↓reduceIte] using selectedEq⟩

theorem first_mem (offset : Nat) (prior : List Bool) (bit : Bool) (rest : List Bool) :
    Spec.first bit rest (offset + prior.length) ∈ specsFrom offset (prior ++ bit :: rest) := by
  induction prior generalizing offset with
  | nil => exact List.Mem.head _
  | cons head tail ih =>
      have inside := ih (offset + 1)
      have countEq : offset + (head :: tail).length = offset + 1 + tail.length := by
        simp only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [countEq]
      exact List.Mem.tail _ (List.mem_append_right _ inside)

theorem second_mem (offset : Nat) (prior : List Bool) (bit next : Bool) (tail : List Bool) :
    Spec.second next tail (offset + prior.length) ∈ specsFrom offset (prior ++ bit :: next :: tail) := by
  induction prior generalizing offset with
  | nil => exact List.Mem.tail _ (List.Mem.head _)
  | cons head rest ih =>
      have inside := ih (offset + 1)
      have countEq : offset + (head :: rest).length = offset + 1 + rest.length := by
        simp only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [countEq]
      exact List.Mem.tail _ (List.mem_append_right _ inside)

theorem map_preimage {α β : Type} (fn : α → β) (list : List α) (value : β)
    (member : value ∈ list.map fn) : ∃ source, source ∈ list ∧ fn source = value := by
  induction list with
  | nil => cases member
  | cons first rest ih =>
      cases member with
      | head => exact ⟨first, List.Mem.head _, rfl⟩
      | tail _ inRest =>
          obtain ⟨source, inside, equal⟩ := ih inRest
          exact ⟨source, List.Mem.tail _ inside, equal⟩

theorem selected_spec (emitted : List Bool) (source : Term) (edge : EdgeRow)
    (selected : RootResetEdgeFragment.select (rows emitted) source = some edge) :
    ∃ spec, spec ∈ specsFrom 0 emitted ∧ spec.edge = edge ∧ spec.pattern.matchesBool source = true := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ source edge selected
  obtain ⟨spec, inside, equal⟩ := map_preimage Spec.edge (specsFrom 0 emitted) edge member
  exact ⟨spec, inside, equal, by rw [← equal] at matched; exact matched⟩

/-- Every accepted row points to a genuine S-redex; every miss restores the
exact entry cursor. The bound is fixed by the emitted word, not the input term. -/
theorem all_input (emitted : List Bool) (origin : Cursor) :
    ∃ ready endpoint member,
      FiniteController.run (RootResetEdgeFragment.machine (rows emitted))
        (RootResetEdgeFragment.ticks (rows emitted) origin.focus)
        (RootResetEdgeFragment.initial (rows emitted) origin) =
        ⟨some ⟨ProbeCompiler.Control.answer ready, member⟩, endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) ∧
      RootResetEdgeFragment.ticks (rows emitted) origin.focus ≤ RootResetEdgeFragment.bound (rows emitted) := by
  cases selected : RootResetEdgeFragment.select (rows emitted) origin.focus with
  | none =>
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs (rows emitted) origin selected
      exact ⟨false, origin, member, execution, rfl, RootResetEdgeFragment.ticks_bound _ _⟩
  | some edge =>
      obtain ⟨spec, inside, equal, matched⟩ := selected_spec emitted origin.focus edge selected
      obtain ⟨focus, subterm, redex, arity⟩ := spec.sound origin.focus matched
      have subterm' : origin.focus.subterm? edge.address = some focus := by rw [← equal]; exact subterm
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists edge.address origin.focus focus subterm' origin.parents
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.selected_runs (rows emitted) origin endpoint edge selected followed
      refine ⟨true, endpoint, member, execution, ?_, RootResetEdgeFragment.ticks_bound _ _⟩
      change endpoint.rdx?.isSome = true
      rcases endpoint with ⟨value, parents⟩
      change value = focus at focusEq
      subst value
      cases result : focus.contractRoot? with
      | none => rw [result] at redex; cases redex
      | some target => simp only [Cursor.rdx?, result]; rfl

theorem selected_address (emitted : List Bool) (wanted : Spec) (source : Term)
    (member : wanted ∈ specsFrom 0 emitted) (matched : wanted.pattern.matchesBool source = true) :
    ∃ selected, RootResetEdgeFragment.select (rows emitted) source = some selected ∧
      selected.address = wanted.address := by
  have inRows : wanted.edge ∈ rows emitted := RootResetCompletedLocalPatterns.map_member Spec.edge member
  obtain ⟨selected, found⟩ := select_exists (rows emitted) source wanted.edge inRows matched
  obtain ⟨spec, inside, equal, selectedMatches⟩ := selected_spec emitted source selected found
  exact ⟨selected, found, by rw [← equal]; exact matching_addresses_eq spec wanted source selectedMatches matched⟩

theorem generated_first (prior : List Bool) (bit : Bool) (rest : List Bool)
    (accumulator duplicate : Term) (histories : List Term) (countEq : histories.length = prior.length) :
    ∃ selected, RootResetEdgeFragment.select (rows (prior ++ bit :: rest))
        (Term.applyArgs (RootResetAppenderStages.firstRow bit rest accumulator duplicate) histories) = some selected ∧
      selected.address = (Spec.first bit rest histories.length).address := by
  apply selected_address
  · rw [countEq]
    simpa only [Nat.zero_add] using first_mem 0 prior bit rest
  · exact first_matches bit rest accumulator duplicate histories

theorem generated_second (prior : List Bool) (bit next : Bool) (tail : List Bool)
    (accumulator history : Term) (histories : List Term) (countEq : histories.length = prior.length) :
    ∃ selected, RootResetEdgeFragment.select (rows (prior ++ bit :: next :: tail))
        (Term.applyArgs (RootResetAppenderStages.secondRow (next :: tail) accumulator history) histories) = some selected ∧
      selected.address = (Spec.second next tail histories.length).address := by
  apply selected_address
  · rw [countEq]
    simpa only [Nat.zero_add] using second_mem 0 prior bit next tail
  · exact second_matches next tail accumulator history histories

theorem generated_runs (emitted : List Bool) (wanted : Spec) (source : Term)
    (member : wanted ∈ specsFrom 0 emitted) (matched : wanted.pattern.matchesBool source = true)
    (parents : List ParentFrame) :
    ∃ endpoint controlMember,
      RootResetEdgeFragment.follow wanted.address ⟨source, parents⟩ = some endpoint ∧
      FiniteController.run (RootResetEdgeFragment.machine (rows emitted))
        (RootResetEdgeFragment.ticks (rows emitted) source)
        (RootResetEdgeFragment.initial (rows emitted) ⟨source, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, controlMember⟩, endpoint⟩ := by
  obtain ⟨selected, found, addressEq⟩ := selected_address emitted wanted source member matched
  obtain ⟨focus, subterm, _, _⟩ := wanted.sound source matched
  obtain ⟨endpoint, followed, _⟩ := RootResetEdgeFragment.follow_exists wanted.address source focus subterm parents
  obtain ⟨controlMember, execution⟩ := RootResetEdgeFragment.selected_runs (rows emitted) ⟨source, parents⟩
    endpoint selected found (by rw [addressEq]; exact followed)
  exact ⟨endpoint, controlMember, followed, execution⟩

/-- A proof-side discriminator for an application tail in the first argument. -/
def firstArgApp : Term → Bool
  | .s => false
  | .app .s (.app _ (.app _ _)) => true
  | .app .s _ => false
  | .app (.app fn arg) _ => firstArgApp (.app fn arg)

theorem firstArgApp_app (fn arg : Term) (nonzero : fn.headArity ≠ 0) :
    firstArgApp (.app fn arg) = firstArgApp fn := by
  cases fn with
  | s => exact (nonzero rfl).elim
  | app _ _ => rfl

theorem firstArgApp_applyArgs (fn : Term) (arguments : List Term) (nonzero : fn.headArity ≠ 0) :
    firstArgApp (Term.applyArgs fn arguments) = firstArgApp fn := by
  induction arguments generalizing fn with
  | nil => rfl
  | cons arg rest ih =>
      rw [Term.applyArgs, ih (.app fn arg) (by exact Nat.noConfusion), firstArgApp_app fn arg nonzero]

theorem Spec.base_firstArgApp (spec : Spec) (source : Term)
    (matched : spec.basePattern.matchesBool source = true) : firstArgApp source = true := by
  cases spec with
  | first bit rest count =>
      obtain ⟨a, z, sourceEq, am, _⟩ := app_matches matched
      obtain ⟨b, y, aEq, bm, _⟩ := app_matches am
      obtain ⟨head, x, bEq, sm, xm⟩ := app_matches bm
      have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound sm)
      have xEq : x = appender rest := (literal_matches _ _).mp xm
      rw [sourceEq, aEq, bEq, headEq, xEq]
      cases rest <;> cases bit <;> rfl
  | second next tail count =>
      obtain ⟨a, history, sourceEq, am, _⟩ := app_matches matched
      obtain ⟨head, accumulator, aEq, hm, _⟩ := app_matches am
      have headEq : head = appender (next :: tail) := (literal_matches _ _).mp hm
      rw [sourceEq, aEq, headEq]
      cases tail <;> rfl

theorem Spec.matches_firstArgApp (spec : Spec) (source : Term)
    (matched : spec.pattern.matchesBool source = true) : firstArgApp source = true := by
  have go : ∀ count source, (historyPattern spec.basePattern count).matchesBool source = true →
      firstArgApp source = true := by
    intro count
    induction count with
    | zero => intro source matched; exact spec.base_firstArgApp source matched
    | succ count ih =>
        intro source matched
        obtain ⟨fn, arg, sourceEq, fnMatched, _⟩ := app_matches matched
        have previous := ih fn fnMatched
        have nonzero : fn.headArity ≠ 0 := by
          cases fn with
          | s => cases previous
          | app _ _ => exact Nat.noConfusion
        rw [sourceEq, firstArgApp_app fn arg nonzero]
        exact previous
  exact go spec.histories source matched

/-- Completed appender rows cannot accidentally select their dormant S-redex. -/
theorem final_rejected (emitted : List Bool) (accumulator history : Term) (histories : List Term) :
    RootResetEdgeFragment.select (rows emitted)
      (Term.applyArgs (RootResetAppenderStages.secondRow [] accumulator history) histories) = none := by
  cases selected : RootResetEdgeFragment.select (rows emitted)
      (Term.applyArgs (RootResetAppenderStages.secondRow [] accumulator history) histories) with
  | none => rfl
  | some edge =>
      obtain ⟨spec, _, _, matched⟩ := selected_spec emitted _ edge selected
      have guard := spec.matches_firstArgApp _ matched
      rw [firstArgApp_applyArgs _ histories (by exact Nat.noConfusion)] at guard
      change false = true at guard
      cases guard

theorem prefixLeft_eq (count : Nat) (suffix : Address) :
    ActionParser.prefixLeft count suffix = lefts count ++ suffix := by
  induction count generalizing suffix with
  | zero => rfl
  | succ count ih =>
      rw [ActionParser.prefixLeft, ih,
        show lefts (count + 1) = lefts count ++ [Direction.left] from (lefts_append count 1).symm,
        List.append_assoc]
      rfl

theorem first_address (bit : Bool) (rest : List Bool) (histories : List Term) :
    (Spec.first bit rest histories.length).address = RootResetAppenderStages.historyPrefixAddress histories [] := by
  exact (prefixLeft_eq histories.length []).symm

theorem second_address (next : Bool) (tail : List Bool) (histories : List Term) :
    (Spec.second next tail histories.length).address = RootResetAppenderStages.historyPrefixAddress histories [.left] := by
  exact (prefixLeft_eq histories.length [.left]).symm

theorem zero_mutations (emitted : List Bool) (ticks : Nat)
    (configuration : FiniteController.Configuration (RootResetEdgeFragment.Control (rows emitted))) :
    FiniteController.runMutationCount (RootResetEdgeFragment.machine (rows emitted)) ticks configuration = 0 :=
  RootResetEdgeFragment.runMutationCount_zero _ _ _

end PureSFormal.Research.RootResetAppenderFiniteRows
