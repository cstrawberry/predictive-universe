import PureSFormal.Rogozhin.Table

/-!
# Executable finite-window semantics for Rogozhin's machine

Side lists are nearest-cell first.  Reading beyond either finite list yields
the fixed blank symbol `4`.  A halting table cell has no successor; the total
step used for iteration absorbs at such a configuration.
-/

namespace PureSFormal.Rogozhin46

/-- A finite represented tape window, with both side lists nearest-first. -/
structure Config where
  state : State
  current : Symbol
  left : List Symbol
  right : List Symbol
  deriving DecidableEq, Repr

/-- Read one side cell, using the blank tail when the finite list is empty. -/
def popSide : List Symbol → Symbol × List Symbol
  | [] => (blank, [])
  | symbol :: rest => (symbol, rest)

@[simp]
theorem popSide_nil : popSide [] = (blank, []) :=
  rfl

@[simp]
theorem popSide_cons (symbol : Symbol) (rest : List Symbol) :
    popSide (symbol :: rest) = (symbol, rest) :=
  rfl

/-- Apply one nonhalting table command to a finite-window configuration. -/
def applyTransition (config : Config)
    (next : State) (write : Symbol) : Direction → Config
  | .left =>
      let exposed := popSide config.left
      ⟨next, exposed.1, exposed.2, write :: config.right⟩
  | .right =>
      let exposed := popSide config.right
      ⟨next, exposed.1, write :: config.left, exposed.2⟩

/-- The ordinary partial machine transition. -/
def step? (config : Config) : Option Config :=
  match transition config.state config.current with
  | .halt => none
  | .step next write move => some (applyTransition config next write move)

/-- The decidable halting predicate at the current table cell. -/
def Halted (config : Config) : Prop :=
  transition config.state config.current = .halt

instance (config : Config) : Decidable (Halted config) :=
  inferInstanceAs (Decidable (transition config.state config.current = .halt))

/-- The total absorbing extension used for bounded iteration. -/
def absorbingStep (config : Config) : Config :=
  match step? config with
  | none => config
  | some next => next

/-- Total `n`-step iteration of the absorbing machine dynamics. -/
def iterate : Nat → Config → Config
  | 0, config => config
  | n + 1, config => absorbingStep (iterate n config)

@[simp]
theorem iterate_zero (config : Config) : iterate 0 config = config :=
  rfl

@[simp]
theorem iterate_succ (n : Nat) (config : Config) :
    iterate (n + 1) config = absorbingStep (iterate n config) :=
  rfl

/-- Partial transition is undefined exactly at the two halting table cells. -/
theorem step?_eq_none_iff (config : Config) :
    step? config = none ↔ Halted config := by
  unfold step? Halted
  cases htransition : transition config.state config.current with
  | halt => simp
  | step next write move => simp

/-- Every running command produces its exact finite-window successor. -/
theorem step?_eq_some_applyTransition
    (config : Config) (next : State) (write : Symbol) (move : Direction)
    (htransition : transition config.state config.current =
      .step next write move) :
    step? config = some (applyTransition config next write move) := by
  simp [step?, htransition]

/-- The total extension agrees with every ordinary running transition. -/
theorem absorbingStep_of_step?
    {config next : Config} (hstep : step? config = some next) :
    absorbingStep config = next := by
  simp [absorbingStep, hstep]

/-- A halted configuration is a fixed point of the total extension. -/
theorem absorbingStep_of_halted
    {config : Config} (hhalted : Halted config) :
    absorbingStep config = config := by
  have hnone := (step?_eq_none_iff config).2 hhalted
  simp [absorbingStep, hnone]

/-- Halting is precisely state C or D scanning symbol 3. -/
theorem halted_iff (config : Config) :
    Halted config ↔
      (config.state = .C ∧ config.current = .s3) ∨
      (config.state = .D ∧ config.current = .s3) := by
  exact transition_eq_halt_iff config.state config.current

/-- Once halted, every bounded iterate remains the identical configuration. -/
theorem iterate_of_halted
    {config : Config} (hhalted : Halted config) (n : Nat) :
    iterate n config = config := by
  induction n with
  | zero => rfl
  | succ n ih =>
      rw [iterate_succ, ih, absorbingStep_of_halted hhalted]

/-- Iteration composes additively. -/
theorem iterate_add (m n : Nat) (config : Config) :
    iterate (m + n) config = iterate m (iterate n config) := by
  induction m with
  | zero => simp
  | succ m ih => simp [Nat.succ_add, iterate, ih]

/-- The trajectory event used by the later universality composition. -/
def EventuallyHalts (config : Config) : Prop :=
  ∃ n, Halted (iterate n config)

/-- An already halted configuration eventually halts at horizon zero. -/
theorem eventuallyHalts_of_halted
    {config : Config} (hhalted : Halted config) :
    EventuallyHalts config :=
  ⟨0, hhalted⟩

/-- A witnessed ordinary step shifts a later halt witness by one horizon. -/
theorem eventuallyHalts_of_step
    {config next : Config}
    (hstep : step? config = some next)
    (hlater : EventuallyHalts next) :
    EventuallyHalts config := by
  obtain ⟨n, hn⟩ := hlater
  refine ⟨n + 1, ?_⟩
  rw [iterate_add, iterate_succ, iterate_zero,
    absorbingStep_of_step? hstep]
  exact hn

end PureSFormal.Rogozhin46
