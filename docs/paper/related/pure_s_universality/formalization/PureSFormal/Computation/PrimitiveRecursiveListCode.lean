import PureSFormal.Computation.DeterministicTapeCode

/-!
# Closed primitive-recursive programs on the canonical list numbering

The list numbering is `DeterministicTapeCode.NatList.encode id`: zero denotes
the empty list and a successor of a Cantor pair denotes a cons cell.  A bounded
fold carries the remaining list code and accumulator in one pair.  Its fuel
is the input list code, which bounds the number of cells; after the list ends,
the state is fixed.  The fold contains closed `PRCode`, not a semantic callback.
-/

namespace PureSFormal.Computation.PrimitiveRecursiveListCode

open PureSFormal.PureS
open DeterministicTapeCode

def encode : List Nat → Nat := NatList.encode id

def decode : Nat → List Nat := NatList.decode id

@[simp] theorem encode_nil : encode [] = 0 := rfl

@[simp] theorem encode_cons (head : Nat) (tail : List Nat) :
    encode (head :: tail) = Term.pair head (encode tail) + 1 := rfl

@[simp] theorem decode_encode (values : List Nat) : decode (encode values) = values :=
  NatList.decode_encode id id (fun _ => rfl) values

@[simp] theorem encode_decode (number : Nat) : encode (decode number) = number :=
  NatList.encode_decode id id (fun _ => rfl) number

theorem length_le_encode (values : List Nat) : values.length ≤ encode values := by
  induction values with
  | nil => exact Nat.le_refl 0
  | cons head tail ih =>
      exact Nat.le_trans (Nat.succ_le_succ ih)
        (Term.right_lt_pair_succ head (encode tail))

namespace Program

@[simp] theorem eval_unary (code : PRCode 1) (input : Nat) :
    PRCode.eval code [input] = PRCode.eval₁ code input := rfl

@[simp] theorem eval_binary (code : PRCode 2) (first second : Nat) :
    PRCode.eval code [first, second] = PRCode.eval₂ code first second := rfl

@[simp] theorem eval_projection {arity : Nat} (index : Fin arity)
    (input : List Nat) :
    PRCode.eval (.projection index) input = input.getD index.val 0 := by
  cases arity with
  | zero => exact Fin.elim0 index
  | succ arity => rfl

@[simp] theorem eval₁_composeUnary (outer : PRCode 1) (inner : PRCode 1)
    (input : Nat) :
    PRCode.eval₁ (PRCode.composeUnary outer inner) input =
      PRCode.eval₁ outer (PRCode.eval₁ inner input) := by
  change PRCode.eval (PRCode.composeUnary outer inner) [input] = _
  rw [PRCode.eval_composeUnary]
  rfl

@[simp] theorem eval₂_composeUnary (outer : PRCode 1) (inner : PRCode 2)
    (first second : Nat) :
    PRCode.eval₂ (PRCode.composeUnary outer inner) first second =
      PRCode.eval₁ outer (PRCode.eval₂ inner first second) := by
  change PRCode.eval (PRCode.composeUnary outer inner) [first, second] = _
  rw [PRCode.eval_composeUnary]
  rfl

@[simp] theorem eval₁_composeBinary (outer : PRCode 2)
    (first second : PRCode 1) (input : Nat) :
    PRCode.eval₁ (PRCode.composeBinary outer first second) input =
      PRCode.eval₂ outer (PRCode.eval₁ first input) (PRCode.eval₁ second input) := by
  change PRCode.eval (PRCode.composeBinary outer first second) [input] = _
  rw [PRCode.eval_composeBinary]
  rfl

@[simp] theorem eval₂_composeBinary (outer : PRCode 2)
    (first second : PRCode 2) (left right : Nat) :
    PRCode.eval₂ (PRCode.composeBinary outer first second) left right =
      PRCode.eval₂ outer (PRCode.eval₂ first left right)
        (PRCode.eval₂ second left right) := by
  change PRCode.eval (PRCode.composeBinary outer first second) [left, right] = _
  rw [PRCode.eval_composeBinary]
  rfl

@[simp] theorem eval₁_composeTernary (outer : PRCode 3)
    (first second third : PRCode 1) (input : Nat) :
    PRCode.eval₁ (PRCode.composeTernary outer first second third) input =
      PRCode.eval outer
        [PRCode.eval₁ first input, PRCode.eval₁ second input,
          PRCode.eval₁ third input] := by
  change PRCode.eval (PRCode.composeTernary outer first second third) [input] = _
  rw [PRCode.eval_composeTernary]
  rfl

@[simp] theorem eval₂_composeTernary (outer : PRCode 3)
    (first second third : PRCode 2) (left right : Nat) :
    PRCode.eval₂ (PRCode.composeTernary outer first second third) left right =
      PRCode.eval outer
        [PRCode.eval₂ first left right, PRCode.eval₂ second left right,
          PRCode.eval₂ third left right] := by
  change PRCode.eval (PRCode.composeTernary outer first second third) [left, right] = _
  rw [PRCode.eval_composeTernary]
  rfl

@[simp] theorem eval₁_projection_zero (input : Nat) :
    PRCode.eval₁ (.projection 0) input = input := rfl

@[simp] theorem eval₂_projection_zero (first second : Nat) :
    PRCode.eval₂ (.projection 0) first second = first := rfl

@[simp] theorem eval₂_projection_one (first second : Nat) :
    PRCode.eval₂ (.projection 1) first second = second := rfl

@[simp] theorem eval₁_constant (value input : Nat) :
    PRCode.eval₁ (PRCode.constant 1 value) input = value :=
  PRCode.eval_constant 1 value [input]

@[simp] theorem eval₂_constant (value first second : Nat) :
    PRCode.eval₂ (PRCode.constant 2 value) first second = value :=
  PRCode.eval_constant 2 value [first, second]

/-- Constructor on a head value and a tail code. -/
def cons : PRCode 2 := PRCode.composeUnary .successor PRCode.cantorPair

@[simp] theorem eval_cons (head tail : Nat) :
    PRCode.eval₂ cons head tail = Term.pair head tail + 1 := by
  rw [cons, eval₂_composeUnary, eval₂_cantorPair_eq_termPair]
  rfl

/-- Head of a nonempty coded list, with zero as the empty-list default. -/
def head : PRCode 1 := PRCode.composeUnary PRCode.cantorLeft PRCode.predecessor

/-- Tail of a coded list, with the empty list fixed. -/
def tail : PRCode 1 := PRCode.composeUnary PRCode.cantorRight PRCode.predecessor

@[simp] theorem eval_head (number : Nat) :
    PRCode.eval₁ head number = (Term.unpair (number - 1)).1 := by
  rw [head, eval₁_composeUnary, PRCode.eval₁_predecessor,
    eval₁_cantorLeft_eq_unpair_fst]

@[simp] theorem eval_tail (number : Nat) :
    PRCode.eval₁ tail number = (Term.unpair (number - 1)).2 := by
  rw [tail, eval₁_composeUnary, PRCode.eval₁_predecessor,
    eval₁_cantorRight_eq_unpair_snd]

/-- One fold transition on `(remaining list code, accumulator)`. -/
def foldStep (step : PRCode 2) : PRCode 1 :=
  let remaining := PRCode.cantorLeft
  let accumulated := PRCode.cantorRight
  let next := PRCode.composeBinary PRCode.cantorPair
    (PRCode.composeUnary tail remaining)
    (PRCode.composeBinary step accumulated (PRCode.composeUnary head remaining))
  PRCode.composeTernary PRCode.branchIfZero PRCode.identity next remaining

def foldStepValue (step : PRCode 2) (state : Nat) : Nat :=
  let remaining := (Term.unpair state).1
  let accumulated := (Term.unpair state).2
  if remaining = 0 then state
  else Term.pair (Term.unpair (remaining - 1)).2
    (PRCode.eval₂ step accumulated (Term.unpair (remaining - 1)).1)

@[simp] theorem eval_foldStep (step : PRCode 2) (state : Nat) :
    PRCode.eval₁ (foldStep step) state = foldStepValue step state := by
  simp only [foldStep, foldStepValue, eval₁_composeUnary,
    eval₁_composeBinary, eval₁_composeTernary, PRCode.eval_identity,
    PRCode.eval_branchIfZero, eval_head, eval_tail,
    eval₁_cantorLeft_eq_unpair_fst, eval₁_cantorRight_eq_unpair_snd,
    eval₂_cantorPair_eq_termPair]

/-- Iterate an arbitrary closed unary program on the first argument. -/
def iterate (step : PRCode 1) : PRCode 2 :=
  .recursion PRCode.identity (PRCode.composeUnary step (.projection 2))

def iterateValue (step : PRCode 1) (initial : Nat) : Nat → Nat
  | 0 => initial
  | fuel + 1 => PRCode.eval₁ step (iterateValue step initial fuel)

@[simp] theorem eval_iterate (step : PRCode 1) (initial fuel : Nat) :
    PRCode.eval₂ (iterate step) initial fuel = iterateValue step initial fuel := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      change PRCode.eval₁ step (PRCode.eval₂ (iterate step) initial fuel) = _
      rw [ih]
      rfl

theorem iterateValue_succ_front (step : PRCode 1) (initial fuel : Nat) :
    iterateValue step initial (fuel + 1) =
      iterateValue step (PRCode.eval₁ step initial) fuel := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      change PRCode.eval₁ step (iterateValue step initial (fuel + 1)) = _
      rw [ih]
      rfl

/-- Fold a coded list from the supplied accumulator, with its code as fuel. -/
def fold (step : PRCode 2) : PRCode 2 :=
  PRCode.composeUnary PRCode.cantorRight
    (PRCode.composeBinary (iterate (foldStep step)) PRCode.cantorPair (.projection 0))

@[simp] theorem foldStepValue_nil (step : PRCode 2) (accumulated : Nat) :
    foldStepValue step (Term.pair 0 accumulated) = Term.pair 0 accumulated := by
  simp [foldStepValue, Term.unpair_pair]

@[simp] theorem foldStepValue_cons (step : PRCode 2) (first : Nat)
    (rest : List Nat) (accumulated : Nat) :
    foldStepValue step (Term.pair (encode (first :: rest)) accumulated) =
      Term.pair (encode rest) (PRCode.eval₂ step accumulated first) := by
  simp [foldStepValue, Term.unpair_pair]

theorem iterate_fold_nil (step : PRCode 2) (accumulated fuel : Nat) :
    iterateValue (foldStep step) (Term.pair 0 accumulated) fuel =
      Term.pair 0 accumulated := by
  induction fuel with
  | zero => rfl
  | succ fuel ih => simp [iterateValue, ih]

theorem iterate_fold_of_length_le (step : PRCode 2) (values : List Nat)
    (accumulated fuel : Nat) (enough : values.length ≤ fuel) :
    iterateValue (foldStep step) (Term.pair (encode values) accumulated) fuel =
      Term.pair 0 (values.foldl (PRCode.eval₂ step) accumulated) := by
  induction values generalizing accumulated fuel with
  | nil => exact iterate_fold_nil step accumulated fuel
  | cons first rest ih =>
      cases fuel with
      | zero => cases enough
      | succ fuel =>
          rw [iterateValue_succ_front, eval_foldStep, foldStepValue_cons]
          exact ih _ fuel (Nat.le_of_succ_le_succ enough)

theorem eval_fold_encode (step : PRCode 2) (values : List Nat)
    (accumulated : Nat) :
    PRCode.eval₂ (fold step) (encode values) accumulated =
      values.foldl (PRCode.eval₂ step) accumulated := by
  rw [fold, eval₂_composeUnary, eval₂_composeBinary,
    eval₂_cantorPair_eq_termPair, eval₂_projection_zero, eval_iterate,
    iterate_fold_of_length_le step values accumulated (encode values)
      (length_le_encode values), eval₁_cantorRight_eq_unpair_snd, Term.unpair_pair]

theorem eval_fold (step : PRCode 2) (number accumulated : Nat) :
    PRCode.eval₂ (fold step) number accumulated =
      (decode number).foldl (PRCode.eval₂ step) accumulated := by
  have correct := eval_fold_encode step (decode number) accumulated
  rw [encode_decode] at correct
  exact correct

def lengthStep : PRCode 2 := PRCode.composeUnary .successor (.projection 0)

def length : PRCode 1 :=
  PRCode.composeBinary (fold lengthStep) PRCode.identity (PRCode.constant 1 0)

@[simp] theorem eval_lengthStep (accumulated element : Nat) :
    PRCode.eval₂ lengthStep accumulated element = accumulated + 1 := rfl

theorem fold_length (values : List Nat) (initial : Nat) :
    values.foldl (PRCode.eval₂ lengthStep) initial = initial + values.length := by
  induction values generalizing initial with
  | nil => simp
  | cons first rest ih => simp [List.foldl_cons, ih, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm]

theorem eval_length (number : Nat) :
    PRCode.eval₁ length number = (decode number).length := by
  simp [length, eval_fold, fold_length]

/-- A fold transition which prepends the next element. -/
def reverseStep : PRCode 2 := PRCode.swap cons

def reverse : PRCode 1 :=
  PRCode.composeBinary (fold reverseStep) PRCode.identity (PRCode.constant 1 0)

@[simp] theorem eval_reverseStep (accumulated element : Nat) :
    PRCode.eval₂ reverseStep accumulated element = Term.pair element accumulated + 1 := by
  rw [reverseStep, PRCode.eval₂_swap, eval_cons]

theorem fold_reverse (values accumulated : List Nat) :
    values.foldl (PRCode.eval₂ reverseStep) (encode accumulated) =
      encode (values.reverse ++ accumulated) := by
  induction values generalizing accumulated with
  | nil => simp
  | cons first rest ih =>
      rw [List.foldl_cons, eval_reverseStep]
      change rest.foldl (PRCode.eval₂ reverseStep)
        (encode (first :: accumulated)) = _
      rw [ih]
      simp

theorem eval_reverse (number : Nat) :
    PRCode.eval₁ reverse number = encode (decode number).reverse := by
  rw [reverse, eval₁_composeBinary, PRCode.eval_identity, eval₁_constant]
  rw [eval_fold]
  exact (fold_reverse (decode number) []).trans (by simp)

/-- Reverse the first list, then prepend its cells to the second list. -/
def append : PRCode 2 :=
  PRCode.composeBinary (fold reverseStep)
    (PRCode.composeUnary reverse (.projection 0)) (.projection 1)

theorem eval_append (first second : Nat) :
    PRCode.eval₂ append first second = encode (decode first ++ decode second) := by
  rw [append, eval₂_composeBinary, eval₂_composeUnary, eval₂_projection_zero,
    eval₂_projection_one, eval_reverse, eval_fold_encode]
  have correct := fold_reverse (decode first).reverse (decode second)
  rw [encode_decode, List.reverse_reverse] at correct
  exact correct

/-- Map a closed unary code and prepend its result to the accumulator. -/
def mapStep (element : PRCode 1) : PRCode 2 :=
  PRCode.composeBinary cons (PRCode.composeUnary element (.projection 1)) (.projection 0)

def mapReverse (element : PRCode 1) : PRCode 1 :=
  PRCode.composeBinary (fold (mapStep element)) PRCode.identity (PRCode.constant 1 0)

def map (element : PRCode 1) : PRCode 1 := PRCode.composeUnary reverse (mapReverse element)

@[simp] theorem eval_mapStep (element : PRCode 1) (accumulated value : Nat) :
    PRCode.eval₂ (mapStep element) accumulated value =
      Term.pair (PRCode.eval₁ element value) accumulated + 1 := by
  simp [mapStep]

theorem fold_mapReverse (element : PRCode 1) (values accumulated : List Nat) :
    values.foldl (PRCode.eval₂ (mapStep element)) (encode accumulated) =
      encode ((values.map (PRCode.eval₁ element)).reverse ++ accumulated) := by
  induction values generalizing accumulated with
  | nil => simp
  | cons first rest ih =>
      rw [List.foldl_cons, eval_mapStep]
      change rest.foldl (PRCode.eval₂ (mapStep element))
        (encode (PRCode.eval₁ element first :: accumulated)) = _
      rw [ih]
      simp

theorem eval_mapReverse (element : PRCode 1) (number : Nat) :
    PRCode.eval₁ (mapReverse element) number =
      encode (((decode number).map (PRCode.eval₁ element)).reverse) := by
  rw [mapReverse, eval₁_composeBinary, PRCode.eval_identity, eval₁_constant, eval_fold]
  exact (fold_mapReverse element (decode number) []).trans (by simp)

theorem eval_map (element : PRCode 1) (number : Nat) :
    PRCode.eval₁ (map element) number =
      encode ((decode number).map (PRCode.eval₁ element)) := by
  rw [map, eval₁_composeUnary, eval_mapReverse, eval_reverse, decode_encode,
    List.reverse_reverse]

theorem eval_head_encode (values : List Nat) :
    PRCode.eval₁ head (encode values) = values.headD 0 := by
  cases values with
  | nil => rfl
  | cons first rest =>
      rw [eval_head, encode_cons, Nat.add_sub_cancel, Term.unpair_pair]
      rfl

theorem eval_tail_encode (values : List Nat) :
    PRCode.eval₁ tail (encode values) = encode values.tail := by
  cases values with
  | nil => rfl
  | cons first rest =>
      rw [eval_tail, encode_cons, Nat.add_sub_cancel, Term.unpair_pair]
      rfl

theorem iterate_tail_encode (values : List Nat) (fuel : Nat) :
    iterateValue tail (encode values) fuel = encode (values.drop fuel) := by
  induction fuel generalizing values with
  | zero => rfl
  | succ fuel ih =>
      rw [iterateValue_succ_front, eval_tail_encode, ih]
      cases values <;> simp

/-- Delete a bounded number of initial cells. -/
def drop : PRCode 2 := iterate tail

theorem eval_drop (number count : Nat) :
    PRCode.eval₂ drop number count = encode ((decode number).drop count) := by
  rw [drop, eval_iterate]
  have correct := iterate_tail_encode (decode number) count
  rw [encode_decode] at correct
  exact correct

/-- Indexed lookup with zero returned beyond the end of the list. -/
def lookup : PRCode 2 := PRCode.composeUnary head drop

theorem eval_lookup (number index : Nat) :
    PRCode.eval₂ lookup number index = (decode number).getD index 0 := by
  rw [lookup, eval₂_composeUnary, eval_drop, eval_head_encode]
  generalize decode number = values
  induction index generalizing values with
  | zero => cases values <;> rfl
  | succ index ih =>
      cases values with
      | nil => rfl
      | cons first rest => exact ih rest

/-- Repeat the first value the number of times given by the second argument. -/
def replicate : PRCode 2 :=
  .recursion (.zero 1)
    (PRCode.composeBinary cons (.projection 0) (.projection 2))

theorem eval_replicate (value count : Nat) :
    PRCode.eval₂ replicate value count = encode (List.replicate count value) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      change PRCode.eval₂ cons value (PRCode.eval₂ replicate value count) = _
      rw [eval_cons, ih]
      rfl

def rangeReverse : PRCode 1 := .recursion (.zero 0) cons

theorem eval_rangeReverse (count : Nat) :
    PRCode.eval₁ rangeReverse count = encode (List.range count).reverse := by
  induction count with
  | zero => rfl
  | succ count ih =>
      change PRCode.eval₂ cons count (PRCode.eval₁ rangeReverse count) = _
      rw [eval_cons, ih]
      simp [List.range_succ]

/-- The coded list `[0, ..., count - 1]`. -/
def range : PRCode 1 := PRCode.composeUnary reverse rangeReverse

theorem eval_range (count : Nat) :
    PRCode.eval₁ range count = encode (List.range count) := by
  rw [range, eval₁_composeUnary, eval_rangeReverse, eval_reverse,
    decode_encode, List.reverse_reverse]

/-- Apply one closed code to every index below the input bound. -/
def tabulate (entry : PRCode 1) : PRCode 1 := PRCode.composeUnary (map entry) range

theorem eval_tabulate (entry : PRCode 1) (count : Nat) :
    PRCode.eval₁ (tabulate entry) count =
      encode ((List.range count).map (PRCode.eval₁ entry)) := by
  rw [tabulate, eval₁_composeUnary, eval_range, eval_map, decode_encode]

def flatMapStep (element : PRCode 1) : PRCode 2 :=
  PRCode.composeBinary append (.projection 0)
    (PRCode.composeUnary element (.projection 1))

/-- Concatenate the coded lists returned by a closed unary program. -/
def flatMap (element : PRCode 1) : PRCode 1 :=
  PRCode.composeBinary (fold (flatMapStep element)) PRCode.identity (PRCode.constant 1 0)

theorem eval_flatMapStep (element : PRCode 1) (accumulated value : Nat) :
    PRCode.eval₂ (flatMapStep element) accumulated value =
      encode (decode accumulated ++ decode (PRCode.eval₁ element value)) := by
  rw [flatMapStep, eval₂_composeBinary, eval₂_projection_zero,
    eval₂_composeUnary, eval₂_projection_one, eval_append]

theorem fold_flatMap (element : PRCode 1) (values accumulated : List Nat) :
    values.foldl (PRCode.eval₂ (flatMapStep element)) (encode accumulated) =
      encode (accumulated ++ values.flatMap (fun value => decode (PRCode.eval₁ element value))) := by
  induction values generalizing accumulated with
  | nil => simp
  | cons first rest ih =>
      rw [List.foldl_cons, eval_flatMapStep, decode_encode, ih]
      simp [List.append_assoc]

theorem eval_flatMap (element : PRCode 1) (number : Nat) :
    PRCode.eval₁ (flatMap element) number =
      encode ((decode number).flatMap (fun value => decode (PRCode.eval₁ element value))) := by
  rw [flatMap, eval₁_composeBinary, PRCode.eval_identity, eval₁_constant, eval_fold]
  exact (fold_flatMap element (decode number) []).trans (by simp)

/-- Carry an unchanged parameter alongside the changing fold accumulator. -/
def parameterStep (step : PRCode 3) : PRCode 2 :=
  let parameter := PRCode.composeUnary PRCode.cantorLeft (.projection 0)
  let accumulated := PRCode.composeUnary PRCode.cantorRight (.projection 0)
  PRCode.composeBinary PRCode.cantorPair parameter
    (PRCode.composeTernary step parameter accumulated (.projection 1))

theorem eval_parameterStep (step : PRCode 3) (parameter accumulated value : Nat) :
    PRCode.eval₂ (parameterStep step) (Term.pair parameter accumulated) value =
      Term.pair parameter (PRCode.eval step [parameter, accumulated, value]) := by
  simp only [parameterStep, eval₂_composeBinary, eval₂_composeUnary,
    eval₂_composeTernary, eval₂_projection_zero, eval₂_projection_one,
    eval₁_cantorLeft_eq_unpair_fst, eval₁_cantorRight_eq_unpair_snd,
    Term.unpair_pair, eval₂_cantorPair_eq_termPair]

theorem fold_parameter (step : PRCode 3) (values : List Nat)
    (parameter accumulated : Nat) :
    values.foldl (PRCode.eval₂ (parameterStep step)) (Term.pair parameter accumulated) =
      Term.pair parameter
        (values.foldl (fun previous value => PRCode.eval step [parameter, previous, value]) accumulated) := by
  induction values generalizing accumulated with
  | nil => rfl
  | cons first rest ih =>
      rw [List.foldl_cons, eval_parameterStep, ih]
      rfl

/-- Fold a list code with one fixed parameter and a supplied accumulator. -/
def foldWithParameter (step : PRCode 3) : PRCode 3 :=
  PRCode.composeUnary PRCode.cantorRight
    (PRCode.composeBinary (fold (parameterStep step)) (.projection 0)
      (PRCode.composeBinary PRCode.cantorPair (.projection 1) (.projection 2)))

theorem eval_foldWithParameter (step : PRCode 3) (number parameter accumulated : Nat) :
    PRCode.eval (foldWithParameter step) [number, parameter, accumulated] =
      (decode number).foldl
        (fun previous value => PRCode.eval step [parameter, previous, value]) accumulated := by
  unfold foldWithParameter
  rw [PRCode.eval_composeUnary, PRCode.eval_composeBinary]
  change PRCode.eval₁ PRCode.cantorRight
    (PRCode.eval₂ (fold (parameterStep step)) number
      (PRCode.eval (PRCode.composeBinary PRCode.cantorPair (.projection 1) (.projection 2))
        [number, parameter, accumulated])) = _
  rw [PRCode.eval_composeBinary]
  change PRCode.eval₁ PRCode.cantorRight
    (PRCode.eval₂ (fold (parameterStep step)) number
      (PRCode.eval₂ PRCode.cantorPair parameter accumulated)) = _
  rw [eval₂_cantorPair_eq_termPair, eval_fold, fold_parameter,
    eval₁_cantorRight_eq_unpair_snd, Term.unpair_pair]

def mapParameterStep (entry : PRCode 2) : PRCode 3 :=
  PRCode.composeBinary cons
    (PRCode.composeBinary entry (.projection 0) (.projection 2)) (.projection 1)

theorem eval_mapParameterStep (entry : PRCode 2) (parameter accumulated value : Nat) :
    PRCode.eval (mapParameterStep entry) [parameter, accumulated, value] =
      Term.pair (PRCode.eval₂ entry parameter value) accumulated + 1 := by
  unfold mapParameterStep
  rw [PRCode.eval_composeBinary, PRCode.eval_composeBinary]
  exact eval_cons (PRCode.eval₂ entry parameter value) accumulated

/-- Map a closed binary program with a fixed first argument over a coded list. -/
def mapWithParameter (entry : PRCode 2) : PRCode 2 :=
  PRCode.composeUnary reverse
    (PRCode.composeTernary (foldWithParameter (mapParameterStep entry))
      (.projection 1) (.projection 0) (PRCode.constant 2 0))

theorem fold_mapParameter (entry : PRCode 2) (values accumulated : List Nat)
    (parameter : Nat) :
    values.foldl
        (fun previous value => PRCode.eval (mapParameterStep entry) [parameter, previous, value])
        (encode accumulated) =
      encode ((values.map (PRCode.eval₂ entry parameter)).reverse ++ accumulated) := by
  induction values generalizing accumulated with
  | nil => simp
  | cons first rest ih =>
      rw [List.foldl_cons, eval_mapParameterStep]
      change rest.foldl
        (fun previous value => PRCode.eval (mapParameterStep entry) [parameter, previous, value])
        (encode (PRCode.eval₂ entry parameter first :: accumulated)) = _
      rw [ih]
      simp

theorem eval_mapWithParameter (entry : PRCode 2) (parameter number : Nat) :
    PRCode.eval₂ (mapWithParameter entry) parameter number =
      encode ((decode number).map (PRCode.eval₂ entry parameter)) := by
  rw [mapWithParameter, eval₂_composeUnary, eval₂_composeTernary,
    eval₂_projection_one, eval₂_projection_zero, eval₂_constant, eval_foldWithParameter]
  have correct := fold_mapParameter entry (decode number) [] parameter
  simp only [encode_nil, List.append_nil] at correct
  rw [correct, eval_reverse, decode_encode, List.reverse_reverse]

def tabulateWithParameter (entry : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary (mapWithParameter entry) (.projection 0)
    (PRCode.composeUnary range (.projection 1))

theorem eval_tabulateWithParameter (entry : PRCode 2) (parameter count : Nat) :
    PRCode.eval₂ (tabulateWithParameter entry) parameter count =
      encode ((List.range count).map (PRCode.eval₂ entry parameter)) := by
  rw [tabulateWithParameter, eval₂_composeBinary, eval₂_projection_zero,
    eval₂_composeUnary, eval₂_projection_one, eval_range, eval_mapWithParameter, decode_encode]

end Program

theorem length_primitiveRecursive : PrimitiveRecursive (fun number => (decode number).length) :=
  ⟨Program.length, Program.eval_length⟩

theorem reverse_primitiveRecursive :
    PrimitiveRecursive (fun number => encode (decode number).reverse) :=
  ⟨Program.reverse, Program.eval_reverse⟩

theorem append_primitiveRecursive :
    PrimitiveRecursive₂ (fun first second => encode (decode first ++ decode second)) :=
  ⟨Program.append, Program.eval_append⟩

theorem map_primitiveRecursive {element : Nat → Nat}
    (certificate : PrimitiveRecursive element) :
    PrimitiveRecursive (fun number => encode ((decode number).map element)) := by
  rcases certificate with ⟨program, correct⟩
  refine ⟨Program.map program, ?_⟩
  intro number
  rw [Program.eval_map]
  apply congrArg encode
  induction decode number with
  | nil => rfl
  | cons value rest ih => simp only [List.map_cons, correct, ih]

theorem drop_primitiveRecursive :
    PrimitiveRecursive₂ (fun number count => encode ((decode number).drop count)) :=
  ⟨Program.drop, Program.eval_drop⟩

theorem lookup_primitiveRecursive :
    PrimitiveRecursive₂ (fun number index => (decode number).getD index 0) :=
  ⟨Program.lookup, Program.eval_lookup⟩

theorem replicate_primitiveRecursive :
    PrimitiveRecursive₂ (fun value count => encode (List.replicate count value)) :=
  ⟨Program.replicate, Program.eval_replicate⟩

theorem range_primitiveRecursive :
    PrimitiveRecursive (fun count => encode (List.range count)) :=
  ⟨Program.range, Program.eval_range⟩

theorem tabulate_primitiveRecursive {entry : Nat → Nat}
    (certificate : PrimitiveRecursive entry) :
    PrimitiveRecursive (fun count => encode ((List.range count).map entry)) := by
  rcases certificate with ⟨program, correct⟩
  refine ⟨Program.tabulate program, ?_⟩
  intro count
  rw [Program.eval_tabulate]
  apply congrArg encode
  induction List.range count with
  | nil => rfl
  | cons value rest ih => simp only [List.map_cons, correct, ih]

theorem flatMap_primitiveRecursive {element : Nat → Nat}
    (certificate : PrimitiveRecursive element) :
    PrimitiveRecursive (fun number => encode ((decode number).flatMap (fun value => decode (element value)))) := by
  rcases certificate with ⟨program, correct⟩
  refine ⟨Program.flatMap program, ?_⟩
  intro number
  rw [Program.eval_flatMap]
  apply congrArg encode
  induction decode number with
  | nil => rfl
  | cons value rest ih =>
      exact
        (congrArg
          (fun front => front ++ rest.flatMap (fun item => decode (PRCode.eval₁ program item)))
          (congrArg decode (correct value))).trans
        (congrArg (fun tail => decode (element value) ++ tail) ih)

end PureSFormal.Computation.PrimitiveRecursiveListCode
