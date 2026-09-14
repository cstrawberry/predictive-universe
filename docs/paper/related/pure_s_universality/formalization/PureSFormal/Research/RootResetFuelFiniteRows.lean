import PureSFormal.Research.RootResetPendingAdmissionPatterns
import PureSFormal.Research.RootResetDispatcherStageRows

/-! Finite selection of all seven fuel script shapes, with independent copies. -/
namespace PureSFormal.Research.RootResetFuelFiniteRows
open PureSFormal.PureS
open FiniteController RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns (EdgeRow)
open RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetPendingAdmissionFuelPatterns (Kind kinds kind_member pattern)

def Kind.address : Kind → Address
  | .callZero | .callPositive | .zeroFirst | .zeroThird => [.left]
  | .positiveHalf | .zeroSecond | .zeroFourth => []

def row (actions : Term) (kind : Kind) : EdgeRow :=
  ⟨pattern (RootResetPendingAdmissionPatterns.environmentPattern actions) kind, Kind.address kind⟩

def rows (actions : Term) : List EdgeRow := kinds.map (row actions)

def fixedArity? : Pattern → Option Nat
  | .hole => none
  | .s => some 0
  | .app fn _ => (fixedArity? fn).map Nat.succ

theorem fixedArity_sound (pattern : Pattern) (source : Term) (count : Nat)
    (known : fixedArity? pattern = some count) (matched : pattern.matchesBool source = true) :
    source.headArity = count := by
  induction pattern generalizing source count with
  | hole => cases known
  | s =>
      have equal : source = .s := (literal_matches .s source).mp matched
      rw [equal]
      exact Option.some.inj known
  | app fn arg ihFn ihArg =>
      obtain ⟨left, right, sourceEq, leftMatched, _⟩ := app_matches matched
      cases found : fixedArity? fn with
      | none => simp only [fixedArity?, found, Option.map_none] at known; cases known
      | some value =>
          have countEq : value + 1 = count := Option.some.inj (by simpa only [fixedArity?, found, Option.map_some] using known)
          rw [sourceEq, Term.headArity, ihFn left value found leftMatched]
          exact countEq

theorem row_arity (actions : Term) (kind : Kind) (source : Term)
    (matched : (row actions kind).pattern.matchesBool source = true) :
    source.headArity = (Kind.address kind).length + 3 := by
  apply fixedArity_sound _ source _ _ matched
  cases kind <;> rfl

theorem address_cases (kind : Kind) : Kind.address kind = [] ∨ Kind.address kind = [.left] := by
  cases kind <;> first | exact Or.inl rfl | exact Or.inr rfl

theorem row_redex (actions : Term) (kind : Kind) (source : Term)
    (matched : (row actions kind).pattern.matchesBool source = true) :
    ∃ focus replacement, source.subterm? (Kind.address kind) = some focus ∧ focus.contractRoot? = some replacement := by
  have arity := row_arity actions kind source matched
  rcases address_cases kind with atRoot | atLeft
  · rw [atRoot] at arity ⊢
    obtain ⟨x, y, z, equal⟩ := SchedulerContinuation.eq_redex_of_headArity_three source arity
    rw [equal]
    exact ⟨_, _, rfl, rfl⟩
  · rw [atLeft] at arity ⊢
    cases source with
    | s => cases arity
    | app fn arg =>
        have fnArity : fn.headArity = 3 := Nat.succ.inj arity
        obtain ⟨x, y, z, equal⟩ := SchedulerContinuation.eq_redex_of_headArity_three fn fnArity
        rw [equal]
        exact ⟨_, _, rfl, rfl⟩

theorem edge_redex (actions : Term) (edge : EdgeRow) (member : edge ∈ rows actions) (source : Term)
    (matched : edge.pattern.matchesBool source = true) :
    ∃ focus replacement, source.subterm? edge.address = some focus ∧ focus.contractRoot? = some replacement := by
  obtain ⟨kind, _, equal⟩ := map_member_inverse _ _ _ member
  subst edge
  exact row_redex actions kind source matched

theorem address_eq_of_length (first second : Kind) (same : (Kind.address first).length = (Kind.address second).length) :
    Kind.address first = Kind.address second := by
  rcases address_cases first with firstEq | firstEq
  all_goals rcases address_cases second with secondEq | secondEq
  all_goals rw [firstEq, secondEq] at same ⊢
  all_goals first | rfl | simp at same

theorem matching_addresses_eq (actions : Term) (first second : EdgeRow)
    (firstMember : first ∈ rows actions) (secondMember : second ∈ rows actions) (source : Term)
    (firstMatches : first.pattern.matchesBool source = true) (secondMatches : second.pattern.matchesBool source = true) :
    first.address = second.address := by
  obtain ⟨firstKind, _, firstEq⟩ := map_member_inverse _ _ _ firstMember
  obtain ⟨secondKind, _, secondEq⟩ := map_member_inverse _ _ _ secondMember
  subst first
  subst second
  exact address_eq_of_length firstKind secondKind (Nat.add_right_cancel
    ((row_arity actions firstKind source firstMatches).symm.trans (row_arity actions secondKind source secondMatches)))

theorem row_local_arity (row : FuelRow) : row.term.headArity = row.localAddress.length + 3 := by
  cases row with
  | call fuel environment continuation => cases fuel <;> rfl
  | positiveHalf | zeroFirst | zeroSecond | zeroThird | zeroFourth => rfl

theorem fuel_address_cases (row : FuelRow) : row.localAddress = [] ∨ row.localAddress = [.left] := by
  cases row <;> first | exact Or.inl rfl | exact Or.inr rfl

theorem matched_address (actions : Term) (kind : Kind) (fuel : FuelRow)
    (matched : (row actions kind).pattern.matchesBool fuel.term = true) : Kind.address kind = fuel.localAddress := by
  have same := Nat.add_right_cancel ((row_arity actions kind fuel.term matched).symm.trans (row_local_arity fuel))
  rcases address_cases kind with first | first
  all_goals rcases fuel_address_cases fuel with second | second
  all_goals rw [first, second] at same ⊢
  all_goals first | rfl | simp at same

theorem canonical_selected (actions : Term) (fuel : FuelRow) (canonical : CanonicalFuelRow actions fuel) :
    ∃ edge, RootResetEdgeFragment.select (rows actions) fuel.term = some edge ∧ edge.address = fuel.localAddress := by
  obtain ⟨pattern, member, matched⟩ := RootResetPendingAdmissionFuelPatterns.canonical_matches actions
    (RootResetPendingAdmissionPatterns.environmentPattern actions) (RootResetPendingAdmissionPatterns.environment_matches actions) fuel canonical
  obtain ⟨kind, kindMember, equal⟩ := map_member_inverse _ _ _ member
  subst pattern
  obtain ⟨edge, selected⟩ := RootResetDispatcherStageRows.select_exists (rows actions) fuel.term
    ⟨row actions kind, map_member _ kindMember, matched⟩
  obtain ⟨inside, selectedMatches⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
  have addressEq := matching_addresses_eq actions edge (row actions kind) inside (map_member _ kindMember) fuel.term selectedMatches matched
  exact ⟨edge, selected, addressEq.trans (matched_address actions kind fuel matched)⟩

abbrev machine (actions : Term) := RootResetEdgeFragment.machine (rows actions)
abbrev initial (actions : Term) (origin : Cursor) := RootResetEdgeFragment.initial (rows actions) origin
def bound (actions : Term) : Nat := RootResetEdgeFragment.bound (rows actions)

theorem all_input (actions : Term) (origin : Cursor) :
    ∃ ready endpoint member,
      run (machine actions) (RootResetEdgeFragment.ticks (rows actions) origin.focus) (initial actions origin) =
        ⟨some ⟨ProbeCompiler.Control.answer ready, member⟩, endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) ∧
      RootResetEdgeFragment.ticks (rows actions) origin.focus ≤ bound actions := by
  cases selected : RootResetEdgeFragment.select (rows actions) origin.focus with
  | none =>
      obtain ⟨member, actual⟩ := RootResetEdgeFragment.missed_runs _ origin selected
      exact ⟨false, origin, member, actual, rfl, RootResetEdgeFragment.ticks_bound _ _⟩
  | some edge =>
      obtain ⟨inside, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      obtain ⟨focus, replacement, placement, redex⟩ := edge_redex actions edge inside origin.focus matched
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ placement origin.parents
      obtain ⟨member, actual⟩ := RootResetEdgeFragment.selected_runs _ origin endpoint edge selected followed
      refine ⟨true, endpoint, member, actual, ?_, RootResetEdgeFragment.ticks_bound _ _⟩
      simp only [↓reduceIte, Cursor.rdx?, focusEq, redex]; rfl

theorem generated_runs (actions : Term) (fuel : FuelRow) (canonical : CanonicalFuelRow actions fuel)
    (parents : List ParentFrame) :
    ∃ endpoint member,
      RootResetEdgeFragment.follow fuel.localAddress ⟨fuel.term, parents⟩ = some endpoint ∧
      run (machine actions) (RootResetEdgeFragment.ticks (rows actions) fuel.term) (initial actions ⟨fuel.term, parents⟩) =
        ⟨some ⟨ProbeCompiler.Control.answer true, member⟩, endpoint⟩ ∧
      endpoint.focus = fuel.focus ∧ endpoint.rdx? = some ⟨fuel.replacement, endpoint.parents⟩ := by
  obtain ⟨edge, selected, addressEq⟩ := canonical_selected actions fuel canonical
  obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists _ _ _ fuel.focus_subterm parents
  obtain ⟨member, actual⟩ := RootResetEdgeFragment.selected_runs _ ⟨fuel.term, parents⟩ endpoint edge selected
    (by rw [addressEq]; exact followed)
  refine ⟨endpoint, member, followed, actual, focusEq, ?_⟩
  rw [Cursor.rdx?, focusEq]
  have redex : fuel.focus.contractRoot? = some fuel.replacement := by
    cases fuel with
    | call fuel environment continuation => cases fuel <;> rfl
    | positiveHalf | zeroFirst | zeroSecond | zeroThird | zeroFourth => rfl
  rw [redex]

theorem runMutationCount_zero (actions : Term) (ticks : Nat)
    (configuration : Configuration (RootResetEdgeFragment.Control (rows actions))) :
    runMutationCount (machine actions) ticks configuration = 0 := RootResetEdgeFragment.runMutationCount_zero _ _ _

theorem erase_run (actions : Term) (ticks : Nat)
    (configuration : Configuration (RootResetEdgeFragment.Control (rows actions))) :
    (run (machine actions) ticks configuration).cursor.erase = configuration.cursor.erase := RootResetEdgeFragment.erase_run _ _ _

end PureSFormal.Research.RootResetFuelFiniteRows
