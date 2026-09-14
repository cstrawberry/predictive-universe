import PureSFormal.Research.ProtectedTriePrefixBuild

/-!
# Constructive confluence and protected-trie cofinality

This Research module proves Church--Rosser confluence for contextual pure-`S`
reduction without importing an external rewriting theorem.  The proof uses the
standard complete-development argument for a parallel reduction relation:

* every contextual `Step` is one parallel step;
* every parallel step is a finite `Steps` reduction;
* every parallel reduct of a term reduces in parallel to that term's complete
  development; and
* the resulting parallel diamond lifts constructively to `Steps` confluence.

The final theorems combine confluence with the concrete frozen encoder and the
canonical finite protected-trie build.  From every reduct of the encoder and
every requested finite structural prefix tree there is a common descendant
containing both the reduct's already opened paths and every requested path.
-/

namespace PureSFormal.Research.ProtectedTrieConfluence

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTriePrefixBuild

/-! ## Parallel pure-S reduction -/

/--
One parallel pure-`S` reduction.  `app` reduces both application children in
parallel without contracting the root; `contract` also contracts a root redex
after reducing its three arguments in parallel.
-/
inductive Parallel : Term -> Term -> Prop where
  | s : Parallel .s .s
  | app {fn fn' arg arg' : Term} :
      Parallel fn fn' -> Parallel arg arg' ->
      Parallel (.app fn arg) (.app fn' arg')
  | contract {x x' y y' z z' : Term} :
      Parallel x x' -> Parallel y y' -> Parallel z z' ->
      Parallel (Term.redex x y z) (Term.contractum x' y' z')

namespace Parallel

/-- Parallel reduction is reflexive. -/
theorem refl (term : Term) : Parallel term term := by
  induction term with
  | s => exact .s
  | app fn arg ihFn ihArg => exact .app ihFn ihArg

/-- Parallel reduction is stable under an arbitrary one-hole context. -/
theorem inContext {source target : Term} (h : Parallel source target)
    (ctx : Context) : Parallel (ctx.plug source) (ctx.plug target) := by
  induction ctx with
  | hole => exact h
  | appLeft ctx right ih => exact .app ih (refl right)
  | appRight left ctx ih => exact .app (refl left) ih

/-- Every contextual one-step contraction is one parallel step. -/
theorem ofStep {source target : Term} (h : Step source target) :
    Parallel source target := by
  rcases h with ⟨ctx, x, y, z, hsource, htarget⟩
  rw [hsource, htarget]
  exact inContext (.contract (refl x) (refl y) (refl z)) ctx

/-- Lift a finite reduction through the left child of an application. -/
private theorem stepsAppLeft {source target : Term} (h : Steps source target)
    (arg : Term) : Steps (.app source arg) (.app target arg) := by
  simpa only [Context.plug] using h.inContext (.appLeft .hole arg)

/-- Lift a finite reduction through the right child of an application. -/
private theorem stepsAppRight (fn : Term) {source target : Term}
    (h : Steps source target) : Steps (.app fn source) (.app fn target) := by
  simpa only [Context.plug] using h.inContext (.appRight fn .hole)

/-- Every parallel step is an ordinary finite contextual reduction. -/
theorem toSteps {source target : Term} (h : Parallel source target) :
    Steps source target := by
  induction h with
  | s => exact .refl _
  | app hFn hArg ihFn ihArg =>
      exact Steps.trans (stepsAppLeft ihFn _) (stepsAppRight _ ihArg)
  | @contract x x' y y' z z' hx hy hz ihx ihy ihz =>
      have hxLift :
          Steps (Term.redex x y z) (Term.redex x' y z) := by
        simpa only [Term.redex, Context.plug] using
          ihx.inContext
            (.appLeft (.appLeft (.appRight (.s : Term) .hole) y) z)
      have hyLift :
          Steps (Term.redex x' y z) (Term.redex x' y' z) := by
        simpa only [Term.redex, Context.plug] using
          ihy.inContext
            (.appLeft (.appRight (.app .s x') .hole) z)
      have hzLift :
          Steps (Term.redex x' y' z) (Term.redex x' y' z') := by
        simpa only [Term.redex, Context.plug] using
          ihz.inContext (.appRight (.app (.app .s x') y') .hole)
      exact Steps.trans (Steps.trans (Steps.trans hxLift hyLift) hzLift)
        (Steps.single (Step.root x' y' z'))

/-! ## Complete developments -/

/-- Contract every root redex while recursively developing all arguments. -/
def develop : Term -> Term
  | .s => .s
  | .app (.app (.app .s x) y) z =>
      Term.contractum (develop x) (develop y) (develop z)
  | .app fn arg => .app (develop fn) (develop arg)

@[simp]
theorem develop_s : develop .s = .s :=
  rfl

@[simp]
theorem develop_redex (x y z : Term) :
    develop (Term.redex x y z) =
      Term.contractum (develop x) (develop y) (develop z) :=
  rfl

/-- Parallel reduction from a two-argument `S` spine preserves that spine. -/
theorem twoSpine_source {x y target : Term}
    (h : Parallel (.app (.app .s x) y) target) :
    exists x' y',
      target = .app (.app .s x') y' /\
      Parallel x x' /\ Parallel y y' := by
  cases h with
  | app hFn hY =>
      cases hFn with
      | app hS hX =>
          cases hS
          exact ⟨_, _, rfl, hX, hY⟩

/--
Every parallel reduct reaches the complete development of its source in one
further parallel step.
-/
theorem to_develop {source target : Term} (h : Parallel source target) :
    Parallel target (develop source) := by
  induction h with
  | s => exact .s
  | @app fn fn' arg arg' hFn hArg ihFn ihArg =>
      cases fn with
      | s =>
          exact .app ihFn ihArg
      | app fnHead fnLast =>
          cases fnHead with
          | s =>
              exact .app ihFn ihArg
          | app fnHeadHead x =>
              cases fnHeadHead with
              | app deeper left =>
                  exact .app ihFn ihArg
              | s =>
                  obtain ⟨x', y', hfn', hx, hy⟩ := twoSpine_source hFn
                  subst fn'
                  have hSpineDevelop :
                      Parallel (.app (.app .s x') y')
                        (.app (.app .s (develop x)) (develop fnLast)) := by
                    simpa only [develop] using ihFn
                  obtain ⟨xd, yd, htarget, hxd, hyd⟩ :=
                    twoSpine_source hSpineDevelop
                  injection htarget with hleft hyEq
                  injection hleft with hsEq hxEq
                  subst xd
                  subst yd
                  exact .contract hxd hyd ihArg
  | contract hx hy hz ihx ihy ihz =>
      exact .app (.app ihx ihz) (.app ihy ihz)

/-- Parallel reduction has the diamond property. -/
theorem diamond {source left right : Term}
    (hleft : Parallel source left) (hright : Parallel source right) :
    exists join, Parallel left join /\ Parallel right join := by
  exact ⟨develop source, hleft.to_develop, hright.to_develop⟩

end Parallel

/-! ## Constructive Church--Rosser theorem -/

/-- Commute one parallel step across an arbitrary finite reduction. -/
theorem parallel_steps_join {source left right : Term}
    (hleft : Parallel source left) (hright : Steps source right) :
    exists join, Steps left join /\ Parallel right join := by
  induction hright with
  | refl => exact ⟨left, Steps.refl left, hleft⟩
  | tail hprefix hlast ih =>
      obtain ⟨firstJoin, hleftFirst, hmiddleFirst⟩ := ih
      obtain ⟨join, hfirstJoin, hrightJoin⟩ :=
        Parallel.diamond hmiddleFirst (Parallel.ofStep hlast)
      exact ⟨join,
        Steps.trans hleftFirst hfirstJoin.toSteps,
        hrightJoin⟩

/-- Contextual pure-`S` reduction is confluent. -/
theorem steps_confluent {source left right : Term}
    (hleft : Steps source left) (hright : Steps source right) :
    exists join, Steps left join /\ Steps right join := by
  induction hleft with
  | refl => exact ⟨right, hright, Steps.refl right⟩
  | tail hprefix hlast ih =>
      obtain ⟨firstJoin, hmiddleJoin, hrightJoin⟩ := ih
      obtain ⟨join, hleftJoin, hfirstJoin⟩ :=
        parallel_steps_join (Parallel.ofStep hlast) hmiddleJoin
      exact ⟨join, hleftJoin,
        Steps.trans hrightJoin hfirstJoin.toSteps⟩

/-! ## Concrete protected-trie cofinality -/

/-- Finite reduction below a normal header monotonically preserves its list of paths. -/
theorem anchoredOpenedPaths_steps_mono
    {seed body target : Term} (hseed : StepNormal seed)
    (hsteps : Steps (header seed body) target) :
    forall path,
      List.Mem path (anchoredOpenedPaths (header seed body)) ->
      List.Mem path (anchoredOpenedPaths target) := by
  intro path hmem
  have hopen : anchoredOpenedAt? (header seed body) path = true :=
    (mem_anchoredOpenedPaths_iff_anchoredOpenedAt?
      (header seed body) path).mp hmem
  have htarget : anchoredOpenedAt? target path = true :=
    anchoredOpenedAt?_steps_mono hseed hopen hsteps
  exact (mem_anchoredOpenedPaths_iff_anchoredOpenedAt? target path).mpr htarget

/--
Every reduct of the concrete encoder joins every canonical finite structural
prefix-tree target.
-/
theorem encoder_reduct_joins_seededBuild
    {bits : List Bool} {reduct : Term} (tree : PrefixTree)
    (hreduct : Steps (encoder bits) reduct) :
    exists join,
      Steps reduct join /\ Steps (seededBuild bits tree) join := by
  exact steps_confluent hreduct (encoder_steps_seededBuild bits tree)

/--
Cofinality with exact path inclusion: the common descendant contains every
path already visible in the arbitrary reduct and every path requested by the
finite canonical tree.
-/
theorem encoder_reduct_cofinal_tree
    {bits : List Bool} {reduct : Term} (tree : PrefixTree)
    (hreduct : Steps (encoder bits) reduct) :
    exists join,
      Steps reduct join /\
      Steps (seededBuild bits tree) join /\
      (forall path,
        List.Mem path (anchoredOpenedPaths reduct) ->
        List.Mem path (anchoredOpenedPaths join)) /\
      (forall path,
        List.Mem path tree.paths ->
        List.Mem path (anchoredOpenedPaths join)) := by
  obtain ⟨join, hreductJoin, hbuildJoin⟩ :=
    encoder_reduct_joins_seededBuild tree hreduct
  obtain ⟨reductBody, _hbody, hreductEq⟩ :=
    encoder_steps_preserves hreduct
  have hreductMono : forall path,
      List.Mem path (anchoredOpenedPaths reduct) ->
      List.Mem path (anchoredOpenedPaths join) := by
    rw [hreductEq] at hreductJoin ⊢
    exact anchoredOpenedPaths_steps_mono (N_stepNormal bits) hreductJoin
  have hbuildMono : forall path,
      List.Mem path (anchoredOpenedPaths (seededBuild bits tree)) ->
      List.Mem path (anchoredOpenedPaths join) := by
    unfold seededBuild seededHeader at hbuildJoin ⊢
    exact anchoredOpenedPaths_steps_mono (N_stepNormal bits) hbuildJoin
  refine ⟨join, hreductJoin, hbuildJoin, hreductMono, ?_⟩
  intro path hpath
  apply hbuildMono
  rw [anchoredOpenedPaths_seededBuild]
  exact hpath

/-- Every reduct joins the canonical realization of a finite prefix set. -/
theorem encoder_reduct_joins_seededPrefixBuild
    {bits : List Bool} {reduct : Term} (set : FinitePrefixSet)
    (hreduct : Steps (encoder bits) reduct) :
    exists join,
      Steps reduct join /\ Steps (seededPrefixBuild bits set) join := by
  simpa only [seededPrefixBuild] using
    encoder_reduct_joins_seededBuild (treeOfPrefixSet set) hreduct

/--
Finite-prefix-set cofinality.  The common descendant contains both every path
already exposed by the arbitrary reduct and the complete prefix closure
represented by `set`.
-/
theorem encoder_reduct_cofinal_prefixSet
    {bits : List Bool} {reduct : Term} (set : FinitePrefixSet)
    (hreduct : Steps (encoder bits) reduct) :
    exists join,
      Steps reduct join /\
      Steps (seededPrefixBuild bits set) join /\
      (forall path,
        List.Mem path (anchoredOpenedPaths reduct) ->
        List.Mem path (anchoredOpenedPaths join)) /\
      (forall path, set.Contains path ->
        List.Mem path (anchoredOpenedPaths join)) := by
  obtain ⟨join, hreductJoin, hbuildJoin, hreductMono, htreeMono⟩ :=
    encoder_reduct_cofinal_tree (treeOfPrefixSet set) hreduct
  refine ⟨join, hreductJoin, ?_, hreductMono, ?_⟩
  · simpa only [seededPrefixBuild] using hbuildJoin
  · intro path hcontains
    apply htreeMono
    rw [treeOfPrefixSet, mem_paths_treeOfGenerators_iff]
    exact hcontains

end PureSFormal.Research.ProtectedTrieConfluence
