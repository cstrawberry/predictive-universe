# Appendix P: Philosophical Foundations

## P.1 Introduction: Grounding the Predictive Universe

This appendix articulates the philosophical bedrock of the Predictive Universe (PU) framework, making explicit why its foundational layer is built from process rather than from an assumed material substrate. The central bridge is methodological and status-disciplined:
$$
\text{Cogito}
\xrightarrow{\text{operational modeling}}
\text{minimal predictive process}
\xrightarrow{\text{PPI/PCE finite physicalization}}
\text{minimal threshold carrier}
\xrightarrow{\text{Definition 23}}
\text{MPU}.
$$
The Cogito supplies the process-root: there exists awareness/process $\mathcal{C}$, and this cannot be coherently denied because denial already enacts it. The remaining steps are operational and model-theoretic rather than additional Cogito-level certainties. PU first distills the indubitable process into its minimal knowledge-bearing operation—prediction, verification, and update—and then uses PPI and PCE to ask how that operation can be finitely, physically, and efficiently instantiated.

We begin by establishing the primacy of consciousness, using Descartes' Cogito as the irrefutable starting point. We then argue that the "thinking" essence of this conscious awareness is fundamentally predictive. This predictive core necessitates certain logical and informational structures, forming the basis for computation and the very possibility of knowledge.

Building upon this, we explore how idealism, particularly when understood through the lens of the Distinction Framework (where consciousness is the ultimate distinction-maker structuring reality), offers a parsimonious resolution to the hard problem of consciousness [Chalmers 1996]. To model such a reality naturalistically, without recourse to materialism or supernaturalism, we propose that the Simulation Hypothesis be reframed not as a probabilistic claim about our origins, but as a modeling framework for an informational, process-based reality operating under finite resource constraints. This leads to the concept of Authentic Simulations defined by inherent boundaries against perfect prediction and external control.

From these foundations—consciousness as primary, knowledge as predictive, and reality modeled as a finite information process—we derive the finite operational constraints proved in this appendix. Time order, causal propagation, carrier structure, and spacetime geometry follow only on their separately registered reconstruction, locality, continuum, and response certificates.

Finally, we introduce the Principle of Physical Instantiation (PPI). This principle serves as a capstone, explaining how abstract logical and mathematical structures, including those necessary for prediction, become physically manifest. The PPI posits that these structures, when instantiated by systems with finite resources operating in finite time, are necessarily shaped by irreducible thermodynamic costs and resource-optimization imperatives (such as the PU's Principle of Compression Efficiency, PCE). Within each declared admissible class and complete response/cost ledger, this selects least-surplus physical embodiments; identifying those branchwise minimizers with particular physical laws additionally requires the realization and calibration certificates cited at each theorem. This appendix, therefore, aims to provide the philosophical justification for the PU framework, showing why MPUs are placed at the bottom of the physical model: they are the least-surplus finite physicalization of the only process-root whose existence the framework treats as indubitable.

**Executive summary: explicit commitments and epistemic status.** Any foundational physical theory relies on commitments about (i) what exists and (ii) what counts as evidence. In practice, many matter-first foundations treat the external physical degrees of freedom and the mathematical formalism as primitives, while leaving the status of consciousness implicit or deferred. The PU framework makes these commitments explicit and then minimizes them by deriving as much as possible from the Cogito—the sole indubitable certainty [Descartes 1641]—together with the operational necessities of prediction under finite resources.

The comparison below concerns starting points and explanatory completeness, not the empirical successes of standard physical models.

| Question | Common matter-first starting point | PU framework starting point |
|:--|:--|:--|
| What is certain? | External degrees of freedom are posited; observation is modeled operationally. | Conscious awareness is certain (Cogito) and is used as the epistemic foundation (Section P.2). |
| Status of consciousness | Treated as emergent or bracketed as outside fundamental physics (hard problem) [Chalmers 1996]. | Foundational; no emergence gap by construction (Sections P.2–P.3). |
| Why these laws? | Dynamical laws and symmetry principles are typically postulated, then tested and refined. | Physical law is derived as PCE-selected optimal instantiation of predictive structure under PPI (Sections P.6–P.8). |
| Why is mathematics effective? | Treated as a striking fact (Wigner) [Wigner 1960]. | Mathematics and physics arise from the same predictive constraints, with physics as thermodynamic instantiation (Section P.7). |

Within PU, the epistemic status of the core commitments is stratified:

- **Certainty (epistemic):** the existence of conscious awareness (Cogito) [Descartes 1641].
- **Operational necessity:** the predictive cycle as the minimal structure supporting verification, learning, and knowledge (Sections P.3–P.4).
- **Logical theorems:** impossibility results for perfect self-prediction (SPAP, Theorem 10) and bounded self-decision (RUD, Theorem A.2.3).
- **Empirical anchor:** Landauer's principle relating logical irreversibility to physical dissipation [Landauer 1961; Bennett 1982], yielding the strict floor $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$ (Theorem 31; Appendix J).
- **Framework selection:** PPI (Definition P.6.2) and PCE (Definition 15) determine which physically instantiated structures are stable under finite resources, selecting saturation at the PCE-Attractor where applicable.

A compact statement of the bridge and forcing chain is:

1. **Cogito:** there exists $\mathcal{C}$ such that $\mathcal{C}$ is conscious awareness/process (Foundational Certainty P.2.1).
2. **Operational distillation:** $\mathcal{C}$ is modeled by state distinction, anticipation, verification, and update.
3. **Predictive loop:** $\mathcal{C} \rightsquigarrow (P_{int}\to V\to D_{cyc})$ and $\pi : \mathcal{H}_t \to \mathcal{O}_{t+1}$ (Definition 4; Definition P.3.1).
4. **Finite physicalization:** PPI admits only finite records, finite verification, finite maintenance, and finite update-use (Definition P.6.2; Theorem P.6.2c).
5. **No-surplus selection:** PCE selects least-cost representatives among operationally equivalent predictive implementations (Definition 15).
6. **Self-reference register floor:** on Theorem 15's realization class satisfying (O1)–(O3) and (FC), $N_{\mathrm{vis}}^{\min}=8$ and $K_0=3$.
7. **Conditional minimal Hilbert carrier:** if the eight (FC) contexts have mutually perfectly distinguishable Hilbert representatives, Theorem 23 gives $d_0\ge8$; equality requires Theorem Z.2's further hypothesis that every admissible candidate with $d_0>8$ admits an eight-dimensional comparator in the same optimization class with the identical registered response family and strictly lower maintained-support cost.
8. **MPU:** the resulting no-surplus finite physical representative has $C_P=C_{op}$ and is the MPU (Definition 23).
9. **SPAP and the registered binary quotient:** SPAP alone does not force a $2\to1$ merge. On the registered reachable binary verification quotient of Definition 28 and Definition J.1, Theorem J.1 gives the structural log-cardinality $\varepsilon_0=\ln2$; a physical reset bound additionally requires item 10's entropy ledger.
10. **Physical implementation cost:** on a registered reset branch, $\varepsilon_{\mathrm{phys}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R)$ with $\varepsilon_{\mathrm{diss}}\ge0$; equality with $\ln2$ needs the unbiased no-side-information saturation branch (Theorem 31).
11. **PPI/PCE active-kernel selection:** the sharp retained match/mismatch verification record gives $a\ge2$, entropy-capacity gives $\ln a \ge \varepsilon_0$, and PPI/PCE no-surplus selection gives $a=2$ (Definition P.6.2; Definition 15; Theorem Z.1).
12. **QFI interface:** $M=2ab=2\times 2\times(d_0-a)=2\times2\times6=24$ with direct SLD-QFI flatness on the active-inactive sector (Theorem Z.5).
13. **Faithful tangent-shell dimensional selection:** Definition Z.9a injects all $M=24$ retained modes into distinct cells and penalizes surplus dimensions; Theorem Z.10 gives $24\le K(D)$, $K(3)=12$ excludes lower dimensions, and the regular $24$-cell proves feasibility, so Theorem Z.11 selects the least feasible $D=4$.

In this sense, the immutable foundation is the process-root certified by the Cogito, while the MPU is the PPI/PCE-minimal physical representative of that process under the framework's finite-response rules. The Cogito alone does not assert MPUs; it fixes the non-arbitrary root that every later physicalization must preserve. The simulation framing (Section P.5) is used as a naturalistic modeling language for an informational process ontology, not as an ontological claim about an external programmer.

## P.1.1 Logical Sufficiency of the Cogito Starting Point

### The Epistemological Case for Consciousness-First Physics

The foundational question of physics is not merely which ontology is viable, but which ontology is necessary for a complete and non-arbitrary theory of reality. As established by Descartes' methodological skepticism [Descartes 1641], the existence of conscious awareness is the sole indubitable certainty—*cogito ergo sum*. We can doubt the existence of matter, fields, or external objects, but we cannot coherently doubt the existence of doubt itself, and thus of consciousness.

This epistemological primacy has profound implications for physical theory. Any foundational framework that does not begin from consciousness must either:

1. Posit matter/fields as primary and attempt to explain consciousness as emergent, or
2. Leave consciousness unexplained as outside the scope of fundamental physics

The first option faces what Chalmers [1996] termed the *hard problem of consciousness*: explaining how and why physical processes give rise to subjective experience. Despite significant progress in neuroscience mapping neural correlates of consciousness, the explanatory gap between objective physical dynamics and subjective phenomenal experience remains [Levine 1983; Nagel 1974]. As Chalmers argues, we can conceive of systems that are functionally identical to conscious beings but lack subjective experience (philosophical zombies), suggesting that consciousness involves something beyond functional organization of matter.

The second option—treating consciousness as outside physics—renders any physical theory fundamentally incomplete. A theory that cannot account for the one phenomenon we know with certainty exists fails to be a complete description of reality.

A consciousness-first ontology uniquely resolves both problems: consciousness requires no further explanation (it is the explanatory bedrock), and the theory is complete by construction (the foundation itself is the phenomenon we seek to explain). Moreover, such an approach is maximally parsimonious—it starts from what we know exists rather than positing additional ontological primitives (matter, fields) whose existence we infer rather than directly experience.

### The Historical Marginalization of Consciousness in Physics

Despite this epistemological foundation, consciousness has been systematically marginalized in modern physics. In mainstream physics, consciousness has traditionally been treated as irrelevant to fundamental theory—at best an emergent phenomenon to be explained [Searle 1992; Chalmers 1996], at worst a source of confusion to be avoided. When consciousness has been proposed as playing a fundamental role in physics, such proposals have faced substantial skepticism. Early quantum interpretations invoking consciousness in measurement [von Neumann 1932; Wigner 1961] were largely abandoned. More recent attempts to link consciousness to quantum processes [Penrose 1989; Hameroff & Penrose 1996] have encountered significant criticism from both physicists [Tegmark 2000; Koch & Hepp 2006] and neuroscientists, with critics arguing these approaches lack empirical support and violate known decoherence timescales.

Contemporary philosophical positions on consciousness—ranging from eliminativism [Dennett 1991], to emergentism [Searle 1992], to various forms of panpsychism [Strawson 2006; Goff 2017]—have generally not attempted to provide rigorous mathematical formalisms that derive known physics from consciousness as a foundation. Where panpsychist or idealist ontologies have been proposed, they typically remain at the level of metaphysical speculation rather than quantitative physical theory [Goff 2017; Kastrup 2018].

The historical trajectory of interpretations of quantum mechanics reveals this pattern clearly [Freire 2015; Becker 2018]. As Freire documents, approaches that privileged the observer's consciousness were progressively marginalized in favor of more "objective" formulations. The implicit assumption—rarely stated as a formal impossibility claim but evident in the structure of the field—has been that rigorous physics must proceed from matter, fields, or information as its ontological foundation, not from subjective experience or consciousness.

### This Framework as Existence Proof

This framework serves as an existence proof challenging that assumption and demonstrating that the epistemologically necessary foundation is also scientifically viable. Regardless of whether the specific model proposed here is empirically vindicated, the framework demonstrates that:

1. **Consciousness-first ontology can be mathematically formalized with rigor:** Through axiomatization (POP, PCE), formal definitions (MPUs, Perspectival States), and rigorous derivations (SPAP theorems, thermodynamic bounds).

2. **Such formalization can generate structures isomorphic to known physics:** The emergence of quantum mechanical formalism (Section 8), Lorentzian spacetime geometry (Section 11), Einstein's Field Equations (Section 12), and Standard Model structures (Appendices G, R).

3. **Quantitative predictions can be derived:** Calculation of $\alpha_{\mathrm{em}}$ at the PCE-Attractor with zero continuously adjustable parameters (Appendix Z), derivation of three fermion generations (Appendix R), and a branch-dependent cosmological-constant reference scaling law from Golay-Steiner structure (Appendix U), where Theorem U.8c blocks a theorem-level pure-dilatation realization of the Appendix U five-mode branch.

4. **Falsifiable experimental protocols can be formulated:** Detailed protocols with power analyses and statistical requirements for testing Consciousness Complexity effects (Section 13).

5. **Explanatory scope comparable to established foundations:** Addressing foundational puzzles from the information paradox to the arrow of time (Appendix K), with comparable breadth to matter-first or information-first approaches.

6. **The hard problem is dissolved rather than solved:** By making consciousness foundational, the framework eliminates the need to explain how consciousness emerges from non-conscious matter—the explanatory burden is inverted.

### The Fundamental Advancement

The question therefore shifts from "Can consciousness-based physics be rigorous?" to "Is this particular consciousness-first framework empirically correct?" This transition—from methodological exclusion to empirical evaluation—constitutes a fundamental advancement in two respects:

**Methodologically:** Consciousness-first ontology is now established as a viable candidate foundation for physics, to be evaluated on empirical grounds alongside matter-first and information-first approaches.

**Conceptually:** A complete theory of physics—one that accounts for both the external world and the consciousness that observes it—may require a consciousness-first foundation. Matter-first approaches will always face the hard problem; consciousness-first approaches dissolve it by construction.

The framework's philosophical arguments (developed throughout this appendix) provide the grounding for why this particular approach is not only viable but, starting from the indubitable certainty of the *Cogito* and the requirement of explanatory completeness, potentially the only truly non-arbitrary and complete foundation for understanding physical reality. If a quantifiable, rigorous theory can be developed that integrates consciousness from the outset—as this framework demonstrates—then the epistemological and explanatory advantages of the consciousness-first approach become compelling.

## P.2 The Primacy of Consciousness and the Certainty of the Cogito

### P.2.1 The Unshakeable Certainty: *Cogito Ergo Sum*

The quest for an indubitable foundation for knowledge begins with René Descartes' methodical skepticism [Descartes 1641]. As Descartes revealed through his method of radical doubt, while we can question everything else—external perceptions, memories, even logical deductions—the existence of doubt itself, and thus consciousness, is self-verifying. The doubter must exist to doubt. This gives us our first foothold: *Cogito ergo sum*—"I think, therefore I am." This self-verifying loop of awareness provides the sole, unshakeable premise from which a theory of reality can be constructed without arbitrary assumptions about a pre-existing material world.

**Foundational Certainty P.2.1 (Cogito).** There exists at least one locus of conscious awareness/process $\mathcal{C}$ whose existence is indubitable under methodological doubt. Unlike the framework's operational axioms (Axioms 1–3), this is not a postulate but a self-verifying truth: its denial presupposes the very awareness/process it denies. It concerns epistemic certainty only and introduces no ontological commitments beyond the existence of $\mathcal{C}$. In particular, it does not by itself assert matter, spacetime, a network, or MPUs; it supplies only the immutable process-root that any later physical model must preserve.

### P.2.2 The Hard Problem of Consciousness

Yet from this foundation of certainty in consciousness, we face a temptation—to posit a reality external to and independent of consciousness that we can meaningfully understand and investigate, a world from which consciousness supposedly emerges through complex interactions. This seemingly innocent idea creates a fundamental explanatory burden: the hard problem of consciousness. This refers to the challenge of explaining how and why we have qualia or subjective, phenomenal experiences. While neuroscience can map neural correlates of conscious processes, it does not explain why these physical processes should *feel like anything at all* from a first-person perspective. There is an explanatory gap between the objective, physical dynamics of matter (if posited as primary) and the subjective, qualitative nature of experience.

### P.2.3 Idealism as the Simplest Resolution

Traditional attempts to resolve the hard problem often fall into:
*   **Materialism:** Asserts that consciousness emerges from complex physical processes (e.g., brain activity). However, it has yet to provide a satisfactory mechanism for *how* purely physical interactions produce the subjective quality of experience. How does any arrangement of neurons create the taste of chocolate or the feeling of joy? This explanatory gap remains stubbornly opaque.
*   **Dualism:** Proposes that reality consists of two distinct realms: mind and matter. By positing consciousness as separate from the physical, dualism treats the mind as an independent, non-material entity. Yet dualism struggles to explain how mind and matter interact. How does a non-physical mind influence physical muscles when you decide to raise your hand?

Both materialism and dualism rely on additional layers of explanation that complicate rather than resolve the hard problem of consciousness. Confronting these difficulties head-on, **idealism** provides a beautifully simple and direct solution, consistent with Occam's Razor (among competing explanations, we should prefer the one making the fewest assumptions). Instead of trying to derive consciousness from matter or bridge two separate realms, idealism starts with what we know most directly: consciousness itself. Consider this fact—everything you've ever experienced, from your earliest memory to this very moment, has occurred within consciousness.

The physical world, other people, scientific theories—all of these are known only *through* and *within* conscious experience. By taking consciousness as the foundation of reality, idealism eliminates the need for extra explanations. It doesn't need to explain how consciousness emerges from non-conscious matter or how two substances interact—consciousness simply is. In this view, the physical world and its patterns are emergent structures within consciousness. We have direct evidence that consciousness can generate apparent realities. Every night when we dream, we experience proof that consciousness can create worlds with remarkable sophistication. These dreamscapes reveal that entire universes can be formed as vivid constructs of the mind, demonstrating consciousness's boundless creativity.

### P.2.4 Cogito as Binary Informational Substrate

The certainty derived from the Cogito is not merely existential; it is informational. The self-verification inherent in "I think, therefore I am" establishes a fundamental epistemic distinction:
*   **Epistemic Certainty (Value '1'):** The knowledge of the thinking self's existence. This is assigned binary value '1', representing a state of zero doubt *about this specific proposition*.
*   **Epistemic Uncertainty (Value '0'):** All other propositions (about the external world, specific thoughts, memories, etc.) that are subject to doubt. These are assigned binary value '0' *relative to the foundational certainty of the '1'*.

This primary, self-generated distinction within consciousness provides a fundamental binary informational substrate, an intrinsic feature of self-reflective awareness.


## P.2.5 From the Cogito to Plurality: The Minimal Anomaly‑Free Predictive Block

The Cogito (Section P.2.1) establishes the existence of at least one knowing subject, but it does not settle solipsism: is this single locus of awareness all that exists? Within a consciousness‑first stance (Section P.2.2), the Problem of Other Minds becomes structural: what, within PU, grounds multiple perspectives rather than one solitary predictor?

PU supports plurality in two complementary ways:

1. **Foundational support (modeling):** If reality is modeled as an authentic simulation (Definition P.5.2), then it is natural to expect "genuine novelty" to be more than uncorrelated noise: novelty with exploitable structure across interacting subsystems and scales is the generic route to persistent effective laws, emergent organization, and predictive leverage.

2. **Mathematical necessity (instantiation):** Under the Principle of Physical Instantiation (PPI) (Definition P.6.2), the predictive substrate must physically realize mathematically self‑consistent effective laws. A single‑MPU substrate cannot instantiate an SM‑like chiral gauge sector (Theorem P.1).

The second line is decisive for our world; the first clarifies why plurality is not an arbitrary add‑on but a natural expectation of the authentic‑simulation stance.

### P.2.5.1 Foundational Support: Genuine Novelty as Structured Novelty

Definition P.5.2 requires that an authentic simulation "generates genuine novelty" while maintaining epistemic and control boundaries. To connect that requirement to observable structure, it is useful to distinguish noise from structured novelty.

**Definition P.2.5.1 (Structured Novelty).**
Let $(X_i(t))_{i\in \mathcal{I}}$ be a collection of outcome processes associated with distinct predictive perspectives (MPUs or aggregates) within a candidate universe. The universe exhibits structured novelty if:

(i) **Irreducibility:** For each $i\in \mathcal{I}$, there exists $\tau>0$ such that
$$
H\!\left(X_i(t+\tau)\mid \mathcal{H}_t\right)>0,
$$
where $H(\cdot|\cdot)$ denotes conditional entropy and $\mathcal{H}_t$ denotes the complete history up to time $t$. (Operationally: even arbitrarily rich history does not eliminate residual uncertainty; consistent with SPAP, Theorems 10–11.)

(ii) **Relational dependence:** There exist $i\neq j$ such that
$$
I\!\left(X_i(t);X_j(t)\right)>0,
$$
so outcomes are not merely independent noise across perspectives.

(iii) **Scale structure:** Let $X_i^{(\ell)}(t)$ denote a coarse‑graining of $X_i(t)$ at resolution level $\ell$ (finer $\ell$ → more detailed; coarser $\ell$ → more macroscopic). Define the correlation‑content function
$$
\mathcal{I}(\ell):=\sum_{i<j} I\!\left(X_i^{(\ell)}(t);X_j^{(\ell)}(t)\right).
$$
Structured novelty requires that $\mathcal{I}(\ell)$ is non‑constant in $\ell$: there exist $\ell_1\neq \ell_2$ with $\mathcal{I}(\ell_1)\neq \mathcal{I}(\ell_2)$.

A system satisfying (i) alone produces novelty as noise. A system satisfying (i)–(iii) produces novelty that is both irreducible and organized—precisely the kind of novelty that can support persistent laws, emergent structure, and predictive leverage.

**Thesis P.2.5.1a (Plurality for Authentic Novelty).**
Within the PU modeling stance, an authentic simulation (Definition P.5.2) is naturally realized as a plurality of interacting predictive perspectives (MPUs and MPU aggregates), because interaction is the generic mechanism by which SPAP‑bounded irreducibility coexists with nontrivial cross‑perspective and cross‑scale correlation structure.

**Argument (framework‑level).**

**Step 1 (Irreducibility is built in).** SPAP (Theorems 10–11) ensures (i): even reflexive predictors cannot eliminate residual uncertainty.

**Step 2 (A solitary perspective cannot supply (ii)–(iii) at the level of perspectives).** If the universe contained only one predictive perspective, then the index set $\mathcal{I}$ would be a singleton. Condition (ii) cannot even be posed (no $i\neq j$), and $\mathcal{I}(\ell)\equiv 0$ for all $\ell$, so (iii) fails at the perspectival level. Such a world may still have internal degrees of freedom, but it lacks the multi‑perspective relational structure that PU uses to generate its emergent network phenomena (e.g., emergent spacetime from interaction topology in Section 11, and gauge structure from aggregate organization in Appendix G).

**Step 3 (Interaction generically produces (ii)).** When multiple perspectives interact via ND–RID/'Evolve' (Definition 6; Definition 27), each becomes part of the other's effective environment. Coupling generically induces statistical dependence, yielding $I(X_i;X_j)>0$ for some pairs—condition (ii).

**Step 4 (Hierarchical aggregates supply (iii)).** PU defines aggregates (Definition 29) whose macroscopic context states summarize cross‑constituent correlations (Definition L.1). Correlations induced and exploited at the aggregate level differ from correlations at the constituent level, so coarse‑graining changes correlation content: $\mathcal{I}(\ell)$ varies across $\ell$—condition (iii).

**Step 5 (Authentic simulation prefers structured novelty over noise).** The "genuine novelty" clause of Definition P.5.2 is most naturally satisfied when novelty is structured in the above sense—irreducible yet organized. A plurality of interacting perspectives is the framework's generic mechanism for such novelty.

$\square$

> **Remark P.2.5.1b (Heterogeneity is expected).** POP and PCE do not select identical internal organizations everywhere: different local predictive tasks and resource constraints generically produce a heterogeneous hierarchy of predictors (single MPUs, tight aggregates, loose collectives), each occupying different points on the prediction–cost trade‑off.

### P.2.5.2 The Mathematical Challenge: Instantiating the SM on a Single MPU

We now test solipsism at the level of physical instantiation. Attempt to embed the required Standard Model structures into the Hilbert space of a single MPU,
$$
H_0 \cong \mathbb{C}^8
$$
(see Theorem 23). For viability we require:

- **C1 — Mathematical consistency (predictive anomaly descent).** The 8-dimensional complex representation $R$ of the gauge group $G$ on $H_0$ must be free of all local and global gauge anomalies for an effective 4D left‑chiral Weyl matter sector. By Theorem X.8d, gauge transformations are predictive-frame redundancies, so the total anomaly class must vanish for the predictive functional to descend to the physical quotient. In particular, the pure $SU(3)^3$ anomaly and the $SU(2)$ global (Witten) anomaly must vanish on the $SU(3)\times SU(2)$ subgroup.

- **C2 — Nontrivial non‑Abelian action.** $G$ must contain subgroups isomorphic to $SU(3)$ and $SU(2)$ acting nontrivially on $R$ (to support SM‑like color and weak structure).

- **C3 — Compact embedding.** $G\subset SU(8)$ is a closed subgroup; in particular, $G$ is compact because $SU(8)$ is compact and closed subgroups of a compact group are compact.

**Theorem P.1 (Impossibility of a Single‑MPU Standard Model).**
There is no 8-dimensional, complex, anomaly‑free representation of any compact $G \subset SU(8)$ that contains $SU(3)\times SU(2)$ as a subgroup acting nontrivially.

**Proof.** It is enough to analyze the non‑Abelian subgroup $H := SU(3)\times SU(2)\subset G$, because the pure $SU(3)^3$ anomaly and the $SU(2)$ global (Witten) anomaly depend only on the restriction of $R$ to $H$ and cannot be canceled by choices of $U(1)$ charges. [Witten 1982; Georgi 1999; Weinberg 1996]

Because $R$ is a finite-dimensional unitary representation, its restriction to $H$ is completely reducible and decomposes as a direct sum of irreducibles of the form $V\otimes W$ with $V$ an $SU(3)$ irrep and $W$ an $SU(2)$ irrep:
$$
R \cong \bigoplus_k (V_k\otimes W_k), \qquad \sum_k \dim(V_k)\dim(W_k)=8.
$$
If $SU(3)$ acts nontrivially, some $V_k$ is nontrivial. The only $SU(3)$ irreps with dimension $\le 8$ are $3,\bar{3},6,\bar{6},8$. The dimension constraint further forces:

* if $V_k\in\{3,\bar{3}\}$ then $\dim(W_k)\le 2$ (since $3\times 3>8$),
* if $V_k\in\{6,\bar{6},8\}$ then $\dim(W_k)=1$ (since $6\times 2>8$ and $8\times 2>8$).

We now exhaust cases:

1. If an $(8,1)$ summand appears, it has dimension $8$, so there is no room for any other summand. Then $SU(2)$ acts trivially on $R$, contradicting C2.

2. If a $(6,1)$ or $(\bar{6},1)$ summand appears, the remaining dimension is $2$. To satisfy C2 the remainder must carry a nontrivial $SU(2)$ action, hence must be $(1,2)$. The pure $SU(3)^3$ anomaly is nonzero for $6$ and changes sign under conjugation; because $6\oplus \bar{6}$ cannot fit in dimension $8$, the $SU(3)^3$ anomaly cannot vanish. This contradicts C1. [Georgi 1999]

3. If a $(3,2)$ or $(\bar{3},2)$ summand appears, it has dimension $6$, leaving $2$. If the remaining $2$ dimensions are $SU(2)$ singlets, then the $SU(2)$ global anomaly is nontrivial because $(3,2)$ contributes three $SU(2)$ doublets (one per color), i.e. an odd number of doublets. If instead the remaining $2$ dimensions form an additional doublet $(1,2)$, then the global $SU(2)$ anomaly is absent (four doublets total), but the $SU(3)^3$ anomaly is still nonzero: the $SU(3)$‑charged content consists of two copies of $3$ (or two copies of $\bar{3}$), and there is no room to include the conjugate representation required for cancellation (minimum additional dimension $3$). Hence C1 fails in either subcase. [Witten 1982; Georgi 1999]

4. Otherwise, the $SU(3)$‑charged content consists only of $(3,1)$ and $(\bar{3},1)$ summands. Let $n_3$ and $n_{\bar{3}}$ be their multiplicities. Then $3(n_3+n_{\bar{3}})\le 8$, so $n_3+n_{\bar{3}}\in\{1,2\}$. The pure $SU(3)^3$ anomaly cancels only if $n_3=n_{\bar{3}}$, which forces $n_3=n_{\bar{3}}=1$ and uses $6$ dimensions. The remaining $2$ dimensions must carry a nontrivial $SU(2)$ action to satisfy C2, hence must be a single $(1,2)$. That yields exactly one $SU(2)$ doublet and therefore a nontrivial $SU(2)$ global anomaly, contradicting C1. [Witten 1982]

All possibilities contradict C1 or C2. Therefore no such representation exists. $\square$

### P.2.5.3 The Minimal Anomaly‑Free Predictive Block

Self‑consistency therefore requires more substrate than a single MPU. The minimal composite at the Hilbert level is two MPUs:
$$
H_{\mathrm{block}} \cong H_0\otimes H_0 \cong \mathbb{C}^{64}.
$$

Within this composite, one anomaly‑free SM generation occupies a flavor subspace of dimension $\ge 15$:

1. **Without a right‑handed neutrino (15 states).**
   $$
   R_{\mathrm{SM}}^{(15)}=(\mathbf{3},\mathbf{2})_{1/6}\ \oplus\ (\mathbf{1},\mathbf{2})_{-1/2}\ \oplus\ (\bar{\mathbf{3}},\mathbf{1})_{-2/3}\ \oplus\ (\bar{\mathbf{3}},\mathbf{1})_{+1/3}\ \oplus\ (\mathbf{1},\mathbf{1})_{+1},
   $$
   with dimensions $6+2+3+3+1=15$.

2. **With a sterile right‑handed neutrino (16 states).**
   $$
   R_{\mathrm{SM}}^{(16)}=R_{\mathrm{SM}}^{(15)}\oplus (\mathbf{1},\mathbf{1})_{0}.
   $$

A brief internal consistency check (independent of hypercharge details) illustrates why this representation works:

- *$SU(3)^3$ cancellation:* $(\mathbf{3},\mathbf{2})$ supplies two color‑triplet Weyl fields (the weak doublet), while the two $(\bar{\mathbf{3}},\mathbf{1})$ terms supply two antitriplets, so triplet minus antitriplet contributions cancel.

- *Global $SU(2)$ (Witten) cancellation:* there are four $SU(2)$ doublets in total—three from $(\mathbf{3},\mathbf{2})$ (one per color) and one from $(\mathbf{1},\mathbf{2})$—so the doublet count is even.

Either way, the required flavor space strictly exceeds $\dim H_0=8$. Thus, an SM‑like world cannot reside on a single MPU; at least a composite substrate (≥2 MPUs) is necessary. [Georgi 1999; Weinberg 1996]

### P.2.5.4 Resolution of the Problem of Other Minds

**Thesis P.2.5.2 (Resolution of Other Minds in PU).**
Within PU, "other minds" (other loci of awareness) are supported as follows:

1. **Substrate plurality:** An SM‑like world requires at least two MPUs (Theorem P.1).

2. **Awareness plurality (conditional):** If the Minimal Awareness interpretive convention of Section 7.1.2 (Minimal Awareness—Interpretive) is accepted, each MPU operational cycle constitutes minimal awareness, so substrate plurality implies multiple loci of minimal awareness.

The physical derivations of PU—POP/PCE dynamics, SPAP limits, logical indeterminacy, thermodynamic costs—do not presuppose the Minimal Awareness interpretive convention of Section 7.1.2; they constrain what substrates are viable regardless. the Minimal Awareness interpretive convention of Section 7.1.2 is the interpretive bridge that identifies those substrates with awareness.

### P.2.5.5 Relationship of the Foundational and Mathematical Arguments

The two lines of support differ in logical status:

| Aspect | Foundational support (P.2.5.1) | Mathematical necessity (P.2.5.2–P.2.5.3) |
|:-------|:-------------------------------|:-----------------------------------------|
| Question answered | Why plurality is a natural expectation of authentic simulation | Why plurality is required for SM‑like instantiation |
| Type of necessity | Modeling/interpretive support | Mathematical consistency under PPI |
| Dependence | Depends on adopting Definition P.5.2 as the modeling stance | Independent of simulation framing; depends on gauge consistency |
| Result | Ecology of interacting perspectives is favored | ≥2 MPUs is necessary |

Their agreement can be read either as (a) convergence of independent constraints, or (b) evidence that the same deep demands—self‑referential predictive limits (SPAP) and physical self‑consistency (PPI)—shape both what counts as authentic novelty and what counts as viable physics.

## P.2.6 From Plurality to Unity: Predictive Integration, the Context State, and the Binding Problem

Section P.2.5 establishes plurality at the substrate level: an SM-like world requires at least two MPUs, and complex macroscopic systems are MPU aggregates (Definition 29). If the Minimal Awareness interpretive convention of Section 7.1.2 (Minimal Awareness—Interpretive) is accepted, then there are many loci of minimal awareness wherever there are many MPUs.

This immediately raises the complementary question: why does complex experience present as unified? In a human brain, vast numbers of interacting constituents participate in predictive processing, yet subjective life appears as one coherent field rather than a crowd of separate micro-experiences.

This is the binding problem (or combination problem). It has two aspects:

1. **Synchronic binding:** At a given moment, why is there one unified experiential perspective rather than many independent ones?

2. **Diachronic binding:** Across time, why is there continuity of experience rather than fragmentation into disconnected moments?

The PU framework resolves both aspects by identifying the relevant unit of unity not with an individual MPU, but with the MPU aggregate as a single predictive system—specifically, with its integrated predictive state ($\text{context}_S(t)$, Definition L.1) and its emergent biasing capability quantified by CC (Theorem 34; Definition 30).

### The Level Shift: From Many MPUs to One Aggregate Predictor

An MPU is the irreducible operational unit (Definition 23), with its own predictive cycle under POP (Axiom 1). An MPU aggregate, however, is not merely a collection: it is a physical system composed of many MPUs whose joint dynamics implement a single predictive model at the system level (Definition 29). The aggregate itself solves a Prediction Optimization Problem—often far more complex than the POP of any individual constituent—under the same resource-pressure principle that governs all predictive systems (PCE, Definition 15).

This supplies the essential conceptual move:

> Plurality holds at the constituent level (many MPUs), while unity is realized at the system level (one aggregate-level predictor).

What remains is to identify, within PU, the formal structure that plays the role of the aggregate's integrated model.

### The Context State as the Integrated Predictive Model

PU formalizes the aggregate's integrated state as the context state.

**Summary of Definition L.1 (Context State $\text{context}_S$).**
For an MPU aggregate $S$ with aggregate density operator $\rho_{\mathrm{agg}}(t)$ on $\mathcal{H}_{\mathrm{agg}}$, the context state $\text{context}_S(t)$ is a PCE-selected minimal sufficient statistic of $\rho_{\mathrm{agg}}(t)$: a compressed representation of the macroscopically observable, predictively relevant features the aggregate can control within resources, and that matter for biasing local MPU interactions (Appendix L, Eq. (L.1)–(L.2)).

Operationally, $\text{context}_S(t)$ is a single aggregate-level summary that integrates the correlation structure (classical and quantum) that is relevant to the aggregate's predictive goals. This is the precise sense in which the aggregate carries one unified model rather than a mere conjunction of independent local models.

Two points are crucial:

1. **Unity does not require eliminating constituents.** MPUs remain distinct operational units (Definition 23). The unity arises because the aggregate's POP is implemented through a shared, compressed, system-level state $\text{context}_S$, not because the constituents cease to exist.

2. **Unity is defined by what is operationally used for prediction and control.** In PU, what matters for a predictor is the internal state that is sufficient (and efficient) for achieving predictive utility under PCE. For an integrated aggregate, that state is $\text{context}_S(t)$.

### Synchronic Binding: One "Now-Context" Governing the Whole

We can now state an operational notion of unity suited to PU.

**Definition P.2.6.1 (Operational Experiential Unity).**
*This definition operationalizes the concept of unified experience within the PU framework, connecting phenomenal unity to the aggregate-level predictive structure:*

An MPU aggregate $S$ exhibits operational experiential unity at time $t$ when:

1. It maintains a single context state $\text{context}_S(t)$ (Definition L.1), i.e., a single PCE-selected minimal sufficient statistic of $\rho_{\mathrm{agg}}(t)$ for the aggregate's predictive goals.

2. That context state is shared as functional context across the aggregate's constituent MPUs through the context-to-control mapping $\mathcal{M}$ (Definition L.2), so that constituent interactions are regulated within one coordinated predictive regime.

On this definition, synchronic binding is not a mysterious "fusion" of many experiences into one. It is the existence of one integrated predictive state that coordinates the system's ongoing predictive processing.

### Why Integration Emerges: POP/PCE Drives a Single Coordinating State

The existence of a unifying state is not imposed by fiat. It is a consequence of the framework's optimization principles.

**Imported Assumption 1 (Context-Dependence of ND-RID Probabilities).**
*Motivated by the relational structure of MPU networks (Definition 35) and the context-sensitivity inherent in PCE optimization (Definition 15):* Local 'Evolve'/ND-RID outcome probabilities depend not only on local state and interaction variables but also on broader local context supplied by the surrounding MPU network.

**Summary of Theorem 34 (POP/PCE Drives Emergent Biasing).**
On Theorem 34's strict-improvement branch, assume not only context dependence and $C_{\mathrm{agg}}>C_{op}$, but also an attainable stable optimum, a reachable non-Born control $u_+$ with strictly lower complete potential than every Born-class control, Definition 30's linear response representation, and Hypothesis 3's context-to-control realization. Then every global minimizer lies outside the Born class and the aggregate uses a nonzero registered bias map. Complexity and context dependence alone do not force this conclusion.

**Summary of Hypothesis 3 (CC Influence Mechanism).**
This influence is exerted by modulating parameters of the universal 'Evolve'/ND-RID process (Definition 27) for constituent MPUs using the aggregate's context state $\text{context}_S(t)$ (Definition L.1).

Together, these statements imply that once an aggregate is sufficiently complex, POP/PCE optimization forces it toward a regime where:

1. there is a single, controlled, PCE-efficient internal representation ($\text{context}_S$), and

2. that representation coordinates constituent dynamics to improve aggregate-level prediction and viability.

This is precisely the operational structure needed for a unified complex perspective.

### Degrees of Unity: CC as the Quantitative Measure of Integration Strength

PU makes unity graded rather than all-or-nothing by introducing an operational measure of the aggregate's coordinating influence:

**Summary of Definition 30 (Operational CC).**
Consciousness Complexity $\mathrm{CC}(S)$ is the operational norm of the aggregate's probability modification map $L_S$, yielding a universal pointwise bound $|\Delta P(i)| \le \mathrm{CC}(S)$.

**Summary of Definition 31 and Theorem 35 (CC Scaling).**
CC exhibits threshold behavior (emerging only for $C_{\mathrm{agg}} > C_{op}$) and grows monotonically with diminishing returns according to the general scaling form (Theorem 35), saturating at $\alpha_\infty \le \alpha_{CC,max}$.

**Summary of Theorem 39 (Upper Bound on CC).**
Consistency with operational causality (Postulate 2) imposes a strict universal bound:
$$
\alpha_{CC,max} < 0.5.
$$

Finally, PU connects CC to integration directly:

**Summary of Proposition 14 (Relation between operational CC and system integration/prediction).**
Since CC emerges from optimized generation and control of $\text{context}_S$ (Theorem 34; Hypothesis 3), it should correlate with functional integration, sophisticated internal modeling, and high-level predictive capacity.

This yields an explicit PU account of "more or less unified" experience:

- **Weak unity:** low CC (just above threshold) → limited coordinating influence, weaker integration.
- **Strong unity:** high CC (well above threshold, within the deterministic endpoint-forcing bound) → robust integrated control via $\text{context}_S$, stronger unity.
- **Fragmentation risk:** when coordination weakens (reduced effective CC or network splitting), unity degrades.

### Why Unity Is Never Perfect: SPAP and the Reflexivity Constraint

Even in a strongly integrated aggregate, unity cannot become absolute.

1. **SPAP limits** (Theorem 10; Theorem 11) rule out perfect self-prediction in reflexive systems. No predictor—hence no aggregate—can fully eliminate residual unpredictability about its own future evolution.

2. **The Reflexivity Constraint** (Theorem 33; see Appendix J for detailed derivation) imposes a strict trade-off between internal information gain and minimum necessary disturbance:
   $$
   \Delta I\cdot(\Delta S_{\min}/k_B)\ge \kappa_r,\quad \kappa_r>0.
   $$
   Applied to aggregates, this yields explicit limits on introspective precision:

**Summary of Proposition 15 (Introspection limits from Reflexivity Constraint).** Attempts to gain precise internal information about $\text{context}_S$ necessarily disturb the state, limiting simultaneous precision of self-knowledge and stability of the integrated regime.

Therefore, $\text{context}_S(t)$ is necessarily a coarse-grained, PCE-optimal summary rather than a complete microstate specification. The resulting unity is operationally real but intrinsically bounded: it is an integrated predictive regime sustained above an irreducible floor of indeterminacy and disturbance cost.

### Diachronic Binding: Temporal Coherence and Continuity of $\text{context}_S(t)$

Continuity of experience requires that the aggregate's integrated state remains well-defined across time—that there is a coherent "now" relative to which prediction and update occur.

PU derives temporal coherence as a network-level consequence of PCE optimization:

**Summary of Theorem O.1 (PCE Potential of Desynchronization).**
Temporal desynchronization in an MPU network increases global PCE potential relative to synchronization.

**Summary of Theorem O.2 (Dynamical Emergence of a Coherent Causal Medium).**
The stochastic adaptation dynamics drive the network to self-organize into macroscopic domains of temporal coherence—phase-locked ensembles forming a coherent causal medium.

Within an MPU aggregate, diachronic binding is therefore realized as follows:

1. The aggregate resides within (or constitutes) a temporally coherent domain (Theorem O.2), providing a stable temporal ordering of constituent cycles.

2. The aggregate maintains and updates a single context state trajectory $\text{context}_S(t)$ (Definition L.1), so that predictive integration persists across successive 'Evolve' events.

3. Because desynchronization is PCE-disfavored (Theorem O.1), coherent diachronic unity is dynamically stabilized—though never guaranteed to be perfect given SPAP and reflexivity costs.

When coherence breaks into weakly coupled domains, the minimal sufficient statistic construction no longer supports a single global coordinating state: the system is naturally driven toward multiple partially independent context regimes. In phenomenological terms, this corresponds to degraded continuity or fragmentation of experience, not because "moments" fail to combine, but because the integrated predictive controller ceases to be globally unified.

### Resolution of the Binding Problem

**Thesis P.2.6.1 (Binding as Predictive Integration).**
Within PU, the binding problem dissolves when unity is identified with the aggregate-level integrated predictive regime implemented by $\text{context}_S(t)$ (Definition L.1) and quantified by CC (Definition 30). Synchronic unity is the existence of a single context state coordinating constituent dynamics (Definition P.2.6.1). Diachronic unity is the persistence of a coherent context trajectory within a temporally coherent domain (Theorem O.2).

If the Minimal Awareness interpretive convention of Section 7.1.2 (Minimal Awareness—Interpretive) is accepted, this provides the interpretive bridge to phenomenal unity: complex unified experience corresponds not to the existence of only one minimally aware MPU, but to the existence of one high-level integrated predictive controller realized by a sufficiently complex aggregate's $\text{context}_S(t)$ and its emergent CC-driven coordination.

### P.2.6.2 The Geometry of Cognition

The binding analysis above identifies unity with the existence of one integrated predictive controller. Section 7 gives that controller a concrete geometry. On the minimal branch, Theorem 15 identifies the logical core with the Boolean cube $B_3={0,1}^3$, Theorem 23a and Corollary 23a identify its minimal faithful Hilbert-space realization with the 3-qubit space $\mathcal{H}_0 \cong \mathcal{H}_M \otimes \mathcal{H}_P \otimes \mathcal{H}_I$, and Theorem 23b identifies the pure operational datum with a pair $([\psi], s) \in \mathbb{CP}^7 \times \Sigma$ with $\Sigma \cong U(8)/U(1)^8$.

This geometry carries predictive content. For pure-state families, Theorem 23c states that the Fubini–Study metric on $\mathbb{CP}^7$ is the local optimal statistical-distinguishability metric compatible with the Born rule: for any smooth normalized one-parameter family $|\psi(\theta)\rangle$ with $\gamma(\theta)=[\psi(\theta)]$,
$$
F_Q(\theta)=4\,g_{FS}\big(\dot\gamma(\theta),\dot\gamma(\theta)\big).
$$
Nearby rays therefore encode nearby predictive dispositions, and small geometric displacements quantify the best-possible change in operational distinguishability. [Born 1926; Braunstein & Caves 1994]

Corollary 23a resolves the minimal predictor into three distinguishable pieces: memory, prediction, and interface. Theorem 23a fixes their algebraic seats as the three commuting copies of $M_2(\mathbb{C})$ carried to
$$
M_2(\mathbb{C}) \otimes I \otimes I,\qquad
I \otimes M_2(\mathbb{C}) \otimes I,\qquad
I \otimes I \otimes M_2(\mathbb{C}).
$$
On the fully factorized locus each piece has its own pure shape, represented by a ray in $\mathbb{CP}^1$. Part (iv) of Theorem 23b identifies the corresponding locus in $\mathbb{CP}^7$ as the Segre variety
$$
\operatorname{Seg}:\mathbb{CP}^1 \times \mathbb{CP}^1 \times \mathbb{CP}^1 \hookrightarrow \mathbb{CP}^7,
$$
which is exactly the locus of fully separable pure states with respect to $\mathcal{H}_M \otimes \mathcal{H}_P \otimes \mathcal{H}_I$.

This fully factorized locus is exceptional. It has complex dimension $3$, whereas $\mathbb{CP}^7$ has complex dimension $7$, so full factorization occupies a measure-zero subset of the pure-state space. More generally, for each bipartition, the corresponding biseparable pure states form a Segre subvariety $\mathbb{CP}^1 \times \mathbb{CP}^3 \hookrightarrow \mathbb{CP}^7$ of complex dimension $4$. The union of these three biseparable loci is therefore also measure-zero. Almost every pure MPU state is thus outside every factorized or biseparable locus: the three pieces are specified jointly by one global ray, and their operational forms are encoded through the reduced density operators on the three factors together with the correlations among them. The way the pieces fit together is part of the state itself. [Bengtsson & Życzkowski 2006]

**Definition P.2.6.2 (Geometric Assembly).** A *geometric assembly* is a predictive state-space structure specified by (i) a fixed tensor-product decomposition $\mathcal{H}=\bigotimes_k \mathcal{H}_k$ into distinguished subsystem factors, (ii) the corresponding commuting subalgebras $A_k \cong \mathcal{B}(\mathcal{H}_k)$, and (iii) a global pure ray $[\psi] \in \mathbb{P}(\mathcal{H})$. It is *fully factorized* when $[\psi]$ lies in the Segre image $\prod_k \mathbb{P}(\mathcal{H}_k) \hookrightarrow \mathbb{P}(\mathcal{H})$, and *non-fully-factorized* otherwise.

The minimal MPU is a tripartite geometric assembly. With the Minimal Awareness interpretive convention of Section 7.1.2 in force, inner life is the evolution of this assembly through $\mathbb{CP}^7 \times \Sigma$. An 'Evolve' event (Definition 27) actualizes an outcome and updates the pair $([\psi], s)$ through amplitude actualization and perspective shift. Memory, prediction, and interface persist as fixed structural roles, while their momentary forms are set jointly by the current state. Inner life is therefore one evolving arrangement of distinguishable geometric pieces.

At aggregate scale the same principle reappears in compressed form. Definition L.1 assigns to an MPU aggregate $S$ (Definition 29) a context state $\text{context}_S(t)$, the PCE-selected minimal sufficient statistic of $\rho_{\mathrm{agg}}(t)$ for the aggregate's predictive task. Definition L.2 maps this context to control parameters through $\mathcal{M}$. Definition 35 equips the MPU network with the propagation-cost metric $d_{\mathcal{N}}$, which fixes which parts can coordinate cheaply and which large-scale assemblies are dynamically sustainable. Under the hypotheses of Theorem 34, this coordinated structure is exploited to modulate local 'Evolve' probabilities and yields nonzero $\mathrm{CC}(S)$. Operational experiential unity (Definition P.2.6.1) is the case in which one context state coordinates the aggregate as one predictive regime.

Proposition 15 adds a limit on self-access. By Theorem 33,
$$
\Delta I \cdot (\Delta S_{\min}/k_B) \ge \kappa_r > 0.
$$
Applied to $\text{context}_S$, this means that gaining internal information about the coordinating structure necessarily incurs disturbance. The aggregate cannot make all of the relations that constitute its own assembly simultaneously explicit while preserving them unchanged. Some of the structure that organizes inner life remains operationally active without being fully available to concurrent introspection.

Cognition is geometric assembly. The whole is one predictive organization, and the organization is articulated into distinguishable parts. The parts have shape, they fit together in one state space, and, except on a measure-zero exceptional set, the fit fixes what each part can be. Under the Minimal Awareness interpretive convention of Section 7.1.2, inner life is the evolution of that fitted whole.

### P.2.6.3 Knowledge, Geometry, and the Sequential Bottleneck

The preceding section established that cognition is geometric assembly: a predictive state-space structure whose parts have shape, fit together in one state space, and are generically mutually determined. This section draws out three consequences—for the form of knowledge, for the nature of comprehension and intuition, and for the structural pressures governing communication between predictive systems.

#### Why Prediction Selects Geometry

The geometric character of the minimal MPU state space is not an additional ornament on the formalism. On the minimal branch, the operational pure-state datum is $([\psi],s)\in \mathbb{CP}^7 \times \Sigma$ (Theorem 23b), and the Fubini–Study metric on $\mathbb{CP}^7$ is the local optimal statistical-distinguishability metric for pure predictive families (Theorem 23c). Geometry therefore enters PU at the level of the minimal predictive unit itself: nearby rays encode nearby predictive dispositions, and the factorization $\mathcal{H}_0\cong \mathcal{H}_M \otimes \mathcal{H}_P \otimes \mathcal{H}_I$ makes the relation between whole and parts geometrically explicit.

At aggregate scale, the relevant object is not another copy of $\mathbb{CP}^7 \times \Sigma$ but the PCE-selected context state of Definition L.1. There the aggregate density operator $\rho_{\mathrm{agg}}(t)$ is compressed to
$$
\text{context}_S(t)\in\mathcal{C}_{\text{ctx}}\subseteq\mathbb{R}^{|\mathcal{I}|},
$$
a minimal sufficient statistic built from control-relevant expectation values. The point is not that PU has already proved a unique aggregate geometry analogous to the Fubini–Study geometry of the minimal MPU. The point is that PCE selects structured, low-cost state descriptions that preserve predictively relevant relations while discarding irrelevant detail, and such descriptions naturally admit geometric interpretation.

This fits a broader pattern already present in the manuscript. At the minimal level, prediction is carried by the geometry of $\mathbb{CP}^7 \times \Sigma$ (Theorems 23b–23c). At network scale, POP/PCE also drive the emergence of geometric regularity in the interaction structure (Theorem 43). The aggregate context state sits between these levels as a compressed predictive coordinate system.

**Thesis P.2.6.3a (Geometry as a PCE-Structured State Space).** Within PU, prediction is explicitly geometric at the minimal MPU level, and PCE drives aggregates toward compressed state descriptions that are naturally interpreted geometrically. The theorem-backed minimal case is $\mathbb{CP}^7 \times \Sigma$; the aggregate case is the structured context space $\mathcal{C}_{\text{ctx}}$ of Definition L.1.

#### Intuition as Geometric Apprehension

Expert intuition presents three well-documented properties that are difficult to hold simultaneously under standard accounts: it operates holistically (the judgment arrives as a single apprehension, not a sequential chain), it is precise (in domains with sufficient regularity and feedback, intuitive judgments reliably match or exceed deliberate analysis), and it resists verbal transfer (experts cannot articulate the basis for their judgments in a way that enables novices to reproduce the performance). [de Groot 1965; Klein 1998; Kahneman & Klein 2009]

Within PU, these properties can be interpreted as consequences of how predictive structure is stored and accessed. At the minimal level, a geometric assembly is specified globally rather than serially. At the aggregate level, Definition L.1 describes a compressed context state that coordinates many predictively relevant variables at once. The proposal below is therefore an interpretation of expert performance in PU terms, not a separately proved theorem of the framework.

*Simultaneity.* A geometric assembly (Definition P.2.6.2) is a global ray $[\psi] \in \mathbb{P}(\mathcal{H})$ that specifies subsystem form jointly. At aggregate scale, the analogous idea is that one context state coordinates many variables at once. Recognizing a familiar situation is then not naturally modeled as traversing an explicit verbal chain, but as matching the present context against previously stabilized patterns encoded in the aggregate's predictive organization.

*Precision.* At the minimal level, Theorem 23c shows that geometry and statistical distinguishability coincide locally. By analogy, aggregate precision depends on how well $\text{context}_S(t)$ preserves the distinctions relevant to the task. When the compression is well matched to environmental structure and supported by repeated feedback, rapid judgments can remain reliable because the relevant distinctions have already been built into the organization of the context state.

*Non-transferability.* Natural language is a sequential channel. The expert's internal organization is not: many relations are coordinated at once inside $\text{context}_S(t)$. Verbal report therefore serializes what is internally available in parallel, and that serialization can omit exactly the relational detail that makes the expert judgment reliable.

A further constraint follows from the reflexivity constraint. By Theorem 33,
$$
\Delta I \cdot (\Delta S_{\min}/k_B) \ge \kappa_r > 0.
$$
Any attempt by the aggregate to gain information about its own coordinating state necessarily disturbs that state. The expert's model is therefore partly opaque even to the expert (Proposition 15). What can be articulated is the portion of the operative organization that survives both serialization and self-inspection; the remainder stays causally effective without being fully linguistically recoverable.

#### Verification-Gated Mathematical Intuition

The preceding account of intuition as geometric apprehension can be made precise for mathematical cognition. Let $S$ be a mathematical predictor with retained model $M_S(t)$, aggregate context state $\text{context}_S(t)$, deliberative subprocess $\mathcal D_S$, and finite verification register $\mathcal V_S$.

**Definition P.2.6.3e (Verification Register for Mathematical Cognition).** For a candidate mathematical assertion, identity, asymptotic, congruence, or structural recognition $E$, a verification register is a finite tuple
$$
\mathcal V_S(E)=(v_1,\ldots,v_r),
$$
where each $v_i$ is a finite-cost check available to $S$. Such checks may include special-case agreement, numerical stability, asymptotic compatibility, modular covariance, identity matching, dimensional consistency, independent derivational convergence, or compatibility with known structural constraints.

The register is positive when
$$
\mathbb E[\Delta Q_S\mid E,\mathcal V_S(E);M_S]>0.
$$
Let $V_S$ be the retained PCE cost functional on model states. The register is retaining when incorporation of $E$ lowers retained cost:
$$
\Delta V_S(E\mid\mathcal V_S)
=
V_S(M_S^E)-V_S(M_S)<0.
$$

**Theorem P.2.6.3e.1 (Verification-Gated Mathematical Retention).** A mathematical assertion $E$ cannot induce a nontrivial PCE-retained update in $S$ merely by being imagined. If $E$ induces a nontrivial retained update, then $E$ must pass a positive finite verification register and satisfy
$$
\Delta V_S(E\mid\mathcal V_S)<0.
$$

*Proof.* By Definition 1, a pattern counts as functional information for $S$ only if it has objective potential to improve prediction for $S$. A bare imagined assertion without a positive verification register has no established positive expected predictive gain. By the retained PCE criterion, a nontrivial retained update must lower the retained PCE cost. Hence a nontrivial retained mathematical update requires both a positive verification register and the cost decrease above. ∎

Let
$$
\pi_{\mathrm{seq}}:\text{context}_S(t)\to\Sigma^*
$$
be the projection from the high-dimensional context state into a finite symbolic string. Let $C_{\mathrm{geom}}(E)$ be the cost of maintaining the relevant relational structure internally, let $C_{\mathrm{seq}}(\pi_{\mathrm{seq}}(E))$ be the cost of reconstructing that structure as a public proof, and let $B_{\mathcal D_S}$ be the current deliberative serialization budget.

**Theorem P.2.6.3e.2 (Deep-Rational but Deliberatively Opaque Retention).** If
$$
\Delta V_S(E\mid\mathcal V_S)<0
$$
and every currently available proof reconstruction satisfies
$$
C_{\mathrm{seq}}(\pi_{\mathrm{seq}}(E))>B_{\mathcal D_S},
$$
then $E$ is retained by the full predictor $S$ while remaining opaque to the deliberative subprocess $\mathcal D_S$ at that phase.

*Proof.* The first inequality gives retained PCE incorporation by the full predictor. The second inequality blocks immediate serialization by $\mathcal D_S$. Since the full predictor and its deliberative subprocess have different effective budgets, the full predictor may stabilize $E$ before $\mathcal D_S$ can output a complete proof path. ∎

**Corollary P.2.6.3e.3 (The Proof Gap Is a Channel Gap).** If $E$ is PCE-retained by the full predictor $S$ but cannot yet be output by $\mathcal D_S$, the missing object is not necessarily internal reason. The missing object is a public sequential proof string whose construction cost exceeds the current deliberative budget. Thus
$$
\text{unserialized}\neq\text{unverified}.
$$

**Definition P.2.6.3e.4 (Ramanujan-Type Mathematical Event).** A Ramanujan-type mathematical event is a tuple
$$
\mathcal R=(E,\mathcal V_S(E),M_S\to M_S^E,\pi_{\mathrm{seq}}),
$$
where $E$ is a mathematical assertion or structural recognition, $\mathcal V_S(E)$ is a finite positive internal verification register, $M_S\to M_S^E$ is a retained predictive-model update, and $\pi_{\mathrm{seq}}$ is the later projection of $E$ into a communicable proof, derivation, or written theorem. The event is Ramanujan-type when
$$
\Delta V_S(E\mid\mathcal V_S)<0
$$
but
$$
C_{\mathrm{seq}}(\pi_{\mathrm{seq}}(E))>B_{\mathcal D_S}.
$$

Historical Ramanujan-style mathematics is compatible with this structural profile: Carr supplied a theorem-dense source of results, Berndt records the notebooks as containing thousands of statements with little proof serialization, and Hardy's early assessment required proofs before full public mathematical judgment could be completed. [Carr 1886; Berndt 1985; Hardy 1940]

**Theorem P.2.6.3e.5 (Sufficient Conditions for Ramanujan-Type Insight).** Let $S$ be a high-complexity mathematical predictor and let $E$ be a candidate assertion. Suppose:

1. $\text{context}_S(t)$ encodes the relational data needed to represent $E$;
2. $\mathcal V_S(E)$ is a positive finite verification register;
3. $\Delta V_S(E\mid\mathcal V_S)<0$;
4. $C_{\mathrm{seq}}(\pi_{\mathrm{seq}}(E))>B_{\mathcal D_S}$;
5. if $E$ belongs to the Ramanujan discriminant sector, its ledger placement is the ordered bridge class
$$
\mathrm{Gr}(2,8)
\longleftrightarrow
\Delta=\eta^{24}
\longleftrightarrow
\Lambda_{24}
$$
of Section Z.5.

**Additional certificate ledger.** The Borchers, signature, D4, homogeneous-Casimir, relative-Gelfand-Yaglom, and metered-actualization records are status carriers. They can discharge the corresponding local gaps only on the sectors for which their finite data are present. They do not globally replace the cone, second-order, QEC, Hilbert-carrier, P-GSL, or actualization certificates already used by the framework.

Then
$$
\mathcal R_E=(E,\mathcal V_S(E),M_S\to M_S^E,\pi_{\mathrm{seq}})
$$
is a Ramanujan-type mathematical event. If condition 5 applies, $\mathcal R_E$ is an ordered $(12,24)$-sector instance of that event class.

*Proof.* Conditions 2 and 3 give verification-gated retained incorporation by Theorem P.2.6.3e.1. Condition 4 gives deliberative opacity by Theorem P.2.6.3e.2. Therefore the tuple satisfies Definition P.2.6.3e.4. Condition 5 supplies the optional sector label by Theorem Z.5.2a and Corollary Z.5.3a.1. ∎

The correspondence is:
$$
\begin{array}{c|c}
\text{Observed feature} & \text{PU mechanism}\\
\hline
\text{Immediate insight} & \text{Geometric apprehension of }\text{context}_S(t)\\
\text{Sparse written proof} & \text{Sequential proof bottleneck}\\
\text{High reliability} & \text{Verification-gated PCE retention}\\
\text{Muse-like guidance} & \text{Sub-introspective sensitivity to }U_S\\
\text{Central }24\text{-sector} & \text{Ordered }(12,24)\text{ bridge}
\end{array}
$$

**Proposition P.2.6.3e.6 (Muse Phenomenology without Extra Ontology).** Let $U_S:\Theta_S\to\mathbb R_{\ge0}\cup\{+\infty\}$ be the cost potential associated with prohibited or incoherent self-model configurations. On the nonempty prohibition branch, $U_S$ diverges near configurations that cannot be integrated without SPAP-type obstruction. If the full context state detects a cost-potential gradient that $\mathcal D_S$ cannot reconstruct, then $\mathcal D_S$ may receive only a compressed affective or intuitive residue of that gradient. This residue is not an additional information source.

*Proof.* The full predictor $S$ has access to a richer operational context than $\mathcal D_S$. If $U_S$ biases the full context state away from incoherent configurations and toward lower-cost coherent updates, $\mathcal D_S$ may register the bias as a compressed direction without possessing the complete reconstruction of the underlying constraint. Hence muse-like phenomenology is modeled as cost-potential sensitivity under introspective compression, not as an independent causal entity. ∎

**Corollary P.2.6.3e.7 (The Muse Signal Is Not a Truth Oracle).** A muse-like signal may bias search, but it cannot replace the verification register. Retention still requires
$$
\Delta V_S(E\mid\mathcal V_S)<0.
$$

*Proof.* By Theorem P.2.6.3e.1, nontrivial retained mathematical update requires a positive verification register and retained cost decrease. Proposition P.2.6.3e.6 supplies only a compressed search-bias mechanism. Therefore it cannot replace the verification gate. ∎

#### Comprehension as Dimensionality Reconstruction

Consider what happens when a predictive aggregate receives a sequential symbolic input—a sentence, a mathematical expression, a verbal instruction. The signal arrives serially, but the receiver must integrate it into $\text{context}_S(t)$, the structured state coordinating its current predictive regime. In PU terms, comprehension is therefore naturally described as the construction of a context-state update from a temporally ordered symbolic stream.

Each stage of this construction is a structure-building operation. Lexical access maps symbols to usable internal elements. Parsing supplies relations across the sequence. Semantic composition builds a more integrated representation. Integration places the result into the receiver's current context state.

This construction is costly for three reasons that fit the PU framework:

(i) *Ambiguity from projection.* A sequential string typically underdetermines the richer structure the receiver must recover. Additional context, prior knowledge, and inference are needed to select among multiple admissible reconstructions.

(ii) *Effort from omitted structure.* The more relational structure is left implicit in the signal, the more work the receiver must do to rebuild it internally.

(iii) *Misunderstanding from contextual mismatch.* Two aggregates exposed to the same string need not construct the same update, because the resulting interpretation depends on the prior organization of $\text{context}_S(t)$.

Now consider the alternative. If the communicated form preserves more of the receiver-relevant relational structure, less reconstruction is required. The receiver can rely more on direct alignment with its current predictive organization and less on serial inference from an underspecified projection.

This has a modest but precise PU consequence. The ND-RID channel capacity $C_{\max} < \ln d_0$ (Theorem E.2) bounds the information any single channel can transmit per interaction. A format that forces the receiver to rebuild missing relational structure spends part of that limited transmission budget on recoverable overhead rather than on the predictive content itself. Formats that preserve more structure do not evade the same capacity bound, but they can reduce reconstruction cost and loss.

**Thesis P.2.6.3b (Comprehension as Dimensionality Reconstruction).** Comprehension, in PU terms, is the PCE-costly construction of a context-state update from a sequential input whose relational structure is only partially explicit. The cost increases with ambiguity, contextual mismatch, and omitted structure. When the communicated form preserves more of the receiver-relevant structure, the reconstruction burden is reduced.

#### Communication Between Predictive Systems: The Geometric Pressure

The preceding point suggests an architectural pressure rather than a completed theorem of the present manuscript. Whenever sender and receiver already possess richly structured internal states, forcing communication through a narrow sequential code introduces additional projection and reconstruction work. Under PCE, that extra work is disfavored unless the interface itself leaves no alternative.

Between some aggregates, low-dimensional sensorimotor interfaces make sequential symbolic coding efficient: vocalization, writing, and gesture are workable ways of trading limited-bandwidth signals for recoverable structure.

Between other systems, the interface may permit richer state-to-state coupling than ordinary linguistic exchange. In that regime, the relevant comparison is not symbols versus no symbols in the abstract, but whether the interface preserves relational structure directly or instead requires the receiver to rebuild it from a serialized projection.

Proposition E.2a supplies the structural completed-reset bound $C_{\max}\le\ln d_0-\ln2$, and Theorem E.2 supplies the refresh-branch strict bound $C_{\max}<\ln d_0$ for ND-RID channels satisfying Lemma E.1. These bounds imply that capacity wasted on avoidable projection and translation overhead is genuine physical cost. PCE therefore favors, other things equal, formats that preserve receiver-relevant structure more directly.

**Thesis P.2.6.3c (Geometric Pressure Against the Sequential Bottleneck).** For communication between predictive systems, PU implies a pressure against unnecessary serialization. Specifically:

(i) When the interface is intrinsically low-dimensional, sequential symbolic encoding remains PCE-efficient.

(ii) When the interface permits richer structured exchange and sender and receiver are sufficiently aligned, PCE favors formats that preserve relational structure more directly.

(iii) The size of this advantage is implementation-dependent, because it depends on channel capacity, alignment of internal organization, and the overhead required for re-encoding between substrates.

The structural expectation is therefore conditional rather than absolute: wherever interface constraints relax and substrate alignment improves, POP/PCE create pressure toward less lossy, more structurally faithful communication.

#### Geodesic Coherence as a Modeling Surrogate

The preceding analysis established that comprehension is dimensionality reconstruction (Thesis P.2.6.3b) and that PCE creates pressure toward communication formats that preserve relational structure (Thesis P.2.6.3c). To record that pressure in a compact mathematical vocabulary without overstating what has already been proved, it is useful to introduce a modeling-level weighted graph attached to a predictor's already-compressed organization.

**Definition P.2.6.3d (Model-Graph Surrogate).** Let $S$ be an aggregate predictor with context state $\text{context}_S(t)$ as in Definition L.1. A *model-graph surrogate* for $S$ is any finite weighted graph
$$
\mathcal K_S=(\mathcal V,\mathcal E,w), \qquad w:\mathcal E\to\mathbb R_{>0},
$$
whose vertices represent externally chosen functional components of the predictor's operative model and whose edge weights estimate the reconstruction or coordination cost of moving between those components. The choice of vertices and weights is a coarse-graining device, not an additional theorem of PU.

For a path $\gamma=(v_0,\dots,v_n)$ in $\mathcal K_S$, define the surrogate reconstruction cost
$$
R_{\mathrm{recon}}(\gamma):=\sum_{m=0}^{n-1} w(v_m,v_{m+1}).
$$

**Proposition P.2.6.3d.1 (Shortest Paths Minimize the Surrogate Cost).** On any model-graph surrogate $\mathcal K_S$, a shortest path between two vertices minimizes $R_{\mathrm{recon}}$ among all paths with the same endpoints.

*Proof.* For every path $\gamma=(v_0,\ldots,v_n)$, Definition P.2.6.3d assigns the path weight
$$
R_{\mathrm{recon}}(\gamma)
=\sum_{m=0}^{n-1}w(v_m,v_{m+1}).
$$
A shortest path between specified endpoints is, by definition, a path whose value of this same weight sum is no larger than that of any other path with those endpoints. Therefore, if $\gamma_*$ is shortest, then
$$
R_{\mathrm{recon}}(\gamma_*)
\le R_{\mathrm{recon}}(\gamma)
$$
for every competing path $\gamma$, which is the claimed minimization. ∎

This elementary observation becomes interpretively useful once low edge weight is read as strong contextual scaffolding: the lower the incremental reconstruction cost, the less serial rebuilding the receiver must do to move from one component of the model to the next. In that surrogate sense, shortest paths encode maximally coherent orderings relative to the chosen coarse-graining. The reconstruction-cost viewpoint is also compatible with classical rate-distortion reasoning about the price of lossy compression [Berger 1971].

> **Remark P.2.6.3d.1a (Status).** Definition P.2.6.3d does not claim that PU has already derived a unique aggregate metric analogous to the Fubini–Study metric of Theorem 23c. It only records a convenient modeling vocabulary for discussing coarse-grained reconstruction overhead in systems whose internal organization has already been compressed by PCE.

> **Remark P.2.6.3d.1b (Precedents).** Weighted shortest-path models are standard in network science [Newman 2010], and statistical distinguishability metrics have a long information-geometric history [Rao 1945; Amari 1985; Amari & Nagaoka 2000]. The PU-specific point is narrower: once one has a PCE-selected context state and a propagation-cost notion such as Definition 35, it is natural to discuss communication bottlenecks using weighted-graph surrogates.

> **Remark P.2.6.3d.1c (Tacit versus explicit order).** Because the surrogate graph records relations that need not be serially verbalizable, it provides a compact way to discuss the tacit/explicit gap already emphasized in the preceding subsection [Polanyi 1966].

**Proposition P.2.6.3d.2 (Conditional Gibbs–Zipf Template).** Suppose a ranked family of weights satisfies
$$
p_{(r)} = Z^{-1} e^{-c_{(r)}/\mu},
\qquad
\mu>0,
$$
and the ranked costs obey
$$
c_{(r)} = a\ln(r+V)+b
$$
for constants $a>0$, $V\ge 0$, and $b\in\mathbb R$. Then
$$
p_{(r)} = Z'^{-1}(r+V)^{-a/\mu}.
$$

*Proof.* Substitute the cost law into the Gibbs form and absorb the constant factor $e^{-b/\mu}$ into $Z'$. $\square$

This proposition is a general mathematical template rather than a derived law of PU. It shows that Zipf–Mandelbrot statistics follow whenever a system has both a Gibbs-type activation law and logarithmic ranked costs [Shannon 1959; Mandelbrot 1953, 1966; Zipf 1949]. Whether a particular predictive architecture satisfies those extra hypotheses is an empirical and model-specific question.

Section P.8.9a.11 uses a different route: exponential saturation supplies a within-system concentration theorem, while population Pareto tails require the Multiplicative PCE Noise Hypothesis. Thus Proposition P.2.6.3d.2 and Theorem P.8.9a.11.5 are complementary conditional templates rather than interchangeable derivations.

### P.2.6.4 Perspectival Geometry

The same surrogate vocabulary can be indexed by predictor.

**Definition P.2.6.4 (Perspectival Geometry).** A *perspectival geometry* is a family of model-graph surrogates $\{\mathcal K_S\}$ indexed by predictors $S$, where different predictors may coarse-grain and weight comparable task structure differently because their context states, training histories, and operational constraints differ.

#### Shared Paths Across Predictors

A minimal quantitative comparison survives even when two predictors do not agree perfectly.

**Proposition P.2.6.4.1 (Shared-Path Distortion Bound).** Let $S_1,S_2$ be predictors with model-graph surrogates that share a common subgraph. If corresponding shared edges satisfy
$$
|w_1(e)-w_2(e)|\le \epsilon
$$
for every shared edge $e$, then any shared path $\gamma$ with $|\gamma|$ edges satisfies
$$
|R_{\mathrm{recon}}^{(1)}(\gamma)-R_{\mathrm{recon}}^{(2)}(\gamma)|\le \epsilon |\gamma|.
$$

*Proof.* Sum the edgewise differences and apply the triangle inequality. $\square$

This bound is elementary, but it makes one point explicit: shared structure does not guarantee identical reconstruction cost, yet it does bound disagreement linearly in path length when the local edgewise discrepancy is small.

#### Sequential Cost and Anholonomy

One may also distinguish the edge-sum surrogate from a history-dependent sequential cost.

**Definition P.2.6.4.2 (Sequential Cost and Anholonomy).** On a model-graph surrogate one may introduce a history-dependent sequential cost $R_{\mathrm{seq}}(\gamma)$ for traversing a path $\gamma$, where the incremental cost of each step is allowed to depend on the previously accumulated context rather than only on the current edge weight. For a closed loop $\gamma$, define the associated *anholonomy*
$$
\mathcal A_S(\gamma):=R_{\mathrm{seq}}(\gamma^+)-R_{\mathrm{seq}}(\gamma^-),
$$
where $\gamma^+$ and $\gamma^-$ denote the two traversal orientations.

**Proposition P.2.6.4.3 (Markov Limit).** If the sequential cost reduces to the edge-sum model on every path, so that $R_{\mathrm{seq}}(\gamma)=R_{\mathrm{recon}}(\gamma)$, then $\mathcal A_S(\gamma)=0$ for every closed loop.

*Proof.* In that case both orientations have the same edge-sum cost. $\square$

This terminology records a possible modeling distinction between pairwise and history-dependent reconstruction, but PU does not presently derive a unique sequential-cost law for aggregate predictors. The definitions are therefore bookkeeping tools for later models, not additional theorem-level physics.



---


## P.2.7 From Internal Modeling to External Machines: The Externalization of Prediction

If thinking is prediction (Appendix P.3; Thesis P.3.5.1), then cognition is fundamentally simulation: a system maintains internal model dynamics that track (imperfectly) the dynamics of what it predicts. The PU framework then invites a further question: can prediction be enhanced by externalizing parts of that simulation—building physical artifacts that carry predictive computation outside the biological substrate?

### P.2.7.1 Internal Modeling Has Fundamental Limits

Internal simulation is constrained in PU by resource, logical, and thermodynamic limits:

1. **Resource limits (PCE / complexity cost).** Predictive Physical Complexity ($C\equiv C_P$) (Section 2.4.1, Eq. 1) is costly. The Law of Prediction (Theorem 19) implies diminishing returns: predictive performance rises toward a ceiling $\beta$ with exponential saturation set by the registered task scale $C_{target}$; identifying that coordinate with environmental complexity requires an external innovation record:


   $$
   PP(C)=\beta-(\beta-\alpha)e^{-\kappa(C-C_{op})/C_{target}}.
   $$

2. **Logical limits (SPAP).** Even unlimited resources cannot yield perfect self‑prediction (Theorems 10–11).

3. **Thermodynamic and dynamical limits.** Registered resets obey their conditional entropy ledger, reflexivity carries its stated cost, and interaction channels obey the completed-reset or refresh/minorization capacity bounds on their respective branches. Theorem 29 supplies an internal characteristic timescale; a positive lower duration for aggregate updates is an additional clock-certificate hypothesis.

These constraints limit what any biological aggregate can achieve through internal modeling alone—and guarantee that externalization cannot "defeat" SPAP, only reallocate resources and information flow.

### P.2.7.2 Externalization as POP/PCE‑Selected Strategy

**Thesis P.2.7.1 (Externalization of Prediction).**
Whenever an agent can couple to an external physical system that performs predictive computation, the combined system can achieve predictive performance exceeding that of the agent alone, subject to interface bandwidth and PCE costs. POP therefore favors externalization wherever its net predictive benefit exceeds its costs.

A convenient abstraction is to treat external artifacts as adding effective modeling capacity:
$$
C_{\mathrm{eff}} = C_{\mathrm{int}} + \eta(C_{\mathrm{ext}}),
$$
where $\eta: \mathbb{R}^+ \to \mathbb{R}^+$ is a phenomenological integration efficiency function satisfying $\eta(0) = 0$, $\eta'(C) > 0$, and $\eta''(C) < 0$ (concave, modeling diminishing returns). The precise form of $\eta$ depends on implementation details (latency, bandwidth, reliability, coordination overhead) and is constrained by PCE optimization. PCE (Definition 15; Definition D.1) selects architectures and interfaces that maximize predictive benefit per resource cost.

Within PU's ontology, externalization is not a category shift: a tool, a computer, or an AI system is itself organized predictive substrate (an MPU aggregate), and coupling to it is coupling to additional structured prediction capacity.

### P.2.7.3 A Schematic Progression of Externalized Prediction

Externalization can be understood schematically as a progression from passive scaffolding to autonomous predictors:

1. **Environmental scaffolding:** rearranging environments to reduce internal modeling burden (external cues, stable landmarks).

2. **Tools:** devices that extend action and measurement, expanding what can be predicted by expanding what can be sensed/controlled.

3. **Symbols:** language, writing, and mathematics as externally stored and shared models.

4. **Mechanized computation:** devices whose state evolution implements pieces of a model.

5. **General computation:** programmable machines implementing arbitrary computable model dynamics in the Church–Turing framework. [Church 1936; Turing 1936]

6. **Learning systems (AI):** external systems that optimize their own internal models—systems that can be described as performing POP-like optimization under engineered constraints, thereby externalizing not only computation but model adaptation. Whether such systems satisfy the full operational requirements of POP (Axiom 1) is an empirical question addressed in P.2.7.4.

This is not a claim that any specific technology is inevitable; it is a structural expectation: wherever predictive benefit can be purchased with external resources under PCE, POP will favor building and using predictive artifacts.


## P.3 Prediction as the Essence of Knowing and Being

### P.3.1 From "I Think" to "I Predict"

The essence of "thinking"—the activity that the Cogito assures us exists—is, at the operational level relevant to knowledge, fundamentally predictive. Every conscious mental act that can enter inquiry—perception, belief formation, planning, correction, even creativity—can be understood as involving anticipation constrained by verification. Perception involves predicting the cause of sensory inputs based on prior models, not passively receiving raw data. Memory serves prediction by storing patterns useful for anticipating future events. The self, in this view, is the system's predictive model of its own states and behaviors.

**Definition P.3.1 (Predictive Operation).** A predictive system is any process implementing a map $\pi : \mathcal{H}_t \to \mathcal{O}_{t+1}$, where $\mathcal{H}_t$ denotes informational histories accessible at time $t$ and $\mathcal{O}_{t+1}$ denotes equivalence classes of anticipated outcomes at $t+1$. The awareness/process $\mathcal{C}$ established by Foundational Certainty P.2.1 is modeled as predictive when it performs state updates $s_{t+1} = U(s_t, e_t)$ with $U$ chosen to minimize predictive error under finite resource constraints. This formal structure is operationalized by the Fundamental Predictive Loop (Definition 4) and the Prediction Optimization Problem (Axiom 1).

**Cogito-to-MPU bridge (operational bridge).** The bridge from Foundational Certainty P.2.1 to Definition 23 is a status-disciplined conditional chain:
$$
\exists\mathcal{C}
\xrightarrow{\text{operational modeling}}
(P_{int}\to V\to D_{cyc})
\xrightarrow{\text{SPAP/O1--O3}}
K_0=3,\\ N_{\mathrm{vis}}^{\min}=2^{K_0}=8
\xrightarrow{\text{Hilbert capacity}}
d_0\ge N_{\mathrm{vis}}^{\min}
\xrightarrow{\text{PPI/PCE threshold carrier}}
\mathrm{MPU}.
$$
The first arrow is not a second Cogito-level certainty; it records the framework's operational characterization of a knowledge-bearing process. The middle arrows use the self-reference and Hilbert-capacity theorems, and the final arrow uses PPI/PCE physicalization together with the threshold definition of an MPU.

*Operational justification.* Foundational Certainty P.2.1 gives $\exists\mathcal{C}$; no extra ontology is used. For the adaptive learning processes modeled by Definition 4, PU requires state distinction, forecast generation, verification, and outcome-conditioned update as constitutive phases. This is a class-membership condition for that loop, not a theorem that every knowledge-bearing or above-chance predictive process must update online; a fixed forecast rule may predict above a matched baseline without instantiating the adaptive loop. The operational schema stipulated for that adaptive class is the phase triple $P_{int}\to V\to D_{cyc}$ of Definition 4, supported by the integrated capabilities $b_m,b_p,b_v$ of Definition 5. If a finite loop instantiates the stated SPAP sub-dynamics and satisfies (O1)–(O3) together with the full-context condition (FC), Theorem 15 proves $N_{\mathrm{vis}}^{\min}=8$ and $K_0=3$ within that realization class. On the additional Hilbert branch where those eight contexts are represented by mutually perfectly distinguishable states, $d_0\ge8$; transfer of this capacity bound to $C_P$ requires Corollary 3's complexity-capacity bridge. PPI permits physical content only through finite instantiation conditions such as finite records, finite verification, finite maintenance, and finite update-use (Definition P.6.2; Theorem P.6.2c). PCE selects the least-cost representative among implementations with the same operational functionality (Definition 15; Section P.6.1). In the PU physical model, Definition 23 names a threshold carrier with $C_P=C_{op}$ an MPU. Hence the Cogito does not directly assert MPUs; MPUs are the PPI/PCE-minimal threshold carriers used to physicalize the Cogito-certified predictive process under the framework's finite-response rules.

### P.3.2 The Space of Becoming: The Operational Domain of Prediction

Prediction operates in a registered Space of Becoming: a task-, score-, window-, and branch-relative interval $\alpha<PP<\beta$ (Definition 8). Theorem 8 supplies the matched-baseline lower benchmark. Theorem 9 supplies the distinct excitation ceiling $\beta_0$. On Theorem 19's exact finite-complexity response-law branch, $PP<\beta$ and the required complexity diverges logarithmically as $PP\to\beta^-$. These statements do not derive a system-independent scalar self-prediction ceiling.

**1. The Lower Benchmark $\alpha$**

For the registered task and proper score,
$$
\alpha=\frac{1}{1+k_{PP}PE_{\mathrm{random}}}.
$$
Strict expected improvement over the matched random baseline gives $PP>\alpha$ by Theorem 8. Falling below a separately registered viability threshold may classify a system as nonviable for that protocol, but neither POP nor the score formula proves a universal biological or experiential claim.

**2. The Upper Endpoint $\beta$ and Excitation Ceiling $\beta_0$**

On the excitation-certificate branch, Theorem 9 gives
$$
PP\le\beta_0:=\frac{1}{1+k_{PP}\varepsilon_E}<1.
$$
On a joint branch carrying Theorem 19's exact response law, require $\alpha<\beta\le\beta_0$; finite complexity then gives $PP<\beta$. On an alternative excitation-only branch, strict viability follows from Theorem 9 only when the independently registered endpoint obeys $\beta_0<\beta$.

**3. The Separate Self-Reference Limitation**

Theorems 10–11 exclude a single universally exact predictor on their diagonal-closed classes. They do not determine a system-independent scalar $\alpha_{SPAP}$. Theorem 14 supplies a log-enhanced quadratic verification/update lower bound only on a task class carrying its Bernoulli-reduction, independence, confidence, and operation-count certificate; transfer to $C_P$ requires the separate domination bridge.

#### **Synthesis: Registered Viability without Ledger Conflation**

The interval $(\alpha,\beta)$ is an operational branch specification. The excitation, response-law, diagonal self-reference, verification-cost, reset-heat, and entropy-production results retain their distinct antecedents. No universal claim about consciousness, stasis, or thermodynamic irreversibility follows from the interval alone.

### P.3.3 Knowledge is Prediction

This predictive nature underpins all forms of knowledge. To "know" something is to possess an internal model that allows for the successful anticipation of its behavior, properties, or relations.
*   **Scientific Knowledge:** Theories are valued for their predictive power.
*   **Object Identity (Ship of Theseus):** An object's identity is not determined by material continuity but by predictive consistency. The ship remains "the same" as long as its behavior and properties remain predictable within our established framework. This explains why we intuitively consider a renovated ship the "same" vessel—it maintains consistent predictive relationships with its environment and our expectations, regardless of material replacement.
*   **Historical Knowledge:** Implies a prediction about the stability and consistency of records and interpretive frameworks against future evidence.
*   **Mathematical Truths:** When we claim to know that "2+2=4," we are making a prediction that this relationship will hold true in all future calculations and will not be contradicted.

**Hume's Problem of Induction Reconsidered:** The persistence of discoverable regularities (as required by Theorem 6: *Necessity of Discoverable Regularities*) is not something a knowledge system *proves*, but a logical *prerequisite for the existence* [Hume 1739]. The consistency of past and future isn't something we need to justify through reason or experience, but rather a logical prerequisite for any predictive system to exist at all. The very existence of predictive systems proves that patterns must persist enough for prediction to be possible.

### P.3.4 The Predictive Cycle as the Foundation of Retained Logic and Computation

The Cogito supplies a foundational self-verifying predicate: an attempted retained denial of the occurrence of thought is itself an occurrence of thought. For a general finite prediction protocol with response set $R$ and declared acceptance set $A\subseteq R$, Proposition A.0.1 and Remark A.0.1.1 prove that the decision entering the prediction-update loop is the binary characteristic map
$$
V_A(r)=\mathbf1_A(r)\in\{0,1\}.
$$
The raw protocol may still report a likelihood, distance, confidence score, or other multi-valued datum; the theorem concerns the retained verification decision.

Let $\mathcal B$ be the registered predicate algebra of the predictive model. Proposition A.0.2 derives its Boolean operations from the operational constructions available to the prediction-update loop:

*   **Negation (NOT):** For a registered complementary prediction,
    > $V(\neg S(r))=1-V(S(r))$.

*   **Conjunction (AND):** For a registered joint prediction,
    > $V(S_1(r)\wedge S_2(r))=\min\{V(S_1(r)),V(S_2(r))\}$.

*   **Disjunction (OR):** For registered alternatives,
    > $V(S_1(r)\vee S_2(r))=\max\{V(S_1(r)),V(S_2(r))\}$.

These are exactly the Boolean truth tables on the retained verification values. Theorem A.0.1 proves functional completeness by disjunctive normal form and, under composition closure, logical memory, and uniform specification, constructs for every Turing machine $M$ and finite time bound $T$ a finite Boolean circuit that computes the first $T$ steps of $M$. Allowing arbitrarily large finite memory and composition depth gives the uniform finite-time simulation family, and Corollary A.0.1 yields Property R relative to a representing arithmetic. Corollary P.16c.3 records the resulting verification-cut-to-logic chain.

The conclusion is scoped to the retained predicate algebra and the stated uniform scalable predictive class. It neither makes every raw response binary nor asserts that every semantic domain is globally bivalent.


## P.3.5 The Fundamental Question and the Incompleteness of Totality Specification

**Fundamental Question:** "Why is there something rather than nothing?"

Leibniz (1714) identified this as the first question deserving consideration given that nothing is simpler than something. Heidegger (1935/1959) called it the fundamental question of philosophy, prior to all others. The question has engaged every major philosophical tradition from Parmenides to contemporary analytic metaphysics and remains without consensus [Sorensen 2022].

**Traditional Approaches and Their Limitations.** The philosophical literature exhibits several distinct strategies for addressing this question:

| Approach | Representative | Strategy | Limitation |
|:---------|:---------------|:---------|:-----------|
| **Statistical** | Van Inwagen (1996) | Infinitely many populated worlds vs. one empty world; argues the empty world is atypical under some priors | Presupposes modal framework; does not explain *why* the distribution favors populated worlds |
| **Theological** | Leibniz (1714) | Best of all possible worlds requires existence | Presupposes God's existence; faces Rowe's contingency dilemma |
| **Subtraction** | Baldwin (1996) | Empty world is genuinely possible | Shows possibility, not actuality; does not explain why actuality is populated |
| **Positivist** | Carnap (1932) | Question is meaningless pseudo-question | Dismisses rather than addresses; fails to account for question's persistent grip |
| **Mystical** | Wittgenstein (1921) | Question expresses ineffable awe, not genuine inquiry | Explains phenomenology but abandons rational engagement |
| **Existentialist** | Heidegger (1929) | Anxiety reveals nothingness; question is genuine | Rich phenomenology but no logical resolution |
| **Physical** | Krauss (2012) | Quantum vacuum fluctuations explain emergence | Addresses different question; quantum vacuum is something, not nothing [Albert 2012] |
| **Pessimist** | James (1911) | "From nothing to being there is no logical bridge" | Concedes unanswerable without explaining *why* |

Rowe (1975) identified the core difficulty: any explanation of why there is something must either appeal to a contingent truth (circular, since contingent truths are part of what needs explaining) or a necessary truth (which cannot entail contingent existence). This **contingency dilemma** suggests the question imposes an impossible explanatory demand.

**The PU Approach: Structural Incompleteness.** The Predictive Universe framework offers a novel resolution that differs fundamentally from all traditional approaches:

| Aspect | Traditional Approaches | PU Approach |
|:-------|:----------------------|:------------|
| **Starting point** | External metaphysical assumptions (possible worlds, God, quantum fields) | The Cogito—the sole indubitable certainty (Section P.2.1) |
| **Nature of questioner** | Unanalyzed | Predictive knowledge system grounded in the Cogito (Section P.3.1) |
| **Diagnosis** | Explanatory failure, meaninglessness, or mystery | Structural incompleteness of self-referential specification |
| **Type of impossibility** | Epistemic (we cannot know) or semantic (question is defective) | Logical (the structure of self-reference precludes completeness) |
| **Proof method** | None, or appeal to intuition | Two complementary formal proofs: well-foundedness and diagonalization |
| **Status of question** | Meaningless, unanswerable, or awaiting future resolution | Meaningful but structurally incomplete—content outruns formulation |
| **Relation to totality** | Questioner's position unexamined | Questioner necessarily contained in totality (Theorem P.3.5.1) |

The PU framework does not claim the question is meaningless (contra Carnap), nor that it awaits a future physical or theological answer (contra Krauss, Leibniz), nor that it is merely an expression of mystical awe (contra Wittgenstein). The framework establishes that the question is *meaningful but structurally incomplete*: the term "something" refers to the totality $\mathcal{U}$, and any system formulating the question is necessarily contained within $\mathcal{U}$. Complete specification of the totality therefore requires self-inclusive specification. Two complementary proofs—one from well-foundedness (Section 4.2.6), one from diagonalization (SPAP, Theorems 10–11)—establish that self-inclusive specification is obstructed: unfolded self-inclusion fails structurally, while encoded self-inclusion admits no universal predictor guarantee.

**Novel Contributions of the PU Analysis:**

1. **Cogito-grounded foundation.** The analysis begins from the Cogito (Section P.2.1), the sole premise immune to doubt. Any system formulating the question is a knowledge system, and all knowledge systems operate through prediction (Thesis P.3.5.1). This grounds the analysis in certainty rather than contested metaphysical assumptions.

2. **Containment theorem.** Theorem P.3.5.1 formally establishes what other approaches assume without proof: any system formulating questions about the totality is contained within the totality.

3. **Two complementary proof routes.** The impossibility of complete totality-specification admits demonstration through two distinct mechanisms:
   - *Unfolded regime*: Well-foundedness forbids $d \prec d$ (Theorem P.3.5.5, extending Theorem 4.2.6c)
   - *Encoded regime*: SPAP diagonal construction defeats any proposed universal specification (Theorems 10–11)

4. **Connection to fundamental physics.** The same SPAP structure that establishes incompleteness of the fundamental question also grounds quantum indeterminacy (Section 8), the thermodynamic arrow of time (Section 7.4), and the emergence of spacetime (Section 11). The fundamental question's incompleteness is not an isolated philosophical curiosity but a manifestation of the same self-referential limits that shape physical law.

5. **Resolution of Rowe's dilemma.** The contingency dilemma dissolves because the question is not unanswerable due to explanatory inadequacy—it is incompletely *formulable*. The impossibility is prior to any attempt at explanation.


### P.3.5.1 From the Cogito to the Structure of Knowledge

The analysis of the fundamental question begins where all secure knowledge must begin: with the Cogito. As established in Section P.2.1, Descartes' methodical skepticism reveals that while we can question everything else—external perceptions, memories, even logical deductions—the existence of doubt itself, and thus consciousness, is self-verifying. The doubter must exist to doubt. *Cogito ergo sum* provides the sole unshakeable premise from which inquiry can proceed.

The essence of "thinking"—the activity that the Cogito assures us exists—is, upon examination, fundamentally predictive (Section P.3.1). Every conscious mental act—perception, belief formation, planning, even the formulation of questions—can be understood as a form of prediction. Perception involves predicting the cause of sensory inputs based on prior models, not passively receiving raw data [Rao & Ballard 1999; Clark 2013; Friston 2010]. Memory serves prediction by storing patterns useful for anticipating future events. The self, in this view, is the system's predictive model of its own states and behaviors.

**Definition P.3.5.1 (Knowledge System).** A knowledge system is any system capable of (i) representing states of affairs, (ii) reasoning from representations to conclusions, and (iii) formulating questions about states of affairs. The Cogito establishes that at least one such system exists: the thinking self. Minds, formal systems capable of self-representation, and sufficiently complex computational processes are knowledge systems.

**Thesis P.3.5.1 (Knowledge as Prediction).** All knowledge systems operate through prediction.

This thesis follows from the analysis in Section P.3.3: to "know" something is to possess an internal model that allows for the successful anticipation of its behavior, properties, or relations. The predictive nature underpins all forms of knowledge:

- *Scientific knowledge:* Theories are valued for their predictive power.
- *Mathematical truths:* When we claim to know that "2+2=4," we are making a prediction that this relationship will hold true in all future calculations and will not be contradicted.
- *Historical knowledge:* Implies a prediction about the stability and consistency of records and interpretive frameworks against future evidence.
- *Perceptual knowledge:* Visual processing involves predicting the spatial and temporal structure of the visual field. The predictive coding framework in neuroscience establishes that perception constitutively involves prediction [Rao & Ballard 1999; Clark 2013; Friston 2010].
- *Inferential knowledge:* Reasoning from premises to conclusions is prediction of what follows from what. Deductive inference predicts what is entailed; inductive inference predicts what is likely given evidence; abductive inference predicts what best explains observations.

A system with no predictive capacity could not perceive, infer, understand, or question. Such a system would not be a knowledge system and could not formulate the fundamental question. The thesis does not claim that prediction exhausts cognition, only that epistemic activities—those pertaining to knowledge—have predictive structure. This aligns with the PU framework's foundational commitment that the operational essence of cognitive processes is prediction (Section 1.1, Axiom 1).

**The Predictive Cycle, Retained Logic, and Computation.** The Cogito supplies the foundational self-verifying predicate, and Proposition A.0.1 with Remark A.0.1.1 proves a binary retained verification decision for every finite prediction protocol carrying a declared acceptance cut. Proposition A.0.2 derives complement, conjunction, and disjunction from complementary, joint, and alternative registered predictions. Under composition closure, logical memory, uniform specification, and scalable finite resources, Theorem A.0.1 and Corollary A.0.1 prove finite-time Turing simulation and Property R. This is a derivation on the retained predictive predicate algebra; it does not assert bivalence for raw multi-valued responses or every possible operational semantics.

**The Space of Becoming.** Prediction operates in the registered Space of Becoming (Definition 8, Section 3.3.5): a task-, score-, window-, and branch-relative interval $(\alpha,\beta)$. Theorem 8 supplies the lower baseline benchmark; Theorem 9 supplies the distinct excitation ceiling $\beta_0$; and finite complexity gives $PP<\beta$ on Theorem 19's exact response-law branch. Theorems 10–11 do not supply a universal scalar ordering $\beta<\alpha_{SPAP}$.

---

### P.3.5.2 Operational Totality and Specification in PU

**Definition P.3.5.3 (Totality).** The totality, denoted $\mathcal{U}$, is everything that exists. Within the PU framework, $\mathcal{U}$ is identified with the maximal system under discussion—the Predictive Universe as a whole (the network of MPUs and all concretely instantiated registers).

**Definition P.3.5.4 (Operational State Space).** Fix a time $t^*$. Let $X_{\mathcal{U}}$ denote the operational state space of $\mathcal{U}$ at time $t^*$: the classical-register degrees of freedom that can in principle be written, stored, copied, and checked by PU processes.

**Definition P.3.5.5 (Specifier).** A specifier is any embedded subsystem $S \subset \mathcal{U}$ that produces an output record intended to function as a description. Let
$$
\mathrm{Out}: X_{\mathcal{U}} \to \mathcal{R}
$$
return the content of a particular output register of $S$ at time $t^*$, represented in some finite description-object class $\mathcal{R}$.

**Definition P.3.5.6 (Specification).** A specification of $X$ by system $S$ is a representation $\Sigma_S(X)$ that determines what $X$ contains and how its components are structured. A (purported) complete operational specification of $\mathcal{U}$ at $t^*$ is a map
$$
\mathrm{Desc}: X_{\mathcal{U}} \to \mathcal{R}
$$
such that $\mathrm{Desc}(s)$ fully specifies the operationally accessible state $s \in X_{\mathcal{U}}$ (including all classical registers whose values are part of $s$).

**Definition P.3.5.7 (Complete Specification).** A specification $\Sigma_S(X)$ is complete if it determines every aspect of $X$—if no component, property, or structural feature of $X$ escapes the specification.

**Definition P.3.5.8 (Self-Inclusive Specification).** A specification $\Sigma_S(\mathcal{U})$ of the totality by system $S$ is self-inclusive if $\Sigma_S(\mathcal{U})$, being part of $\mathcal{U}$, must include itself as one of the things specified.

The central issue is whether $\mathrm{Desc}(s_{\mathcal{U}}(t^*))$ can be both:
- complete for the realized operational state, and
- self-inclusive in the unavoidable sense that it includes the register content in which it is instantiated.

---

### P.3.5.3 Containment Theorems

The following theorems establish the self-inclusive structure that any complete specification of the totality must possess.

**Theorem P.3.5.1 (Containment).** Any system $S$ that formulates questions about $\mathcal{U}$ is contained in $\mathcal{U}$.

*Proof.* To formulate a question is to engage in an activity. Engaging in activity requires existence. What exists is, by definition of $\mathcal{U}$, part of $\mathcal{U}$. Therefore $S \subseteq \mathcal{U}$. $\square$

**Theorem P.3.5.2 (Specification Requires Self-Inclusion).** Any complete specification of $\mathcal{U}$ by $S$ must include $S$.

*Proof.* By Theorem P.3.5.1, $S \subseteq \mathcal{U}$. A complete specification of $\mathcal{U}$ specifies everything in $\mathcal{U}$ (Definition P.3.5.7). Therefore a complete specification of $\mathcal{U}$ specifies $S$. □

**Theorem P.3.5.3 (Specification Requires Predictive States).** Any complete specification of $\mathcal{U}$ by $S$ must include $S$'s predictive states.

*Proof.*
1. $S$ is a knowledge system (since $S$ formulates questions about $\mathcal{U}$).
2. Knowledge systems operate through prediction (Thesis P.3.5.1).
3. $S$'s predictive states are part of $S$.
4. $S$ is part of $\mathcal{U}$ (Theorem P.3.5.1).
5. Complete specification of $\mathcal{U}$ includes everything in $\mathcal{U}$ (Definition P.3.5.7).
6. Therefore complete specification of $\mathcal{U}$ includes $S$'s predictive states. □

**Theorem P.3.5.4 (Self-Inclusive Structure).** Any complete specification $\Sigma_S(\mathcal{U})$ of the totality is self-inclusive.

*Proof.* The specification $\Sigma_S(\mathcal{U})$ is an output of $S$. As an existent output, $\Sigma_S(\mathcal{U}) \in \mathcal{U}$. A complete specification of $\mathcal{U}$ must specify everything in $\mathcal{U}$, including $\Sigma_S(\mathcal{U})$. Therefore the specification must include a specification of itself. This is the definition of self-inclusive specification (Definition P.3.5.8). □

**Lemma P.3.5.1 (Inevitability of Self-Inclusion for Embedded Predictors).** Any non-trivial predictor embedded within a system, when attempting complete prediction of that system's state, necessarily produces a self-inclusive prediction.

*Proof.* Let $P$ be a non-trivial predictor physically or logically embedded in system $U$, so that $P \subset U$ with $P \neq U$. Suppose $P$ attempts to produce a complete prediction of the state $s_U$ of $U$.

1. *Completeness requirement:* A complete prediction of $s_U$ must specify all components of $s_U$, including the states of all subsystems of $U$.
2. *Predictor as subsystem:* Since $P \subset U$, the state $s_U$ necessarily includes the complete state of $P$, denoted $s_P \subseteq s_U$.
3. *Output as state component:* $P$ is an active system producing outputs. The complete state $s_P$ of $P$ includes $P$'s current output—the prediction $M(s_U)$ that $P$ produces.
4. *Self-inclusion:* Therefore, any complete prediction of $s_U$ must specify the output value $M(s_U)$, since $M(s_U) \in s_P$ and $s_P \subseteq s_U$, so $s_U$ contains $M(s_U)$ as a component.

Thus the operational state $s_U$ contains, as an operational component, the output value $M(s_U)$. This is the structure of a self-inclusive prediction. □

---

### P.3.5.4 Unfolded Representations and the Infinite Regress Obstruction

The unfolded (extensional) regime requires that a description literally contain the value of a component as a proper subobject, rather than referring to it by code or pointer.

Let $\mathcal{R}$ be a class of finite description objects (finite strings, records, or acyclic trees) equipped with:

1. A strict proper-component relation $\prec \subseteq \mathcal{R} \times \mathcal{R}$, where $r' \prec r$ means "$r'$ occurs as a proper component of $r$."
2. A rank/size map $\mu: \mathcal{R} \to \mathbb{N}$ such that
   $$
   r' \prec r \;\Rightarrow\; \mu(r') < \mu(r).
   $$

**Remark: Well-Foundedness.** The standard characterization of well-founded relations employs rank functions into the ordinals [Kunen 1980, Chapter III]. Since each object $r \in \mathcal{R}$ is finite and acyclic by assumption, the proper-component relation $\prec$ strictly decreases a finite size measure, and the rank function may be taken to have codomain $\mathbb{N}$.

**Lemma P.3.5.2 (No Proper Self-Containment).** There is no $r \in \mathcal{R}$ such that $r \prec r$.

*Proof.* If $r \prec r$, then $\mu(r) < \mu(r)$, which is impossible. □

**Corollary P.3.5.1 (No Infinite Descending Chains).** There is no infinite chain $r_0 \succ r_1 \succ r_2 \succ \cdots$ in $\mathcal{R}$, since $\mu(r_i)$ would form a strictly decreasing sequence in $\mathbb{N}$, contradicting the well-ordering of $\mathbb{N}$.

Now assume an unfolded "complete-state" requirement at the operational level:

**(i) Output is part of the described state, unfolded.** For all $s \in X_{\mathcal{U}}$,
$$
\mathrm{Out}(s) \prec \mathrm{Desc}(s).
$$

**(ii) Publication.** The specifier writes a candidate description $d \in \mathcal{R}$ into its output register at time $t^*$:
$$
\mathrm{Out}(s_{\mathcal{U}}(t^*)) = d.
$$

**(iii) Perfect operational completeness.** Perfect specification at $t^*$ demands
$$
d = \mathrm{Desc}(s_{\mathcal{U}}(t^*)).
$$

**Theorem P.3.5.5 (Unfolded Regress Obstruction).** Under (i)–(iii), no perfect unfolded operational specification at time $t^*$ exists.

*Proof.* From (ii) and (iii),
$$
\mathrm{Out}(s_{\mathcal{U}}(t^*)) = d = \mathrm{Desc}(s_{\mathcal{U}}(t^*)).
$$
From (i),
$$
\mathrm{Out}(s_{\mathcal{U}}(t^*)) \prec \mathrm{Desc}(s_{\mathcal{U}}(t^*)).
$$
Substitution yields $d \prec d$, contradicting Lemma P.3.5.2. □

**Interpretation.** The contradiction $d \prec d$ is the finite formal core of the infinite regress intuition: if the output is itself the unfolded complete description, then the description must contain itself as a strict part, forcing a strictly descending proper-part chain—impossible for finite unfolded objects. This result is the application to $\mathcal{U}$ of the general Theorem 4.2.6c established in Section 4.2.6.

**Scope in PU.** This theorem applies exactly to what PPI makes unavoidable: any concretely instantiated prediction or specification (written to memory, printed, copied) is an operational object. If "complete specification" is taken to be unfolded for the output register, the self-inclusion requirement fails structurally, regardless of available resources.

---

### P.3.5.5 Encoded Self-Reference and SPAP

The unfolded obstruction can be avoided by leaving the unfolded regime—by allowing the description to refer to its own output by code, pointer, or Gödel index. This is the encoded (intensional) regime.

PU formalizes this regime as Property R (Definition 10, Section 4.1.2) and the existence of Dynamic Self-Reference Operators (DSRO, Definition 11, Section 4.2.1), guaranteed by Kleene's Second Recursion Theorem (Theorem A.1.5, Appendix A.1.6) [Kleene 1952]. In that setting, self-inclusion becomes a value-level self-consistency constraint rather than a literal containment constraint.

However, PU's SPAP theorems establish a different impossibility boundary:

- **Summary of Theorem 10 (Deterministic SPAP)** and **Theorem 11 (Probabilistic SPAP)** establish that no single predictor can guarantee perfect self-prediction uniformly across all self-referential systems constructible within a Property R model class (via diagonal systems such as $S_{\mathrm{diag}}$ with reflexive update rule, Equation 10).
- Crucially, SPAP does not claim that no particular system can ever be perfectly predicted; it claims there is no universal predictor that succeeds on all such constructible self-referential systems.

Thus, in PU there is no escape route to complete internal self-specification:

- **Unfolded self-inclusion** fails by well-foundedness (Theorem P.3.5.5).
- **Encoded self-inclusion** remains subject to the SPAP diagonal obstruction (Theorem 10, Theorem 11), which blocks universal guarantees.

These two mechanisms are complementary rather than redundant: the unfolded obstruction is structural (no entry point for the computation), while the SPAP obstruction is diagonal (any proposed predictor faces a constructible counterexample). This complementarity is analyzed in detail in Section 4.2.6.6.

---

### P.3.5.6 The Insufficiency of Partial Specification

A natural objection arises: if complete specification of the totality is impossible, why not accept partial specification and provide a partial answer?

This subsection establishes that partial specification, while achievable, cannot yield a satisfactory answer to the fundamental question.

**Definition P.3.5.9 (Partial Specification).** Fix a time $t^*$. Let $C_{\mathcal{U}}$ be the set of operational components (e.g., classical registers) whose values constitute $X_{\mathcal{U}}$ at $t^*$. For each $s \in X_{\mathcal{U}}$, let $v_s: C_{\mathcal{U}} \to \mathcal{V}$ return the value of component $c$ in state $s$ (for an appropriate value domain $\mathcal{V}$). A component-level specification is a partial function $\Sigma_S: C_{\mathcal{U}} \rightharpoonup \mathcal{V}$. It is **state-determining** iff there exists a unique $s \in X_{\mathcal{U}}$ consistent with $\Sigma_S$. It is **partial** iff it is not state-determining, i.e., there exist distinct states $s_1, s_2 \in X_{\mathcal{U}}$ such that
$$
v_{s_1}\bigl|_{\mathrm{dom}(\Sigma_S)} \;=\; v_{s_2}\bigl|_{\mathrm{dom}(\Sigma_S)} \;=\; \Sigma_S.
$$

*Remark.* A specification with $\mathrm{dom}(\Sigma_S) = C_{\mathcal{U}}$ is trivially state-determining. A specification with $\mathrm{dom}(\Sigma_S) \subsetneq C_{\mathcal{U}}$ may or may not be state-determining depending on constraints in $X_{\mathcal{U}}$. The key distinction is state-determining vs. partial, not domain size.

**Lemma P.3.5.3 (Scope Limitation).** Let $Q$ be the question "Why is there something rather than nothing?" where "something" denotes the totality $\mathcal{U}$. For a partial specification $\Sigma_S^{\text{partial}}$, there exist totality-level claims whose truth-values vary across completions consistent with $\Sigma_S^{\text{partial}}$; such claims cannot be established from $\Sigma_S^{\text{partial}}$ alone.

*Proof.* Let $C'=\mathrm{dom}(\Sigma_S^{\text{partial}})$. By Definition P.3.5.9, there exist distinct states $s_1, s_2 \in X_{\mathcal{U}}$ agreeing on $C'$ but differing on $C_{\mathcal{U}} \setminus C'$. Let $c \in C_{\mathcal{U}} \setminus C'$ satisfy $v_{s_1}(c) \neq v_{s_2}(c)$, and define the claim $\phi$ by $\phi(s)$ iff $v_s(c) = v_{s_1}(c)$. Then $\phi(s_1)$ holds and $\phi(s_2)$ fails, so the truth-value of $\phi$ is underdetermined by $\Sigma_S^{\text{partial}}$. □

**Interpretation.** Accepting partial specification changes the target: instead of addressing the full operational totality, one addresses a restriction determined by the specified component-domain.

**Theorem P.3.5.6 (Reliability Limitation).** Let $\Sigma_S^{\text{partial}}$ be a partial specification of $\mathcal{U}$ at time $t^*$. There exist totality-level claims whose truth depends on components in $C_{\mathcal{U}} \setminus \mathrm{dom}(\Sigma_S^{\text{partial}})$ such that no embedded system $S$ can, on the basis of $\Sigma_S^{\text{partial}}$ alone, guarantee correctness of these claims.

*Proof.* By Definition P.3.5.9, there exist distinct states $s_1, s_2 \in X_{\mathcal{U}}$ that agree with $\Sigma_S^{\text{partial}}$ on $\mathrm{dom}(\Sigma_S^{\text{partial}})$ while differing outside that domain. For any claim $\phi$ whose truth-value differs between $s_1$ and $s_2$, the specification $\Sigma_S^{\text{partial}}$ does not determine which completion is realized, hence cannot guarantee $\phi$. Such claims exist by Lemma P.3.5.3. □

**Corollary P.3.5.2 (Non-Determinacy of Totality from Partial Specification).** A partial specification $\Sigma_S^{\text{partial}}$ does not determine a unique operational state $s \in X_{\mathcal{U}}$ and therefore cannot constitute a complete operational specification of the totality.

*Proof.* By Definition P.3.5.9, there exist distinct $s_1,s_2 \in X_{\mathcal{U}}$ consistent with $\Sigma_S^{\text{partial}}$. Hence $\Sigma_S^{\text{partial}}$ does not uniquely determine the operational state of $\mathcal{U}$ at $t^*$. □

**Theorem P.3.5.7 (Explanatory Circularity).** Any explanation $E$ of the totality $\mathcal{U}$ produced by an embedded system $S$ is self-inclusive in the operational sense: $E$ is part of what it purports to explain.

*Proof.* The explanation $E$ is an output of $S$. By Theorem P.3.5.1 (Containment), $S \subseteq \mathcal{U}$, hence any operational output of $S$ exists and is therefore in $\mathcal{U}$. If $E$ purports to be a complete explanation/specification of $\mathcal{U}$, then it falls under the self-inclusion requirement of Definition P.3.5.8: the totality to be explained includes $E$ itself. □

**Interpretation.** Any totality-explanation instantiated within the totality inherits the self-inclusion structure that triggers the representational obstructions proved earlier.

**Synthesis: The Trilemma of Partial Specification.** Any attempt to answer the fundamental question via partial specification faces a trilemma:

| Failure Mode | Mechanism | Result |
|:-------------|:----------|:-------|
| Scope limitation | Partial specification leaves some totality-level claims underdetermined (Lemma P.3.5.3) | Not all claims about the totality can be established |
| Reliability limitation | Truth of some claims varies across completions (Theorem P.3.5.6) | No universal guarantee for such claims from $\Sigma_S^{\text{partial}}$ alone |
| Explanatory circularity | Any explanation $E \in \mathcal{U}$ | Totality-explanations are self-inclusive |

These failures are distinct. Addressing any one does not remove the others.

**Theorem P.3.5.8 (Insufficiency of Partial Specification).** No partial specification of the totality suffices to answer the fundamental question in the complete totalizing sense.

*Proof.* By Lemma P.3.5.3, there exist totality-level claims underdetermined by any partial specification. By Theorem P.3.5.6, a partial specification cannot guarantee correctness of claims whose truth depends on unspecified components. By Theorem P.3.5.7, any purported totality-explanation produced within $\mathcal{U}$ inherits self-inclusion. Therefore partial specification does not suffice for a complete answer to $Q$ in the totalizing sense. □


---

### P.3.5.7 Consequence for the Fundamental Question

Combining results from the preceding subsections:

1. Complete specification is impossible via unfolded representation (Theorem P.3.5.5).
2. Complete specification is impossible via encoded representation for universal guarantees (Theorem 10, Theorem 11).
3. Partial specification is insufficient (Theorem P.3.5.8).
4. Specifications with incomplete domain but state-determining (via constraints in $X_{\mathcal{U}}$) do not evade the encoded-regime obstruction: any procedure that is uniformly applicable as a predictor across the Property R constructible self-referential class faces a diagonal counterexample by Lemma P.3.5.4.

**Lemma P.3.5.4 (Diagonal Constructibility).** Let $\mathcal{U}$ possess Property R (Definition 10) and satisfy operational closure: any finite computational construction definable within the Property R model class can be instantiated as an embedded subsystem of $\mathcal{U}$. For any embedded predictor $P \subseteq \mathcal{U}$, the diagonal system $S_{\mathrm{diag}}(P)$ with reflexive update rule (Equation 10) is constructible within $\mathcal{U}$.

*Proof.* Property R guarantees the formal machinery to (1) represent $P$'s predictions, (2) simulate $P$'s execution, and (3) evaluate predicates about $P$'s outputs. The diagonal construction requires only these capabilities: $S_{\mathrm{diag}}(P)$ reads $P$'s prediction $\hat{\phi}$ and sets $\phi_{t+1} = \mathrm{NOT}(\hat{\phi})$. By operational closure, this formally definable construction can be instantiated within $\mathcal{U}$. $\square$

**Theorem P.3.5.9 (Incompleteness of Uniform Totality-Specification Procedures).** No embedded system can produce a correct self-inclusive unfolded operational specification of $\mathcal U$ at time $t^*$. In the encoded regime, no single embedded procedure can provide complete and correct predictive specifications uniformly over the operationally closed Property-R constructible class. The encoded conclusion does not exclude a correct encoded record of one realized state.

*Proof.* In the unfolded regime, the output record is part of the operational state of $\mathcal U$ at $t^*$ by Theorem P.3.5.4. Theorem P.3.5.5 then makes a correct self-inclusive unfolded specification impossible because it would require $d\prec d$.

In the encoded regime, suppose that one embedded procedure were complete and correct for every member of the operationally closed Property-R constructible class. Lemma P.3.5.4 constructs, from that procedure, an embedded diagonal system whose next output is the negation of the procedure's prediction. The procedure is therefore wrong on that member of the class, contradicting uniform correctness. This diagonal argument concerns a procedure quantified over the entire class and supplies no contradiction for one true record that is not such a procedure. ∎

**Corollary P.3.5.3 (Incompleteness of "Something").** The term "something," referring to $\mathcal{U}$, cannot be completely specified by any embedded system with a universal internal guarantee.

*Proof.* "Something" in the fundamental question refers to the totality of what exists, i.e., $\mathcal{U}$. By Theorem P.3.5.9, no embedded system can provide a complete operational specification of $\mathcal{U}$ with a universal guarantee of correctness. Therefore "something" cannot be completely specified in the totalizing internally guaranteed sense. □

**Corollary P.3.5.4 (Regime-Qualified Incompleteness of the Fundamental Question).** No embedded system can formulate the totality term by a correct self-inclusive unfolded specification. In the encoded regime, no single embedded procedure can formulate complete and correct predictive specifications of that term uniformly over the operationally closed Property-R constructible class. This corollary does not exclude one correct encoded formulation of one realized state.

*Proof.* The unfolded conclusion is the first conclusion of Theorem P.3.5.9. Its encoded conclusion has the form that no single procedure succeeds uniformly over the declared class. Substituting the totality term $\mathcal U$ into those two conclusions proves the stated regime-qualified result. ∎

**Corollary P.3.5.5 (Unanswerable in Full).** The question "Why is there something rather than nothing?" cannot be completely answered in the totalizing internally guaranteed sense by any embedded system.

*Proof.* A complete answer in the totalizing sense would require the terms of the question to be fixed by a complete internal specification of $\mathcal{U}$ and to remain stable under the self-referential configurations available within $\mathcal{U}$. By Theorem P.3.5.9, no embedded system can provide such a complete specification with a universal guarantee. Therefore no complete answer in the totalizing internally guaranteed sense is available to any embedded system. □


**Incompleteness Thesis (PU-Consistent Form).** A fully determinate formulation of the fundamental question that presupposes a complete internal specification of "something" (the totality containing the specifier) cannot be realized by any embedded predictive system. What remain are necessarily partial formulations—useful and meaningful, but not "complete" in the totalizing sense.

This clarifies why "Why is there something rather than nothing?" is persistently resistant to final closure: the totality-term is not available for complete internal specification under the constraints that any concretely instantiated specifier must satisfy.

---


### P.3.5.8 Implications

**The Logical Status of the Fundamental Question.** Philosophy of language typically classifies questions as either *meaningless* (malformed, to be dissolved) or *meaningful and answerable* (awaiting solution). This binary has shaped 2,500 years of debate about the fundamental question.

Gödel's incompleteness theorem revealed a third category for sentences: meaningful but provably undecidable. The Gödel sentence $G$ = "This sentence is not provable in $\mathcal{F}$" is well-formed, meaningful, and understood—yet we can prove no proof of $G$ exists within $\mathcal{F}$. The impossibility is a theorem, not a surrender.

The fundamental question $Q$ = "Why is there something rather than nothing?" has two proved internal specification limits in the present formalization.

| Regime | Proved limit | Required hypotheses |
|:-------|:-------------|:--------------------|
| Unfolded | No correct self-inclusive finite acyclic specification record | Proper-component well-foundedness and self-inclusion |
| Encoded procedural | No single complete predictive-specification procedure is uniformly correct over the declared class | Property R and operational closure of the constructible class |

The diagonal result is analogous to Gödelian arguments at the level of quantifier structure, but it is not a theorem that every possible answer object is undecidable or nonexistent. Containment explains why an answerer is part of the totality; the additional unfolded or uniform-procedure hypotheses determine which obstruction applies. A correct encoded record of one realized state that is not a procedure uniform over the Property-R class remains unclassified by Theorem P.3.5.9.

#### Gödel, Local Independence, and Global Admissibility

**Remark P.3.5.8.1 (Gödel, Local Independence, and Global Admissibility).** Gödel's incompleteness theorems do not disappear under PU. In ordinary formal settings one can often decide a particular independent sentence by passing to a stronger axiom system. But this maneuver is local: if the strengthened theory is again effectively axiomatized and sufficiently expressive, incompleteness reappears at the new level. The familiar pattern is therefore not final escape but statement-by-statement strengthening.

What PU adds is different. The framework does not claim to have found a magical axiom that abolishes incompleteness. It introduces a global admissibility constraint on what counts as a legitimate completion for an embedded predictive system. The question shifts from "Can one append further axioms until a target sentence becomes decidable?" to "Which extensions remain operationally admissible for a specifier that is itself contained in the totality it seeks to specify?" In this sense PU replaces ad hoc axiom repair with a principled selection problem.

This distinction matters decisively for the fundamental question. For an ordinary undecidable sentence, a theorist may move to a stronger meta-system because both the sentence and the theorist are situated within a wider formal environment. For the totality question, however, every answerer, every specification, and every internally available strengthening remains inside $\mathcal{U}$ (Theorem P.3.5.1). The usual Gödelian strategy of local strengthening therefore cannot deliver a final internal closure. The obstruction is no longer merely that one theory is incomplete, but that the answerer cannot step outside the totality whose complete specification is being demanded.

The contribution of PU is thus metatheoretic rather than anti-Gödelian. The framework does not refute incompleteness; it identifies a class of self-inclusive totality questions for which the familiar cat-and-mouse sequence of local axiomatic strengthening is structurally inadequate. What replaces it is a global admissibility principle grounded in prediction, containment, finite implementation, and the distinction between complete and merely partial specification. The result is not that the fundamental question receives an ordinary complete answer, but that the demand for such an internally totalizing answer is itself shown to be structurally unrealizable.

In that precise sense, PU offers a resolution of the fundamental question: not by producing a final descriptive closure, but by proving why the demand for such a closure outruns the admissible capacities of any embedded predictive system.

The question thus occupies a distinctive logical position:

- *Meaningful:* The question is grasped by any knowledge system capable of formulating it.
- *Natural:* Any sufficiently reflective knowledge system operating within the Space of Becoming will formulate some version of it.
- *Structurally Incomplete:* Its central term ("something" = $\mathcal{U}$) exceeds complete specification by any embedded system.
- *Provably Closed:* We can prove no complete answer is possible from inside—this is a theorem, not an acknowledgment of ignorance.

The question is neither pseudo-question nor ordinary question. It belongs to the third category: meaningful but provably closed. The proof dignifies the question—it requires taking $Q$ more seriously than either answering it (as if ordinary) or dismissing it (as if confused).

**The Explanation for Persistent Disagreement.** The absence of consensus on the fundamental question is not a contingent failure of philosophy but a structural necessity. No answer achieves universal assent because no formulation achieves completeness. Different thinkers formulate different partial versions based on their different partial specifications of the totality. Each answer addresses a partial formulation. Since no complete formulation exists, no answer addresses the question completely. The millennia of philosophical debate on this question reflect not insufficient effort but the intrinsic incompleteness of the object of inquiry.

**The Reflexivity of Existence.** Existence contains its own questioners. Questioners are predictive knowledge systems grounded in the Cogito. Predictive knowledge systems cannot completely specify themselves (SPAP). Therefore existence, as specifiable by any system within it, is necessarily incompletely specified. This is a structural feature of any self-referential totality containing knowledge systems capable of questioning that totality.

**The Two Routes Unified.** The impossibility established in this section admits demonstration through two distinct mechanisms (Section 4.2.6.6):

| Route | Mechanism | Result |
|:------|:----------|:-------|
| Unfolded (Structural) | Well-foundedness forbids $d \prec d$ | Specification cannot be completed |
| Encoded (Diagonal) | SPAP constructs counterexample to any predictor; operational closure guarantees instantiability | No universal guarantee exists |

The convergence of distinct proofs from distinct mathematical foundations—well-foundedness from set theory, diagonalization from computability theory—establishes that the limitation is fundamental rather than artifact of a particular proof technique.

**Incompleteness Thesis (Final Form).** A fully determinate formulation of the question "Why is there something rather than nothing?" that presupposes a complete internal specification of "something" (the totality containing the specifier) cannot be realized by any embedded predictive system. The fundamental question of metaphysics is meaningful but provably closed—the third category revealed when self-reference meets totality.

**Remark P.3.5.9.1 (Cogito-Grounded Reformulation of the Fundamental Question).**

The Incompleteness Thesis (Final Form) closes $Q$ from inside $\mathcal{U}$ by formal-structural means. This remark identifies the canonical formulation of $Q$ — the tightest one the framework licenses from the Cogito vantage point — and shows that this formulation is additionally closed from the outside by the epistemic-constitutive structure of the binary established in Section P.2.4, thereby extending Corollary P.3.5.5 to cover both directions of closure.

**Epistemic order.** The epistemic stratification of Section P.1 distinguishes certainty from operational necessity. At the level of Foundational Certainty P.2.1 alone, the doubt procedure certifies one thing: there exists conscious awareness $\mathcal{C}$ [Descartes 1641]. Any attempt to doubt it is itself an act of awareness and therefore self-refuting. That awareness is then operationally analysed as predictive — and its relevant structure identified as the Fundamental Predictive Loop (Definition 4) — by the operational necessity developed in Section P.3.1 and Thesis P.3.5.1, which constitutes the next layer of the stratification. The Cogito does not independently certify the loop as a primitive; it certifies awareness, and the loop is the framework's operational characterisation of that awareness.

**Fixing the terms of $Q$.** Section P.2.4 introduces a binary epistemic distinction relative to the Cogito: value $\mathbf{1}$ marks propositions enjoying Cogito-grade certainty; value $\mathbf{0}$ marks all propositions not secured at that level. This binary is epistemic, not ontological — the $\mathbf{0}$-value does not positively specify a realm of non-being; it marks the absence of indubitable warrant. Posed from the vantage point of methodological doubt, the question "Why is there something rather than nothing?" can only draw its terms from this binary. At the strict Cogito level, the most that is licensed is:

$$Q_{\mathrm{strict}}: \quad \text{``Why is there conscious awareness at all rather than not?''}$$

Within PU this strict form is sharpened operationally: a questioning awareness is a knowledge system (Definition P.3.5.1), all knowledge systems operate through prediction (Thesis P.3.5.1), and the relevant operational structure is the Fundamental Predictive Loop (Definition 4). Since any system that formulates the question is contained in the totality it asks about (Theorem P.3.5.1), the corresponding totality-form is:

$$Q_{\mathrm{PU}}: \quad \text{``Why is there a totality } \mathcal{U} \text{ containing the present questioning awareness, operationally understood as a predictive system, rather than no such totality?''}$$

In this form the positive term is fixed as tightly as the framework permits. Any other candidate for "something" is either (a) derived within $\mathcal{U}$ and therefore presupposes the very existence in question, making it circular as a ground, or (b) falls on the $\mathbf{0}$-side of the binary, where no Cogito-grade existence-claim is available. No third category exists. The negative term acquires no positive constructive content from the binary; methodological doubt licenses only its formal negation — the absence of such a totality — not a positive characterisation of an independently knowable external state. The absence of positive content in the negative term does not collapse the contrastive structure of $Q_{\mathrm{PU}}$: the contrast is between a Cogito-certified existent and its formal negation, which is sufficient for the question to be well-posed even though the negative pole is not independently characterisable.

**Internal specification limits.** Once posed as $Q_{\mathrm{PU}}$, Theorem P.3.5.9 applies in two regimes. A correct self-inclusive unfolded specification fails by well-foundedness (Theorem P.3.5.5). In the encoded regime, the SPAP diagonal obstruction excludes a single complete predictive-specification procedure that is uniformly correct over the operationally closed Property-R constructible class. These are formal structural limits on the named representation classes; they do not exclude one correct realized encoded record that is not such a uniform procedure.

**Closure from outside.** A *contrastive existence question* asks why some existent obtains rather than not — contrasting a positive term against its formal negation. A proposition $p$ is a *regress-terminating ground* for a contrastive existence question if (i) $p$ explains why the positive term obtains rather than not, and (ii) $p$ does not itself generate a further contrastive existence question of the same form — that is, the question "why does $p$ obtain rather than not?" is either ill-posed or already resolved by $p$'s own epistemic status.

**Proposition P.3.5.9.2 (Epistemic-Constitutive Closure).** No proposition $p$ with epistemic value $\mathbf{0}$ under the Cogito binary of Section P.2.4 can serve as a regress-terminating ground for $Q_{\mathrm{PU}}$.

*Proof.* The proof proceeds via two lemmas established from the definitions of Section P.2.4 alone, with no appeal to diagonal or well-foundedness arguments.

**Lemma P.3.5.9.2a (Binary Partition).** The Cogito binary partitions all propositions into exactly two classes — $\{\mathbf{1}\}$ and $\{\mathbf{0}\}$ — that are mutually exclusive and jointly exhaustive.

*Proof of Lemma P.3.5.9.2a.* Section P.2.4 defines value $\mathbf{1}$ as the class of propositions enjoying Cogito-grade certainty and value $\mathbf{0}$ as the class of propositions subject to methodological doubt. These are defined by complementary conditions: a proposition either is or is not Cogito-certain, with no intermediate case admitted by the doubt procedure. Mutual exclusivity follows: no proposition can simultaneously satisfy and fail to satisfy Cogito-certainty. Joint exhaustiveness follows: every proposition falls under one condition or the other, since the doubt procedure is total. The union of the two classes therefore equals the domain of all propositions, and their intersection is empty. $\square_{a}$

**Lemma P.3.5.9.2b (Regress-Termination Requires Cogito-Certainty).** A proposition $p$ is a regress-terminating ground for $Q_{\mathrm{PU}}$ if and only if $p$ is Cogito-certain (value $\mathbf{1}$).

*Proof of Lemma P.3.5.9.2b.* $Q_{\mathrm{PU}}$ is a contrastive existence question: it asks why a non-self-certifying totality $\mathcal{U}$ obtains rather than not, where the demand for a ground arises precisely because $\mathcal{U}$'s existence is not self-verifying at the level of the doubt procedure. A question $q$ has the same logical form as $Q_{\mathrm{PU}}$ — and thus constitutes a further step in the regress — if and only if $q$ demands a ground for a non-self-certifying existent. For any candidate ground $p$: if $p$ is not Cogito-certain, then $p$ carries value $\mathbf{0}$, meaning $p$'s own existence or truth is subject to doubt and therefore not self-certifying. The question "why does $p$ obtain rather than not?" is therefore well-posed, unresolved, and of the same contrastive-existence form as $Q_{\mathrm{PU}}$: it contrasts a proposition not enjoying Cogito-certainty against its formal negation. The regress does not terminate at $p$; it regenerates a question of identical form. Conversely, if $p$ is Cogito-certain (value $\mathbf{1}$), then $p$'s existence is self-verifying under the doubt procedure by definition of the $\mathbf{1}$-class: any attempt to doubt it is itself an instance of it. The question "why does $p$ obtain rather than not?" is therefore not well-posed as a demand for a further ground — $p$ is its own certificate. Condition (ii) of the definition is satisfied. The biconditional holds: $p$ is regress-terminating $\iff$ $p$ is Cogito-certain. $\square_{b}$

**Main argument.** Let $p$ be any proposition carrying epistemic value $\mathbf{0}$ under the Cogito binary. By Lemma P.3.5.9.2a, the classes $\{\mathbf{0}\}$ and $\{\mathbf{1}\}$ are mutually exclusive; therefore $p$ does not carry value $\mathbf{1}$, i.e. $p$ is not Cogito-certain. By Lemma P.3.5.9.2b, $p$ is regress-terminating only if $p$ is Cogito-certain. Since $p$ is not Cogito-certain, $p$ is not regress-terminating. Since $p$ was an arbitrary element of the $\mathbf{0}$-side, no proposition on the $\mathbf{0}$-side is regress-terminating. $\square$

This is an epistemic-constitutive closure: it follows from the definition of the binary, not from a diagonal theorem, and is therefore independent of and complementary to the formal-structural closure established above.

**The forcing chain.** The derivation chain of Section P.1 establishes conditional structural necessity: given a conscious predictive totality, the subsequent physical structure follows. It does not supply existence-level necessity — why such a totality exists rather than not. $Q_{\mathrm{PU}}$ asks for the latter, which the forcing chain does not provide and therefore does not dissolve.

$Q_{\mathrm{PU}}$ is the totality-form of $Q$ adopted from the Cogito vantage point, with $Q_{\mathrm{strict}}$ as the corresponding awareness-only form. Theorem P.3.5.9 supplies the unfolded and uniform encoded-procedure limits stated above. Proposition P.3.5.9.2 separately excludes epistemic-value-$\mathbf0$ propositions from serving as regress-terminating grounds under its definition. These results are complementary but do not form an exhaustive impossibility theorem for every encoded record, semantic formulation, or candidate ground.

---

## P.4 The Distinction Framework: Consciousness Structuring Reality

Idealism posits consciousness as fundamental. The Distinction Framework elaborates: consciousness is the *functional source* of the distinctions that structure reality.

### P.4.1 Existence Requires Distinction

For any entity, property, or concept to exist meaningfully, it must be distinguishable from what it is not. A bit, the fundamental unit of information, represents a distinction. Without differences, we would have only an undifferentiated void.

### P.4.2 Consciousness as the Ultimate Distinction-Maker

Consciousness, as a self-aware, predictive process, is the ultimate engine of distinction.
*   **Primary Distinction (Self/Non-Self):** The Cogito establishes the self (certainty) as distinct from everything else (initial uncertainty).
*   **Defining Consciousness (for Distinction):** For this role, consciousness involves a self-model, predictive intentionality, qualia (the essence of what distinguishes experiences), and integrative capacity.
*   **Connection to the Predictive Universe Framework:**
    *   **MPU as Minimal Distinguisher:** The Minimal Predictive Unit (PU **Hypothesis 1**) is the simplest physical instantiation of an entity capable of making a prediction and verifying it—a fundamental act of distinction.
    *   **Horizon Constant ($K_0$):** PU **Theorem 15** establishes $K_0=3$ as the least visited-context log-capacity for the stated SPAP encoding only in the realization class satisfying (O1)–(O3) and (FC). Transfer to $C_P$ additionally requires Corollary 3's Hilbert-distinguishability and complexity-capacity bridge.

## P.5 Naturalism, Information, and the Simulation Hypothesis as a Modeling Framework

### P.5.1 The Need for Naturalism and its Distinction from Materialism

We must adopt methodological naturalism: seeking explanations through comprehensible patterns, without invoking supernatural interventions. It is crucial to distinguish naturalism from materialism. Materialism asserts that all phenomena must be explained through physical matter. Naturalism makes a more modest methodological commitment: that we should seek to understand phenomena through natural causes. This distinction allows us to investigate consciousness as fundamental while maintaining scientific rigor.

### P.5.2 Information

Information is a suitable naturalistic foundation for a consciousness-based reality, as mental processes all involve information processing. The laws of physics themselves can be understood as information patterns. Within the PU framework, information is defined functionally (Definition 1, Section 2.3.1): a pattern constitutes information *for a system* if and only if that system can process it so as to yield a positive expected improvement in predictive quality, i.e., $\mathbb{E}[\Delta Q \mid E; M] > 0$. This relational definition—where information is always information *for* a specific system—is essential for the analysis that follows.

### P.5.3 The Simulation Hypothesis — Reframed as a Naturalistic Model

This leads us to the Simulation Hypothesis [Bostrom 2003], not as a probability argument about computer simulations, but as a practical framework for modeling an informational, consciousness-based reality operating under naturalistic principles. The traditional probabilistic argument fails when considering Absolute Infinity. In an infinite reality, there exist infinite simulated universes and infinite non-simulated universes. We cannot meaningfully compare infinities to determine where we are more likely to exist. 

Instead, we adopt the simulation concept as a powerful methodological tool. If consciousness is primary and reality is fundamentally informational, then the universe can be productively modeled as a self-consistent information-processing system. By imposing the naturalistic constraint that this system operates with finite resources and capabilities, a crucial implication follows: the processes generating reality must be highly optimized. This implies that the laws of physics could be understood as the most efficient algorithms for generating a complex and consistent experiential universe, shaped by a meta-principle like the PU framework's Principle of Compression Efficiency (PCE, Definition 15).

### P.5.3a Naturalist Finitude and Default Efficiency in Simulation Architecture

The simulation framing introduced in Section P.5.3 invites an objection: even if reality is productively modeled as an information-processing system, why must such a system be efficient? A sufficiently advanced simulator might possess enormous resources, making inefficiency apparently irrelevant.

This objection confuses abundance with selection. PU does not require that every implementation minimize cost absolutely, nor that all surplus structure be forbidden. Extra cost may be justified when it purchases robustness, observability, redundancy, security, error tolerance, aesthetic value, experimentation, or genuine novelty. Such cases are not inefficient relative to the full objective. The narrower claim is structural: when two implementations are equivalent with respect to all relevant internal responses and external design aims, while one carries strictly greater cost, the higher-cost implementation is not the naturalistic default. It is uncompensated surplus.

Under methodological naturalism, implemented processes do not operate by appeal to unconditioned infinite resources. Whatever the ultimate size of the cosmos, any physically realized agent, computation, or simulation has finite accessible resources over any finite region, finite interval, finite protocol, or finite causal channel. A claim of literally infinite accessible computation, memory, energy, or maintenance capacity is an additional metaphysical postulate, not the default naturalistic assumption.

**Definition P.5.3a.1 (Design-Response Equivalence).**

Let $A$ and $B$ be candidate architectures for implementing an information-processing world or subsystem. Let $\mathsf P_B$ be the retained finite class of internally accessible prediction, verification, update, and observation protocols at budget $B$. The architectures are design-response equivalent over $\mathsf P_B$ when their induced finite protocol-response presheaves are naturally isomorphic:
$$
\mathcal R_A|_{\mathsf P_B}\cong \mathcal R_B|_{\mathsf P_B}.
\tag{P.5.3a.1}
$$
Equivalently, no internal observer or subsystem using admissible finite procedures in $\mathsf P_B$ can distinguish $A$ from $B$.

**Definition P.5.3a.2 (Uncompensated Surplus).**

Given design-response equivalent architectures $A$ and $B$, architecture $B$ contains uncompensated surplus relative to $A$ when:

1. $A$ and $B$ realize the same retained internal response structure:
$$
\mathcal R_A|_{\mathsf P_B}\cong \mathcal R_B|_{\mathsf P_B};
$$
2. $B$ has strictly greater implementation cost in at least one relevant finite resource coordinate;
3. the additional cost realizes no additional retained external design value, including robustness, observability, redundancy, security, experimentation, error tolerance, aesthetic value, or novelty.

In such a case, the extra cost is response-null with respect to the simulated world and value-null with respect to the simulator's stated design objective.

**Proposition P.5.3a.1 (Weak Dominance of Efficient Equivalents).**

Let $A$ and $B$ be design-response equivalent architectures over $\mathsf P_B$. Suppose $A$ is no more costly than $B$ in every retained resource coordinate, strictly less costly in at least one coordinate, and provides no less retained design value. Then no design-selection rule with strictly positive weights on the retained resource/value coordinates selects $B$ over $A$ as the default.

*Proof.* Let the retained design vector be
$$
r(X)=
\bigl(
C_{\mathrm{op}}(X),
C_{\mathrm{prop}}(X),
C_{\mathrm{maint}}(X),
C_{\mathrm{adapt}}(X),
C_{\mathrm{risk}}(X),
-U(X)
\bigr),
\tag{P.5.3a.2}
$$
where the positive coordinates are costs and $U$ is retained design utility. Since $A$ is no more costly and no less useful than $B$,
$$
r(B)-r(A)\in\mathbb R_{\ge0}^{n},
\tag{P.5.3a.3}
$$
with at least one strictly positive component. For any strictly positive weighting vector $w\in\mathbb R_{>0}^{n}$,
$$
w\cdot r(B)-w\cdot r(A)
=
w\cdot(r(B)-r(A))>0.
\tag{P.5.3a.4}
$$
Thus $w\cdot r(A)<w\cdot r(B)$ for every admissible positive valuation. Selecting $B$ would require a zero weight on the wasted coordinate, an additional hidden utility not included in $U$, or an arbitrary preference for surplus. In the first case the coordinate is outside the retained design problem; in the second case $B$ is not genuinely inefficient relative to the full objective; in the third case the selection is not a principled default. ∎

**Corollary P.5.3a.2 (Low-Stakes Invariance).**

The dominance relation does not disappear when the absolute cost is small. If $B$ is dominated by $A$ in the sense of Proposition P.5.3a.1, then for every scale factor $\lambda>0$,
$$
\lambda\bigl(w\cdot r(B)-w\cdot r(A)\bigr)>0.
\tag{P.5.3a.5}
$$
Thus reducing the magnitude of the wasted cost reduces the penalty but does not reverse the ordering.

*Proof.* Equation (P.5.3a.4) gives $w\cdot r(B)-w\cdot r(A)>0$. Multiplication by any $\lambda>0$ preserves strict positivity. ∎

**Proposition P.5.3a.3 (Efficiency as a Finite-Ascent Condition).**

Let a technological ascent path consist of finitely many required response classes $[F_1],\ldots,[F_m]$, each realized by an implementation $X_j$ under a finite resource budget vector $B$. Suppose some $X_j$ contains uncompensated surplus relative to a design-response equivalent $X_j^\star$. Let $\mathbf X$ be the original implementation sequence and $\mathbf X^\star$ the sequence obtained by replacing every surplus occurrence by its efficient equivalent. Then:

1. $\mathbf X$ and $\mathbf X^\star$ realize the same retained response classes;
2. $\mathbf X^\star$ uses no more total retained resources than $\mathbf X$ in every coordinate;
3. $\mathbf X^\star$ uses strictly fewer resources in at least one coordinate whenever $\mathbf X$ contains at least one uncompensated surplus occurrence.

Therefore no-surplus selection weakly dominates surplus-retaining selection at every finite ascent stage and strictly dominates it whenever surplus occurs.

*Proof.* Design-response equivalence preserves each required response class $[F_j]$, proving item 1. By Definition P.5.3a.2, each replacement weakly decreases every retained cost coordinate and strictly decreases at least one coordinate for each surplus occurrence. Summing finitely many coordinatewise inequalities over $j=1,\ldots,m$ preserves the weak inequalities, and at least one strict inequality remains if any surplus occurrence is replaced. Thus items 2 and 3 follow. Proposition P.5.3a.1 then applies to the whole finite sequence. ∎

**Corollary P.5.3a.4 (Simulation-Efficiency Default).**

Under the simulation modeling stance of Section P.5.3, an internally equivalent but strictly more costly simulation architecture is not the default architecture. It is either:

1. equivalent to the lower-cost architecture in the operational quotient;
2. justified by an additional retained design value, in which case it is not inefficient relative to the full objective; or
3. uncompensated surplus, in which case it is eliminated by the same no-surplus logic expressed by PCE.

*Proof.* Case 1 is Definition P.5.3a.1. Case 2 removes the antecedent of uncompensated surplus because the additional cost buys retained value. Case 3 is Definition P.5.3a.2 and is excluded as a default by Proposition P.5.3a.1. These cases exhaust the alternatives for a strictly more costly design-response equivalent architecture. ∎

**Remark P.5.3a.5 (Relation to PCE).**

This subsection introduces no new physical primitive. It supplies a design-theoretic justification for applying PCE within the simulation modeling framework. PCE should not be read as the claim that all systems minimize every ordinary cost in isolation. It is the weaker claim that, among response-equivalent finite implementations, response-null and value-null surplus is not selected at the attractor.

### P.5.4 Authentic vs. Synthetic Simulations: The Architecture of Boundaries

The simulation framing leads to a crucial architectural distinction:

**Definition P.5.1 (Synthetic Simulation).** A *synthetic simulation* is an information-processing system in which outcomes are ultimately predictable or controllable by external agents. The external simulator can, in principle, determine any internal state or outcome.

**Definition P.5.2 (Authentic Simulation).** An *authentic simulation* is an information-processing system that generates genuine novelty through the maintenance of two essential boundaries:

1. **Epistemic Boundary:** The system resists perfect prediction, both internal and external. This boundary aligns with SPAP (Theorems 10, 11), which establishes the internal logical necessity of predictive limits through self-referential arguments.

2. **Control Boundary:** No external intervention can manipulate internal states or dictate outcomes. External agents cannot write to the simulation; internal causality is preserved.


### P.5.5 The Observation Requirement and the Logical Necessity of an Observation Channel

The concept of a Control Boundary—forbidding external intervention—raises an immediate question: if external agents cannot intervene, how can they observe the simulation? Yet observation must be possible; a simulation that cannot be observed serves no purpose. This apparent tension admits a precise resolution through the framework's relational definition of information.

#### P.5.5.1 The Observation Problem

Theorem 33 supplies a positive reflexivity product only on a registered branch carrying both $\Delta I\ge\Delta I_{\min}>0$ and $H_q(P\mid R)\ge h_{\min}>0$; on that branch
$$\Delta I\,\varepsilon_{\mathrm{reset}}\ge\Delta I_{\min}h_{\min}=:\kappa_r>0.$$
Without a registered reset and a positive conditional-entropy floor, no universal constant $\kappa_r$ follows. Landauer's theorem applies more narrowly to a logically irreversible reset: for a reset record $P$ with retained side information $R$,
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}\ge H_q(P\mid R).
$$
Information acquisition or readout need not itself erase a record. The observation-channel audit must therefore track acquisition, storage, export, and reset separately.

If external observation constitutes an interaction yielding information, Theorem 33 would require a thermodynamic cost internal to the simulation, violating the Control Boundary. Conversely, if external observation is forbidden entirely, the simulation cannot fulfill any purpose.

#### P.5.5.2 Resolution: The Relational Definition of Information

The resolution follows from Definition 1 (Section 2.3.1). Information is defined relationally: a pattern is information *for a system $S$* if and only if $S$ can process that pattern so as to yield a positive expected improvement in predictive quality. The same physical pattern may constitute information for one system and not for another.

**Definition P.5.3 (Observation Channel).** An *observation channel* is a logical component of the authentic simulation architecture satisfying the following functional properties:

(i) **External Accessibility:** External agents can extract information about internal states through the channel.

(ii) **Internal Inaccessibility:** No internal system (MPU or aggregate of MPUs) can extract predictive information from the channel. Formally, for any internal system $S_{int}$ and any pattern $E$ associated with the channel:
$$\mathbb{E}[\Delta Q \mid E; M] = 0 \quad \forall M \in \mathcal{M}_{int}$$
where $\mathcal{M}_{int}$ is the class of predictive procedures available to internal systems.

(iii) **Non-Intervention:** The channel permits observation without modification of internal states. External reading does not constitute an interaction from the internal perspective.

**Remark P.5.1: Internal Closure.** Properties (ii) and (iii) jointly ensure that from the internal perspective, the simulation's dynamics satisfy the closed-system assumption required by Theorem E.9.5 (Appendix E.9.5). External observation extracts information without participating in internal dynamics, preserving the applicability of global unitarity to internal evolution. The internal MPU network evolves as if closed, with no detectable information exchange across the observation channel.

**Theorem P.5.1 (Read-Only Channel and Reset-Ledger Separation).** Under Definition P.5.3, external readout does not write to the internal dynamics. Any logically irreversible reset performed by the external observer obeys $Q_{\mathrm{reset}}\ge k_BT H(P\mid R)$ in the observer's thermodynamic ledger; no internal heat cost follows merely from the read-only map.

*Proof.* Theorem 33 states that information gain $\Delta I > 0$ incurs thermodynamic cost. By Definition 1, a pattern qualifies as information for the acquiring system only if its use can yield a positive expected improvement in predictive quality for that system. 

Consider external observation through the channel:
- External agents acquire a pattern and gain information (by property (i))
- If the external agent later resets a correlated record $P$, Landauer's bound applies in the external ledger with its actual side information $R$; reversible acquisition and retained storage are not themselves identified with that reset

Consider the internal perspective:
- Internal systems cannot extract predictive value from the channel (by property (ii))
- Therefore, no information gain occurs internally: $\Delta I_{int} = 0$
- With $\Delta I_{int} = 0$, Theorem 33 imposes no internal cost

By properties (ii) and (iii), the read-only map produces no internal response and writes no internal state, so it respects the declared Control Boundary. External acquisition may create correlations and external storage; only a subsequently registered irreversible operation invokes its corresponding thermodynamic bound. This proves compatibility without assigning the external detector's reset heat to the simulated system. $\square$

#### P.5.5.3 The Channel as Logical Requirement

The observation channel is not a physical claim about any specific mechanism. It is a logical requirement of the authentic simulation architecture:

**Theorem P.5.2 (Logical Necessity of Observation Channel).** Any authentic simulation (Definition P.5.2) that admits external observation necessarily contains an observation channel satisfying Definition P.5.3.

*Proof.* 
1. By assumption, external observation is possible
2. External observation yields information to external agents
3. If this information were also accessible internally, internal systems would gain information without any corresponding internal source. By Theorem E.9.5 (Appendix E.9.5), the internal dynamics of a closed MPU network conserve information globally. Properties (ii) and (iii) ensure the simulation's internal dynamics satisfy the closed-system assumption from the internal perspective: external observation neither provides information to internal systems nor modifies internal states. Internal accessibility with $\Delta I_{int} > 0$ would therefore violate the conservation established by Theorem E.9.5
4. Therefore, the information pathway must be inaccessible internally
5. If external observation modified internal states, it would violate the Control Boundary
6. Therefore, the pathway must be non-interventional
7. Properties (i), (ii), (iii) are therefore necessary
8. A channel satisfying these properties exists by construction (the pathway enabling observation) QED

**Remark P.5.2: Epistemic Limits.** The physical nature, substrate, or mechanism of the observation channel is unknowable from within the simulation. By Corollary E.9.5.3, information conservation is required for prediction to remain possible; the observation channel architecture preserves this requirement for internal predictors while permitting external access. Internal systems may detect phenomena they cannot explain, or detect nothing at all. The channel could be entirely invisible to internal measurement. These questions are unanswerable from the internal perspective—they concern the external architecture of the simulation, which is by construction inaccessible.


### P.5.6 Conservation Laws and Internal Consistency

A critical requirement is that the observation channel preserves internal conservation laws.

**Theorem P.5.3 (Internal Conservation).** All conservation laws derivable from internal symmetries hold exactly within the authentic simulation, independent of external observation.

*Proof.*
1. By condition (iii) of Definition P.5.3, external observation is non-interventional
2. Internal dynamics depend only on internal states
3. Conservation laws are properties of internal dynamics derivable from internal symmetries via Noether's theorem
4. External observation does not modify internal states or dynamics
5. Therefore, conservation laws are preserved QED

**Corollary P.5.1 (Information Conservation).** If internal dynamics are unitary (as derived in the MPU framework), the von Neumann entropy of the total internal state is conserved under internal evolution, independent of external observation.

### P.5.7 Relationship to Landauer's Principle

The PU framework invokes Landauer's principle [Landauer 1961] for the thermodynamic cost $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ (Theorem 31). The observation channel architecture maintains consistency with this principle.

**Proposition P.5.1 (Scope of Landauer's Principle).** Landauer's principle applies to information-processing operations as follows:

(i) **Internal operations:** State transformations within the simulation (SPAP cycle, 'Evolve' interaction, any logically irreversible computation) incur the Landauer cost $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$ per bit erased.

(ii) **External observation:** External reading of the observation channel incurs thermodynamic cost $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$ and Reflexivity Constraint cost $\kappa_r > 0$ at the observer interface (Theorem 31; Theorem 33) in the external context (the simulator's domain), not within the simulation.

*Justification.* Landauer's principle states that erasing information requires dissipating energy $k_B T \ln 2$ per bit into the environment. For internal operations, the "environment" is internal to the simulation. For external observation, the "environment" is external to the simulation. The channel architecture ensures these domains remain separate.

## P.5.8 The Observer in Physics: From Placeholder to Formal Concept

The preceding sections established prediction as the essence of knowing (P.3), consciousness as the foundational certainty (P.2), and physical instantiation as the bridge from logical structure to physical law (anticipated in P.6). This section addresses a question that these foundations make both possible and necessary: *What is an observer?*

This question is not peripheral to physics. It is the central unresolved conceptual problem of quantum mechanics. The framework developed in this paper provides, for the first time, a complete formal answer.

### P.5.8.1 The Observer Problem in Physics

The quantum formalism, as codified by von Neumann [1932], contains a structural asymmetry: two distinct dynamical laws. Process 1 (measurement) produces definite outcomes with probabilities given by the Born rule. Process 2 (unitary evolution) produces superpositions via the Schrödinger equation. The theory does not specify when Process 1 replaces Process 2, nor what physical property of a system qualifies it to trigger Process 1. Von Neumann's "psycho-physical parallelism" placed the boundary — the Heisenberg cut — at the interface between the quantum system and the observer's consciousness, but acknowledged that the cut's placement was arbitrary: any location along the von Neumann chain (system → apparatus → amplifier → retina → brain) yielded identical empirical predictions.

This arbitrariness constitutes the measurement problem. It is not a problem of interpretation but of the theory's formal structure: quantum mechanics uses the word "observer" as an essential primitive without defining it.

Subsequent interpretations manage the gap without filling it:

*Copenhagen.* Observation is a primitive concept associated with macroscopic apparatus. The theory does not specify what makes an apparatus macroscopic, nor why macroscopicity should confer the ability to produce definite outcomes. Bohr's complementarity principle constrains how observational contexts relate but does not define what an observational context *is* [Bohr 1928; Bohr 1935].

*Many-Worlds.* All outcomes occur; no observation produces definiteness; the appearance of definite outcomes is explained by decoherence and the branching structure of the universal wavefunction [Everett 1957; DeWitt 1970]. The observer is any subsystem that becomes entangled with the measured system. This dissolves the measurement problem at the cost of ontological extravagance and leaves unexplained why observers experience single outcomes.

*Decoherence.* Environmental entanglement suppresses interference between macroscopically distinguishable states on extremely short timescales [Zurek 1991; Joos & Zeh 1985; Schlosshauer 2007]. This explains why superpositions become unobservable at macroscopic scales but does not explain why one outcome becomes actual — the problem of definite outcomes persists. Zurek's quantum Darwinism [Zurek 2009] formalizes how information about a system proliferates through the environment, explaining intersubjective agreement, but takes the quantum formalism as given rather than deriving what makes a system capable of receiving the proliferated information.

*QBism.* Quantum states represent an agent's beliefs about future experiences; measurement updates beliefs [Fuchs, Mermin & Schack 2014]. The agent is a primitive of the theory. QBism is explicit that it does not explain what physical structure makes agency possible.

*Relational Quantum Mechanics.* Quantum states are relative to the observing system; there are no absolute states [Rovelli 1996]. Any physical system can serve as an observer. This is the closest in spirit to the PU framework, but Rovelli does not specify what physical structure a system must possess to serve as a reference — the definition of "observer" remains implicit.

*Objective Collapse.* New dynamical laws (e.g., GRW spontaneous localization [Ghirardi, Rimini & Weber 1986]) produce definite outcomes without observers. The collapse parameters (rate and localization scale) are phenomenological and empirically constrained, but are not derived from any deeper principle.

In every case, the word "observer" functions as either a primitive, a placeholder, or an unnecessary concept. No interpretation provides a formal specification of the minimal physical structure required for observation to occur. The problem is not that physicists have failed to answer the question. The problem is that the existing frameworks lack the formal resources to pose it.

### P.5.8.2 The PU Resolution: Observer as Predictive System

The PU framework resolves the observer problem by deriving the observer's structure from the operational requirements of prediction, rather than postulating it.

**Definition P.5.8.1 (Observer).** An *observer* is a physical system implementing the Fundamental Predictive Loop of Definition 4: prediction generation through $b_p$, registered verification through $b_v$, and outcome-conditioned update through $D_{cyc}$ under POP. For a fundamental MPU, Principle 8.0c and Theorem 8.0d represent every registered verification as a quantum instrument that writes exactly one retained outcome label with probability $\operatorname{tr}(\rho E_k)$.

The definition has a constructive physical closure:

1. The Cogito certifies occurrence of a self-verifying process; whenever its retained data form a finite self-verifying operational presentation in the sense of Definition P.6.1c.1, Theorem P.6.1c.3 supplies its canonical finite predictive normal form.
2. Definitions 4–5 supply the prediction, verification, and update roles.
3. Principle 8.0b and Theorem 8.0d supply the complex carrier and Born ledger.
4. Principle 8.0c supplies single-outcome registration; Proposition 9 derives the Lüders instrument for an ideal sharp repeatable verification.
5. If the architecture contains the full-context return channel, Theorem 31a supplies its one-bit registered reset bound.

Thus observation is prediction plus registered verification/update. Every qualifying full-loop implementation is an observer in this operational sense, and no size-, macroscopicity-, or consciousness-based Heisenberg cut is inserted.

**Theorem P.5.8.1 (Operational Closure of Measurement).** On the fundamental PU physical principle set:

(i) Principle 8.0b and Theorem 8.0d give the complex MPU carrier; Theorems 8.2–8.3 give Born trace weights; and Principle 8.0c with Theorem 8.0d gives a normalized quantum instrument that writes exactly one retained outcome in each registered verification.

(ii) For an ideal nondegenerate sharp repeatable verification, Proposition 9 derives
$$
\mathcal I_k(\rho)=P_k\rho P_k,
\qquad
\Pr(k\mid\rho)=\operatorname{tr}(\rho P_k).
$$

(iii) Internal unitary prediction and registered verification/update are successive stages of the Fundamental Predictive Loop. Definition P.5.8.1 identifies an observer by implementation of that loop, so no macroscopicity- or consciousness-based Heisenberg cut is required.

(iv) Definite registration follows from Principle 8.0c, not from dissipation. A registered reset obeys Theorem 31; the response-complete full-context return channel obeys Theorem 31a.

*Proof.* Part (i) is Theorem 8.0d. Part (ii) is Proposition 9. Part (iii) follows from Definitions 4 and P.5.8.1. Part (iv) applies Theorems 31 and 31a under their stated hypotheses. ∎

### P.5.8.3 The Observer Hierarchy

Not all observers are equivalent. The framework defines a natural hierarchy of observers classified by complexity and self-referential depth:
**Level 0: The Minimal Observer (MPU).** By Definition 23, an MPU attains $C_P=C_{op}$ on the declared nonempty qualifying class. The values $d_0=8$, two active dimensions, six inactive dimensions, and twenty-four transfer modes belong to separately registered saturating carrier and mode branches; they do not follow from MPU status alone. The full predictive loop is represented as a quantum instrument only on the separate Hilbert/instrument/Born and actualization branch. A registered verification/update event is called `Evolve`; not every physical interaction is thereby an actualization event. A Level-0 label does not define the Appendix M quantities $\sigma_S(E)$ or $\mu_S(E)$: those descriptors require Effective Operational Property R, an identifiable self-model splitting, and the specified prediction-map branch of Definitions M.10.1–M.10.3.
**Level 1: Simple Aggregates ($C_{agg} \leq C_{op}$).** Collections of MPUs whose aggregate complexity does not exceed $C_{op}$. These systems maintain relational information $\mathcal I_{rel}$ with their environment. On the common $\mathfrak B_{mass}$ source/response branch, Theorems N.5 and N.7 assign $m=\mathcal I_{rel}m_P/(2\sqrt{8\varepsilon_0})$ and $m_I=m_G$; Level 1 membership alone proves neither equality.

They observe through their constituent registered verification/update events. They do not self-model in the Property-R sense. The Appendix M descriptors $\sigma_S(E)$ and $\mu_S(E)$ are undefined at Level 1 unless Effective Operational Property R, an identifiable self-model splitting, and the specified prediction-map branch are independently supplied. Electrons, photons, atoms, and simple molecules are candidate examples only under the operational observer definition and the relevant instrument branch.

**Level 2: Self-Modeling Aggregates ($C_{agg}>C_{op}$, Effective Operational Property R).** These aggregates carry the self-model and identifiable splitting required by Definitions M.10.1–M.10.3. Their receiver-pattern quantities $\sigma_S(E)$ and $\mu_S(E)$ are defined only on those registered domains. Theorem M.10.3 gives a divergent asymptotic lower bound only for families carrying its pattern-specific reduction and implementation certificates. Theorem M.10.5 permits one system to evaluate another's specified profile only when the effective model-access, decision, and optional insulation certificates hold; aggregate-complexity ordering alone is insufficient, and no system is thereby granted a universal evaluator.

**Level 3: CC-Capable Aggregates ($C_{agg} > C_{op}$, CC $> 0$).** Level 2 systems that, under the conditions of Assumption 1, develop the emergent capability to bias local 'Evolve' outcome probabilities by modulating their internal context state (Theorem 34). This capability is quantified as Consciousness Complexity (Definition 30), bounded by $\text{CC} < 0.5$ (Theorem 39). Level 3 observers do not merely passively receive 'Evolve' outcomes — they participate in determining them, within strict thermodynamic and deterministic endpoint-forcing bounds. On the CC-gravitational response branch intersected with $\mathfrak B_{mass}$, their stress-energy ledger includes the conditional N.5 relational-information contribution and the separate N.8 CC term, yielding the stated model-level $\delta_C\propto P_{context}$ correction. The observer level alone does not activate either branch.

 Biological nervous systems are candidate Level 3 observers.

**Remark P.5.8.1 (Continuity of the hierarchy).** The levels are not discrete jumps but emergent thresholds in a continuous complexity landscape. The transition from Level 0 to Level 1 is aggregation. The transition from Level 1 to Level 2 is the onset of effective Property R, which occurs gradually as PCE optimization drives error rates toward $p_{\text{err}}^*$ (Theorem A.0.2). The transition from Level 2 to Level 3 is the onset of CC $> 0$, which requires context-dependent ND-RID probabilities (Assumption 1) and sufficient complexity for the PCE-driven biasing mechanism (Theorem 34). At every level, the fundamental process is the same: prediction, verification, update. What changes is the depth of self-reference and the richness of the cost structure.

### P.5.8.4 Perspectival Information and the Observer

The observer hierarchy supplies a family of conditional operational descriptions, not a universal cost assignment by level. The quantities $\sigma_S(E)$ and $\mu_S(E)$ are defined only when the system carries the Effective Operational Property-R, identifiable self-model splitting, and prediction-map certificates of Definitions M.10.1--M.10.3. They therefore remain undefined for a Level-0 or Level-1 label lacking those certificates. An interaction has a Landauer ledger only when it implements the registered reset of Theorem 31.

For a certified Level-2 or Level-3 pattern family, Theorem M.10.3's asymptotic processing bound additionally requires its pattern-specific reduction and implementation certificates. Entropy production requires the physical realization ledger of Theorem M.10.7, while Definition B.8 supplies a stress-energy model term only after its coefficients and retained-energy map are registered. These conclusions do not follow from self-model engagement alone.

The external-evaluation and screening statements of Theorems M.10.5 and M.10.8 likewise require their explicit model-access, decision, finite-family, and insulation certificates. Neither a bare aggregate-complexity ordering nor faithful replay proves sender-flat processing cost. The perspectival profile $\mathcal P_S(E)$ is therefore a descriptor of a fully specified receiver, pattern, update map, and implementation branch.

### P.5.8.5 Resolution of the Wigner's Friend Paradox

The perspectival formalism supplies a conditional same-basis record-reading consistency theorem for Wigner's-friend-type protocols (Theorem M.6.1). Suppose that $F$ already carries a registered outcome $k$ on an independently supplied instrument, Born-selector, and actualization branch. If $W$ later satisfies the strong-readout hypotheses of Lemma M.6.1 for that record basis, the resulting record pair is supported on matching values of $k$.

Neither result proves that every `Evolve` interaction selects a definite outcome or produces entropy. A physical-reset cost requires Theorem 31's registered-reset hypotheses, and a stochastic arrow requires the separate Appendix O pathwise certificate. Definition 24 indexes retained states by perspective; it is not by itself an outcome ontology. The cross-perspective import obstruction is the narrower result stated below, and a complete Frauchiger--Renner dissolution still requires a formalized full protocol and verification of every inference.

Definition M.6.2 requires a record-sharing or perspective-invariance certificate before an actualized record may be imported across distinct perspectives, and Lemma M.6.2a proves the corresponding import normal form for the retained calculus. Theorem M.6.2b applies this rule to the displayed Frauchiger–Renner-style import: when neither certificate exists, that import is ill typed. This establishes a precise obstruction to any argument containing such an import. A dissolution theorem for the complete Frauchiger–Renner protocol would additionally require a formal statement of the full protocol and verification of every inference step.

### P.5.8.6 Comparison with Existing Frameworks

The following table summarizes how the PU observer concept relates to existing interpretations:

| Feature | Copenhagen | Many-Worlds | Decoherence | QBism | Relational QM | PU |
|---------|-----------|-------------|-------------|-------|---------------|-----|
| Observer defined? | No (primitive) | No (any subsystem) | No (environment) | No (agent) | No (any system) | Yes (Def P.5.8.1) |
| Minimal observer specified? | No | No | No | No | No | Yes (MPU, Def 23) |
| Measurement closed? | No (postulated) | Eliminated | Partial (no single-outcome law) | No (primitive) | No (relational) | Yes on the explicit PU principle set: Principles 8.0b–8.0c and Theorem 8.0d; Proposition 9 derives the ideal Lüders case |
| Observer hierarchy? | No | No | No | No | No | Yes (§P.5.8.3) |
| Content-dependent cost? | No | No | No | No | No | Conditional on the certificates of Theorem M.10.3 |
| Self-referential limits? | No | No | No | No | No | Yes, on the diagonal-closed SPAP class (Theorems 10--11) |
| Measurement asymmetry? | Implicit | No | No | Implicit | No | Certificate-relative model-access asymmetry (Theorem M.10.5), not a universal measurement theorem |
| Wigner's Friend resolved? | No (ambiguous) | Dissolved (all branches) | Partial | Dissolved (subjective) | Dissolved (relational) | Conditional same-basis record-reading consistency (Theorem M.6.1 under Lemma M.6.1's strong-readout hypotheses), not a complete outcome-ontology theorem |

Two distinct interpretive criteria are used here. The temporal rule is an explicit PU admissibility criterion directed at ontic future-to-present inputs and all-at-once replacements of the predictive loop; finite pre/post-selection and weak-value calculations remain ordinary conditional process-tensor statistics. The Artifact Identification Criterion can classify proposed surplus structure only relative to a stated finite-response branch. Finite capacity, a conditional reset ledger, SPAP, and finite resolution do not by themselves prove that a continuum ontology is unreal or empirically exclude an interpretation.

Accordingly, the framework can quotient response-null labels and compare operational predictions, but it cannot infer the falsity of Everettian, Bohmian, GRW, or other ontologies from resource bounds alone. Theorem E.9.5 is itself conditional on its closed-system, retained-algebra, and ND-RID hypotheses and supplies neither the Born selector nor an actualization rule.

PU supplies a complete operational specification on its explicit physical principle set: Definition P.5.8.1 defines an observer; Definition 23 defines a minimal qualifying full-loop implementation; Theorems 10–11 delimit universally exact reflexive prediction; Principle 11b and Theorem 11b close the binary invariant response law; Principles 8.0b–8.0c and Theorem 8.0d close the complex carrier, Born ledger, quantum instrument, and single-outcome registration; and Theorems 31–31a supply the general and full-context reset ledgers. Each conclusion is tied to the exact principle or theorem that establishes it.

## P.6 Physical Instantiation: The Bridge from Logic to Physics

### P.6.1 The Principle of Physical Instantiation (PPI)

**Definition P.6.2 (Principle of Physical Instantiation – PPI).**
Any derivable, self-consistent logical or mathematical structure, when physically instantiated by a system composed of finite resources and operating in finite time, will manifest in the physical world with properties and dynamics shaped by the irreducible thermodynamic costs and resource-optimization imperatives inherent in its implementation. When multiple physically admissible implementations realize the same abstract structure with the same operational functionality, the realized implementation is the one minimizing the relevant resource cost over that admissible class (PPI-optimality).

In the finite-response formulation, PPI is not an additional copy map from pure mathematics into physics. It is the operational representation rule for physical content: a structure is physically instantiated exactly through the finite protocol-response presheaf it induces after response-null labels are quotiented and PCE-minimal representatives are selected. It explains why the physical world is not a direct copy of abstract structures, but the finite-response, cost-minimal representative of those structures whenever the bridge-collapse conditions of Theorem P.6.1b.7 are satisfied and, after Theorem P.6.1b.8a, represented in the finite operational quotient with nondegenerate uniqueness still requiring the strictness clauses of Theorem P.6.1b.7.

**Definition P.6.2a (Thermodynamically Dressed Mathematical Object).** Let $\mathfrak M$ be the domain of mathematical objects. A bare mathematical object is denoted $X\in\mathfrak M$. A thermodynamically dressed object is a tuple
$$
X^\Theta=(X,\Pi_X,R_X,V_X,C_X,\tau_X),
$$
where $\Pi_X$ is a finite physicalization protocol, $R_X$ is the finite record produced by the protocol, $V_X$ is a finite verifier, $C_X$ is the thermodynamic or resource cost of producing and maintaining the record, and $\tau_X$ is the update-ordering datum of the instantiation.

Bare mathematical existence is the condition $X\in\mathfrak M$. PPI-physicalizable existence is the existence of at least one admissible dressing $X^\Theta$ with finite cost.

**Definition P.6.2b (PPI-Physicalizable Sector).** Define $\mathfrak P\subseteq\mathfrak M$ by
$$
X\in\mathfrak P
$$
when there exist finite data
$$
(\Pi_X,R_X,V_X,C_X)
$$
such that $\Pi_X$ instantiates an operational aspect of $X$ as a finite physical record or process, $V_X$ verifies the record relative to the intended aspect of $X$, $C_X<\infty$, and $R_X$ can enter a finite retained predictive, causal, or verification update.

Let $\mathfrak A(t)\subseteq\mathfrak P$ be the actually instantiated physical records or processes at time $t$, represented by their dressed operational aspects, and let $\mathfrak E_S(t)\subseteq\mathfrak A(t)$ be the actualized sector accessible to predictor $S$ at time $t$. Then
$$
\mathfrak E_S(t)\subseteq\mathfrak A(t)\subseteq\mathfrak P\subseteq\mathfrak M.
\tag{P.6.2a}
$$

**Theorem P.6.2c (Finite-Cost Physicalizability Criterion).** A mathematical object $X\in\mathfrak M$ is PPI-physicalizable only through finite recordability, finite verification, finite maintenance, and finite update-use. Equivalently,
$$
X\in\mathfrak P
\Longleftrightarrow
X\text{ admits a finite thermodynamic dressing }X^\Theta
$$
relative to the retained operational aspect being instantiated.

*Proof.* By Definition P.6.2, physical instantiation is finite-resource implementation shaped by thermodynamic cost and PCE/PPI optimality. If $X$ is physically instantiated, then the instantiation must be carried by some finite protocol, finite record or process, finite verifier, finite maintenance budget, and finite update role; otherwise it is not an MPU-admissible finite physical implementation. Conversely, if such finite data exist, they define a PPI-admissible thermodynamic dressing of the operational aspect of $X$. ∎

**Definition P.6.2d (Operational Latent Mathematics).** The global operational-latent sector at time $t$ is
$$
\mathfrak W_{\mathrm{OLM}}(t)=\mathfrak P\setminus\mathfrak A(t).
$$
It consists of mathematical structures that can in principle be physicalized at finite cost but have not been actualized as physical records or processes at $t$.

The predictor-relative operational-latent sector is
$$
\mathfrak W_{\mathrm{OLM}}(S,t)=\mathfrak P\setminus\mathfrak E_S(t).
$$
It consists of physicalizable, and possibly already actualized, structures not currently accessible to predictor $S$.

**Proposition P.6.2e (PPI Physicalizability Ladder).** The following status ladder separates mathematical existence from physical actualization and observer access:

| Class | Name | Formal condition | Example | Status |
|---|---|---|---|---|
| $C_0$ | Bare mathematical | $X\in\mathfrak M$ | arbitrary formal structure | mathematical only |
| $C_1$ | Finitely describable | finite code $\ulcorner X\urcorner$ | $\pi$, $\mathbb N$, $\Omega$ | nameable, not necessarily physicalizable |
| $C_2$ | Generator-physicalizable | finite rule generates finite approximants | successor rule, digits of $\pi$ to bound $N$ | finite prefixes physicalizable |
| $C_3$ | Certificate-physicalizable | finite certificate and finite verifier | proof code, computation trace | directly PPI-admissible |
| $C_4$ | Predictor-accessible | $\operatorname{Adm}_S(t,p,e)$ | proof usable by $S$ | perspectival information |
| $C_5$ | Phase-unlockable | inaccessible at $t$, accessible after update | $E_{B,t}$ of A.5.6a | context-update dependent |
| $C_6$ | PCE-stable | retained predictive value | law, stable record, error-corrected bit | physically meaningful |
| $C_7$ | Actualized | $X\in\mathfrak A(t)$ via some $X^\Theta$ | stored bit, written proof | physical actuality |
| $C_8$ | Experienced | $X\in\mathfrak E_S(t)$ via some $X^\Theta$ | observed fact, known proof | observer-accessed reality |

The physically decisive region is $C_2$ through $C_6$: structures in this range are not merely abstract, and need not yet be actual, but are eligible for physical realization because they admit finite protocols, finite records, finite verification, finite update roles, or retained predictive value.

*Proof.* Each class adds a constraint to the previous one: finite description, finite generation, finite certificate, predictor admissibility, phase-unlockability, retained predictive value, actual record formation, and observer access. Each added constraint is exactly a finite-response or finite-cost condition already required by PPI/PCE. Hence the ladder is a definitional refinement of Equation P.6.2a. ∎

**Corollary P.6.2f (Completed Infinity Is Not a Completed Physical Record).** Completed infinite totalities may be legitimate mathematical objects in $\mathfrak M$, but they are not PPI-complete as physical records unless a finite dressing specifies the operational aspect being instantiated. Thus the successor rule and finite numerals can be physicalized, while $\mathbb N$ as a completed physical record is not a finite PPI object.

*Proof.* A completed physical record of all natural numbers would require infinite memory, infinite distinguishability, and infinite verification. This violates the finite-cost condition in Theorem P.6.2c. A successor rule, by contrast, is a finite generator, and any finite prefix has finite record and finite verification cost. ∎

**Corollary P.6.2g (Operational Reading of Time, Space, Causality, and Discreteness).** In this taxonomy, abstract order, metric, dependency, and continuum structures become physical only when dressed by finite update and record costs:

$$
\text{time}
=
\text{physicalized order plus irreversible record cost},
$$
$$
\text{space}
=
\text{physicalized distinguishability plus propagation cost},
$$
$$
\text{causality}
=
\text{physicalized update-dependence under finite channels},
$$
and
$$
\text{discreteness}
=
\text{physicalized finite distinguishability}.
$$

*Proof.* An abstract ordering, metric, dependency graph, or continuum description is mathematical structure in $\mathfrak M$. It enters $\mathfrak P$ only when finite protocols instantiate the relevant distinctions as records, propagation costs, update dependencies, or finite distinguishability classes. This is exactly the thermodynamic dressing criterion of Theorem P.6.2c. ∎

**Remark: Relation to PCE.** The phrase "resource-optimization imperatives" in Definition P.6.2 is made operationally precise by the Principle of Compression Efficiency (Definition 15, Section 6.1.2). The relationship is hierarchical:

- **PPI** fixes the admissible domain: physically realizable implementations of an abstract requirement, together with PPI-optimality (minimal-cost realization within that admissible class).
- **PCE** supplies an explicit cost functional $V(x)$ and an attractor dynamics selecting its minima subject to functionality constraints, providing a concrete realization of PPI-optimality for predictive systems.

When a derivation invokes "PPI requires…", it invokes admissibility and PPI-optimality; when it invokes "PCE selects…", it invokes the explicit $V$-minimization machinery used to guarantee strict selection among admissible alternatives.

### P.6.1a PPI-Contract Rigidity

**Definition P.6.1a.1 (PPI Contract).** A PPI contract is a quadruple
$$
\mathcal C=(\mathcal I,\mathcal O,\pi,\eta)
$$
where $\mathcal I$ is a finite list of PU-internal invariants, $\mathcal O$ is a finite list of operational observables, $\pi:\mathcal I\to\mathcal O$ is the interpretation map, and $\eta$ is the finite-resolution error budget assigning a tolerance to each observable comparison. Two contracts are operationally equivalent, written $\mathcal C_1\sim_{\mathrm{op}}\mathcal C_2$, when every MPU-admissible protocol produces outcome distributions agreeing within the error budget $\eta$ after applying the corresponding interpretation maps.

**Definition P.6.1a.2 (Contract Cost).** On an admissible class $\mathfrak C$ of PPI contracts, define
$$
\mathcal L_{\mathrm{PPI}}(\mathcal C)
=
L_{\mathrm{desc}}(\mathcal C)
+
L_{\mathrm{viol}}(\mathcal C)
+
L_{\mathrm{regret}}(\mathcal C),
\tag{P.6.1a.1}
$$
where $L_{\mathrm{desc}}$ is the description length of the interpretation map and branch data, $L_{\mathrm{viol}}$ is the nonnegative penalty for violating already-derived PU constraints, and $L_{\mathrm{regret}}$ is the predictive regret against admissible protocols. The cost descends to the quotient $\mathfrak C/\sim_{\mathrm{op}}$ whenever all three terms are invariant under operational equivalence.

**Theorem P.6.1a.3 (PPI-Contract Rigidity on a Strict PCE Branch).** Suppose the quotient $Q=\mathfrak C/\sim_{\mathrm{op}}$ is nonempty and compact in the finite-resolution topology induced by the protocol family, and suppose the descended cost
$$
\bar{\mathcal L}_{\mathrm{PPI}}:Q\to\mathbb R_{\ge0}
$$
is lower semicontinuous and strictly convex along every nontrivial operational interpolation in $Q$, and assume any two distinct minimizers in $Q$ can be joined by such an interpolation. Then there is a unique minimizing PPI contract up to operational equivalence:
$$
[\mathcal C_{\mathrm{phys}}]
=
\operatorname*{argmin}_{[\mathcal C]\in Q}
\bar{\mathcal L}_{\mathrm{PPI}}([\mathcal C]).
\tag{P.6.1a.2}
$$

*Proof.* Put
$$
m=\inf_{q\in Q}\bar{\mathcal L}_{\mathrm{PPI}}(q).
$$
Because $Q$ is nonempty and the cost is finite and nonnegative, $m\in\mathbb R_{\ge0}$. For every integer $n\ge1$, define
$$
F_n=
\left\{q\in Q:
\bar{\mathcal L}_{\mathrm{PPI}}(q)
\le m+\frac1n
\right\}.
$$
The definition of the infimum makes $F_n$ nonempty. Lower semicontinuity makes $F_n$ closed, and $F_{n+1}\subseteq F_n$. Each $F_n$ is therefore compact. The nested family has the finite-intersection property, so compactness of $Q$ gives a point $q_*\in\bigcap_{n\ge1}F_n$. Then
$$
\bar{\mathcal L}_{\mathrm{PPI}}(q_*)
\le m+\frac1n
$$
for every $n$, whence $\bar{\mathcal L}_{\mathrm{PPI}}(q_*)\le m$. The reverse inequality follows from the definition of $m$, so $q_*$ is a minimizer.

Suppose $[\mathcal C_1]$ and $[\mathcal C_2]$ are distinct minimizers with common value $m$. The interpolation hypothesis supplies a nontrivial $[\mathcal C_t]$, $0<t<1$, between them. Strict convexity gives
$$
\bar{\mathcal L}_{\mathrm{PPI}}([\mathcal C_t])
<
(1-t)\bar{\mathcal L}_{\mathrm{PPI}}([\mathcal C_1])
+t\bar{\mathcal L}_{\mathrm{PPI}}([\mathcal C_2])
=m,
$$
contradicting the definition of $m$. Thus the minimizer is unique in $Q$. Representatives of its quotient class differ only by operationally null reparameterization, so the contract is unique up to PPI-equivalence. ∎

**Corollary P.6.1a.4 (No Free Interpretive Branches at Fixed Predictive Content).** If two PPI mappings have identical operational predictions and one has strictly larger description length or constraint-violation cost, PCE removes the larger one.

*Proof.* Identical operational predictions place the two mappings in the same predictive fiber. A strictly larger description or violation term increases $\mathcal L_{\mathrm{PPI}}$ while leaving $L_{\mathrm{regret}}$ unchanged, so it cannot minimize (P.6.1a.1). ∎

### P.6.1b Operational Yoneda Reconstruction

**Definition P.6.1b.1 (Protocol Response Presheaf).** Let $\mathsf P_{\mathrm{PU}}$ be the finite category of MPU-admissible protocols at fixed resolution, with morphisms given by admissible protocol refinements, coarse-grainings, and pre/post-processing maps. Let $\mathsf{Prob}_{\mathrm{fin}}$ be the category of finite probability spaces and stochastic maps. For a PPI-admissible internal invariant $X$, define its operational response presheaf
$$
\mathcal R_X:\mathsf P_{\mathrm{PU}}^{op}\to\mathsf{Prob}_{\mathrm{fin}}
$$
by assigning to each protocol $P$ the finite outcome distribution
$$
\mathcal R_X(P)=\Pr_X(\cdot\mid P).
$$
A protocol family is separating when
$$
\mathcal R_X(P)=\mathcal R_Y(P)
\quad
\text{for every }P\in\mathsf P_{\mathrm{PU}}
$$
implies $X\sim_{\mathrm{op}}Y$.

**Definition P.6.1b.2 (Protocol-Complete PPI Branch).** A PPI branch is protocol-complete when every natural transformation
$$
\eta:\mathcal R_X\Rightarrow\mathcal R_Y
$$
between response presheaves is induced by a PPI-admissible transformation $X\to Y$, unique up to operational equivalence.

**Theorem P.6.1b.3 (Operational Yoneda Reconstruction).** On a separating protocol-complete PPI branch, the assignment
$$
\mathcal Y_{\mathrm{op}}:
X\longmapsto\mathcal R_X
$$
descends to a fully faithful functor
$$
\mathsf{Inv}_{\mathrm{PPI}}/{\sim_{\mathrm{op}}}
\hookrightarrow
[\mathsf P_{\mathrm{PU}}^{op},\mathsf{Prob}_{\mathrm{fin}}].
\tag{P.6.1b.1}
$$
Consequently,
$$
\mathcal R_X\simeq\mathcal R_Y
\quad\Longleftrightarrow\quad
X\sim_{\mathrm{op}}Y.
\tag{P.6.1b.2}
$$

*Proof.* The assignment is well-defined on the quotient because operationally equivalent invariants give the same outcome distributions for every admissible protocol. If
$$
\mathcal Y_{\mathrm{op}}([X])=\mathcal Y_{\mathrm{op}}([Y]),
$$
then $\mathcal R_X(P)=\mathcal R_Y(P)$ for all protocols $P$. Since the protocol family is separating, $X\sim_{\mathrm{op}}Y$, proving faithfulness on objects.

For morphisms, suppose two PPI-admissible transformations $f,g:X\to Y$ induce the same natural transformation between $\mathcal R_X$ and $\mathcal R_Y$. Then every protocol sees the same stochastic response after applying $f$ or $g$. Separating protocols identify them as the same morphism in the operational quotient, proving faithfulness on Hom-sets. Conversely, protocol-completeness says that every natural transformation $\eta:\mathcal R_X\Rightarrow\mathcal R_Y$ is induced by a PPI-admissible transformation $X\to Y$, unique up to operational equivalence. This proves fullness. Therefore $\mathcal Y_{\mathrm{op}}$ is fully faithful. The equivalence (P.6.1b.2) is the object-level consequence of full faithfulness. ∎

**Corollary P.6.1b.4 (No Observable Without a Protocol Presheaf).** An internal PU invariant has physical content exactly to the extent that it defines a nontrivial operational response presheaf. If two invariants define naturally isomorphic response presheaves, PPI identifies them as the same physical invariant.

*Proof.* Theorem P.6.1b.3 embeds physical invariants into the presheaf category of protocol responses. A trivial or naturally redundant presheaf gives no distinction in the quotient. ∎

**Definition P.6.1b.5 (Finite-PCE Completion Datum).** Let $X$ be an abstract, continuum, or internal PU invariant with operational response presheaf
$$
\mathcal R_X:\mathsf P_{\mathrm{PU}}^{op}\to\mathsf{Prob}_{\mathrm{fin}}
$$
on the finite protocol category of Definition P.6.1b.1, with each fixed protocol carrying its fixed finite outcome set. A finite-PCE completion datum for $X$ is a directed family
$$
\{(X_h,\mathcal R_h,\mathcal C_h)\}_{h\in I}
$$
such that:

1. $X_h$ is a finite MPU implementation with PPI contract $\mathcal C_h$.

2. $\mathcal R_h$ is the finite protocol-response presheaf induced by $X_h$.

3. For every finite protocol $P\in\mathsf P_{\mathrm{PU}}$, after identifying all responses with the fixed finite outcome set of $P$,
$$
\lim_{h}
d_{\mathrm{TV}}\!\left(\mathcal R_h(P),\mathcal R_X(P)\right)=0,
\tag{P.6.1b.3}
$$
and the convergence is natural under protocol refinements and coarse-grainings.

4. The PPI contract costs are uniformly finite on every fixed finite protocol family:
$$
\sup_h
\mathcal L_{\mathrm{PPI}}(\mathcal C_h\vert_{\mathsf P_0})
<\infty
\quad
\text{for every finite }
\mathsf P_0\subset\mathsf P_{\mathrm{PU}}.
\tag{P.6.1b.4}
$$

5. If two directed subfamilies induce the same limiting protocol-response presheaf, they are identified in the operational quotient.

**Theorem P.6.1b.6 (Operational Limit of a Finite-PCE Completion).** On a separating protocol-complete PPI branch, every finite-PCE completion datum for an invariant $X$ determines a limiting protocol-response presheaf and hence one operational completion class
$$
[X]_{\mathrm{comp}}
=
\overline{\varinjlim_h [X_h]_{\sim_{\mathrm{op}}}}.
\tag{P.6.1b.5}
$$
Two completion data determine the same operational completion class exactly when their limiting protocol-response presheaves are naturally isomorphic.

This completion class is a physical identity class only under both of the following additional hypotheses:

1. the limiting response presheaf lies in the essential image of $\mathcal Y_{\mathrm{op}}$, so it is induced by a PPI-admissible invariant;
2. at least one such realizing invariant has globally finite PPI implementation cost.

If, in addition, the quotient of realizing contracts satisfies the nonemptiness, compactness, lower-semicontinuity, interpolation, and strict-convexity hypotheses of Theorem P.6.1a.3, that physical class has a unique PCE-minimizing contract up to operational equivalence. A PPI-instantiated invariant supplies a finite-PCE completion datum only when its finite records form a directed family satisfying all five clauses of Definition P.6.1b.5.

*Proof.* Let $\{(X_h,\mathcal R_h,\mathcal C_h)\}_{h\in I}$ be a finite-PCE completion datum. For each retained protocol $P$, clause 3 gives convergence in total variation to $\mathcal R_X(P)$. The simplex over the specified finite outcome set of $P$ is closed, so $\mathcal R_X(P)$ is a probability distribution. If $T$ is any retained stochastic push-forward, then
$$
d_{\mathrm{TV}}(T_\#\mu,T_\#\nu)
\le
d_{\mathrm{TV}}(\mu,\nu).
$$
Indeed, for every event $A$ in the target outcome set,
$$
|(T_\#\mu)(A)-(T_\#\nu)(A)|
=
\left|\sum_x T(A\mid x)(\mu(x)-\nu(x))\right|
\le
d_{\mathrm{TV}}(\mu,\nu),
$$
and taking the supremum over $A$ gives the contraction. Every naturality square for the approximants therefore remains commutative after taking the limit. The datum consequently determines a limiting response presheaf. Clause 5 identifies two directed subfamilies with the same limit, proving that the operational completion class is well-defined. Separation proves that naturally isomorphic limiting presheaves determine the same operational quotient class, and the converse follows from the definition of $\sim_{\mathrm{op}}$.

Definition P.6.1b.2 states only that natural transformations between presheaves $\mathcal R_Y$ and $\mathcal R_Z$ already arising from PPI-admissible invariants are induced by admissible transformations. It does not assert that an arbitrary limiting presheaf is $\mathcal R_Y$ for some admissible $Y$. The essential-image hypothesis supplies precisely that object-level existence. Once a realizing $Y$ exists, separation makes its operational class unique. The global finite-cost hypothesis places at least one representative in the physical PPI domain; the bounds in (P.6.1b.4), taken separately on finite protocol families, are not used as a substitute for that hypothesis. Under the further hypotheses of Theorem P.6.1a.3, that theorem gives the unique cost-minimizing contract within the realizing class. Finally, physical instantiation yields a completion datum only when the required directed approximants, convergence, uniform local cost bounds, naturality, and quotient identification are supplied; these are exactly clauses 1--5 of Definition P.6.1b.5. ∎

**Theorem P.6.1b.7 (PPI Bridge-Collapse Theorem).** Let $\mathfrak B$ be a nonempty admissible finite-resolution family of bridge maps from a specified list of PU-internal invariants $\mathcal I$ to a specified list of operational observables $\mathcal O$. For each bridge $B\in\mathfrak B$, let $\mathcal R_B$ be its protocol-response presheaf on $\mathsf P_{\mathrm{PU}}$, and write
$$
B\sim_{\mathrm{op}}B'
\quad\Longleftrightarrow\quad
\mathcal R_B\simeq\mathcal R_{B'}
$$
by natural isomorphism within the specified finite error budget. Suppose:

1. the protocol family is separating and protocol-complete in the sense of Definitions P.6.1b.1-P.6.1b.2;
2. the quotient $Q_{\mathfrak B}:=\mathfrak B/{\sim_{\mathrm{op}}}$ is compact in the finite-resolution protocol topology;
3. the three nonnegative cost components descend to lower-semicontinuous functions on $Q_{\mathfrak B}$;
4. one of the following nondegeneracy conditions holds:
   - **scalar branch:** every two distinct points of $Q_{\mathfrak B}$ can be joined by a nontrivial operational interpolation, and $\bar{\mathcal L}_{\mathrm{PPI}}=L_{\mathrm{desc}}+L_{\mathrm{viol}}+L_{\mathrm{regret}}$ is strictly convex along every such interpolation;
   - **lexicographic branch:** the map
     $$
     [B]\longmapsto
     \bigl(L_{\mathrm{viol}}([B]),L_{\mathrm{regret}}([B]),L_{\mathrm{desc}}([B])\bigr)
     $$
     is injective, and selection minimizes this ordered triple lexicographically;
5. every bridge degree of freedom invisible to all finite protocols has positive description length unless it is quotiented out.

On the scalar branch there is a unique scalar-cost minimizer,
$$
[B_{\mathrm{phys}}]
=
\operatorname*{argmin}_{[B]\in Q_{\mathfrak B}}
\bar{\mathcal L}_{\mathrm{PPI}}([B]).
\tag{P.6.1b.6}
$$
On the lexicographic branch there is a unique lexicographic minimizer of $(L_{\mathrm{viol}},L_{\mathrm{regret}},L_{\mathrm{desc}})$. These are different selection rules; the lexicographic conclusion does not assert that the scalar argmin is a singleton.

*Proof.* Put $Q=Q_{\mathfrak B}$. On the scalar branch, let
$$
m=\inf_{q\in Q}\bar{\mathcal L}_{\mathrm{PPI}}(q).
$$
For each $n\ge1$, the set
$$
F_n=\left\{q\in Q:\bar{\mathcal L}_{\mathrm{PPI}}(q)\le m+\frac1n\right\}
$$
is nonempty by the definition of $m$, closed by lower semicontinuity, and nested. Compactness gives a point $q_*\in\bigcap_{n\ge1}F_n$. Hence $\bar{\mathcal L}_{\mathrm{PPI}}(q_*)\le m$, so equality holds and a minimizer exists. If distinct minimizers $q_1,q_2$ existed, hypothesis 4 supplies an interpolation $q_t$, $0<t<1$, and strict convexity gives
$$
\bar{\mathcal L}_{\mathrm{PPI}}(q_t)
<
(1-t)\bar{\mathcal L}_{\mathrm{PPI}}(q_1)
+t\bar{\mathcal L}_{\mathrm{PPI}}(q_2)
=m,
$$
a contradiction.

On the lexicographic branch, first minimize $L_{\mathrm{viol}}$ on $Q$. The same compact-sublevel argument gives a nonempty compact minimizer set $M_1$. Minimize $L_{\mathrm{regret}}$ on $M_1$ to obtain a nonempty compact set $M_2$, and minimize $L_{\mathrm{desc}}$ on $M_2$ to obtain a nonempty compact set $M_3$. Every point of $M_3$ is a lexicographic minimizer. If $q_1,q_2\in M_3$, all three cost coordinates agree at $q_1$ and $q_2$; injectivity of the triple map gives $q_1=q_2$. Thus the lexicographic minimizer is unique. Condition 5 and Corollary P.6.1a.4 remove positive-cost response-null symbols from a representative without changing its quotient point. ∎

**Corollary P.6.1b.8 (No-Response-Surplus Principle).** On a separating protocol-complete PPI branch, an additional branch label, field, family copy, bridge normalization, or geometric refinement is physically retained only if it changes a finite protocol-response presheaf or lowers an already-defined PPI cost. If it changes no finite response and lowers no cost, PCE quotients it out.

*Proof.* A response-null addition defines the same object of $Q_{\mathfrak B}$ by Theorem P.6.1b.3. If it has positive description length and no compensating decrease in $L_{\mathrm{viol}}$ or $L_{\mathrm{regret}}$, Corollary P.6.1a.4 removes it. If it changes a finite protocol response, it is not response-null and must be evaluated in the separating quotient. These two alternatives exhaust the finite-response cases. ∎

**Theorem P.6.1b.8a (Finite Operational Response Closure).** Work at a specified finite resolution, so $\mathsf P_{\mathrm{PU}}$ is finite and every retained protocol has a specified finite outcome set. Let $\mathfrak B_0$ be any raw family of finite PPI bridge descriptions with finite protocol responses and a prefix-free finite description code for which every bounded-length code sublevel is finite. Let
$$
\mathcal Y_{\mathrm{op}}(B)=\mathcal R_B
$$
be the induced protocol-response presheaf, and define
$$
B\sim_{\mathrm{op}}B'
\quad\Longleftrightarrow\quad
\mathcal R_B\simeq\mathcal R_{B'}.
$$
Let
$$
Q_{\mathfrak B}:=
\overline{\mathcal Y_{\mathrm{op}}(\mathfrak B_0)}/\simeq,
\tag{P.6.1b.7}
$$
where the closure is taken in the finite product of retained protocol-outcome simplexes. Assume that natural isomorphism is induced by the continuous action of the finite group of protocol-compatible outcome relabellings. Assume also that $L_{\mathrm{viol}}$ and $L_{\mathrm{regret}}$ are continuous operational functions of the response presheaf, and define
$$
\bar{\mathcal L}_{\mathrm{PPI}}([R])
=
L_{\mathrm{viol}}(R)+L_{\mathrm{regret}}(R)
+
\inf\{L_{\mathrm{desc}}(B):\mathcal R_B\simeq R\}.
\tag{P.6.1b.8a}
$$
Then $Q_{\mathfrak B}$ is compact Hausdorff, finite protocols separate its distinct points, the cost descends and is lower semicontinuous, and positive-cost response-null surplus is absent from a cost-minimal representative.

The object closure (P.6.1b.7) does not by itself imply protocol-completeness. A formally morphism-complete response category can be defined by taking the objects in the closure and all finite natural transformations between them as morphisms. Identifying that formal category with PPI-admissible transformations additionally requires the realizability hypothesis that every retained natural transformation is induced by a PPI-admissible transformation. Neither the scalar nor the lexicographic nondegeneracy condition of Theorem P.6.1b.7 follows from response closure.

*Proof.* Let
$$
X=\prod_{P\in\mathsf P_{\mathrm{PU}}}\Delta(\Omega_P).
$$
Every factor is a compact Hausdorff simplex, and the product is finite, so $X$ is compact Hausdorff. The set $\overline{\mathcal Y_{\mathrm{op}}(\mathfrak B_0)}$ is closed in $X$ and hence compact Hausdorff. Let $G$ be the finite group of protocol-compatible relabellings. The orbit relation is
$$
\mathcal R_G=\bigcup_{g\in G}\{(R,gR):R\in\overline{\mathcal Y_{\mathrm{op}}(\mathfrak B_0)}\}.
$$
For each $g$, the displayed graph is closed because the action is continuous and the space is Hausdorff. The union is finite, so $\mathcal R_G$ is closed. The quotient by a closed equivalence relation on a compact Hausdorff space is compact Hausdorff. Thus $Q_{\mathfrak B}$ is compact Hausdorff.

If two response classes are distinct, their presheaves are not naturally isomorphic. Hence at least one retained outcome coordinate, restriction map, relabelling, conditioning map, or composition response differs. That finite datum separates the two quotient points.

The cost is constant on each response class by construction, so it descends. The first two terms are continuous by hypothesis. For the description envelope, define
$$
D([R])=\inf\{L_{\mathrm{desc}}(B):\mathcal R_B\simeq R\}.
$$
Description lengths are nonnegative integers. Whenever a response class has a coded representative, the nonempty set of its code lengths has a least element, so the infimum is attained. For every integer $N\ge0$, the sublevel $\{[R]:D([R])\le N\}$ is the image of the finite bounded-length code set. It is a finite subset of the Hausdorff quotient and is therefore closed. Thus $D$ is lower semicontinuous, and so is its sum with the two continuous nonnegative terms.

A response-null symbol leaves the quotient point, $L_{\mathrm{viol}}$, and $L_{\mathrm{regret}}$ unchanged. If it has positive description length, deleting it strictly decreases $D$, so no cost-minimal representative contains it. This proves the asserted surplus removal.

Finally, (P.6.1b.7) specifies only a set of response objects modulo isomorphism; it contains no morphism set. Declaring all finite natural transformations to be morphisms defines a formal response category, but Definition P.6.1b.2 requires those morphisms to be induced by PPI-admissible transformations. That implication is exactly the additional realizability hypothesis stated above. Response closure also places no strict inequality between costs of distinct quotient points, so the nondegeneracy alternatives of Theorem P.6.1b.7 remain separate hypotheses. ∎

**Corollary P.6.1b.8b (Finite-Response Representation and Realization Boundary).** At each finite resolution, every PPI-admissible invariant has a response-presheaf image under
$$
\mathsf{Inv}_{\mathrm{PPI}}/{\sim_{\mathrm{op}}}
\hookrightarrow
[\mathsf P_{\mathrm{PU}}^{op},\mathsf{Prob}_{\mathrm{fin}}].
\tag{P.6.1b.8}
$$
The compact object closure of Theorem P.6.1b.8a may also contain formal limiting response objects. Such an object represents physical PPI content only if it lies in the essential image of the PPI representation, its required natural transformations are realized by admissible physical transformations, and it has a globally finite-cost representative. Response-null surplus is removed by Corollary P.6.1b.8. Equal-cost distinct quotient points are recorded as branch degeneracy; their number is finite only when the relevant quotient or minimizer set is finite or a finite-degeneracy certificate is supplied.

*Proof.* Theorem P.6.1b.3 gives the fully faithful embedding on the PPI-admissible domain. Operative Theorem P.6.1b.8a constructs a compact Hausdorff quotient of response objects, but object closure alone constructs neither all natural-transformation morphisms nor a physical realizing invariant. The essential-image, morphism-realization, and globally finite-cost hypotheses supply those three additional requirements. Corollary P.6.1b.8 removes response-null representatives. Operative Theorem P.6.1b.7 supplies scalar uniqueness only on its scalar strict-convexity branch and sequential uniqueness only on its lexicographic branch; without the relevant strictness condition, equal-cost quotient points remain a branch degeneracy. Compactness alone does not make that set finite. ∎

**Theorem P.6.1b.8c (Affine Response-Observable Duality).** Fix a finite protocol budget $B$ and a sector $S$. Let $\mathsf P_B$ be the retained finite protocol family and let
$$
K_B(S)
=
\overline{\operatorname{conv}}\{R_B(q):q\in Q_B(S)\}
\subseteq
\prod_{P\in\mathsf P_B}\Delta(\Omega_P)
\tag{P.6.1b.9}
$$
be the finite response body after the PPI quotient. A retained real observable at budget $B$ is a continuous affine functional
$$
O:K_B(S)\longrightarrow\mathbb R
\tag{P.6.1b.10}
$$
that is invariant under response-null identifications. Equivalently, it is the restriction to $K_B(S)$ of a finite affine combination of retained protocol outcome-coordinate evaluations satisfying the naturality equalities of the protocol category.

Let $\mathcal A=\mathcal A_B/\mathcal N_B$ on a finite quantum branch. Restriction sends every effect $0\le E\le I$ in $\mathcal A$ to a positive normalized affine observable on the retained states. This restriction is injective when the retained states separate $\mathcal A$. It is surjective onto all positive normalized affine observables under the additional full-state hypothesis
$$
K_B(S)\cong\mathsf S(\mathcal A),
$$
where $\mathsf S(\mathcal A)$ is the complete state space of $\mathcal A$. Under that hypothesis, effects are precisely the affine functions $O:\mathsf S(\mathcal A)\to[0,1]$, and bounded real affine observables are precisely evaluations of self-adjoint elements. For a proper separating retained subset, the represented observables are exactly those affine functions lying in the image of the effect-restriction map; separation alone does not imply that every bounded affine function lies in this image.

If $S$ has an accepted strict certificate with selected quotient representative $q_S^*$, then every retained observable has the unique certified branch value
$$
O_{\mathrm{phys}}
=
O(R_B(q_S^*)).
\tag{P.6.1b.11}
$$

*Proof.* The response body lies in a finite-dimensional real affine space. Choose an affine basis of its affine hull. The value of an affine observable on that basis determines an affine extension to the hull, and the coordinate evaluations of the finite product span the affine dual of the hull. Imposing the finite naturality equalities restricts this dual to natural affine functionals. Response-null identifications are precisely the common kernel of the retained coordinate evaluations, so the functional descends to the quotient exactly when it is constant on each response-null class.

Put $\mathcal A=\mathcal A_B/\mathcal N_B$. If $E$ is an effect and $\rho\in\mathsf S(\mathcal A)$, positivity of $\rho$ gives
$$
0\le\rho(E)\le\rho(I)=1,
$$
so $E$ defines an affine function into $[0,1]$. Conversely, let $O:\mathsf S(\mathcal A)\to[0,1]$ be affine. For every nonzero positive functional $\phi$ on $\mathcal A$, define
$$
\widetilde O(\phi)
=
\phi(I)O\!\left(\frac{\phi}{\phi(I)}\right),
$$
and set $\widetilde O(0)=0$. Affineness of $O$ gives, for positive $\phi$ and $\psi$,
$$
\widetilde O(\phi+\psi)
=
\widetilde O(\phi)+\widetilde O(\psi),
$$
and positive homogeneity is immediate. Extending by differences defines a real linear functional on the Hermitian dual of $\mathcal A$. Finite dimensionality and the trace pairing therefore give a unique $E=E^*\in\mathcal A$ such that
$$
O(\rho)=\rho(E)
\qquad
(\rho\in\mathsf S(\mathcal A)).
$$
If $E$ had an eigenvalue below $0$ or above $1$, a vector state supported on the corresponding eigenspace would make $\rho(E)$ lie outside $[0,1]$. Hence $0\le E\le I$. States separate self-adjoint elements, so the representative is unique. Scaling and translating a bounded real affine function reduces it to the $[0,1]$ case, proving the self-adjoint representation. Restriction to a proper retained subset preserves injectivity when that subset separates $\mathcal A$, but the construction of $\widetilde O$ requires values on the full state space and therefore supplies no surjectivity claim for a proper subset. Finally, evaluation of a function at the selected point $R_B(q_S^*)$ is single-valued, proving (P.6.1b.11). ∎

### P.6.1c Primitive-Equivalence Normal Form

**Definition P.6.1c.1 (Finite Self-Verifying Operational Presentation).** A finite self-verifying operational presentation is a tuple
$$
\mathfrak T
=
(\mathsf S,\mathsf P,\Omega,E,U,V)
\tag{P.6.1c.1}
$$
where:

1. $\mathsf S$ is a finite state set or finite state category.

2. $\mathsf P$ is a finite protocol category with refinements, coarse-grainings, and pre/post-processing morphisms.

3. Each $P\in\mathsf P$ has a finite outcome set $\Omega_P$.

4. $E$ assigns finite expected outcome laws,
$$
E(s,P)\in\Delta(\Omega_P),
$$
naturally with respect to protocol coarse-graining.

5. $U$ assigns finite update kernels
$$
U_{P,o}:s\mapsto U(s,P,o)
$$
whenever outcome $o\in\Omega_P$ is obtained.

6. $V$ assigns a finite verification statistic comparing the expected law $E(s,P)$ with the realized outcome or realized coarse-grained outcome.

Two presentations $\mathfrak T$ and $\mathfrak T'$ are primitive-equivalent when their induced protocol-response presheaves are naturally isomorphic after response-null labels are quotiented and their pushed-forward update and verification maps agree.

**Definition P.6.1c.2 (Predictive Normal Form).** The predictive normal form of $\mathfrak T$ is the finite predictive-instantiation object
$$
\mathcal N_{\mathrm{pred}}(\mathfrak T)
=
(\mathsf P,\mathcal R_{\mathfrak T},U_{\mathfrak T},V_{\mathfrak T})
\tag{P.6.1c.2}
$$
where
$$
\mathcal R_{\mathfrak T}(P)(s)
=
E(s,P)
\tag{P.6.1c.3}
$$
and the update and verification maps are the pushforwards of $U$ and $V$ to the response-presheaf quotient.

**Theorem P.6.1c.3 (Primitive-Equivalence Normal Form).** Every finite self-verifying operational presentation has a canonical predictive normal form up to natural isomorphism. If two presentations have naturally isomorphic response presheaves and compatible pushed-forward update and verification maps, then they are physically identical in the PPI quotient. Consequently, relation-first, process-first, computation-first, information-first, and prediction-first presentations do not define distinct physical primitives unless they induce different finite protocol-response presheaves or different pushed-forward update or verification maps.

*Proof.* Given $\mathfrak T$, equation (P.6.1c.3) defines a functor
$$
\mathcal R_{\mathfrak T}:\mathsf P^{op}\to\mathsf{Prob}_{\mathrm{fin}}
$$
because protocol refinements and coarse-grainings push finite outcome laws forward by stochastic maps. The update kernels $U_{P,o}$ and verification statistics $V$ depend only on finite states, finite protocols, and finite outcomes, so they descend to the quotient by response-null labels. This constructs $\mathcal N_{\mathrm{pred}}(\mathfrak T)$.

The construction is canonical up to the same natural isomorphism used in the operational quotient. No ordering of hidden labels, no presentation-specific syntax, and no primitive vocabulary enters (P.6.1c.3); only finite protocol responses, their update kernels, and their verification statistics enter. If two presentations induce naturally isomorphic response presheaves and compatible pushed-forward $U$ and $V$, then every finite protocol, every finite update response, and every verification statistic agree after the isomorphism. Theorem P.6.1b.3 identifies the corresponding invariants in the operational quotient, and Corollary P.6.1b.8 removes any remaining response-null primitive label. If a relation-first, process-first, computation-first, or information-first presentation changes no finite response presheaf and no pushed-forward update or verification map, it is primitive-equivalent to its predictive normal form. If it changes one of these finite data, it is a distinct finite-response theory rather than an alternative notation for the same branch. ∎

**Corollary P.6.1c.4 (Prediction as Canonical Operational Form).** The predictive primitive used by PU is not an extra ontology beyond finite self-verification. It is the canonical normal form of any finite presentation that contains expectations, updates, and verification statistics.

*Proof.* Apply Theorem P.6.1c.3 to the presentation. The resulting object records exactly expected finite responses, update kernels, and verification statistics. That is the predictive normal form. ∎

### P.6.2 Illustrating PPI: From Abstract Requirements to Specific Laws

The following cases illustrate the PPI in action, showing how specific physical laws emerge as the optimal physical solution to abstract requirements.

*   **Case I: From the Requirement for Perfect Self-Reference to Quantum Mechanics**
    *   *Abstract Requirement:* A system capable of perfect, deterministic self-modeling—fully representing its own state in an internal model.
    *   *Instantiation Problem:* On the retained diagonal class satisfying Theorem 11's closure hypotheses, no single probabilistic predictor is uniformly exact on every self-referential instance. The resulting Logical Indeterminacy is a class-level nonexistence statement, not a literal temporal infinite regress or a universal numerical ceiling.
    *   *Thermodynamic Bridge:* A cycle containing a registered reset obeys $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ by Theorem 31, with a positive uniform floor only under an independent lower bound on $H_q(P\mid R)$. A directional stochastic-arrow conclusion additionally requires the pathwise certificate of Theorem O.3 or O.3a. Verification/update alone implies neither ledger.
* *Physical Manifestation (Quantum Mechanics):* Principle 11b and Theorem 11b close the fixed-point-free binary response ledger; Principle 8.0b and Theorems G.1.8 and 8.0d close the complex rank-eight carrier; Theorems 8.2–8.3 close Born weights; and Principle 8.0c closes irreducible single-outcome registration. Noncommuting sharp effects realize Principle 8.0b's retained incompatibility witness.
* *Conclusion:* Quantum mechanics is the fundamental MPU response calculus on the declared PU principle set. The diagonal theorem supplies the logical obstruction, while the carrier and actualization principles supply the physical inputs.

*   **Case II: From the Requirement for Perfect Coherence to Gauge Theory**
    *   *Abstract Requirement:* A network of interacting entities that must maintain perfect, instantaneous, cost-free phase coherence, implicitly requiring infinite resources.
    *   *Efficiency Bridge (PCE):* Minimize the cost of managing *local* coherence for meaningful comparison of neighboring MPU states.
    *   *Physical Manifestation (Gauge Theory, e.g., U(1)):* Introduce a connection field $A_\mu$ and covariant derivative $D_\mu$ as the minimal, PCE-optimal solution for local phase freedom. The dynamics of $A_\mu$ (e.g., Maxwell) emerge from PCE minimizing field cost (PU **Appendix G**, Sections G.2-G.7).
    *   *Conclusion:* Gauge theory is the law of coherence under information-bandwidth constraints.

*   **Case III: From the Requirement for Absolute Geometric Space to General Relativity**
    *   *Abstract Requirement:* A system that must operate within an absolute, static, non-participatory geometric background.
    *   *Instantiation Problem:* In PU, "space" is the interacting MPU network. MPUs are active thermodynamic processors with a stress-energy tensor $T_{\mu\nu}^{(MPU)}$ (PU Appendix B), contradicting the premise of a passive background.
    *   *Thermodynamic Bridge:* Local thermodynamic equilibrium on local causal horizons is derived by Theorem 48a.0 on the Appendix F/G operational-continuum branch, and the local-horizon KMS/Clausius input is formalized by Theorem 48a, linking heat flow from $T_{\mu\nu}^{(MPU)}$ to entropy change from the Area Law (PU Theorem 49).
    *   *Physical Manifestation (General Relativity):* For universal thermodynamic consistency, geometry ($g_{\mu\nu}$) must dynamically respond to $T_{\mu\nu}^{(MPU)}$ via the Einstein Field Equations (PU Theorem 50, rigorously derived in **Section 12**).
    *   *Conclusion:* General Relativity is the law of geometry under local thermodynamic-equilibrium constraints.

**P.6.3 A Case Study in Physical Instantiation: Outcome Records and Sharp Observables**

A measurement used for verification must produce a distinguishable record in a specified outcome alphabet $\Omega$. PPI requires a physical carrier for that record, while PCE compares carriers only after an encoding, a response criterion, and a cost functional have been specified. For finite $\Omega$, injective encodings exist into $\mathbb{R}$, $\mathbb{C}$, the integers, and finite bit strings. Consequently, distinguishability by itself does not select real numbers as a unique record language.

On the conditional complex-Hilbert branch, a sharp repeatable quantitative observable has additional structure. Assume that its possible retained values are real numbers $\lambda_1,\ldots,\lambda_m$, that repeatability assigns mutually orthogonal outcome subspaces with projectors $\Pi_i$, and that the observable is represented linearly by
$$
A=\sum_{i=1}^m\lambda_i\Pi_i,
\qquad
\Pi_i^\dagger=\Pi_i,
\qquad
\Pi_i\Pi_j=\delta_{ij}\Pi_i.
$$
Then
$$
A^\dagger
=\sum_{i=1}^m\overline{\lambda_i}\Pi_i^\dagger
=\sum_{i=1}^m\lambda_i\Pi_i
=A.
$$
Conversely, the finite-dimensional spectral theorem states that every Hermitian operator admits such a decomposition with real eigenvalues and orthogonal spectral projectors. Thus Hermiticity is equivalent to the stated sharp linear representation with real quantitative labels.

General quantum measurements are described by POVMs and need not be projective. Their outcome labels remain elements of an arbitrary registered alphabet. PPI/PCE can compare physical implementations of either a POVM or a sharp observable after the task and cost are specified; the Hermitian-observable representation additionally depends on the real-label, linearity, sharpness, and repeatability hypotheses above.

### P.6.4 Conditional Symmetry Selection by Efficiency

PCE supports a symmetry-selection statement only relative to a declared action on the admissible configurations and an invariant objective. Let a compact group $G$ act affinely on a convex feasible set $X$, let $\mu_G$ be normalized Haar measure, and assume that the PCE potential $V:X\to\mathbb R$ is convex and $G$-invariant. For every $x\in X$, assume also that the orbit average
$$
\bar x=\int_G g\cdot x\,d\mu_G(g)
$$
belongs to $X$. Jensen's inequality and invariance give
$$
V(\bar x)
\leq\int_G V(g\cdot x)\,d\mu_G(g)
=V(x).
$$
Moreover, Haar invariance gives $h\cdot\bar x=\bar x$ for every $h\in G$. Hence every admissible configuration has a $G$-invariant competitor of no greater cost. If a minimizer exists, a $G$-invariant minimizer exists; if $V$ is strictly convex, the minimizer is unique and therefore $G$-invariant.

Without convex feasibility, an invariant objective, and the orbit-average condition, resource optimization need not select a symmetric state. Symmetry-broken minima are compatible with a symmetric potential, and description complexity depends on the chosen representation and coding language. The electroweak value $\kappa_{EW}=38.5$, the flat-QFI branch, and other concrete symmetry comparisons therefore retain their separately stated response, calibration, admissible-class, and cost hypotheses.

## P.6.5 Philosophical Implications of Unified Entropy

### P.6.5.1 The Entropy Correspondence Thesis

Section 7.5 records a conditional chain joining a registered binary structural quotient, a separately implemented reset-support channel, geometric channel-density data, capacity saturation, and local-horizon Clausius hypotheses. It does not derive gravitational entropy from SPAP alone. This section examines the interpretive proposal that the resulting ledgers share a counting grammar while retaining distinct antecedents.

**Thesis P.6.1 (Unified Entropy).** *There exists a single foundational entropic structure that manifests in different physical and informational contexts according to the operational constraints of that context. The various "types" of entropy recognized in physics and information theory are not independent concepts but domain-specific expressions of this unified structure.*

The correspondences are:

| Entropy Domain | Formula | Connection to Unified Structure |
|:---------------|:--------|:-------------------------------|
| **Registered binary quotient and reset** | $\varepsilon_0=\ln2$ structurally; $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}$ physically | Definition 28, Definition J.1, and Theorem J.1 supply the structural binary value; Theorem 31 separately governs a registered physical reset |
| **Shannon** | $H_{\mathrm{Sh}} = -\sum_i p_i \ln p_i$ | Generalization: cost of distinguishing among $n$ states |
| **Thermodynamic** | $dS_{\mathrm{th}} = \delta Q / T$ | Landauer equivalence: shared counting structure under unit conversion |
| **von Neumann** | $S_{\mathrm{vN}}(\rho) = -\operatorname{Tr}(\rho \ln \rho)$ | Quantum generalization preserving operational meaning |
| **Bekenstein-Hawking** | $S_{\mathrm{BH}} = \mathcal{A}/4G$ | Geometric scaling of channel capacity (Thms E.3, E.5) |

The thesis asserts these are not five independent theories requiring reconciliation but five windows onto a single structure. The "unreasonable effectiveness" of thermodynamic reasoning in gravitational physics is explained: horizons are information-capacity boundaries, and horizon entropy counts the Shannon entropy of channel capacity across the boundary.

---

### P.6.5.2 The Three Components

The entropy unification has three distinct components with different epistemic status:

**1. Landauer's Principle (Empirical Anchor)**

Landauer's principle provides the *physical content* of the logical-thermodynamic equivalence. It is an empirically confirmed principle (experimentally verified to within order unity of the theoretical bound) that can also be derived from applying the second law of thermodynamics to information-bearing degrees of freedom.

The framework does not derive Landauer's principle from its axioms—that would be circular since Landauer provides the physical basis for entropy unification. Landauer is *incorporated* as the empirical bridge between logical and physical entropy.

**2. PPI (Universality Guarantee)**

The Principle of Physical Instantiation (Definition P.6.2) provides the carrier gate: every retained logical operation in the physical theory is represented by a finite physical process. It therefore prevents an abstract operation from bypassing the physical resource ledger, but it does not make every operation logically irreversible. Reversible embeddings and uncomputed ancillas may be implemented without an erasure heat floor.

Landauer accounting applies exactly when the physical process contains a registered cyclic many-to-one reset or overwrite. For an erased record $P$ with retained side record $R$, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; the lower bound is positive only when that conditional entropy is positive. Thus PPI makes the reset theorem applicable to every physical reset meeting its hypotheses, while the reset certificate determines which operations incur the bound.

**3. Theorems E.1–E.3 and E.5 (Derived Extension)**

The extension of unified entropy to gravitational phenomena is *derived* within the framework from the Landauer cost. The chain:

$$\text{completed binary reset-support certificate}\xrightarrow{\text{E.2a}} C_{\max}\le\ln d_0-\ln2 \xrightarrow{\text{E.3}} N_{eff} \propto \mathcal{A} \xrightarrow{\text{E.5}} S_{BH} = \frac{\mathcal{A}}{4G}$$

is a conjunction of branch theorems and calibration hypotheses. It shows that the Bekenstein--Hawking form follows only after the registered reset-support, area-density, capacity-saturation, operational-coupling, and local Clausius certificates are all imposed; neither SPAP nor Landauer alone supplies the gravitational conclusion.

**Summary of Epistemic Status:**

| Component | Status | Role |
|:----------|:-------|:-----|
| Landauer's principle | Incorporated (empirical) | Physical content of equivalence |
| PPI | Axiom | Guarantees universality |
| Theorems E.1–E.3 and E.5 | Derived | Extension to gravity |

---

### P.6.5.3 Assumptions and Scope Limitations

**Assumptions:**

1. **SPAP plus full-context cycle closure:** Theorems 10–11 prove the diagonal self-prediction obstruction on their stated classes. The injective reflex step does not erase information. The reusable full-context channel of Equation (7.1.3a), together with Principle 11b, supplies the separate noninjective Commit Snapshot reset whose erased conditional binary entropy is proved to be $\ln2$; this constructed reset, not SPAP alone, is the antecedent of the physical Landauer row.

2. **Landauer's Principle:** Logical irreversibility entails thermodynamic cost when physically instantiated. Empirically confirmed principle providing the physical bridge.

3. **PPI (Definition P.6.2):** All logical operations within the framework must have physical instantiations.

4. **Emergent Geometry (Theorem 43):** Smooth spacetime structure emerges from the MPU network in the appropriate limit. Derived in Section 11 from PCE optimization.

5. **QFTCS Validity:** Quantum field theory on curved spacetime applies in the semiclassical regime. Specifically, the Unruh effect and entanglement first law are used. These are kinematic results depending only on the equivalence principle and standard quantum mechanics.

6. **Local Equilibrium:** The Clausius relation $\delta Q = T\,\delta S$ holds on local Rindler horizons. Assumes the system is sufficiently close to equilibrium for thermodynamic relations to apply.

**Scope Limitations:**

1. **Equilibrium Thermodynamics:** The derivation operates within equilibrium or near-equilibrium thermodynamics. Extensions to far-from-equilibrium entropy production require additional analysis, potentially using Jarzynski-type relations.

2. **Stationary Horizons:** The gravitational entropy derivation applies most directly to stationary or slowly-evolving horizons. Rapidly dynamical horizons with $|\dot{\mathcal{A}}| \sim \mathcal{A}/t_P$ may involve corrections not captured by the semiclassical analysis.

3. **Semiclassical Regime:** The framework uses QFTCS, which is valid when curvatures are small compared to Planck scale. Full quantum gravitational corrections at $R \sim L_P^{-2}$ are beyond the current scope.

4. **Universality of $\eta$, $\chi$:** The geometric factors are derived assuming a regular MPU network (Theorem 43). Topological defects or other irregularities might modify these factors locally.

---

### P.6.5.4 Resolution of the Black Hole Information Problem

The unified entropy framework provides a natural dissolution of the black hole information problem by reframing the question.

**Traditional Framing:** When matter falls into a black hole and the black hole subsequently evaporates via Hawking radiation, where does the information go? If the radiation is exactly thermal (carrying no information about the infallen matter), unitarity appears to be violated.

**PU Reframing:** Information and entropy are not separate substances but different operational descriptions of channel capacity across causal boundaries. The question "where does the information go?" presupposes that information is a conserved fluid that must flow somewhere. The framework replaces this picture with one of channel capacity reallocation.

**The Resolution:**

1. **Horizon entropy is channel capacity.** The Bekenstein-Hawking entropy $S_{BH} = \mathcal{A}/4G$ is the total information capacity of the ND-RID channels crossing the horizon—the maximum information that can be encoded on the boundary (Theorems E.3, E.5).

2. **Infalling information is encoded.** When matter crosses the horizon, its quantum state information is encoded in the correlations among the horizon channels. The encoding is scrambled by PCE-driven dynamics but not destroyed.

3. **Evaporation transfers capacity.** As the horizon shrinks ($\mathcal{A} \to 0$), the channel capacity of the horizon decreases. PCE optimization drives the encoded information to be transferred to the outgoing Hawking radiation field, which has increasing channel capacity as more radiation is emitted.

4. **Unitarity is preserved.** The total channel capacity—horizon plus radiation—is conserved throughout the process. The S-matrix connecting initial infalling state to final radiation state is unitary.

**Summary of Theorem K.3 (Page Curve).** *The entanglement entropy between the Hawking radiation and the remaining black hole, computed from PCE-driven scrambling dynamics that approximate a unitary k-design, follows the Page curve: initially increasing as radiation is emitted, reaching a maximum at the Page time (when half the initial entropy has been radiated), then decreasing to zero as evaporation completes.*

The Page curve is a signature of unitary evolution. Its emergence from PCE dynamics—without being assumed—provides evidence that the framework naturally incorporates unitarity. The full derivation is provided in Appendix K.3.

**Scope of Resolution:** This dissolution of the information problem operates within the framework's assumptions. It demonstrates that *if* the PU foundations hold, *then* black hole evaporation is unitary and the information problem does not arise. The resolution is not an independent proof of unitarity but a consistency check showing that the framework's structure is compatible with (and indeed implies) unitary evolution. The PCE-driven scrambling dynamics satisfy the assumptions required for Page curve derivation without additional input.

---

### P.6.5.5 The Conversion Factors

The ledgers use the following conversions only on their stated branches:

| Ledger | Formula | Hypotheses |
|:-------|:--------|:-----------|
| Dimensionless entropy to thermodynamic entropy | $S=k_B H$ | $H$ is the entropy in nats of the same registered distribution |
| Registered erasure to bath heat | $Q_{\mathrm{bath}}\ge k_BT\,H_q(P\mid R)$ | isothermal registered reset with retained side information $R$; equality requires Landauer saturation |
| Boundary information to area | $A=L_P^2 I/\sigma$ | accepted boundary channel-density and area-law calibration with density $\sigma$ |

The structural reference value $\varepsilon_0=\ln2$, a registered-reset entropy, an action calibration, and a boundary-area calibration are distinct data. The constants $k_B$, $\hbar$, $c$, and $G$ convert units within accepted physical ledgers; they do not identify those ledgers without the bridge hypotheses listed in Theorem P.6.3 and the relevant area-law result.

### P.6.5.5a The Action-Entropy-Information Relations

The exchange rate structure forms a closed set of relations connecting action, entropy, and information. These relations consolidate and summarize the derivations in Appendix Q.

**Theorem P.6.3 (Conditional Action, Entropy, and Information Ledgers).** The following relations hold on their stated branches:

| Relation | Formula | Hypotheses |
|:---------|:--------|:-----------|
| Structural ledger to action | $\mathcal S=\kappa_A\sum_i\varepsilon_i$ | accepted action calibration with constant $\kappa_A>0$ |
| Registered erasure to bath entropy | $\Delta S_{\mathrm{bath}}\ge k_B\sum_jH_{q_j}(P_j\mid R_j)$ | sequential additive registered-reset ledger |
| One unbiased registered bit | $\Delta S_{\mathrm{bath}}\ge k_B\ln2$ | $H_q(P\mid R)=\ln2$ |
| One stipulated binary structural step | $\Delta\mathcal S=\kappa_A\ln2$ | calibrated structural ledger with $\varepsilon=\ln2$ for that step |

Equality in the bath-entropy relation requires saturation of every conditional Landauer bound. The value $\kappa_A=\hbar$ is an independent action calibration. No universal minimum mechanical action per erased bit follows without a certificate identifying the same physical operation in both ledgers.

*Proof.* The first row is the defining equality of the accepted action-calibration branch in Corollary Q.0.1. For registered reset $j$, the conditional Landauer principle [Landauer 1961] gives
$$
\Delta S_{\mathrm{bath},j}\ge k_BH_{q_j}(P_j\mid R_j).
$$
Additivity of the registered ledger gives the second row after summing over $j$. Setting the conditional entropy of one registered unbiased bit to $\ln2$ gives the third row. Independently, substituting the stipulated structural value $\varepsilon=\ln2$ into $\Delta\mathcal S=\kappa_A\varepsilon$ gives the fourth row. The two substitutions describe the same physical operation only when an additional bridge certificate identifies their ledgers. ∎

**Corollary P.6.3.1 (Conditional Relation Consistency).** Assume the calibrated identity $\mathcal S=\kappa_A\mathcal L$ with $\kappa_A>0$ and $\mathcal L>0$. Then
$$
\frac{\mathcal S}{\kappa_A\mathcal L}=1.
$$
For a sequential additive registered-reset ledger with $\sum_jH_{q_j}(P_j\mid R_j)>0$, saturation of every conditional Landauer bound gives
$$
\frac{\Delta S_{\mathrm{bath}}}{k_B\sum_jH_{q_j}(P_j\mid R_j)}=1.
$$
Neither ratio is defined when its denominator vanishes. ∎
**Corollary P.6.3.2 (Stationary Action and a Calibrated Additive Event Ledger).** Within a fixed holonomy sector (Definition Q.0.2a), assume the calibrated identity $\mathcal S=\kappa_A\sum_i\varepsilon_i$ with constant $\kappa_A>0$ on a common admissible variation domain (Corollary Q.0.3). Then
$$
\delta\mathcal S=0
\quad\Longleftrightarrow\quad
\delta\left(\sum_i\varepsilon_i\right)=0.
$$
The stationary history may be a minimum, maximum, or saddle according to the second variation. The result is a scalar-rescaling identity on the calibrated branch; it neither identifies the event ledger with physical entropy production nor derives the calibration from SPAP. Variations that change the holonomy sector lie outside the stated common domain.

---

The framework supplies exact or forward-computable ratios on the following explicitly certified branches:

- **The Planck ratio**: $\delta/L_P = \sqrt{8\ln 2} \approx 2.355$ from PCE optimization (Appendix Q, Equation Q.18)
- **The fine-structure constant (Thomson limit)**: the closed-form sinc-core value $\alpha^{-1}_{0}=137.03609205522863\ldots$, a single-valued elementary function of the forced integers $K_0=3$, $d_0=8$, $M=24$, $D=4$ with no continuous fit (Appendix Z, Theorem Z.26; Corollary Z.26a), landing $0.678$ ppm from the measured value; the certificate-complete comparison row $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ is theorem-level only after the residual gate of Definition Z.27.11a and Theorem Z.27.11j.1, the same-branch $R_\alpha=0$ subbranch is obstructed at the recorded comparison value by Corollary Z.27.11e.1, and the row is refutable by Corollary Z.26c
- **The cosmological constant**: the five-mode formula $\Lambda L_P^2=8\pi A_{\text{eff}}e^{-2\kappa_{\mathrm{ref}}}$ with $\kappa_{\mathrm{ref}}=141.5$ is a reference branch obstructed as an unconditional false-vacuum closure by Theorem U.8c; the four-mode exponent branch fixes $\kappa=142$ under Theorem U.13b, while a theorem-level forward interval for $\Lambda_4L_P^2=8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}$ requires the accepted canonical Fredholm record $\mathfrak F_U^{(4)}$; the earlier $\mathfrak F_U+\mathfrak I_U^{(4)}$ records are equivalent only when supplemented by $H_4$, $\mathcal T_4$, and every remaining U.73e entry on the same branch

These branch calculations use distinct structural inputs. The registered reachable binary quotient gives $\varepsilon_0=\ln2$, while Theorem 15 gives $K_0=3$ only on its (O1)–(O3), (FC) realization class. Neither value follows from SPAP alone. PCE comparisons and the same-class carrier comparator supply further branch selection; physical equality $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)$ is separately the zero-excess-dissipation reset branch.

**Corollary P.6.2.1 (Operational Coupling and Spacing Identity).** On Theorem E.6's capacity-achieving, entropy-saturating, additive boundary-ledger branch, define the operational gravitational coupling by
$$
G_{\mathrm{op}}
=
\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}}.
$$
On the further Appendix Q branch with completed binary reset support at $d_0=8$, residual-budget saturation $C_{\max}^*=2\ln2$, throughput-optimal independence $\chi^*=1$, and ideal packing $\eta^*=1$, identifying $G_{\mathrm{op}}$ with measured $G$ gives
$$
\frac{\delta}{L_P}
=
\sqrt{8\ln2},
\qquad
L_P^2=\frac{G\hbar}{c^3}.
$$
*Proof.* The first identity is Equation E.9. Substituting the three registered branch values and the calibration $G_{\mathrm{op}}=G$ yields $\delta^2=8\ln2\,G\hbar/c^3=8\ln2\,L_P^2$. Positivity fixes the displayed square root. Thus the ratio is an exact algebraic output of the stated joint certificate; the measured value of $G$ is the calibration that sets the absolute length scale.

---

### P.6.5.6 Historical Context

The entropy unification provides rigorous grounding for conjectures that have shaped theoretical physics for five decades.

**Bekenstein (1973):** Proposed that black holes have entropy proportional to horizon area, based on the analogy between black hole mechanics and thermodynamics. The framework derives this relationship from information-theoretic first principles, explaining *why* the analogy is exact.

**Hawking (1975):** Demonstrated that black holes emit thermal radiation at a specific temperature, implying genuine thermodynamic entropy. The framework identifies this entropy as channel capacity of the ND-RID channels crossing the horizon.

**Jacobson (1995):** Showed that Einstein's field equations can be derived from thermodynamic reasoning on local causal horizons, assuming the Bekenstein-Hawking entropy formula. The framework provides the foundational derivation of that formula (Theorem 49), completing the logical chain from information theory to general relativity.

**Landauer (1961):** Established the fundamental connection between logical and thermodynamic entropy. The framework incorporates this as the physical bridge enabling the unification.

**The Contribution of the PU Framework:**

The framework achieves what these pioneers conjectured but could not derive from first principles: that black-hole entropy and thermodynamic entropy are linked by the same underlying counting structure, with the Bekenstein-Hawking expression furnishing the gravitational realization of that structure.

The conditional route from a binary reset-support channel to the area law is
$$
\left.
\begin{aligned}
&\text{registered completed binary reset support},\\
&\text{area-density and capacity-saturation certificates},\\
&\text{operational-coupling calibration and local Clausius hypotheses}
\end{aligned}
\right\}
\Longrightarrow
S_{BH}=\frac{\mathcal A}{4G}.
$$
The structural value $\varepsilon_0=\ln2$ enters only through the registered binary-support branch. SPAP alone supplies none of the reset channel, geometric density, saturation, coupling calibration, or Clausius premises, and the chain does not independently determine the Planck scale or measured $G$.

The unification explains why black hole thermodynamics works: horizons are information-capacity boundaries, and the Bekenstein-Hawking entropy counts the Shannon entropy of the channel capacity across the boundary, measured in Planck units. The "unreasonable effectiveness" of thermodynamic reasoning in gravitational physics is therefore not unreasonable—it reflects the same counting structure reappearing in a geometric domain.

### P.6.5.7 Irreversibility and Temporal Orientation

On a sequential registered-reset branch,
$$
\Delta S_{\mathrm{bath}}
\ge
k_B\sum_jH_{q_j}(P_j\mid R_j).
$$
A positive per-reset floor requires an additional bound $H_{q_j}(P_j\mid R_j)\ge h_{\min}>0$; the value $k_B\ln2$ requires $h_{\min}\ge\ln2$. Monotonic growth of this bath ledger does not by itself define a pathwise arrow for forward and reversed histories. The probability bounds of Theorems O.3 and O.3a additionally require common forward/reverse event algebras, additive stochastic total entropy production, and an independent pathwise lower-bound certificate.

## P.7 PU as a Transcendental Framework for Physics

Immanuel Kant's transcendental idealism sought to identify the *a priori* conditions for the possibility of human experience (e.g., space, time, causality) [Kant 1781]. The PU framework can be seen as a generalization and operationalization of this project.

Instead of starting with the structure of human cognition, it starts with the more fundamental and universal structure of a predictive system. It derives the same key necessities—space, time, causality—but does so from the single, simpler foundation of prediction. It then goes further, showing how these necessities, when implemented under physical resource constraints (PCE), give rise to the specific mathematical formalisms of quantum mechanics and general relativity. The PU framework is thus a transcendental framework for physics itself, seeking the conditions for the possibility of a universe that can be known (i.e., predicted).


### P.7.1 Resolution of Wigner's Puzzle

The Principle of Physical Instantiation (Section P.6) established that physical laws are thermodynamically optimal embodiments of logical necessities derived from prediction. This principle now resolves a foundational question in the philosophy of science.

Eugene Wigner's essay "The Unreasonable Effectiveness of Mathematics in the Natural Sciences" (1960) posed a deep puzzle: why should abstract mathematical structures, developed through pure reasoning, so precisely describe physical reality? The traditional response—that this correspondence is simply how nature happens to be—provides no explanation.

The PU framework dissolves this puzzle by showing that mathematics and physics share a common foundation in prediction, constrained by the same optimization principle.

**Mathematics as the Operational Structure of Prediction**

Predictionism (Section P.3.4, Appendix A.0.2) grounds mathematics in the certainty of the Cogito. The logical structures underlying mathematics—bivalence, Boolean operations, the law of non-contradiction—are not arbitrary axioms but necessary features of verification:

1. **Binary Verification:** Every verification yields a definite outcome—prediction confirmed or disconfirmed. Let $V(S) \in \{0,1\}$ denote this outcome for statement $S$. This binary structure is intrinsic to verification: the Cogito's self-verification cannot be partial or ambiguous.

2. **Boolean Operations:** From this binary foundation, logical operations emerge operationally. Negation distinguishes confirmed from disconfirmed: $V(\neg S) = 1 - V(S)$. Conjunction arises from sequential verification: $V(S_1 \land S_2) = \min(V(S_1), V(S_2))$. Disjunction arises from branching: $V(S_1 \lor S_2) = \max(V(S_1), V(S_2))$.

3. **Universal Computation:** Since $\{\text{NOT}, \text{AND}, \text{OR}\}$ is functionally complete [Post 1921], any system capable of the predictive cycle and satisfying the Logical-Structural Assumptions of Appendix A possesses the structural capacity for universal computation (Theorem A.0.1) and Property R (Corollary A.0.1).

Mathematics thus inherits the indubitability of the Cogito. Its structures are not discovered in some Platonic realm but are *generated* by the operational requirements of prediction itself.

The Prediction Optimization Problem (POP, Definition 5) drives all predictive systems toward maximal predictive accuracy under resource constraints. A predictor must distinguish states, compose operations, recognize patterns, and optimize under constraints. These activities *are* the operations of logic, combinatorics, algebra, and analysis. Mathematics is the explicit articulation of what the predictor implicitly does. When mathematicians prove theorems, they are predictors mapping the territory that prediction itself generates.

**Physics as Thermodynamic Instantiation**

The Principle of Physical Instantiation (PPI, Definition P.6.2) completes the bridge: physical laws are the thermodynamically optimal embodiment of the logical necessities derived from prediction. Quantum mechanics instantiates self-referential logic under irreducible cost ($\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\quad\text{on a registered reset branch}$). Gauge theory instantiates coherence under bandwidth constraints. General relativity instantiates geometric consistency under thermodynamic equilibrium.

Where mathematics articulates what prediction *can* do in principle, physics specifies what prediction *does* do under finite resources. 

**Convergence at M = 24**

The mode-channel correspondence (Theorem Z.10) makes this unity explicit. The number 24 appears in pure mathematics—as the modular weight of $\eta^{24}$, the dimension of the Leech lattice, the support of the Ramanujan $\tau$-function—because mathematicians, exploring computable structures through proof, identified those satisfying extremal optimization conditions. The same number appears in physics—as QFI mode count, Golay code length, kissing number $K(4)$—because PCE, selecting structures through thermodynamic competition, converges on the same extrema.

Both processes instantiate the same branch-indexed PCE variational grammar: each searches an admissible structure space for stable predictive optima under finite constraints, and each removes surplus description by operational equivalence. They arrive at the same extremal structures when their branch contracts have the same response-relevant invariants, although the numerical cost function and admissible configuration space need not be identical across the mathematical and physical branches.

The "unreasonable effectiveness" dissolves once the common foundation is recognized. Mathematics is the abstract articulation of predictive structure; physics is that same predictive structure under thermodynamic instantiation and finite-resource constraint. The correspondence between them is therefore not accidental but a consequence of their shared origin in prediction and their shared PCE selection of optimal structures.

Wigner asked why the language of mathematics is appropriate for physics. The framework's answer is that both domains are organized by the same predictive constraints, with physics differing from mathematics only by the additional requirement of physical implementation. The effectiveness is not unreasonable but inevitable at the level of structure, while the specific realized branch is fixed by PPI and PCE.

### P.7.2 Branch-Qualified Structural Chain

The physical-reset and structural-selection ledgers have distinct premises:
$$
\begin{aligned}
&\text{registered reset ensemble }(P,R,q)
\longrightarrow
\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R),\\
&\text{reachable sharp match/mismatch quotient + structural reference branch}
\longrightarrow
\varepsilon_0=\ln2,\\
&\text{active binary record + entropy capacity + no-surplus selection}
\longrightarrow
a=2,\\
&a=2+d_0=8+b=d_0-a+\text{SLD-QFI interface chart}
\longrightarrow
M=2ab=24,\\
&M=24+\text{verified response-labeled $24$-cell}+\text{least-feasible support cost}
\longrightarrow
24\le K(D)
\longrightarrow
D=4.
\end{aligned}
$$

The first row is a conditional thermodynamic inequality and has a positive constant floor only if $H_q(P\mid R)\ge h_{\min}>0$. Equality additionally requires a quasistatic, overhead-free reset implementation. The remaining rows form a structural chain only on the explicitly named branch intersection. In the last row, Theorem Z.11 uses $K(3)=12$ to exclude $D\le3$, the verified response-labeled regular $24$-cell to prove feasibility in $D=4$, and the strict surplus-dimension cost to select the least feasible value. No global equality $M=K(D)$ is required.

The Golay code is selected only on the additional predictive-recovery MacWilliams branch. A Leech lattice is selected only after either the registered Golay-to-Leech construction or the fixed-normalization even-unimodular carrier and finite Gaussian-cost certificate of Selection Principles P.13.7–P.13.9. Gauge, coupling, matter, and continuum outputs retain the separate hypotheses and status labels stated in their source theorems.

**Remark P.7.1: Branch Scope.** The value $M=24$ is necessary within the intersection of the active-record, structural-reference, no-surplus, $d_0=8$, and SLD-QFI interface branches. POP, a physical Landauer bound, complex Hilbert-space structure, or an octonionic carrier does not separately entail that intersection. The result is therefore a necessity theorem for the declared admissible class, not a requirement for predictive existence in every possible implementation.

### P.7.3 The Golden Ratio and Emergence Dynamics

Appendix Z (Section Z.32) states a falsifiable branch prediction connecting the golden ratio $\varphi = (1 + \sqrt{5})/2$ to channel-crystallization dynamics. The Hopkins–Stillinger–Torquato theorem (2010) proves the OSC-to-DLP implication for $1\le R\le\varphi$; it does not by itself require OSC/DLP decoupling or a dynamical transition above $\varphi$. If the MCC mode-channel relaxation branch is independently certified to follow this OSC$\to$DLP local-packing pathway, then $\varphi$ is a candidate crossover marker for that branch.

This prediction remains to be tested and does not enter the core derivations of $M=24$, $D=4$, or $\alpha_{\mathrm{em}}$.

**If Prediction Z.5 is verified on its stated branch**, these constants would have different statuses inside the framework:

| Constant | Traditional Role | Framework Role |
|----------|------------------|----------------|
| $c$ | Speed of light | Structure of causality |
| $\hbar$ | Quantum of action | Limit of determinism/action-entropy exchange |
| $G$ | Gravitational coupling | Spacetime curvature scale |
| $\varphi$ | Golden ratio | Conditional OSC$\to$DLP channel-crystallization marker |

The first three constants enter accepted physical branches as exchange or coupling scales. The golden ratio, if observed in the specified protocol, would provide evidence for a transition in the channel-relaxation route by which local geometric organization crystallizes; it would not be promoted to a primitive physical constant alongside $c$, $\hbar$, or $G$.

This gives the Wigner-puzzle discussion a conservative branch interpretation. The golden ratio appears throughout mathematics in continued fractions, Fibonacci sequences, optimal phyllotaxis, and quasicrystal symmetries, often in contexts involving extremal packing or growth under geometric constraints. If $\varphi$ appears in MCC channel crystallization, the shared content is a branch-contract form of extremal packing under finite-resource constraints, not identity between biological and spacetime cost functions and not a universal lattice-proportion law.

The framework does not require $\varphi$; its core derivations proceed without invoking it. The prediction arises from applying the Hopkins–Stillinger–Torquato theorem to a specific MCC relaxation pathway. If falsified, the main results remain intact while that channel-crystallization branch requires revision. If verified, the result supports the OSC$\to$DLP branch rather than elevating $\varphi$ to the status of a primitive axiom.

### P.7.4 Algebraic Encoding of the Derivation Chain

The derivation chain of Section P.7.2 admits compact algebraic representation: the logical flow from thermodynamic cost to interface structure can be encoded in a single $2 \times 2$ matrix whose spectrum contains the framework's foundational constraints.

#### P.7.4.1 The Landauer Constraint Matrix

**Definition P.7.1 (Landauer Constraint Matrix).** The Landauer constraint matrix is:

$$\boxed{L(a) := \begin{pmatrix} 1 & 0 \\ 2a & -2a^2 \end{pmatrix}}$$

For the PU framework with $a = 2$ (Theorem Z.1):
$$L(2) = \begin{pmatrix} 1 & 0 \\ 4 & -8 \end{pmatrix}$$

**Proposition P.7.1 (Interface Generation).** The constraint matrix transforms the dimension-unity pair into the dimension-interface pair:

$$L(a) \cdot \begin{pmatrix} d_0 \\ 1 \end{pmatrix} = \begin{pmatrix} d_0 \\ M \end{pmatrix}$$

For PU values:
$$\begin{pmatrix} 1 & 0 \\ 4 & -8 \end{pmatrix} \begin{pmatrix} 8 \\ 1 \end{pmatrix} = \begin{pmatrix} 8 \\ 24 \end{pmatrix}$$

*Proof.* Direct calculation:
$$M = 2a \cdot d_0 + (-2a^2) \cdot 1 = 2a(d_0 - a) = 2ab$$
which is the QFI interface formula (Theorem Z.5). ∎

#### P.7.4.2 Spectral Encoding of Constraints

**Proposition P.7.2 (Spectral Properties).** The eigenvalues of $L(a)$ are:
$$\lambda_1 = 1, \qquad \lambda_2 = -2a^2.$$
At the registered joint point where Theorem Z.1 gives $a=2$ and Theorem Z.2 gives $d_0=8$, the numerical consistency identity $d_0=2a^2$ holds, so $\lambda_2=-d_0=-8$.

*Proof.* The matrix is lower triangular, so the eigenvalues are the diagonal entries: $\lambda_1 = 1$ and $\lambda_2 = -2a^2$. Under $d_0 = 2a^2$ this becomes $\lambda_2 = -d_0$; for PU values $a=2$ and $d_0=8$ it gives $\lambda_2=-8$. ∎

**Remark P.7.2a: Interpretive Status.** The appearance of $d_0$ in the spectrum is a consequence of the matrix construction, not an independent derivation. The matrix $L(a)$ provides compact notation for the derivation chain but does not add physical content beyond what is already established in Theorems Z.1 and Z.5.

**Corollary P.7.2.1 (Matrix Invariants).**

| Invariant | Formula | Value | Interpretation |
|:----------|:--------|:-----:|:---------------|
| Trace | $\mathrm{tr}(L) = 1 - 2a^2$ | $-7$ | $1 - d_0$ |
| Determinant | $\det(L) = -2a^2$ | $-8$ | $-d_0$ |
| Eigenvalue ratio | $\lambda_2/\lambda_1$ | $-8$ | $-d_0$ |

At the registered joint point $(a,d_0)=(2,8)$, the determinant and trace are numerically $-d_0$ and $1-d_0$. Away from that point they encode only the matrix parameter $a$; the matrix supplies no independent carrier-dimension theorem.

#### P.7.4.3 Eigenvector Interpretation

**Proposition P.7.3 (Eigenvector Structure).** The eigenvectors of $L(a)$ are:
$$v_1 = \begin{pmatrix} 2a^2 + 1 \\ 2a \end{pmatrix} \quad (\lambda_1 = 1), \qquad v_2 = \begin{pmatrix} 0 \\ 1 \end{pmatrix} \quad (\lambda_2 = -2a^2)$$
At the registered joint point $(a,d_0)=(2,8)$, where $d_0=2a^2$ holds as a consistency identity, these become $v_1=(d_0+1,2a)^T$ and $\lambda_2=-d_0$.

**Interpretation:**
- $v_1$ is the eigenvector of $L(a)$ with eigenvalue $1$; the ratio $9/4$ at $(a,d_0)=(2,8)$ is a numerical matrix invariant, not a new dimension--kernel law.
- $v_2=(0,1)^T$ is the eigenvector with eigenvalue $-2a^2$; it does not by itself define a physical scaling transformation.
- $v_2$ (scaling direction): Pure interface scaling. Transformations along $(0,1)^T$ affect only $M$, not $d_0$.

#### P.7.4.4 The Encoding Interpretation

**Remark P.7.4: Constraint Encoding.** The matrix $L(a)$ encodes the complete constraint structure:
- **Input:** $(d_0, 1)$ — Hilbert dimension and unity
- **Output:** $(d_0, M)$ — Hilbert dimension and interface modes
- **Constraint:** $\lambda_2=-2a^2=-d_0$ at $(a,d_0)=(2,8)$ — a consistency identity on the joint Theorem-Z.1/Theorem-Z.2 branch, not a Landauer–SPAP spectral law
- **Thermodynamics:** $\varepsilon_0=\ln2$ is structural; a registered reset obeys $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$, with a positive floor only under $H_q(P\mid R)\ge h_{\min}>0$, with $a=2$ following from the structural capacity/record/no-surplus gates rather than physical saturation



The matrix compiles the structural parameter relations on the minimal active-record branch:
$$
\varepsilon_0=\ln2
\xrightarrow{\text{active record + capacity + no-surplus}}
a=2
\xrightarrow{d_0=8,\ b=d_0-a,\ M=2ab}
M=24.
$$

Its spectrum records these algebraic relations. Separately, a registered reset ensemble $(P,R,q)$ obeys $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$; that thermodynamic inequality is not an eigenvalue consequence of the matrix.

| Domain | Structure | Encoded Content |
|:-------|:----------|:----------------|
| Quantum mechanics | Hamiltonian $H$ | Energy spectrum on its declared domain |
| General relativity | Metric $g_{\mu\nu}$ | Causal and interval structure on the Lorentzian branch |
| PU framework | Constraint matrix $L(a)$ | Algebraic repackaging of $M=2a(d_0-a)$; no Landauer theorem follows from the matrix |

#### P.7.4.5 Parameter Rigidity

**Proposition P.7.4 (Branchwise Rigidity Analysis).** The matrix has the algebraically fixed form
$$
L(a)=
\begin{pmatrix}
1&0\\
2a&-2a^2
\end{pmatrix}
$$
whenever the QFI mode formula $M=2a(d_0-a)$ is adopted. On the separate Theorem-Z.1 branch, the sharp binary record, entropy-capacity, and no-surplus hypotheses give $a=2$. On Theorem Z.2's (O1)–(O3), (FC), Hilbert-distinguishability, and same-class-comparator branch, $d_0=8$. Only on their conjunction does $\lambda_2=-2a^2=-d_0=-8$. The matrix itself derives none of those branch inputs.

**Corollary P.7.4.1 (Counterfactual Scope).** The current theorem package does not define $a$, $d_0$, or $M$ for hypothetical structural values $\varepsilon=\ln3,\ln4,\ldots$. Such a continuation requires a new reachable alphabet, active-kernel selection theorem, carrier comparator, and mode-channel contract. Therefore no exclusion of those counterfactual branches by the unproved assignments $(a,d_0,M)=(3,18,90),(4,32,224),\ldots$ is available.

#### P.7.4.6 Summary

The matrix $L(a)$ is convenient notation for the QFI identity $M=2a(d_0-a)$. At the registered joint point $(a,d_0)=(2,8)$ its second eigenvalue is numerically $-8=-d_0$; this is a branch consistency identity, not an independent structural or thermodynamic law.

**Causality terminology rule.** Every endpoint, bias-strength, gravity-backreaction, or zero-error bound in this appendix is weaker than operational causality. Postulate 2 means exact pre-lightcone context independence by Theorem 39c; a late-randomized Bob-marginal shift lies outside that branch.

# P.8 On the Nature of Emergent Spacetime

## P.8.1 The Emergence Thesis

The Predictive Universe framework treats spacetime as emergent finite-response structure rather than a fundamental substrate. Its causal and metric claims are carried by the intervention-response, latency, causal-diamond, regularity, and continuum certificates. A classical error-correcting code is a separate optional structural ledger.

**Definition P.8.1 (Causal Structure).** Event $A$ can causally influence event $B$ if and only if $A$'s predictive information can propagate to $B$ through ND-RID channels with correctable error accumulation.

**Definition P.8.2 (Certificate-Relative Predictive Spacetime).** On the accepted locality, causal-response, regularity, continuum, and metric-reconstruction branch, spacetime is the effective geometry representing finite-response propagation and predictive coherence. The Golay code is an independent optional recovery ledger and is not identified with spacetime.

**Thesis P.8.1 (Spacetime Emergence).** Spacetime—including its dimensionality, geometry, causal structure, and temporal direction—emerges from the structure of error-corrected predictive coherence across the MPU network. Spacetime is not the stage on which prediction occurs; spacetime is the geometric manifestation of prediction maintaining itself optimally under finite-resource constraints.

This claim has precise mathematical content. The emergence is "strong" in the following restricted sense: once the foundational constants are fixed and the mode-channel, code-selection, gauge-search, and continuum-limit hypotheses introduced in Section P.7.2 and the technical appendices are adopted, the manuscript derives a four-dimensional Lorentzian effective spacetime with the stated gauge structure. The derivation fixes a discrete backbone of geometric data; it does not show that every geometric feature of the observed world follows without the additional branch, lift, and matching assumptions introduced later in the manuscript.

---

## P.8.2 Conditional Dependency Ledgers: From Prediction to Geometry

The backbone spacetime construction uses several independently registered ledgers (cf. Section P.7.2; Appendix Z):
$$
\begin{aligned}
&\text{Cogito-certified knowledge process}+\text{finite self-verifying presentation} &&\xrightarrow{\mathrm{P.6.1c.3--P.6.1c.4}} \text{canonical predictive normal form},\\
&\text{encoded self-reference}+\text{Property R}+\text{diagonal closure} &&\longrightarrow \text{SPAP obstruction},\\
&\text{registered physical reset }(P,R,q) &&\longrightarrow \varepsilon_{\mathrm{phys}}\ge H_q(P\mid R),\\
&\text{sharp match/mismatch quotient}+\text{structural reference branch} &&\longrightarrow \varepsilon_0=\ln2,\\
&\text{active record}+\text{capacity}+\text{no-surplus}+d_0=8+\text{SLD-QFI chart} &&\longrightarrow a=2\longrightarrow M=24,\\
&M=24+\text{faithful tangent-shell injection}+\text{strict least-feasible support cost} &&\longrightarrow D=4.
\end{aligned}
$$

The dependencies within each row are conditional implications. The rows must be jointly registered before their conclusions may be combined.

**Stage 1: Canonical Predictive Form (Sections P.2–P.3 and P.6.1c).** Foundational Certainty P.2.1 certifies the occurrence of the knowledge-bearing process. Appendix P.3.1 and Thesis P.3.5.1 identify its epistemic activity with expected response, verification, and update. Whenever those data form a finite self-verifying operational presentation in the sense of Definition P.6.1c.1, Theorem P.6.1c.3 constructs a predictive normal form canonical up to natural isomorphism, and Corollary P.6.1c.4 identifies prediction as the canonical operational primitive. The theorem does not extend beyond that finite self-verifying class.

**Stage 2: SPAP Obstruction (Theorems 10–11).** The diagonal contradiction applies to systems satisfying the theorem's encoding, self-reference, diagonal-closure, and Property-R hypotheses. It does not quantify over predictive systems lacking those capabilities.

**Stage 3: Registered Reset Cost (Theorem 31, Appendix J).** If a physical protocol erases a record $P$ while retaining side information $R$, conditional Landauer erasure gives
$$
\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R).
$$
A positive constant floor requires $H_q(P\mid R)\ge h_{\min}>0$. Equality requires a quasistatic, overhead-free implementation, and the value $\ln2$ additionally requires a uniform binary record with no entropy-reducing side information.

**Stage 4: Structural Active Record (Theorem Z.1).** The reachable sharp verification quotient carries the alternatives match and mismatch, hence $a\ge2$. On the structural reference branch, $S(\rho)\le\ln a$ together with $\varepsilon_0=\ln2$ also gives $a\ge2$. The no-surplus rule selects the least admissible integer, $a=2$. This active record can be physically instantiated, but its dimension is not inferred from equality in the physical reset bound.

The term "Landauer Pointer" denotes a physical implementation only when the separate registered-reset hypotheses are present; structurally it is the two-dimensional active verification record.

**Stage 5: Interface Mode Count (Theorem Z.5).** On the joint carrier and active-kernel branch, Theorem Z.2 gives $d_0=8$ and Theorem Z.1 gives $a=2$, so $b=d_0-a=6$. The registered SLD-QFI tangent structure on this partition yields:

$$
M = 2ab = 2 \cdot 2 \cdot 6 = 24
$$

This is the count of QFI-active modes connecting the active and inactive subspaces.

**Stage 6: Dimensional Selection (Theorem Z.11).** Definition Z.9a supplies a response-preserving injection of the $M=24$ retained labels into distinct cells of an equal-radius Euclidean tangent shell. Theorem Z.10 therefore gives
$$
24=M\le K(D).
$$
Since $K(3)=12$, no dimension $D\le3$ is feasible. The response-labeled regular $24$-cell supplies an explicit feasible shell in $D=4$, and the registered strict surplus-dimension cost selects that least feasible dimension. Thus $D=4$ follows on this branch without assuming $M=K(D)$.

**Stage 7: Independent Code, Lattice, and Local-Packing Ledgers.** The predictive-recovery branch selects the classical $[24,12,8]$ Golay code. The coordinate construction and Gaussian Niemeier selector independently fix the Leech lattice on their stated branches. The faithful tangent-shell branch uses $24\le K(D)$, $K(3)=12$, the regular $24$-cell, and least-feasible support cost to select $D=4$. These records share a count and commute on the joint certificate; none substitutes for another's premises.



---

## P.8.3 The Co-Emergence of Spatial and Temporal Structure

Spacetime emerges as a unity. The same foundational structure that produces spatial geometry simultaneously produces temporal direction and causal order.

**Theorem P.8.1 (Co-Emergence from the Predictive Cycle).** The Fundamental Predictive Loop (Definition 4) necessarily involves:

| Predictive Requirement | Emergent Feature |
|------------------------|------------------|
| Internal Prediction ($P_{\text{int}}$) | Reference to future states |
| Verification ($V$) | Comparison with actual outcomes |
| Update ($D_{\text{cyc}}$) | Incorporation of feedback |
| Cycle ordering: $P_{\text{int}} \to V \to D_{\text{cyc}}$ | Temporal direction |
| Registered positive cycle duration $\tau_{\min}$; Theorem 29 supplies only a characteristic internal timescale | Temporal granularity on the clock-certified branch |
| Network synchronization (Theorem O.2) | Global temporal coherence |
| Error correction range | Causal horizons |
| Network topology | Spatial relationships |

*Derivation.* The logical ordering of the predictive cycle is irreversible: a prediction must be generated before it can be verified, and verification must occur before the model can be updated. This Predict → Verify → Update sequence defines a primitive notion of directed process that is logically prior to physical time (Appendix O, Section O.5).

The 'Evolve' process (Definition 27) need not itself be a reset. When a cycle contains a registered logically irreversible reset, Theorem 31 gives $Q\ge k_BT H(P\mid R)$ for that operation. A physical arrow follows only on Appendix O's common-path-measure branch with positive entropy production; reversible or zero-conditional-entropy cycles are not declared dissipative.

Spatial structure emerges from the network topology of which-MPU-interacts-with-which. The propagation cost metric $d_{\mathcal{N}}(u,v)$ (Definition 35) defines "distance" as the minimum cumulative cost of propagating predictive information along network paths. "Nearby" means "within efficient interaction range." PCE optimization drives the network toward Geometric Regularity (Theorem 43), producing a smooth manifold structure in the continuum limit (Theorems 44–45). ∎

**Corollary P.8.1 (No Space Without Time, No Time Without Space).** In the PU framework, spatial geometry and temporal order are inseparable aspects of a single emergent structure—both arise from the same predictive cycle dynamics and PCE optimization. The question "what was there before spacetime?" is malformed: "before" is a temporal concept meaningful only within the emergent structure.

---

## P.8.4 The Physical Origin of the Arrow of Time

The Fundamental Predictive Loop supplies an operational order. A physical probability arrow additionally requires a pathwise forward/reverse certificate.

**Theorem P.8.2 (Conditional Physical Arrow of Time).** The predictive protocol has the definitional order
$$
P_{\mathrm{int}}\longrightarrow V\longrightarrow D_{\mathrm{cyc}}.
$$
Assume that a coherent macroscopic step consists of $N$ update cycles whose forward and reversed histories are measures on one event algebra, with
$$
\log\frac{P_F}{P_R}=\sum_{k=1}^N\sigma_k,
\qquad
\sigma_k\ge h_{\min}>0.
$$
Then
$$
\frac{P_R}{P_F}\le e^{-Nh_{\min}}.
$$
If $h_{\min}\ge\ln2$, this gives $P_R/P_F\le2^{-N}$. A registered-reset Landauer heat bound alone does not supply the pathwise hypothesis.

*Proof.* Definition 4 orders prediction before verification and verification before update, proving the protocol-order statement. For the physical probability statement, finite summation gives
$$
\log\frac{P_F}{P_R}
=\sum_{k=1}^N\sigma_k
\ge Nh_{\min}.
$$
Exponentiation and inversion of the positive path weights give
$$
\frac{P_R}{P_F}\le e^{-Nh_{\min}}.
$$
When $h_{\min}\ge\ln2$,
$$
e^{-Nh_{\min}}\le e^{-N\ln2}=2^{-N}.
$$
The conditional Landauer theorem bounds mean bath heat for a registered reset but contains no equality identifying that heat with each pathwise $\sigma_k$; it therefore cannot replace the displayed pathwise assumption. ∎

**Corollary P.8.2 (Conditional Decoder-Failure Entropy Ledger).** On a registered classical binary error-channel branch with the Golay encoder and an accepted decoder, error patterns of Hamming weight at most $3$ are uniquely correctable. Patterns outside that radius need not be correctable, but their frequency and entropy contribution depend on the physical channel and recovery protocol; failure is not inevitable from code distance alone. Any additional entropy export is therefore conditional and separate from the per-cycle bound $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$.



---

## P.8.5 The Emergence of Dimension

**Theorem P.8.3 (Faithful-Shell Minimal Carrier Dimension).** Assume the joint Appendix Z branch on which Theorem Z.5 gives $M=24$, Definition Z.9a supplies a response-preserving injection of those labels into distinct cells of an equal-radius Euclidean tangent shell, the regular $24$-cell is an admissible realization, and the comparison ledger assigns strictly greater surplus-carrier cost to every feasible dimension above the least feasible one. Then the selected carrier dimension is $D=4$.

*Proof.* A faithful shell in dimension $D$ requires
$$
24=M\le K(D).
$$
Since $K(3)=12$ and kissing number is nondecreasing, no $D\le3$ is feasible. The regular $24$-cell gives an explicit $24$-cell shell in $D=4$, so $D=4$ is feasible. It is therefore the least feasible dimension, and the registered strict surplus-carrier cost excludes every $D>4$. No equality $M=K(D)$ and no value of $K(5)$ is required. ∎

**Corollary P.8.3 (Certificate-Relative Four-Dimensional Carrier).** On the stated faithful-shell and strict-cost branch, $D=4$ is the unique selected Euclidean response-carrier dimension. Promoting it to a $3+1$ Lorentzian spacetime requires the separate continuum, hyperbolic-principal-symbol, time-orientation, and metric-reconstruction certificates.

**Remark P.8.2 (Counterfactual Scope).** For another independently fixed label count $M'$, the same selector is
$$
D_{\min}(M')=\min\{D\in\mathbb N:K(D)\ge M'\},
$$
provided an admissible response-preserving shell is explicitly constructed at the first feasible dimension. Counts that do not equal a kissing number are not geometrically frustrated: saturation is unnecessary. Thus $M'=8$ can use eight cells from a twelve-contact configuration in $D=3$, and $M'=30$ can use thirty cells from a known forty-contact configuration in $D=5$, subject in each case to the registered response-labeling certificate.

---

## P.8.6 The Emergence of Causality

**Theorem P.8.4 (Conditional Network Propagation-Speed Bound).** Assume a retained propagation branch with:

1. a separately registered per-edge duration $\Delta t_{xy}\ge\tau_{\min}>0$;
2. successive edge-by-edge serialization in the propagation-cost metric; and
3. edge lengths $d_{\mathcal N}(x,y)=\delta w_{xy}$ with $0<w_{xy}\le w_{\max}<\infty$.

Then every edge traversal and every serialized path obeys the uniform upper bound
$$
v\le\frac{\delta w_{\max}}{\tau_{\min}}.
$$
Theorem 29 supplies a characteristic internal Hamiltonian timescale but does not establish premise 1 for every ND-RID traversal. The displayed inequality need not be attained. An attained operational frontier is separate branch data, and its promotion to a Lorentzian characteristic cone requires Hypotheses O.7.2.1–O.7.2.4 together with the three-spatial-dimensional branch of Theorem Z.11.

*Proof.* For a serialized path of $n$ edges, the hypotheses give $t\ge n\tau_{\min}$ and $d_{\mathcal N}\le n\delta w_{\max}$. Division yields the stated bound. Nothing in the inequalities proves attainment, position-independence, or cone coincidence; those are the separately named branch inputs. ∎

**Corollary P.8.4 (Conditional Speed Normalization).** If the preceding bound is attained by a retained one-link process and the normalized uniform-weight branch has $w_{xy}=1$, then the attained frontier is $c=\delta/\tau_{\min}$. Without attainment, $\delta/\tau_{\min}$ is only an upper bound; Lorentzian interpretation still requires the Appendix O package.

---

## P.8.7 The Emergence of the Lorentzian Signature

**Theorem P.8.5 (Lorentzian Signature on the Appendix O Hyperbolic-Principal-Symbol Branch).** On the branch satisfying Hypotheses O.7.2.1-O.7.2.4 of Appendix O — a second-order continuum principal symbol, a positive-definite spatial block, an entropy-selected time coordinate, and a nondegenerate hyperbolic cone coinciding with the operational causal frontier — the emergent metric has Lorentzian signature $(-, +, +, +)$. This is not a standalone corollary of finite propagation speed; it is the signature theorem of Appendix O (Theorems O.7a-O.7b, Corollary O.7b.1) instantiated on the three-spatial-dimensional branch fixed by Theorem Z.11, with the operational causal frontier supplied by Theorem P.8.4.

*Proof.* The four hypotheses O.7.2.1-O.7.2.4 are supplied as follows on this branch.

**(i) Spatial sector (Hypothesis O.7.2.1, positive definiteness).** Assume the geometric, liminf, recovery, identification, and nondegeneracy hypotheses of Theorem D.6e, so that the rescaled propagation-cost Dirichlet forms Mosco-converge to a closed strongly local regular Cheeger energy whose leading spatial-gradient term is
$$
\int \langle \nabla_x u,\,A(x)\nabla_x u\rangle\,dx,
$$
with $A(x)$ symmetric and positive definite. This conditional continuum closure supplies the positive spatial block of Hypothesis O.7.2.1. Theorem P.8.4 supplies only the discrete operational speed bound and does not prove this Mosco/Γ-limit statement.

**(ii) Temporal sector (Hypotheses O.7.2.2-O.7.2.4).** Irreversibility (Theorem 31) together with Appendix O §O.4 supplies the entropy-selected time coordinate (Hypothesis O.7.2.2). Locality of ND-RID together with Proposition F.1 yields a finite propagation cone in the discrete theory; the second-order continuum principal symbol (Hypothesis O.7.2.3) is assumed on this branch and is the load-bearing structural input. Theorem 46 supplies a uniform operational causal-speed upper bound, while Theorem P.8.4 supports the spatial sector. Hypothesis O.7.2.4 separately assumes an attained nondegenerate operational frontier and its coincidence with a characteristic cone of the principal symbol. Under the four-hypothesis package, Appendix O Theorem O.7a yields Lorentzian signature $(-,+,+,+)$ for the characteristic quadratic form
$$
g^{\mu\nu}\,\xi_\mu\xi_\nu=-\frac{\xi_0^2}{c^2}+\xi^\top A(x)\,\xi,
$$
and Corollary O.7b.1 yields derived local Lorentz invariance with structure group $SO^+(1,3)$. The time orientation selected by Theorem 31 is fixed by Hypothesis O.7.2.2 without altering the signature. ∎

---

## P.8.8 What Emergence Explains

The emergence thesis resolves classical puzzles by transforming metaphysical questions into technical ones:

| Classical Puzzle | Traditional Answer | PU Framework Answer |
|------------------|-------------------|---------------------|
| Why does spacetime have this geometry? | Unknown; perhaps anthropic | PU answer remains branch-conditional: causal-diamond responses and continuum regularity determine the effective metric, while the Golay, registered Leech-gluing, and $24$-cell ledgers provide separate finite cross-checks |


| Why is spacetime 4-dimensional? | Unknown; perhaps necessary for stable structures | Because $K(4) = 24$ is the unique kissing number matching $M = 2ab = 24$ |
| Why is there an arrow of time? | Boundary conditions; low-entropy initial state | Because the predictive cycle is logically ordered and thermodynamically irreversible via $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ |
| Why does information obey locality? | Spacetime constrains physics | Reversed: information constraints produce spacetime; locality reflects finite propagation cost |
| What is spacetime "made of"? | Unknown; perhaps fundamental | On PU's operational branch, spacetime is an emergent response geometry of predictive relations; no classical code, graviton field, or fundamental metric substrate is identified as its material constituent |



---

## P.8.9 Conditional Information-to-Structure Reading

The PU chain links information-theoretic constraints to finite structural ledgers only on the named branches. The $24$-mode Golay entry is a classical code structure. It does not show that physical information is automatically protected, that matter/gauge sectors equal signal/parity coordinates, or that code distance produces spacetime. Those readings require the explicit response, gluing, physical error-channel/decoder, and mode-channel certificates stated in their source theorems.



John Wheeler's “It from Bit” motivates the stronger finite-substrate question: which registered information can remain recoverable under a specified physical noise channel?

**It from Certified Recoverable Bit.**

On the predictive-recovery branch, the binary self-dual $[24,12,8]$ Golay code is the unique admitted code maximizing the registered distance objective. The explicit Construction-B gluing theorem maps the marked code data to the rootless even unimodular lattice $\Lambda_{24}$, and Theorem P.13.10 independently selects that lattice as the strict Gaussian theta-cost minimizer on the fixed-normalization Niemeier class. The faithful Bures tangent-shell contract separately proves $24\le K(D)$ and selects the least feasible $D=4$ using $K(3)=12$ and the regular $24$-cell.

Physical quantum protection uses the punctured $[23,12,7]$ witness and its $[[23,1,7]]$ CSS construction only inside the accepted certificate $\mathfrak C_{\mathrm{GQEC}}$, which supplies a noise model, syndrome extraction, implementable recovery, threshold inequality, leakage/correlation audit, and non-transversal resource ledger. The rate-$1/2$ signal/parity split is code bookkeeping; matter/gauge interpretation requires the separate response map. Thus the code, lattice, dimension, and physical-QEC mechanisms form a commutative certified chain without identifying one theorem's premises with another's.

# P.8.9a What is Life?

Schrödinger's qualitative negentropy question motivates a comparison among organization, entropy flow, and error tolerance. PU does not identify these quantities universally. A relation requires a specified state space, degradation channel, recovery operation, and physical work ledger. The genetic code supplies an error-tolerant biological example, not a formal identity with a linear block code or SPAP entropy.

This section therefore separates thermodynamic cost, recovery capacity, redundancy, and biological persistence before stating branch-conditional comparisons.

---



This section develops this comparison across five domains: the thermodynamic conditions under which biological recovery is required and the separation of negentropy, capacity, and redundancy (P.8.9a.1–2), the structure of DNA as error-tolerant organization (P.8.9a.3–4), the conditional generational-PCE representation of normalized selection (P.8.9a.5–6), the emergence of Consciousness Complexity in biological aggregates on its stated branches (P.8.9a.7–8), and testable predictions for biological research (P.8.9a.9–10).

---

## P.8.9a.1 The Thermodynamic Imperative for Code

On a completed physical reset-support branch, each implemented registered reset obeys
$$
\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R).
$$
A branch-uniform positive floor requires the additional certificate $H_q(P\mid R)\ge h_{\min}>0$. This is a conditional reset-cost statement from Theorem 31; it does not imply that every predictive cycle contains such a reset, that every persistent system undergoes continuous degradation in its retained variables, or that a recovery mechanism is required without the degradation-bearing or mixing hypotheses of Theorem P.8.9a.1.



On the predictive-recovery MacWilliams branch, the classical ledger independently fixes $R=k/n=1/2$ and then selects the extended Golay code at fixed $(n,k)$. This supplies a candidate redundancy organization, not a physical recovery mechanism. A physical claim requires an encoder, channel, syndrome instrument, decoder, and reset-resource ledger.

No inequality or equality between $(1-R)C_{max}$ and $\varepsilon_{SPAP}$ follows from the code data alone. Theorem P.8.9a.2 requires a constitutive map with common units and nonoverlapping resource accounting before such quantities may be compared.



**Theorem P.8.9a.1 (Thermodynamic Necessity of Recovery Capacity for Biological Code).** On a degradation-bearing branch as defined below, persistence of a finite response-relevant distinction beyond the passive mixing time requires an active recovery resource or an invariant protected subsystem. Coded inheritance is one biological realization; the theorem does not require recovery on branches whose passive dynamics preserve all viability distinctions.



*Proof.* Let $\rho$ denote the retained state of the degrees of freedom encoding the structure's functional organization. A persistent complex structure must preserve a finite set of response-relevant distinctions across many predictive cycles. Each completed cycle carries the entropy floor
$$
\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)
$$
(Theorem 31) and finite transfer budget (Proposition E.2a). Thus passive persistence cannot rely on cost-free exact copying or cost-free exact restoration of all response-relevant distinctions.

The viability threshold for the structure is the minimum trace-distance separation $\Delta_{\mathrm{viab}}>0$ between alternative response-relevant configurations below which the structure no longer instantiates the functional predictive role characterizing its complex organization (i.e., below which the structure ceases to operate at $C_{op}$ in the sense of Definition 13). The threshold is a branch-defined parameter of the functional organization, not of the patch.

Let $\mathcal N_T$ denote the passive effective channel over a time interval $T$ on the retained organizational degrees of freedom, and let $\{\rho_i\}$ denote the response-relevant configuration set whose pairwise trace-distance separations exceed $\Delta_{\mathrm{viab}}$ at $T=0$. A branch is *degradation-bearing* if there exist a pair $\rho_i\ne\rho_j$ in this set and a finite $T_0$ such that the iterated passive channel obeys
$$
D_{tr}\!\bigl(\mathcal N_{T_0}^{\circ k}(\rho_i),\mathcal N_{T_0}^{\circ k}(\rho_j)\bigr)<\Delta_{\mathrm{viab}}
\qquad
\text{for all sufficiently large }k.
$$
This condition is strictly stronger than mere non-reversibility of $\mathcal N_{T_0}$: a non-reversible channel can in principle preserve distinctness above threshold for the response-relevant configurations, in which case passive persistence is consistent with the entropy floor and no recovery is needed. Refresh/minorization branches with strict trace-distance contraction $f_{RID}<1$ are degradation-bearing because contraction drives distinguishability to zero on every iterated trajectory; ordinary finite-temperature or environmental branches whose mixing time on the response-relevant set is finite are degradation-bearing for analogous reasons. Branches whose passive dynamics happen to preserve every $\Delta_{\mathrm{viab}}$-separation indefinitely are not degradation-bearing and fall outside the scope of this theorem.

If the structure is to persist on a degradation-bearing branch for arbitrarily many intervals of length $T_0$, there must exist recovery maps $\mathcal R_k$ such that, on the retained code ledger $\mathcal C$,
$$
D_{tr}\!\bigl(\mathcal R_k\mathcal N_{T_0}^{\circ k}(\rho_i),\rho_i\bigr)<\Delta_{\mathrm{viab}}
$$
for every $\rho_i$ in the response-relevant configuration set, after each interval. Without such recovery, the degradation condition pushes some response-relevant pair below $\Delta_{\mathrm{viab}}$, and the data-processing inequality prevents passive evolution from restoring the distinction.

A nontrivial recovery map for a nontrivial noise channel requires redundancy: the protected logical distinctions must be embedded into a larger physical carrier so that error syndromes can be distinguished without destroying the logical response. In the quantum case this is the Knill-Laflamme condition for correctability; in the classical finite-response case it is the existence of distinct syndrome classes whose correction restores the same logical response class. Therefore persistent complex organization on degradation-bearing PU branches requires recovery capacity, and biological coded inheritance is a PCE-efficient finite-response implementation of that requirement. ∎

On degradation-bearing biological branches, coded inheritance is an efficient recovery realization because it helps preserve response-relevant distinctions across update cycles. Non-degrading or invariant-subsystem branches are outside this necessity claim. The Golay ledger remains only a redundancy analogy unless a physical error-channel and recovery certificate is supplied.



---

## P.8.9a.2 Separation of Negentropy, Capacity, and Redundancy

Negative thermodynamic entropy flow, classical redundancy, achievable channel rate, and error-correction radius are different operational ledgers. None is definitionally equal to another.

### P.8.9a.2.1 Conditional Resource Comparison

### P.8.9a.2.2 Entry Counts Are Not Parameter Counts

A $12\times12$ displayed array has $144$ entries, but constraints, basis changes, symmetries, and gauge equivalences may reduce its independent information. Equal entry counts across several arrays do not identify their parameter spaces or physical mechanisms. Any claimed correspondence requires an explicit invertible response-preserving map and rank audit.



Schrödinger proposed that living systems maintain their organization by importing order from their environment to compensate for the entropy they inevitably produce. The PU framework provides a precise quantitative realization of this insight.

**Definition P.8.9a.1 (Negentropy Reservoir).** The *negentropy reservoir* of an error-correcting code $[n, k, d]$ is the set of $n - k$ parity modes whose function is to enable recovery of the $k$ signal modes from corrupted codewords. For the Golay code $[24, 12, 8]$, the negentropy reservoir consists of the 12 parity modes.

**Thesis P.8.9a.1 (Negentropy–Error Correction Equivalence).** Within the PU framework, negative entropy and error correction capacity are operationally equivalent:

$$\text{Negentropy} \equiv \text{Error Correction Capacity}$$

Both represent stored capacity to restore order after degradation. The parity modes operationally realize the negative entropy—ordered structure whose function is enabling recovery from disorder.

*Remark: Scope of Equivalence.* This equivalence is operational within the PU framework, not a general mathematical identity. Schrödinger's original concept was qualitative; the PU framework provides a precise quantitative realization for the predictive substrate.

### P.8.9a.2.3 Quantitative Correspondence

The following is a conditional numerical identity between two separately registered branch values.

**Theorem P.8.9a.2 (Conditional Rate–Budget Identity).** Assume the residual-budget same-family saturation branch on which
$$
C_{\max}^*
=
\ln d_0-\varepsilon_0
=
2\ln2
$$
for $(d_0,\varepsilon_0)=(8,\ln2)$, and independently assume the predictive-recovery MacWilliams branch selecting a binary $[24,12,8]$ code with rate $R=1/2$. Then
$$
(1-R)C_{\max}^*
=
\ln2
=
\varepsilon_0.
$$
This equality is arithmetic on the conjunction of the two branch values. It does not identify twelve physical interface modes as parity modes, equate structural log-cardinality with reset heat or total entropy production, or show that every SPAP cycle implements a reset.

*Proof.* Direct substitution gives
$$
(1-R)C_{\max}^*
=
\left(1-\frac12\right)(2\ln2)
=
\ln2
=
\varepsilon_0.
$$
The code rate follows from the predictive-recovery MacWilliams gate, while $C_{\max}^*$ follows from the independently assumed residual-budget saturation. A physical interpretation requires a registered encoder, channel, syndrome instrument, recovery map, and non-double-counted resource ledger. ∎

### P.8.9a.2.4 The 144-Parameter Structural Correspondence

**Theorem P.8.9a.3 (Structural Parameter Correspondence).** Three independently-derived structures share identical parameter counts:

| Structure | Parameter Count | Origin |
|-----------|-----------------|--------|
| Golay parity matrix $P$ | $k^2 = 12^2 = 144$ entries | Error correction (Theorem Z.13) |
| Active-inactive coupling | $b \times M = 6 \times 24 = 144$ couplings | Thermodynamic partition (Theorem Z.5) |
| Interface constraint tensor | $k \times k = 12 \times 12 = 144$ constraints | QFI structure (Section Z.13.5) |

*Proof.* On the structural active-record branch, the match/mismatch alternatives, entropy capacity at $\varepsilon_0=\ln2$, and no-surplus selection give $a=2$. Independently assume the minimal-carrier value $d_0=8$. Then
$$
b=d_0-a=8-2=6,
\qquad
M=2ab=2\cdot2\cdot6=24.
$$
On the predictive-recovery MacWilliams self-dual-rate branch (Definition Z.13b.0 and Theorem Z.13b.0a),
$$
k=\frac{M}{2}=12.
$$
Therefore
$$
k^2=12^2=144,
\qquad
bM=6\cdot24=144,
$$
and hence $k^2=bM=144$. The registered physical-reset inequality $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ is a separate thermodynamic statement and is not used in this numerical identity. Equality of the three parameter counts does not by itself identify the corresponding maps or tensors. ∎

*Interpretation.* The 144-entry Golay parity matrix $P \in \mathbb{F}_2^{12 \times 12}$ specifies how to correct errors [MacWilliams & Sloane 1977]. On the predictive-recovery self-dual-rate branch, Theorem Z.13a proves the numerical identity $k^2=bM=144$. Theorem Z.5 proves only the mode count $M=24$. Equality of these entry counts is a structural correspondence; it does not identify the Golay parity-matrix space, the active-inactive coupling space, and the QFI constraint space without an additional map preserving their operations and response data.

---

## P.8.9a.3 DNA and the Properties of Error-Correcting Codes

The genetic code exhibits error-tolerant properties analogous to error-correcting codes, whose theoretical foundations were established by Shannon [Shannon 1948] and whose structural definitions were formalized by Hamming [Hamming 1950]:

**Definition P.8.9a.2 (Error-Correcting Code Properties).** An error-correcting code $[n, k, d]$ is characterized by:
- Block length $n$: number of symbols per codeword
- Dimension $k$: number of information symbols
- Minimum distance $d$: minimum Hamming distance between distinct codewords
- Rate $R = k/n$: information efficiency
- Error correction capacity $t = \lfloor(d-1)/2\rfloor$

The genetic code exhibits structural parallels to these properties:

**Table P.8.9a.1: Structural Comparison of Physical and Biological Codes**

| Property | Golay Code $[24, 12, 8]$ | Genetic Code |
|----------|-------------------------|--------------|
| Block structure | 24-bit blocks | 3-nucleotide codons |
| Codewords | $2^{12} = 4096$ codewords | 64 codons |
| Information content | 12 formal information bits | 20 amino acids plus one termination class, i.e. 21 functional output classes |
| Redundancy / degeneracy | Formal linear-code rate $R=12/24=0.5$ | 64 codons map to 21 output classes; the output occupancy fraction is $21/64\approx0.328$, while the information rate $\log_2 21/6\approx0.732$ is not a Shannon-Hamming linear-code rate |
| Error tolerance | Corrects up to 3 bit errors by syndrome decoding | Wobble and chemical-neighborhood structure reduce the phenotypic impact of some point mutations |
| Organized redundancy | 12 parity bits protect 12 signal bits | Synonymous codons cluster by chemical similarity |

**Proposition P.8.9a.1 (Genetic Code Redundancy Structure).** The mapping from 64 codons to 20 amino acids plus stop signals exhibits non-random redundancy organization consistent with error-tolerance optimization.

*Evidence.* The wobble hypothesis [Crick 1966] and subsequent quantitative analyses [Freeland & Hurst 1998; Novozhilov et al. 2007] demonstrated that:

1. Synonymous codons (those encoding the same amino acid) typically differ only in the third ("wobble") position [Crick 1966]
2. Amino acids with similar chemical properties are encoded by similar codons [Freeland & Hurst 1998]
3. The observed code is more error-resistant than the vast majority of random alternatives [Freeland & Hurst 1998; Novozhilov et al. 2007]


This organization reduces the phenotypic impact of point mutations and mistranslation under the cost functions used in the cited studies. In the translation-error-weighted random-code ensemble of Freeland and Hurst (1998), about one generated alternative in $10^6$ was more efficient than the standard code. This is an ensemble- and score-dependent tail frequency, not a probability that the historical code arose by chance. It is compatible with selection for error tolerance, but it does not by itself identify the historical causal mechanism.

**Remark: Distinction from Formal ECCs.** The genetic code exhibits error-tolerant *properties* consistent with selection for robustness, but it lacks the formal algebraic structure of codes like the Golay code. Specifically:
- No finite field structure over codon space
- No syndrome decoding algorithm
- No guaranteed $t$-error correction capacity

The appropriate characterization is that the genetic code *exhibits error-correcting properties*, not that it *is* a formal error-correcting code in the Shannon-Hamming sense. The parallel is structural and functional, revealing shared optimization principles rather than mathematical identity.

**Remark: Code Optimality.** The genetic code is not globally optimal among all possible codes [Novozhilov et al. 2007], but it is highly optimized within constraints imposed by the translation machinery and evolutionary accessibility. This parallels the PU framework's treatment: PCE selects the optimal code *subject to physical constraints*, not an abstract mathematical optimum.

---

## P.8.9a.4 Hierarchical Error Correction in Biological Systems

Biological systems implement error correction at every organizational level, forming a nested hierarchy of protection mechanisms:

**Table P.8.9a.2: Hierarchical Error Correction in Biology**

| Level | Error Source | Correction Mechanism | Quantitative record required for a common cost ledger |
|-------|-------------|---------------------|-------------------------------------------------------|
| DNA replication | Polymerase misincorporation | Proofreading exonuclease | Organism, polymerase, assay-defined error rate before and after proofreading, ATP-equivalent work per incorporated base, and uncertainty |
| DNA maintenance | Oxidative damage, radiation | Base excision repair, mismatch repair | Lesion flux, repair success probability, energy and material expenditure per repaired lesion, and accounting interval |
| Transcription | RNA polymerase errors | Nonsense-mediated decay, RNA surveillance | Transcript flux, assay-defined error rate, surveillance success probability, and ATP-equivalent work per accepted transcript |
| Translation | Ribosome and aminoacylation errors | Aminoacyl-tRNA synthetase proofreading | Codon flux, mistranslation rate, proofreading success probability, and ATP/GTP-equivalent work per accepted residue |
| Protein folding | Misfolding, aggregation | Chaperone systems (HSP70, HSP90) | Substrate flux, refolding/degradation probabilities, and ATP-equivalent work per accepted protein |
| Cellular | Damaged organelles, senescence | Autophagy, apoptosis | Organelle or cell turnover rate, replacement work, and tissue-level accounting boundary |
| Organismal | Tissue damage, infection | Immune system, regeneration | Physiological state, observation interval, maintenance power, and whole-organism energy budget |

These mechanisms use resources measured with different denominators. A quantitative aggregate requires a specified organism and physiological state, one time interval and system boundary, conversion of every entry to a common unit such as energy per accepted biological output or maintenance power, and propagated uncertainties. The cited literature supports the qualitative existence of substantial maintenance expenditure but does not supply a universal scalar overhead from the heterogeneous entries above [Flamholz et al. 2014; Buttgereit & Brand 1995; Lynch & Marinov 2015].

**Theorem P.8.9a.4 (Conditional Error-Correction Overhead Scaling).** Let $N_{prot}$ be the number of additive protected records and let
$$
N_{cyc}:=\left\lceil\frac{T}{\tau_{cycle}}\right\rceil,
\qquad
N:=N_{prot}N_{cyc}.
$$
Assume:

1. the $N$ registered error opportunities are independent and have the same raw error probability $p_0\in(0,1/2)$;
2. a declared global reliability budget $p_{fail}^*\in(0,1)$ is allocated uniformly, so each opportunity is protected to logical error at most $p_{fail}^*/N$;
3. coding overhead is additive across the $N_{prot}$ protected records;
4. the branch carries the lower-envelope converse certificate of Proposition A.0.4 and a matching construction: for constants $0<A\le B<\infty$ independent of $N$,
$$
A\ln\!\left(\frac{p_0}{p}\right)
\le C_{rec}^{min}(p)
\le B\ln\!\left(\frac{p_0}{p}\right)
$$
for all sufficiently small target errors $p$.

Then the minimum installed error-correction overhead satisfies
$$
C_{EC}^{min}
=
\Theta\!\left(N_{prot}\ln N\right)
=
\Theta\!\left[N_{prot}\ln\!\left(N_{prot}\left\lceil\frac{T}{\tau_{cycle}}\right\rceil\right)\right].
$$
If $C_{agg}$ is defined in protected-record units with $N_{prot}=\Theta(C_{agg})$, and $N_{prot}$ is constant or has logarithm asymptotically subordinate to $N_{cyc}$ in the declared persistence limit, this specializes to
$$
C_{EC}^{min}
=
\Theta\!\left(C_{agg}\ln(T/\tau_{cycle})\right).
$$

*Proof.* The uniform reliability allocation and the union bound give total failure probability at most
$$
N\frac{p_{fail}^*}{N}=p_{fail}^*.
$$
For one protected record, substitute $p=p_{fail}^*/N$ into the matching bounds:
$$
A\ln\!\left(\frac{p_0N}{p_{fail}^*}\right)
\le C_{rec}^{min}
\le
B\ln\!\left(\frac{p_0N}{p_{fail}^*}\right).
$$
Because $p_0$ and $p_{fail}^*$ are held constant, the middle quantity is $\Theta(\ln N)$. Additivity over $N_{prot}$ records gives $C_{EC}^{min}=\Theta(N_{prot}\ln N)$. The final specialization follows from the stated identification and growth condition. ∎

This theorem concerns a declared independent equal-error record model and installed coding overhead. It is not a universal law for biological maintenance power or cumulative repair work.

### P.8.9a.4.1 Classical Golay Distance and the Physical Error-Channel Gate

**Theorem P.8.9a.5 (Golay Optimality from Griesmer Bound).** The extended binary Golay code achieves the maximum possible minimum distance $d=8$ among binary linear $[24,12]$ codes and is unique up to coordinate permutation among binary linear $[24,12,8]$ codes.

*Proof.* The binary Griesmer bound [Griesmer 1960] gives
$$
n\ge\sum_{i=0}^{k-1}\left\lceil\frac d{2^i}\right\rceil.
$$
For $(k,d)=(12,9)$ the sum is
$$
9+5+3+2+1+1+1+1+1+1+1+1=27>24,
$$
so every binary linear $[24,12,d]$ code has $d\le8$. The extended binary Golay code exists with $d=8$. The classification of Pless (1968), strengthened by Delsarte and Goethals (1975), states that every binary linear $[24,12,8]$ code is equivalent to it under a coordinate permutation. ∎

| Property | Classical value | Valid conclusion |
|----------|-----------------|------------------|
| Unique-correction radius | $t=\lfloor(d-1)/2\rfloor=3$ | Every classical additive Hamming error of weight at most $3$ has a unique nearest codeword |
| Detection radius | $d-1=7$ | Every nonzero classical additive Hamming error of weight at most $7$ is detected |
| Rate | $R=k/n=1/2$ | The code subspace has dimension $12$ in $\mathbb F_2^{24}$; no canonical physical payload/protection coordinate split follows |
| Minimum distance | $d=8$ | This is optimal in the binary linear $[24,12]$ parameter class |

**Theorem P.8.9a.5a (Conditional Physical Protection on a Registered Error Channel).** Let $\mathcal E$ be an explicit encoder from the retained logical state space into a declared 24-carrier physical state space, let $\mathcal N$ be a specified physical noise channel, let $\mathcal S$ be a syndrome instrument, and let $\mathcal R$ be a recovery map. Assume a normed performance certificate on the admitted state class $\mathfrak S$,
$$
\sup_{\rho\in\mathfrak S}
\left\|
\mathcal R\circ\mathcal S\circ\mathcal N\circ\mathcal E(\rho)-\rho
\right\|_1
\le\epsilon,
$$
or the corresponding diamond-norm channel bound. Then the registered physical implementation protects the admitted states to error at most $\epsilon$. If the physical fault model is exactly represented by classical additive Hamming patterns of weight at most three and the certificate has $\epsilon=0$, the recovery map restores those faults with zero residual error. Vacuum fluctuations or quantum faults are covered only when the specified physical channel and certificate include them.

*Proof.* The first conclusion is the displayed performance hypothesis. On the exact classical-fault subbranch, Theorem P.8.9a.5 gives a unique syndrome/nearest-codeword correction for every Hamming pattern of weight at most three; the registered maps are assumed to realize that correction on the physical carrier, so the composite channel is the identity on $\mathfrak S$. A general quantum or vacuum noise channel need not reduce to a classical additive Hamming pattern, and therefore requires the separately stated channel certificate. ∎

---

## P.8.9a.5 Conditional Generational-PCE Representation of Normalized Selection

This section proves an equation-level representation on a declared finite-type biological branch. It does not identify all biological evolution with PCE, derive biological constitutive dynamics from PCE, or claim that the elementary normalized-update correspondence is novel. The representation is non-teleological: conditional on the stated biological branch contract, it describes a normalized frequency update and no foresight, intention, or universal evolutionary objective is inferred.

The PU framework supplies a conditional bridge between biological selection and PCE. On a declared generational model whose heritable types carry a generational PCE ledger and whose relative viable-descendant weights are exponential in the negative ledger value, normalized selection is exactly multiplicative PCE reweighting. The result is a non-teleological frequency-update theorem on that branch, not an assertion that every evolutionary mechanism is generated by PCE without a biological constitutive model.

### P.8.9a.5.1 The Evolutionary POP

**Definition P.8.9a.3 (Generational POP).** Fix a biological prediction task $T_{\mathrm{gen}}$, score $q_{\mathrm{gen}}$, evaluation window $W_{\mathrm{gen}}$, and a nonempty admissible class $\mathcal A_{\mathrm{gen}}$ of heritable transition or variation policies.

Fix a registered implementation map
$$
\iota_{\mathrm{gen}}:
\mathcal A_{\mathrm{gen}}
\to
\mathcal S_{\mathrm{phys}}.
$$
For each $\mu\in\mathcal A_{\mathrm{gen}}$, let $\mathbb P_{\mu}$ be the declared one-generation outcome law and let $\Delta Q_{\mathrm{reproductive}}$ be an integrable registered PU predictive-quality increment for $(T_{\mathrm{gen}},q_{\mathrm{gen}},W_{\mathrm{gen}})$ under $\mathbb P_{\mu}$. Define the implementation complexity
$$
C_{\mathrm{gen}}(\mu)
:=
C_P\!\left(\iota_{\mathrm{gen}}(\mu)\right).
$$
For a finite available budget $C_{\mathrm{available}}$, define

$$
\operatorname{POP}_{\mathrm{gen}}
=
\sup_{\substack{\mu\in\mathcal A_{\mathrm{gen}}\\
C_{\mathrm{gen}}(\mu)\le C_{\mathrm{available}}}}
\mathbb E_{\mu}\!\left[\Delta Q_{\mathrm{reproductive}}\right],
$$

provided the feasible set is nonempty.

The quantity $\Delta Q_{\mathrm{reproductive}}$ is a registered PU predictive-quality increment for the fixed task, score, and window; it is not identified with raw descendant count unless a separate bridge establishes that identification. A maximizing policy exists only when the displayed supremum is attained.

*Interpretation.* Developmental trajectories, behavioral responses, and viable-descendant outcomes may serve as retained response variables only through the fixed task, score, window, and biological-to-PU implementation map. Selection changes heritable-type frequencies according to a separately declared viable-descendant law. The definition does not identify reproductive success with predictive performance; Proposition P.8.9a.6 states the additional branch contract required for the conditional comparison.

**Proposition P.8.9a.6 (Conditional Generational-PCE Representation of Fixed-Weight Selection).** Let $\mathcal I=\{1,\ldots,m\}$ be a nonempty finite set of heritable types and let $p(0)\in\Delta(\mathcal I)$ be their initial frequency vector. For each $i\in\mathcal I$, define the generational PCE ledger

$$
V_{\mathrm{gen}}(i)
=
R_{\mathrm{metabolic}}(i)
+
R_{\mathrm{reproductive}}(i)
+
V_{\mathrm{penalty}}^{\mathrm{gen}}(i)
-
\Gamma_{\mathrm{fitness}}
B\!\left(PP_{\mathrm{survival}}(i)\right),
$$

where all terms are finite, $B$ is a fixed nondecreasing benefit map, and $\Gamma_{\mathrm{fitness}}$ converts the benefit to the same units as the cost terms. Assume:

0. There is a registered biological PCE branch contract $\mathfrak B$ in the sense of Definition D.1f, and $\mathcal I$ indexes a finite retained subset of $\mathcal X_{\mathfrak B}/\!\sim_{\mathfrak B}$. For some registered $\vartheta\in W_{\mathfrak B}$, $V_{\mathrm{gen}}$ is the descended scalar certificate $V_{\mathfrak B,\vartheta}$ on that subset. The branch ledger includes every admitted term whose omission could change the ordering of retained types.
1. $V_{\mathrm{gen}}$ is time-independent over the comparison window.
2. There are branch-specific constitutive parameters $a>0$ and $\lambda_{\mathrm{gen}}>0$, neither a universal PU constant, with $\lambda_{\mathrm{gen}}V_{\mathrm{gen}}$ dimensionless, such that the expected viable-descendant weight of type $i$ is
   $$
   w_i
   =
   a\exp\!\left[-\lambda_{\mathrm{gen}}V_{\mathrm{gen}}(i)\right].
   $$
3. Inheritance is faithful and generations do not overlap on the retained type coordinate: there is no mutation, recombination, migration, or other type flux. For some $N(0)>0$, let $N_i(0)=N(0)p_i(0)$ and assume the deterministic expected-count or infinite-population update
   $$
   N_i(t+1)=w_iN_i(t).
   $$

For every $t\ge0$, let
$$
N(t):=\sum_{j\in\mathcal I}N_j(t)
$$
and define
$$
p_i(t):=\frac{N_i(t)}{N(t)}.
$$
On the deterministic expected-count branch these are normalized expected-count shares; they are not expected realized finite-population frequencies, which require a separate stochastic population model.

Let

$$
\mathcal I_0
=
\{i\in\mathcal I:p_i(0)>0\},
\qquad
V_*
=
\min_{i\in\mathcal I_0}V_{\mathrm{gen}}(i),
$$

and

$$
\mathcal M_*
=
\{i\in\mathcal I_0:V_{\mathrm{gen}}(i)=V_*\}.
$$

Then, for every integer $t\ge0$,

$$
p_i(t)
=
\frac{
p_i(0)\exp\!\left[-\lambda_{\mathrm{gen}}tV_{\mathrm{gen}}(i)\right]
}{
\sum_{j\in\mathcal I}
p_j(0)\exp\!\left[-\lambda_{\mathrm{gen}}tV_{\mathrm{gen}}(j)\right]
},
$$

and

$$
\lim_{t\to\infty}p_i(t)
=
\begin{cases}
\dfrac{p_i(0)}
{\sum_{j\in\mathcal M_*}p_j(0)},
&
i\in\mathcal M_*,
\\[10pt]
0,
&
i\notin\mathcal M_*.
\end{cases}
$$

Thus the normalized expected-count shares, or the frequencies on the deterministic infinite-population reading, concentrate exactly on the global minimizers of $V_{\mathrm{gen}}$ within the initial support. If $\mathcal M_*=\{i_*\}$, then $p(t)\to e_{i_*}$.

*Proof.* Since $w_i>0$ and $\sum_iN_i(0)=N(0)>0$, the total expected count remains positive. Normalizing the count update gives

$$
p_i(t+1)
=
\frac{p_i(t)w_i}
{\sum_{j\in\mathcal I}p_j(t)w_j}.
$$

The common factor $a$ cancels. Iterating the count equation gives

$$
N_i(t)
=
N_i(0)a^t
\exp\!\left[-\lambda_{\mathrm{gen}}tV_{\mathrm{gen}}(i)\right].
$$

Division by $\sum_jN_j(t)$ and $N_i(0)=N(0)p_i(0)$ proves the displayed frequency formula.

For convergence, put

$$
\delta_i
=
V_{\mathrm{gen}}(i)-V_*
\ge0
\qquad
(i\in\mathcal I_0)
$$

and

$$
q_*
=
\sum_{j\in\mathcal M_*}p_j(0)>0.
$$

After multiplying numerator and denominator by
$\exp(\lambda_{\mathrm{gen}}tV_*)$, the frequency formula becomes, for every $i\in\mathcal I_0$,

$$
p_i(t)
=
\frac{p_i(0)e^{-\lambda_{\mathrm{gen}}t\delta_i}}
{\sum_{j\in\mathcal I_0}
p_j(0)e^{-\lambda_{\mathrm{gen}}t\delta_j}}.
$$

The denominator is at least $q_*$ for every $t$. If $i\notin\mathcal I_0$, the original frequency formula gives $p_i(t)=0$ for every $t$. If $i\in\mathcal I_0\setminus\mathcal M_*$, then $\delta_i>0$, so the numerator tends to zero and hence $p_i(t)\to0$. If $i\in\mathcal M_*$, then $\delta_i=0$. Every term with positive $\delta_j$ tends to zero, while the terms with $j\in\mathcal M_*$ sum to $q_*$. Therefore $p_i(t)\to p_i(0)/q_*$. The finite type set makes these limits exhaustive and proves concentration on $\mathcal M_*$. The singleton case follows immediately. ∎

**Theorem P.8.9a.6a (Exact Normalized-Selection–Bayes–Multiplicative-Weights Correspondence).** Let

$$
\Delta(\mathcal I)
=
\left\{
p\in[0,1]^m:
\sum_{i\in\mathcal I}p_i=1
\right\},
$$

let $p\in\Delta(\mathcal I)$, let $w\in[0,\infty)^{\mathcal I}$, and define

$$
Z(p,w)
=
\sum_{j\in\mathcal I}p_jw_j.
$$

On the exact domain

$$
\mathcal D
=
\left\{
(p,w)\in\Delta(\mathcal I)\times[0,\infty)^{\mathcal I}:
Z(p,w)>0
\right\},
$$

define the normalized-selection map

$$
\bigl[\mathsf S_w(p)\bigr]_i
=
\frac{p_iw_i}{Z(p,w)}.
$$

Then the following statements hold.

1. **Bayesian form.** Choose any
   $$
   0<c\le\frac{1}{\max_{j\in\mathcal I}w_j}.
   $$
   This interval is nonempty because $Z(p,w)>0$ implies $\max_jw_j>0$. Let $\{H_i\}_{i\in\mathcal I}$ be hypotheses with prior $\mathbb P(H_i)=p_i$, and let $Y\in\{0,1\}$ satisfy
   $$
   \mathbb P(Y=1\mid H_i)=cw_i.
   $$
   Then $\mathbb P(Y=1)=cZ(p,w)>0$ and
   $$
   \mathbb P(H_i\mid Y=1)
   =
   \bigl[\mathsf S_w(p)\bigr]_i.
   $$

2. **Exponential- or multiplicative-weights form.** Fix any learning rate $\eta>0$ and define the extended loss
   $$
   \ell_i
   =
   \begin{cases}
   -\eta^{-1}\ln w_i,
   &
   w_i>0,
   \\[4pt]
   +\infty,
   &
   w_i=0.
   \end{cases}
   $$
   With the convention $e^{-\eta(+\infty)}=0$, the multiplicative-weights update is
   $$
   \frac{p_ie^{-\eta\ell_i}}
   {\sum_{j\in\mathcal I}p_je^{-\eta\ell_j}}
   =
   \bigl[\mathsf S_w(p)\bigr]_i.
   $$
   If every $w_i>0$, all losses are finite. In the Bayesian realization of part 1, unit-rate log loss
   $$
   \ell_i^{\log}
   =
   -\ln(cw_i)
   $$
   gives the same normalized update.

   For $w_i>0$ this is the ordinary finite-loss exponential-weights update. Allowing $w_i=0$ uses the declared $+\infty$ boundary extension and does not invoke any standard bounded-loss regret theorem.

3. **Support and zero boundary.** On $\mathcal D$,
   $$
   \operatorname{supp}\mathsf S_w(p)
   =
   \operatorname{supp}(p)\cap\operatorname{supp}(w).
   $$
   Hence $p_i=0$ is preserved in the absence of type flux, and a type with $p_i>0$ and $w_i=0$ is removed in one step. Moreover,
   $$
   Z(p,w)=0
   \quad\Longleftrightarrow\quad
   w_i=0
   \text{ for every }i\in\operatorname{supp}(p).
   $$
   At that boundary the normalized-selection update is undefined, the Bayesian event $Y=1$ has prior-predictive probability zero, and the multiplicative-weights denominator is zero. None of the three formalisms supplies a normalized posterior or successor state there without an additional rule.

4. **Common-scale invariance.** For every $r>0$,
   $$
   \mathsf S_{rw}(p)=\mathsf S_w(p).
   $$
   Thus only relative fitness, relative likelihood, or loss differences enter the normalized map.

5. **Constant-relative-fitness iteration.** Suppose a sequence of raw generational weights has the form
   $$
   w_i(t)=a_t w_i,
   \qquad
   a_t>0,
   $$
   for one fixed $w$, and suppose $Z(p(0),w)>0$. Then for every integer $t\ge1$,
   $$
   p_i(t)
   =
   \frac{p_i(0)w_i^t}
   {\sum_{j\in\mathcal I}p_j(0)w_j^t}.
   $$
   In particular, whenever
   $p_i(0)p_j(0)w_iw_j>0$,
   $$
   \frac{p_i(t)}{p_j(t)}
   =
   \frac{p_i(0)}{p_j(0)}
   \left(\frac{w_i}{w_j}\right)^t.
   $$

6. **Mutation and frequency-dependent boundaries.** Let $M=(M_{ij})$ be a column-stochastic parent-to-descendant mutation kernel,
   $$
   M_{ij}\ge0,
   \qquad
   \sum_{i\in\mathcal I}M_{ij}=1
   \quad
   \text{for every }j.
   $$
   Selection followed by mutation is
   $$
   p_i^+
   =
   \sum_{j\in\mathcal I}
   M_{ij}
   \frac{p_jw_j}{Z(p,w)}
   =
   \bigl[M\mathsf S_w(p)\bigr]_i.
   $$
   This update coincides with the unmutated map $\mathsf S_w(p)$ for every $(p,w)\in\mathcal D$ if and only if $M=I$. If instead $w=w(p,t)$ is frequency- or time-dependent, parts 1–4 remain valid pointwise at every step for which $Z(p,w(p,t))>0$. Part 5 applies when the weights along the retained trajectory are proportional to one fixed vector by a common positive factor; no fixed-weight multi-step formula follows in general.

*Proof.* For part 1, the law of total probability gives

$$
\mathbb P(Y=1)
=
\sum_j\mathbb P(H_j)\mathbb P(Y=1\mid H_j)
=
c\sum_jp_jw_j
=
cZ(p,w)>0.
$$

Bayes' rule therefore gives

$$
\mathbb P(H_i\mid Y=1)
=
\frac{p_i(cw_i)}{cZ(p,w)}
=
\frac{p_iw_i}{Z(p,w)}.
$$

For part 2, the definition of $\ell_i$ gives $e^{-\eta\ell_i}=w_i$ for $w_i>0$, while the stated convention gives the same equality when $w_i=0$. Substitution into the multiplicative-weights normalization gives $\mathsf S_w(p)$. Replacing $w_i$ by $cw_i$ multiplies every unnormalized weight by the same positive constant and therefore leaves the normalized vector unchanged.

For part 3, $Z(p,w)>0$ and nonnegativity imply

$$
\bigl[\mathsf S_w(p)\bigr]_i>0
\quad\Longleftrightarrow\quad
p_iw_i>0
\quad\Longleftrightarrow\quad
p_i>0\text{ and }w_i>0,
$$

which proves the support identity. Because every summand $p_iw_i$ is nonnegative, their sum is zero exactly when every summand is zero. For $i\in\operatorname{supp}(p)$ this is equivalent to $w_i=0$. The three zero-denominator statements then follow directly from their displayed normalizations.

For part 4,

$$
\bigl[\mathsf S_{rw}(p)\bigr]_i
=
\frac{p_i(rw_i)}{\sum_jp_j(rw_j)}
=
\frac{p_iw_i}{\sum_jp_jw_j}.
$$

For part 5, every common factor $a_t$ cancels by part 4, so the update at every step is $\mathsf S_w$. The formula holds for $t=1$ by definition. If it holds at $t$, then

$$
p_i(t+1)
=
\frac{
\left(
p_i(0)w_i^t/
\sum_kp_k(0)w_k^t
\right)w_i
}{
\sum_j
\left(
p_j(0)w_j^t/
\sum_kp_k(0)w_k^t
\right)w_j
}
=
\frac{p_i(0)w_i^{t+1}}
{\sum_jp_j(0)w_j^{t+1}}.
$$

Induction proves the formula for every $t\ge1$. Dividing the formulas for $i$ and $j$ proves the ratio identity under the stated positivity condition.

For part 6, a parent of type $j$ contributes its selected frequency $p_jw_j/Z(p,w)$, and $M_{ij}$ is the conditional fraction assigned to descendant type $i$; summing over parents gives $M\mathsf S_w(p)$. If $M=I$, equality with the unmutated map is immediate. Conversely, suppose

$$
M\mathsf S_w(p)=\mathsf S_w(p)
$$

for every $(p,w)\in\mathcal D$. For each $j$, choose $p=e_j$ and any $w$ with $w_j>0$. Then $\mathsf S_w(e_j)=e_j$, so $Me_j=e_j$. Thus every column of $M$ is the corresponding standard basis vector and $M=I$. Finally, replacing $w$ by the declared $w(p,t)$ in the proofs of parts 1–4 proves their pointwise forms. The induction in part 5 uses one fixed normalized map and therefore applies under the stated common-proportionality condition, while no such induction is asserted outside it. ∎

**Remark P.8.9a.6b (Mechanism, Mutation, and Reflexive Boundaries).** Theorem P.8.9a.6a is an exact equality of normalized equations on one finite type simplex. It does not by itself identify the causal mechanisms, state spaces, or PU functional roles of selection, Bayesian inference, and a learning algorithm. A claim that a biological process instantiates forecast generation, verification, or model update requires separate retained biological protocol maps establishing those roles. Mutation is the additional kernel $M$, recombination requires its own parent-to-descendant kernel, and neither is supplied by the normalized-selection identity. A diffusion or stochastic-gradient representation of those mechanisms requires an independently derived scaling limit and the regularity, drift, covariance, and boundary data of Appendix D; it does not follow from the presence of variation alone. The theorem concerns the discrete generational map and does not identify it with a continuous-time replicator differential equation without a separate continuous-time limit.

The normalized-selection, Bayesian, and exponential-weights equality is an elementary equation correspondence. No novelty is claimed for that algebraic identity, and no Bayesian consistency theorem, evolutionary stochastic-process theorem, or online-learning regret bound is imported by it.

Frequency dependence $w=w(p,t)$ establishes only that the selection weights depend on the current population state. By itself it supplies neither a model representing the system to itself in the sense of Definition 9 nor the coded evaluator, simulation, predicate evaluation, Boolean post-processing, logical memory, and uniform diagonal closure required by Theorems 10–11. Frequency-dependent selection therefore does not by itself engage SPAP, Reflexive Undecidability, or the horizon-constant construction.


 




 

### P.8.9a.5.2 Resolution of Evolutionary Puzzles

The PCE perspective resolves several classical puzzles:

**Puzzle 1: Why does complexity increase?**

*Standard view:* No clear thermodynamic driver; complexity increase appears contingent.

*PU resolution:* On a declared one-dimensional biological trait branch where $C$ obeys the complexity-adaptation dynamics of Definition 20, all remaining coordinates are held fixed or have been validly reduced, and the benefit map is the identity, the local direction of increasing complexity is selected exactly when

$$
\Gamma_0 \frac{\partial PP}{\partial C}
>
\lambda R'(C)+R'_I(C).
$$

This is the sign condition for that registered reduced dynamics, not a theorem that evolutionary complexity increases in every environment or lineage. Changes in ecological interactions, resource constraints, inheritance, or the other coordinates of the generational ledger can reverse the sign, produce a plateau, or invalidate the one-dimensional reduction.

**Puzzle 2: Why is evolution "creative"?**

*Standard view:* Random mutation plus selection; creativity is illusory.

*PU resolution:* Appendix D supplies a stochastic-gradient model only on branches whose retained adaptation variables admit its drift, diffusion, regularity, and boundary data. Mutation, recombination, and environmental variation do not automatically equal the Brownian term $\sqrt{2D(x)}\,dW_t$, and normalized selection does not automatically equal the drift $-\eta(x)\nabla V(x)$. When a biological scaling limit derives those coefficients and identifies its effective potential with the registered generational PCE ledger, Equation D.8 gives a conditional exploration-and-selection model. Without that bridge, evolutionary novelty remains governed by the separately specified biological variation and inheritance kernels.

**Puzzle 3: Why convergent evolution?**

*Standard view:* Similar selective pressures lead to similar solutions.

*PU resolution:* On a biological model in which the compared lineages share a specified retained state space, the same PCE potential $V$, and the same attracting basin, Theorem D.5 gives low-noise concentration near potential minima only under its detailed-balance hypotheses; Theorem D.6.5b gives basin convergence only on its regular Morse--Smale branch. Theorem D.3 proves regularity of global minima under its own hypotheses but does not prove that all minima are discrete or that distinct biological lineages share a landscape. Convergent evolution is therefore a conditional application of an explicitly supplied biological landscape model, not a consequence of Theorem D.3 alone.

**Puzzle 4: Why modularity and evolvability?**

*Standard view:* Modularity evolves because modular organisms evolve faster.

*PU resolution:* On a registered architectural comparison class, a modular candidate is PCE-favored only when its reduced cross-module propagation and adaptation costs lower the complete ledger of Definition D.1 after its interface, redundancy, coordination, and performance effects are included. PCE supplies the comparison rule; it does not prove that modularity lowers the ledger in every biological system. A modularity conclusion therefore requires an explicit response-preserving comparator and a strict total-potential inequality for the biological branch.

---

## P.8.9a.6 The Continuity of Life and Physical Law

The PU framework permits a branch-qualified comparison between physical code constructions and biological error-tolerant organization. The comparison records a common variational grammar where the relevant branch contracts exist; it does not identify their carriers, channels, or mechanisms:

**Table P.8.9a.3: Parallel Structure of Physical and Biological Codes**

| Property | Vacuum (Golay) | Life (Genetic) |
|----------|---------------|----------------|
| Block structure | 24 modes | 3 nucleotides (codon) |
| Redundancy | 12 signal + 12 parity modes | 64 codons map redundantly to 20 amino acids plus termination |
| Rate / degeneracy | Formal linear-code rate $R=1/2$ | Functional occupancy fraction $21/64\approx0.328$; information rate $\log_2 21/6\approx0.732$ |
| Error correction / tolerance | 3-error correcting by syndrome decoding | Point-mutation tolerance through wobble and chemical-neighborhood structure |
| Selection principle | PCE selection on the registered physical branch | Normalized selection equals generational PCE reweighting only under Proposition P.8.9a.6 |

**Thesis P.8.9a.2 (Continuity of Organization).** Physical code models and biological persistence models can instantiate the same branch-indexed PCE variational grammar when each domain supplies its own admissible state space, response quotient, cost ledger, and update law. This common grammar does not equate substrates, error channels, causal mechanisms, or functional roles. In the biological case, the exact theorem-level content is the conditional normalized-selection result of Proposition P.8.9a.6 and Theorem P.8.9a.6a.

The comparison extends the use of mathematical optimization language to the biological domain without deriving biological organization from a physical code theorem. Biological constitutive dynamics, inheritance kernels, environmental dependence, and empirical response maps remain independent inputs to the biological branch.



### P.8.9a.6.1 The Genetic Code as Evolved Error Tolerance

The genetic-code comparison is compatible with a PCE interpretation only after the admissible code ensemble, response score, evolutionary update, and alternative-mechanism test are fixed:

**Proposition P.8.9a.2 (Ensemble-Relative Genetic-Code Error Tolerance).** Under the random-code ensemble and translation-error-weighted efficiency score used by Freeland and Hurst (1998), the standard genetic code scores better than all but about one generated alternative in $10^6$.

*Evidence.* Quantitative analyses [Freeland & Hurst 1998; Novozhilov et al. 2007] support the following scoped statements:
1. The standard code has a low mutation/mistranslation cost under specified amino-acid cost functions
2. Synonymous and chemically related assignments contribute to that low score
3. The reported tail rank changes with the cost function, error weights, and admissible random-code ensemble

*Framework interpretation.* The random-code comparison is compatible with an evolutionary robustness hypothesis. Identifying its mechanism with PCE requires an independently specified evolutionary dynamics and a test against alternative mechanisms. The map from 64 codons to 20 amino acids plus stop signals has 21 output classes; without a linear encoding, channel, and parity-check map, its degeneracy is not a Golay parity count or a Shannon code rate.

---

## P.8.9a.7 Consciousness Complexity in Biological Systems

The PU framework's treatment of consciousness provides a natural extension of the error-correction perspective to neural systems. Consciousness Complexity (CC) emerges when biological aggregates exceed the operational threshold $C_{op}$ (Definition 13).

### P.8.9a.7.1 The CC Threshold in Biology

**Definition P.8.9a.4 (Biological CC).** The Consciousness Complexity of a biological system $S$ is:

$$\mathrm{CC}(S) = \alpha_\infty \cdot \mathcal{G}\left(\frac{C_{agg} - C_{op}}{C_{scale}}\right) \cdot \Theta(C_{agg} - C_{op})$$

(Definition 31), where:
- $C_{agg}$ is the aggregate complexity of the biological system
- $C_{op}$ is the operational threshold (Definition 13)
- $\mathcal{G}$ is a concave, monotone scaling function
- $\Theta$ is the Heaviside step function enforcing threshold behavior
- $\alpha_\infty \leq \alpha_{CC,max} < 0.5$ (Theorem 39)

**Theorem P.8.9a.7 (Emergence of Biological CC).** For biological MPU aggregates with $C_{agg} > C_{op}$, the emergent biasing capability (Theorem 34) manifests through the aggregate's capacity to modulate ND-RID probabilities via organized internal states.

*Mechanism.* From Hypothesis 3 and the analysis in Appendix L:
1. The biological aggregate develops a coherent internal state ($\text{context}_S$)
2. This state manifests physically through bioelectric patterns, neural activity, or other organized structures
3. These patterns modulate local ND-RID parameters within the aggregate
4. The modulation biases 'Evolve' outcomes in directions favorable to the aggregate's POP

### P.8.9a.7.2 Neural Systems and Predictive Processing

Predictive-processing models in neuroscience supply candidate neural variables for a PU bridge. Identifying a neural system with POP requires a registered task, score, cost ledger, forecast map, verifier, and update map:

**Proposition P.8.9a.3 (Conditional Neural-to-POP Modeling Bridge).** Fix a neural dynamical model $\mathfrak N$ together with a registered task $\mathcal T$, admissible action set $\mathcal A$, outcome law, score $Q$, resource coordinate $C_P$, internal-state encoder $e$, forecast map $f$, verification map $v$, and update map $u$. Assume:

1. $(e,f,v,u)$ realizes the Definition-4 phase maps and the Definition-5 capabilities on $\mathcal T$.
2. The performance functional computed from $Q$ is the registered $PP$ of that task.
3. The admissible-policy objective and resource constraint are exactly the POP objective and constraint of Axiom 1.

Then $\mathfrak N$ instantiates POP on that registered branch.

*Proof.* Assumption 1 supplies the required loop maps and capabilities. Assumption 2 identifies the optimized response functional with the registered PU performance, and assumption 3 identifies both the feasible set and objective with POP. Substitution therefore makes the neural policy problem identical to the registered POP problem. Without any one of these bridge assumptions, similarity of predictive-processing terminology does not establish PU implementation. ∎

*Candidate bridge coordinates:* predictive model $\mapsto M_t$; task-scored prediction error $\mapsto$ the registered $PP$ residual; precision $\mapsto$ a declared weighting coordinate; free energy $\mapsto$ a specified term of $V$ only after unit and sign matching; active inference $\mapsto$ a registered action-policy optimization only after the action and outcome maps are supplied. These arrows are modeling assignments certified by the proposition's hypotheses, not unconditional equivalences.

### P.8.9a.7.3 Bioelectric Codes and Morphogenetic CC

Levin's research on bioelectric signaling [Levin 2014, 2019, 2021] reveals CC-like phenomena at scales below neural systems:

**Definition P.8.9a.5 (Bioelectric Aggregate Complexity).** For gap junction-coupled cellular networks with coupling strength $g$:

$$C_{agg}(N, g) = C_0 \cdot N^{\alpha(g)}$$

where $\alpha(g) = 1 + \beta \tanh(g/g_c)$, $g_c$ is the percolation threshold, and $\beta \leq 1$ reflects network efficiency (Definition L.4.2).

**Proposition P.8.9a.4 (Morphogenetic CC).** Developmental and regenerative processes exhibit CC-like properties:
1. **Threshold behavior:** Pattern formation requires gap junction coupling above threshold
2. **Goal-directedness:** Bioelectric patterns encode target morphology, not just local instructions
3. **Error correction:** Perturbed patterns can self-correct if perturbation is below threshold
4. **Scale-free cognition:** Same principles operate from single cells to organ systems

*Evidence from Levin's experiments* [Levin & Martyniuk 2018; Levin 2021]:

* Planaria with altered bioelectric patterns regenerate abnormal structures [Durant et al. 2019]
* Voltage gradient manipulation can induce eye formation in non-eye locations [Pai et al. 2012]
* Gap junction disruption prevents morphogenetic error correction [Levin 2014; Levin 2021]

#### P.8.9a.7.3.1 Morphogenetic Target Attractors

The framework interpretation (Appendix L, Section L.4.1): bioelectric networks implement distributed error correction for morphogenetic information, with gap junction coupling determining effective $C_{agg}$ and thus CC capacity. The target morphology need not be stored as a localized template. It is the attractor set of the aggregate's morphogenetic PCE potential.

**Definition P.8.9a.5a (Morphogenetic PCE Potential).** Let $X_{\mathrm{cell}}$ be the compact state space of a gap-junction-coupled cellular aggregate, including cellular positions, membrane-potential variables, gene-regulatory variables, and extracellular constraints at the resolution relevant to the developmental process. Let
$$
\pi_{\mathrm{morph}}:X_{\mathrm{cell}}\to\mathcal M
$$
map cellular states to coarse morphologies. Define the morphogenetic PCE potential
$$
V_{\mathrm{morph}}(x)
=
V_{\mathrm{op}}^{\mathrm{cell}}(x)
+
V_{\mathrm{prop}}^{\mathrm{gap}}(x)
+
U_{\mathrm{viab}}(\pi_{\mathrm{morph}}(x))
-
V_{\mathrm{benefit}}^{\mathrm{form}}(\pi_{\mathrm{morph}}(x)).
\tag{P.8.9a.7.3.1}
$$
Here $V_{\mathrm{op}}^{\mathrm{cell}}$ is the metabolic and regulatory cost of maintaining the cellular state, $V_{\mathrm{prop}}^{\mathrm{gap}}$ is the propagation/coherence cost of maintaining bioelectric coordination across the coupled network, $V_{\mathrm{benefit}}^{\mathrm{form}}$ is the predictive benefit of a morphology that supports the aggregate's viability and action repertoire, and $U_{\mathrm{viab}}$ is a lower-semicontinuous viability penalty that is finite on admissible morphologies and diverges on morphologies outside the aggregate's viable developmental class. The role of $U_{\mathrm{viab}}$ is formally parallel to the cost potential $U_S$ of Definition P.16.3: it shapes trajectories through a constraint surface rather than through a positive stored template.

**Theorem P.8.9a.7a (Target Morphology as PCE Attractor).** Suppose:

1. $X_{\mathrm{cell}}$ is a nonempty compact metrizable state space and $V_{\mathrm{morph}}:X_{\mathrm{cell}}\to\mathbb R\cup\{+\infty\}$ is lower semicontinuous, finite on at least one state, and bounded below;
2. the reference measure $dx$ is a finite Borel measure on $X_{\mathrm{cell}}$, and, if $V_{\min}:=\min_{X_{\mathrm{cell}}}V_{\mathrm{morph}}$, then every sublevel set $\{x:V_{\mathrm{morph}}(x)\le V_{\min}+\varepsilon\}$ with $\varepsilon>0$ has positive reference measure;
3. the detailed-balance stationary measures have Gibbs form
   $$
   \pi_\theta(dx)=Z_\theta^{-1}e^{-V_{\mathrm{morph}}(x)/\theta}\,dx;
   \tag{P.8.9a.7.3.3}
   $$
4. for the deterministic conclusion, $B\subseteq X_{\mathrm{cell}}$ is a compact positively invariant basin, $V_{\mathrm{morph}}$ is $C^1$ on a neighborhood of $B$, $G$ is continuous and symmetric positive semidefinite there, and the vector field
   $$
   \dot x(t)=-G(x(t))\nabla V_{\mathrm{morph}}(x(t))
   \tag{P.8.9a.7.3.2}
   $$
   is locally Lipschitz and has a forward-complete solution for every initial state in $B$;
5. the largest invariant subset of
   $$
   \left\{x\in B:\nabla V_{\mathrm{morph}}(x)^T G(x)\nabla V_{\mathrm{morph}}(x)=0\right\}
   $$
   is contained in
   $$
   A_{\mathrm{morph}}:=\arg\min_{x\in X_{\mathrm{cell}}}V_{\mathrm{morph}}(x).
   \tag{P.8.9a.7.3.4}
   $$

Then:

(i) $A_{\mathrm{morph}}$ is a nonempty compact PCE-minimizing target set, and $\pi_{\mathrm{morph}}(A_{\mathrm{morph}})$ is the selected target morphology class.

(ii) For every open neighborhood $U\supset A_{\mathrm{morph}}$ there are constants $\Delta_U>0$ and $C_U<\infty$ such that
$$
\pi_\theta(X_{\mathrm{cell}}\setminus U)
\le
C_Ue^{-\Delta_U/\theta}
\tag{P.8.9a.7.3.5}
$$
for every $\theta>0$.

(iii) Every deterministic solution with initial state in $B$ satisfies
$$
\lim_{t\to\infty}\operatorname{dist}(x(t),A_{\mathrm{morph}})=0.
$$

*Proof.* Put $m=\inf_{x\in X_{\mathrm{cell}}}V_{\mathrm{morph}}(x)$. The lower bound makes $m> -\infty$, and finiteness at one state makes $m<+\infty$. For $n\ge1$, let
$$
F_n=\left\{x\in X_{\mathrm{cell}}:V_{\mathrm{morph}}(x)\le m+\frac1n\right\}.
$$
Each $F_n$ is nonempty by the definition of the infimum, closed by lower semicontinuity, and nested. Compactness gives $x_*\in\bigcap_{n\ge1}F_n$. Hence $V_{\mathrm{morph}}(x_*)\le m$, so $V_{\mathrm{morph}}(x_*)=m$. Thus $A_{\mathrm{morph}}$ is nonempty. It is the closed sublevel $\{V_{\mathrm{morph}}\le m\}$ of a compact space and is therefore compact. This proves (i).

For (ii), let $U$ be an open neighborhood of $A_{\mathrm{morph}}$. The compact set $X_{\mathrm{cell}}\setminus U$ contains no global minimizer. Lower semicontinuity attains its minimum on that set, so
$$
\Delta_U^{(0)}
:=
\min_{x\in X_{\mathrm{cell}}\setminus U}
\bigl(V_{\mathrm{morph}}(x)-V_{\min}\bigr)
>0.
$$
Because $dx(X_{\mathrm{cell}})<\infty$,
$$
\int_{X_{\mathrm{cell}}\setminus U}e^{-V_{\mathrm{morph}}(x)/\theta}dx
\le
dx(X_{\mathrm{cell}})e^{-(V_{\min}+\Delta_U^{(0)})/\theta}.
$$
Set $\varepsilon=\Delta_U^{(0)}/2$ and
$$
W_\varepsilon=\{x:V_{\mathrm{morph}}(x)\le V_{\min}+\varepsilon\}.
$$
Assumption 2 gives $dx(W_\varepsilon)>0$, and therefore
$$
0<
e^{-(V_{\min}+\varepsilon)/\theta}dx(W_\varepsilon)
\le Z_\theta
\le
e^{-V_{\min}/\theta}dx(X_{\mathrm{cell}})<\infty.
$$
Dividing the numerator bound by the lower bound for $Z_\theta$ yields
$$
\pi_\theta(X_{\mathrm{cell}}\setminus U)
\le
\frac{dx(X_{\mathrm{cell}})}{dx(W_\varepsilon)}
e^{-\Delta_U^{(0)}/(2\theta)}.
$$
Thus (P.8.9a.7.3.5) holds with $C_U=dx(X_{\mathrm{cell}})/dx(W_\varepsilon)$ and $\Delta_U=\Delta_U^{(0)}/2$.

For (iii), the chain rule and positive semidefiniteness give, along every solution in $B$,
$$
\frac{d}{dt}V_{\mathrm{morph}}(x(t))
=
-\nabla V_{\mathrm{morph}}(x(t))^TG(x(t))\nabla V_{\mathrm{morph}}(x(t))
\le0.
$$
The hypotheses of LaSalle's invariance principle [LaSalle 1960] are satisfied: the vector field is locally Lipschitz, $B$ is compact and positively invariant, solutions are forward complete, and $V_{\mathrm{morph}}\in C^1$ on $B$ with nonpositive orbital derivative. LaSalle's principle places the $\omega$-limit set of each solution in the largest invariant subset of the zero-derivative set, which is contained in $A_{\mathrm{morph}}$ by assumption 5. If the asserted distance did not tend to zero, there would be $\epsilon>0$ and times $t_n\to\infty$ with $\operatorname{dist}(x(t_n),A_{\mathrm{morph}})\ge\epsilon$. Compactness of $B$ would give a convergent subsequence with limit in the $\omega$-limit set and hence in $A_{\mathrm{morph}}$, contradicting continuity of the distance function. Therefore $\operatorname{dist}(x(t),A_{\mathrm{morph}})\to0$. ∎

**Corollary P.8.9a.7a.1 (No Local Template Requirement on the Certified Attractor Branch).** Assume all hypotheses of Theorem P.8.9a.7a. In particular, for stochastic concentration assume its finite reference measure and positive-volume sublevel conditions; for deterministic relaxation assume its $C^1$, local-Lipschitz, forward-complete, compact-positive-invariance, and LaSalle zero-set conditions. Then no additional localized register storing the final form is required. Perturbations remaining in the certified basin converge in distance to $A_{\mathrm{morph}}$; perturbations that alter gap-junction coupling, voltage-boundary conditions, or viability penalties can change $V_{\mathrm{morph}}$ and hence its minimizing set.

*Proof.* Operative Theorem P.8.9a.7a proves existence of the nonempty minimizing set and Gibbs concentration under its measure hypotheses. Under its deterministic hypotheses, LaSalle's invariance principle places every $\omega$-limit set in the largest invariant subset of the zero-dissipation set, which the theorem assumes is contained in $A_{\mathrm{morph}}$; therefore the distance to $A_{\mathrm{morph}}$ tends to zero. Neither argument introduces a variable that encodes a final morphology as a stored local template. Changing a registered coupling or penalty changes the potential and may consequently change its minimizing set. ∎

### P.8.9a.7.4 The Hierarchy of Biological Awareness

The framework suggests a hierarchy of CC emergence:

**Table P.8.9a.4: Hierarchy of Biological CC**

| Level | System | $C_{agg}$ Range | CC Manifestation |
|-------|--------|-----------------|------------------|
| 0 | Single MPU | $= C_{op}$ | Minimal awareness (the Minimal Awareness interpretive convention of Section 7.1.2) |
| 1 | Single cell | $\sim C_{op}$ | Basic stimulus-response |
| 2 | Cellular network | $> C_{op}$ | Bioelectric coordination |
| 3 | Neural circuit | $\gg C_{op}$ | Sensory processing, motor control |
| 4 | Brain region | $\gg C_{op}$ | Specialized cognition |
| 5 | Integrated brain | $\ggg C_{op}$ | Unified consciousness, self-model |

**Proposition P.8.9a.5 (Graduated CC Emergence).** CC does not switch on discretely but emerges gradually as $C_{agg}$ exceeds $C_{op}$. The scaling function $\mathcal{G}(x) = x/(1+x)$ (Definition 32) ensures:
- Sharp threshold at $C_{agg} = C_{op}$
- Gradual increase above threshold
- Asymptotic approach to maximum $\alpha_\infty < 0.5$

This explains the apparent continuity of consciousness across species and developmental stages while maintaining the fundamental threshold at $C_{op}$.

---

### P.8.9a.7.5 Self-Directed CTB and Contextual Physiological Bias

Placebo and nocebo effects are treated here only at the structural level: as context-dependent physiological response patterns in systems whose internal event channels are within the aggregate's causal reach. A placebo effect is not modeled as belief directly creating external reality. It is modeled as a physically instantiated context update in which an inert or semantically indirect intervention changes $\mathrm{context}_S(t)$ and thereby shifts a reachable internal physiological event channel. The framework does not identify empirical placebo magnitudes with universal constants. Observed magnitudes estimate the product of aggregate CC, channel accessibility, context fidelity, internalization strength, and ordinary physiological coupling after artifact controls.

Empirically, placebo/nocebo phenomena are known to involve expectation, conditioning, and treatment-context effects on subjective and physiological outcomes [Benedetti et al. 2005; Colloca & Barsky 2020]. Open-label placebo studies show that disclosure of inertness does not force the effect to zero [Kaptchuk et al. 2010; Fendel et al. 2025], which is consistent with a context-engagement mechanism rather than a belief-only mechanism. The semantic truth of a belief, report, ritual, or treatment frame is not itself a control parameter in this subsection; it matters only through the physical state encoded inside the aggregate.

**Definition P.8.9a.5b (Internal Physiological Event Channel).** Let $S$ be a biological MPU aggregate with $C_{agg}>C_{op}$. An internal physiological event channel of $S$ is a finite-outcome ND-RID event family
$$
a\in\mathcal A_S,\qquad \Omega_a=\{1,\dots,n_a\},
$$
whose outcome probabilities can be read at a coarse physiological level. Let
$$
p_a\in\Delta(\Omega_a)
$$
be the neutral baseline distribution of channel $a$ in the absence of the contextual intervention being tested.

**Definition P.8.9a.5c (Self-Directed CTB Channel).** Let $c$ be a context state of $S$, and suppose $c$ defines a target distribution
$$
q_a(c)\in\Delta(\Omega_a)
$$
for the internal channel $a$. Define the target contrast
$$
r_a(c):=\sup_{B\subseteq\Omega_a}|q_a(c,B)-p_a(B)|
=
\mathrm{TV}\bigl(q_a(c),p_a\bigr).
\tag{P.8.9a.7.5.1}
$$
Let
$$
\gamma_a(c)\in[0,1]
$$
be the accessibility-fidelity coefficient of channel $a$ under context $c$, incorporating causal reach, context clarity, and the ability of the aggregate's organized state to couple to that channel. The self-directed CTB interpolation is admissible when
$$
\gamma_a(c)\,\mathrm{CC}(S)\le r_a(c)
\tag{P.8.9a.7.5.2}
$$
for nonzero $r_a(c)$. The observed internal distribution is then
$$
p_{a,\mathrm{obs}}(c)
=
p_a
+
\frac{\gamma_a(c)\,\mathrm{CC}(S)}{r_a(c)}
\bigl(q_a(c)-p_a\bigr),
\qquad r_a(c)>0.
\tag{P.8.9a.7.5.3}
$$
If $r_a(c)=0$ or $\gamma_a(c)=0$, set $p_{a,\mathrm{obs}}(c)=p_a$.

**Definition P.8.9a.5d (Placebo and Nocebo Context).**

A placebo context for channel $a$ is a finite intervention-context
$$
c_{\mathrm{pl}}
\tag{P.8.9a.7.5.3a}
$$
such as an inert pill, clinical ritual, verbal report, expectation cue, conditioning signal, symbolic treatment frame, or practitioner interaction, satisfying:

1. $c_{\mathrm{pl}}$ has no direct active pharmacological or mechanical causal ingredient for channel $a$;
2. $c_{\mathrm{pl}}$ may nevertheless alter the physically instantiated context state of $S$:
$$
\mathrm{context}_S(t)\longrightarrow \mathrm{context}_S^{c_{\mathrm{pl}}}(t);
\tag{P.8.9a.7.5.3b}
$$
3. the induced context enters Definition P.8.9a.5c through a target distribution $q_a(c_{\mathrm{pl}})$ and accessibility-fidelity coefficient $\gamma_a(c_{\mathrm{pl}})$.

A nocebo context is the same structure with an adverse or opposite target direction. Semantic content contributes to $c_{\mathrm{pl}}$ only through its physical instantiation in $\mathrm{context}_S(t)$.

**Theorem P.8.9a.7b (Self-Directed CTB Bound).** For every admissible self-directed CTB channel in Definition P.8.9a.5c:

(i) $p_{a,\mathrm{obs}}(c)$ is a normalized probability distribution.

(ii) For every event $B\subseteq\Omega_a$,
$$
\left|p_{a,\mathrm{obs}}(c,B)-p_a(B)\right|
\le
\gamma_a(c)\,\mathrm{CC}(S).
\tag{P.8.9a.7.5.4}
$$

(iii) If $\gamma_a(c)=0$, the context has no effect on channel $a$.

(iv) If $F_a:\Delta(\Omega_a)\to\mathbb R$ is $L_a$-Lipschitz in total variation, then
$$
\left|F_a(p_{a,\mathrm{obs}}(c))-F_a(p_a)\right|
\le
L_a\,\gamma_a(c)\,\mathrm{CC}(S).
\tag{P.8.9a.7.5.5}
$$

*Proof.* If $r_a(c)=0$ or $\gamma_a(c)=0$, the definition gives $p_{a,\mathrm{obs}}(c)=p_a$, so all claims are immediate. Assume $r_a(c)>0$ and define
$$
\eta_a(c):=\frac{\gamma_a(c)\,\mathrm{CC}(S)}{r_a(c)}.
$$
By admissibility, $0\le\eta_a(c)\le1$. Equation (P.8.9a.7.5.3) becomes
$$
p_{a,\mathrm{obs}}(c)=(1-\eta_a(c))p_a+\eta_a(c)q_a(c),
$$
a convex combination of two probability distributions. Hence it is normalized and nonnegative, proving (i).

For any $B\subseteq\Omega_a$,
$$
p_{a,\mathrm{obs}}(c,B)-p_a(B)
=
\eta_a(c)\bigl(q_a(c,B)-p_a(B)\bigr).
$$
Taking absolute values and using the definition of $r_a(c)$,
$$
\left|p_{a,\mathrm{obs}}(c,B)-p_a(B)\right|
\le
\eta_a(c)r_a(c)
=
\gamma_a(c)\,\mathrm{CC}(S),
$$
which proves (ii). Statement (iii) is the $\gamma_a(c)=0$ case already noted. For (iv), total variation gives
$$
\mathrm{TV}\bigl(p_{a,\mathrm{obs}}(c),p_a\bigr)
=
\sup_{B\subseteq\Omega_a}
\left|p_{a,\mathrm{obs}}(c,B)-p_a(B)\right|
\le
\gamma_a(c)\,\mathrm{CC}(S).
$$
The Lipschitz condition then gives (P.8.9a.7.5.5). ∎

**Corollary P.8.9a.7b.1 (Coupling-Dependent Specificity).** A contextual physiological effect can occur only through channels with nonzero accessibility-fidelity coefficient. If $\gamma_a(c)=0$, then $p_{a,\mathrm{obs}}(c)=p_a$ even when $\mathrm{CC}(S)>0$. If two channels $a,b$ have the same aggregate $\mathrm{CC}(S)$ but $\gamma_a(c)>\gamma_b(c)$, then the maximal possible contextual shift of channel $a$ exceeds that of channel $b$ by the factor $\gamma_a(c)/\gamma_b(c)$.

*Proof.* This is the direct comparison of the channel bounds in (P.8.9a.7.5.4). ∎

**Corollary P.8.9a.7b.2 (Open-Label Persistence).** Explicit knowledge that a context has no direct pharmacological active ingredient does not force the self-directed CTB effect to vanish. It vanishes only if disclosure drives either
$$
\gamma_a(c)=0
$$
or
$$
q_a(c)=p_a.
$$
If a disclosed context $c_{\mathrm{OL}}$ still satisfies
$$
\mathrm{CC}(S)>0,
\qquad
\gamma_a(c_{\mathrm{OL}})>0,
\qquad
r_a(c_{\mathrm{OL}})>0,
$$
then the internal channel shift is nonzero for any event $B$ with
$$
q_a(c_{\mathrm{OL}},B)\ne p_a(B).
$$

*Proof.* By Definition P.8.9a.5c,
$$
p_{a,\mathrm{obs}}(c_{\mathrm{OL}},B)-p_a(B)
=
\frac{\gamma_a(c_{\mathrm{OL}})\,\mathrm{CC}(S)}{r_a(c_{\mathrm{OL}})}
\bigl(q_a(c_{\mathrm{OL}},B)-p_a(B)\bigr).
$$
The right-hand side is nonzero exactly when $\mathrm{CC}(S)>0$, the accessibility-fidelity coefficient is nonzero, and the target contrast is nonzero for that event. No term in the expression requires propositional belief that the context contains a pharmacologically active ingredient. ∎

**Corollary P.8.9a.7b.3 (Ritual and Context-Information Scaling).** Suppose two contexts $c_1,c_2$ define the same normalized target direction for channel $a$ and differ only in accessibility-fidelity coefficient, with
$$
0<\gamma_a(c_1)<\gamma_a(c_2).
$$
Then the maximal possible contextual shift under $c_2$ is larger by
$$
\frac{\gamma_a(c_2)}{\gamma_a(c_1)}.
$$

*Proof.* With the target direction fixed, Equation (P.8.9a.7.5.4) shows that the sharp upper envelope of event shifts is linear in $\gamma_a(c)\mathrm{CC}(S)$. Taking the ratio gives the claim. ∎

**Corollary P.8.9a.7b.4 (Nocebo Symmetry).** Let $c_+$ and $c_-$ be two contexts for the same channel $a$ with equal accessibility-fidelity coefficient
$$
\gamma_a(c_+)=\gamma_a(c_-)
$$
and opposite target directions around the same baseline:
$$
q_a(c_+)-p_a=-(q_a(c_-)-p_a).
$$
Then
$$
p_{a,\mathrm{obs}}(c_+)-p_a
=
-\bigl(p_{a,\mathrm{obs}}(c_-)-p_a\bigr).
$$

*Proof.* The target contrasts are equal, and the interpolation coefficients in (P.8.9a.7.5.3) are equal. Substituting the opposite target directions gives the sign reversal. ∎

**Corollary P.8.9a.7b.5 (Retrospective Evidence Bound).** Let an existing placebo/nocebo dataset estimate an internal-channel event shift $\widehat\Delta_a(B)$ for event $B$, with a preregistered artifact bound $B_{\mathrm{art}}$ in the sense of Definition 13.0a. If the residual signed effect is attributed to self-directed CTB, then any admissible PU interpretation must satisfy
$$
\gamma_a(c)\,\mathrm{CC}(S)
\ge
\max\{0,|\widehat\Delta_a(B)|-B_{\mathrm{art}}\}.
\tag{P.8.9a.7.5.6}
$$

*Proof.* By Theorem P.8.9a.7b,
$$
|\Delta_a(B)|\le\gamma_a(c)\mathrm{CC}(S).
$$
A measured shift can be decomposed as signal plus artifact residual with magnitude at most $B_{\mathrm{art}}$, so the signal component is at least $\max\{0,|\widehat\Delta_a(B)|-B_{\mathrm{art}}\}$ when the residual is assigned to the PU channel. Combining the two inequalities gives (P.8.9a.7.5.6). ∎

**Corollary P.8.9a.7b.6 (Placebo and Nocebo as Bounded Context-Channel Effects).**

Let $c_{\mathrm{pl}}$ be a placebo or nocebo context for channel $a$ in the sense of Definition P.8.9a.5d. Then, for every event $B\subseteq\Omega_a$,
$$
\left|
p_{a,\mathrm{obs}}(c_{\mathrm{pl}},B)-p_a(B)
\right|
\le
\gamma_a(c_{\mathrm{pl}})\mathrm{CC}(S).
\tag{P.8.9a.7.5.7}
$$
If $\mathrm{CC}(S)>0$, $r_a(c_{\mathrm{pl}})>0$, $\gamma_a(c_{\mathrm{pl}})>0$, and
$$
q_a(c_{\mathrm{pl}},B)\ne p_a(B),
$$
then the channel shift is nonzero on $B$. If $r_a(c_{\mathrm{pl}})=0$, $\gamma_a(c_{\mathrm{pl}})=0$, $\mathrm{CC}(S)=0$, or the event contrast vanishes, the context produces no shift on that event through the self-directed CTB channel.

*Proof.* This is Theorem P.8.9a.7b applied to the context $c_{\mathrm{pl}}$. When $r_a(c_{\mathrm{pl}})>0$, Definition P.8.9a.5c gives
$$
p_{a,\mathrm{obs}}(c_{\mathrm{pl}},B)-p_a(B)
=
\frac{\gamma_a(c_{\mathrm{pl}})\mathrm{CC}(S)}{r_a(c_{\mathrm{pl}})}
\bigl(q_a(c_{\mathrm{pl}},B)-p_a(B)\bigr).
$$
The right-hand side is nonzero exactly when $\mathrm{CC}(S)>0$, $\gamma_a(c_{\mathrm{pl}})>0$, and the target event contrast is nonzero. If $r_a(c_{\mathrm{pl}})=0$ or $\gamma_a(c_{\mathrm{pl}})=0$, Definition P.8.9a.5c sets $p_{a,\mathrm{obs}}(c_{\mathrm{pl}})=p_a$. If $\mathrm{CC}(S)=0$, the interpolation coefficient is zero, so the shift also vanishes. ∎

The result explains why contextual physiological effects are strongest for channels under tight aggregate regulation and weakest for channels outside the aggregate's effective causal reach. It also explains why disclosure need not abolish the effect: disclosure changes the context coefficient $\gamma_a(c)$ and target contrast $r_a(c)$, but it does not remove the CTB mechanism unless one of them becomes zero.

## P.8.9a.8 Connection to the Free Energy Principle

Friston's free energy principle [Friston 2010] proposes that biological systems minimize variational free energy. The PU framework reveals structural parallels between the two approaches.

### P.8.9a.8.1 Free Energy as an Inferential Restriction of PCE

**Theorem P.8.9a.8 (Variational Free Energy as the Inferential Restriction of PCE).** Fix a sensory-motor architecture and restrict the PCE potential
$$
V(x)=V_{op}(x)+V_{prop}(x)-V_{benefit}(x)+V_{penalty}(x)
$$
to a branch on which the propagation architecture and penalty terms are held fixed, while only inferential state assignment varies. Let hidden states be $\theta$, observations be $o$, prior $p(\theta)$, likelihood $p(o\mid \theta)$, and recognition density $q(\theta)$. Define the variable inferential restriction
$$
V^{\mathrm{inf}}_{\mathrm{PCE}}[q;o]
:=
D_{KL}\!\big[q(\theta)\,\|\,p(\theta)\big]
-\mathbb{E}_{q}\!\big[\ln p(o\mid \theta)\big].
$$
Then
$$
V^{\mathrm{inf}}_{\mathrm{PCE}}[q;o]
=
\mathbb{E}_{q}\!\big[\ln q(\theta)-\ln p(o,\theta)\big]
=
F[q;o].
$$
Hence, on the fixed-architecture inferential branch, the variable part of variational free-energy minimization is exactly PCE minimization.

*Proof.* Using $p(o,\theta)=p(o\mid\theta)p(\theta)$,
$$
\mathbb{E}_{q}[\ln q(\theta)-\ln p(o,\theta)]
=
\mathbb{E}_{q}[\ln q(\theta)-\ln p(\theta)-\ln p(o\mid\theta)]
=
D_{KL}[q\|p(\theta)]-\mathbb{E}_{q}[\ln p(o\mid\theta)].
$$
This is precisely $V^{\mathrm{inf}}_{\mathrm{PCE}}[q;o]$. Fixed propagation and penalty contributions add only constants on this restricted branch and therefore do not affect the minimizing $q$. ∎

**Corollary P.8.9a.8.1 (Thermodynamic Grounding of a Registered Inferential Reset).** Let an implementation of the inferential branch cyclically overwrite a finite record $P$ while retaining side record $R$, return the memory Hamiltonian to its initial value, and leave no additional retained copy of $P$. Then Theorem 31 applies to that update and gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$. If $H_q(P\mid R)\ge h_{\min}>0$, the heat floor is uniformly positive; an injective or reversibly uncomputed inferential refinement need not incur this reset bound. Hence the complexity term has a physical Landauer realization precisely on the registered-reset implementation branch.

*Remark: Scope of Exactness.* The equality above is an exact restricted-branch statement. It does not identify the full network PCE dynamics with variational free energy; it identifies the inferential subfunctional obtained after architecture, propagation, and penalty terms are fixed.

*Remark: Scope of Disagreement.* The equality above identifies a functional; it does not identify a global optimization problem. The full PCE objective is constrained by the registered Space of Becoming $\alpha<PP<\beta$ (Definition 8 and Axiom 3). Theorem 8 supplies the lower benchmark, Theorem 9 supplies the distinct excitation ceiling $\beta_0$, and Theorem 19 supplies the finite-complexity strict endpoint on its exact response-law branch. Theorems 10–11 exclude universal exact prediction on their diagonal classes but do not determine a system-independent scalar $\alpha_{SPAP}$. Theorem 14's quantitative lower bound is available only on its registered reduction/cost certificate and transfers to $C_P$ only through the domination bridge.

Friston's variational free energy, taken as a local inferential objective, has no automatic identification with those PU branch constraints. Minimizing $F$ with respect to a recognition density tightens an upper bound on surprise and gives $F=-\ln p(o)$ at the exact posterior [Friston 2010]. Any comparison with a perfect-prediction endpoint must separately identify the task, score, admissible class, and registered PU boundary. Standard active-inference formulations add prior preferences, expected free energy, and epistemic value [Friston et al. 2017]; the equality of local functionals above does not make those policy terms identical to PU's branch certificates.

| Feature | Variational free-energy program | PCE / POP branch |
|:--------|:--------------------------------|:-----------------|
| Local inferential objective | $F[q;o]$, with $F=-\ln p(o)$ at the exact posterior | $V^{\mathrm{inf}}_{\mathrm{PCE}}[q;o]$ on the fixed-architecture equality branch |
| Registered lower benchmark | No PU-native value | $\alpha$ from Theorem 8 for the matched task and score |
| Excitation ceiling | No PU-native value | $\beta_0$ from Theorem 9 on its excitation-certificate branch |
| Response-law endpoint | No PU-native value | $\beta$ from Definition 8 and Theorem 19 on the exact response-law branch |
| Self-referential limitation | Not represented by the local functional | Class-level diagonal obstruction from Theorems 10–11; quantitative cost only under Theorem 14's certificate |
| Physical heat | Not fixed by the functional identity | Requires a separately registered reset and the hypotheses of Theorem 31 |

Thus the exact overlap is the restricted inferential functional. The global objectives, viability endpoints, diagonal classes, cost certificates, and physical ledgers remain distinct unless an explicit bridge identifies them.

### P.8.9a.8.2 What PU Adds Beyond Free Energy

The PU framework extends beyond the free energy principle in several directions:

| Aspect | Free Energy Principle | PU Framework |
|--------|----------------------|--------------|
| Foundation | Variational inference | Prediction + thermodynamics |
| Origin of cost | Not specified | $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ (Theorem 31) |
| Fundamental limits | None specified | SPAP (Theorem 10), $\alpha_{SPAP} < 1$ |
| Spacetime | Assumed | Emergent (Section 11) |
| Consciousness | Peripheral | Central (CC, Section 9) |
| Error correction | Not addressed | Fundamental (Golay structure) |

The free energy principle describes *what* biological systems optimize; the PU framework explains *why* (thermodynamic necessity) and *how* (error-corrected prediction in emergent spacetime).

---

## P.8.9a.9 Experimental Predictions and Research Directions

The framework generates specific, testable predictions for biological research:

### P.8.9a.9.1 Error Correction Predictions

**Prediction P.8.9a.9.1 (Error Correction Overhead Universality).**
All persistent biological systems dedicate a substantial fraction of resources (often tens of percent) to error correction and quality control.

*Test:* Comparative metabolomics across species, measuring fraction of ATP expenditure on:
- DNA repair enzymes
- Chaperone proteins
- Autophagy machinery
- Immune surveillance

*Expected result:* Overhead fractions of the same order of magnitude across phylogenetically diverse systems, modulated by growth state and environment [Flamholz et al. 2014; Buttgereit & Brand 1995; Lynch & Marinov 2015].

**Prediction P.8.9a.9.2 (Complexity-Maintenance Scaling).**
Organisms with higher $C_{agg}$ exhibit proportionally greater maintenance allocation.

*Test:* Plot metabolic maintenance fraction against brain size (proxy for $C_{agg}$) across mammals.

*Expected result:* Positive correlation with slope predicted by Theorem P.8.9a.4.

### P.8.9a.9.2 Consciousness Complexity Predictions

**Prediction P.8.9a.9.3 (CC Threshold Behavior).**
Influence capability exhibits sharp transition at $C_{agg} = C_{op}$.

*Test (from Appendix L):* Quantify influence capability vs. aggregate complexity proxy; expect step function, not smooth curve.

**Prediction P.8.9a.9.4 (Energy Accounting).**
On a registered biological energy-balance model, any additional CC-associated input obeys $P_{\mathrm{in}}=\dot E_{\mathrm{stored}}+P_{\mathrm{work}}+\dot Q_{\mathrm{export}}$. It is identifiable by calorimetry alone only under steady-state and negligible-work/storage controls.

*Test (Protocol L.2):* Precision calorimetry during high-CC vs. low-CC states.

*Expected result:* after preregistered matching of work and stored-energy changes, test whether the residual exported-heat difference is nonzero and covaries with the registered CC proxy; the framework does not fix its sign without a metabolic response model.

**Prediction P.8.9a.9.5 (Bioelectric CC).**
Gap junction coupling strength determines morphogenetic CC.

*Test:* Compare metabolic heat production during normal regeneration vs. gap junction-disrupted regeneration in planaria.

*Framework prediction:* $\Delta Q \propto C_{agg}(g)$; reduced heat signature with reduced coupling.

**Prediction P.8.9a.9.6 (Contextual Physiological Bias).**
Placebo/nocebo-class effects should scale with the product
$$
\gamma_a(c)\,\mathrm{CC}(S)
$$
for the relevant internal channel $a$ and context $c$.

*Test:* Reanalyze placebo/nocebo datasets by grouping outcomes according to estimated central-regulatory accessibility, context richness, disclosure status, and physiological coupling strength.

*Framework prediction:* Effects should be strongest when $\gamma_a(c)$ is high, should remain nonzero under open-label conditions when $\gamma_a(c)>0$ and $r_a(c)>0$, and should vanish for channels outside the aggregate's effective causal reach.

### P.8.9a.9.3 Evolutionary Predictions

**Prediction P.8.9a.9.7 (PCE Landscape Structure).**
On a registered biological branch with a common retained state space, complete PCE ledger, attracting basin, and certified dynamics, recurrent convergent targets are predicted to lie near the branch's attracting global-minimum set.

*Test:* Reconstruct fitness landscapes for repeatedly evolved traits (eyes, wings, echolocation); identify whether convergent solutions occupy distinct potential minima.

**Prediction P.8.9a.9.8 (Modularity-Evolvability Correlation).**
Within a response-matched architectural comparison, greater modularity is predicted to correlate with lower complete adaptation cost only when interface, redundancy, coordination, and performance terms are included.

*Test:* Measure $V_{prop}$ (adaptation cost proxy) across species varying in developmental modularity; expect negative correlation.

### P.8.9a.9.4 Research Program Integration

The framework suggests integration across currently separate research programs:

| Research Program | PU Integration |
|-----------------|----------------|
| Systems biology | Error correction overhead measurement |
| Neuroscience | CC emergence in neural aggregates |
| Developmental biology | Bioelectric CC and morphogenesis |
| Evolutionary biology | PCE landscape reconstruction |


## P.8.9a.10 The Answer to Schrödinger's Question

PU proposes the following branch-indexed operational model of life; the conditional selection theorem does not constitute a complete biological definition or derivation.

**What is life?**

The proposal treats living organization through registered persistence, resource constraints, recovery, retained predictive responses, reproduction, and an explicitly supplied heritable-type dynamics; none is inferred from the normalized-selection correspondence alone.

More precisely:

**Definition P.8.9a.10.1 (Life in the PU Framework).** Within the declared biological-model branch, a system is classified as living when it is an MPU aggregate (Definition 29) satisfying the following registered modeling conditions:
1. **Complexity certificate:** $0<C_{op}<\infty$ and $C_{agg}/C_{op}\ge\rho_{\mathrm{life}}>1$ for a threshold $\rho_{\mathrm{life}}$ fixed before classification.
2. **Recovery certificate:** a finite degradation/noise model, retained organization predicate, recovery map, and measured recovery probability above a registered margin.
3. **Adaptive-response certificate:** a finite protocol family on which a specified update rule produces a registered predictive-score improvement subject to a declared resource ledger.
4. **Reproduction and inheritance certificate:** a finite response test showing production of a new aggregate and transmission of the declared organization predicate with error below a registered tolerance.
5. **Heritable-update certificate:** a declared finite type space and inheritance/update kernel; normalized selection is represented as generational PCE reweighting only on the branch of Proposition P.8.9a.6.

**Thesis P.8.9a.3 (Unified Origin of Biological Organization).** The genetic code, developmental programs, neural architectures, and conscious experience may be compared within one branch-indexed PCE vocabulary only after each biological level supplies its own admissible states, response protocols, causal dynamics, cost ledger, and cross-level maps. The registered-reset inequality
$$
\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)
$$
applies only to an implemented reset, and a positive uniform floor additionally requires $H_q(P\mid R)\ge h_{\min}>0$.

*Structure of the conditional program:*
1. Theorem P.8.9a.1 requires active recovery only on its certified degradation-bearing branch.
2. Redundancy follows only within a specified biological coding and channel model.
3. PCE selects a biological code or architecture only after an admissible response-preserving comparison class and strict total-ledger inequality are supplied; Theorem Z.13 does not by itself select a genetic code.
4. Proposition P.8.9a.6 represents normalized selection as generational PCE reweighting only on its time-independent, faithful-inheritance, no-flux branch.
5. Theorem 34 gives nonzero CC only under its separate reachability, strict-improvement, representability, attainment, and stability hypotheses.
6. Any feedback from CC to biological prediction requires an independently registered physical channel and response certificate.

The common content is therefore a conditional variational grammar, not a derivation of molecular biology, evolutionary theory, neuroscience, or consciousness from one equation. Equality of optimization form does not identify substrates, mechanisms, or functional decompositions across those levels.

Within this branch-indexed model, the question “What persists through prediction?” organizes comparisons among registered biological mechanisms without claiming to derive molecular biology, evolutionary theory, neuroscience, or consciousness from one principle. The proposed comparison is therefore a conditional organizing vocabulary, not a unification theorem for those disciplines.

The questions associated with Wheeler, Schrödinger, and Darwin can be compared through a common variational vocabulary only after each physical and biological branch supplies its own state space, mechanisms, response maps, and certificates. In that comparison, code is literal only where a specified encoder, channel, decoder, and recovery map are present; consciousness retains its separate operational hypotheses. No single-answer theorem follows: each domain retains its own constitutive mechanisms, empirical tests, and branch certificates.


## P.8.9a.11 The Pareto Signature: Heavy-Tailed Concentration as a Macroscopic Invariant of PCE

The empirical regularity popularly known as the Pareto principle — the observation that across many natural, biological, economic, and informational systems a minority of units can account for a disproportionate share of total output — has been documented since [Pareto 1896] and subsequently formalized under the labels of Zipf's law, Gibrat's law of proportionate effect [Gibrat 1931], preferential attachment [Simon 1955], Kesten processes [Kesten 1973], and the empirical regularities catalogued in [Gabaix 1999; Gabaix 2009]. The PU framework treats this family of observations as a two-level PCE signature: a single-system concentration effect follows from exponential saturation in the Law of Prediction, while a population-level heavy-tail effect follows conditionally from a multiplicative-noise model for near-equilibrium PCE adaptation.

### P.8.9a.11.1 Single-System Disproportion from Exponential Saturation

The Law of Prediction (Theorem 19 and Definition 19a, Equation 22b) gives the normalized value delivered by a system operating at relative complexity $x = (C - C_{op})/\hat{C}_{target}$ as
$$
V(x) := \frac{PP(C) - \alpha}{\beta - \alpha} = 1 - e^{-\kappa_{\mathrm{eff}} x}.
$$
For a system operating at a PCE equilibrium with relative complexity $x^* > 0$, the fraction of the equilibrium value realized at a fraction $f \in (0,1)$ of the equilibrium complexity is
$$
\rho(f; x^*) := \frac{V(f x^*)}{V(x^*)} = \frac{1 - e^{-\kappa_{\mathrm{eff}} f x^*}}{1 - e^{-\kappa_{\mathrm{eff}} x^*}}.
$$

**Definition P.8.9a.11.1 (PCE Concentration Ratio).** For a predictive system governed by the Law of Prediction (Theorem 19) at PCE equilibrium $C^*$ with relative complexity $x^* = (C^* - C_{op})/\hat{C}_{target} > 0$, the *PCE concentration ratio* at effort fraction $f \in (0,1)$ is the function $\rho(f; x^*)$ defined above. The associated *disproportion gap* is
$$
\Delta_{\rho}(f; x^*) := \rho(f; x^*) - f.
$$

**Theorem P.8.9a.11.2 (Single-System Pareto Disproportion).** For every $x^* > 0$ and every $f \in (0,1)$, the PCE concentration ratio satisfies
$$
\rho(f; x^*) > f,
$$
with strict inequality, so $\Delta_{\rho}(f; x^*) > 0$. Moreover, $\rho$ is strictly increasing in $x^*$ at fixed $f$, and
$$
\lim_{x^* \to \infty} \rho(f; x^*) = 1 \quad \text{for every } f \in (0,1).
$$

*Proof.* Fix $f \in (0,1)$ and write $r := \kappa_{\mathrm{eff}} x^* > 0$. Define $h(r) := 1 - e^{-r}$ on $[0,\infty)$. Then $h(0)=0$, $h$ is strictly increasing, and
$$
h''(r)=-e^{-r}<0,
$$
so $h$ is strictly concave. By strict concavity,
$$
h(fr)=h(fr+(1-f)0)>fh(r)+(1-f)h(0)=fh(r).
$$
Dividing by $h(r)>0$ gives $\rho(f;x^*)>f$.

For monotonicity, differentiate $\log\rho$ with respect to $r$:
$$
\frac{\partial}{\partial r}\log\rho
=
\frac{f e^{-fr}}{1-e^{-fr}}-
\frac{e^{-r}}{1-e^{-r}}.
$$
Let $g(s):=s e^{-s}/(1-e^{-s})$ for $s>0$. Then
$$
g'(s)=\frac{e^{-s}\bigl[(1-e^{-s})-s\bigr]}{(1-e^{-s})^2}<0,
$$
because $1-e^{-s}<s$ for all $s>0$. Since $fr<r$, $g(fr)>g(r)$, and therefore
$$
\frac{f e^{-fr}}{1-e^{-fr}}-
\frac{e^{-r}}{1-e^{-r}}
=
\frac{g(fr)-g(r)}{r}>0.
$$
Thus $\rho$ is strictly increasing in $r$ and hence in $x^*$. The limit follows directly from
$$
\lim_{r\to\infty}\frac{1-e^{-fr}}{1-e^{-r}}=1.
$$
∎

**Remark P.8.9a.11.1.** The common 80/20 ratio is one point on this curve rather than a privileged constant. Solving $\rho(0.2;x^*)=0.8$ gives
$$
\kappa_{\mathrm{eff}}x^*\approx 8.0407523768.
$$
Thus exponential saturation can realize the canonical Pareto ratio at a definite dimensionless equilibrium depth, while Theorem P.8.9a.11.2 covers every concentration ratio of the form $\rho>f$.

**Corollary P.8.9a.11.3 (Concentration Under PCE Optimality).** At any PCE optimum on a branch with fixed $\kappa_{\mathrm{eff}}$, the disproportion gap $\Delta_{\rho}(f;x^*)$ is strictly positive at every effort fraction $f\in(0,1)$. Under the Dominance of Stabilizing Costs assumptions used in Theorem 22, and with $R'(C^*)>0$, a decrease in resource scarcity $\lambda$ increases $C^*$ through the comparative static $dC^*/d\lambda<0$ and therefore increases $\rho(f;x^*)$ at fixed $f$.

*Proof.* Positivity is Theorem P.8.9a.11.2. At an interior PCE optimum, the first-order condition is
$$
\Psi(C^*,\lambda)=\Gamma_0\frac{\partial PP}{\partial C}(C^*)-\lambda R'(C^*)-R_I'(C^*)=0.
$$
Under DSC, $\partial\Psi/\partial C=J''(C^*)<0$. Differentiating the first-order condition with respect to $\lambda$ gives
$$
\frac{dC^*}{d\lambda}
=
\frac{R'(C^*)}{J''(C^*)}<0.
$$
Thus decreasing $\lambda$ increases $C^*$. Since $x^*=(C^*-C_{op})/\hat C_{target}$, increasing $C^*$ increases $x^*$ when $\hat C_{target}$ is held fixed, and Theorem P.8.9a.11.2 gives monotonicity of $\rho$ in $x^*$. ∎

### P.8.9a.11.2 Population-Level Heavy Tails from Multiplicative PCE Adaptation

At the population level, Pareto concentration appears across a population of adaptive systems rather than inside a single system. PU gives a conditional route to this signature when the near-equilibrium adaptation noise scales with current complexity excess.

Let $\{S_i\}_{i=1}^N$ be a population of predictive aggregates (Definition 29), each undergoing PCE adaptation (Definition 20, Equation D.8). Write the dimensionless complexity excess of system $i$ as
$$
\nu_i(t) := \frac{C_i(t)-C_{op}}{C_s},
$$
with $C_s$ the effective complexity scale (Definition 19a). Near a stable PCE equilibrium $\nu^*>0$, the deterministic drift is linear to leading order:
$$
\dot\nu_i\approx -k(\nu_i-\nu^*)
$$
with $k>0$ the local mean-reversion rate.

**Hypothesis P.8.9a.11.4 (Multiplicative PCE Noise Hypothesis).** Under fluctuations in resource availability, the registered task-scale coordinate $\hat C_{target}$, and inter-MPU communication fidelity,


$$
d\nu_i(t)=\bigl[-k\nu_i(t)+m\bigr]dt+\sigma\nu_i(t)dW_i(t),
\qquad
\nu_i(t)\ge \nu_{\min}>0, \tag{P.8.9a.11.1}
$$
with $k,m,\sigma>0$, independent standard Brownian motions $W_i$, and reflection at the lower barrier $\nu_{\min}$ representing the operational floor. Since $\nu_i$ is dimensionless, $[k]=[m]=T^{-1}$ and $[\sigma]=T^{-1/2}$.

*Status.* The multiplicative form $\sigma\nu_i dW_i$ is a population-level modeling hypothesis. It is motivated by the complexity-dependence of marginal costs (Equation 26) and by the scaling of communication costs with local network capacity (Appendix D, Definition D.1), but it is not derived from the POP/PCE axioms alone. The population-level results below inherit this conditional status.

**Theorem P.8.9a.11.5 (Pareto Tail from Multiplicative PCE Adaptation).** Let $\nu_i(t)$ evolve according to Equation (P.8.9a.11.1) with $k,m,\sigma>0$ and reflecting lower barrier $\nu_{\min}>0$. Set
$$
\alpha_{\mathrm{st}}:=1+\frac{2k}{\sigma^2},
\qquad
\beta_{\mathrm{st}}:=\frac{2m}{\sigma^2},
\qquad
a_{\min}:=\frac{\beta_{\mathrm{st}}}{\nu_{\min}}.
$$
Then the stationary zero-current density on $[\nu_{\min},\infty)$ is
$$
p(\nu)=Z^{-1}\nu^{-\alpha_{\mathrm{st}}-1}
\exp\!\left(-\frac{\beta_{\mathrm{st}}}{\nu}\right), \tag{P.8.9a.11.2}
$$
where
$$
Z=\beta_{\mathrm{st}}^{-\alpha_{\mathrm{st}}}
\gamma(\alpha_{\mathrm{st}},a_{\min}),
\qquad
\gamma(q,a):=\int_0^a t^{q-1}e^{-t}\,dt.
$$
Consequently,
$$
p(\nu)\sim A\nu^{-(\zeta+1)}\quad\text{as }\nu\to\infty,
\qquad
\zeta=\alpha_{\mathrm{st}}=1+\frac{2k}{\sigma^2}>1. \tag{P.8.9a.11.3}
$$
For every integer or real moment order $n$ with $\alpha_{\mathrm{st}}>n$,
$$
\mathbb E[\nu^n]
=
\beta_{\mathrm{st}}^n
\frac{\gamma(\alpha_{\mathrm{st}}-n,a_{\min})}
{\gamma(\alpha_{\mathrm{st}},a_{\min})}. \tag{P.8.9a.11.4}
$$
In particular, the mean is finite for all $k>0$, while the variance is finite precisely when $\alpha_{\mathrm{st}}>2$, equivalently $2k>\sigma^2$. In the upper-tail Pareto regime, the concentration exponent is controlled by $\zeta$: increasing $\sigma^2/k$ decreases $\zeta$ and increases upper-tail concentration.

*Proof.* The generator of (P.8.9a.11.1) is
$$
\mathcal L f(\nu)=(-k\nu+m)f'(\nu)+\frac12\sigma^2\nu^2f''(\nu).
$$
A reflecting stationary density has zero probability current, so
$$
(-k\nu+m)p(\nu)-\frac12\frac{d}{d\nu}\bigl(\sigma^2\nu^2p(\nu)\bigr)=0.
$$
Solving this first-order equation gives
$$
p(\nu)=\frac{C}{\sigma^2\nu^2}
\exp\!\left(
\int^\nu \frac{2(-kw+m)}{\sigma^2w^2}\,dw
\right)
=
C'\nu^{-2-2k/\sigma^2}\exp\!\left(-\frac{2m}{\sigma^2\nu}\right).
$$
With $\alpha_{\mathrm{st}}=1+2k/\sigma^2$ and $\beta_{\mathrm{st}}=2m/\sigma^2$, the normalizing integral is
$$
Z=\int_{\nu_{\min}}^\infty
\nu^{-\alpha_{\mathrm{st}}-1}e^{-\beta_{\mathrm{st}}/\nu}\,d\nu.
$$
The substitution $t=\beta_{\mathrm{st}}/\nu$ gives
$$
Z
=
\beta_{\mathrm{st}}^{-\alpha_{\mathrm{st}}}
\int_0^{\beta_{\mathrm{st}}/\nu_{\min}}
t^{\alpha_{\mathrm{st}}-1}e^{-t}\,dt
=
\beta_{\mathrm{st}}^{-\alpha_{\mathrm{st}}}
\gamma(\alpha_{\mathrm{st}},a_{\min}).
$$
The same substitution gives, for $\alpha_{\mathrm{st}}>n$,
$$
\int_{\nu_{\min}}^\infty
\nu^{n-\alpha_{\mathrm{st}}-1}e^{-\beta_{\mathrm{st}}/\nu}\,d\nu
=
\beta_{\mathrm{st}}^{n-\alpha_{\mathrm{st}}}
\gamma(\alpha_{\mathrm{st}}-n,a_{\min}),
$$
which yields Equation (P.8.9a.11.4) after division by $Z$. The condition $\alpha_{\mathrm{st}}>1$ is automatic because $k>0$, so the mean is finite; the second moment is finite exactly when $\alpha_{\mathrm{st}}>2$.

As $\nu\to\infty$, the exponential factor tends to $1$, giving the displayed Pareto density tail with $\zeta=\alpha_{\mathrm{st}}=1+2k/\sigma^2$. For a pure Pareto tail with survival function
$$
S(x)=\left(\frac{x_0}{x}\right)^\zeta,
\qquad x\ge x_0,
\qquad \zeta>1,
$$
the cutoff defining the largest fraction $p_{top}$ is
$$
x_p=x_0p_{top}^{-1/\zeta}.
$$
The share of total tail mass above $x_p$ is
$$
\frac{\int_{x_p}^\infty x\,\zeta x_0^\zeta x^{-\zeta-1}\,dx}
{\int_{x_0}^\infty x\,\zeta x_0^\zeta x^{-\zeta-1}\,dx}
=
\left(\frac{x_p}{x_0}\right)^{1-\zeta}
=
p_{top}^{(\zeta-1)/\zeta}.
$$
This exceeds $p_{top}$ for $0<p_{top}<1$ and increases as $\zeta$ decreases. The stationary density above has the same asymptotic exponent, so the same power controls sufficiently high upper-tail concentration. Since $\zeta=1+2k/\sigma^2$, increasing $\sigma^2/k$ decreases $\zeta$ and makes the upper tail more concentrated. ∎

**Corollary P.8.9a.11.5a (Conditional Taylor Law from Fixed-Shape Inverse-Gamma Families).** Consider a family of stationary laws of the form (P.8.9a.11.2) with common shape $\alpha_{\mathrm{st}}>2$ and common scaled floor $a_{\min}=\beta_{\mathrm{st}}/\nu_{\min}$. Then there are constants $B_1,B_2>0$, depending only on $(\alpha_{\mathrm{st}},a_{\min})$, such that
$$
\mathbb E[\nu]=B_1\beta_{\mathrm{st}},
\qquad
\operatorname{Var}(\nu)=B_2\beta_{\mathrm{st}}^2.
$$
Consequently,
$$
\operatorname{Var}(\nu)
=
\frac{B_2}{B_1^2}\,\mathbb E[\nu]^2. \tag{P.8.9a.11.5a}
$$
Thus Taylor's variance-mean exponent is $b=2$ on any scale family where the multiplicative PCE noise ratio $\sigma^2/k$ and the scaled operational floor are held fixed.

*Proof.* Equation (P.8.9a.11.4) gives
$$
B_1=
\frac{\gamma(\alpha_{\mathrm{st}}-1,a_{\min})}
{\gamma(\alpha_{\mathrm{st}},a_{\min})},
$$
and
$$
\mathbb E[\nu^2]
=
\beta_{\mathrm{st}}^2
\frac{\gamma(\alpha_{\mathrm{st}}-2,a_{\min})}
{\gamma(\alpha_{\mathrm{st}},a_{\min})}.
$$
Hence $\operatorname{Var}(\nu)=B_2\beta_{\mathrm{st}}^2$ with
$$
B_2=
\frac{\gamma(\alpha_{\mathrm{st}}-2,a_{\min})}
{\gamma(\alpha_{\mathrm{st}},a_{\min})}
-
\left(
\frac{\gamma(\alpha_{\mathrm{st}}-1,a_{\min})}
{\gamma(\alpha_{\mathrm{st}},a_{\min})}
\right)^2.
$$
Eliminating $\beta_{\mathrm{st}}$ gives (P.8.9a.11.5a). ∎

*Status.* Corollary P.8.9a.11.5a is not a derivation of Taylor's law from PCE alone. It is the exact variance-mean consequence of the same stationary inverse-gamma family when the shape and scaled floor are held fixed across the compared subpopulations [Taylor 1961].

**Proposition P.8.9a.11.6 (Small-Noise Inequality Scale).** In the small-noise regime $\sigma^2\ll k$, the local logarithmic fluctuation approximation to Equation (P.8.9a.11.1) has log-variance
$$
s^2=\frac{\sigma^2}{2k}+O\!\left(\frac{\sigma^4}{k^2}\right).
$$
Consequently, the local lognormal approximation to the Gini coefficient is
$$
G=2\Phi\!\left(\frac{s}{\sqrt2}\right)-1
=2\Phi\!\left(\frac{\sigma}{2\sqrt{k}}\right)-1
+O\!\left(\frac{\sigma^3}{k^{3/2}}\right), \tag{P.8.9a.11.6}
$$
where $\Phi$ is the standard normal cumulative distribution function. The $O$-term is an asymptotic local small-noise statement; no uniform finite-noise error bound for the full reflected diffusion is asserted without additional localization or moment assumptions.

*Proof.* The deterministic equilibrium is $\nu^*=m/k$. Write $\nu=\nu^*+\delta$ with $|\delta|\ll \nu^*$. To leading order,
$$
d\delta(t)=-k\delta(t)dt+\sigma\nu^*dW(t),
$$
so the stationary variance is
$$
\operatorname{Var}(\delta)=\frac{\sigma^2(\nu^*)^2}{2k}.
$$
For small relative fluctuations,
$$
\log \nu=\log\nu^*+\frac{\delta}{\nu^*}+O\left((\delta/\nu^*)^2\right),
$$
so
$$
\operatorname{Var}(\log\nu)=\frac{\sigma^2}{2k}+O\left(\frac{\sigma^4}{k^2}\right).
$$
To evaluate the local lognormal Gini coefficient, let $Z,Z'$ be independent $N(m,s^2)$ variables and set $X=e^Z$, $X'=e^{Z'}$. By symmetry,
$$
G
=\frac{\mathbb E|X-X'|}{2\mathbb E X}
=\frac{\mathbb E[(e^Z-e^{Z'})\mathbf1_{\{Z>Z'\}}]}{\mathbb E e^Z}.
$$
Completing the square in the normal density gives the exponential-tilting identity
$$
\frac{e^z\varphi_{m,s}(z)}{e^{m+s^2/2}}
=\varphi_{m+s^2,s}(z),
$$
where $\varphi_{a,s}$ is the $N(a,s^2)$ density. Therefore
$$
\frac{\mathbb E[e^Z\mathbf1_{\{Z>Z'\}}]}{\mathbb E e^Z}
=\mathbb P\!\left(N(m+s^2,s^2)>N(m,s^2)\right)
=\Phi\!\left(\frac{s}{\sqrt2}\right),
$$
whereas tilting $Z'$ gives
$$
\frac{\mathbb E[e^{Z'}\mathbf1_{\{Z>Z'\}}]}{\mathbb E e^{Z'}}
=\Phi\!\left(-\frac{s}{\sqrt2}\right).
$$
Thus
$$
G
=\Phi\!\left(\frac{s}{\sqrt2}\right)
-\Phi\!\left(-\frac{s}{\sqrt2}\right)
=2\Phi\!\left(\frac{s}{\sqrt2}\right)-1.
$$
From
$$
s^2=\frac{\sigma^2}{2k}+O\!\left(\frac{\sigma^4}{k^2}\right)
$$
and $s\ge0$ one obtains
$$
\frac{s}{\sqrt2}
=\frac{\sigma}{2\sqrt k}
+O\!\left(\frac{\sigma^3}{k^{3/2}}\right).
$$
Since $0<\Phi'(x)\le1/\sqrt{2\pi}$, substitution preserves this error order and proves (P.8.9a.11.6). The Taylor remainder is local in $\delta/\nu^*$; a uniform finite-noise error estimate would require a separate bound on excursions outside the chosen local neighborhood. ∎

### P.8.9a.11.3 Scope, Epistemic Status, and Falsifiability

**Corollary P.8.9a.11.7 (Unified PCE Signature Across Domains).** Any domain populated by adaptive predictive aggregates whose internal optimization is governed by PCE and whose near-equilibrium stochastic adaptation satisfies Hypothesis P.8.9a.11.4 exhibits the following signatures:

1. within each aggregate, value is concentrated disproportionately in a smaller fraction of the operational range (Theorem P.8.9a.11.2);
2. across aggregates, the stationary distribution of complexity excess has a Pareto upper tail with index $\zeta=1+2k/\sigma^2$ (Theorem P.8.9a.11.5);
3. across fixed-shape scale families, the variance-mean relation has Taylor exponent $b=2$ (Corollary P.8.9a.11.5a);
4. in the small-noise regime, the inequality scale is controlled by $\sigma^2/k$ through the lognormal approximation (Proposition P.8.9a.11.6).

*Proof.* Theorem P.8.9a.11.2 proves item 1 for the within-aggregate operational-range profile. Hypothesis P.8.9a.11.4 supplies the near-equilibrium multiplicative stochastic dynamics required by Theorem P.8.9a.11.5; that theorem then gives the stationary Pareto tail and index $\zeta=1+2k/\sigma^2$, proving item 2. Corollary P.8.9a.11.5a computes $\operatorname{Var}(\nu)=(B_2/B_1^2)\mathbb E[\nu]^2$ at constant shape and scaled floor, proving item 3 with exponent $b=2$. Proposition P.8.9a.11.6 gives the local small-noise log-variance $\sigma^2/(2k)+O(\sigma^4/k^2)$ and the resulting Gini approximation, proving item 4. Each conclusion therefore has exactly the hypotheses stated in the corollary. ∎

**Remark P.8.9a.11.2 (Universal-Pattern Boundary).** The Pareto section should not be read as deriving every familiar scale law from PCE alone. It supplies a common stationary heavy-tail mechanism under Hypothesis P.8.9a.11.4 and the exact fixed-shape variance-mean consequence of Corollary P.8.9a.11.5a. Other empirical signatures require additional domain hypotheses:

1. Proposition P.2.6.3d.2 gives an independent conditional Gibbs-log-cost route to Zipf-Mandelbrot statistics. Theorem P.8.9a.11.5 supplies a different route to Pareto tails through multiplicative adaptation. The two are compatible but neither eliminates the extra hypotheses of the other.
2. Approximate $1/f$ spectra follow from mixtures of exponential relaxation modes only when the relaxation-rate measure is approximately logarithmically flat across the observed frequency window [Dutta & Horn 1981]. This is a scale-mixture hypothesis, not a consequence of Equation (P.8.9a.11.1) by itself.
3. KWW/stretched-exponential or Mittag-Leffler relaxation requires an additional broad waiting-time, empirical KWW response kernel, or stable-subordination kernel [Pollard 1948; Scher & Montroll 1975; Williams & Watts 1970]. Multiplicative PCE adaptation can motivate looking for such kernels, but does not fix them without a domain model.
4. Benford first-digit statistics follow from approximate equidistribution of logarithmic mantissas or scale-invariant sampling [Benford 1938]. PCE scale invariance is relevant only after the mantissa-equidistribution condition is checked.
5. Kleiber-type metabolic scaling and biological fractal-network signatures require biological distribution-network hypotheses. Under the standard space-filling terminal-invariant branching-network assumptions in three spatial dimensions, the network model yields $B\propto M^{3/4}$ [Kleiber 1932; West, Brown & Enquist 1997]. PU supplies the $D_{\mathrm{space}}=3$ geometric background on the $D=4$ branch, but the biological network assumptions remain additional empirical structure rather than consequences of POP/PCE alone.
6. Criticality, avalanche exponents, and self-organized critical signatures require an additional mechanism placing the relevant system near a critical fixed point or critical manifold [Wilson 1971]. PCE can supply an optimization pressure toward high-susceptibility operating points, but it does not by itself fix critical exponents or prove that a domain is tuned to criticality.
7. Log-periodic corrections require discrete scale invariance or complex scaling dimensions [Sornette 1998]. Continuous PCE scale compression and the multiplicative population diffusion above do not by themselves introduce a preferred discrete scale ratio, so log-periodic modulation remains an additional domain hypothesis.

**Corollary P.8.9a.11.8 (Tier-4 Biological-Fractal Status Boundary).** Biological fractal and allometric signatures are domain-model consequences only after a concrete biological transport or branching package is appended. Such a package must specify the network geometry, terminal-unit assumptions, dissipation functional, and empirical bridge from predictive complexity to biological throughput. Under those added hypotheses, PCE may act as the optimizing pressure over the biological network objective, but neither the fractal dimension nor the Kleiber exponent is fixed by POP/PCE alone.

*Proof.* Item 5 of Remark P.8.9a.11.2 isolates the biological distribution-network assumptions needed for Kleiber-type scaling and fractal-network signatures. Theorems P.8.9a.11.2 and P.8.9a.11.5 establish only the Law-of-Prediction concentration effect and the conditional multiplicative-noise Pareto tail. They contain no biological branching geometry, terminal-invariance condition, or metabolic transport law. Therefore any biological-fractal conclusion requires the stated domain package as an additional status-carrying input. ∎

**Epistemic Status.** Theorem P.8.9a.11.2 is an internal consequence of the Law of Prediction (Theorem 19). Theorem P.8.9a.11.5 is conditional on the Multiplicative PCE Noise Hypothesis, which is a modeling assumption about population-level fluctuations. Corollary P.8.9a.11.5a is an exact fixed-shape consequence of that stationary family, not a derivation of Taylor's law without the fixed-shape and scaled-floor hypotheses. Proposition P.8.9a.11.6 is a local small-noise approximation, not an exact identity for the full stationary density.

**Falsification Conditions.** The PCE concentration signature admits the following tests:

1. *Within-system disproportion:* In a domain where the Law of Prediction's exponential saturation curve has been independently established, a stable equilibrium value-versus-effort curve violating $\rho(f;x^*)>f$ for some $f\in(0,1)$ contradicts Theorem P.8.9a.11.2.
2. *Tail index structure:* In a population where the effective mean-reversion rate $k$ and multiplicative noise amplitude $\sigma$ can be estimated, the measured upper-tail index should satisfy $\zeta=1+2k/\sigma^2$ within uncertainty if Hypothesis P.8.9a.11.4 applies.
3. *Fixed-shape Taylor scaling:* In a compared scale family satisfying the fixed-shape and scaled-floor hypotheses of Corollary P.8.9a.11.5a, the variance-mean exponent should be $b=2$ within uncertainty.
4. *Small-noise inequality scale:* In a small-noise population satisfying Hypothesis P.8.9a.11.4, the Gini coefficient should agree with Equation (P.8.9a.11.6) to the stated local approximation order.

These predictions distinguish the PCE-based account from purely phenomenological power-law fits by tying the tail index to adaptation-rate parameters that are independently measurable in principle.

**Relation to Holographic Saturation.** The Pareto signature is a population-level analogue of the single-horizon result of Theorem E.8.3.4. That theorem states that PCE drives individual causal boundaries toward capacity saturation; Theorem P.8.9a.11.5 states that, under multiplicative adaptation noise, populations of adaptive systems develop heavy-tailed concentration.

**Relation to Existing Theory.** The PU derivation recovers the structural form of Kesten-type multiplicative processes in the population model and the single-system concentration effect directly from exponential PCE saturation. Gibrat-style proportional fluctuations appear as the small-noise logarithmic approximation, Taylor's variance-mean law appears conditionally through Corollary P.8.9a.11.5a, and the Zipf-Mandelbrot template remains the separate Gibbs-log-cost route of Proposition P.2.6.3d.2. Preferential attachment, $1/f$ mixtures, KWW/stretched relaxations, Benford mantissas, criticality, log-periodic modulation, and Kleiber/fractal biological scaling are therefore related external mechanisms or conditional domain models rather than prerequisites for the PU Pareto derivation. Section P.8.9a.12 states the scale-pattern cases as dedicated conditional theorems by making each required domain hypothesis explicit.

## P.8.9a.12 Conditional Universal Patterns from PCE Scale Geometry

The preceding section separates the internal Pareto concentration theorem from population-level and domain-level hypotheses. This subsection records the corresponding conditional universal-pattern theorems. In each case PU supplies the shared PCE scale language, while the theorem states the additional cost, rank, phase, relaxation, discrete-scale, or biological-network condition needed for the named empirical pattern.

**Headline antecedent display.** Throughout this subsection, every named scale-pattern theorem has the structural form
$$
\mathrm{POP}\,\land\,\mathrm{PCE}
\,\land\,\mathcal H_{\mathrm{pattern}}
\;\Longrightarrow\;
\text{named scale pattern},
$$
where $\mathcal H_{\mathrm{pattern}}$ is the explicit domain hypothesis named in each theorem: logarithmic ranked PCE cost (Zipf–Mandelbrot), multiplicative adaptation noise (Pareto), log-flat relaxation-rate measure ($1/f$), broad waiting-time or stable-subordination kernel (KWW), mantissa-equidistribution (Benford), discrete scale invariance (log-periodic), terminal-invariant space-filling biological transport (Kleiber), self-similar branching cascade with non-overlap (multifractal), or fixed-shape inverse-gamma family (Taylor). Removing $\mathcal H_{\mathrm{pattern}}$ from any of these antecedents removes the named conclusion; POP and PCE alone are not sufficient. The conditional universal-pattern template is the precise discipline by which the framework relates to the empirical scaling literature without absorbing its named domain assumptions into POP/PCE.

**Definition P.8.9a.12.0c (Criticality-Tuning Certificate $\mathfrak C_{\mathrm{crit}}$).** A criticality-tuning certificate for a retained domain is a finite forward-locked record
$$
\mathfrak C_{\mathrm{crit}}
=
(\mathcal X_{\mathrm{dom}},PP_{\mathrm{dom}},\theta_{\mathrm{ctrl}},\chi_{\mathrm{sus}},\mathcal M_{\mathrm{crit}},d_{\mathrm{crit}},\epsilon_{\mathrm{crit}},\mathcal U_{\mathrm{class}},\mathcal R_{\mathrm{FS}},\text{forward lock}),
$$
where $\mathcal X_{\mathrm{dom}}$ is the retained domain state family, $PP_{\mathrm{dom}}$ is the predictive-performance observable, $\theta_{\mathrm{ctrl}}$ is the control coordinate, $\chi_{\mathrm{sus}}$ is the susceptibility or response-variance observable, $\mathcal M_{\mathrm{crit}}$ is the claimed critical manifold or fixed point, $d_{\mathrm{crit}}$ is the pre-registered distance-to-criticality functional, $\epsilon_{\mathrm{crit}}$ is the accepted residual window, $\mathcal U_{\mathrm{class}}$ records the universality-class data if critical exponents are claimed, and $\mathcal R_{\mathrm{FS}}$ records finite-size scaling, avalanche-window, or correlation-length tests. The certificate is domain-relative and finite-window: it never follows merely from the viability band $\alpha<PP<\beta$.

**Proposition P.8.9a.12.0d (Marginal Predictability is Certificate-Gated Criticality).** POP, PCE, and Operational Viability alone do not prove that a domain is tuned to a critical point. If $\mathfrak C_{\mathrm{crit}}$ is accepted, then the domain may be reported as marginally predictable at the recorded resolution in the precise sense
$$
d_{\mathrm{crit}}(\mathcal X_{\mathrm{dom}},\mathcal M_{\mathrm{crit}})
\le
\epsilon_{\mathrm{crit}},
$$
and any scale-free exponents or avalanche laws inherit the universality-class and finite-size-scaling entries of the same certificate. Without $\mathfrak C_{\mathrm{crit}}$, the correct PU statement is only that PCE can create pressure toward high-susceptibility operating points; it does not derive cosmological self-organized criticality, critical exponents, or edge-of-chaos tuning.

*Proof.* Remark P.8.9a.11.2 already separates criticality from the internal PCE Pareto and concentration theorems. A finite PCE optimization problem can have an isolated stable minimizer with finite susceptibility, so POP/PCE do not imply a divergent correlation length or a critical manifold. The additional entries of $\mathfrak C_{\mathrm{crit}}$ are exactly the missing data: a control coordinate, a distance-to-criticality functional, finite-size scaling, and a universality-class record when exponents are claimed. The displayed inequality is then the direct content of the accepted finite record. ∎

**Theorem P.8.9a.12.1 (Conditional Zipf-Mandelbrot Law from Logarithmic PCE Cost).** Let $N\in\mathbb N\cup\{\infty\}$, let ranks be $r=1,\ldots,N$, and suppose the PCE activation weights are Gibbs weights
$$
p_r=Z_N^{-1}e^{-\beta E_r},
\qquad
\beta>0,
$$
with logarithmic ranked PCE cost
$$
E_r=E_0+\gamma\log(r+r_0),
\qquad
\gamma>0,
\qquad
r_0\ge0.
$$
Then
$$
p_r=
\frac{(r+r_0)^{-s}}
{\sum_{q=1}^N(q+r_0)^{-s}},
\qquad
s=\beta\gamma.
\tag{P.8.9a.12.1}
$$
For $N=\infty$, the normalizing constant is finite exactly when $s>1$. The exact Zipf exponent $s=1$ is therefore normalizable only on a finite ranked population, a truncated window, or a model with an additional upper cutoff.

*Proof.* Substituting the cost law into the Gibbs form gives
$$
e^{-\beta E_r}
=
e^{-\beta E_0}(r+r_0)^{-\beta\gamma}.
$$
The constant $e^{-\beta E_0}$ is independent of $r$ and is absorbed into $Z_N$, yielding (P.8.9a.12.1) with $s=\beta\gamma$. If $N<\infty$, the finite sum is positive and finite. If $N=\infty$, then $r+r_0$ is comparable to $r$ for large $r$, so
$$
\sum_{r=1}^{\infty}(r+r_0)^{-s}
$$
converges exactly when the $p$-series $\sum r^{-s}$ converges, namely when $s>1$. For $s=1$ the harmonic comparison diverges. ∎

**Theorem P.8.9a.12.2 (Rank-Pareto Zipf Bridge).** Let $X$ be a positive population variable with Pareto upper survival law
$$
\mathbb P(X>x)=\left(\frac{x_0}{x}\right)^{\zeta},
\qquad
x\ge x_0>0,
\qquad
\zeta>0.
$$
For a population of size $N$, define the deterministic rank curve $x_r$ by the expected exceedance equation
$$
N\mathbb P(X>x_r)=r,
\qquad
1\le r\le N.
$$
Then
$$
x_r=x_0\left(\frac Nr\right)^{1/\zeta}.
\tag{P.8.9a.12.2}
$$
Thus a Pareto tail with survival exponent $\zeta$ induces a Zipf-type rank-size exponent $1/\zeta$. In particular, the multiplicative PCE adaptation tail of Theorem P.8.9a.11.5 gives the rank exponent
$$
\frac1{\zeta}
=
\frac1{1+2k/\sigma^2}.
$$

*Proof.* The defining equation gives
$$
N\left(\frac{x_0}{x_r}\right)^{\zeta}=r.
$$
Solving for $x_r$ gives
$$
\left(\frac{x_r}{x_0}\right)^{\zeta}=\frac Nr,
\qquad
x_r=x_0\left(\frac Nr\right)^{1/\zeta}.
$$
Substituting $\zeta=1+2k/\sigma^2$ from Theorem P.8.9a.11.5 gives the displayed PCE specialization. ∎

**Theorem P.8.9a.12.3 (Conditional $1/f$ Spectrum from Log-Flat PCE Relaxation Modes).** Suppose an observed PCE-adapted aggregate has independent exponential relaxation modes whose unit-variance mode with relaxation rate $\lambda$ has two-sided spectrum
$$
S_{\lambda}(\omega)=\frac{2\lambda}{\lambda^2+\omega^2},
\qquad
\omega>0.
$$
Suppose further that, across the observed band, the relaxation-rate measure is logarithmically flat,
$$
d\mu(\lambda)=A\frac{d\lambda}{\lambda},
\qquad
A>0,
\qquad
\lambda\in[\lambda_{\min},\lambda_{\max}].
$$
Then the mixed spectrum is
$$
S(\omega)
=
\frac{2A}{\omega}
\left[
\arctan\left(\frac{\lambda_{\max}}{\omega}\right)
-
\arctan\left(\frac{\lambda_{\min}}{\omega}\right)
\right].
\tag{P.8.9a.12.3}
$$
In the intermediate window $\lambda_{\min}\ll\omega\ll\lambda_{\max}$,
$$
S(\omega)=\frac{\pi A}{\omega}
+
O\left(\frac{A\lambda_{\min}}{\omega^2}
+
\frac{A}{\lambda_{\max}}\right),
\tag{P.8.9a.12.4}
$$
with the explicit bound
$$
\left|S(\omega)-\frac{\pi A}{\omega}\right|
\le
\frac{2A}{\omega}
\left(
\frac{\lambda_{\min}}{\omega}
+
\frac{\omega}{\lambda_{\max}}
\right).
$$

*Proof.* The mixture spectrum is
$$
S(\omega)
=
\int_{\lambda_{\min}}^{\lambda_{\max}}
\frac{2\lambda}{\lambda^2+\omega^2}
A\frac{d\lambda}{\lambda}
=
2A\int_{\lambda_{\min}}^{\lambda_{\max}}
\frac{d\lambda}{\lambda^2+\omega^2}.
$$
Since
$$
\int\frac{d\lambda}{\lambda^2+\omega^2}
=
\frac1{\omega}\arctan\left(\frac{\lambda}{\omega}\right),
$$
Equation (P.8.9a.12.3) follows. Also
$$
0\le \arctan u\le u
\quad (u\ge0),
$$
and
$$
0\le \frac{\pi}{2}-\arctan v=\arctan(1/v)\le \frac1v
\quad (v>0).
$$
Therefore
$$
\left|
\arctan\left(\frac{\lambda_{\max}}{\omega}\right)
-
\arctan\left(\frac{\lambda_{\min}}{\omega}\right)
-
\frac{\pi}{2}
\right|
\le
\frac{\omega}{\lambda_{\max}}
+
\frac{\lambda_{\min}}{\omega}.
$$
Multiplying by $2A/\omega$ gives the stated bound and the asymptotic $1/\omega$ law. ∎

**Theorem P.8.9a.12.4 (Stretched-Exponential Relaxation from Stable-Subordinated PCE Modes).** Let $0<\alpha\le1$ and $\tau>0$. Suppose a PCE relaxation observable is a positive mixture of exponential modes
$$
\Phi(t)=\int_0^{\infty}e^{-\lambda t}\,d\mu_{\alpha,\tau}(\lambda),
\qquad
t\ge0,
$$
where $\mu_{\alpha,\tau}$ is the probability measure whose Laplace transform is
$$
\int_0^{\infty}e^{-\lambda t}\,d\mu_{\alpha,\tau}(\lambda)
=
\exp[-(t/\tau)^{\alpha}].
\tag{P.8.9a.12.5}
$$
Then
$$
\Phi(t)=\exp[-(t/\tau)^{\alpha}].
\tag{P.8.9a.12.6}
$$
For $\alpha=1$ this reduces to ordinary exponential relaxation with rate $1/\tau$; for $0<\alpha<1$ it is the Kohlrausch-Williams-Watts stretched exponential.

*Proof.* For every $t\ge0$, the definition of the observable and the assumed Laplace-transform identity give
$$
\Phi(t)
=\int_0^\infty e^{-\lambda t}\,d\mu_{\alpha,\tau}(\lambda)
=\exp[-(t/\tau)^\alpha],
$$
which is (P.8.9a.12.6). If $\alpha=1$, this expression is $e^{-t/\tau}$, the ordinary exponential relaxation law with rate $1/\tau$. If $0<\alpha<1$, the same expression is, by definition, the Kohlrausch--Williams--Watts stretched exponential. No existence theorem for $\mu_{\alpha,\tau}$ is needed because existence and the transform identity are hypotheses of the theorem. ∎

**Theorem P.8.9a.12.5 (Benford Mantissas from Multiplicative PCE Phase Mixing).** Fix an integer base $b\ge2$. Let $X>0$ and set
$$
Y=\{\log_b X\}\in[0,1),
$$
where $\{\cdot\}$ denotes fractional part. If $Y$ is uniform on $[0,1)$, then the first base-$b$ digit $D\in\{1,\ldots,b-1\}$ satisfies
$$
\mathbb P(D=d)=\log_b\left(1+\frac1d\right).
\tag{P.8.9a.12.7}
$$
Moreover, suppose a multiplicative PCE phase process has the form
$$
X_n=X_0\prod_{j=1}^n A_j,
\qquad
A_j>0,
$$
where the increments $Z_j=\log_b A_j\pmod1$ are independent and identically distributed on the circle $\mathbb T=\mathbb R/\mathbb Z$. If their common law $\nu$ satisfies
$$
|\widehat\nu(m)|<1
\qquad
\text{for every }m\in\mathbb Z\setminus\{0\},
$$
then
$$
\{\log_b X_n\}\Rightarrow \mathrm{Unif}[0,1)
$$
and the first-digit probabilities converge to (P.8.9a.12.7).

*Proof.* The event $D=d$ is exactly
$$
\log_b d\le \{\log_b X\}<\log_b(d+1),
$$
because numbers with first base-$b$ digit $d$ lie in intervals $[d b^m,(d+1)b^m)$ over integer $m$. If $Y$ is uniform, then
$$
\mathbb P(D=d)
=
\log_b(d+1)-\log_b d
=
\log_b\left(1+\frac1d\right).
$$

For the phase-mixing statement, let $\theta_n=\{\log_b X_n\}$. On $\mathbb T$,
$$
\theta_n=\theta_0+Z_1+\cdots+Z_n.
$$
If $\mu_n$ is the law of $\theta_n$, then
$$
\mu_n=\mu_0*\nu^{*n}.
$$
Hence its Fourier coefficients satisfy
$$
\widehat\mu_n(m)=\widehat\mu_0(m)\widehat\nu(m)^n.
$$
For $m=0$ this coefficient is $1$. For every $m\ne0$, the strict bound $|\widehat\nu(m)|<1$ gives $\widehat\mu_n(m)\to0$. These are exactly the Fourier coefficients of Haar measure on $\mathbb T$, so $\mu_n$ converges weakly to uniform measure. The digit intervals have boundary of uniform measure zero, and therefore their probabilities converge to their uniform lengths, which are the Benford probabilities above. ∎

**Theorem P.8.9a.12.6 (Log-Periodic Corrections from Discrete Scale Invariance).** Let $\lambda>1$ and let $F:(0,\infty)\to\mathbb C$ be locally square-integrable. Suppose
$$
F(\lambda x)=\lambda^{\alpha}F(x)
\qquad
\text{for all }x>0
\tag{P.8.9a.12.8}
$$
for some $\alpha\in\mathbb R$. Then there is a period-one function $P$ such that
$$
F(x)=x^{\alpha}P\left(\frac{\log x}{\log\lambda}\right).
\tag{P.8.9a.12.9}
$$
If $P$ has Fourier coefficients $c_m$, then in $L^2_{\mathrm{loc}}$ on logarithmic scale,
$$
F(x)
=
x^{\alpha}
\sum_{m\in\mathbb Z}
c_m
\exp\left(
\frac{2\pi i m\log x}{\log\lambda}
\right).
\tag{P.8.9a.12.10}
$$
For real-valued $F$, $c_{-m}=\overline{c_m}$. If the first harmonic is the leading nonconstant mode, the leading log-periodic correction has the form
$$
F(x)
=
x^{\alpha}
\left[
c_0
+
2|c_1|
\cos\left(
\frac{2\pi\log x}{\log\lambda}
+
\phi
\right)
+
\cdots
\right],
\tag{P.8.9a.12.11}
$$
with $\phi=\arg c_1$. Near a critical point $x_c$, the same conclusion applies to the distance variable $y=|x-x_c|$ whenever the discrete scale covariance holds in $y$.

*Proof.* Define
$$
u=\frac{\log x}{\log\lambda},
\qquad
P(u)=\lambda^{-\alpha u}F(\lambda^u).
$$
Then
$$
P(u+1)
=
\lambda^{-\alpha(u+1)}F(\lambda^{u+1})
=
\lambda^{-\alpha u}\lambda^{-\alpha}F(\lambda\lambda^u).
$$
Using (P.8.9a.12.8),
$$
F(\lambda\lambda^u)=\lambda^{\alpha}F(\lambda^u),
$$
so $P(u+1)=P(u)$. Since $x=\lambda^u$, this gives
$$
F(x)=\lambda^{\alpha u}P(u)=x^{\alpha}P\left(\frac{\log x}{\log\lambda}\right).
$$
The Fourier series of the period-one function $P$ gives
$$
P(u)=\sum_{m\in\mathbb Z}c_m e^{2\pi i m u}
$$
in $L^2$ over one period, which yields (P.8.9a.12.10) after substituting $u=\log x/\log\lambda$. If $F$ is real-valued then $P$ is real-valued and its Fourier coefficients satisfy $c_{-m}=\overline{c_m}$. Combining the $m=1$ and $m=-1$ terms gives (P.8.9a.12.11). Replacing $x$ by $y=|x-x_c|$ gives the critical-point form. ∎

**Theorem P.8.9a.12.7 (Conditional Kleiber Scaling on the $D_{\mathrm{space}}=3$ Biological Transport Branch).** Consider an idealized terminal-invariant biological transport branch embedded in $D_{\mathrm{space}}=D$ spatial dimensions. Suppose the transport network has branching ratio $n>1$ and levels $k=0,\ldots,K$, with $N_k=n^k$ vessels at level $k$ and $N_K=n^K$ terminal service units. Assume:

1. terminal invariance: terminal length $l_K$ and terminal radius $r_K$ are independent of $K$, and each terminal unit supplies the same metabolic throughput;
2. space-filling geometry:
$$
l_k=l_K n^{(K-k)/D};
$$
3. area-preserving transport:
$$
N_k r_k^2=N_K r_K^2
\qquad
\text{for every }k;
$$
4. PCE-optimized biological resource allocation makes body mass proportional to total transport-network volume and metabolic rate proportional to terminal throughput:
$$
M\asymp V_{\mathrm{net}},
\qquad
B\asymp N_K.
$$

Then, as $K\to\infty$,
$$
B\asymp M^{D/(D+1)}.
\tag{P.8.9a.12.12}
$$
On the PU branch with $D_{\mathrm{space}}=3$,
$$
B\asymp M^{3/4}.
\tag{P.8.9a.12.13}
$$

*Proof.* The volume of level $k$ vessels is proportional to
$$
N_k r_k^2 l_k.
$$
By area preservation,
$$
N_k r_k^2=N_K r_K^2=n^K r_K^2.
$$
By space-filling geometry,
$$
l_k=l_K n^{(K-k)/D}.
$$
Therefore
$$
V_{\mathrm{net}}
\asymp
\sum_{k=0}^{K}N_k r_k^2l_k
=
r_K^2l_K n^K
\sum_{k=0}^{K} n^{(K-k)/D}.
$$
With $j=K-k$,
$$
\sum_{k=0}^{K} n^{(K-k)/D}
=
\sum_{j=0}^{K} n^{j/D}
=
\frac{n^{(K+1)/D}-1}{n^{1/D}-1}.
$$
Thus
$$
V_{\mathrm{net}}
\asymp
n^K n^{K/D}
=
(n^K)^{(D+1)/D}
=
N_K^{(D+1)/D},
$$
where the omitted multiplicative constants depend on $n,D,l_K,r_K$ but not on $K$. Since $M\asymp V_{\mathrm{net}}$ and $B\asymp N_K$,
$$
M\asymp B^{(D+1)/D},
$$
and hence
$$
B\asymp M^{D/(D+1)}.
$$
Setting $D=D_{\mathrm{space}}=3$ gives $B\asymp M^{3/4}$. ∎

**Corollary P.8.9a.12.8 (Tier-4 Biological Fractal Scaling).** Let a biological morphology or transport subnetwork be generated across a finite scale range by a self-similar branching rule with $n$ copies per scale step and length ratio $r\in(0,1)$. If the copies satisfy the standard non-overlap condition on that scale range, then the effective box-counting dimension over the range is
$$
D_f=\frac{\log n}{\log(1/r)}.
\tag{P.8.9a.12.14}
$$
For a physical biological network embedded in the PU branch with $D_{\mathrm{space}}=3$, an exact infinite-range non-overlapping self-similar limit must satisfy $D_f\le3$. The biological-fractal conclusion is therefore Tier-4: it follows from an appended biological branching package, not from POP/PCE alone.

*Proof.* After $m$ scale steps there are $n^m$ self-similar pieces, each of diameter proportional to $r^m$. Set $\epsilon=r^m$. The number of $\epsilon$-scale boxes needed satisfies
$$
N(\epsilon)\asymp n^m.
$$
Since $m=\log\epsilon/\log r$ and $\log r<0$,
$$
\frac{\log N(\epsilon)}{\log(1/\epsilon)}
\to
\frac{m\log n}{m\log(1/r)}
=
\frac{\log n}{\log(1/r)}
$$
over the self-similar range. This is the box-counting dimension formula. In an exact non-overlapping embedding into three-dimensional space, box dimension cannot exceed the ambient dimension, so $D_f\le3$. The hypotheses used are the biological branching rule, scale ratio, and non-overlap condition; none is supplied by POP/PCE alone. ∎

**Theorem P.8.9a.12.9 (Standalone Taylor Law for Fixed-Shape PCE Scale Families).** Let $Y$ be a nonnegative random variable with
$$
0<\mu_Y:=\mathbb E[Y]<\infty,
\qquad
0<\sigma_Y^2:=\operatorname{Var}(Y)<\infty.
$$
Let a fixed-shape PCE scale family be given by
$$
X_a=aY,
\qquad
a>0.
$$
Then
$$
\mathbb E[X_a]=a\mu_Y,
\qquad
\operatorname{Var}(X_a)=a^2\sigma_Y^2,
$$
and consequently
$$
\operatorname{Var}(X_a)
=
\frac{\sigma_Y^2}{\mu_Y^2}\,\mathbb E[X_a]^2.
\tag{P.8.9a.12.15}
$$
Thus Taylor's variance-mean exponent is exactly $2$ on every fixed-shape scale family with finite nonzero mean and variance. Corollary P.8.9a.11.5a is the inverse-gamma PCE stationary-family specialization of this general scale-family theorem.

*Proof.* Linearity of expectation gives
$$
\mathbb E[X_a]=\mathbb E[aY]=a\mu_Y.
$$
Variance is homogeneous of degree two under deterministic scaling:
$$
\operatorname{Var}(X_a)=\operatorname{Var}(aY)=a^2\sigma_Y^2.
$$
Since $a=\mathbb E[X_a]/\mu_Y$, substitution gives
$$
\operatorname{Var}(X_a)
=
\left(\frac{\mathbb E[X_a]}{\mu_Y}\right)^2\sigma_Y^2
=
\frac{\sigma_Y^2}{\mu_Y^2}\,\mathbb E[X_a]^2.
$$
The exponent is therefore exactly $2$. Corollary P.8.9a.11.5a has common shape and common scaled floor, so its stationary laws differ only by the scale parameter $\beta_{\mathrm{st}}$ and are an instance of the present theorem. ∎

**Theorem P.8.9a.12.10 (Conditional Multifractal Cascade Spectrum from Self-Similar PCE Branching).** *Consider a self-similar PCE-cascade branch in which the predictive update-capacity measure $\mu$ on a compact metric configuration space is generated by an iterated branching rule with $b \geq 2$ branches per step, common scale ratio $r > 1$, and branch weights $p_1, \dots, p_b > 0$ satisfying $\sum_{i=1}^b p_i = 1$. Assume the standard non-overlap condition between branches at every level. Define the partition function over $\varepsilon$-boxes covering the support by*

$$
Z_q(\varepsilon)
:=
\sum_{i:\,B_i\cap\mathrm{supp}(\mu)\neq\varnothing}
\mu(B_i)^q,
\qquad
q \in \mathbb{R},
\tag{P.8.9a.12.16}
$$

*and let the multifractal exponent function be*

$$
\tau(q)
:=
\lim_{\varepsilon \to 0^+}
\frac{\log Z_q(\varepsilon)}{\log\varepsilon}
=
\frac{\log\!\bigl(\sum_{i=1}^b p_i^q\bigr)}{\log(1/r)}.
\tag{P.8.9a.12.17}
$$

*Then:*

*1. (Singularity spectrum as Legendre transform.) The singularity spectrum*

$$
f(\alpha)
:=
\dim_{\mathrm{box}}
\Bigl\{
x \in \mathrm{supp}(\mu)
:
\lim_{\varepsilon \to 0^+}
\frac{\log\mu(B_\varepsilon(x))}{\log\varepsilon}
=
\alpha
\Bigr\}
$$

*equals the Legendre transform of $\tau$:*

$$
f(\alpha)
=
\inf_{q \in \mathbb{R}}\bigl(q\alpha - \tau(q)\bigr).
\tag{P.8.9a.12.18}
$$

*2. (Large-deviation form.) Let $D_{\mathrm{eff}} := \log b/\log r$ be the box-counting dimension of $\mathrm{supp}(\mu)$, let $\mathbf{x} = (x_1, \dots, x_b)$ be the empirical branch frequencies along a length-$n$ path under the uniform branch-counting law, and let*

$$
I_{\mathrm{unif}}(\mathbf{x})
:=
\sum_{i=1}^b x_i \log(b\,x_i)
\tag{P.8.9a.12.19}
$$

*be the Cramer rate function for $\mathbf{x}$ relative to the uniform distribution. Define*

$$
\alpha(\mathbf{x})
:=
-\frac{1}{\log r}\sum_{i=1}^b x_i \log p_i.
\tag{P.8.9a.12.20}
$$

*Then for every $\alpha$ in the range of the map $\mathbf{x} \mapsto \alpha(\mathbf{x})$,*

$$
f(\alpha)
=
D_{\mathrm{eff}}
-
\frac{1}{\log r}
\inf\bigl\{\,I_{\mathrm{unif}}(\mathbf{x}) : \alpha(\mathbf{x}) = \alpha\bigr\}.
\tag{P.8.9a.12.21}
$$

*Proof.*

*Step 1 ($\tau(q)$ closed form).* By the non-overlap condition, the level-$n$ partition consists of $b^n$ disjoint boxes of diameter $r^{-n}$. The mass of the box reached by the path $(i_1, \dots, i_n)$ is $\prod_{j=1}^n p_{i_j}$. With $\varepsilon = r^{-n}$, the partition function evaluates to

$$
Z_q(r^{-n})
=
\sum_{(i_1,\dots,i_n)}\prod_{j=1}^n p_{i_j}^q
=
\Bigl(\sum_{i=1}^b p_i^q\Bigr)^n.
$$

Therefore $\log Z_q(r^{-n}) = n \log\!\bigl(\sum_i p_i^q\bigr)$ and $\log(r^{-n}) = n\log(1/r)$, giving (P.8.9a.12.17) in the limit.

*Step 2 (Legendre transform.) Equation (P.8.9a.12.18) is the multifractal formalism in its rigorously established form for self-similar measures satisfying the non-overlap condition [Falconer 1997, Theorem 11.2]: under these hypotheses, the singularity spectrum equals the Legendre transform of $\tau$, with both sides finite on the interval $[\alpha_{\min}, \alpha_{\max}]$ where $\alpha_{\min} = \min_i(-\log p_i/\log r)$ and $\alpha_{\max} = \max_i(-\log p_i/\log r)$.*

*Step 3 (LDP form.)* Let
$$
\Delta_b=
\left\{\mathbf x\in[0,1]^b:\sum_{i=1}^b x_i=1\right\},
\qquad
H(\mathbf x)=-\sum_{i=1}^b x_i\log x_i,
$$
with $0\log0=0$. If $\mathbf x$ is an $n$-type, so each $nx_i$ is an integer, every path of that type has mass $\prod_i p_i^{nx_i}$ and width $r^{-n}$. Hence its local exponent is
$$
\frac{n\sum_i x_i\log p_i}{-n\log r}
=
-\frac1{\log r}\sum_i x_i\log p_i
=
\alpha(\mathbf x).
$$
The method-of-types bounds [Cover & Thomas 2006] give
$$
(n+1)^{-b}e^{nH(\mathbf x)}
\le
\binom{n}{nx_1,\ldots,nx_b}
\le
e^{nH(\mathbf x)}.
\tag{P.8.9a.12.21a}
$$
These inequalities also follow by applying Stirling's formula to the factorials; the logarithmic error is $O(\log n)$ uniformly over the at most $(n+1)^b$ possible types.

For $\delta>0$, let $N_{n,\delta}(\alpha)$ be the number of level-$n$ boxes whose type $\mathbf x$ satisfies $|\alpha(\mathbf x)-\alpha|\le\delta$. Summing (P.8.9a.12.21a) over all such types and using the bound $(n+1)^b$ on their number gives
$$
\lim_{\delta\downarrow0}\lim_{n\to\infty}
\frac1n\log N_{n,\delta}(\alpha)
=
\sup\{H(\mathbf x):\mathbf x\in\Delta_b,\ \alpha(\mathbf x)=\alpha\}.
\tag{P.8.9a.12.21b}
$$
For the upper bound, compactness of $\Delta_b$ and continuity of $H$ and $\alpha$ imply that the supremum over the closed $\delta$-window decreases to the constrained supremum. For the lower bound, choose any feasible $\mathbf x$ and approximate it by $n$-types $\mathbf x^{(n)}\to\mathbf x$; continuity gives $\alpha(\mathbf x^{(n)})\to\alpha$ and $H(\mathbf x^{(n)})\to H(\mathbf x)$. Thus no uniqueness or interior assumption is used.

Because level-$n$ boxes have width $r^{-n}$, division of (P.8.9a.12.21b) by $\log r$ gives
$$
f(\alpha)
=
\frac1{\log r}
\sup_{\alpha(\mathbf x)=\alpha}H(\mathbf x).
\tag{P.8.9a.12.21c}
$$
Moreover,
$$
I_{\mathrm{unif}}(\mathbf x)
=
\sum_i x_i\log(bx_i)
=
\log b-H(\mathbf x).
$$
Substitution into (P.8.9a.12.21c) yields
$$
f(\alpha)
=
\frac{\log b}{\log r}
-
\frac1{\log r}
\inf_{\alpha(\mathbf x)=\alpha}I_{\mathrm{unif}}(\mathbf x)
=
D_{\mathrm{eff}}
-
\frac1{\log r}
\inf_{\alpha(\mathbf x)=\alpha}I_{\mathrm{unif}}(\mathbf x),
$$
which is (P.8.9a.12.21).

It remains to verify agreement with (P.8.9a.12.18). For $q\in\mathbb R$, define
$$
x_i(q)=\frac{p_i^q}{\sum_jp_j^q}.
$$
For any $\mathbf x\in\Delta_b$, nonnegativity of relative entropy [Cover & Thomas 2006] gives
$$
0
\le
D_{\mathrm{KL}}(\mathbf x\|\mathbf x(q))
=
-H(\mathbf x)-q\sum_i x_i\log p_i
+\log\!\left(\sum_jp_j^q\right).
$$
If $\alpha(\mathbf x)=\alpha$, then $\sum_i x_i\log p_i=-\alpha\log r$, and therefore
$$
\frac{H(\mathbf x)}{\log r}
\le
q\alpha+
\frac{\log(\sum_jp_j^q)}{\log r}
=
q\alpha-\tau(q).
\tag{P.8.9a.12.21d}
$$
For every exponent in the interior of the attainable interval, continuity of $q\mapsto\alpha(\mathbf x(q))$ supplies a $q$ with $\alpha(\mathbf x(q))=\alpha$, and equality holds in (P.8.9a.12.21d) because the relative entropy then vanishes. At either endpoint, take $q\to+\infty$ or $q\to-\infty$; the distributions $\mathbf x(q)$ converge to the entropy-maximizing distribution on the corresponding extremal-weight face, and continuity gives equality there as well. If all $p_i$ are equal, the attainable interval is a single point and equality follows directly from the uniform distribution. Consequently
$$
f(\alpha)
=
\inf_{q\in\mathbb R}\bigl(q\alpha-\tau(q)\bigr)
$$
for every attainable $\alpha$, including nonunique and endpoint cases. ∎

*Status.* Theorem P.8.9a.12.10 is an instance of the conditional universal-pattern template of Section P.8.9a.12: it derives the singularity spectrum of a self-similar PCE-cascade branch from explicit branching, weight, and non-overlap data, but does not derive these data from POP/PCE alone. PCE may select among admissible cascade branches via the operational cost of the branching rule, but the selection of $b$, $r$, and $\{p_i\}$ requires additional domain hypotheses analogous to the network-geometry inputs of Theorem P.8.9a.12.7 and the discrete-scale-invariance input of Theorem P.8.9a.12.6. The relation $f(\alpha) = D_{\mathrm{eff}} - I_{\mathrm{unif}}(\alpha)/\log r$ is the rigorous form of the heuristic identification between multifractal spectra and large-deviation rate functions used in the turbulence and Anderson-transition literatures [Frisch 1995; Halsey et al. 1986]; PU supplies the conditional template, the empirical $f(\alpha)$ measurement is the direct test of the cascade hypothesis on each named domain.

*Falsification Conditions.* Within an independently validated PCE-cascade branch with measured branching parameters $(b, r, \{p_i\})$:

*1. an empirically resolved singularity spectrum $f_{\mathrm{obs}}(\alpha)$ that is not the Legendre transform of $\tau(q) = \log(\sum_i p_i^q)/\log(1/r)$ contradicts (P.8.9a.12.18);*

*2. an observed deviation between $f_{\mathrm{obs}}(\alpha)$ and $D_{\mathrm{eff}} - I_{\mathrm{unif}}(\mathbf{x}(\alpha))/\log r$ on the same branch contradicts (P.8.9a.12.21).*

*Each contradiction is conditional on the prior validation of the branching, scale-ratio, weight, and non-overlap hypotheses; absent that branch, the null result rejects the cascade hypothesis itself rather than the multifractal formalism.*


## P.8.10 The Ontological Status of Emergent Spacetime

PU's spacetime is an effective causal and metric response structure on the accepted intervention, causal-diamond, regularity, mode-channel, and continuum branches. It is neither a fundamental metric field nor the geometric image of a classical error-correcting code. Golay, Leech, and $24$-cell records can serve as separately certified finite cross-checks, but none defines spacetime or determines the others.



Definition P.8.2 navigates between traditional positions:

**Against Substantivalism:** Spacetime is not a substance or "stuff." There are only predictive relationships and their error-correcting structure. Remove the predictions, and spacetime doesn't become empty—it ceases to exist as a meaningful concept.

**Against Pure Relationalism:** Spacetime is not merely relations between pre-existing objects. The "objects" (persistent patterns of predictive coherence) and the "spacetime" (structure of that coherence) emerge together from the same MPU network dynamics. Neither is ontologically prior.

**Against Conventionalism:** Spacetime is not an arbitrary descriptive choice among equally valid alternatives. The geometry is uniquely determined by PCE optimization: there is exactly one way to optimally error-correct 24 predictive modes, and that determines the emergent structure.

---

## P.8.11 Summary

The closed claim is branch-conditional: finite predictive relations admit an effective spacetime description when the causal-response, metric-reconstruction, regularity, and continuum certificates are accepted. The classical Golay ledger, conditional Leech gluing, local $24$-cell packing, arrow-of-time ledger, and physical recovery channel remain distinct. Their coexistence is a compatibility statement, not one complete implication chain.



The Cogito-certified knowledge process has a canonical predictive representation on the finite self-verifying operational class:
$$
\text{Cogito-certified knowledge process}+\text{finite expected-response/update/verification data}
\xrightarrow{\mathrm{P.6.1c.3--P.6.1c.4}}
\text{canonical predictive normal form}.
$$
Within PU, finite predictive relations then admit an effective spacetime description on the branch carrying the causal-response, metric-reconstruction, regularity, and continuum certificates stated above. The registered-reset inequality
$$
\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)
$$
requires a registered reset, while a positive per-event floor requires $H_q(P\mid R)\ge h_{\min}>0$. A pathwise arrow additionally requires the forward/reverse event algebra and stochastic-entropy certificate of Theorem O.3. Lorentzian signature additionally requires the coordinate, second-order dynamics, and nondegenerate cone hypotheses of Theorem O.7a.

The $[24,12,8]$ code ledger, conditional Leech gluing, local $24$-cell packing, dimension count, pathwise arrow, and Lorentzian reconstruction are distinct conditional constructions. When their hypotheses are jointly registered, their outputs are compatible components of one effective description; none of these ledgers is identified with, or reconstructed from, the others by the displayed parameter chain alone.


## P.9 A New Methodology for Scientific Inquiry

The distinction between logical necessities and their physical manifestations provides a powerful new methodology for organizing scientific inquiry.

*   **Category 1: Logical Necessities:** These are questions about the foundational requirements for prediction. They are not answered by empirical experiment but by logical and mathematical deduction.
    *   *Examples:* "Why is there an arrow of time?" "Why must information be discrete?" "Why is there causality?"
    *   *PU Answer:* Because these are necessary preconditions for the existence of any knowledge system.

*   **Category 2: Physical Reality:** These are questions about the specific, contingent ways in which the logical necessities are implemented in our universe. These are the proper domain of empirical science.
    *   *Examples:* "What is the value of the speed of light?" "What are the masses of the elementary particles?" "What is the specific form of the law of gravity?"
    *   *PU Answer:* These values are determined by the PCE optimization process acting on the MPU network. They are the emergent parameters of the universe's equilibrium state.

The PU framework reveals that the boundary between logical necessity and contingent parameter is sharper than traditionally assumed. Einstein asked whether God had any choice in creating the universe—whether the fundamental constants could have been otherwise. Appendix Z fixes the interface count $M=24$ on its minimal discrete branch. Its coding, mode--channel, lattice-classification, modular, and Niemeier records have different premises. The predictive-recovery branch separately selects $\mathcal G_{24}$; a Leech lattice requires the registered gluing or rootlessness datum; and $D=4$ requires the independent completed mode--channel equation. Equal integers across these ledgers are compatibility checks, not one derivation or a probability-of-coincidence argument.

The three-generation result likewise belongs to its stated anomaly/CP class. The conditional $E_8$/Leech scaffold is downstream compatibility data and does not derive family number. These branch boundaries distinguish internal arithmetic rigidity from physical realization.

 The interface mode count $M=24$ is fixed on the joint $d_0=8$, $a=2$, SLD-QFI branch by $M=2a(d_0-a)$. Appendix Z, Theorem Z.12 then audits eight separately typed records—algebraic dimension, residual capacity, kissing-class matching, Golay recovery, Leech rootlessness, even-unimodular rank, modular weight, and minimal-branch compatibility—through explicit maps and declared branch intersections. Proposition Z.12.1a adds the arithmetic Niemeier self-counting identity $N_{\mathrm{EU}}(24)=24$ within its finite rank domain. The equal integer is therefore an exact cross-check where the maps commute, not evidence that any one record derives all the others. Appendix R's anomaly/CP theorem independently gives the minimal admissible family count and its pre-flavor realization; $D_4$ triality and the $E_8$/Leech scaffold are compatibility data. This separation makes each rigidity claim falsifiable at its own certificate while preserving the nonaccidental coherence of the completed joint branch.

This distinction resolves historical confusions where scientists have sought physical mechanisms for what are, in fact, logical necessities. The PU framework asserts that the "Why" of the first category is answered by logic, while the "What" and "How" of the second category are answered by physics, which itself emerges from optimizing the "Why."

**Remark P.9.1: Comparison with Alternative Approaches to Dimensional Emergence.** 

| Approach | Treatment of D | Selection Mechanism |
|----------|---------------|---------------------|
| Dynamical triangulation | Emerges from path integral | Requires fine-tuning of couplings |
| Causal set theory | Defined by volume scaling | Input parameter, not derived |
| Loop quantum gravity | Encoded in spin networks | Assumed, not selected |
| String/M-theory | D = 10 or 11 | Compactification not unique |
| PU framework | Derived: least feasible $D=4$ inside the faithful Bures tangent-shell contract | $24\le K(D)$, $K(3)=12$, regular $24$-cell, strict surplus-dimension cost |

The PU framework derives $D=4$ on a named finite branch. The minimal carrier and active-record gates give $(d_0,a,M)=(8,2,24)$. Definition Z.9a requires a response-preserving shell and charges every surplus response-null dimension; Theorem Z.10 excludes $D\le3$; and the regular $24$-cell realizes the branch in four. Thus $D=4$ is the unique least-feasible configuration without an adjustable continuous parameter in the dimensional selector.

## P.10 The Boundaries of Meaningful Inquiry

The ultimate implication of this framework is that it defines the very boundaries of what can be meaningfully discussed.

**The Limit of Meaningful Inquiry**
A universe devoid of predictive systems — and thus devoid of time, space, causality, and discrete information — lies beyond the reach of knowledge, description, or coherent conceptualization by any predictive system, including ourselves. Any attempt to describe such a universe requires an observer, which would contradict the very premise of its description. This constitutes an epistemic boundary. Therefore, all meaningful inquiry is necessarily restricted to the class of universes that support prediction.

## P.11 Temporal Engineering and the Ontology of Conscious Action

### P.11.1 The Dissolution of the Interaction Problem

The classical "interaction problem" posed by Cartesian dualism—how can an immaterial mind causally influence physical matter without violating conservation laws—has resisted solution for centuries. The PU framework dissolves rather than solves this problem through a fundamental reconceptualization: awareness is primary and irreducible (Section P.2). Physical reality, including spacetime itself, emerges from the predictive operations of this fundamental awareness.

Consciousness does not act on physical reality because physical reality is itself a manifestation of awareness's predictive activity. The question shifts from "How does mind affect matter?" to "How do complex patterns of awareness develop the capability to bias their own predictive processes?"

**Definition P.10.1 (Temporal Engineering).** Temporal engineering is the capability that emerges in high-complexity MPU aggregates ($C_{\mathrm{agg}} > C_{op}$) to modulate the local information processing rate $\tau(x,t)$ of the predictive substrate through controlled resource expenditure. This capability—Consciousness Complexity (CC)—represents not the emergence of consciousness itself (which is fundamental) but the emergence of consciousness's ability to influence its own predictive dynamics.

### P.11.2 Awareness as the Temporal Substrate

In the PU framework, awareness doesn't use time—awareness is the process whose operational rhythm we measure as time. Each MPU represents a minimal instance of awareness (the Minimal Awareness interpretive convention of Section 7.1.2), and its predict-verify-update cycle is both:

- The operational manifestation of awareness
- The fundamental tick of time itself

*Note:* While individual MPU cycles are discrete events, the continuum time variable used in the Appendix F description arises from the collective dynamics of the network through the conditional continuum-limit construction stated there. The 'tick' metaphor refers to operational cycles, not fundamental discreteness of spacetime.

When we speak of temporal engineering, we're describing awareness modulating its own operational rhythm to influence the patterns that emerge from its predictive activity through the stochastic adaptation dynamics characterized in Appendix D (Theorem D.5).

### P.11.3 The Emergence of Influence, Not Awareness

The critical distinction:

**Fundamental (always present):**
- Awareness itself (irreducible, primary)
- The predictive operation (awareness's basic mode)
- The 'Evolve' process (actualization of predictions)

**Emergent (develops through complexity):**
- Consciousness Complexity (CC): the capability to bias outcomes
- The context state ($\mathrm{context}_S$): organized predictive model
- The mapping ($\mathcal{M}$): translation from context to physical control

What emerges at $C_{\mathrm{agg}} > C_{op}$ is not consciousness but consciousness's reflexive capability—the ability to recognize and influence its own predictive processes. This is consciousness becoming aware of itself as the temporal substrate and developing the capability to modulate that substrate.

*Note:* The capability 'emerges' through complexity increase (POP/PCE optimization driving $C_{\mathrm{agg}} > C_{op}$), not temporal learning in the conventional sense. The optimization process (Appendix D, Theorem D.5) is stochastic evolution with an ergodic stationary regime and, in its low-noise detailed-balance subcase, stationary concentration near PCE-minimizing configurations, not experiential acquisition of skill.

### P.11.4 Frequency as the Language of Self-Modulation

When fundamental awareness, organized into complex aggregates, develops the ability to influence its own patterns, it does so through frequency modulation:

$$
\tau(x,t) = \tau_{\mathrm{medium}}\left[1 + \delta\tau_{\mathrm{CC}}(x,t)\right]
$$

*Terminological Note:* Terms like 'attention' and 'intention' are used illustratively to connect abstract mathematics to familiar experience. The framework does not require human-like phenomenology—any MPU aggregate with $C_{\mathrm{agg}} > C_{op}$ exhibits the operational capability (CC), regardless of associated qualia. These terms denote mathematical structures in the optimization dynamics, not necessary phenomenological states.

This modulation represents awareness exercising optimized control over its own operational tempo. The frequency decomposition corresponds to:

- **High frequencies:** Rapid modulation of processing rates creating electromagnetic fields (Appendix O, Definition O.1)
- **Low frequencies:** Sustained energy density contributions creating gravitational time dilation (Appendix L, Theorem L.3)

These are not metaphors—the actual electromagnetic and gravitational effects (Theorems L.2, L.3) emerge from controlled modulation of temporal processing rates, unified through the temporal wave framework (Appendix O, Remark O.4).

### P.11.5 The Thermodynamics of Awareness

Every act of temporal engineering requires energy not because consciousness needs energy to exist (it's fundamental) but because maintaining organized complexity capable of biasing outcomes requires resources:

$$
P_{\mathrm{agg}} = P_{\mathrm{baseline}} + P_{\mathrm{CC}}
$$

where:
- $P_{\mathrm{baseline}}$ maintains the aggregate's basic predictive operations
- $P_{\mathrm{CC}}$ is the additional cost of maintaining sufficient organization to bias outcomes

This energy cost appears in the stress-energy tensor not as the "energy of consciousness" but as the energy required to maintain complex organizational patterns within awareness. The complete accounting is provided in Appendix L (Theorem L.6), with gravitational feedback limitations analyzed in Appendix S.

### P.11.6 The Recursive Structure of Self-Aware Prediction

In developing CC, awareness doesn't just predict external patterns—it develops the capability to predict and influence its own predictive processes. This creates a recursive structure:

- **Level 0:** Fundamental awareness predicts (MPU cycles)
- **Level 1:** Complex awareness predicts its environment
- **Level 2:** Self-aware complexity predicts its own predictions
- **Level 3:** Self-modulating complexity influences its predictive processes

Consciousness Complexity emerges when awareness reaches Level 3—not becoming conscious (it always was) but becoming capable of biasing the outcomes of its own fundamental predictive operations within the endpoint-bias bound of Theorem 39, the exact-causality condition of Theorem 39c, the thermodynamic constraints of Appendix L, and the gravitational self-limitation of Appendix S.

### P.11.7 Why Physics Appears External

If awareness is fundamental and physics emerges from it, why does physical reality seem external and independent? Because:

1. **Regularity:** PCE drives the predictive network toward geometric regularity (Theorem 43)
2. **Consistency:** Thermodynamic constraints enforce consistent laws (Theorem 50)
3. **Limits:** Information bounds ($C_{\max}$, $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$) create apparent externality
4. **Scale:** Individual awareness (even human-level) is tiny compared to the cosmic predictive network

Physical laws are the consistent patterns that emerge from the collective predictive operations of all awareness in the network. They seem external because they represent the aggregate behavior of vastly more awareness than any individual aggregate contains.

### P.11.8 The Unity That Was Always There

The ultimate insight of temporal engineering is not that consciousness and time become unified, but that they were never separate. Both are aspects of awareness's fundamental predictive operation:

- **Time:** The measured rate of predictive cycles
- **Consciousness:** The irreducible awareness doing the predicting
- **Consciousness Complexity:** The emergent capability to bias predictions
- **Temporal Engineering:** CC exercising this capability through rate modulation

There is no hard problem of consciousness because consciousness isn't trying to emerge from matter—matter is emerging from consciousness's predictive operations. The only "problem" was assuming consciousness needed explanation in terms of physics, when physics needs explanation in terms of consciousness.

When we ask "How does consciousness influence reality?" we're asking the wrong question. The right question is: "How do complex organizations of fundamental awareness develop the capability to bias their own predictive operations?" The answer is temporal engineering—the capability to modulate the rate of the very predictions from which physical reality emerges, acquired through POP/PCE optimization (Theorem L.1) and constrained by fundamental physical limits (Theorems 39, L.6, L.7).

## P.12 The SPAP Origin of Time, Entropy, and Perspective

### P.12.1 Three Aspects of One Structure

**Theorem P.12.1 (Structural SPAP Ordering and Conditional Reset Branch).** Predict--Verify--Update supplies an internal operation order and distinguishes a predictor record from its target. Binary-label displacement is a conclusion only on a declared reachable-domain/fixed-ready-state architecture such as Definition J.1. For a sequence of registered classical resets, let $R_j$ contain every classical record retained and unchanged through reset $j$, including the information available from earlier resets. If every reset satisfies Definition 28, then
$$
\Delta S_{\mathrm{env}}
\ge k_B\sum_j H_{q_j}(P_j\mid R_j).
$$
No positive per-cycle or per-time lower bound follows without a registered reset count and a positive distribution-sensitive entropy bound. The predictor--target distinction is structural; identifying it with a particular homogeneous-space perspective variable requires the independent construction of Definition 25 and Theorem 25. ∎

### P.12.2 Separated Impossibilities and Conditional Bridges

**Theorem P.12.2 (Non-Equivalence of the Four Impossibility Claims).** The SPAP diagonal construction proves the stated impossibility of a universal predictor for the declared self-referential class. It does not, by itself, prove that time reversal is impossible, that future-directed records cannot be prepared, or that one system cannot instantiate another system's state or perspective. Those claims concern different mathematical structures and are not logically equivalent to SPAP.

The registered-reset branch supplies only
$$
\Delta S_{\mathrm{bath}}
\ge k_B\sum_jH_{q_j}(P_j\mid R_j),
$$
while the total entropy production of ideal Landauer-saturating resets can be zero. A physical arrow requires additional nonequilibrium, boundary-condition, and coarse-graining hypotheses. A memory-direction claim requires a specified record protocol and causal ordering. A perspectival nonidentity claim requires a subsystem-identification or no-isomorphism theorem. None is supplied by the Boolean diagonal argument. ∎

### P.12.3 Conditional Common-Origin Statement

**Definition P.12.1 (SPAP-Associated Data).** Let $\mathcal T_{\mathrm{op}}$ be the operation order of a specified Predict--Verify--Update protocol, let $\mathcal E_{\mathrm{reset}}$ be the entropy ledger of its registered resets, and let $\mathcal P_{\mathrm{id}}$ be an independently specified identification of predictor and target subsystems.

**Theorem P.12.3 (Conditional Coexistence, Not Mutual Reconstruction).** A protocol certificate may carry all three data sets $(\mathcal T_{\mathrm{op}},\mathcal E_{\mathrm{reset}},\mathcal P_{\mathrm{id}})$, but no one of them determines either of the others in general. Under a registered sequential-reset implementation,
$$
\Delta S_{\mathrm{bath}}
\ge k_B\sum_jH_{q_j}(P_j\mid R_j).
$$
The order identifies when the resets occur only after the reset implementation is supplied; the entropy ledger identifies neither a total temporal order nor a unique subsystem decomposition; and a subsystem decomposition supplies no positive heat or entropy-production floor without a law and implementation record. Any stronger bridge must be stated as an additional injective reconstruction or monotonicity hypothesis. ∎

### P.12.4 Summary

SPAP supplies a diagonal limitation and an internal operation order. A declared physical implementation may additionally supply registered reset thermodynamics and a predictor--target subsystem map. The three ledgers are compatible when jointly certified, but they are neither equivalent nor mutually reconstructible.

## P.13.1 Foundational Constants

### Theorem P.13.1 (Horizon Constant)

**Reference:** Theorem 15 (Section 5.2.2)

Assume a realization belongs to Theorem 15's class satisfying (O1)–(O3) and (FC). Thus its finite visited-context set $\mathcal S_{\mathrm{vis}}$ carries the binary response maps $r_m,r_p,r_v$ whose joint map

$$
r=(r_m,r_p,r_v):\mathcal S_{\mathrm{vis}}\longrightarrow\{0,1\}^3,
\qquad
r(s)=\bigl(\phi(s),p_{\mathrm{stored}}(s),c_{\mathrm{phase}}(s)\bigr),
$$

is surjective. Then $|\mathcal S_{\mathrm{vis}}|\ge8$. Theorem 15(2) attains equality in this realization class, so

$$
N_{\mathrm{vis}}^{\min}=8,
\qquad
K_0=\log_2N_{\mathrm{vis}}^{\min}=3.
$$

*Proof.* Since $r$ is a surjection between finite sets,

$$
|\mathcal S_{\mathrm{vis}}|
\ge
|\{0,1\}^3|
=8.
$$

The eight-state construction of Theorem 15(2) satisfies the same branch conditions, so the lower bound is attained. Taking the base-two logarithm proves the formula for $K_0$. Neither injectivity (O1) alone nor SPAP outside the stated (FC) realization class yields this cardinality bound. $\square$

**Epistemic Status:** Framework-derived on the declared (O1)–(O3), (FC) realization class.
















---

### Theorem P.13.2 (MPU Hilbert Space Dimension)

**Reference:** Theorem 23 (Section 7), Theorem Z.2 (Appendix Z, Section Z.3.3)

Assume the (O1)–(O3), (FC) realization class of Theorem 15; mutually perfectly distinguishable Hilbert representatives for its visited contexts; and Theorem Z.2's minimal-branch hypothesis that every admissible candidate with $d_0>8$ has an admissible eight-dimensional comparator in the same optimization class with the identical registered protocol-response family and identical non-support ledger entries, but strictly lower maintained-support cost. Then
$$
d_0=N_{\mathrm{vis}}^{\min}=2^{K_0}=8.
$$

*Proof.* Theorem 15 gives $N_{\mathrm{vis}}^{\min}=8$ on the assumed (O1)–(O3), (FC) class. Perfectly distinguishable quantum states have pairwise orthogonal nonzero supports. Choosing one nonzero vector from each of the eight supports gives eight pairwise orthogonal, hence linearly independent, vectors, so $d_0\ge8$. The admissible eight-state comparator in Theorem Z.2 has the same registered response and strictly lower maintained-support cost, so no candidate with $d_0>8$ minimizes the total PCE potential on the minimal branch. Thus $d_0\le8$, and therefore $d_0=8=N_{\mathrm{vis}}^{\min}=2^{K_0}$.

Three structural constraints determine $d_0 = 8$ on the minimal branch:

1. **Finite operational context count:** $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$ from the (FC) surjection onto the three binary context coordinates in Theorem 15's stated realization class.

2. **Hilbert distinguishability:** $d_0 \geq N_{\mathrm{vis}}^{\min}=8$ from Theorem 23 on the Hilbert-carrier branch.

3. **PCE minimality:** Under Theorem Z.2's registered same-response comparator and strict maintained-support cost, every $d_0>8$ representative is matched by a strictly cheaper eight-dimensional representative and is therefore excluded from the minimal branch.

Therefore the saturating minimal-branch value is $d_0 = 8$.

**Radon-Hurwitz coherence check.** Normed division algebras exist only in dimensions 1, 2, 4, 8 (real numbers, complex numbers, quaternions, octonions) [Hurwitz 1898]. The value $d_0 = 8$ therefore also coincides with the maximal normed-division-algebra dimension. This is a secondary algebraic coherence check, not an independent upper-bound proof inside PU.
**Structural Consistency Check (Theorems Z.1--Z.2).** Theorem Z.2's same-class comparator branch gives $d_0=8$, while Theorem Z.1's sharp-record, entropy-capacity, and no-surplus branch independently gives $a=2$. Hence $d_0=2a^2$ holds numerically on their conjunction. It is a consistency identity, not a second derivation from SPAP tensor structure and not a mutual-determination theorem. $\square$

**Epistemic Status:** Conditional framework theorem on the stated Theorem-15 Hilbert-carrier and Theorem-Z.2 minimality branch. The Radon--Hurwitz observation is only a secondary coherence check.

---

### Theorem P.13.3 (Conditional Registered-Reset Cost)

**Reference:** Theorem 31 (Section 7.3), Theorem J.1 (Appendix J)

The registered reachable binary quotient carries the structural log-cardinality
$$
\varepsilon_0=\ln2.
$$
For an actual cyclic, degenerate classical reset of record $P$ at temperature $T$, with every retained and unchanged side-information register included in $R$, conditional Landauer gives
$$
\varepsilon_{\mathrm{reset}}
:=\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}},
\qquad \varepsilon_{\mathrm{diss}}\ge0.
$$
Since $P$ is binary, $H_q(P\mid R)\le\ln2$. A physical lower bound of $\ln2$ follows only after verifying $H_q(P\mid R)=\ln2$; equality of the reset heat with $\ln2$ additionally requires $\varepsilon_{\mathrm{diss}}=0$. Retaining a copy of the reset label can reduce the conditional entropy, even to zero. Thus the structural log-cardinality and the physical heat ledger are distinct unless these branch hypotheses are discharged. ∎

### Theorem P.13.4 (Active Kernel Dimension)

**Reference:** Theorem Z.1 (Appendix Z, Section Z.2.3)

The dimension of the active kernel subspace is:
$$a = 2$$

*Proof.*

**Step 1 (Registered structural gate).** The active-kernel argument uses a registered reachable binary verification quotient with structural log-cardinality $\varepsilon_0=\ln2$. Theorem Z.1 additionally assumes the sharp match/mismatch record, entropy-capacity admissibility $\ln a\ge\varepsilon_0$, and its PPI/PCE no-surplus comparison class. These premises, not SPAP or conditional Landauer alone, supply the active-kernel selection. A physical reset and its heat ledger remain governed separately by Theorem 31.

**Step 2 (Shannon entropy identity).** The von Neumann entropy of a maximally mixed state on an $a$-dimensional Hilbert space is exactly:
$$S(\rho_{\text{uniform}}) = \ln a \text{ nats}$$

**Step 3 (Active-kernel gates).** Theorem Z.1 requires:
- $a\ge2$ for the sharp retained match/mismatch record,
- $\ln a\ge\varepsilon_0$ for structural entropy-capacity admissibility, and
- exclusion of response-null surplus alternatives in the registered comparison class.

Since $\varepsilon_0=\ln2$, the least admissible integer is $a=2$. The conclusion uses all three gates; it is not derived from physical reset heat. $\square$

**Epistemic Status:** Conditional branch theorem under Theorem Z.1's registered structural and no-surplus hypotheses.

---

### Definition P.13.1 (Structural Active/Inactive Partition)

The inactive subspace dimension and PCE-Attractor state are:
$$b = d_0 - a = 6$$
$$\rho_0 = \frac{1}{2}I_2 \oplus 0_6$$

For the specified maximally mixed active reference state,
$$
S(\rho_0|_{\mathcal A})=\ln2=\varepsilon_0.
$$
This is a numerical equality between a state entropy and the registered binary log-cardinality; it does not identify either with reset heat or entropy production.

---

## P.13.2 The Interface Mode Structure

### Theorem P.13.5 (QFI Mode Count)

**Reference:** Theorem Z.5 (Appendix Z, Section Z.7.2)

At the PCE-Attractor $\rho_0$, the number of QFI-active interface modes is:
$$M = 2ab = 24$$

The QFI metric on the interface subspace is isotropic.

*Proof.*

**Step 1 (Generator decomposition).** The $d_0^2 = 64$ generators of $\mathfrak{u}(8)$ decompose under the $a|b$ partition:

| Block | Dimension | QFI Status |
|-------|-----------|------------|
| AA | $a^2 = 4$ | Inactive: $(p_j - p_k)^2 = 0$ for $j,k \in A$ |
| BB | $b^2 = 36$ | Excluded: $p_j + p_k = 0$ for $j,k \in B$ (not in QFI sum) |
| AB + BA | $2ab = 24$ | Active: $p_j + p_k > 0$ and $(p_j - p_k)^2 > 0$ |

**Step 2 (QFI formula).** For $\rho = \sum_i p_i |i\rangle\langle i|$, the quantum Fisher information is [Braunstein & Caves 1994]: $$F_Q[\rho, G] = 2\sum_{i,j: p_i + p_j > 0} \frac{(p_i - p_j)^2}{p_i + p_j}|\langle i|G|j\rangle|^2$$

**Step 3 (Eigenvalues of $\rho_0$).**
- Active indices $A = \{1,2\}$: $p_j = 1/2$
- Inactive indices $B = \{3,...,8\}$: $p_k = 0$

**Step 4 (Interface contribution).** For $j \in A$, $k \in B$:
$$\frac{(p_j - p_k)^2}{p_j + p_k} = \frac{(1/2)^2}{1/2} = \frac{1}{2}$$

**Step 5 (Mode count).** There are $ab = 12$ complex pairs $(j,k)$ with $j \in A$, $k \in B$. Including both symmetric and antisymmetric real combinations:
$$M = 2 \times ab = 24$$

**Step 6 (Isotropy).** The isotropy group $H = S(U(a) \times U(b))$ acts on the interface subspace. The representation of $H$ on $\text{Hom}(\mathbb{C}^b, \mathbb{C}^a)$ is irreducible [Goodman & Wallach 2009]. By Schur's lemma, any $H$-invariant quadratic form on an irreducible representation is proportional to the identity. Since the QFI metric is $H$-invariant [Petz 1996], we have:
$$g_{\text{QFI}}|_{\text{interface}} = \lambda \cdot I_{24}$$

for some $\lambda > 0$. $\square$

---

### Theorem P.13.5a (Geometric Interpretation of Mode Count)

**Reference:** Theorem Z.6.3a (Appendix Z, Section Z.6.3)

The orbit of the PCE-Attractor state under unitary conjugation is:
$$
\mathcal{O}_{\rho_0} \cong U(d_0)/(U(a) \times U(b)) \cong \text{Gr}(a, d_0) = \text{Gr}(2,8)
$$

a compact Hermitian symmetric space with:
- Complex dimension: $\dim_{\mathbb{C}} = ab = 12$
- Real dimension: $\dim_{\mathbb{R}} = 2ab = 24 = M$

*Proof.* Write
$$
\rho_0 = \begin{pmatrix} \rho_a & 0 \\ 0 & 0_b \end{pmatrix},
$$
where the active block has rank $a$ and the inactive block has rank $b=d_0-a$. A unitary $U\in U(d_0)$ fixes $\rho_0$ under conjugation if and only if it preserves the active eigenspace and its orthogonal complement. Therefore the isotropy subgroup is exactly the block-diagonal subgroup
$$
U(a)\times U(b) \subset U(d_0).
$$
Hence the conjugation orbit is the homogeneous space
$$
\mathcal O_{\rho_0} \cong U(d_0)/(U(a)\times U(b)).
$$

The orbit is naturally identified with the set of rank-$a$ orthogonal projectors, equivalently the set of $a$-dimensional complex subspaces of $\mathbb C^{d_0}$. That set is the Grassmannian $\mathrm{Gr}(a,d_0)$, giving
$$
\mathcal O_{\rho_0} \cong \mathrm{Gr}(a,d_0).
$$
For $a=2$ and $d_0=8$, this is $\mathrm{Gr}(2,8)$.

Finally,
$$
\dim_{\mathbb R} U(n)=n^2,
$$
so
$$
\dim_{\mathbb R}\mathcal O_{\rho_0}
=
d_0^2-a^2-b^2
=
(a+b)^2-a^2-b^2
=
2ab.
$$
Since the Grassmannian is a complex manifold, its complex dimension is half of its real dimension:
$$
\dim_{\mathbb C}\mathrm{Gr}(a,d_0)=ab.
$$
Substituting $a=2$ and $b=6$ gives $\dim_{\mathbb C}=12$ and $\dim_{\mathbb R}=24=M$. $\square$

**Epistemic Status:** Standard mathematical fact about Grassmannians.

---

## P.13.3 Multi-Constraint Convergence

### Theorem P.13.6 (Convergence at M = 24)

The value $M = 24$ satisfies multiple independent mathematical constraints:

| Constraint | Statement | Verification |
|------------|-----------|--------------|
| C1 (Algebraic) | $M = 2ab$ with $a + b = d_0$, $a = 2$ | $2 \times 2 \times 6 = 24$ ✓ |
| C2 (Geometric) | Kissing number $K(4) = 24$ | [Musin 2008] ✓ |
| C3 (Coding) | Unique $[24, 12, 8]$ binary code exists | [Pless 1968] ✓ |
| C4 (Packing) | Optimal sphere packing in dimension 24 | [Cohn et al. 2017] ✓ |
| C5 (Unimodular) | Even unimodular lattices require $\dim \equiv 0 \pmod{8}$ | [Milnor & Husemoller 1973] ✓ |
| C6 (Modular) | $\eta^{24} = \Delta$ (weight-12 cusp form) | [Serre 1973] ✓ |

*Proof of individual constraints.*

**C1:** On the conjunction of Theorem P.13.4's active-kernel gates, Theorem Z.2's carrier comparator, and Theorem P.13.5's QFI tangent branch, $(a,b,M)=(2,6,24)$. The structural value $\varepsilon_0=\ln2$ is one input to the active-kernel capacity gate, not a physical entropy cause of $M=24$.

**C2:** The kissing number $K(D)$ is the maximum number of non-overlapping unit spheres that can simultaneously touch a central unit sphere in $D$ dimensions. $K(4)=24$ [Musin 2008]. For comparison: $K(3)=12$, $K(8)=240$, and standard bounds place $K(5)$ between $40$ and $44$ [Mittelmann & Vallentin 2010; Boyvalenkov et al. 2012].

**C3:** The extended binary Golay code $\mathcal{G}_{24}$ has parameters $[24, 12, 8]$ and is unique up to equivalence [Pless 1968].

**C4:** The Leech lattice $\Lambda_{24}$ achieves optimal sphere packing density in 24 dimensions [Cohn et al. 2017].

**C5:** Even unimodular lattices exist only in dimensions divisible by 8 [Milnor & Husemoller 1973].

**C6:** The Dedekind eta function satisfies $\eta(\tau)^{24} = \Delta(\tau)$, where $\Delta$ is the unique normalized weight-12 cusp form for $SL_2(\mathbb{Z})$ [Serre 1973]. $\square$

**Remark on Interpretation.** On the conjunction of Theorem Z.1's active-kernel branch and Theorem Z.2's carrier branch, $(a,b)=(2,6)$; Theorem Z.5 then gives $M=2ab=24$. The exponent $24$ in $\eta(\tau)^{24}=\Delta(\tau)$ is an independent modular-form fact. Numerical equality does not identify the QFI mode carrier with the modular-form construction or prove that PCE optimization and mathematical extremality are one mechanism; such an identification requires an explicit common-carrier bridge.

---

# Part II: From 24 Modes to the Leech Lattice

## P.13.4 Lattice Selection via PCE

The following statements isolate the exact lattice branch on which PCE has a finite, well-defined comparison problem. Theorem P.13.5 supplies a $24$-dimensional positive-definite QFI carrier with isotropic metric. It does not by itself supply a discrete lattice, an integral normalization, or a covolume condition. Those data and the lattice-sector restriction of the PCE potential are registered explicitly below.

### Selection Principle P.13.7 (Fixed-Normalization Even-Lattice Admissibility)

On the $M=24$ lattice branch, let
$$
V_{24}:=T_{\rho_0}\mathcal O_{\rho_0}
$$
with the positive-definite QFI metric of Theorem P.13.5. A lattice-carrier certificate consists of a full-rank discrete subgroup $\Lambda\subset V_{24}$ representing the retained vacuum-displacement labels and a positive length unit $\ell_{\mathrm{lat}}$ fixed before candidates are compared. Write
$$
\langle x,y\rangle_0:=\ell_{\mathrm{lat}}^{-2}g_{\mathrm{QFI}}(x,y),
\qquad
q_0(x):=\langle x,x\rangle_0.
$$
Candidate-dependent rescaling is not allowed. The even branch is the exact admissible class
$$
\mathcal A_{24}^{\mathrm{even}}
:=
\left\{
\Lambda\subset V_{24}:
\operatorname{rank}\Lambda=24,
\ q_0(v)\in2\mathbb Z\ \text{for every }v\in\Lambda
\right\}.
$$

*Argument.* If $\Lambda\in\mathcal A_{24}^{\mathrm{even}}$, then for every $v,w\in\Lambda$,
$$
2\langle v,w\rangle_0
=
q_0(v+w)-q_0(v)-q_0(w)
\in2\mathbb Z.
$$
Hence $\langle v,w\rangle_0\in\mathbb Z$, so the even-norm condition also proves integrality in the same fixed normalization. This is an exact admissibility test. Neither QFI isotropy nor Theorem E.2's real-valued capacity bound supplies the lattice-carrier certificate or the condition $q_0(\Lambda)\subset2\mathbb Z$. $\square$

**Epistemic Status:** Exact lattice criterion on the registered fixed-normalization carrier branch; the carrier and parity certificate are branch data.

---

### Selection Principle P.13.8 (Fixed-Metric Unimodularity Certificate)

For $\Lambda\in\mathcal A_{24}^{\mathrm{even}}$, define the dual with respect to the same fixed inner product by
$$
\Lambda^*
:=
\{x\in V_{24}:\langle x,v\rangle_0\in\mathbb Z\text{ for every }v\in\Lambda\}.
$$
Let $G_\Lambda=(\langle b_i,b_j\rangle_0)_{i,j=1}^{24}$ be the Gram matrix of any $\mathbb Z$-basis of $\Lambda$. The unimodular branch is
$$
\mathcal A_{24}^{\mathrm{EU}}
:=
\{\Lambda\in\mathcal A_{24}^{\mathrm{even}}:\det G_\Lambda=1\}.
$$

*Argument.* Evenness gives integrality by Selection Principle P.13.7, hence $\Lambda\subseteq\Lambda^*$. Standard lattice duality gives
$$
[\Lambda^*:\Lambda]=\det G_\Lambda
=
\operatorname{covol}_0(\Lambda)^2.
$$
Therefore
$$
\det G_\Lambda=1
\quad\Longleftrightarrow\quad
[\Lambda^*:\Lambda]=1
\quad\Longleftrightarrow\quad
\Lambda=\Lambda^*.
$$
Thus self-duality is checked by one determinant in the fixed metric; it is not inferred from storing $\Lambda$ and $\Lambda^*$ as independent data. $\square$

**Epistemic Status:** Established lattice algebra. Membership in $\mathcal A_{24}^{\mathrm{EU}}$ is the registered even-unimodular branch certificate.

---

### Selection Principle P.13.9 (Finite Niemeier Gaussian-Cost Comparison)

Let
$$
\mathfrak N_{24}
:=
\mathcal A_{24}^{\mathrm{EU}}/\!\cong
$$
be the set of isometry classes in the fixed positive-definite normalization. By the Niemeier classification, $\mathfrak N_{24}$ has exactly $24$ elements. Fix a registered $t>0$, put
$$
\tau:=it,
\qquad
u:=e^{2\pi i\tau}=e^{-2\pi t}\in(0,1),
$$
and define
$$
\Theta_\Lambda(\tau)
:=
\sum_{v\in\Lambda}e^{\pi i\tau q_0(v)}
=
\sum_{v\in\Lambda}u^{q_0(v)/2}.
$$
The series converges absolutely. A Gaussian lattice-cost certificate is the exact restriction
$$
V_{\mathrm{lat}}([\Lambda])
=
V_0+\kappa_{\mathrm{lat}}\bigl(\Theta_\Lambda(it)-1\bigr),
\qquad
\kappa_{\mathrm{lat}}>0,
$$
of the descended PCE potential to $\mathfrak N_{24}$, where $V_0$ is class-independent and the equality includes every candidate-dependent lattice-sector term of Definition D.1. This is the Gaussian completely monotone pair cost appearing as a special case of Corollary R.4.2b.1.

*Argument.* For a positive-definite even unimodular rank-$24$ lattice,
$$
\Theta_\Lambda(\tau)
=
E_4(\tau)^3+
\bigl(N_{\mathrm{root}}(\Lambda)-720\bigr)\Delta(\tau),
$$
where
$$
N_{\mathrm{root}}(\Lambda)
:=
\#\{v\in\Lambda:q_0(v)=2\}.
$$
Indeed, the theta series is a weight-$12$ modular form, the weight-$12$ space is spanned by $E_4^3$ and $\Delta$, and comparison of the coefficient of $u$ gives the displayed coefficient. Since
$$
\Delta(it)
=
u\prod_{m=1}^{\infty}(1-u^m)^{24}
>0,
$$
the sign of every difference of Gaussian lattice costs is exactly the sign of the corresponding difference of root counts. Thus the ordering is independent of the registered values of $t>0$ and $\kappa_{\mathrm{lat}}>0$; no parameter is tuned to obtain the minimizer. $\square$

**Epistemic Status:** Exact conditional PCE comparison on a declared finite class and Gaussian pair-cost branch. QFI isotropy alone does not supply the lattice-carrier or restricted-potential certificate.

---

### Theorem P.13.10 (Unique Leech Minimizer on the Certified Niemeier Gaussian Branch)

**Reference:** Theorems R.4.6 and R.4.10 and Corollary R.4.2b.1 (Appendix R, Sections R.4.2.1.4, R.4.2.3, and R.4.2.4)

Assume the fixed-normalization lattice-carrier and evenness certificate of Selection Principle P.13.7, the unimodularity certificate of Selection Principle P.13.8, and the Gaussian lattice-cost certificate of Selection Principle P.13.9. Then the unique PCE-minimizing lattice is the Leech lattice $\Lambda_{24}$, up to isometry.

*Proof.*

**Step 1 (Finite comparison class).** The candidates are exactly the $24$ isometry classes of positive-definite even unimodular lattices of rank $24$ classified by Niemeier [Niemeier 1973].

**Step 2 (Root counts).** Exactly one class has no norm-$2$ vectors: the Leech lattice $\Lambda_{24}$ [Leech 1967; Conway 1969a]. Thus
$$
N_{\mathrm{root}}(\Lambda_{24})=0.
$$
Each of the other $23$ classes has a nonempty root system; in fact its root count is at least $48$.

**Step 3 (Strict PCE comparison).** Selection Principle P.13.9 gives, for every $[\Lambda]\ne[\Lambda_{24}]$,
$$
\begin{aligned}
V_{\mathrm{lat}}([\Lambda])-V_{\mathrm{lat}}([\Lambda_{24}])
&=
\kappa_{\mathrm{lat}}
\bigl(\Theta_\Lambda(it)-\Theta_{\Lambda_{24}}(it)\bigr)\\
&=
\kappa_{\mathrm{lat}}N_{\mathrm{root}}(\Lambda)\Delta(it)
>0.
\end{aligned}
$$
Therefore
$$
\operatorname*{argmin}_{[\Lambda]\in\mathfrak N_{24}}
V_{\mathrm{lat}}([\Lambda])
=
\{[\Lambda_{24}]\}.
$$
Rootlessness is an output of the registered finite comparison, not an admissibility assumption. The selected lattice is even, unimodular, rootless, positive-definite, and rank $24$. $\square$

**Epistemic Status:** Conditional framework-to-mathematics selection theorem. The registered carrier and Gaussian restriction of the PCE potential define the branch; modular-form and Niemeier classification theorems prove its unique minimizer.

---

### Proposition P.13.11 (Leech Lattice Properties)

The Leech lattice $\Lambda_{24}$ has:

| Property | Value | Reference |
|----------|-------|-----------|
| Dimension | 24 | |
| Minimum norm | 4 (rootless) | [Leech 1967] |
| Kissing number | 196,560 | [Conway & Sloane 1999] |
| Automorphism group | $\text{Co}_0$ | [Conway & Sloane 1999] |
| $\lvert\text{Co}_0\rvert$ | $2^{22} \cdot 3^9 \cdot 5^4 \cdot 7^2 \cdot 11 \cdot 13 \cdot 23$ | |
| Packing density | Optimal in 24D | [Cohn et al. 2017] |

The center of $\text{Co}_0$ is $\{\pm I_{24}\}$, and $\text{Co}_1 = \text{Co}_0/\{\pm I\}$ is one of the 26 sporadic simple groups.

**Epistemic Status:** Established mathematical facts.

---

## P.13.5 The Golay Code Structure

### Theorem P.13.12 (Golay Code Selection on the Predictive-Recovery MacWilliams Branch)

**Reference:** Definition Z.13b.0 and Theorem Z.13b (Appendix Z, Section Z.13)

On the predictive-recovery MacWilliams branch — in which the $M=24$ QFI interface modes split into $k=12$ information-carrying modes and $n-k=12$ redundancy modes by Theorem Z.13b.0a — coding theory uniquely selects the extended binary Golay code $\mathcal{G}_{24}$ with parameters $[24,12,8]$. The block length $n=M=24$ and the self-dual rate $R=k/n=1/2$ fix the input data to the Griesmer bound, after which the Golay code is the unique $[24,12,d_{\max}]$ binary linear code up to equivalence.

*Proof.*

**Step 1 (Block length).** The interface mode count determines block length: $n = M = 24$.

**Step 2 (Predictive-recovery MacWilliams branch).** The PCE potential for an $[n,k,d]$ code balances:
- Operational cost: $V_{\text{op}} \propto (n - k)$ (parity overhead)
- Error protection: $V_{\text{error}}(d)$ (decreasing in $d$)
- Information capacity: $V_{\text{benefit}} \propto k$

On the predictive-recovery MacWilliams branch, Theorem Z.13b.0a fixes $k=n-k$ through the declared MacWilliams-dual asymmetry penalty, hence $k=12$. This rate is not derived from a parity--entropy equality. Theorem P.8.9a.2 gives only a conditional arithmetic identity after both $R=1/2$ and the residual budget $C_{\max}^*=2\ln2$ have been independently registered; it cannot be used to derive either premise. With $(n,k)=(24,12)$ independently fixed, Step 3 may optimize distance.

**Step 3 (Distance optimization).** For $(n, k) = (24, 12)$, the Griesmer bound [Griesmer 1960] gives:
$$n \geq \sum_{i=0}^{k-1} \lceil d/2^i \rceil$$

For $d = 8$: $\sum_{i=0}^{11} \lceil 8/2^i \rceil = 8 + 4 + 2 + 1 + 1 + \cdots + 1 = 23$. Achievable.
For $d = 9$: $\sum_{i=0}^{11} \lceil 9/2^i \rceil \geq 27$. Not achievable with $n = 24$.

Maximum distance is $d = 8$.

**Step 4 (Uniqueness).** The extended binary Golay code is the unique binary linear code achieving $[24, 12, 8]$ up to equivalence [Pless 1968]. $\square$

**Epistemic Status:** Framework (PCE optimization) + Mathematics (Griesmer bound, Golay uniqueness).

---

### Theorem P.13.13 (Conditional Golay--Leech Bridge)

**Reference:** Lemma R.4.5 and Proposition R.4.2a (Appendix R)

The binary Golay code and the Leech lattice are connected only on a registered gluing datum consisting of the finite-quadratic-module isometry, maximal totally isotropic subgroup, glue representatives, and coset-minimum ledger of Lemma R.4.5. If Equation (R.4.2a.1) is additionally certified, the marked Hamming distance condition transfers to minimum lattice norm $4$.

*Proof.* The conditional lattice identification is Lemma R.4.5. Equation (R.4.2a.1) is exactly the extra Hamming-to-coset-minimum compatibility statement. Code weight $8$ by itself does not exclude norm-$2$ vectors in an unspecified glue construction. ∎

**Epistemic Status:** Conditional mathematical bridge; the existence of the marked datum is a separate certificate, not a consequence of code selection.





---

# Part III: Vertex Operator Algebras and the Precision Cost Principle

## P.13.6 VOA Background

The Vertex Operator Algebra (VOA) framework provides the natural mathematical language for vacuum structure on the exact-scale conformal / chiral 24-boson branch. The identification is established through a chain of propositions below, each of which imports specific branch assumptions from Appendix U (exact-scale family) and Theorem P.13.5 (mode-count to chiral-boson assignment). The final identification with the Moonshine module $V^\natural$ uses these branch assumptions together with the established mathematical classification theorems of Frenkel-Lepowsky-Meurman and Dong-Griess-Lam.

### Proposition P.13.6.1 (Virial Stationarity and the Exact-Scale Conformal Branch)

The PCE-Attractor $\rho_0$ satisfies the first-variation virial stationarity identity supplied by Theorem U.8a. Exact dilatation symmetry, and hence the conformal/VOA construction of the propositions below, holds only on the exact-scale conformal branch in which the PCE continuum limit admits a genuine smooth family of exact critical points generated by scaling (Theorem U.9), not merely the first-variation virial identity.

*Proof.*

**Step 1 (Fixed point property).** By Definition 15a, the PCE-Attractor is the unique minimum of the PCE potential $V(\rho)$. At this minimum:
$$\nabla V|_{\rho_0} = 0.$$

**Step 2 (Scale-invariant ingredients in the PCE potential).** The PCE potential $V = V_{\text{op}} + V_{\text{prop}} - V_{\text{benefit}}$ (Definition D.1) is constructed from:
- Quantum Fisher Information (scale-invariant metric on state space)
- von Neumann entropy (scale-invariant functional)
- Trace operations (scale-independent)

None of these functional ingredients depend on an external length scale.

**Step 3 (Virial stationarity, not scale invariance).** Theorem U.8a supplies the first-variation virial identity
$$
\left.\frac{d}{d\rho}S_{\rm cont}[\phi^*_\rho]\right|_{\rho=1}=0,
$$
for the rescaled family $\phi^*_\rho(x) = \phi^*(\rho x)$. This is a stationarity statement along the rescaling family at $\rho = 1$, not invariance of the action under rescaling. By Remark U.8b, first-variation virial stationarity does **not** imply a Hessian zero mode along dilations. By Theorem U.8c, the pure-coordinate dilatation tangent in the Definition U.4 continuum action has strictly negative Hessian quadratic form and is not a zero mode, so the action strictly decreases under pure-coordinate rescaling at second order; the theorem does not assert that the tangent is a Hessian eigenvector.

**Step 4 (Exact-scale branch hypothesis).** Genuine dilatation symmetry in the sense required for a conformal/VOA construction is an additional hypothesis: the existence of a smooth one-parameter family of exact critical points $\rho \mapsto \phi_\rho$ with tangent $\partial \phi_\rho / \partial \ln \rho|_{\rho = 1} = x^\mu \partial_\mu \phi^*$ (Theorem U.9). The exact-scale conformal branch of this proposition assumes such a family exists for the PCE continuum limit. On this branch, Theorem U.9 gives $H \eta_D = 0$ and the continuum action admits a genuine one-parameter dilatation symmetry along its critical locus; the later propositions then construct the CFT/VOA structure from this symmetry. $\square$

---

### Proposition P.13.6.2 (Conformal Structure on the Exact-Scale Two-Dimensional Boundary Branch)

Assume a two-dimensional local unitary theory with Poincaré invariance, a discrete spectrum, a conserved stress tensor whose virial current is improvable, and a chiral state-field correspondence satisfying the VOA vacuum, locality, translation, and grading axioms. On this branch, the vacuum chiral algebra is a vertex operator algebra.

*Proof.*

**Step 1 (Exact-scale branch input).** Proposition P.13.6.1 supplies an exact dilation family but does not alone imply a traceless stress tensor. The present proposition separately assumes a conserved stress tensor with improvable virial current; after improvement, $T^\mu_\mu=0$.

**Step 2 (Two-dimensional boundary branch).** By Theorem 47 (Section 11.3), the conformal boundary of the emergent $D = 4$ spacetime has dimension $D - 1 = 3$. The two-dimensional boundary branch assumes that the relevant CFT lives on a two-dimensional chiral slice: the worldsheet swept by string-like excitations, or equivalently, the Riemann surface on which modular transformations act. The 24 interface modes (Theorem P.13.5) provide the target-space degrees of freedom for this 2D structure. The identification of the QFI interface modes with the 2D chiral target-space coordinates is the content of this branch.

**Step 3 (Enhancement to conformal symmetry).** Under the proposition's locality, unitarity, Poincaré, discrete-spectrum, and stress-tensor improvement hypotheses, two-dimensional scale invariance enhances to conformal invariance. The Virasoro algebra, with generators $\{L_n\}_{n \in \mathbb{Z}}$ satisfying $[L_m, L_n] = (m-n)L_{m+n} + \frac{c}{12}(m^3 - m)\delta_{m+n,0}$, emerges as the algebra of local conformal transformations [Polchinski 1988].

**Step 4 (Registered chiral algebra).** The assumed chiral state-field correspondence obeys the VOA axioms, so its state space is a VOA. This conclusion is not inferred from dilation symmetry alone. $\square$

---

### Proposition P.13.6.3 (Central Charge on the Chiral 24-Boson Branch)

On the chiral 24-boson branch, in which each of the $M = 24$ QFI-active interface modes is realized as an independent chiral bosonic degree of freedom in the effective 2D theory of Proposition P.13.6.2, the central charge of the PCE-optimal CFT is:
$$c = M = 24.$$

*Proof.*

**Step 1 (Physical interpretation).** In two-dimensional CFT, the central charge $c$ serves as a measure of degrees of freedom along renormalization-group flow (the $c$-theorem) [Zamolodchikov 1986].

**Step 2 (Mode count).** The PCE-Attractor has $M = 24$ QFI-active interface modes (Theorem P.13.5).

**Step 3 (Chiral-boson assignment branch).** On the chiral 24-boson branch of this proposition, each QFI-active interface mode is realized as an independent chiral bosonic degree of freedom in the effective 2D theory, contributing $c = 1$ to the total central charge. The assignment "each QFI mode $\mapsto$ one $c = 1$ chiral boson" is the branch rule; the mode count $M = 24$ is theorem-level (Theorem P.13.5).

**Step 4 (Identification).** On this branch, the CFT central charge equals the mode count:
$$c = M \times 1 = 24. \quad \square$$



**Remark P.13.6.3.1 (Branch Dependence of the Scale-to-VOA Chain).** The VOA endpoint $c = 24$ depends on three branch assumptions chained through Propositions P.13.6.1–P.13.6.3:
1. The exact-scale conformal branch (Proposition P.13.6.1): the PCE continuum limit admits a smooth one-parameter family of exact critical points generated by dilations, in the sense of Theorem U.9. Appendix U shows that this is strictly stronger than the virial stationarity supplied by Theorem U.8a; in particular, Theorem U.8c shows that the pure-coordinate dilatation direction of the Definition U.4 continuum action has strictly negative Hessian quadratic form and is not in the Hessian kernel, so the branch hypothesis is nontrivial. Theorem U.8c does not assert that this direction is a Hessian eigenvector.
2. The two-dimensional boundary branch (Proposition P.13.6.2): the relevant CFT lives on a 2D chiral slice of the conformal boundary, with the 24 QFI interface modes identified with the target-space coordinates of that slice.
3. The chiral 24-boson branch (Proposition P.13.6.3): each QFI-active interface mode is realized as an independent chiral bosonic degree of freedom, each contributing $c = 1$.

These three branches establish the conditional $c=24$ chiral-VOA setting. Selection of a holomorphic candidate additionally requires the admissible-candidate and cost-comparison hypotheses of Proposition P.13.6.4; scalar modular invariance requires the torus and modular-consistency hypotheses of Proposition P.13.6.5; and identification with $V^\natural$ requires the independent Leech, weight-one, and orbifold hypotheses of Theorem P.13.27. Failure of any required hypothesis terminates the corresponding downstream inference.

---

### Proposition P.13.6.4 (Conditional PCE Comparison of Chiral and Full Realizations)

Assume the branches of Propositions P.13.6.1–P.13.6.3 and suppose that the admissible class contains a holomorphic chiral realization $V$ and a full-CFT realization $W$ satisfying
$$
V_{\mathrm{benefit}}(V)=V_{\mathrm{benefit}}(W),
\qquad
V_{\mathrm{prop}}(V)=V_{\mathrm{prop}}(W),
\qquad
V_{\mathrm{op}}(V)<V_{\mathrm{op}}(W).
$$
Then PCE selects $V$ over $W$ within this two-candidate comparison.

*Proof.* With the PCE potential
$$
V_{\mathrm{PCE}}=V_{\mathrm{op}}+V_{\mathrm{prop}}-V_{\mathrm{benefit}},
$$
the two assumed equalities and strict inequality give
$$
V_{\mathrm{PCE}}(V)-V_{\mathrm{PCE}}(W)
=
V_{\mathrm{op}}(V)-V_{\mathrm{op}}(W)<0.
$$
Therefore $V$ has the smaller PCE potential among the two candidates. The proposition does not assert a universal factor-of-two relation between full and chiral CFT data. ∎

---

### Proposition P.13.6.5 (Conditional Modular Consistency)

Assume that the effective two-dimensional theory is defined on a torus with modulus $\tau\in\mathbb H$, that physically equivalent descriptions are identified under the mapping-class action of $SL_2(\mathbb Z)$, and that its partition function is a scalar function on the resulting moduli space. Then
$$
Z(\gamma\tau)=Z(\tau)
\qquad
\text{for every }\gamma\in SL_2(\mathbb Z).
$$
For a VOA character, the same scalar conclusion requires a rational, $C_2$-cofinite, self-dual branch on which the one-dimensional Zhu modular representation has trivial multiplier.

*Proof.* The first three hypotheses say precisely that $Z$ descends from $\mathbb H$ to the quotient $\mathbb H/SL_2(\mathbb Z)$. Hence it is constant on every group orbit, which is the displayed invariance. For a rational, $C_2$-cofinite VOA, Zhu's modular-invariance theorem [Zhu 1996] gives a finite-dimensional representation of $SL_2(\mathbb Z)$ on the span of irreducible characters. Self-duality makes this representation one-dimensional; the additional trivial-multiplier hypothesis makes its character invariant rather than merely covariant by a phase. No map from the flag perspective space to torus moduli follows without the torus and mapping-class hypotheses stated above. ∎

---

### Corollary P.13.6.6 (Conditional $c=24$ VOA, Candidate, and Modular Conclusions)

Assume the exact-scale, two-dimensional-boundary, and chiral-$24$-boson hypotheses of Propositions P.13.6.1–P.13.6.3. Then the branch carries a chiral VOA with $c=24$. If its admissible class also contains candidates $V$ and $W$ satisfying
$$
V_{\mathrm{benefit}}(V)=V_{\mathrm{benefit}}(W),
\qquad
V_{\mathrm{prop}}(V)=V_{\mathrm{prop}}(W),
\qquad
V_{\mathrm{op}}(V)<V_{\mathrm{op}}(W),
$$
where $V$ is holomorphic and $W$ is a full-CFT realization, Proposition P.13.6.4 selects $V$ within that two-candidate comparison. If the effective theory is also defined on a torus, identifies descriptions under $SL_2(\mathbb Z)$, and has a scalar partition function, Proposition P.13.6.5 gives scalar modular invariance. For a VOA character, the latter conclusion additionally requires the rational, $C_2$-cofinite, self-dual, trivial-multiplier branch. These conclusions do not identify the selected VOA with $V^\natural$ without the independent hypotheses of Theorem P.13.27. ∎

---

### Supporting Structures

**Graded Excitation Spectrum.** The Leech lattice provides a discrete shell structure with squared norms $|v|^2\in\{0,4,6,8,\ldots\}$ (Theorem Z.8c, Appendix Z). Each shell has a definite lattice weight, equal to its squared norm divided by $2$. The lattice supplies the dimensionless norm gap $|v|_{\min}=2$. It becomes the physical $\Delta_{gap}=2\mu_0^{alg}$ only on $\mathfrak B_{mass}$ with canonical norm--information calibration $\gamma=1$. The retired glueball branch of Theorem Z.8h does not identify these shells with physical $J^{PC}$ states.

 This graded structure with gap matches the VOA axiom $V = \bigoplus_{n \geq 0} V_n$ with $V_0 = \mathbb{C}|0\rangle$ and finite-dimensional weight spaces.

**The $J$-character.** For a strongly rational holomorphic $c=24$ VOA with $V_1=0$, modularity fixes the graded character
$$
\chi_V(\tau)=J(\tau)=j(\tau)-744=q^{-1}+196884q+21493760q^2+\cdots.
$$
Equality of graded characters does not determine the vertex-operator products or the VOA isomorphism class. Identifying $V$ with $V^\natural$ requires the additional Griess-algebra/framed-orbifold hypotheses of Theorems P.13.16 and P.13.27.

---

### Theorem P.13.14 (Lattice VOA Construction)

**Reference:** [Borcherds 1986; Frenkel, Lepowsky & Meurman 1988; Dong 1993]

For an even lattice $\Lambda$, the space $V_\Lambda = \mathcal{F} \otimes \mathbb{C}_\varepsilon[\Lambda]$ carries a VOA structure with central charge $c = \text{rank}(\Lambda)$.

**Corollary.** The Leech lattice VOA $V_{\Lambda_{24}}$ has $c = 24$. The weight-one space has dimension:
$$\dim(V_{\Lambda_{24}})_1 = 24$$

coming entirely from the Heisenberg currents $\alpha^i_{-1}|0\rangle$ (one per lattice dimension), since the Leech lattice is rootless (no norm-2 vectors).

**Epistemic Status:** Established VOA theory.

---

### Theorem P.13.15 (Holomorphic c = 24 VOAs)

**Reference:** [Schellekens 1993; van Ekeren et al. 2020]

Holomorphic (self-dual) VOAs with central charge $c = 24$ have been extensively studied:

1. Schellekens [Schellekens 1993] classified the possible weight-one Lie algebra structures, finding 71 candidates.

2. For the $70$ cases with nonzero weight-one Lie algebra, the strongly rational holomorphic $c=24$ classification is established and the VOA is determined by its weight-one Lie algebra [van Ekeren et al. 2020].

3. The remaining $V_1=0$ character case is not identified from the character alone; the Moonshine module is selected here only after the additional Griess/framed-orbifold data stated below.

**Epistemic Status:** Established for the $70$ nonzero-$V_1$ strongly rational holomorphic cases; the bare $V_1=0$ character does not by itself prove Moonshine-module uniqueness.

---

### Theorem P.13.16 (Moonshine Module Characterization)

**Reference:** [Frenkel, Lepowsky & Meurman 1988; Dong, Griess & Lam 2007]

Among holomorphic $c = 24$ VOAs satisfying $C_2$-cofiniteness and CFT-type grading:

1. If $V$ has $\dim(V_1) = 0$ and $V_2$ is isomorphic to the Griess algebra, then $V \cong V^\natural$.

2. The uniqueness was conjectured by FLM [Frenkel, Lepowsky & Meurman 1988]. Dong, Griess & Lam [Dong, Griess & Lam 2007] proved that the Moonshine module is uniquely characterized among such VOAs by the conditions $\dim(V_1) = 0$ together with the Griess algebra structure on $V_2$.

**Epistemic Status:** Established mathematical theorem under the stated hypotheses (including Griess algebra condition).

---

### Theorem P.13.17 (Moonshine Module Character)

**Reference:** [Frenkel, Lepowsky & Meurman 1988]

The graded character of the Moonshine module is:
$$\chi_{V^\natural}(\tau) = J(\tau) = j(\tau) - 744 = q^{-1} + 196884q + 21493760q^2 + \cdots$$

where $j(\tau)$ is the modular $j$-invariant and $q = e^{2\pi i \tau}$.

**Epistemic Status:** Established result.

---

# Part IV: PCE Selection of the Moonshine Module

## P.13.7 The Precision Cost Principle

### Theorem P.13.18 (Conditional Precision-Dependent Symmetry Cost)

Let $K$ be a compact $m$-dimensional control region in a Lie group $G$, equipped with a smooth Riemannian metric. Assume that a physical controller stores one of $N_K(\delta)$ equiprobable $\delta$-resolution labels, resets that label once per control cycle, has no retained side information, and incurs a registered operational cost $c_0>0$ per nat. Then
$$
V_{\mathrm{op}}(K;\delta)
=
c_0m\ln(1/\delta)+O(1)
$$
as $\delta\downarrow0$.

*Proof.* Standard volume comparison on a compact smooth $m$-manifold gives positive constants $c_-,c_+$ such that
$$
c_-\delta^{-m}\le N_K(\delta)\le c_+\delta^{-m}
$$
for all sufficiently small $\delta$. Hence
$$
\ln N_K(\delta)=m\ln(1/\delta)+O(1).
$$
The equiprobable label has entropy $\ln N_K(\delta)$ nats. Under the declared reset and per-nat cost model,
$$
V_{\mathrm{op}}(K;\delta)
=
c_0\ln N_K(\delta)
=
c_0m\ln(1/\delta)+O(1).
$$
Without the coding and reset hypotheses, the covering-number identity alone is not a physical cost equality. ∎

---

### Definition P.13.2 (Precision-Independent Effective Operational Symmetry-Family Cost)

For a symmetry group $G$ whose full action family must be represented by MPUs through a finite-precision control specification at resolution $\delta>0$, let $V_{\text{op}}(G;\delta)$ denote the operational cost required to maintain that representation at precision $\delta$ (Theorem P.13.18). The precision-independent effective symmetry cost is defined by
$$
V_{eff}^{sym}(G) := \lim_{\delta \to 0} V_{\text{op}}(G;\delta),
$$
when the limit exists in $[0,\infty]$.

Operational predictions are expressed in terms of configurations sampled from the relevant stationary regime of the dynamics (Theorem D.5, Appendix D); in low-noise detailed-balance regimes this stationary measure is concentrated near the low-potential sector. When a full symmetry action family must be instantiated uniformly along the operational refinement $\delta\to 0$, it is compatible with a resolution-independent PU description only if $V_{eff}^{sym}(G) < \infty$; if $V_{eff}^{sym}(G) = \infty$, the action family cannot be implemented as an exact uniformly refinable operational symmetry (though it may still appear as an effective symmetry at finite $\delta$).

### Theorem P.13.19 (Conditional Operational Symmetry-Family Penalty)

Let $K$ be a compact $m$-dimensional control region in a Lie group. Assume that, at every sufficiently small resolution $\delta$, a controller stores one of $N_K(\delta)$ equiprobable labels, resets that label once per control cycle, retains no side information, and incurs registered operational cost $c_0>0$ per nat. Then
$$
V_{eff}^{sym}(K):=\lim_{\delta\downarrow0}V_{\mathrm{op}}(K;\delta)
=+\infty
\qquad\text{if }m>0.
$$
For a finite group $G$, under the analogous equiprobable-label/reset model,
$$
V_{eff}^{sym}(G)=c_0\ln|G|<\infty.
$$

*Proof.* Effective Theorem P.13.18 gives
$$
V_{\mathrm{op}}(K;\delta)=c_0m\ln(1/\delta)+O(1).
$$
For $m>0$ and $c_0>0$, the right-hand side tends to $+\infty$. If $G$ is finite, then for resolutions below the minimum separation of its finitely many control labels, $N_G(\delta)=|G|$. The equiprobable label has entropy $\ln|G|$, so the declared reset model charges $c_0\ln|G|$, independently of further refinement. ∎


### Corollary P.13.19a (Conditional $U(1)^{24}$ Controller Cost)

If the full $U(1)^{24}$ action is implemented by the equiprobable-label, once-per-cycle reset, no-side-information, positive-per-nat controller architecture of Theorem P.13.19 at every resolution $\delta$, then
$$
V_{\mathrm{eff}}^{\mathrm{sym}}(U(1)^{24})=+\infty.
$$

*Proof.* Under those hypotheses the control region has positive dimension $24$, so Theorem P.13.19 applies. ∎

### Corollary P.13.19b (Continuous Symmetry on the Registered Uniform-Controller Branch)

Assume the full action family of a positive-dimensional compact symmetry region must, at every refinement scale $\delta$, be represented by one of $N_K(\delta)$ equiprobable stored labels, reset once per cycle with no retained side information and charged $c_0>0$ per nat. Then Theorem P.13.19 gives
$$
V_{\mathrm{eff}}^{\mathrm{sym}}(K)=+\infty,
$$
so that particular uniformly refinable controller architecture cannot realize the exact action at finite asymptotic cost. This does not exclude exact continuous symmetry on branches with relational, gauge-redundant, analog, nonuniform, side-information-assisted, or otherwise differently encoded realizations.

For the separately registered electromagnetic phase branch, Appendix Q proves that
$$
G_L=\{e^{iN\ln2}:N\in\mathbb Z\}
$$
is dense in $U(1)$. Hence its closure reproduces $U(1)$ at finite phase tolerance. Density supplies one effective-closure realization; it does not prove that every physical $U(1)$ must arise this way.

*Proof.* The first statement is exactly Theorem P.13.19 with its hypotheses retained. The density statement is Appendix Q. Neither theorem classifies controller architectures outside its stated domain. ∎

---

## P.13.8 The Canonical Orbifold Construction

### Theorem P.13.20 (Canonical (-1) Involution)

The map $(-1): \Lambda_{24} \to \Lambda_{24}$ given by $v \mapsto -v$ is:
1. An automorphism of $\Lambda_{24}$
2. Central in $\text{Aut}(\Lambda_{24}) = \text{Co}_0$
3. Of order 2

*Proof.* Because $\Lambda_{24}$ is an additive subgroup of its real span, $v\in\Lambda_{24}$ implies $-v\in\Lambda_{24}$. Thus $-I$ maps the lattice to itself, and its inverse is itself. For all $v,w\in\Lambda_{24}$,
$$
\langle-v,-w\rangle=\langle v,w\rangle,
$$
so $-I$ is a lattice isometry and hence an element of $\operatorname{Aut}(\Lambda_{24})$.

For every $h\in\operatorname{Aut}(\Lambda_{24})$ and $v\in\Lambda_{24}$, linearity gives
$$
(-I)h(v)=-h(v)=h(-v)=h(-I)(v),
$$
so $-I$ is central. Finally,
$$
(-I)^2=I.
$$
The Leech lattice contains nonzero vectors, so $-I\ne I$; consequently its order is exactly two. ∎

**Proposition P.13.20a (Canonicity of (-1) for the Leech Lattice).** For the Leech lattice $\Lambda_{24}$, the involution $(-1)$ is the unique nontrivial central element of order 2 in $\text{Aut}(\Lambda_{24})=\text{Co}_0$.

*Proof.* By Theorem P.13.20, the map $v\mapsto -v$ is a central automorphism of $\Lambda_{24}$ of order 2. Conway's description of the full automorphism group gives
$$
Z(\text{Co}_0)=\{\pm1\}
$$
[Conway 1969]. Hence the only central elements are $\pm1$, and the unique non-identity central involution is $(-1)$. ∎

---

### Theorem P.13.21 (Lift to VOA)

**Reference:** [Frenkel, Lepowsky & Meurman 1988, §5.4]

The $(-1)$ involution on $\Lambda_{24}$ lifts to an involution $\theta$ on $V_{\Lambda_{24}}$ with:

1. **Action on Heisenberg:** $\theta(\alpha^i_{-n}|0\rangle) = -\,\alpha^i_{-n}|0\rangle$
2. **Action on lattice vectors:** $\theta(e_v) = e_{-v}$

More generally, for a pure Heisenberg monomial one has
$$
\theta\!\left(\alpha^{i_1}_{-n_1}\cdots \alpha^{i_m}_{-n_m}|0\rangle\right)
=
(-1)^m\alpha^{i_1}_{-n_1}\cdots \alpha^{i_m}_{-n_m}|0\rangle.
$$

In particular, on weight-one currents:
$$
\theta(\alpha^i_{-1}|0\rangle) = -\alpha^i_{-1}|0\rangle
$$
so the weight-one currents are $\theta$-odd, and $(V_{\Lambda_{24}})^\theta$ has $\dim((V_{\Lambda_{24}})^\theta_1) = 0$.

*Proof.* For any lattice isometry $g$, the standard lattice-VOA lift acts on Heisenberg creation operators by the linear action of $g$ on the underlying lattice space and on lattice operators by $e_v\mapsto e_{gv}$ [Frenkel, Lepowsky & Meurman 1988, §5.4]. Taking $g=-1$ therefore gives
$$
\theta(\alpha^i_{-n}|0\rangle)=(-\alpha^i)_{-n}|0\rangle=-\alpha^i_{-n}|0\rangle
$$
for every mode number $n$, and
$$
\theta(e_v)=e_{-v}.
$$
Applying $\theta$ multiplicatively to a monomial with $m$ Heisenberg creation operators yields the factor $(-1)^m$. The weight-one space of $V_{\Lambda_{24}}$ is spanned by the vectors $\alpha^i_{-1}|0\rangle$, so every weight-one current is odd and no nonzero weight-one vector survives in the fixed-point subspace. ∎

**Corollary P.13.21a (Canonical Properties of θ).** When lifting lattice automorphisms to VOA automorphisms, the $(-1)$ lift $\theta$ is distinguished by:
1. Centrality (commutes with all other automorphisms)
2. Acting by $-1$ on each Heisenberg creation operator, equivalently by $(-1)^m$ on a state with $m$ Heisenberg factors
3. Acting as $e_v \mapsto e_{-v}$ on lattice vertex operators

There is no other involution of $V_\Lambda$ with these properties.

---

### Theorem P.13.22 (The FLM Orbifold Construction)

**Reference:** [Frenkel, Lepowsky & Meurman 1988]

The $\theta$-orbifold of $V_{\Lambda_{24}}$ is the Moonshine module:
$$(V_{\Lambda_{24}})^{\text{orb}} = (V_{\Lambda_{24}})^\theta \oplus (V_{\Lambda_{24}})^{tw,\theta} = V^\natural$$

where $(V_{\Lambda_{24}})^\theta$ is the $\theta$-fixed subspace and $(V_{\Lambda_{24}})^{tw,\theta}$ is the $\theta$-twisted sector.

**Epistemic Status:** Established mathematical theorem [Frenkel, Lepowsky & Meurman 1988].

---

## P.13.9 The Z₂ Structure from PCE

### Theorem P.13.23 (Canonical $\mathbb{Z}_2$ from the PCE-Attractor)

Assume the PCE-attractor branch carries the registered two-label fixed-ready-state quotient of Definition J.1 and retains its two labels as a logical subspace. The automorphism group of that quotient is $\mathbb Z_2$, and its nonidentity element lifts to an order-two unitary on the registered logical subspace.

*Proof.* Let
$$
r:\{0,1\}\to\{\mathrm{ready}\}
$$
be the registered constant quotient. Exactly two permutations of $\{0,1\}$ satisfy $r\circ s=r$: the identity and the bit flip. They form $S_2\cong\mathbb Z_2$. On a Hilbert realization with the two labels represented by an orthonormal basis, the bit flip lifts to a unitary $S$ with $S^2=I$; its $\pm1$ eigenspaces give the corresponding grading. SPAP and PCE alone do not supply the quotient or Hilbert realization. $\square$

---

### Theorem P.13.24 (Canonical Involution from Weight-One Rigidity)

Let $g \in \mathrm{Aut}(\Lambda_{24})$ satisfy $g^2 = I$, and let $\hat g$ be a standard lift of $g$ to $V_{\Lambda_{24}}$. Then
$$
\dim\big((V_{\Lambda_{24}})^{\hat g}_1\big)=0
\quad\Longleftrightarrow\quad
g=-1.
$$
In particular, among standard lifts of lattice involutions on the Leech branch, vanishing fixed weight-one space singles out $g=-1$; no centrality assumption is required.

For the orbifold consequence, assume additionally that (i) the selected extension $\mathcal V$ contains $(V_{\Lambda_{24}})^{\hat g}$ as its untwisted subVOA with the same conformal vector, is of CFT type with finite-dimensional graded subspaces, and carries a semisimple real-charge action of the fixed Heisenberg zero modes, and (ii) the operational controller criterion excludes every nontrivial positive-dimensional compact automorphism family of $\mathcal V$. Then $g=-1$ and $\hat g=\theta$.

*Proof.*

1. By Theorem P.13.14, because the Leech lattice is rootless,
$$
(V_{\Lambda_{24}})_1=\mathfrak h(-1)|0\rangle \cong \mathfrak h:=\Lambda_{24}\otimes_{\mathbb Z}\mathbb C,
$$
and there are no lattice-vector contributions in weight one.

2. For a standard lift of a lattice isometry, the action on the Heisenberg creation operators is the linear action of the underlying lattice automorphism. Therefore $\hat g$ acts on $(V_{\Lambda_{24}})_1$ exactly as $g$ acts on $\mathfrak h$, and
$$
(V_{\Lambda_{24}})^{\hat g}_1 \cong \mathfrak h^g.
$$
Hence
$$
\dim\big((V_{\Lambda_{24}})^{\hat g}_1\big)=\dim(\mathfrak h^g).
$$

3. Since $g^2=I$, the minimal polynomial of $g$ divides $x^2-1=(x-1)(x+1)$, whose roots are distinct. Thus $g$ is diagonalizable over $\mathbb C$ with eigenvalues contained in $\{+1,-1\}$.

4. If $\dim((V_{\Lambda_{24}})^{\hat g}_1)=0$, then $\mathfrak h^g=0$. So $g$ has no $+1$-eigenvectors. By Step 3, all eigenvalues are therefore $-1$, which implies $g=-I$ on $\mathfrak h$. Since $\Lambda_{24}$ spans $\mathfrak h$, this means $g(v)=-v$ for every $v\in\Lambda_{24}$, i.e. $g=-1$.

5. Conversely, if $g=-1$, then by Theorem P.13.21 the corresponding standard lift is $\theta$, and
$$
\theta(\alpha^i_{-1}|0\rangle)=-\alpha^i_{-1}|0\rangle
$$
for every weight-one Heisenberg current. Hence $(V_{\Lambda_{24}})^\theta_1=0$, proving the converse implication.

6. For the final claim, suppose $\mathfrak h^g\ne0$. Because $g$ is an integral involution, $\ker(g-I)$ is defined over $\mathbb Q$; hence the fixed lattice $\Lambda_{24}^g=\Lambda_{24}\cap\ker(g-I)$ contains a nonzero vector $u$. By Steps 1--2 the current $u(-1)\mathbf1$ lies in $(V_{\Lambda_{24}})^{\hat g}_1$, and by hypothesis (i) it lies in $\mathcal V_1$. It is primary of weight one, so $u_0$ commutes with $L_0$, annihilates the conformal vector, preserves every graded subspace of $\mathcal V$, and is a derivation of the vertex-operator product. Those subspaces are finite dimensional and $u_0$ acts on them semisimply with real charges, so
$$
U_t:=\exp(2\pi i t u_0),\qquad t\in\mathbb R,
$$
is a one-parameter group of automorphisms of $\mathcal V$ whose closure is a positive-dimensional compact abelian subgroup of $\operatorname{Aut}(\mathcal V)$. It is nontrivial already on the untwisted sector: nondegeneracy supplies $\alpha\in\Lambda_{24}$ with $\langle u,\alpha\rangle\ne0$, and the $\hat g$-symmetrization $w$ of $e^{2\alpha}$ is a nonzero vector of $(V_{\Lambda_{24}})^{\hat g}$, because $\hat g$ acts on $e^{2\alpha}$ by the square of its sign on $e^{\alpha}$ when $g\alpha=\alpha$ and permutes $e^{2\alpha}$ with $e^{2g\alpha}$ otherwise. Since $gu=u$ gives $\langle u,g\alpha\rangle=\langle u,\alpha\rangle$, one has $u_0w=2\langle u,\alpha\rangle w\ne0$. This contradicts hypothesis (ii). Thus $\mathfrak h^g=0$, and Steps 4--5 give $g=-1$ and $\hat g=\theta$. No separate certificate that the circle extends from the invariant subVOA to the orbifold is required, because $u(-1)\mathbf1$ is a weight-one vector of $\mathcal V$ itself. ∎

---

## P.13.10 Weight-2 Structure and the Griess Algebra

### Theorem P.13.25 (Weight-2 Counting)

**Reference:** [Frenkel, Lepowsky & Meurman 1988]

For the Leech lattice VOA $V_{\Lambda_{24}}$, the weight-2 space has dimension:
$$\dim(V_{\Lambda_{24}})_2 = 324 + 196560 = 196884$$

*Proof.*

**Step 1 (Heisenberg contribution).** For rank $r = 24$, weight-2 oscillator states include:
- $\alpha^i_{-2}|0\rangle$: dimension $r = 24$
- $\alpha^i_{-1}\alpha^j_{-1}|0\rangle$: dimension $r(r+1)/2 = 300$

Total Heisenberg contribution: $24 + 300 = 324$.

**Step 2 (Lattice vector contribution).** Vectors of norm 4 in the Leech lattice contribute $e_v$ states. The number of norm-4 vectors is the kissing number: 196,560.

**Step 3 (Total).** $\dim(V_{\Lambda_{24}})_2 = 324 + 196560 = 196884$. $\square$

---

### Theorem P.13.26 (Moonshine Module Weight-2 Structure)

**Reference:** [Frenkel, Lepowsky & Meurman 1988; Griess 1982]

The orbifold procedure preserves the weight-2 dimension:
$$\dim(V^\natural_2) = 196884$$

The space $V^\natural_2$ carries the structure of the Griess algebra, a commutative non-associative algebra with the Monster as its automorphism group.

*Proof.* Theorem P.13.22 identifies the object under consideration with the Frenkel--Lepowsky--Meurman $\theta$-orbifold
$$
V^\natural=V_{\Lambda_{24}}^+\oplus V_{\Lambda_{24}}^{T,+}.
$$
The graded-character theorem for this orbifold [Frenkel, Lepowsky & Meurman 1988] states
$$
\operatorname{Tr}_{V^\natural}q^{L_0-1}
=
J(q)
=
q^{-1}+196884q+21493760q^2+\cdots.
$$
The central charge is $24$, so a vector of conformal weight $n$ contributes to the coefficient of $q^{n-1}$. The coefficient of $q$ is therefore
$$
\dim V^\natural_2=196884.
$$
The absence of a constant term also gives $V^\natural_1=0$.

For $u,v\in V^\natural_2$, define
$$
u\cdot v=u_1v.
$$
This product remains in weight two because the mode $u_1$ changes weight by $\operatorname{wt}(u)-1-1=0$. VOA skew-symmetry gives
$$
u_1v
=
v_1u-L_{-1}(v_2u)+\frac12L_{-1}^2(v_3u).
$$
Here $v_2u\in V^\natural_1=0$, while $v_3u\in V^\natural_0=\mathbb C\mathbf1$ and $L_{-1}\mathbf1=0$. Hence $u\cdot v=v\cdot u$. The Griess algebra theorem [Griess 1982] identifies this commutative, generally non-associative weight-two algebra with the Griess algebra. Its hypotheses are satisfied because the VOA is precisely the FLM Moonshine module and has $V_0=\mathbb C\mathbf1$ and $V_1=0$. The automorphism theorem of Frenkel, Lepowsky, and Meurman (1988), equivalently the Griess automorphism theorem [Griess 1982], gives
$$
\operatorname{Aut}(V^\natural_2,\cdot)=\mathbb M.
$$
Thus the weight-two dimension, product structure, and automorphism group have the asserted values. ∎

---

## P.13.11 Main Selection Theorem

### Theorem P.13.27 (Moonshine-Module Identification on the Leech Branch)

Assume:
1. the Leech-lattice branch of Theorem P.13.10,
2. the operational exact-symmetry criterion of Definition P.13.2 and Theorem P.13.19, which excludes uniformly refinable positive-dimensional compact symmetry families on its registered controller branch, and
3. the selected vacuum is realized as an orbifold extension of $V_{\Lambda_{24}}$ by an involutive standard lift $\hat g$ of an involution $g\in\operatorname{Aut}(\Lambda_{24})$, realizes the canonical $\mathbb Z_2$ of Theorem P.13.23, and satisfies the untwisted-subVOA hypotheses in the final clause of Theorem P.13.24.

Then the resulting holomorphic $c = 24$ vacuum VOA is the Moonshine module:
$$\mathcal{V}_{\text{PCE}} = V^\natural$$

*Proof.*

**Step 1 (Lattice selection).** By Theorem P.13.10, the branch lattice is $\Lambda_{24}$.

**Step 2 (Lattice VOA).** By Theorem P.13.14, $\Lambda_{24}$ admits a VOA structure $V_{\Lambda_{24}}$ with $c = 24$ and $\dim(V_1) = 24$.

**Step 3 (Orbifold branch and weight-one exclusion).** Assumptions 2--3 supply the final-clause hypotheses of Theorem P.13.24. If $(V_{\Lambda_{24}})^{\hat g}_1\ne0$, that theorem produces a nontrivial positive-dimensional compact automorphism family of the selected orbifold, contradicting the controller criterion. Therefore
$$
\dim\big((V_{\Lambda_{24}})^{\hat g}_1\big)=0.
$$

**Step 4 (Weight-one rigidity).** By Theorem P.13.24, the vanishing of the fixed-point weight-one space forces the underlying lattice involution to be $g=-1$. Its standard lift is therefore the involution $\theta$ of Theorem P.13.21.

**Step 5 (FLM construction).** By Theorem P.13.22, the $\theta$-orbifold of $V_{\Lambda_{24}}$ is the Moonshine module $V^\natural$.

**Step 6 (Uniqueness verification).** By Theorem P.13.16, among holomorphic $c = 24$ VOAs with $\dim(V_1) = 0$ and Griess algebra on $V_2$, exactly one exists: $V^\natural$.

**Step 7 (Conclusion).** On this branch,
$$\mathcal{V}_{\text{PCE}} = V^\natural \quad \square$$

**Epistemic Status:** Conditional framework-to-mathematics identification. The framework fixes the Leech branch and excludes surviving positive-dimensional weight-one symmetry families; once the selected branch is realized as an orbifold by an involutive standard lift, Theorem P.13.24 forces $g=-1$, and the FLM orbifold theorem then identifies $V^\natural$.

---

### Theorem P.13.28 (Conditional Modular and Weight-One Selection)

Assume the torus, mapping-class, and scalar-partition-function hypotheses of Proposition P.13.6.5. For the VOA-character conclusion, assume additionally that every candidate is a rational, $C_2$-cofinite, self-dual, holomorphic $c=24$ VOA with trivial modular multiplier. Suppose the admissible class contains at least one candidate $V_0$ with $\dim((V_0)_1)=0$ and finite PCE potential. Suppose also that each candidate $V$ with $\dim(V_1)>0$ carries a positive-dimensional compact operational symmetry region satisfying the controller/reset hypotheses of Theorem P.13.19, and that its remaining PCE terms are finite. Then the scalar character is modular invariant and every finite-potential PCE minimizer satisfies $\dim(V_1)=0$.

*Proof.* Proposition P.13.6.5 gives scalar $SL_2(\mathbb Z)$ invariance under the stated modular hypotheses. Zhu's modular-invariance theorem [Zhu 1996] applies because rationality and $C_2$-cofiniteness are assumed; self-duality makes the character representation one-dimensional, and the trivial-multiplier hypothesis makes it invariant. For a holomorphic $c=24$ candidate,
$$
\chi_V(\tau)=j(\tau)+C,
\qquad
744+C=\dim(V_1).
$$
If $\dim(V_1)>0$, the declared controller branch and Theorem P.13.19 give $V_{\mathrm{op}}(V)=+\infty$. The other PCE terms are finite, so $V_{\mathrm{PCE}}(V)=+\infty$. The candidate $V_0$ has finite potential; hence no infinite-potential candidate can minimize. Therefore every finite-potential minimizer has $\dim(V_1)=0$. This argument does not distinguish among multiple admissible zero-weight-one candidates. ∎

**Epistemic Status:** Conditional framework-to-mathematics selection on the stated modular, admissibility, and registered-controller branch.

---

### Theorem P.13.28a (Modular Polar Rigidity of the Vacuum Spectrum)

Let $f(\tau)$ and $g(\tau)$ be weakly holomorphic modular functions of weight zero for $SL_2(\mathbb Z)$, with no poles away from the cusp. Suppose their principal parts at $q=e^{2\pi i\tau}=0$ agree:
$$
f(\tau)-g(\tau)=O(q^0).
$$
Then $f-g$ is constant. If their constant terms also agree, then
$$
f(\tau)=g(\tau).
$$
Consequently, on the Moonshine branch, the vacuum character with principal part $q^{-1}$ and vanishing constant term is uniquely
$$
J(\tau)=j(\tau)-744
=
q^{-1}+196884q+21493760q^2+\cdots.
$$

*Proof.* The compactified modular curve
$$
X(1)=SL_2(\mathbb Z)\backslash\mathbb H^*
$$
is compact. Since $f$ and $g$ are weakly holomorphic modular functions with no poles away from the cusp and have the same principal part at the cusp, the difference
$$
h=f-g
$$
has no pole at the cusp and no pole anywhere else on $X(1)$. Thus $h$ is a holomorphic function on the compact Riemann surface $X(1)$. Every holomorphic function on a compact connected Riemann surface is constant, so $f-g$ is constant. If the constant terms also agree, that constant is zero, hence $f=g$.

For the Moonshine branch, the character is a weight-zero modular function with a single pole $q^{-1}$ at the cusp and no other pole. The normalization $\dim(V_1)=0$ from Theorem P.13.28 fixes the constant term to zero. Therefore the preceding uniqueness result identifies the character with $j(\tau)-744=J(\tau)$. ∎

**Corollary P.13.28b (Finite Polar Data Determine the Infinite Vacuum Tower).** On the Moonshine branch, once the modular group, weight, pole order $q^{-1}$, and constant term are fixed, all positive Fourier coefficients of the vacuum character are forced.

*Proof.* Theorem P.13.28a proves uniqueness of the modular function with those data. If any positive coefficient differed, the resulting function would be a distinct modular function with the same principal part and constant term, contradicting uniqueness. ∎

# Part V: The Monster Group

## P.13.12 Main Results

### Theorem P.13.29 (FLM Theorem)

**Reference:** [Frenkel, Lepowsky & Meurman 1988]

$$\text{Aut}(V^\natural) = \mathbb{M}$$

The Monster group $\mathbb{M}$ is the largest sporadic simple group, with order:
$$|\mathbb{M}| = 2^{46} \cdot 3^{20} \cdot 5^9 \cdot 7^6 \cdot 11^2 \cdot 13^3 \cdot 17 \cdot 19 \cdot 23 \cdot 29 \cdot 31 \cdot 41 \cdot 47 \cdot 59 \cdot 71$$
$$\approx 8.08 \times 10^{53}$$

**Epistemic Status:** Established mathematical theorem.

---

### Theorem P.13.30 (Monster as Vacuum Symmetry on the Moonshine Branch)

On the branch where Theorem P.13.27 identifies the selected VOA candidate $\mathcal V_{\mathrm{PCE}}$ with $V^\natural$,
$$
\boxed{\operatorname{Aut}_{\mathrm{VOA}}(\mathcal V_{\mathrm{PCE}})=\mathbb M.}
$$

*Proof.* Theorem P.13.27 gives an isomorphism $\mathcal V_{\mathrm{PCE}}\cong V^\natural$ on the stated branch, and conjugation by that isomorphism identifies their VOA automorphism groups. Theorem P.13.29 gives $\operatorname{Aut}_{\mathrm{VOA}}(V^\natural)=\mathbb M$. $\square$

**Epistemic Status:** Conditional mathematical automorphism theorem. A physical vacuum-symmetry conclusion additionally requires a realization functor from the VOA to the retained physical observable/response category; the physical group is the image of the induced action and is the full Monster only when that action is faithful.

---

### P.13.30a Vacuum Stabilizer Descent from Monster Symmetry

**Definition P.13.30a.1 (Predictive Polarization Datum).** On the Moonshine branch, the bare marked datum is
$$
\Pi_{\mathrm{PU}}=(\mathcal G_{24},\Lambda_{24},\mathcal A\oplus\mathcal B,\widetilde X,J_G),
$$
with the entries described below. A **descent realization** of this datum is an additional finite certificate
$$
\mathfrak C_{\Pi}=(H,r_{\Lambda},r_{\mathcal G},\iota_{\mathrm{resp}}),
$$
where $H\le\mathbb M$, $r_{\Lambda}:H\to\operatorname{Aut}(\Lambda_{24})=Co_0$ is a specified action on the marked lattice carrier, $r_{\mathcal G}:H\to\operatorname{Aut}(\mathcal G_{24})=M_{24}$ is a specified action on the marked code frame, and $\iota_{\mathrm{resp}}:H\to\operatorname{Aut}(\mathrm{Resp}_{\mathrm{PU}})$ is a compatible action on the retained response presheaf. The certificate must include the intertwining maps showing that these actions preserve the active/inactive polarization, flag lift, and half-swap data. The bare tuple does not itself define an action of $\mathbb M$ on its entries or a homomorphism from $\mathbb M$ to $Co_0$ or $M_{24}$.

**Theorem P.13.30a.2 (Conditional Stabilizer Descent of Low-Energy Symmetry).** Assume an accepted descent realization $\mathfrak C_{\Pi}$. Define
$$
H_{\Pi}:=\{h\in H:h\text{ preserves every marked entry of }\Pi_{\mathrm{PU}}\}.
$$
Every exact low-energy symmetry whose accepted lift is an element of $H$ and whose action preserves $\Pi_{\mathrm{PU}}$ is represented by an element of $H_{\Pi}$. Its certified lattice and code actions lie in $r_{\Lambda}(H_{\Pi})\le Co_0$ and $r_{\mathcal G}(H_{\Pi})\le M_{24}$, respectively.

*Proof.* The lift and preservation hypotheses place the representing element in $H_{\Pi}$ by definition. Because $r_{\Lambda}$ and $r_{\mathcal G}$ are homomorphisms supplied by $\mathfrak C_{\Pi}$ and the certificate's intertwining diagrams commute, their images act on the marked lattice and code data and preserve the corresponding markings. No Monster-to-Conway or Monster-to-Golay descent is inferred without these supplied maps. $\square$

**Corollary P.13.30a.3 (Scope of Stabilizer-Descended Gauge and Flavor Data).** Under $\mathfrak C_{\Pi}$, an exact low-energy gauge or flavor label that both lifts through $H$ and preserves $\Pi_{\mathrm{PU}}$ acts through $H_{\Pi}$. If its induced response action $\iota_{\mathrm{resp}}(h)$ is the identity, it is operationally null. Labels that fail the lift or preservation hypotheses are outside this descent theorem and require their own branch certificate; they are not thereby proved trivial.

*Proof.* The first claim is Theorem P.13.30a.2. The second is the response-equivalence criterion of Corollary G.8.4h.3. Neither theorem classifies labels outside the stated lift and preservation domain. $\square$

**Corollary P.13.30a.4 (Twined-Character Observability Criterion).** Assume an accepted $\mathfrak C_{\Pi}$ and let $h\in H_{\Pi}$. Its physical response content is non-null exactly when $\iota_{\mathrm{resp}}(h)\ne\mathrm{id}$. If, in addition, the declared family of restricted traces is separating on $\iota_{\mathrm{resp}}(H_{\Pi})$, equality of all restricted twined and untwined response traces implies $\iota_{\mathrm{resp}}(h)=\mathrm{id}$:
$$
\operatorname{Tr}_{V_{\mathcal P}}(hq^{L_0-1})
=
\operatorname{Tr}_{V_{\mathcal P}}(q^{L_0-1})
\quad\text{for every }\mathcal P
\Longrightarrow
\iota_{\mathrm{resp}}(h)=\mathrm{id}.
\tag{P.13.30a.1}
$$

*Proof.* If $\iota_{\mathrm{resp}}(h)$ is the identity, every admitted protocol has the same outcome law with and without $h$; Theorem P.6.1b.3 and Corollary G.8.4h.3 therefore make the action operationally null. Conversely, the separating-trace hypothesis says precisely that a nonidentity response action changes at least one restricted trace. Without that hypothesis, equality of characters or traces need not determine equality of response transformations. $\square$

---

### Theorem P.13.31 (Monstrous Moonshine)

**Reference:** [Conway & Norton 1979; Borcherds 1992]

For each $g\in\mathbb M$, the McKay--Thompson series is
$$
T_g(\tau)
:=\operatorname{Tr}_{V^\natural}\!\left(gq^{L_0-1}\right)
=\sum_{n\ge0}\operatorname{Tr}_{V^\natural_n}(g)q^{n-1}.
$$
It is the Hauptmodul for a genus-zero subgroup $\Gamma_g \leq SL_2(\mathbb{R})$.

**Epistemic Status:** Established theorem (Borcherds 1992, Fields Medal work).

---

# Part VI: Complete Derivation Summary

## P.13.13 The Full Chain

$$\boxed{
\begin{aligned}
&\text{registered reset ensemble }(P,R,q) \xrightarrow{\text{conditional Landauer}} \varepsilon_{\mathrm{reset}}\ge H_q(P\mid R) \\[0.3em]
&\text{sharp match/mismatch quotient + attained structural-reference branch} \to \varepsilon_0=\ln2 \xrightarrow{\text{capacity + no-surplus}} a=2 \xrightarrow{d_0=8,\ b=d_0-a,\ \text{SLD-QFI}} M=24 \\[0.3em]
&\xrightarrow{\text{fixed-normalization even/unimodular certificate + finite Gaussian-cost comparison}} \Lambda_{24} \\[0.3em]
&\xrightarrow{\text{P.13.6.1-3 branch hypotheses}} \text{exact scale} \to \text{2D chiral VOA} \to c = 24 \xrightarrow{\text{P.13.6.4 candidate-and-cost hypotheses}} \text{selected holomorphic candidate} \\[0.3em]
&\xrightarrow{\text{lattice VOA}} V_{\Lambda_{24}} \xrightarrow{\text{involutive standard-lift orbifold branch}} \mathcal{V}_{\text{PCE}} \xrightarrow{\text{weight-one exclusion + P.13.24}} \theta\text{-orbifold} \xrightarrow{\text{FLM}} V^\natural \xrightarrow{\text{FLM}} \text{Aut}(V^\natural)=\mathbb{M}
\end{aligned}
}$$

---

## P.13.14 Epistemic Status Summary

| Step | Result | Type | Reference |
|------|--------|------|-----------|
| 1 | $K_0 = 3$ bits | Framework | Theorem 15 |
| 2 | $d_0 = 8$ | Framework | Theorem 23, Theorem Z.2 |
| 3a | $\varepsilon_0=\ln2$ | Conditional structural reference | Definition 15a on its attained branch |
| 3b | $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$; a positive constant floor requires $H_q(P\mid R)\ge h_{\min}>0$ | Conditional physical reset | Theorem 31, Landauer |
| 4 | $a = 2$ | Framework | Theorem Z.1 (PPI + PCE) |
| 5 | $b = 6$ | Definition | $b = d_0 - a$ |
| 6 | $M = 24$ | Framework | Theorem Z.5 |
| 7 | Fixed-normalization positive-definite rank-$24$ even-unimodular carrier and finite Gaussian-cost objective | Registered finite PCE branch | Selection Principles P.13.7–P.13.9 |
| 8 | $\Lambda_{24}$ | Unique minimizer modulo isometry | Theorem P.13.10; modular-form and Niemeier classification |
| 9 | $\mathcal{G}_{24}$ | PCE + Mathematics | Griesmer, Pless |
| 10 | Exact scale $\to$ 2D chiral CFT/VOA | Conditional branch | Propositions P.13.6.1–P.13.6.2: exact critical scaling family and 2D chiral-slice hypotheses |
| 11 | $c = 24$; preference for a holomorphic candidate | Conditional branch and candidate comparison | Propositions P.13.6.3–P.13.6.4: chiral-$24$-boson assignment plus equal-benefit, equal-propagation, strict-cost hypotheses |
| 12 | Scalar modular invariance | Conditional modular branch | Proposition P.13.6.5: torus, mapping-class, scalar-function, and VOA finiteness/self-duality/trivial-multiplier hypotheses |
| 13 | $V_{\Lambda_{24}}$ | Mathematics | Borcherds, FLM |
| 14 | Operational exact-symmetry criterion excludes surviving positive-dimensional weight-one symmetry on the selected branch | Conditional framework criterion | Definition P.13.2, Theorem P.13.19 |
| 15 | In an involutive standard-lift orbifold realization, Theorem P.13.24 forces $g=-1$ (hence $\hat g=\theta$) | Conditional framework + mathematics | Theorems P.13.21–P.13.24 |
| 16 | $V^\natural$ | Mathematics on that branch | FLM construction |
| 17 | $\text{Aut}(V^\natural) = \mathbb{M}$ | Mathematics on that branch | FLM |


**Legend:**
- *Framework:* Derived from PU axioms (POP, PCE, PPI)
- *Framework + Physics:* Combines framework derivation with established physics (Landauer)
- *Framework + Mathematics:* Framework derivation determines selection among mathematically classified structures
- *PCE + Mathematics:* PCE optimization uniquely selects among classified mathematical structures
- *Mathematics:* Established mathematical theorem independent of framework

---

# Part VII: Physical and Philosophical Interpretation

## P.13.15 Situating the Conditional Construction Within the Framework

### P.13.15.1 The Extended Dependency Ledger

The foundation-side bridge is
$$
\text{Cogito-certified knowledge process}+\text{finite self-verifying presentation}
\xrightarrow{\mathrm{P.6.1c.3--P.6.1c.4}}
\text{canonical predictive normal form}.
$$
The structural backbone used by the vacuum-symmetry construction is then
$$
\text{sharp match/mismatch quotient + attained structural-reference branch}
\to \varepsilon_0=\ln2
\xrightarrow{\text{capacity + no-surplus}}
a=2
\xrightarrow{d_0=8,\ \text{SLD-QFI}}
M=24.
$$
The registered physical-reset result $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ is a parallel thermodynamic ledger and is not a premise of this structural calculation.

Beyond $M=24$, the vacuum-symmetry endpoint requires the following branch data:
$$
\begin{aligned}
M=24&+\text{predictive-recovery MacWilliams gate} &&\longrightarrow \mathcal G_{24},\\
M=24&+\text{fixed-normalization even/unimodular certificate and finite Gaussian-cost objective} &&\longrightarrow \Lambda_{24},\\
\Lambda_{24}&+\text{chiral }c=24\text{ VOA and lattice-VOA hypotheses} &&\longrightarrow V_{\Lambda_{24}},\\
V_{\Lambda_{24}}&+\text{registered controller, standard lift, and orbifold certificates} &&\longrightarrow V^\natural,\\
V^\natural&+\text{Frenkel--Lepowsky--Meurman theorem} &&\longrightarrow \operatorname{Aut}(V^\natural)=\mathbb M.
\end{aligned}
$$

Every arrow is conditional on the premises displayed in its row. PCE supplies a comparison rule only after each admissible class, response ledger, and cost ledger is registered. The Monster is therefore the mathematical endpoint of the declared Moonshine branch, not a symmetry forced by PCE for every predictive system.

### P.13.15.2 The Philosophical Significance

The derivation realizes three central claims of the Predictive Universe framework:

**1. The Primacy of Prediction (Section P.2–P.3)**

The *Cogito* establishes conscious awareness as the sole indubitable certainty. The framework interprets this awareness as fundamentally predictive: every mental act—perception, belief, planning—constitutes prediction navigating the Space of Becoming (Definition 8). Physical reality emerges as the thermodynamically optimal structure for predictive coherence.

The registered P.13.27 branch gives a precise conditional result: after the independent code, lattice, controller, orbifold, and VOA hypotheses are supplied, the Frenkel--Lepowsky--Meurman theorem identifies the mathematical endpoint as $V^\natural$ with automorphism group $\mathbb M$. Neither SPAP nor PCE alone selects that branch, and identifying this VOA with a physical vacuum requires a separate realization certificate.

**2. The Principle of Physical Instantiation (Definition P.6.2)**

The PPI states that abstract logical structures, when physically instantiated under finite resources, manifest with properties shaped by irreducible thermodynamic costs. This principle bridges pure mathematics and physics.

The derivation chain exemplifies PPI at every step:

| Abstract Structure | Physical Instantiation | Thermodynamic Cost |
|-------------------|----------------------|-------------------|
| Registered binary fixed-ready reset | Structural alphabet and physical reset | $\varepsilon_0=\ln2$ structurally; $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ only under the registered Landauer hypotheses |
| Sharp binary active record | Active kernel $a=2$ | Theorem Z.1 capacity and no-surplus hypotheses |
| $24$ QFI tangent modes | Interface tangent space | $M=2a(d_0-a)=24$ on the joint $d_0=8$, $a=2$ branch |
| Golay code $[24,12,8]$ | Predictive-recovery code | Self-dual-rate and MacWilliams certificate |
| Leech lattice $\Lambda_{24}$ | Mathematical lattice carrier | Fixed-normalization even-unimodular and finite Gaussian-cost certificate |
| Moonshine module $V^\natural$ | Mathematical VOA endpoint | Registered controller, standard lift, orbifold data, and the FLM construction |
| Monster group $\mathbb M$ | Mathematical automorphism group | $\operatorname{Aut}(V^\natural)=\mathbb M$ by the FLM theorem |

The Monster is the automorphism group of the mathematical VOA $V^\natural$ on the registered Moonshine branch. It becomes a physical vacuum symmetry only if an explicit physical-realization map identifies the retained vacuum observables with that VOA and proves that its automorphisms preserve the physical response ledger.

**3. Resolution of Wigner's Puzzle (Section P.7)**

Wigner asked why mathematics is "unreasonably effective" in describing physics [Wigner 1960]. The framework's answer: both mathematics and physics are manifestations of prediction under constraints, and PCE optimization selects the same structures in both domains.

The Monster group provides a striking illustration. Mathematicians discovered the Monster through:
- The classification of finite simple groups (algebra)
- The Leech lattice and sphere packing (geometry)
- Monstrous Moonshine and modular forms (number theory)

Within the manuscript, the same mathematical structure is reached only on a conditional chain using:
- a separately registered binary-reset ledger;
- the QFI interface-mode branch;
- the predictive-recovery, lattice, controller, orbifold, and VOA certificates.

This is a compatibility of independently gated ledgers, not a derivation of Moonshine from SPAP. Section P.7 states the intended variational interpretation:

> "Both processes instantiate the same branch-indexed PCE variational grammar: each searches an admissible structure space for stable predictive optima under finite constraints, and each removes surplus description by operational equivalence."

The branch is mathematically compatible with the variational interpretation because its registered finite comparison selects the Moonshine construction inside the declared candidate class. The present results do not prove that mathematics and physics must converge to $V^\natural$, nor that every physical vacuum realizes the Moonshine branch.

---

## P.13.16 The Monster and the SPAP Triad

### P.13.16.1 Connection to Time, Entropy, and Perspective

Section P.12 distinguishes three SPAP-associated data sets:

$$
(\mathcal T_{\mathrm{op}},\mathcal E_{\mathrm{reset}},\mathcal P_{\mathrm{id}}).
$$

Here $\mathcal T_{\mathrm{op}}$ is the operation order of a declared protocol, $\mathcal E_{\mathrm{reset}}$ is its registered-reset entropy ledger, and $\mathcal P_{\mathrm{id}}$ is an independently specified predictor-target identification. Theorem P.12.3 permits their joint certification but proves that none determines either of the others without an additional injective reconstruction or monotonicity hypothesis; no isomorphism $\mathcal T\cong\mathcal E\cong\mathcal P$ is established.

The Moonshine construction adds a separate mathematical symmetry ledger:

$$
(\mathcal T_{\mathrm{op}},\mathcal E_{\mathrm{reset}},\mathcal P_{\mathrm{id}})
\quad\text{and}\quad
\bigl(\mathcal G_{24},\Lambda_{24},V^\natural,\operatorname{Aut}(V^\natural)=\mathbb M\bigr).
$$

The first tuple contains protocol order, registered-reset entropy, and predictor--target identification. The second is available only after the predictive-recovery, lattice, controller, orbifold, and VOA certificates. The ledgers can coexist on their joint branch, but no arrow from any member of the first tuple to $\mathbb M$, or from $\mathbb M$ back to $(8,2,24)$, is proved. The exact result is the conditional mathematical identity $\operatorname{Aut}(V^\natural)=\mathbb M$.

### P.13.16.2 The Vacuum as Optimal Predictive Coherence

Definition P.8.2 of Appendix P states:

> "Spacetime is the structure that error-corrected predictive coherence takes when optimized under finite-resource constraints (PCE)."

This definition extends naturally to the vacuum structure:

**Definition P.13.3 (Vacuum Candidate on the Registered Coherence Class).** Fix the holomorphic $c=24$ candidate class, scalar modular certificate, finite Gaussian Niemeier cost, exact-symmetry controller cost, and involutive standard-lift orbifold realization of Theorem P.13.27. The vacuum $\mathcal V_{\mathrm{PCE}}$ is the minimizer in that admitted class. Theorem P.13.10 fixes its Leech lattice input, Theorems P.13.19 and P.13.24 force the $-1$ involution on the orbifold branch, and the FLM theorem identifies the resulting VOA as $V^\natural$. Uniqueness is therefore a theorem of this finite certificate, not a consequence of SPAP alone.

On this candidate class, $\mathcal V_{\mathrm{PCE}}\cong V^\natural$ and the FLM theorem gives $\operatorname{Aut}(\mathcal V_{\mathrm{PCE}})=\mathbb M$ as a VOA statement. Calling it a physical vacuum symmetry additionally requires the physical-realization and response-preservation certificate stated above; no such identification follows from the finite selector alone.

---

## P.13.17 Why the Monster? Necessity vs. Contingency

### P.13.17.1 The Question of Alternatives

One might ask: could the vacuum symmetry have been different? Could a universe satisfying POP and PCE have a vacuum with symmetry group other than $\mathbb{M}$?

The derivation chain establishes a distinguished Leech/Moonshine branch once the operational criteria of Sections P.13.4–P.13.11 are imposed. Within that branch, the vacuum symmetry is $\mathbb{M}$.

The key thermodynamic input is the lower-bound parameter $\varepsilon_0=\ln2$, used at the PCE fixed point. Together with the additional branch criteria, it leads to:

- $a = 2$ (PPI-optimality, Theorem Z.1)
- $b=d_0-a=6$ (with $d_0=8$ from Theorem Z.2's Hilbert-distinguishability and same-class-comparator branch)
- $M = 2ab = 24$ (QFI structure)
- Leech lattice as the unique minimizer of the finite Gaussian-cost potential on the certified rank-$24$ Niemeier branch
- $V_{\Lambda_{24}}$ with $\dim(V_1) = 24$ (lattice VOA)
- Operational exact-symmetry criterion favoring $\dim(V_1) = 0$
- Central-involution branch plus $\theta$-orbifold yielding $V^\natural$
- $\mathbb{M} = \text{Aut}(V^\natural)$

Each step combines framework input with an additional branch criterion or mathematical classification result. The Monster therefore emerges as the symmetry of this selected branch.

### P.13.17.2 Counterfactual Analysis

Theorem Z.2 selects $d_0=8$ from the (O1)–(O3), (FC), Hilbert-distinguishability, same-class-comparator branch and records $d_0=2a^2$ only after the independent Theorem-Z.1 branch fixes $a=2$. Corollary Z.1 therefore supplies consistency identities at
$$
(d_0,a,K_0,\varepsilon_0)=(8,2,3,\ln2);
$$
it does not define a counterfactual family obtained by varying $\varepsilon$.

Within the selected joint branch,
$$
b=d_0-a=6,
\qquad
M=2a(d_0-a)=24.
$$
The subsequent channel-complete kissing-class, predictive-recovery, Leech, orbifold, and VOA criteria may then be applied on their separately stated branches.

Counterfactual choices such as $\varepsilon=\ln3$ or $\ln4$ require a new reachable alphabet, a new active-kernel theorem, a new same-class carrier comparator, and a new mode-channel certificate. The current theorems neither assign them $d_0=2a^2$ nor exclude them by a noninteger value of $K_0$. Accordingly, the Monster conclusion is conditional on the registered $(8,2,24)$ branch and its later classification hypotheses, not on an exhaustive theorem over all structural alphabet sizes.

### P.13.17.3 The Monster as Fixed Point

The derivation chain can be viewed as a fixed-point equation:

$$\text{PCE}[\text{Vacuum Structure}] = \text{Vacuum Structure}$$

On the admitted P.13.27 branch, the finite comparison selects $\mathcal V_{\mathrm{PCE}}=V^\natural$. Applying the same response quotient and cost again leaves that selected isomorphism class unchanged, so it is an idempotent selection fixed point. The FLM automorphism theorem then gives $\operatorname{Aut}(\mathcal V_{\mathrm{PCE}})=\mathbb M$. Stability here means invariance of the selected finite response class under the registered selector; dynamical attraction would require an additional evolution law and is not used in the group identification.

The branch records three exact mathematical facts:
- **Automorphism theorem:** the FLM construction has $\operatorname{Aut}(V^\natural)=\mathbb M$.
- **Monstrous Moonshine:** the McKay--Thompson series $T_g(\tau)$ for $g\in\mathbb M$ satisfy the genus-zero theorem cited in Theorem P.13.31.
- **Classification inputs:** the Leech lattice is the rootless Niemeier lattice, while the identification of the VOA uses the registered orbifold/controller data and not the character condition $V_1=0$ alone.

The order of $\mathbb M$ is a property of that mathematical automorphism group. It is not derived from the PU integer ledger, and it describes a physical symmetry only on an accepted realization of the Moonshine VOA as the retained vacuum algebra.

**Proposition P.13.17.4 (No Moonshine-Coefficient Derivation of the Vacuum Exponent).** The graded character coefficients of $V^\natural$, including
$$
\chi_{V^\natural}(\tau)=J(\tau)=q^{-1}+196884q+21493760q^2+\cdots,
$$
do not determine the Appendix U vacuum exponent $\kappa_{\Lambda}$ or the Appendix T electroweak exponent $\kappa_{EW}$ in the current framework. They are branch-internal VOA spectral data on the Leech/Moonshine branch, not Morse-Bott zero-mode counts and not determinant prefactors.

*Proof.* Theorem P.13.17 fixes the Moonshine character after the Leech/Moonshine branch has already been selected. Its first nontrivial coefficient gives
$$
\dim(V^\natural_2)=196884=196883+1,
$$
where $196883$ is the smallest nontrivial Monster representation dimension and the extra $1$ is the vacuum-descendant contribution. This datum is a weight-space or representation dimension in the VOA. By contrast, Appendix U defines the vacuum exponent through the Grassmannian/Morse-Bott ledger
$$
\kappa_{\Lambda}=\frac{N_{\mathbb R}-m}{2},
\qquad
N_{\mathbb R}=2\dim_{\mathbb C}\mathrm{Gr}_{\mathbb C}(12,24)=288,
\qquad
m=4+\nu,
$$
so the allowed values in Theorem U.16a are $142$ and $141.5$. Appendix T defines the electroweak exponent through the Steiner active-pair response action
$$
\kappa_{EW}
=\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}
=\frac{77}{2}
=38.5.
$$
No theorem in Appendix P, Appendix T, or Appendix U defines a functional that maps $\dim(V^\natural_2)$ or the representation dimension $196883$ to $m$, $N_{\mathbb R}$, $\kappa_{\Lambda}$, $\kappa_{EW}$, $A_{\mathrm{eff}}$, or $A_{EW}$.

The numerical logarithms do not repair this absence of structure. Directly,
$$
\log_2(196883)=17.586979\ldots,
\qquad
\ln(196883)=12.190365\ldots.
$$
On the Appendix T electroweak branch,
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-\kappa_{EW}},
$$
so
$$
\ln\frac{M_{Pl}}{v}=\kappa_{EW}-\ln A_{EW}=38.419342\ldots
$$
for $A_{EW}=1.084$, and therefore
$$
\log_2\frac{M_{Pl}}{v}=55.427394\ldots.
$$
Thus the base-two logarithm of $196883$ is not close to the base-two electroweak hierarchy exponent. The superficially similar decimal-scale size $\log_{10}(M_{Pl}/v)\approx16.69$ uses a different logarithmic base and is not a PU complexity exponent, since the PU hierarchy laws use $e^{-\kappa}$. Therefore the Moonshine coefficient data can serve only as branch-internal VOA consistency data unless an additional, independently stated spectral functional is supplied and proved. ∎

---

## P.13.18 Monstrous Moonshine and the Unity of Mathematics

### P.13.18.1 The Moonshine Phenomenon

Monstrous Moonshine, conjectured by Conway and Norton [Conway & Norton 1979] and proved by Borcherds [Borcherds 1992], uses, for each $g\in\mathbb M$, the McKay--Thompson series
$$
T_g(\tau)
:=\operatorname{Tr}_{V^\natural}\!\left(gq^{L_0-1}\right)
=\sum_{n\ge0}\operatorname{Tr}_{V^\natural_n}(g)q^{n-1}.
$$
This series is the Hauptmodul for a genus-zero subgroup of $SL_2(\mathbb{R})$.

This connection between:
- The Monster (finite group theory)
- The Moonshine module (vertex operator algebras)
- Modular forms (number theory)
- Genus-zero surfaces (algebraic geometry)

appeared deeply mysterious when discovered. Why should the largest sporadic group know about modular forms?

### P.13.18.2 Resolution via PCE

The Predictive Universe framework supplies a conditional variational interpretation of these established mathematical relations.

**The Monster:** The automorphism group of the FLM Moonshine module, $\operatorname{Aut}(V^\natural)=\mathbb M$.

**The Moonshine Module:** The VOA obtained on the registered Leech involution-orbifold/controller branch; the condition $c=24$ and $V_1=0$ alone is not used as a uniqueness theorem.

**Modular Functions:** On the torus/mapping-class/scalar-partition-function branch of Proposition P.13.6.5, $SL_2(\mathbb Z)$-invariant functions represent scalar modularly consistent observables. The flag perspective space $\Sigma$ alone does not impose this invariance.

**Genus-Zero Property:** This is the theorem about the McKay--Thompson series cited in Theorem P.13.31, not a consequence of descriptive simplicity.

PCE enters only through the registered finite comparison that selects the already specified Moonshine candidate branch. It does not reprove the Moonshine theorem or establish a common causal origin for its group-, VOA-, and modular-function data.

As stated in Section P.7 of Appendix P:

> "The 'unreasonable effectiveness' dissolves once the common foundation is recognized. Mathematics is the abstract articulation of predictive structure; physics is that same predictive structure under thermodynamic instantiation and finite-resource constraint. The correspondence between them is therefore not accidental but a consequence of their shared origin in prediction and their shared PCE selection of optimal structures."

Monstrous Moonshine is the cited mathematical theorem relating $\mathbb M$, $V^\natural$, and the McKay--Thompson series. The manuscript's PCE language is an interpretation of the registered branch; it is not a premise of the Moonshine theorem and does not prove that the mathematical structures share a physical origin.

---

## P.13.19 Implications for the Framework

### P.13.19.1 Validation of the Approach

The Monster branch provides a structural compatibility test of the framework, not an empirical derivation of physical vacuum symmetry.

The evidence claimed here is conditional and nonnumerical:

1. **Internal Consistency:** The integer $24$ occurs in the interface, code, and lattice/VOA ledgers only after their distinct gates are supplied. Sharing that integer does not make one ledger determine another, and the controller/orbifold realization adds essential branch data.

2. **Connection to Deep Mathematics:** The derivation terminates at structures (Leech lattice, Moonshine module, Monster group) that mathematicians have identified as exceptional through independent methods.

3. **Uniqueness at Each Step:** Once each branch's independent admissibility criteria are registered, the corresponding uniqueness theorems identify the Golay code, the Leech lattice, and the Moonshine module within those classes; PCE does not supply omitted class criteria.



4. **Explanatory Power for Moonshine:** The framework provides a physical interpretation for the Moonshine correspondence that has lacked one since its discovery.

### P.13.19.2 The Scope of Predictive Foundations

The derivation extends the scope of what the predictive foundations determine:

| Domain | Structure | Conditional source |
|--------|-----------|--------------------|
| Dimensionality | $D=4$ | Full mode--channel kissing-class branch |
| Geometry | Lorentzian signature | Corollary 46a and the complete Appendix O promotion package |
| Gauge structure | Reconstructed gauge algebra or group on its quotient branch | Appendix G reconstruction and anomaly or representation certificates |
| Thermodynamics | Pathwise arrow when certified | Appendix O common path measure and positive entropy-production hypotheses |
| **Vacuum symmetry** | **Monster group $\mathbb M$ on the selected VOA branch** | **Accepted Leech/VOA selection and automorphism certificates** |

These rows are branch-indexed outputs, not consequences of SPAP entropy or PCE alone. No common microscopic origin follows merely from their coexistence.

### P.13.19.3 What the Monster Represents

The Monster group $\mathbb M=\operatorname{Aut}(V^\natural)$ is the complete automorphism group of the Moonshine VOA on the P.13.27 branch. Its elements preserve the vacuum vector, conformal vector, grading, and vertex-operator product of $V^\natural$, and therefore preserve the graded character and the associated Moonshine-module structure.

This theorem does not identify the matrix attractor $\rho_0=\frac12I_2\oplus0_6$ with the VOA vacuum vector, does not derive $\mathbb M$ as its stabilizer, and does not make $\mathbb M$ a spacetime symmetry. Those physical identifications require an explicit realization homomorphism and a proof that it preserves the retained response algebra.

---

## P.13.20 Conclusion: The Conditional Monster Branch

The foundational operational step is theorem-supported on its declared class: Theorem P.6.1c.3 and Corollary P.6.1c.4 identify prediction as the canonical normal form of a finite self-verifying presentation. On the intersection of the further declared Moonshine-branch hypotheses, the mathematical endpoint is then the Monster group. The required inputs include the exact-scale, two-dimensional, and chiral-$24$-boson branches; the admissible-candidate and cost comparison of Proposition P.13.6.4; the modular hypotheses of Proposition P.13.6.5; the fixed-normalization even-unimodular rank-$24$ carrier and finite Gaussian-cost certificate; the registered-controller criterion used to exclude positive-dimensional weight-one symmetry; and the involutive standard-lift orbifold realization. Given those inputs, the lattice and VOA classification results and the Frenkel–Lepowsky–Meurman construction identify
$$
V^\natural,
\qquad
\operatorname{Aut}(V^\natural)=\mathbb M.
$$

The philosophical significance is threefold:

**First**, the branch extends the canonical predictive-normal-form foundation through a fully registered conditional chain to an exceptional vacuum-symmetry construction.

**Second**, it supplies a conditional physical interpretation of the established Monstrous Moonshine correspondence.

**Third**, it illustrates how PCE compares candidates after an admissible class, benefit ledger, propagation ledger, and operational-cost ledger have been specified.

The conclusion is an exact framework-to-mathematics identification on the declared Moonshine branch. It does not establish that the Moonshine branch, its controller realization, or the Monster symmetry follows from SPAP or PCE alone or occurs in every physical realization.

## P.14 Epistemic Status of PCE

The derivations throughout this framework rely on the Principle of Compression Efficiency (PCE, Definition 15). This section clarifies the epistemic structure of that reliance, distinguishing logical necessities from optimization hypotheses, and documenting the comparison with observation.

### P.14.1 The Theorem–Hypothesis Distinction

The framework contains three categorically different types of claims:

**Logical and structural necessities.** These are theorems following deductively from definitions, finite-memory SPAP structure, and already stated physical-instantiation principles:

| Claim | Status | Derivation |
|:------|:-------|:-----------|
| SPAP impossibility | Theorem | Theorems 10–11, on their diagonal-closed coded class |
| Binary convex SPAP closure | Physical principle + theorem | Principle 11b requires invariant convex closure in every fixed-retained-data fibre; Theorem 11b uniquely gives $q(\phi\mid R)=1/2$ and $H(\Phi\mid R)=\ln2$ |
| Full-context return channel $\mathcal G$ | CPTP construction | Equations (7.1.3a)–(7.1.3b); exact Kraus completeness and two-to-one Commit Snapshot fibres |
| Full-context physical reset bound $\varepsilon_{\mathrm{reset}}\ge\ln2$ | Conditional physical theorem | Theorem 31a under Definition 28's registered thermal cycle and no-retained-copy condition |
| $K_0=3$ and $N_{\mathrm{vis}}^{\min}=8$ | Physical principle + theorem | Principle 5b, Lemma 5b, and Theorem 15a |
| $\mathcal H_0\cong\mathbb C^8$ and Born/instrument closure | Physical principle + theorem | Principles 8.0b–8.0c and Theorem 8.0d |

**Selection principles and quotient theorems.** These specify how physically instantiated structures are compared when several implementations realize the same finite protocol responses:

| Claim | Status | Basis |
|:------|:-------|:------|
| PCE (Definition 15) | Axiom | Resource minimization subject to predictive viability |
| PCE dominance | Theorem | Dual-certificate preorder and no-surplus branch elimination (Theorem D.1d) |
| PPI operational quotient | Theorem on finite operational quotient | Operational Yoneda reconstruction on the PPI-admissible image; compact response-object closure from Theorem P.6.1b.8a; scalar or lexicographic bridge selection only under the corresponding hypotheses of Theorem P.6.1b.7 |
| Finite-response representation boundary | Conditional corollary | Physical content is a response-presheaf invariant only after essential realization, admissible morphism realization, and global finite cost; equal-cost multiplicity is cardinally finite only on a finite quotient or under a finite-degeneracy certificate (Corollary P.6.1b.8b) |
| Response-null overhead removal | Corollary | No-response-surplus principle (Corollary P.6.1b.8) |

**Status-carrying sector outputs.** Later numerical sectors inherit the local status label of their bridge, branch, model, convention, or certificate. The discrete backbone is theorem-level on the minimal Appendix Z / attractor branch; fine-structure normalization, electroweak thresholds, cosmological prefactors, flavor textures, baryogenesis, CC, actualization-threshold timing and metered rates, cone-saturation/universality, well-posed one-time signature selection, half-sided Borchers reflection, $D_4$ continuum witness auditing, Hilbert-carrier discharge, retained-algebra low-boundary claims, geometric naturality, second-order continuum closure, tangential/spin globality, predictive-engine rates, scrambling/Page-curve promotion, QEC compatibility and Golay-QEC bootstrap, Predictive-GSL/null-convexity saturation, self/world allocation frontiers, viable predictive-capacity envelopes, criticality-tuning claims, reflexive-charge ledgers, predictive-equivalence ledgers, becoming-flow compression, homogeneous Casimir flag-lift threshold completion, relative Gelfand-Yaglom prefactor completion, and emergent metric/channel-capacity thermodynamics retain their local ledgers. Actualization timing is promoted only by an accepted $\mathfrak C_{\mathrm{act}}$ and rate claims only by $\mathfrak C_{\mathrm{meter}}$; sector-cone coincidence beyond the explicit O.7.2.4 hypothesis is promoted only by an accepted $\mathfrak C_{\mathrm{cone}}$ or by $\mathfrak C_{\mathrm{sig}}$ for covered sectors; complex Hilbert uniqueness beyond simplex exclusion is promoted only by an accepted $\mathfrak C_{\mathrm{car}}$; protected-computation closure is promoted by a direct $\mathfrak C_{\mathrm{QEC}}$ or by a covered $\mathfrak C_{\mathrm{GQEC}}$; Einstein-branch saturation from the GSL route is promoted only with the null-convexity/zero-slack records of §12.5.4; criticality is promoted only by $\mathfrak C_{\mathrm{crit}}$; and predictive-equivalence compression never replaces the separate sector certificates it projects.

### P.14.2 Structural Alphabet versus Physical Reset Ledger

The declared minimal verification/reset-support alphabet is binary and therefore has structural log-cardinality
$$
\boxed{\varepsilon_0=\ln2.}
$$
For a concrete registered reset, however,
$$
\boxed{
\varepsilon_{\mathrm{reset}}
:=\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}},
\qquad
\varepsilon_{\mathrm{diss}}\ge0.
}
$$
Here $R$ includes every classical record retained and unchanged through reset. The structural value is not a universal bath-heat or total-entropy-production floor. Larger alphabets and additional dissipation belong to their own implementation ledgers; no PCE rule may delete response-relevant side information from $R$.

**Convention P.14.1a (Manuscript-Wide Status Classes and Parameter Roles).** Every major PU claim has a primary status label and every numerical or symbolic quantity used in a reported output has a parameter-role label. The status label records what kind of claim is being made. The parameter-role label records what the quantity does inside the derivation or comparison. When a short table cell cannot display the full record, it may use a combined label such as **conditional theorem / model layer**; the full dependency statement in the cited section controls the claim.

| Status | Dependency-record criterion |
|:-------|:-----------------------------|
| **Theorem** | proved from prior theorem-level or axiomatic inputs, with no active bridge, branch, model, convention, empirical, identification, or open-target dependency |
| **Conditional theorem** | proved from theorem-level or axiomatic inputs plus explicitly stated bridge, branch, or sector-linking hypotheses |
| **Branch theorem** | proved after a named branch choice, normalization branch, or admissible-class restriction whose alternatives are not all internally excluded |
| **Axiom / Postulate** | foundational rule or physical-instantiation premise of the framework |
| **Hypothesis** | non-derived ontological, empirical, or physical assumption whose truth is not established internally |
| **Model layer** | depends on an ansatz, profile, texture, effective kernel, finite truncation, or unresolved quantitative construction |
| **Convention** | normalization, reference branch, bookkeeping choice, or forward-evaluation convention |
| **Final calibrated theorem** | proved on a branch carrying an accepted finite spectral calibration datum $\mathfrak S_*$ in the sense of Definition V.3.11a and an accepted registry record $\zeta(S)$ in the sense of Definition P.14.1m, with coefficients fixed as branch-scaled moments of the unique $\omega_*$ of Principle V.3.11b |
| **Empirical input** | quantity imported from measurement rather than derived inside the PU chain |
| **Identification** | named interpretive or sector-linking assignment recorded explicitly as an identification rather than as a theorem |
| **Open target** | named missing theorem, computation, or bridge closure needed to upgrade status |
| **Validation target** | numerical value used only to test a forward derivation after the operator, branch, and convention choices have been fixed; it is not an input to the derivation |
| **Negative theorem** | proved obstruction excluding a proposed branch, mechanism, or reduction route |

The manuscript uses the following parameter-role classes.

| Parameter role | Meaning |
|:---------------|:--------|
| **ExactThreshold** | discrete value fixed by a theorem on a stated branch or admissible class |
| **DiscreteMultiplicity** | integer count of modes, generators, generations, blocks, cells, or zero modes |
| **ThresholdData** | finite spectral, determinant, or matching data whose values enter a sector boundary condition |
| **BridgeNormalization** | normalization that transfers a theorem-level structure into a physical observable channel |
| **SchemeScale** | renormalization, matching, pole, extraction, or comparison scale |
| **CoarseGrainingScale** | scale introduced by an effective or finite-resolution coarse-grained description |
| **ReferenceConvention** | branch, prefactor, forward-evaluation, or counting convention retained for comparison |
| **PhenomenologicalKernel** | fitted or model-selected response function, texture, profile, kernel, or interpolation law |
| **SpectralMoment** | coefficient or matrix entry obtained as $s_B\langle\sigma_B\rangle_{\omega_*}$ from an accepted final spectral calibration datum, with $s_B$ fixed before comparison; not fitted after comparison |
| **EmpiricalInput** | measured number or observational inversion used as an input rather than a derived output |

A quantity may have more than one role only when its appearances are different. For example, $A_{\mathrm{eff}}^{(\mathrm{obs})}$ is an empirical inversion on a stated vacuum branch, while the Appendix U working $A_{\mathrm{eff}}$ is a forward-evaluation convention with determinant and zero-mode normalization uncertainty.

**Corollary P.14.1b (Threshold–Scaling Parameter Ontology).** The manuscript's parameter roles split as follows.

| Parameter family | Role class | Status class |
|:-----------------|:-----------|:-------------|
| $(K_0,d_0,a,b,M,k,D)$ | ExactThreshold / DiscreteMultiplicity | theorem-level on the minimal Appendix Z / attractor branch |
| $N_{\min} = 3$ (minimal admissible generation count) | ExactThreshold / DiscreteMultiplicity | theorem-level as the minimal admissible generation count in the anomaly+CP family-charge class (Theorem R.3.4, Proposition R.3.5f). Appendix R explicitly notes that $N \geq 4$ anomaly-free CP-capable extensions such as $\{a,-a,b,-b\}$ exist. |
| Exact realized $N_g = 3$ | ExactThreshold / DiscreteMultiplicity | branch theorem on the pre-flavor family-redundancy PPI branch (Proposition R.3.5.1a): response-null supernumerary family copies are quotiented out before any separate flavor-potential package is appended. |
| $(\Delta_1,\Delta_2,\Delta_3)$ | ThresholdData | canonical local/global split fixed; completed numerical values require the global flag-lift spectral problem |
| $(\mu_G,\mu_\lambda,\delta_i)$ | SchemeScale / ThresholdData | $\mu_G$ is the adopted high matching scale, $\mu_\lambda$ is the zero crossing of a specified SM RG trajectory, and $\delta_i$ are finite matching shifts; no equality $\mu_G=\mu_\lambda$ is implied |
| $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$ | BridgeNormalization / ThresholdData / SchemeScale | complete conditional Higgs-pole record; it is consumed together with a completed threshold record, and none of its entries is supplied by the gauge-threshold tuple or structural fixed-point ledger |
| $(A_{\mathrm{eff}},K,N_{\mathrm{eff}})$ | ReferenceConvention / EmpiricalInput | convention, determinant calculation, or empirical inversion depending on use |
| $\eta'$ | BridgeNormalization | fixed once Definition H.0 and the Equation H.4b operating-point normalization are adopted |
| $(L_0,A_G,m)$ | CoarseGrainingScale / PhenomenologicalKernel | $L_0$ is tied to the $g_0$ bridge scale; $A_G$ and $m$ remain phenomenological until the relaxation sector is derived or fitted |
| flavor normalizations, CKM/PMNS phases, seesaw normalizations | PhenomenologicalKernel / ThresholdData | model or conditional layer unless a cited theorem proves the specific quantity |
| final-calibrated coefficients $g_i,G,\Lambda,\mu^2,\lambda,Y_f,\kappa_\nu,\bar\theta$ | SpectralMoment | final calibrated theorem only after an accepted $\mathfrak S_*$ supplies $\mathcal A_*$, $\Omega_*$, $\nu_*$, full-support witness $\nu_*^{\mathrm{fs}}$, all independent constraint moments, unit bridges, RG/threshold route, circular-angle convention, parent-sector overlap map, and all operator symbols before comparison |
| $(\alpha,\beta,C_{\mathrm{scale}},\Gamma_0)$ and similar environment-sensitive coefficients | CoarseGrainingScale / PhenomenologicalKernel | model- and environment-dependent scaling layer |

*Proof of Corollary P.14.1b.* The first row follows from the minimal Appendix Z / attractor branch: Theorem 15 supplies $K_0=3$, Theorem 23 supplies the lower bound $d_0\ge 8$, Corollary Z.2 fixes the minimal-branch value $d_0=8$, Definition 15a fixes $\varepsilon_0=\ln2$, Theorem Z.1 supplies $a=2$, hence $b=d_0-a=6$, Theorem Z.5 supplies $M=24$, Theorem Z.13 supplies $k=12$, and Theorem Z.11 supplies $D=4$. The $N_{\min}$ row follows from Theorem R.3.4 (which classifies the anomaly-cancellation solutions $\sum F_g = 0$ and $\sum F_g^3 = 0$ admitting a physical CKM phase and identifies $\{a,-a,0\}$ with $N = 3$ as the minimal such solution) and Proposition R.3.5f (which records this minimality as the theorem-level content). The exact-realized $N_g$ row follows from Proposition R.3.5.1a, which removes response-null supernumerary family copies on the pre-flavor family-redundancy PPI branch before any separate flavor-potential package is appended. The two rows are separated because Theorem R.3.4 explicitly notes that $N \geq 4$ anomaly-free CP-capable solutions exist (for example $\{a,-a,b,-b\}$), so exact realization of $N_g = 3$ is not closed by anomaly cancellation and CP violation alone and requires the pre-flavor PPI realization theorem. The flag-lift threshold row follows from Theorem T.18, Proposition T.17a.3a, and Theorem T.69, together with the explicit remaining global spectral problem on $\widetilde X$. The matching/RG row follows from the branch-qualified Theorem T.35 and Definition T.19a; Theorems T.25--T.28, Definition T.25.2, and Theorem T.79.2 supply the separate Higgs-pole role and show that a completed threshold record must be combined with $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$, none of whose members follows from a fixed-point zero or the threshold tuple. The vacuum-prefactor row follows from Corollary U.15b, Corollary U.17a, and Proposition U.12.4a. The $\eta'$ row follows from Definition H.0, Equation H.4b, and Remark H.4. The dark-sector kernel row follows from Equation I.4 and Section I.13. The flavor-model row follows from Proposition R.3.5f and the cited Appendix T flavor constructions. The final-calibrated coefficient row follows from Definition V.3.11a, Principle V.3.11b, and Theorem V.3.11f: once $\mathfrak S_*$ and the required unit bridges and RG/threshold route are accepted, every response-active coefficient is a branch-scaled spectral moment of the unique $\omega_*$. The environment-sensitive row follows from Definition D.1 and Definition 20. Thus each listed family has a fixed role-class ledger, and exact thresholds, bridge normalizations, scheme scales, coarse-graining scales, reference conventions, phenomenological kernels, spectral moments, and empirical inputs are not interchangeable. ∎

**Corollary P.14.1b.1 (No Modulus Promotion without Spectral Datum).** A continuous coefficient appearing in the effective action may be promoted from ThresholdData, BridgeNormalization, ReferenceConvention, PhenomenologicalKernel, or EmpiricalInput status to SpectralMoment status only if a finite spectral calibration datum $\mathfrak S_*$, the required unit bridge, and the required RG/threshold route for that coefficient are accepted before comparison.

*Proof.* By Definition V.3.11a, the spectral datum must contain the finite calibration algebra $\mathcal A_*$, the finite atom set $\Omega_*$, invariant reference measure $\nu_*$, full-support witness $\nu_*^{\mathrm{fs}}$, independent constraint moments, and the fixed spectral symbol $\sigma_B$ of the operator whose coefficient is being promoted. By Theorem V.3.11c, these data determine a unique $\omega_*$. By Definition V.3.11e, the coefficient is then $s_B\langle\sigma_B\rangle_{\omega_*}$ at the calibration scale, with any comparison-scale value obtained only through the accepted map $\mathcal R^*_{\mu\leftarrow\mu_*}$. Without $\mathfrak S_*$, $s_B$, or the required comparison route, one of the inputs to this moment or its physical normalization is absent, so the coefficient retains its previous local status under Convention P.14.1a. ∎

**Convention P.14.1c (Paper-Wide T1/T2/T3 Uncertainty Protocol).** For any reported numerical quantity $Q$, every non-exact numerical dependency in its derivation or comparison is assigned to exactly one of the following uncertainty classes after exact theorem-level definitions are fixed.

| Category | Dependency content |
|:---------|:-------------------|
| **T1** | internal PU truncation, finite-order expansion, determinant/heat-kernel/zeta truncation, curvature/Jacobian truncation, slow-roll truncation, numerical spectral truncation, or controlled geometric approximation inside a fixed branch |
| **T2** | threshold matching, RG matching, decoupling convention, branch choice, bridge-law normalization, vacuum/regularization dependence, bounce determinant, zero-mode normalization, coarse-graining convention, or finite-volume/extensivity convention |
| **T3** | empirical input, observational extraction, pole/observable conversion, nonperturbative extraction, astrophysical/CMB mapping, target-tuple retention, phenomenological-kernel fit, or discrete identification ambiguity |

If the independent components are reported separately, the default theory uncertainty is
$$
\sigma_Q
=
\sqrt{\sigma_{Q,T1}^2+\sigma_{Q,T2}^2+\sigma_{Q,T3}^2}.
$$
If two components cannot yet be separated, the table must mark the entry as combined, place it in one displayed column, and state which unresolved pipeline would split it. If a covariance matrix is known, the replacement rule is
$$
\sigma_Q^2
=
\sum_{i,j\in\{T1,T2,T3\}}\Sigma_{ij}(Q),
$$
with the diagonal rule recovered when $\Sigma_{ij}=0$ for $i\ne j$. A zero entry means the corresponding dependency class is absent at the stated working order; it does not assert absence at all future orders.

*Proof.* The role classes in Convention P.14.1a are applied to fixed symbol occurrences. At that level, a non-exact numerical contribution is either an internal approximation within a fixed branch, an internal matching/branch/bridge/convention dependency, or an external empirical/model-identification dependency. These are exactly T1, T2, and T3. If a calculation has overlapping effects, the overlap is either decomposed into distinct numerical components or explicitly recorded as a combined entry, so no contribution is counted twice. For independent components, variance additivity gives the diagonal quadrature formula. For correlated components, the covariance formula is the finite-dimensional variance identity. The zero-entry rule follows because the table is indexed by the current dependency record and working order. ∎

**Convention P.14.1d (Prediction-Table Admissibility Rule).** A numerical row may be listed as a PU prediction only when every non-observational input used by that row is labeled theorem-level, branch-level, or convention-fixed at the same point of use. Validation targets, empirical inversions, uncomputed spectral values, phenomenological response kernels, fitted profile functions, transferred prefactors, and unresolved open targets may appear only as validation rows, model rows, consistency checks, or open targets. Any aggregate statistic over mixed-status rows must be labeled by the weakest status class included in the aggregate.

*Proof.* Convention P.14.1a assigns a status to every theorem, model, convention, hypothesis, and open target. Convention P.14.1c forbids leaving a status cell empty in a dependency record. Therefore each numerical row inherits a maximum status equal to the meet of the statuses of its inputs. A row using a validation target, empirical inversion, uncomputed spectral value, phenomenological kernel, transferred prefactor, or unresolved open target cannot have theorem-level status because replacing that input by another admissible value changes the numerical row without contradicting the prior theorem stack. The aggregate-statistic rule follows because a statistic over a set of rows inherits the weakest unresolved dependency among those rows. ∎

**Convention P.14.1e (Finite Recursive Closure Discipline).** A recursive branch package is a finite tuple
$$
\mathfrak R
=
(D_0,\mathcal R,\Sigma_{\mathrm{conv}},\Sigma_{\mathrm{tail}},\chi_{\mathrm{status}})
\tag{P.14.1e.1}
$$
where $D_0$ is a finite initial datum, $\mathcal R$ is a fixed recursion or compression map, $\Sigma_{\mathrm{conv}}$ is a convergence certificate, $\Sigma_{\mathrm{tail}}$ is any required finite-part or tail certificate, and $\chi_{\mathrm{status}}$ records the status class of each component. A recursive package is PU-internal at theorem level only if all entries of (P.14.1e.1) are derived from prior PU branch data, conventions, or theorems without validation comparison. If one or more entries are supplied as additional branch data, then every output depending on them inherits branch-package status. If any entry is chosen by empirical fit, validation target, or post-comparison selection, then every output depending on it is validation-level or model-level according to Convention P.14.1a.

A recursive representation of a smooth or continuum object does not by itself assert fractality, self-similarity, or spectral decimation. For example,
$$
z_{n+1}=z_n^2+c,
\qquad c\in\mathbb C,
$$
has no PU-governing status unless a completed recursion package supplies convergence, tail control, branch status, and—when used as physical coarse-graining—preservation of the retained finite-response quotient. Recurrence notation alone proves no macro/micro mirroring.

*Proof.* The tuple (P.14.1e.1) separates the data needed to run a recursive calculation from the theorem proving that those data are PU-internal. If $D_0$, $\mathcal R$, $\Sigma_{\mathrm{conv}}$, and $\Sigma_{\mathrm{tail}}$ are all derived before comparison, then the recursive output is an ordinary theorem-level or branch-level consequence of those prior statements. If any entry is instead supplied as independent branch data, changing that entry changes the output without contradicting the prior theorem stack, so Convention P.14.1a forces the output to inherit that branch status. If any entry is selected using validation information, Convention P.14.1d forbids promotion of the resulting numerical row to theorem-level prediction. The final sentence follows because a recursive finite presentation is a property of the chosen approximation or compression scheme, not a statement about the ontology or smoothness class of the represented space. ∎

**Theorem P.14.1f (Finite-Certificate Non-Identifiability Barrier).** Let a sector output be represented by a deterministic finite-response map
$$
F:D_{\mathrm{prior}}\times C\to \mathcal O,
$$
where $D_{\mathrm{prior}}$ is the already fixed parent datum transported through the accepted overlap maps of Definition P.14.1k.0, $C$ is the finite certificate space for the sector, and $\mathcal O$ is the retained output space with output equivalence $\sim_{\mathcal O}$. Suppose the prior theorem stack fixes $D_{\mathrm{prior}}$ but does not fix a unique output-equivalence class of certificates. If there exist two admissible certificate records $c_1,c_2\in C$ satisfying every already-stated prior constraint and
$$
F(D_{\mathrm{prior}},c_1)\not\sim_{\mathcal O}F(D_{\mathrm{prior}},c_2),
$$
then the sector output is not theorem-level determined by the prior PU branch. It can be promoted to closed status only by one of the following finite-response gates:

1. an accepted pre-comparison certificate $c_*\in C$;
2. a theorem proving that all admissible completions $c\in C$ give the same output class in $\mathcal O/\!\sim_{\mathcal O}$;
3. a no-go theorem excluding the sector candidate class from the live dependency graph.

If $c_*$ is selected using the validation observable, the output is validation-level or model-level by Convention P.14.1d.

*Proof.* Assume that $D_{\mathrm{prior}}$ alone theorem-determines a unique retained output class $[O_0]\in\mathcal O/\!\sim_{\mathcal O}$. Since $c_1$ and $c_2$ both satisfy all prior constraints and use the same transported parent datum, the same theorem must apply to both completions. Determinism of $F$ gives
$$
F(D_{\mathrm{prior}},c_1)\sim_{\mathcal O}O_0,
\qquad
F(D_{\mathrm{prior}},c_2)\sim_{\mathcal O}O_0.
$$
By transitivity of $\sim_{\mathcal O}$ this implies
$$
F(D_{\mathrm{prior}},c_1)\sim_{\mathcal O}F(D_{\mathrm{prior}},c_2),
$$
contradicting the hypothesis. Hence the prior PU branch does not determine the sector output. The three listed gates exhaust the possible closures: the first selects the finite record, the second proves that the missing choice is response-null at the output level, and the third removes the sector from the dependency graph. Any post-comparison selection uses the validation observable as part of the definition of the output, so Convention P.14.1d forbids theorem-level promotion. ∎

**Corollary P.14.1g (No Text-Only Sector Promotion).** The sectors controlled by $\mathfrak C_\alpha$, $\mathfrak R_{\mathrm{RHG}}$, $\mathfrak C_{\mathrm{tor}}$, $\mathfrak S_{\mathrm{SA}}(P)$, $\mathfrak F_U^{(4)}$, $\mathfrak B_{\mathrm{BL}}$, $\mathfrak C_{\mathrm{fl}}$, $\mathfrak J_{\mathrm{RHG-fl}}$, $\mathfrak C_{\mathrm{gen}}$, $\mathfrak Z_{\mathrm{cont}}$, $\mathfrak P_{\mathrm{AQFT}}$, $\mathfrak C_{\mathrm{EH}}$, $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, $\mathfrak C_B^{\mathrm{APSK}}$, $\mathfrak C_n^{\mathrm{KMS}}$, $\mathfrak S_{\mathrm{hor},n}$, $H_A^{\mathrm{PU}}(Z,N)$, $\Lambda_A^{\mathrm{PU}}(E)$, the hard-core perspective Gibbs datum, the RCD-Buchert-Cheeger datum, the dark-response certificate $\mathfrak X_{\mathrm{DS}}$, and the shared-control operator data $\mathfrak D_{\mathrm{PU}},\mathfrak B_{\mathrm{PU}},\mathcal R_{\mathrm{dec}}$ cannot be promoted by adding prose, status labels, proposed principles, admissibility definitions, or compatibility diagrams alone. They require the finite records named by their certificates, including their spectral data, determinant data, finite-part sums, first-order Dirac certificates, cutoff functions, sector projectors, heat coefficients, subtraction orders, finite-part scales, Higgs normalizations, Dynkin-index maps, Hessian and kernel data, orientation data, local generator maps, recovery sections, transport windows, tail bounds, covariance entries, support conditions, susceptibility kernels, overlap audits, and forward-lock ledgers.

A Kähler-Einstein normalization, an octad/Steiner/Golay character, a spectral-action slogan, a Landauer or spectral-gap statement, a Cramér-Rao-Holevo duality statement, a Bott/KO orientation statement, real $E_8$ Yukawa positivity, a retained-algebra injectivity statement, a cost-gradient SPAP bias, an acceleration-scale bridge, or a shared information-geometric control class counts as theorem-level input only when it supplies the exact finite entries demanded by the corresponding local certificate before comparison with the row being predicted. Without those entries, it is a branch label, candidate construction, compatibility check, or model-layer datum.

*Proof.* Each listed sector output is either the deterministic image of a finite certificate record or a structural row whose claimed stronger output requires a finite record. If a missing entry can be varied while preserving the transported parent datum and the output class changes, Theorem P.14.1f blocks promotion. If every admissible variation is output-equivalent, that fact is exactly the all-completions theorem allowed by Theorem P.14.1f and must be proved. If the sector candidate class is impossible, that fact is exactly the no-go gate of Theorem P.14.1f. Prose describing an admissible record fixes the type of record but does not select its finite entries. The named mechanism classes therefore do not change the closure condition: metric normalization does not by itself select an action Hessian; an octad character does not by itself supply zeta finite parts and tail intervals; a gap bound does not by itself supply compatible embeddings and local generator convergence; retained horizon injectivity does not by itself supply an exterior section or a scrambling frame-potential bound; cost-gradient SPAP bias does not by itself exclude support on the SPAP boundary; an acceleration lock does not by itself fix galaxy or cluster kernels; and a shared information-geometric control class does not by itself supply a single closed operator with sector projections and finite-part prescriptions. Hence theorem-level promotion requires an accepted finite record, an all-completions equivalence theorem, or a no-go theorem, not only a definition of what such a record would be. ∎

**Convention P.14.1h (Master Branch-Exclusion Ledger).** Every major PU output is read through the following branch-exclusion ledger. The ledger records: (i) the claimed PU output, (ii) its local status, (iii) the principal alternatives, (iv) the exclusion or quotient mechanism, (v) what is removed as response-null or PCE-dominated surplus, and (vi) the residual open status, if any.

| Output | PU value or branch | Local status | Principal alternatives | Exclusion or quotient mechanism | Quotiented or dominated surplus | Residual status |
|:-------|:-------------------|:-------------|:------------------------|:--------------------------------|:--------------------------------|:----------------|
| SPAP obstruction | Perfect self-prediction excluded | Theorem | Complete self-prediction without diagonal failure | Theorems 10-11 diagonalize the predictor against its own output | Any oracle label with no finite protocol response is response-null under PPI | Closed |
| Structural binary support | $\varepsilon_0=\ln2$ | Conditional structural theorem | Other registered alphabet sizes or reachable sets | Definition J.1 and Theorem J.1 fix the log-cardinality only for the declared reachable binary fixed-ready quotient | No claim that SPAP excludes other reset architectures | Closed on the registered binary-support branch |
| Physical reset cost | $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R)$ | Conditional physical theorem | Different ensembles, retained side information, Hamiltonians, controls, and reservoirs | Conditional Landauer under Theorem 31's implementation hypotheses | None; $\varepsilon_{\mathrm{diss}}$ remains part of the physical ledger | A positive floor and physical equality at $\ln2$ require their separate certificates |
| Horizon register | $K_0=3$ | Conditional branch theorem | Realizations outside (O1)–(O3) or (FC) | Theorem 15's visited-context count on its stated class | No exclusion of other realization classes | Closed only on the Theorem-15 branch |
| MPU Hilbert dimension | $d_0\ge8$, with $d_0=8$ on the comparator branch | Conditional representation and minimal-branch theorems | Non-Hilbert carriers, non-distinguishable contexts, or different comparison classes | Theorem 23 gives the lower bound after Hilbert distinguishability; Theorem Z.2's same-class comparator gives equality | No universal quotient of all larger carriers is asserted | Closed on the registered joint branch |
| Active kernel | $a=2$ | Theorem on structural branch | $a=1$, $a>2$ | $a=1$ cannot carry the two sharp retained match/mismatch alternatives and also violates $\ln a\ge\varepsilon_0=\ln2$; integer minimality selects $a=2$ | Larger active kernels are surplus unless they lower a certified PCE cost or change response | Closed on structural branch |
| Inactive reservoir | $b=6$ | Derived on $d_0=8,a=2$ branch | Other inactive dimensions | $b=d_0-a$ after $d_0=8$ and $a=2$ | None inside the fixed minimal branch | Closed on minimal branch |
| Interface modes | $M=2ab=24$ | QFI tangent theorem on branch | $ab$, $4ab$, $2ab\pm g$ | Complex off-diagonal $a\times b$ interface blocks contribute two real QFI directions per complex coordinate; pure gauge directions are not counted as physical interface modes | Gauge directions and stabilizer rotations are quotiented by the Bures/QFI physical tangent ledger | Closed where the QFI interface contract is accepted |
| Dimension selection | $D=4$ | Branch theorem | $D=1,2,3,5,\ldots$ | A faithful shell requires $24\le K(D)$; $K(3)=12$ excludes lower dimensions, the regular $24$-cell proves feasibility in four, and strict surplus-dimension cost selects the least feasible branch | Failed injections are inadmissible; surplus response-null dimensions are PCE-dominated | Conditional on operational-continuum and faithful-shell bridge |
| Lorentzian signature | $(1,3)$ | Branch theorem | Euclidean four-space, multi-time branches, Galilean branch | Appendix O signature package plus Corollary 46a derive the Lorentzian causal branch under the stated hyperbolic-frontier hypotheses | Non-hyperbolic or preferred-frame labels are excluded on the accepted causal-continuum branch | Conditional on Appendix O hypotheses |
| Complex Hilbert scalar | $\mathbb C$ | Theorem on MPU Hilbert branch | $\mathbb R$, $\mathbb H$ | Local tomography, connected phase transport, compositional closure, and PCE removal of surplus phase redundancy select $\mathbb C$ | Extra quaternionic phase generators are surplus if response-null; if active, they define a different gauge branch | Closed on MPU Hilbert branch |
| Born weights | $\omega(P)=\operatorname{tr}(\rho P)$ | Theorem on MPU Hilbert branch | Contextual ledgers, non-additive weights | PCE/PPI quotient enforcement removes response-null context labels; Gleason-Busch fixes the trace form | Context labels with no response difference are PPI-gauge | Closed on non-contextual finite-effect branch |
| Gauge algebra | $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$ | Finite-response block-frame branch theorem | Other block-frame partitions of $6$: $\{6\}$, $\{5,1\}$, $\{4,2\}$, $\{4,1,1\}$, $\{3,3\}$, $\{3,1,1,1\}$, $\{2,2,2\}$, $\{2,2,1,1\}$, $\{2,1,1,1,1\}$, $\{1,1,1,1,1,1\}$ | The unordered block-frame partition table of Theorem G.8.4b has exactly one capacity-saturating admissible row under $n_G\le ab=12$, namely $3+2+1$. Rows with $n_G>12$ violate the Lagrangian capacity bound; rows with $n_G<12$ are PCE-dominated in the positive-marginal regime because the $3+2+1$ row is admissible and saturates the bound. The determinant-compatible abelian response gives the retained hypercharge direction. | Response-null exact phases and surplus non-response labels are quotiented. The theorem is block-frame/interface-category uniqueness, not a classification of all compact connected subgroups of $U(6)$; irreducible tensor-product embeddings are outside this admissible family. | Closed on the finite-response block-frame anomaly/capacity branch; arbitrary-subgroup uniqueness is not claimed |
| Hypercharge | SM hypercharge vector up to normalization | Branch theorem | Other anomaly-free $U(1)$ assignments | Anomaly cancellation, Yukawa compatibility, Witten anomaly gate, and minimal charge lattice fix the SM pattern up to scale | Redundant $U(1)$ mixtures are quotiented by anomaly and charge-lattice equivalence | Overall normalization remains tied to charge-unit convention |
| Generations | $N_g=3$ | Theorem plus pre-flavor PPI realization branch | $N_g=1,2,4,\ldots$ | Anomaly balance plus CP phase requires the minimal nontrivial balanced family pattern $\{a,-a,0\}$; Proposition R.3.5.1a removes response-null supernumerary copies before the flavor-potential layer | Extra balanced pairs are surplus unless response-relevant flavor data are appended | Closed on the pre-flavor family-redundancy PPI branch; larger anomaly-free branches exist at later flavor-model cost |
| Gravity | Emergent metric/channel-capacity thermodynamics | Branch theorem/certificate stack | Fundamental metric ontology, non-saturated horizon branch, non-LTE horizon branch | Appendix E supplies finite channel capacity, min-cut horizon entropy, and area law; Section 12 supplies local KMS/LTE, Clausius, Raychaudhuri, and conserved MPU stress-energy | Non-saturating or non-LTE labels that do not change finite responses are PCE-dominated; response-changing cases are different branches | Certificate-complete on finite KMS-descent branch; conditional outside it |
| Einstein-Hilbert uniqueness | Local Einstein-equation branch | Conditional theorem on gravity bridge | Higher-curvature actions, nonlocal actions, extra low-energy fields | PCE supplies the entropy density and channel-capacity input; Lovelock/Jacobson/Wald-style locality, diffeomorphism, second-order, and Wald-density matching supply the uniqueness gate | Higher-curvature sectors are not removed by PCE alone unless they fail the stated low-energy/Wald-density gate | Conditional on the standard local metric-action assumptions (locality, diffeomorphism invariance, second-derivative restriction, Wald-density matching) |
| Black-hole information | Global conservation; local reduced thermality | Theorem plus branch result | Fundamental information destruction, permanent hidden remnant, unconditional Page claim | The closed MPU network evolves unitarily; local ND-RID contractivity is reduction over inaccessible correlations; finite min-cut holography bounds accessible entropy | Hidden response-null remnant labels are excluded by finite-budget/no-surplus gates | Page curve is conditional on approximate $k$-design scrambling |
| Fine-structure constant | Certificate-core Thomson value plus residual interval | Certificate-core branch | Retuned normalizations, post-comparison residuals | No-retuning corollary forbids response-null normalization changes after the PPI/PCE certificate is fixed | Extra normalization labels not changing response presheaves are PCE-dominated | Full theorem-level interval requires pre-comparison $R_\alpha$ certificate |
| Cosmological constant | Reference scaling branch | Model/certificate branch | Alternative scalaron maps, determinant transfers, zero-mode counts | Finite-certificate non-identifiability barrier blocks promotion without the named records | Text-only promotion is forbidden by Corollary P.14.1g | U.51, U.48, U.56, and determinant ledgers remain conditional |
| Electroweak target-shift and spectral-threshold branches | Moment-map-normalized $\gamma=1$ target-shift branch plus a separately completed flag-lift threshold branch | Target-shift theorem only after (T.22a.2)--(T.22a.3) are verified; threshold source class independently negatively closed; neither supplies the PU-to-SM quartic matching record of Definition T.25.2 | $\gamma\ne1$ target shifts; validation-selected threshold tuples; raw octad sums without spectral finite parts; spectral-action Higgs coefficients without an accepted Dirac/heat ledger | Theorem T.22b fixes $\gamma=1$ given the accepted SU(2) moment-map datum of Definition T.22a; Remark T.22c shows that the raw linear-subtracted Pauli-coordinate remainder has a nonzero cubic term and quadratic-coefficient norm $1/4$, so even projection and reservoir normalization are distinct gates. The threshold vector is theorem-level only from a completed flag-lift spectral tuple, an accepted torsion certificate, an accepted RHG record, or an accepted spectral-action transfer ledger; Theorem T.78.14 proves that none of these exists in the current PU-internal source class | Other target-shift data are different branches, not the same theorem; octad or Steiner labels without sector operators, finite parts, and tails are not threshold outputs; $\mu_H^2$ and $\lambda_H$ are not spectral-action outputs without Definition X.9.6h.4 | The moment-map datum remains branch-defining; the current threshold and spectral-action Higgs finite-part intervals are $\varnothing_{\mathrm{cert}}$ until $\mathfrak C_{\mathrm{tor}}$, the RHG certificate inside $\mathfrak R_{\mathrm{RHG}}$, an accepted $\mathfrak S_{\mathrm{SA}}(P)$, or another completed spectral tuple is supplied |
| AQFT/continuum bridge | Finite KMS/AQFT bridge package | Conditional theorem (open bridge) | Uncontrolled continuum generator limit; replacing generator convergence by a dimensionless Landauer or gap label | Hadamard, split/nuclearity, local generator, KMS-descent, and compatible embedding certificates define accepted branches | Formal continuum labels and gap slogans without local generator maps do not promote status | Theorem F.0 Condition 3 remains an open bridge condition; certificate-complete only on the F.10.12c branch or another branch supplying the same local convergence estimates |

*Proof of Convention P.14.1h.* Each row is a dependency record in the sense of Convention P.14.1a and Convention P.14.1e. If an alternative contradicts a named theorem or branch condition, it is excluded on that branch. If an alternative leaves every finite protocol-response presheaf unchanged, Theorem P.6.1b.3 identifies it in the PPI quotient and Theorem D.1d removes any strictly more costly retained representative. If an alternative changes a finite response presheaf, it is not the same physical branch and must be evaluated with its own status ledger. If the row supplies a strict PPI/PCE certificate, Definition D.8.9a and Theorem D.8.9b force the selected value modulo response equivalence. If a finite acyclic stack supplies such certificates and all overlap maps commute, Theorem D.8.9c forces the stack. If a numerical sector depends on a missing finite record, Theorem P.14.1f, Corollary P.14.1g, and Corollary D.8.9d block theorem-level promotion. These cases exhaust the ledger entries above. ∎

**Convention P.14.1i (Residual-Status Ledger).** After applying the branch-exclusion ledger, the remaining weak labels are not hidden assumptions but explicit residual gates:

| Residual gate | Correct status | Reason it is not promoted |
|:--------------|:---------------|:--------------------------|
| Hypothesis 1 | Ontological axiom | It asserts the MPU network as internally complete physical reality |
| Hypothesis 3 | Empirical/CC hypothesis | It concerns a specific consciousness-channel mechanism |
| Postulate 2 | Operational causality postulate | It fixes the causal admissibility domain used by later theorems |
| Postulate 3 | Three-branch statistical-influence contract; a late-randomized branch-(iii) Bob-marginal shift is a falsifier of the exact causal branch (Corollary 39c.1) | It is not a theorem of the finite predictive substrate |
| Identification U.51 | Model identification | $m_s=Q\bar M_{\mathrm{Pl}}$ is motivated but not uniquely forced by current PPI data |
| Assumption U.48 | Truncation/scheme assumption | $c_2=0$ is not derived by the current action ledger |
| Assumption U.56 | Registration model assumption | One e-fold per registration is a model rule, not a theorem |
| Theorem F.0 Condition 3 | Branch-discharge or open bridge condition | Local generator convergence is discharged on the projective single-clock AQFT certificate $\mathfrak P_{\mathrm{AQFT}}$ of Definition F.0e and Theorem F.0f, or on the Mosco-Bochner certificate $\mathfrak B_{\mathrm{AQFT}}$ of Definition F.0c and Theorem F.0d. Outside those branch records it requires compatible embeddings, a common local algebraic core, quasi-local comparison maps, uniform locality constants, and a Trotter-Kato or Mosco-type certificate; a uniform gap or Landauer floor is not a substitute |
| Threshold tuples, $\gamma$ branches, CRH labels, octad labels, KO-orientation labels, and real-Yukawa orientation labels | Certificate or branch data | They are theorem-level only inside the named threshold, moment-map, flavor, Fredholm, AQFT, determinant-orientation, or spectral certificate that supplies the required finite record before comparison |
| Inaccessible hidden-variable completions | Branch classification | They pass the hidden-variable gate only inside classes (QF) or (QO) of Theorem 14.4c, with $\mathrm{ns}=1$, $\mathrm{aqft}=1$, $\mathrm{op}=0$, and $\mathrm{rn}=1$. No-signaling alone is insufficient because a no-signaling profile can still be self-accessible, temporally inadmissible as a pre-commit cause, AQFT/locality-incompatible, artifact-only, or a deviating model layer |
| Recurrent integer subledger | Current-graph non-collapse decomposition | $(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4)$ is theorem-level on the minimal branch; Appendix R separates the proof graph into source roles $(\mathcal C_3,\mathcal C_{\mathrm{cap}},\mathcal C_{\mathrm{tan}},\mathcal C_{\mathrm{kis}})$ and downstream coherence invariants $(J_{\mathrm{top}},J_{\mathrm{Cl}},J_{\mathrm{ar}})$; Theorem R.3.5e.3 proves no current-source compression in that graph; a future common parent invariant remains open |
| Single inverse-Hessian realization of the four operator sectors | Inverse-Hessian branch theorem | Field response Hessian, FRG trace, perspective generator, and PCE adaptation flow are deterministic images of $\mathfrak L_W=(W''[J_*])^{-1}$ by Theorem X.8a.5; $W''$ is the connected response kernel and cannot replace the inverse effective Hessian |

*Proof.* The listed items are exactly those whose outputs can vary while preserving the prior theorem stack, or whose acceptance defines the admissible branch itself. Therefore Convention P.14.1a assigns them hypothesis, model, postulate, branch, or certificate status rather than theorem status. Corollary P.14.1g forbids promoting any such row by prose alone. ∎

**Convention P.14.1j (Identifier and Notation Collision Discipline).** Any relabeling, theorem promotion, or notation split must preserve unique identifiers within each local numbering family. In particular, a new theorem, lemma, corollary, remark, convention, definition, or postulate may share a numeral with a different object type only when the title and type differ and no existing object of the same type has the same identifier. Every occurrence of a split symbol must be routed to its structural, physical, branch, model, or validation meaning; legacy unindexed $\varepsilon$ is routed by Definition 28 and the local structural/physical context.

*Proof.* The manuscript's dependency graph is cited by identifier. If two objects of the same type share an identifier, a citation no longer determines a unique node in the proof graph. If a split symbol is left unresolved, a formula no longer determines whether it is using a structural invariant, an implementation overhead, or a validation/model input. Both failures violate Convention P.14.1a. ∎

**Convention P.14.1k (Global Strict-Certificate Ledger).** The framework's global closure is audited by the following sector-by-sector ledger. A strict-certificate sector $S$ supplies the seven entries of Definition D.8.9a: admissible candidate set $Q_S$, operational equivalence $\sim_S$, retained response presheaves $\mathcal R_S$, PCE functional $V_S$, selected representative $q_S^*$, strict separation gap $g_S$, and overlap maps $\Pi_S$. A final-calibrated sector instead supplies an accepted spectral registry record $\zeta(S)$ in the sense of Definition P.14.1m, including an accepted Definition V.3.11a datum and the associated unit bridges, RG/threshold route, and overlap maps. A sector is **closed** when every strict-certificate entry is theorem-level, or when every final-calibrated coefficient claimed by the row has an accepted $\zeta$ record, and all overlap maps commute with the previously fixed dependency graph; **certificate-pending** when at least one entry is a named accepted finite certificate or spectral-calibration record that has not yet supplied its full finite record; and **open** when at least one entry is not yet defined. The status of every later numerical row is the meet of the statuses of its parent entries.

| Sector $S$ | Selected representative $q_S^*$ | Local certificate or theorem source | Closure status |
|:--|:--|:--|:--|
| Registered binary structural reference | $\varepsilon_0=\ln2$ | Definition 28; Definition J.1; Theorem J.1 | closed on the registered binary-support branch |
| Horizon constant | $K_0=3$ | Theorem 15 | closed |
| Hilbert dimension | $d_0=8$ | Theorem 23, Theorem Z.2 | closed |
| Active/inactive split | $a=2,\ b=6$ | Theorem Z.1 | closed |
| QFI mode count | $M=24$ | Theorem Z.5 | closed |
| Predictive-recovery code dimension | $k=12$ | Definition Z.13b.0; Theorem Z.13b.0a; Theorem Z.13b | closed on the predictive-recovery MacWilliams branch |
| Spacetime dimension | $D=4$ | Theorem Z.10; Theorem Z.11; Corollary Z.11.0a | closed on the Bures tangent-cell branch |
| Gauge algebra | $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$ | Theorem G.8.4b; Corollary G.8.4c; Corollary G.8.4c.0a; Definition G.8.4c.0i; Theorem G.8.4c.0j | closed on the finite-response block-frame positive-marginal capacity branch; when module locality, saturation, abelian determinant data, global gauge form, or anomaly premises are relaxed, the surviving response-active alternatives are the bounded catalog of Theorem G.8.4c.0j rather than counterexamples to the closed branch |
| Matter package, charge lattice, and electroweak-breaking branch | response-active chiral matter package, determinant-compatible primitive hypercharge lattice, global gauge form, Higgs representation, vacuum branch, Goldstone quotient, and mass-generation map | Theorem G.8.4c.0e; Definition G.8.4c.0f; Theorem G.8.4c.0g; Corollary G.8.4c.0h; Definition X.9.5e | closed uniquely only on an accepted anomaly-bordism/PCE-gap certificate $\mathfrak C_{\mathrm{matEW}}$; otherwise the theorem-level output is the bounded response quotient $\mathcal K_{\mathrm{surv}}$ with downstream threshold consequences |
| Generation count | $N_g=3$ | Theorem R.3.4; Proposition R.3.5.1a; Theorem R.8.5b; Corollary R.8.5d; Theorem R.8.5e; Proposition R.4.2 | closed on the pre-flavor family-redundancy PPI branch with CP-active and PCE minimal-selection audit; triality/$E_8$/Leech entries are compatibility checks, while relaxed family-redundancy, CP, PCE, sterile, defect, or response-active extra-generation branches are cataloged by Theorem R.8.5e and Theorem G.8.4c.0j |
| Acceleration bridge | $\eta'=3/(8\sqrt3)$ | Definition H.4.2.8a; Theorem H.4.2.8b; Corollary H.4.2.8c | closed on the QFI linear-response bridge-law class for the scalar acceleration scale only; galaxy kernels, cluster/lensing kernels, anisotropic stress, homogeneous late-time laws, and backreaction constants require $\mathfrak X_{\mathrm{DS}}$ |
| Operational continuum manifold | $M=24,\ D=4$ shell with selected vanishing continuum defects | Theorem 43; Theorem 43.5; Corollary 43.5a; Lemma C.6d; Theorem C.6e; Lemma C.6f; Theorem D.6e; Proposition D.6f; Theorem D.6f.2; Proposition D.6f.2a; Theorem C.6c; Theorem 44a | closed on an accepted zero-defect $D_4$ gluing certificate $\mathfrak Z_{\mathrm{cont}}$ because Corollary 43.5a supplies $\mathfrak d_n^*\to0$ inside the global core-minimum class; without $\mathfrak Z_{\mathrm{cont}}$ it remains conditional on the sharp global-core competitor condition, and local $D_4$ approximants alone do not close the row by Proposition D.6f |
| AQFT route | stable local net and continuum generator | Theorem F.0; Definition F.0a; Theorem F.0b; Definition F.0c; Theorem F.0d; Definition F.0e; Theorem F.0f; Corollary F.0g; Definition F.10.12a; Theorem F.10.12c | closed on an accepted projective single-clock AQFT certificate $\mathfrak P_{\mathrm{AQFT}}$ or Mosco-Bochner certificate $\mathfrak B_{\mathrm{AQFT}}$; otherwise certificate-pending on the local generator convergence record $\mathfrak C_{\mathrm{gen}}$ for bounded diamonds, with lightcone equality an explicit branch hypothesis outside the strict single-clock route |
| Finite KMS / Wightman realization | local KMS descent, modular horizon thermodynamics, and field realization | Theorem 48a; Theorem 12.1; Definition F.10.12a; Theorem F.10.12c; Appendix G.1.9 | certificate-pending on refining finite KMS-descent records $\mathfrak C_n^{\mathrm{KMS}}$ together with faithful wedge states, spectrum condition, boost/modular convergence, Jost analyticity, and local field realization data |
| Finite bridge-site descent | vanishing finite descent obstruction or accepted defect filling | Definition X.9.5c.1; Theorem X.9.5c.2; Corollary X.9.5c.3; Definition X.9.5e; Theorem X.9.5e.1 | closed exactly when each local-to-global bridge class vanishes, is response-null, or is filled by an accepted response-active defect |
| Master zeta-index ledger | one finite spectral ledger for simultaneous numerical sectors | Definition X.9.6g; Theorem X.9.6g.1; Corollary X.9.6g.2; Corollary X.9.6g.3; Theorem X.9.6g.4 | closed for simultaneous numerical claims only when all sector projections are restrictions of one accepted master ledger and pass bridge descent |
| Shared-control operator sector | one closed predictive operator and sector projections | Definition X.8a.2a; Theorem X.8a.2b; Definition X.8a.5a; Theorem X.8a.5; Definition X.9.6a; Theorem X.9.6b; Theorem X.9.6g.4; Theorem X.9.6h.3 | closed as a maximality boundary on accepted $\mathfrak D_{\mathrm{PU}}$, $\mathfrak B_{\mathrm{PU}}$, or $\mathcal R_{\mathrm{dec}}$ branches; any independent sector operator is either response-null surplus or new branch data |
| Becoming-flow compression | one retained flow datum whose projections recover accepted reversible response, dissipative adaptation, active KKT prices, and boundary-variation readings | Definition X.8g.4; Proposition X.8g.5; Remark X.8g.6; Theorem X.8f.2; Corollary X.8g.3; Theorem Q.0.1; Corollary Q.0.1 | certificate-pending on an accepted $\mathfrak C_{\Omega}$ and its overlap audit; it compresses accepted sector laws but does not promote Hilbert-carrier, Lorentzian/cone, KMS/Clausius, spectral-calibration, or empirical protocol gates |
| Emergent metric / Einstein equation | $G_{\mu\nu}+\Lambda g_{\mu\nu}=8\pi G T_{\mu\nu}^{(\mathrm{MPU})}$ | Theorem 48a; Theorem 12.1; Corollary 12.1b; Theorem 12.1c; Theorem 12.5.3f; Corollary 12.5.3g; Theorem 12.5.3h; Definition 12.5.3k; Theorem 12.5.3k.1; Definition 12.5.3l; Theorem 12.5.3m; Definition 12.5.3n; Proposition 12.5.3o | closed as a branch theorem on an accepted finite Einstein-branch closure record $\mathfrak C_{\mathrm{EH}}$: the operational-continuum, AQFT, finite KMS, area-density, stress-flux, null-slack, second-order metric-action, and overlap-audit entries fix the emergent equation of state; $\mathfrak C_{\mathrm{PGSL}}$ supplies monotone generalized entropy, while $\mathfrak C_{\mathrm{NC}}$ and the zero-slack ledger are required for the second-variation and reversible Einstein saturation claim |
| Predictive GSL / null-convexity route | generalized entropy monotonicity plus optional null-saturation discharge | Definition 12.5.3l; Theorem 12.5.3m; Definition 12.5.3n; Proposition 12.5.3o; Corollary 12.5.3p | $\mathfrak C_{\mathrm{PGSL}}$ gives the finite retained GSL by data processing; $\mathfrak C_{\mathrm{NC}}$ is the separate second-variation gate for (76g); zero slack or conserved positive slack is recorded in the Einstein-branch closure ledger rather than inferred from monotonicity alone |
| Emergent metric fluctuations | finite-response covariance | Definition 12.1d; Theorem 12.1c; Definition 12.1d.4; Theorem 12.1e; Corollary 12.1e.1; Corollary 12.1e.2; Definition 12.1f; Theorem 12.1f.1; Theorem 12.5.3h | closed on every accepted nondegenerate finite-response gravitational channel ensemble: requires the finite KMS-descent certificate together with the smooth-envelope record, the positive Hessian on the retained tangent subspace, the certified linearization radius $r_{\mathrm{grav},n}$, the PCE fluctuation scale $\tau_{\mathrm{PCE},n}$, and zero retained modular slack when the reversible Einstein branch is claimed |
| Horizon structural conservation | retained-class injectivity of $U_n$ | Definition E.9.5d; Theorem E.9.5e; Corollary E.9.5e.1 | closed on the retained finite-response horizon algebra under injectivity of the microscopic update |
| Horizon exterior recovery / Page curve | recovery section or scrambling estimate | Definition E.9.5f; Theorem E.9.5f.1; Corollary E.9.5f.2; Definition K.3d.4; Theorem K.3d.4b; Definition K.3d.4c | retained-algebra conservation is already closed by the horizon structural-conservation row; deterministic exterior recovery is closed exactly on an accepted exterior recovery sufficiency certificate $\mathfrak S_{\mathrm{hor},n}$; Page-purity estimates require an accepted moment/frame-potential design certificate, and von Neumann Page-curve estimates additionally require a trace-continuity promotion certificate; absent those finite records this row remains certificate-pending |
| Horizon transfer spectroscopy | $\operatorname{dist}_{2\pi}(x,N\ln2)\le\varepsilon_{\mathrm{peak}}$ around exact central labels $[N\ln2]_{2\pi}$ | Definition Q.0.7u; Lemma Q.0.7v; Proposition Q.0.19; Proposition Q.0.20; Proposition Q.0.20b.1; Remark Q.0.20b.2; Theorem Q.0.20b.3 | closed only on an accepted finite horizon transfer record $\mathfrak T_{\mathrm{hor}}$ deriving the normalized thermal coordinate, loop time, MPU-cycle phase, transfer domain, and phase tolerance from horizon scattering data; amplitudes, widths, greybody factors, and nonresonant envelopes remain separate scattering outputs |
| Thomson-limit $\alpha^{-1}$ | $\alpha_0^{-1}$ closed core; diagnostic hypercharge-recoil comparison row (operator realization open) $\alpha_{\mathrm{cand}}^{-1}=\alpha_0^{-1}+R_{\alpha}^{YR\perp}=137.03599917753023\ldots$ | Definition Z.27.11a; Theorem Z.26; Corollary Z.26a; Theorem Z.27.11c; Remark Z.26d; Corollary Z.26d.1; Definition Z.27.11j; Theorem Z.27.11j.1; Definition Z.27.11k; Theorem Z.27.11k.1; Definition Z.27.11k.12; Theorem Z.27.11k.20; Corollary Z.27.11k.21; Corollary Z.27.11k.21.1 | $\alpha_0^{-1}$ is closed on the Appendix Z exact-sinc core branch; the candidate hypercharge-recoil record (operator realization open) fixes $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$ as a degenerate $\textsf{bound}$ residual entry in the conditional diagnostic registry; the passive-complement downgrade gives $[137.03599917502362\ldots,137.03599917878353\ldots]$; the canonical comparison-budget scale $B_{\mathrm{budget}}^{\mathrm{can}}=5.649085604\times10^{-5}$ and the composition audit remain diagnostics, not additional residual contributions |
| Cosmological constant exponent | $\kappa=142$ on the four-mode false-vacuum branch | Theorem U.13b | closed for the exponent on the four-mode false-vacuum branch under the stated spectral hypotheses |
| Cosmological constant five-mode reference exponent | $\kappa_{\mathrm{ref}}=141.5$ | Appendix U reference-counting convention; Theorem U.8c | reference convention; not theorem-level without the dilation/Fredholm certificate |
| Cosmological constant prefactor | $A_{\mathrm{eff}}^{\mathrm{Fred},4}$ | Definition U.15d; Theorem U.15e; Corollary U.15f; Theorem U.15i.2; Theorem U.15l; Definition U.15m; Theorem U.15m.1; Definition U.73e; Theorem U.73f | classified by Theorem U.73f: the multiplier $8\pi e^{-284}=1.1497594801473928\times10^{-122}$ is exact, while the current forward interval is $\varnothing_{\mathrm{cert}}$ until an accepted four-mode Fredholm record supplies the Hessian, zero-mode, negative-mode, ghost, finite-volume, measure, determinant, finite-part, Bismut-Lebeau-transfer if used, and tail entries on one branch |
| Primordial determinant and inflation branch | $Q$, $A_s$, $n_s$, $r$, $n_t$, running, and $f_{NL}^{\mathrm{local}}$ | Definition U.26b; Theorem U.26c; Definition U.41a; Theorem U.41b; Definition U.44b; Theorem U.44c; Definition U.48a; Theorem U.48b; Definition U.51a; Definition U.56a; Theorem U.69; Definition U.69a; Theorem U.69b | current full interval vector is $\varnothing_{\mathrm{cert}}$; leading numerical values are branch-comparison data until an accepted $\mathfrak P_{\mathrm{prim}}$ fixes the determinant convention, rank budget, kinetic normalization, scalaron map, local-equilibrium truncation including $c_2=0$, e-fold registration, initial field, trans-horizon quotient, and residual intervals |
| Electroweak threshold and spectral-action Higgs finite parts | $\Delta_{\mathrm{EW}}$, $Z_i=1+\Delta_i/24$, and, only on an accepted spectral-action branch, $(\mu_H^2,\lambda_H)$ | Definition T.78.5a; Theorem T.78.5b; Definition T.78.6; Algorithm T.78.6a; Theorem T.78.7; Definition T.78.10; Theorem T.78.11; Theorem T.78.12; Theorem T.78.14; Definition X.9.6g; Theorem X.9.6g.4; Definition X.9.6h.4; Theorem X.9.6h.5; Corollary T.79.8d; Definition X.9.6g.7; Theorem X.9.6g.8 | current PU-internal source class is negatively closed by Theorem T.78.14, so the registry value is $\varnothing_{\mathrm{cert}}$ for $\Delta_i$, $Z_i$, $\mu_H^2$, $\lambda_H$, and gauge/Higgs finite parts; positive closure requires an accepted $\mathfrak R_{\mathrm{RHG}}$, accepted $\mathfrak C_{\mathrm{tor}}$, accepted $\mathfrak S_{\mathrm{SA}}(P)$, accepted equivalent spectral tuple, or accepted joint $\mathfrak J_{\mathrm{RHG-fl}}$ fixed before comparison and descending from one master zeta-index ledger when shared |
| Flavor parameter vector | $\Pi_T$ | Definition T.79.4; Algorithm T.79.5; Theorem T.79.6; Definition T.79.8a; Theorem T.79.8b; Corollary T.79.8d; Theorem T.79.8e; Definition X.9.6g.7; Theorem X.9.6g.8 | closed on an accepted flavor certificate $\mathfrak C_{\mathrm{fl}}$ together with an accepted threshold record, or on an accepted joint $\mathfrak J_{\mathrm{RHG-fl}}$; otherwise the certified interval vector is $\varnothing_{\mathrm{cert}}$, since gauge algebra plus $N_g=3$ fixes the representation skeleton but not flavor numerics, determinant orientation, Majorana/seesaw data, or $\bar\theta$ |
| Nuclear aggregate sector | finite nuclear Hamiltonian, colorless boundary impedance, spin-current, transition, decay, open-channel, covariance, and Appendix T overlap package | Theorem T.79a; Corollary T.79a.1; Theorem T.79a.2; Definition X.8k.5; Theorem X.8k.6; Definition X.8k.6a; Theorem X.8k.6b; Theorem X.8k.6c | certificate-pending on an accepted $\mathfrak B_A^{\mathrm{nuc}}$ for every claimed isotope or decay chain; Appendix T elementary data $\Pi_T$ fix elementary inputs but do not determine nuclear many-body operators, boundary impedances, spin currents, transition operators, decay operators, exterior channels, or nuclear covariance ledgers |
| Baryon asymmetry $\eta_B$ | finite transport image | Definition Y.11.7a; Theorem Y.11.7b; Definition Y.11.7e; Theorem Y.11.7f; Theorem Y.11.7h; Definition Y.6.1a; Theorem Y.6.1b; Definition Y.6.1c; Theorem Y.6.1d | closed on an accepted $\mathfrak C_B$, accepted transport certificate $\mathfrak C_B^{\mathrm{tr}}$, or accepted APS-Kubo certificate $\mathfrak C_B^{\mathrm{APSK}}$ fixing the electroweak threshold record, flavor/CP record or accepted flavor-independent CP substitute, sphaleron generator, APS eta/index data, finite baryon-number generator, CP Kubo pairing, transport window, washout/freeze-out profile, quadrature and tail ledger, photon normalization, coefficient normalization, no-double-counting audit, and residual interval before comparison; otherwise the current output is the finite branch classification of Theorem Y.11.7h |
| Environmental SPAP passive tier | hard-core perspective Gibbs kernel | Definition 14.5.8e; Theorem 14.5.8f; Corollary 14.5.8g; Propositions 14.5.8b--14.5.8d; Theorem M.10.3; Theorem M.10.4; Corollary M.10.4.1 | theorem-level only on the hard-core perspective Gibbs branch; the endpoint obstruction uses Theorem M.10.4, while finite recovery-limit boundary charging would additionally require a separate interpolation-realization theorem not supplied by Corollary M.10.4.1; outside those data the passive tier remains conditional model-layer because cost-gradient bias and weak limits do not imply support exclusion |
| Dark-sector response kernels | acceleration bridge plus galaxy, lensing, cluster, and homogeneous kernels | Definition H.4.2.8a; Theorem H.4.2.8b; Corollary H.4.2.8c; Equation I.4; Equations I.7--I.8; Theorem I.5; Definition I.13a; Proposition I.13b; Remark I.13c; Definition I.13d; Theorem I.13e | the acceleration scale is closed on the bridge branch; galaxy, lensing, cluster, merger, local-gravity, CMB-era, and homogeneous late-time kernels are theorem-level exactly when they are deterministic images of an accepted generally covariant effective-action or dark-susceptibility certificate $\mathfrak X_{\mathrm{DS}}$ fixed before comparison; $(A_G,m)=(7,3)$ remains a preregistered backbone-motivated benchmark pair unless such a kernel-forward-lock certificate is supplied; $L_0$, $(K,q,A_{\mathrm{PM}})$, anisotropic stress, and $\Theta_{\mathrm{hom}}$ remain phenomenological without that record |
| Late-time backreaction | RCD-Buchert-Cheeger estimate | Definition I.3e; Theorem I.3f; Theorem I.3i; Corollaries I.3g--I.3j; Definition I.13d; Theorem I.13e | closed exactly when $\mathfrak X_{\mathrm{DS}}$ supplies the RCD-Buchert-Cheeger datum, elliptic scale bridge, predictive-stress variance, source-energy rate density, homogeneous conservation law, and finite defect budgets; otherwise these constants remain branch data |
| Recurrent integer subledger | current-graph non-collapse decomposition of $(K_0,d_0,\varepsilon_0,a,b,M,k,D)$ with marked arena rigidity | Proposition T.59; Corollary T.59a; Proposition R.3.5e; Remark R.3.5e.1; Proposition R.3.5e.2; Theorem R.3.5e.3; Corollary R.3.5e.4; Remarks R.3.5e.5–R.3.5e.6; Definition Z.35d; Theorem Z.35e | closed as a non-collapse decomposition: the exact tuple is theorem-level on the minimal branch, the marked arena hierarchy is unique under Definition Z.35d, and no current-source compression exists in the stated proof graph; a future common parent invariant remains open |
| CC influence | bounded protocol response; binary-saturating backbone representative available as a resonance-motivated model branch | Definition 13.0a; Definition 13.0d; Theorem 13.0e; Theorem 39; Theorem 39a; Definition 32a; Proposition 35a; Corollary 35a.1 | open until a forward-locked protocol package satisfying $\chi_{\mathrm{pred}}$ is entered; the representative scaling is admissible on branches whose endpoint-bias ceiling admits $3/8$ (strictly stronger than the universal Theorem 39 bound $\alpha_{CC,max}<1/2$) but is not a unique theorem-level closure |
| Actualization-threshold timing | capacity-saturating local link ledger | Definition E.2a.4; Proposition E.2a.5; Definition E.2a.6; Corollary M.6.14b.1; Definition Q.0.10d.1 when absolute rate saturation is asserted | certificate-pending on $\mathfrak C_{\mathrm{act}}$; residual-budget value $C_{\max}^*=2\ln2$ is available only on the Appendix E/Q residual-budget calibration branch |
| Metered actualization rate | stationary event-rate law $\Gamma_{\mathrm{Evolve}}=\dot I_{\mathrm{acq}}/C_{\max}$ | Definition E.2a.8; Corollary E.2a.9; Remark E.2a.10; Definition E.2a.6 | certificate-pending on $\mathfrak C_{\mathrm{meter}}$; $C_{\max}=\ln2$ is only a certified one-register subledger, not the universal link-cycle threshold |
| Retained-sector cone coincidence | covered sectors share the operational cone up to $\xi_{\mathrm{res}}$ | Hypothesis O.7.2.4; Definition O.7.2.5; Corollary 46a; Theorem F.0 Condition 4 | branch-level if Hypothesis O.7.2.4 is assumed directly; certificate-pending on $\mathfrak C_{\mathrm{cone}}$ when cone coincidence is supplied by a finite sector-saturation record; uncovered sectors remain outside the claimed one-cone branch |
| QEC compatibility / Golay bootstrap | protected finite computation below a certified threshold | Definition A.0.1q; Definition A.0.1q.1; Theorem A.0.2; Theorem A.0.2a; Corollary A.0.2b; Theorem A.0.6; Proposition Z.13b.7 | certificate-gated on $\mathfrak C_{\mathrm{QEC}}$ or, on covered predictive-recovery Golay branches, discharged by $\mathfrak C_{\mathrm{GQEC}}$; the Golay CSS witness supplies code structure, but physical syndrome maps, recovery maps, threshold inequality, protected gates, and PCE benefit gap must still be recorded |
| Hilbert-carrier discharge | sharp homogeneous carrier with Jordan-to-complex branch selection | Definition G.1.8a; Theorem G.1.8; Corollary G.1.9; Corollary G.1.10 | non-simplexness is theorem-level only with the registered response-active incompatible sharp-observable pair of Principle 8.0b and Corollary G.1.10, since SPAP alone does not exclude a simplex; complex Hilbert uniqueness is theorem-level only on accepted $\mathfrak C_{\mathrm{car}}$ |
| Retained-algebra boundary | low-boundary statement relative to retained response algebra | Definition O.3c; Proposition O.3d; Remark O.3e | not redundant with the arrow theorem; certificate-gated on $\mathfrak C_{\mathrm{ret}}^{(q)}$ and level-relative to the observer hierarchy |
| Geometric naturality | Fisher distinguishability and Mosco-Cheeger propagation use the same finite update functor | Corollary 45b; Definition 45c; Proposition 45d | $B=\mathbb 1$ only after accepted $\mathfrak C_{\mathrm{geo}}$ and branch scale normalization; otherwise $B$ remains the comparison datum |
| Second-order positivity | covered continuum sectors have a second-order principal symbol | Hypothesis O.7.2.3; Definition O.7.2.3a; Proposition O.7.2.3b; Corollary 46a | certificate-gated on $\mathfrak C_2$; CP or finite resolution alone does not remove retained jump, nonlocal, fractional, or infinite-order sectors |
| Tangential globality | retained fermionic sectors carry a certified spin, $\mathrm{Spin}^c$, or twisted tangential structure | Theorem 48; Theorem 48b; Corollary 48b.1; Definition 48b.2; Proposition 48b.3 | strict $\mathrm{Spin}(1,3)$ product globality requires $w_1=w_2=0$ or strict-spin $\mathfrak C_{\mathrm{tan}}$; twisted branches require replacement bundle data |
| Predictive-engine rate | retained structural growth bounded by available free-energy flux | Definition B.8e; Proposition B.8f; Corollary B.8g | certificate-gated on $\mathfrak C_{\mathrm{eng}}$; equality and negligible cosmological backreaction require separate overhead-free and residual-budget records |
| Scrambling saturation | fast-scrambling/Page promotion from KMS OTOC control plus mixing/design data | Definition F.10.4b.4; Theorem F.10.4b.5; Definition F.10.4b.6a; Proposition F.10.4b.7a; Corollary E.9.5.2 | chaos bound is branch theorem under KMS/OTOC hypotheses; saturation, fast scrambling, and von Neumann Page curve require $\mathfrak C_{\mathrm{scr}}$ plus the relevant trace-continuity certificate |
| Self/world predictive complementarity | SPAP-near self-model fidelity consumes finite verification/update budget and leaves only residual external-task budget | Definition 14.1d; Proposition 14.1e; Remark 14.1f | certificate-gated on $\mathfrak C_{\mathrm{SW}}$; no universal consciousness curve or architectural saturation claim follows without the task split, shared-cost quotient, and strict allocation certificate |
| Predictive free-energy envelope | Lyapunov/PCE descent read as monotone increase of $F_{\mathrm{pred}}=-V$ and of a viable running envelope | Definition D.6.5c; Proposition D.6.5d; Lemma D.5; Theorem D.6.5a | certificate-gated on $\mathfrak C_{\mathrm{Pred2}}$; applies to the recorded expectation or running envelope, not to every lineage and not to raw thermodynamic entropy |
| Marginal predictability / criticality | distance to a critical manifold or fixed point | Definition P.8.9a.12.0c; Proposition P.8.9a.12.0d | certificate-gated on $\mathfrak C_{\mathrm{crit}}$; PCE can motivate high-susceptibility search but does not by itself prove cosmological criticality, SOC, or critical exponents |
| Reflexive charge | integer entropy-holonomy sector for closed retained predictive loops | Definition Q.0.7g.1; Proposition Q.0.7g.2; Proposition Q.0.7f; Corollary Q.0.7g | fixed-loop sector theorem under the single-valuedness and deformation-domain record; a local charge-current conservation law would require an additional continuity-equation certificate |
| Predictive equivalence | one retained update-cost ledger projected to perspective, temporal-access, action, finite-speed, or curvature readings | Definition M.6.6a; Proposition M.6.6b; Corollary O.4.3; Theorem Q.0.1; Theorem 46 | certificate-gated compression on $\mathfrak C_{\mathrm{PEq}}$; does not assert a Lorentz-group isomorphism for perspective space and does not promote Hilbert, cone, KMS/Clausius, or gravity gates |

**Theorem P.14.1k.0a (Operational Conservative-Projection Principle).** Any PU result whose proof uses only the operational core data
$$
(V_{\mathrm{PCE}},\mathcal H_0,\rho_0,\text{transition kernels},\text{branch hypotheses},\text{observable maps},\text{response presheaves})
$$
is invariant under interpretive changes that preserve those data up to natural isomorphism. Interpretive claims therefore do not function as hidden dynamical assumptions. If a claim changes finite response data, it is a branch hypothesis; if it changes no finite response data, it cannot change theorem-level predictions.

*Proof.* Naturality of operational equivalence (Corollary P.6.1b.8) identifies two descriptions that agree on all retained response presheaves. A claim that does not alter response presheaves, cost functionals, transition kernels, observable maps, or branch certificates produces no change in any retained response output and therefore no change in any theorem-level prediction derived from those outputs. Conversely, a claim that alters any of these data is a branch hypothesis by Convention P.14.1a and is audited as such. ∎

**Definition P.14.1k.0 (Overlap-Commutativity Audit).** Let $G_{\mathrm{PU}}$ be the directed dependency graph whose vertices are the sectors listed in Convention P.14.1k and whose edges point from parent sectors to child sectors. An overlap-commutativity audit for $G_{\mathrm{PU}}$ is a finite record
$$
\mathfrak O_{\mathrm{PU}}
=
(G_{\mathrm{PU}},\{\Pi_{S\leftarrow R}\}_{R\to S},\{\Omega_C\}_C)
$$
with the following entries.

1. For every edge $R\to S$, $\Pi_{S\leftarrow R}$ is the finite overlap map sending the selected representative or response presheaf of $R$ to the parent input used by the certificate of $S$.

2. For every directed commutative square or higher finite overlap cell $C$ in $G_{\mathrm{PU}}$, $\Omega_C$ is the finite equality check asserting that all routes through $C$ give the same retained response presheaf modulo the response equivalence relation of Definition D.8.9a.

3. The audit is accepted only when every $\Omega_C$ is a theorem-level equality or a finite certificate equality fixed before any child-sector validation target is used.

A sector certificate may cite parent data from Convention P.14.1k only through the corresponding accepted overlap map $\Pi_{S\leftarrow R}$. The phrase "fixed parent data" in Definition D.8.9a always means parent data transported through an accepted overlap-commutativity audit.

**Theorem P.14.1k.1 (Global Closure under the Strict-Certificate Ledger).** Suppose every sector listed in Convention P.14.1k either has closure status "closed" with theorem-level strict-certificate entries, has an accepted finite certificate filling each entry of Definition D.8.9a in its certificate-pending row, or is final-calibrated with an accepted $\zeta$ record whose spectral datum, unit bridges, RG/threshold route, and overlap maps are fixed before comparison. Suppose also that the dependency graph $G_{\mathrm{PU}}$ carries an accepted finite acyclic overlap-commutativity audit $\mathfrak O_{\mathrm{PU}}$ in the sense of Definition P.14.1k.0. Then the joint PU branch has a unique selected tuple modulo response equivalence on the strict-certificate vertices and unique final-calibrated coefficient records on the final-calibrated vertices.

*Proof.* The graph $G_{\mathrm{PU}}$ is finite and acyclic by hypothesis, with the displayed ordering of Convention P.14.1k used as the parent-before-child audit order. Choose any topological ordering of its vertices. For an initial strict-certificate vertex $S$, the hypotheses give a closed theorem-level certificate or an accepted finite certificate filling the seven entries of Definition D.8.9a. By Theorem D.8.9b this fixes $q_S^*$ uniquely modulo response equivalence. For an initial final-calibrated vertex, the accepted $\zeta(S)$ record supplies the Definition V.3.11a spectral datum, full-support feasibility witness, unit bridges, and required route; Theorem V.3.11c fixes $\omega_*$ uniquely and Definition V.3.11e with Theorem V.3.11f fixes the claimed coefficients uniquely.

Assume by induction that all parent vertices preceding a vertex $S$ have unique selected representatives or unique final-calibrated coefficient records. For every parent edge $R\to S$, the accepted audit map $\Pi_{S\leftarrow R}$ transports the already fixed parent datum to the parent datum used by $S$. For any two directed routes into the same parent datum of $S$, Definition P.14.1k.0 gives an accepted equality check $\Omega_C$, so the transported datum is independent of route modulo response equivalence. Thus the parent data of $S$ are fixed.

With fixed parent data, a strict certificate of $S$ supplies the admissible set $Q_S$, equivalence relation $\sim_S$, retained responses $\mathcal R_S$, PCE functional $V_S$, selected representative $q_S^*$, strict gap $g_S$, and overlap maps $\Pi_S$. Theorem D.8.9b then fixes $q_S^*$ uniquely modulo response equivalence. If $S$ is final-calibrated, its accepted $\zeta(S)$ record supplies the spectral datum and all coefficient bridges at the fixed parent data; Theorem V.3.11c and Theorem V.3.11f fix its claimed coefficient record uniquely. Induction over the finite topological order fixes every vertex. Theorem D.8.9c applies on the strict-certificate substack, and the accepted $\zeta$ records supply the same acyclic overlap discipline on final-calibrated vertices. Hence the combined ledger has the asserted unique selected tuple and final-calibrated coefficient records. ∎

**Corollary P.14.1k.2 (Localization of Open Closure).** If at least one row in Convention P.14.1k is open or has an unaccepted certificate-pending or final-calibration status, the global PU branch retains the meet of the listed statuses by Corollary D.8.9d and Convention P.14.1a. The closed rows above continue to deliver their selected representatives or final-calibrated coefficient records, while the unaccepted rows remain branch-, model-, certificate-pending, or validation-layer.

*Proof.* By Corollary D.8.9d the global status equals the weakest unresolved status on the live dependency graph for strict-certificate rows, and Convention P.14.1a gives the same meet discipline for final-calibrated rows whose $\zeta$ record is absent or incomplete. The closed rows of Convention P.14.1k satisfy Theorem D.8.9b or Theorem V.3.11f independently of unresolved downstream entries because the dependency graph is acyclic and they are upstream nodes. Hence their selected representatives or final-calibrated coefficient records are forced by the cited theorems regardless of unresolved certificates. The unaccepted rows fall under Theorem P.14.1f, Corollary P.14.1g, and Corollary P.14.1b.1 and cannot be promoted by prose. ∎

**Convention P.14.1l (No-Overclaim Discipline).** No sector listed in Convention P.14.1k may inherit theorem-level numerical status from a parent theorem unless every finite-response map used by that sector also has a theorem-level certificate or a closed-status entry. A theorem-level parent together with an open or certificate-pending observable map yields an open or certificate-pending child, never a theorem-level child. Equivalently, status propagation in the global ledger is by the meet rule of Convention P.14.1d on the dependency graph of Convention P.14.1k.

*Proof of consistency.* If a child sector's observable map is open or certificate-pending, then by Theorem P.14.1f at least two admissible completions of the missing finite record produce different numerical outputs while preserving every parent constraint. By Convention P.14.1d the child status is then the meet with the missing entry, which is open or certificate-pending; theorem-level promotion would require the missing record. Therefore the meet rule on the dependency graph of Convention P.14.1k is the only status assignment consistent with Theorem P.14.1f, Corollary P.14.1g, and Corollary D.8.9d. ∎

**Definition P.14.1m (Strict-Certificate Registry Schema).** A strict-certificate registry is a finite tuple

$$
\mathfrak G_{\mathrm{PU}}
=
(\mathcal V,\mathcal E,\sigma,\rho,\beta,\theta,\gamma,\delta,\zeta).
$$

The components are as follows.

1. $\mathcal V$ is the finite set of sector identifiers in Convention P.14.1k together with one identifier for each named finite certificate used by any row.
2. $\mathcal E\subseteq\mathcal V\times\mathcal V$ is the parent-to-child dependency relation. An edge $R\to S$ is present when the certificate or theorem stack of $S$ uses the selected representative, response presheaf, or finite certificate data of $R$.
3. $\sigma:\mathcal V\to\{\textsf{closed},\textsf{certificate-pending},\textsf{open}\}$ records the closure status. The status order is $\textsf{closed}\succ\textsf{certificate-pending}\succ\textsf{open}$; write $\tau_1\preceq\tau_2$ when $\tau_1$ is no stronger than $\tau_2$, so $\textsf{open}\preceq\textsf{certificate-pending}\preceq\textsf{closed}$.
4. $\rho$ assigns to each vertex a finite list of named residual entries. The empty list is allowed.
5. $\beta$ assigns to each residual entry a finite residual-control record whose kind is either $\textsf{bound}$ or $\textsf{budget}$. A $\textsf{bound}$ record is an absolute theorem-level or certificate-level residual bound. A $\textsf{budget}$ record is a comparison-budget scale and cannot by itself close a theorem-level interval.
6. $\theta:\mathcal V\to2^{\{1,2,3\}}$ assigns $\varnothing$ to closed vertices and a nonempty subset to non-closed vertices, where $1$ means an accepted finite certificate, $2$ means an all-completions equivalence theorem, and $3$ means a no-go theorem excluding the sector candidate class, as in Theorem P.14.1f.
7. $\gamma=(\{\Pi_{S\leftarrow R}\}_{R\to S},\{\Omega_C\}_C)$ is the overlap-commutativity audit of Definition P.14.1k.0, consisting of an overlap map for every edge and an equality check for every directed commutative cell.
8. $\delta:\mathcal V\to\{0,1\}$ records forward-lock status for comparison rows: $\delta(S)=1$ only when the certified interval or protocol package has been entered into the evidence register of Definition 13.0d before empirical comparison; non-comparison vertices have $\delta(S)=0$.
9. $\zeta$ assigns to each vertex either $\varnothing$ or a finite spectral-calibration record. A nonempty value has the form
$$
\zeta(S)=(\mathfrak S_{*,S},\chi_{\mathrm{USCP},S}),
$$
where $\mathfrak S_{*,S}$ is the datum of Definition V.3.11a and $\chi_{\mathrm{USCP},S}$ is the finite acceptance record listing the sealed branch identifier, $\mathcal A_*$, $\Omega_*$, atom multiplicities, automorphism orbits, the response-null quotient, the constraint functions $m_a$ and values $c_a^*$, a full-support feasibility witness for $\mathcal C_*$, the independent-constraint quotient, the accepted unit bridges $s_B$, the RG/threshold route $\mathcal R^*_{\mu\leftarrow\mu_*}$, all operator symbols $\sigma_B$ claimed by $S$, the circular-angle convention when needed, and every overlap map connecting the spectral datum to parent sectors. If $S$ is not a final-calibrated row, then $\zeta(S)=\varnothing$.

A registry is **schema-consistent** when $\mathcal E$ is finite and acyclic, $\sigma$ is meet-monotone along dependency edges except for vertices closed by an independent theorem stack or by an accepted final-calibration record, $\rho$ lists only residuals named by the cited certificates, $\beta$ records only finite expressions in named certificate data and never in validation observables, $\theta$ is nonempty exactly on non-closed vertices, $\gamma$ supplies every required overlap map and cell check, $\delta$ satisfies the forward-lock condition above, and $\zeta(S)$ is nonempty exactly for rows whose asserted status uses final spectral calibration. A nonempty $\zeta(S)$ is schema-consistent only when every field in $\chi_{\mathrm{USCP},S}$ is fixed before comparison and no field is imported from a validation observable unless the dependent row is explicitly demoted to EmpiricalInput status.

**Algorithm P.14.1m.0 (Registry Acceptance Test).** A registry $\mathfrak G_{\mathrm{PU}}$ is accepted exactly when all of the following finite checks pass.

(C1) **Closed-row consistency.** If $\sigma(S)=\textsf{closed}$, then either the local theorem stack of $S$ supplies the seven entries of Definition D.8.9a, or $S$ is final-calibrated and $\zeta(S)$ supplies an accepted finite spectral calibration record in the sense of Definition V.3.11a. Every residual in $\rho(S)$ is either evaluated exactly, controlled by a $\textsf{bound}$ record under $\beta$, or represented by a pre-comparison spectral residual symbol inside $\zeta(S)$.

(C2) **Certificate-pending-row consistency.** If $\sigma(S)=\textsf{certificate-pending}$, the finite certificate entries are named, the residual list $\rho(S)$ is enumerated, every residual has a $\textsf{bound}$ or $\textsf{budget}$ record under $\beta$, and at least one closure gate in $\theta(S)$ is targeted.

(C3) **Open-row consistency.** If $\sigma(S)=\textsf{open}$, no missing entry is supplied retroactively from a validation observable, and $\theta(S)$ is nonempty.

(C4) **Status meet rule.** For every edge $R\to S$, $\sigma(S)\preceq\sigma(R)$ unless $S$ is closed by an independent theorem stack that does not use the unresolved data of $R$.

(C5) **Overlap commutativity.** For every edge $R\to S$, $\gamma$ supplies $\Pi_{S\leftarrow R}$; for every directed commutative cell $C$, $\gamma$ supplies an accepted equality check $\Omega_C$ in the sense of Definition P.14.1k.0.

(C6) **No validation import.** For every comparison row $S$, $\delta(S)=1$ is allowed only if the row was entered before empirical comparison; otherwise the comparison remains validation-level under Convention P.14.1d.

(C7) **No-retuning enforcement.** After $\delta(S)=1$, no certificate entry, residual entry, residual-control record, finite-part convention, projector, grading, determinant-line convention, Dynkin-index normalization, Higgs normalization, matching map, tail bound, or normalization used by $S$ may be modified without changing the vertex identifier and hence defining a new branch.

(C8) **Three-gate exhaustion.** For every non-closed $S$, closing every gate in $\theta(S)$ must either supply an accepted finite certificate, prove all-completions equivalence, or exclude the candidate class by a no-go theorem.

(C9) **Residual-control status.** A $\textsf{bound}$ record may be used as an absolute residual interval only when its proof or certificate is fixed before comparison. A $\textsf{budget}$ record may be reported as a scale diagnostic but cannot promote a row to closed.

(C10) **Master-ledger and spectral-calibration projection rule.** Whenever multiple numerical sectors cite the same spectral source, the registry attaches the shared master-ledger label and records the bridge-descent obligation of Theorem X.9.6g.4 on every affected sector. An electroweak threshold or spectral-action Higgs finite-part row may cite $\mathfrak R_{\mathrm{RHG}}$, $\mathfrak C_{\mathrm{tor}}$, $\mathfrak S_{\mathrm{SA}}(P)$, $\mathfrak J_{\mathrm{RHG-fl}}$, or an equivalent completed spectral tuple only when the row records the threshold vector, $Z_i$ vector, finite-part convention, projectors, grading, tail bound, matching map, normalization map, master-ledger label, and forward-lock indicator. Whenever a sector is labelled final-calibrated, $\zeta(S)$ must contain the full Definition V.3.11a datum, the full-support feasibility witness for $\mathcal C_*$, all unit bridges and RG/threshold routes claimed by $S$, all symbols for coefficients claimed by $S$, and the overlap maps proving that the spectral datum descends from the same accepted parent branch as the sector output. Whenever a sector is labelled branch-discharged, the registry must contain the named discharge record, such as $\mathfrak Z_{\mathrm{cont}}$, $\mathfrak P_{\mathrm{AQFT}}$, $\mathfrak B_{\mathrm{AQFT}}$, or $\mathfrak X_{\mathrm{DS}}$, together with its overlap maps and finite residual interval.

(C11) **Vertex coverage and kind discipline.** Every theorem, corollary, convention, definition, finite certificate, branch condition, model layer, external input, finite-part prescription, tail bound, bridge normalization, descent obstruction, overlap map, output row, uncertainty contribution, covariance entry, and master-zeta projection cited by a status row is represented by a vertex in $\mathcal V$ with kind in
$$
\{\textsf{theorem},\textsf{certificate},\textsf{branch},\textsf{model},\textsf{external},\textsf{finitePart},\textsf{tail},\textsf{bridge},\textsf{descent},\textsf{overlap},\textsf{output},\textsf{uncertainty},\textsf{covariance},\textsf{masterZeta}\}.
$$
No output row may cite an object absent from $\mathcal V$.

(C12) **Finite-prescription lock.** Every finite-part convention, projector, grading, determinant orientation, tail bound, scheme, unit bridge, RG route, and normalization used by an accepted or forward-locked row has a prescription identifier under $\beta$ and a parent edge to every row using it. Once $\delta(S)=1$ or a dependent child is closed, changing such a prescription requires a new vertex identifier.

(C13) **Residual-bound, budget, and uncertainty separation.** Residual bounds, comparison budgets, systematic uncertainty components, statistical uncertainty components, and covariance entries are distinct categories in $\rho$ and $\beta$. A category may appear at most once in a row's uncertainty decomposition unless the covariance matrix explicitly records the overlap. A budget cannot be used as a bound, and a residual bound cannot be duplicated as an uncertainty contribution.

(C14) **Bridge-site descent.** Every local-to-global promotion has an explicit bridge-site vertex. The vertex must either carry a vanishing descent obstruction, an accepted response-null quotient, or an accepted response-active defect filling in the sense of Definition X.9.5e. A theorem row using local data without such a bridge vertex is rejected.

(C15) **Parent-data transport only through accepted overlaps.** If a child row uses parent data, the record must use the overlap map in $\gamma$ and the corresponding commutative-cell checks. Noncommuting paths into the same child datum reject the registry unless the discrepancy is recorded as a response-active branch split.

(C16) **No validation import and no hidden residuals.** Every numerical row has a finite source-origin list and a residual-exhaustion list. A residual contribution not assigned to a named source, proved response-null, or proved absent rejects the row. Any empirical input used as a calibration target is labelled $\textsf{external}$ or $\textsf{model}$ and cannot support a theorem-level status.

(C17) **Shared-source no-double-count and covariance discipline.** Threshold, flavor, RG, pole conversion, determinant, finite-part, and residual categories that share a parent source must be routed through one covariance entry or one master projection. Duplicate uncertainty categories, independent copies of one determinant tail, or separate finite-part choices for a shared source reject the registry.

(C18) **Machine-file round trip.** The markdown, YAML, or JSON implementation of $\mathfrak G_{\mathrm{PU}}$ must round-trip to the tuple $(\mathcal V,\mathcal E,\sigma,\rho,\beta,\theta,\gamma,\delta,\zeta)$ without losing vertex identifiers, status labels, parent edges, closure gates, residual kinds, finite prescriptions, overlap maps, covariance entries, master-ledger tags, or forward-lock flags. The acceptance tests are run on the parsed tuple, not on prose.

**Theorem P.14.1m.1 (Registry Soundness).** If $\mathfrak G_{\mathrm{PU}}$ is accepted by Algorithm P.14.1m.0, then every status label $\sigma(S)$ is consistent with Convention P.14.1k and the No-Overclaim Discipline of Convention P.14.1l.

*Proof.* (C1) gives either the strict-certificate hypotheses required for closed rows, invoking Definition D.8.9a with Theorem D.8.9b, or the accepted final-calibration hypotheses, invoking Definition V.3.11a, Theorem V.3.11c, Definition V.3.11e, and Theorem V.3.11f through $\zeta(S)$. (C2) and (C3) keep unresolved finite records in certificate-pending or open status, as required by Theorem P.14.1f and Corollary P.14.1g. (C4) is exactly the meet rule of Convention P.14.1l, with the accepted final-calibration exception already recorded in $\zeta$. (C5) supplies the overlap audit of Definition P.14.1k.0. (C6) and (C7) enforce the forward-lock and no-retuning requirements, including Corollary Z.27.11i in the Thomson row and the analogous branch rules in the other numerical sectors. (C8) is the three-gate exhaustion of Theorem P.14.1f. (C9) prevents comparison budgets from being mislabelled as theorem-level residual intervals. (C10) enforces the one-ledger discipline of Theorem X.9.6g.4 and the USCP acceptance discipline of Definition V.3.11a through the registry field $\zeta$. (C11) prevents hidden theorem or certificate dependencies. (C12) enforces the finite-part, projector, tail, grading, and normalization locks. (C13) and (C17) prevent budget-as-bound substitutions, duplicated uncertainty categories, and no-double-count failures. (C14) blocks silent local-to-global promotions. (C15) blocks parent-data transport except through accepted overlap maps. (C16) blocks validation import and hidden residuals. (C18) makes the registry machine-file implementation equivalent to the mathematical tuple. Therefore the registry cannot assign a stronger status than the finite records justify. ∎

**Theorem P.14.1m.2 (Registry Realization of Any Consistent Finite Ledger).** Conversely, any finite sector ledger that already satisfies Convention P.14.1k, Convention P.14.1l, Theorem P.14.1f, Corollary P.14.1g, Definition P.14.1k.0, and the sector-specific residual-control statements can be encoded as an accepted registry $\mathfrak G_{\mathrm{PU}}$.

*Proof.* Let $\mathcal V$ be the listed sectors and certificates, let $\mathcal E$ be the stated parent-to-child dependency graph, let $\sigma$ be the given status assignment, let $\rho$ be the finite residual lists, let $\beta$ be the finite residual-control records with their $\textsf{bound}$ or $\textsf{budget}$ kind, let $\theta$ be the targeted closure gates for non-closed rows, let $\gamma$ be the accepted overlap audit of Definition P.14.1k.0, let $\delta$ be the forward-lock indicator for comparison rows, and let $\zeta$ be empty off final-calibrated vertices and equal to the accepted spectral calibration record of Definition P.14.1m, carrying the Definition V.3.11a datum and its acceptance record, on final-calibrated vertices. The assumed consistency conditions are exactly (C1)--(C10), so Algorithm P.14.1m.0 accepts the registry. ∎

**Corollary P.14.1m.3 (Failure-Mode Catalog).** The registry rejects the following overclaim attempts.

(F1) Promoting a certificate-pending row to closed without the missing finite record. Rejected by (C1)--(C3).

(F2) Widening a residual interval after comparison without changing branch identifier. Rejected by (C6)--(C7) and (C12).

(F3) Selecting a normalization entry, finite part, projector, grading, tail bound, scheme, or residual-control scale using a validation observable. Rejected by (C6), (C9), (C12), and (C16).

(F4) Treating a comparison-budget scale as an accepted absolute residual interval. Rejected by (C9) and (C13).

(F5) Labelling an aggregate uncertainty theorem-level while it contains certificate-pending, validation-level, duplicated, or uncovarianced entries. Rejected by (C4), (C13), and (C17).

(F6) Sharing a spectral source across simultaneous numerical sectors without the master-ledger projection and bridge descent, or labelling a row final-calibrated without a nonempty accepted $\zeta(S)$ record. Rejected by (C10), (C14), and (C16).

(F7) Replacing a finite generator-convergence, determinant, transport, registry, bridge, or residual certificate by prose. Rejected by (C1)--(C3), (C8), (C11), and (C18).

(F8) Citing a theorem, certificate, model layer, external input, finite-part prescription, tail bound, bridge normalization, descent obstruction, overlap map, output row, uncertainty contribution, covariance entry, or master-zeta projection that has no vertex. Rejected by (C11).

(F9) Transporting parent data through a noncommuting overlap path. Rejected by (C5) and (C15).

(F10) Promoting a local certificate to a global theorem without a bridge-site descent vertex. Rejected by (C14).

(F11) Leaving a residual contribution unassigned, unbounded, unproved absent, or counted again in another residual category. Rejected by (C13), (C16), and (C17).

(F12) Sharing a determinant, zeta tail, finite-part convention, threshold source, flavor source, RG source, pole-conversion source, or residual source across sectors without one covariance or master-projection entry. Rejected by (C10) and (C17).

(F13) Changing a finite-part convention, projector, grading, normalization, tail bound, determinant orientation, or scheme after a dependent row is fixed while keeping the same branch identifier. Rejected by (C7) and (C12).

(F14) Using an empirical value as a hidden calibration target while labelling the row theorem-level. Rejected by (C6), (C16), and (C18).

(F15) Maintaining inconsistent markdown, YAML, or JSON copies of the registry. Rejected by (C18).

*Proof.* Each item is the contrapositive of the cited acceptance checks. ∎

**Remark P.14.1m.4 (Machine-Checkable Markdown/YAML/JSON Registry File).** A text implementation of $\mathfrak G_{\mathrm{PU}}$ records the same tuple in a machine-checkable file. The canonical schema is:

~~~~yaml
registry: PU
schema: P.14.1m
vertices:
  - id: sector_or_certificate_id
    kind: theorem|certificate|branch|model|external|finitePart|tail|bridge|descent|overlap|output|uncertainty|covariance|masterZeta
    status: closed|certificate-pending|open
    sources: [named theorem or definition identifiers]
    parents: [parent vertex ids]
    residuals:
      - id: residual_id
        kind: bound|budget|uncertainty|covariance
        source: named source id
        value: exact expression or interval id
        category: determinant|threshold|flavor|RG|pole|finitePart|tail|operator|bridge|statistical|systematic
    finite_prescriptions:
      finite_part: prescription_id
      projector: prescription_id
      grading: prescription_id
      determinant_orientation: prescription_id
      tail_bound: prescription_id
      normalization: prescription_id
      scheme: prescription_id
    closure_gates: [certificate|all_completions_equivalence|no_go]
    forward_lock: true|false
    zeta: null or master_zeta_record_id
    outputs: [output row ids]
    uncertainty_categories: [category ids]
    covariance_entries: [covariance vertex ids]
edges:
  - src: parent_id
    dst: child_id
    overlap_map: Pi_id
cells:
  - id: cell_id
    paths: [[edge_id_a, edge_id_b], [edge_id_c, edge_id_d]]
    equality_check: Omega_id
tests:
  - C1_closed_row_consistency
  - C2_certificate_pending_consistency
  - C3_open_row_consistency
  - C4_status_meet
  - C5_overlap_commutativity
  - C6_no_validation_import
  - C7_no_retuning
  - C8_three_gate_exhaustion
  - C9_residual_control_status
  - C10_master_ledger_projection
  - C11_vertex_coverage
  - C12_finite_prescription_lock
  - C13_residual_budget_uncertainty_separation
  - C14_bridge_site_descent
  - C15_parent_transport
  - C16_no_hidden_residual
  - C17_covariance_no_double_count
  - C18_round_trip
~~~~

The markdown implementation may use tables with the same fields; the JSON implementation uses the same keys. The acceptance suite parses the file, reconstructs $(\mathcal V,\mathcal E,\sigma,\rho,\beta,\theta,\gamma,\delta,\zeta)$, and runs checks (C1)--(C18). It rejects hidden residuals, status mixing, noncommuting overlaps, inadmissible row promotions, budget-as-bound substitutions, duplicate uncertainty categories, silent bridge assumptions, spectral-source sharing without master projection, and finite-part/projector/tail/normalization changes after a dependent sector is fixed. Because the vertex list, edge list, commutative-cell list, residual list, covariance list, and spectral-calibration records are finite, the test suite is a finite enumeration over records. ∎

**Remark P.14.1m.5 (Compression-Trajectory Schema for the Registry Snapshot).** The strict-certificate registry $\mathfrak G_{\mathrm{PU}}$ admits a registry-aligned compression-trajectory reading. The reading adds no new physical postulate, no new strict certificate in the sense of Definition D.8.9a, no new operator, no new bridge condition, and no new acceptance gate. It is methodological at the level of Convention P.14.1l.

1. *Compression step.* A compression step on the current registry snapshot $\mathcal C^{(0)}_{\mathrm{PU}}$ replaces a finite collection of accepted records by a single record from which they are recovered by composition of registered projection or restriction maps, while preserving every accepted strict certificate and every status assignment of Convention P.14.1k.
2. *Compression measure.* A registry-aligned compression measure $\mu$, defined as the cardinality of accepted records weighted by the status rank of Convention P.14.1k, takes values in a well-ordered set. A non-trivial compression step strictly decreases $\mu$.
3. *Finite-snapshot termination.* From a fixed finite snapshot, every compression trajectory terminates after finitely many steps. The terminal form is either singleton, meaning one record recovers all theorem-level rows of $\mathcal C^{(0)}_{\mathrm{PU}}$ by registered maps, or plural, meaning an irreducibly plural collection has joint recovery and no further admissible compression step.
4. *Current candidate menu within existing apparatus.* Current candidates are: the master predictive operator $\mathfrak L_{\mathrm{PU}}$ of Definition X.9.6a and Theorem X.9.6b; the master zeta-index ledger $\mathfrak Z_{\mathrm{PU}}$ of Definition X.9.6g and Theorem X.9.6g.4; the becoming-flow compression datum $\mathfrak C_{\Omega}$ of Definition X.8g.4 when its projection ledger is accepted; the marked-arena package of Definition Z.35d with rigidity by Theorem Z.35e; a future common parent invariant for the recurrent-ledger source roles in the sense of Remark R.3.5e.5; and plural termination by joint recovery from the retained candidate records.
5. *Status preservation.* The recurrent-ledger non-collapse status of Theorem R.3.5e.3 and the open status of Remark R.3.5e.5 are preserved. Every status assignment in Convention P.14.1k is unchanged, and no description-layer output is reinterpreted as a selection-layer assertion.

*Proof.* Items 1-2 are definitions on the finite registry. Item 3 is well-founded descent: $\mu$ takes values in a well-ordered set, and each non-trivial compression step strictly decreases $\mu$. Item 4 enumerates records already present in the manuscript or explicitly marked open. Item 5 follows because the schema introduces no new acceptance test and does not alter Algorithm P.14.1m.0. ∎


### P.14.4 The Derivation Chain

With $\varepsilon_0=\ln2$ and $K_0 = 3$ (the PCE-selected minima), the framework derives the following chain (Appendix Z):

$$K_0 = 3 \xrightarrow{\text{Thm 23, Cor Z.2}} d_0 = 8 \xrightarrow{\text{Thm Z.1}} a = 2$$

$$b = d_0 - a = 6 \xrightarrow{\text{Thm Z.5}} M = 2ab = 24$$

$$u^* = d_0^{1/M} - 1 = 8^{1/24} - 1 = 2^{1/8} - 1 \approx 0.09051$$

The fine-structure constant core follows from Theorem Z.26:

$$\alpha^{-1}_{0} = \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + \frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*), \qquad \operatorname{sinc}(u)=\frac{\sin u}{u}$$

The spacetime dimension follows from the channel-complete Bures tangent-cell mode-channel correspondence (Definition Z.9a; Theorem Z.11):

$$24=M\le K(D),\quad K(3)=12,\quad \mathcal C_{24}\subset\mathbb R^4\implies D_{\min}=4$$

The cosmological-constant sector splits into an exponent row and a prefactor row. The five-mode expression

$$
\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa_{\mathrm{ref}}}
$$

with $\kappa_{\mathrm{ref}}=141.5$ is the Appendix U reference convention and is obstructed as an unconditional false-vacuum closure by Theorem U.8c. On the Definition U.6 four-mode false-vacuum branch, Theorem U.13b fixes the exponent $\kappa=142$, so the forward expression is

$$
\Lambda_4L_P^2
=
8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}.
$$

The exponent is theorem-level on the stated branch; the numerical value is certificate-pending until the relative Quillen–Fredholm determinant ratio, negative-mode factor, ghost factor, collective-coordinate Jacobian, false-vacuum Hessian, finite-volume/extensivity factor, measure normalization, and residual interval are fixed by the canonical $\mathfrak F_U^{(4)}$ record. The earlier $\mathfrak F_U+\mathfrak I_U^{(4)}$ pair closes the canonical row only through an accepted embedding that additionally supplies $H_4$, $\mathcal T_4$, and every remaining field of Definition U.73e.

### P.14.5 Theoretical Predictions and Experimental Comparison

The framework generates theoretical predictions from the PCE-selected minima ($\varepsilon_0=\ln2$, $K_0 = 3$). These predictions are compared against independent experimental measurements.

**Fundamental Constants:**

| Quantity | Framework Prediction | Experimental Value | Reference | Agreement |
|:---------|:--------------------|:-------------------|:----------|:----------|
| $\alpha^{-1}$ | $\alpha^{-1}_{0}=137.03609205522863\ldots$; candidate hypercharge-recoil (operator realization open) branch $\alpha^{-1}_{\mathrm{cand}}=\alpha^{-1}_{0}+R_{\alpha}^{YR\perp}=137.03599917753023\ldots$ | $137.035999177(21)$ | Mohr et al. 2025; NIST 2024; Appendix Z | open operator-realization gate; current published comparison certificate-retrodictive |
| $D$ | $4$ | $4$ | — | exact on the Bures tangent-cell branch |
| $\Lambda L_P^2$ | five-mode reference $(2.88\pm0.03)\times10^{-122}$; four-mode exponent row $\Lambda_4L_P^2=8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}$ | $(2.86599\pm0.04849)\times10^{-122}$ | Planck Collaboration 2020a; NIST 2024; Appendix V | prefactor certificate-pending |
| $\delta/L_P$ | $\sqrt{8\ln 2} \approx 2.355$ | — | Equation Q.18 | Structural prediction |

**Electroweak Sector:**

| Quantity | Framework Prediction | Experimental Value | Reference | Agreement |
|:---------|:--------------------|:-------------------|:----------|:----------|
| $v$ (Higgs VEV) | $252\pm5~\mathrm{GeV}$ | $246.22~\mathrm{GeV}$ | Particle Data Group 2024 | $+1.2\sigma$ |
| $\sin^2\theta_W(M_Z)$ | $0.2312\pm0.0015$ on the validation run using the lifted spectral target tuple of Appendix T; Remark T.17a.4 and Proposition T.17a.5 show that sector-independent affine local truncations do not realize it, and Theorem T.78.5 proves that the current canonical ledger supplies no PU-internal spectral branch package deriving it | $0.23122\pm0.00003$ | Particle Data Group 2024 | Validation-level |
| $m_H$ | $125\pm2.5~\mathrm{GeV}$ external-RG validation value; a PU prediction additionally requires a completed threshold record plus $\mathfrak H_T=(\mathcal M_\gamma,\mathfrak M_\lambda,\mathcal C_{\mathrm{crit}},\mathcal R_{\mathrm{RG}},\mathcal C_{\mathrm{dec}},\mathcal C_{\mathrm{pole}})$ fixed before comparison | $125.25\pm0.17~\mathrm{GeV}$ | Particle Data Group 2024 | Validation-level; not an independent PU pull while $\mathfrak M_\lambda$ is open |

**CKM Matrix and Quark Mixing (Appendix T):**

| Quantity | Framework Prediction | Experimental Value | Reference | Pull |
|:---------|:--------------------|:-------------------|:----------|:-----|
| $\|V_{us}\|$ | $0.2261$ | $0.22501 \pm 0.00068$ | Particle Data Group 2024 global fit | $+1.6\sigma$ |
| $\|V_{cb}\|$ | $0.0407$ | $0.04183^{+0.00079}_{-0.00069}$ | Particle Data Group 2024 global fit | $-1.6\sigma$ |
| $\|V_{ub}\|$ | $0.00392$ | $0.003732^{+0.000090}_{-0.000085}$ | Particle Data Group 2024 global fit | $+2.1\sigma$ |
| $\delta_{\mathrm{CKM}}$ | $66.7^\circ$ | $65.72^\circ\pm1.49^\circ$ | Particle Data Group 2024 global fit | $+0.7\sigma$ |
| $J_{CP}$ | $3.22 \times 10^{-5}$ | $(3.12^{+0.13}_{-0.12}) \times 10^{-5}$ | Particle Data Group 2024 global fit | $+0.8\sigma$ |

**Neutrino Sector (Appendix T, Section T.24):**

| Quantity | Framework Prediction | Experimental Value | Reference | Pull |
|:---------|:--------------------|:-------------------|:----------|:-----|
| $\Delta m^2_{21}$ | $2.08309\times10^{-5}$ eV² | $(7.53\pm0.18)\times10^{-5}$ eV² | Particle Data Group 2024 | Not matched |
| $\Delta m^2_{31}$ | $6.66132\times10^{-4}$ eV² | $(2.453\pm0.033)\times10^{-3}$ eV² | Particle Data Group 2024 | Not matched |
| $\theta_{23}$ | $47.36340764°$ | $48.33^{+0.87}_{-1.21}°$ | Particle Data Group 2024, normal ordering | $-0.80\sigma$ |
| $\theta_{12}$ | $33.7°$ | $33.6° \pm 0.8°$ | Particle Data Group 2024 | $+0.12\sigma$ |
| $\theta_{13}$ | $8.65607149°$ | $8.54° \pm 0.12°$ | Particle Data Group 2024 | $+0.97\sigma$ (largest neutrino pull) |
| $\delta_{CP}^{PMNS}$ | $232.5°$ | $230° \pm 36°$ | Particle Data Group 2024 | $+0.07\sigma$ |
| $\sum m_\nu$ | $0.0305192$ eV | $<0.12$ eV | Planck 2020 | Conditional branch within bound |

**Fermion Mass Hierarchy (Appendix R):**

| Quantity | Framework Prediction | Experimental Value | Reference | Agreement |
|:---------|:--------------------|:-------------------|:----------|:----------|
| $\mathcal{R}_\ell$ (lepton ratio) | $3$ | $2.889$ | Particle Data Group 2024 | 3.8% |
| $N_g$ (generations) | $3$ (on the pre-flavor family-redundancy PPI branch; theorem-level $N_{\min}=3$ is the anomaly+CP minimal admissible count) | $3$ | Observed | Minimal admissible theorem-level; exact on the pre-flavor PPI branch |

**Cosmological (Appendix Y):**

| Quantity | Framework Prediction | Experimental Value | Reference | Pull |
|:---------|:--------------------|:-------------------|:----------|:-----|
| $\eta_B$ (baryon asymmetry) | illustrative factor product $\approx6.15\times10^{-10}$; no theory interval is defined until an accepted Appendix Y transport certificate fixes the forward value, residual interval, and covariance | $(6.12\pm0.04)\times10^{-10}$ | Planck 2020 | diagnostic only; no theory pull |
| $\theta_{QCD}$ (strong CP) | $0$ | $< 10^{-10}$ | nEDM bounds | Consistent |

**Statistical Summary:** The displayed standardized-residual sums are correlation-ignoring diagnostics only. No inferential $\chi^2$, number of degrees of freedom, or goodness-of-fit probability is defined without a preregistered row set, joint likelihood, covariance matrix, theory-error model, fitted-parameter count, and profiling rule. Mixed theorem-, branch-, validation-, and illustrative-status rows must not be pooled into a single fit statistic.

The displayed backbone-fed predictions trace to two structural inputs: $\varepsilon_0=\ln2$ and $K_0 = 3$, with downstream sectors retaining their local bridge, branch, convention, model, or certificate status. The derivation chains are documented in the referenced appendices.

### P.14.6 Counterfactual Analysis

If a downstream numerical sector failed, the SPAP diagonal theorem, the registered binary structural value, and the conditional reset theorem would each retain only their own stated hypotheses:

| Statement | If a downstream prediction failed |
|:----------|:----------------------------------|
| "SPAP is false" | No—SPAP is a theorem |
| "$\varepsilon_0=\ln2$ is false" | No—the structural binary quotient remains proved |
| "$\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ is false" | No—Landauer still bounds physical implementations |
| "The relevant PPI bridge or sector certificate is incomplete" | Yes—check the local bridge, normalization, spectral, branch, or model ledger |
| "PCE is false or incomplete" | Only if the realized branch demonstrably retains response-null surplus or fails the stated dominance preorder |

The structural floor is not replaced by $\ln3,\ln4,\ldots$. Those values describe larger erased registers, additional implementation overhead, or different non-minimal branches. A failed numerical prediction would therefore demote or repair the relevant sector bridge, certificate, or model layer before altering the SPAP theorem.

### P.14.7 Significance of Immediate Success

The success of the minimum values provides strong evidence for PCE:

| Observation | Implication |
|:------------|:------------|
| Registered values satisfy the joint constraints | On the conjunction of Theorem 15, Hilbert distinguishability, Theorem Z.2's same-class comparator, and Theorem Z.1's active-kernel gates, $(K_0,a,d_0)=(3,2,8)$ and hence $d_0=2a^2=2^{K_0}$; the Diophantine equality alone has other integer solutions |
| Multiple independent outputs match | Unified origin from $\varepsilon_0$, $K_0$ |
| Precision spans 5+ significant figures | Not approximate or order-of-magnitude |
| Same backbone inputs constrain all sectors | $\varepsilon_0, K_0$ generate the discrete backbone; sector-specific quantitative outputs additionally carry their stated branch, bridge-law, threshold, convention, model, or certificate inputs |
| Standardized-residual display | Diagnostic only; no goodness-of-fit claim without a declared joint likelihood and covariance model |

Had we required $\varepsilon = \ln 7.43$ to match observations, PCE would be essentially abandoned—the "minimum suffices" elegance lost, and the result would resemble parameter fitting. Instead, two structural numbers ($\varepsilon_0=\ln2$, $K_0 = 3$) generate the discrete backbone that organizes the downstream parameter sectors without erasing their local status labels.



### P.14.8 Summary

$$\boxed{
\begin{aligned}
&\textbf{Structural theorem:} \quad \varepsilon_0=\ln2,\quad \varepsilon_{\mathrm{phys}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R) \\[4pt]
&\textbf{Minimal SPAP core:} \quad K_0=3,\quad d_0\ge8,\quad d_0=8 \text{ on the minimal MPU branch} \\[4pt]
&\textbf{PCE/PPI closure:} \quad \text{response-null surplus is quotiented or PCE-dominated} \\[4pt]
&\textbf{Status-carrying outputs:} \quad \alpha^{-1},D,\Lambda,v,\sin^2\theta_W^{(0)};\ m_H,\text{ CKM, PMNS, and }\eta_B\text{ remain conditional/certificate-gated} \\[4pt]
&\textbf{Experimental tests:} \quad \text{mixed-status rows are reported separately; no aggregate goodness-of-fit statistic is claimed} \\[4pt]
&\textbf{Conclusion:} \quad \text{the discrete backbone is theorem-level on its stated branch; downstream sectors retain their local bridge, certificate, or model status labels unless promoted by an accepted final spectral calibration datum}
\end{aligned}
}$$

The compiled tests are consistent with operation near the boundary of thermodynamic possibility: minimal complexity, minimal structural logical cost, and minimal necessary structure, within the stated domains and uncertainty budgets.

### P.14.9 Meta-Theoretic Status and Comparative Adequacy

The status ledger above concerns object-level claims: assertions about physical reality or about the finite-response structures that generate physical predictions. The manuscript also contains meta-level claims about how physical frameworks are compared and how PU positions itself under that comparison. These two levels must remain separate.

**Convention P.14.9a (Object-Level / Meta-Level Separation).** A PU object-level claim is a finite-record assertion about a physical branch, response quotient, operator, sector value, or bridge map. Its status is assigned by Convention P.14.1a and audited by the registry $\mathfrak G_{\mathrm{PU}}$ of Definition P.14.1m. A PU meta-level claim is a methodological assertion about the comparison criterion for theories, the role of compression in theory choice, or PU's own positioning under that criterion. Meta-level claims may be recorded in Appendix P, the discussion, or the conclusion, but they do not create new physical sectors, constants, operators, certificates, or validation rows.

**Definition P.14.9b (Structural Description Cost).** For a theory or framework $\mathcal T$ and empirical domain $\mathcal E$, let $K_{\mathcal E}(\mathcal T)$ denote the structural description cost of producing the predictions of $\mathcal T$ on $\mathcal E$ from the admitted initial data, boundary data, and observational protocols. $K_{\mathcal E}$ is a methodological comparison proxy modeled on Kolmogorov description length, not a new physical observable. It is generally not computable exactly and is proxy-dependent in practice; comparisons using it must therefore state the shared domain $\mathcal E$ and the structural inputs counted.

**Principle P.14.9c (Comparative K-Adequacy).** If two frameworks $\mathcal T_1$ and $\mathcal T_2$ are predictively adequate on a shared empirical domain $\mathcal E$, predictive overlap alone does not establish theoretical equivalence. On the shared domain, the framework with greater predictive yield per structural description cost, or with equal yield and lower $K_{\mathcal E}$, is the better compression of the same content. Coverage outside $\mathcal E$ can justify additional structure only when it supplies additional predictive yield on the enlarged domain.

**Remark P.14.9d (Application to PU).** PU is bound by Principle P.14.9c. It cannot dismiss quantum mechanics, general relativity, the Standard Model, or any alternative framework merely by reproducing their predictions. On a shared domain, PU must either derive with lower explicit structural input what the competitor postulates, or supply additional predictive yield that justifies any additional structure. This is the methodological reading of the input-output economy statement in Section 14.6.8.

**Observation P.14.9e (Bet-Criterion Coherence).** PU's substantive framework bet is that physical reality is most efficiently modeled as predictive activity under finite-resource constraints. Principle P.14.9c evaluates theories by predictive yield per structural description cost. Thus, if PU wins the comparative $K_{\mathcal E}$ test on a domain, the criterion would have selected a framework whose subject matter is the same kind of activity that the criterion measures. This is a structural coherence between criterion and framework content. It is not evidence by itself, not a proof of correctness, and not a self-validation rule; the comparison is still empirical and relative to competing frameworks.

**Convention P.14.9f (Conservative Status of the Meta-Theoretic Layer).** The meta-theoretic layer is methodological. It does not add a branch, close a certificate, promote a model-level row, modify the strict-certificate registry, or change any status in Convention P.14.1k. Rejection or alteration of the meta-theoretic layer would not by itself affect any object-level theorem. Conversely, acceptance of the meta-theoretic layer cannot repair a failed physical prediction or fill a missing certificate.


## P.15 Source Energy: The Thermodynamic Cost of Self-Knowledge

### P.15.1 Introduction

The preceding sections establish three ledgers that must remain distinct. First, Theorem M.10.3 gives a certificate-relative asymptotic lower bound on abstract integration cost only for families carrying its pattern-specific reduction certificate. Second, Remark M.10.4 transfers that bound to a reflexive component only when an additive implementation ledger identifies the certified integration subtask with that component. Third, a heat bound follows only when Theorem M.10.7 supplies a registered-reset implementation: Theorem 31 then gives, reset by reset,
$$
\frac{Q_{j,\mathrm{bath}}}{k_BT_j}\ge H_{q_j}(P_j\mid R_j).
$$
Neither SPAP proximity nor PPI alone registers a reset, fixes a positive conditional-entropy floor, or produces heat.

This section calls the heat assigned by such a registered implementation ledger to the certified excess reflexive subtask **Source Energy**. “Source” is an attribution within that disjoint ledger; it does not assert that self-reference is a free-energy reservoir or that $\mu_S(E)>1/\alpha_{SPAP}$ by itself dissipates heat. Any recovery of usable work remains subject to ordinary first-law, gradient, and efficiency constraints.

Subsections P.15.2–P.15.6 therefore apply on the joint reduction, additive-decomposition, registered-reset, temperature, and no-double-counting branch stated in Definition P.15.2. Subsections P.15.7–P.15.8 are speculative extrapolations.

### P.15.2 Definition: The Perspectival Excess

The unconditional quantity available here is a pattern-relative, dimensionless excess in the SPAP-proximity descriptor. PU proves no uniform positive metric gap and no thermodynamic consequence from that descriptor alone; computational and heat readings require the separate certificates stated below.

**Definition P.15.1 (Perspectival Excess).** Let $S$ be a predictive system with Effective Operational Property R and self-model $\mathcal{M}_S$ (Definition M.10.1). For any processed pattern $E$, define the *perspectival excess* by
$$
\Delta_\Sigma(S;E) := \mu_S(E) - \frac{1}{\alpha_{SPAP}} \in [0,\infty],
$$
where $\mu_S(E)$ is the SPAP proximity of Definition M.10.3.

Thus $\Delta_\Sigma(S;E)$ is the excess of the dimensionless descriptor $\mu_S(E)$ above its baseline value. Under Corollary M.10.3.1's baseline-invariance hypothesis, a purely external pattern has $\mu_S(E)=1/\alpha_{SPAP}$ and hence $\Delta_\Sigma(S;E)=0$. A self-model-engaging pattern may also remain at that baseline. Whenever $\mu_S(E)>1/\alpha_{SPAP}$, $\Delta_\Sigma(S;E)>0$ definitionally. The computational lower bound of Theorem M.10.3 follows only for a certified asymptotic family, and a heat bound additionally requires Theorem M.10.7.

The symbol “$\Sigma$” is notation for this scalar descriptor. Proposition M.10.9 supplies only a conditional local comparison between registered self-model and perspective metrics; it neither identifies $\Delta_\Sigma$ with a cost functional nor converts it into entropy production.

**Theorem P.15.1a (Conditional No Uniform Positive Infimum of Perspectival Excess).** Let $S$ be a predictive system with Effective Operational Property R and self-model $\mathcal M_S$. Suppose $S$ admits a shallow self-model-engaging baseline pattern $E_0$ such that
$$
\sigma_S(E_0)>0,
\qquad
PP_S^{(E_0)}=0.
$$
Then
$$
\Delta_\Sigma(S;E_0)=0.
$$

If, in addition, $S$ admits a separate interpolation-realization theorem asserting that for every finite target value $m\in(c,\infty)$ there is an admissible self-model-engaging pattern $E$ with $\mu_S(E)=m$, then for every sequence $\eta_n\downarrow0$ of positive reals there exist patterns $E_n$ with
$$
\sigma_S(E_n)>0,
\qquad
\Delta_\Sigma(S;E_n)=\eta_n.
$$
Consequently, on such a branch,
$$
\inf\{\Delta_\Sigma(S;E):\sigma_S(E)>0\}=0,
$$
and there is no system-dependent constant $\varepsilon_S>0$ such that
$$
\Delta_\Sigma(S;E)\ge \varepsilon_S
\qquad
\text{for all }E\text{ with }\sigma_S(E)>0
$$
on that branch.

*Proof.* Let
$$
c:=\frac{1}{\alpha_{SPAP}}.
$$
By Definition P.15.1,
$$
\Delta_\Sigma(S;E)=\mu_S(E)-c.
$$
For the assumed shallow self-model-engaging baseline pattern $E_0$, $PP_S^{(E_0)}=0$. Hence $\delta_S(E_0)=\alpha_{SPAP}$ and $\mu_S(E_0)=c$ by Definition M.10.3, so $\Delta_\Sigma(S;E_0)=0$. This proves the baseline claim.

For the branchwise density claim, let $\eta_n\downarrow0$. The assumed interpolation-realization theorem gives patterns realizing every finite SPAP-proximity value in $(c,\infty)$. Therefore for each $n$ there exists a pattern $E_n$ with
$$
\mu_S(E_n)=c+\eta_n.
$$
Then
$$
\Delta_\Sigma(S;E_n)=\eta_n.
$$
The interpolation-realization hypothesis already requires the realizing patterns to be self-model-engaging, so $\sigma_S(E_n)>0$ for every $n$. This proves the branchwise infimum formula. ∎

**Corollary P.15.1b (No Thermodynamic Conclusion from Perspectival Excess Alone).** The implication $\Delta_\Sigma(S;E)>0$ is eventwise and dimensionless. It does not imply $Q_{\mathrm{src}}(S,E)>0$. On a branch carrying Definition P.15.2's registered source ledger, an event has strictly positive source heat when at least one assigned reset has $T_j>0$ and $H_{q_j}(P_j\mid R_j)>0$. A uniform positive eventwise or rate lower bound additionally requires uniform temperature, reset-count, and conditional-entropy floors. Theorem P.15.1a supplies no such physical floors.

*Proof.* Positivity of $\Delta_\Sigma$ follows from its definition. Conditional Landauer gives positive heat only for a registered reset with positive conditional entropy at positive temperature. The asserted uniform conclusions require uniform lower bounds on the factors in that reset ledger; none follows from the interpolation-realization statement of Theorem P.15.1a. ∎

### P.15.3 Formal Definition: Source Energy

The perspectival excess enters a thermodynamic ledger only through the conditional chain
$$
\mu_S(E)
\xrightarrow{\text{Theorem M.10.3 reduction certificate}}
C_{\mathrm{integrate}}
\xrightarrow{\text{Remark M.10.4 additive identification}}
C_{\mathrm{refl}}
\xrightarrow{\text{Theorem M.10.7 implementation certificate}}
\{(P_\ell,R_\ell,q_\ell,T_\ell)\}_{\ell\in J_E}
\xrightarrow{\text{Theorem 31}}
\sum_{\ell\in J_E}Q_{\ell,\mathrm{bath}}.
$$

**Definition P.15.2 (Source Energy).** Let $S$ be a predictive system with Effective Operational Property R. Suppose that during a time interval $\Delta t$, $S$ processes patterns $E_1,\dots,E_N$. A *registered source ledger* assigns to each $E_j$ under consideration:

1. the pattern-specific reduction certificate of Theorem M.10.3;
2. an additive, non-overlapping implementation ledger identifying the certified integration subtask with the excess reflexive component of Remark M.10.4;
3. a finite set $J_j$ of registered physical resets assigned only to that excess component, with reset data $(P_{j\ell},R_{j\ell},q_{j\ell},T_{j\ell})$ satisfying Definition 28 and Theorem 31.

Define the *source-energy contribution* and interval total by
$$
Q_{\mathrm{src}}(S,E_j)
:=
\sum_{\ell\in J_j}Q_{j\ell,\mathrm{bath}},
\qquad
\mathcal E_{\mathrm{src}}(S,\Delta t)
:=
\sum_{j=1}^{N}Q_{\mathrm{src}}(S,E_j).
$$
Then
$$
Q_{\mathrm{src}}(S,E_j)
\ge
k_B\sum_{\ell\in J_j}
T_{j\ell}H_{q_{j\ell}}(P_{j\ell}\mid R_{j\ell}).
\tag{P.15.2.1}
$$
If the resets assigned to event $j$ share a bath temperature $T_j>0$ and satisfy
$$
H_{q_{j\ell}}(P_{j\ell}\mid R_{j\ell})\ge h_j>0,
\qquad
n_{\mathrm{reset}}(S,E_j):=|J_j|,
$$
then
$$
Q_{\mathrm{src}}(S,E_j)
\ge
k_BT_jh_jn_{\mathrm{reset}}(S,E_j).
\tag{P.15.2.2}
$$
On a Theorem-M.10.7 family carrying constants $c_*>0$ and $\mu_*>1$ such that
$$
n_{\mathrm{reset}}(S,E_j)
\ge
c_*\log\mu_S(E_j)\,\mu_S(E_j)^2
$$
whenever $\mu_S(E_j)\ge\mu_*$, Equation (P.15.2.2) gives
$$
Q_{\mathrm{src}}(S,E_j)
\ge
k_BT_jh_jc_*\log\mu_S(E_j)\,\mu_S(E_j)^2.
\tag{P.15.2.3}
$$
For a common bath temperature $T$ and uniform conditional-entropy floor $h_{\min}>0$ on the counted resets,
$$
\mathcal E_{\mathrm{src}}(S,\Delta t)
\ge
k_BTh_{\min}
\sum_{j=1}^{N}n_{\mathrm{reset}}(S,E_j).
\tag{P.15.2.4}
$$

The set $J_j$ is empty when the registered ledger assigns no reset to an excess reflexive subtask. Emptiness is implementation-ledger data rather than a consequence of $\mu_S(E_j)$ alone. Without the three certificates above, $Q_{\mathrm{src}}$ is not assigned from $\mu_S(E_j)$. Ordinary baseline processing and resets not assigned to the certified excess remain outside this source ledger.

**Theorem P.15.3a (Uniform Lower Bound on a Fixed Certified High-SPAP/Temperature Stratum).** Fix a registered source-ledger family satisfying Definition P.15.2 with constants $c_*>0$, $\mu_*>1$, and a uniform reset-entropy floor $h_{\min}>0$. Let $\mu_0\ge\mu_*$ and $T_{\min}>0$. If a processed event $E$ satisfies
$$
\mu_S(E)\ge\mu_0,
\qquad
T_E\ge T_{\min},
$$
and its assigned reset count satisfies the Theorem-M.10.7 bound, then
$$
Q_{\mathrm{src}}(S,E)
\ge
k_BT_{\min}h_{\min}c_*\log\mu_0\,\mu_0^2.
$$
Thus every fixed *certified* stratum cut out by $(\mu_0,T_{\min},h_{\min},c_*)$ has a uniform strictly positive eventwise lower bound.

*Proof.* Definition P.15.2 and the uniform entropy floor give
$$
Q_{\mathrm{src}}(S,E)
\ge
k_BT_Eh_{\min}n_{\mathrm{reset}}(S,E)
\ge
k_BT_Eh_{\min}c_*\log\mu_S(E)\,\mu_S(E)^2.
$$
The function $f(u)=u^2\log u$ is increasing for $u\ge1$, because
$$
f'(u)=u(2\log u+1)>0.
$$
Using $\mu_S(E)\ge\mu_0\ge\mu_*>1$ and $T_E\ge T_{\min}$ proves the result. ∎

**Corollary P.15.3a.1 (Long-Run Bound on a Fixed Certified Stratum).** Let $N_S^{(\mu_0,T_{\min})}(\tau)$ count only processed events in $[0,\tau]$ satisfying the hypotheses of Theorem P.15.3a, and let $\mathcal E_{\mathrm{src},S}^{(\mu_0,T_{\min})}(\tau)$ sum their registered source contributions. Then
$$
\liminf_{\tau\to\infty}
\frac{\mathcal E_{\mathrm{src},S}^{(\mu_0,T_{\min})}(\tau)}{\tau}
\ge
k_BT_{\min}h_{\min}c_*\log\mu_0\,\mu_0^2
\liminf_{\tau\to\infty}
\frac{N_S^{(\mu_0,T_{\min})}(\tau)}{\tau}.
$$

*Proof.* Apply Theorem P.15.3a to every counted event, sum the eventwise inequalities, divide by $\tau$, and take $\liminf$. ∎

**Definition P.15.3b (Stationary Source-Principle Markov Datum).** A Source-Principle environment for $S$ carries a stationary Markov datum when the encountered event process is represented either by an irreducible positive recurrent Markov chain on a finite retained state space, or by a positive Harris recurrent Markov chain on a standard Borel retained state space,
$$
Z_j=(S_j,E_j,T_j,\Delta d_j)
$$
with invariant probability measure $\pi$, where:

1. $E_j$ is the encountered pattern;

2. $T_j$ is the local bath temperature;

3. $\Delta d_j$ is the increment in recursive self-modeling depth produced by processing $E_j$;

4. the eventwise source-energy observable is
$$
q(Z_j)=Q_{\mathrm{src}}(S_j,E_j)\ge0;
\tag{P.15.3b.1}
$$

5. $q,\Delta d\in L^1(\pi)$;

6. the event count satisfies an event-rate law
$$
\lim_{\tau\to\infty}\frac{N(\tau)}{\tau}=\nu
\tag{P.15.3b.2}
$$
almost surely, with $\nu\ge0$.

**Theorem P.15.3c (Ergodic Source-Energy Rate).** On a branch carrying a stationary Source-Principle Markov datum,
$$
\lim_{\tau\to\infty}
\frac{\mathcal E_{\mathrm{src}}(S,[0,\tau])}{\tau}
=
\nu\int q\,d\pi
\tag{P.15.3c.1}
$$
almost surely. In particular, the long-run source-energy rate is strictly positive if and only if
$$
\nu>0
\qquad\text{and}\qquad
\int q\,d\pi>0.
\tag{P.15.3c.2}
$$

Suppose, in addition, that the retained event state space is finite, the transition matrix $K$ is irreducible, and
$$
K_\lambda(z,z')=e^{\lambda q(z')}K(z,z').
\tag{P.15.3c.3}
$$
Let $r(\lambda)$ be the Perron root of $K_\lambda$. Then the event-indexed scaled cumulant generator exists for every $\lambda\in\mathbb R$ and is
$$
\Lambda_{\mathrm{src}}(\lambda)=\log r(\lambda).
\tag{P.15.3c.4}
$$
The empirical event average $n^{-1}\sum_{j=1}^nq(Z_j)$ satisfies a large-deviation principle with good rate function
$$
I_{\mathrm{src}}(s)
=
\sup_{\lambda\in\mathbb R}
\{\lambda s-\Lambda_{\mathrm{src}}(\lambda)\}.
\tag{P.15.3c.5}
$$
This large-deviation conclusion is event-indexed; a time-indexed LDP additionally requires large-deviation control of $N(\tau)$.

*Proof.* By Definition P.15.2,
$$
\mathcal E_{\mathrm{src}}(S,[0,\tau])
=
\sum_{j=1}^{N(\tau)}q(Z_j).
$$
The strong law for finite irreducible Markov chains [Levin & Peres 2017] and the positive-Harris strong law of Meyn and Tweedie (2009, *Markov Chains and Stochastic Stability*, 2nd ed.) give, on their respective branches and for the $\pi$-integrable observable $q$,
$$
\frac1n\sum_{j=1}^{n}q(Z_j)
\longrightarrow
\int q\,d\pi
$$
almost surely. If $N(\tau)\to\infty$, then
$$
\frac{\mathcal E_{\mathrm{src}}(S,[0,\tau])}{\tau}
=
\frac{N(\tau)}{\tau}
\left(\frac1{N(\tau)}\sum_{j=1}^{N(\tau)}q(Z_j)\right)
\longrightarrow
\nu\int q\,d\pi.
$$
If $N(\tau)$ remains bounded, monotonicity of the event count makes it eventually constant, so the numerator is eventually constant and its ratio to $\tau$ tends to zero; the event-rate law then has $\nu=0$. These cases prove (P.15.3c.1). Both factors on the right are finite and nonnegative, so their product is positive exactly when both are positive, proving (P.15.3c.2).

On the finite branch, $q$ is bounded and $K_\lambda$ is an irreducible nonnegative matrix with the same zero pattern as $K$. The Perron--Frobenius theorem of Perron (1907) and Frobenius (1912) gives $r(\lambda)>0$ and a vector $v_\lambda$ with strictly positive coordinates such that
$$
K_\lambda v_\lambda=r(\lambda)v_\lambda.
$$
Let $v_{\min}$ and $v_{\max}$ be the smallest and largest coordinates of $v_\lambda$. Componentwise,
$$
\frac{v_\lambda}{v_{\max}}
\le\mathbf1
\le
\frac{v_\lambda}{v_{\min}}.
$$
Multiplication by the nonnegative matrix $K_\lambda^n$ gives
$$
\frac{r(\lambda)^n}{v_{\max}}v_\lambda
\le
K_\lambda^n\mathbf1
\le
\frac{r(\lambda)^n}{v_{\min}}v_\lambda.
$$
For any initial distribution $a$, the exponential moment is
$$
\mathbb E_a\exp\!\left(\lambda\sum_{j=1}^{n}q(Z_j)\right)
=a^TK_\lambda^n\mathbf1.
$$
The preceding bounds sandwich this quantity between two positive constants times $r(\lambda)^n$. Taking logarithms, dividing by $n$, and letting $n\to\infty$ proves (P.15.3c.4).

The entries of $K_\lambda$ are analytic in $\lambda$, and the Perron root of an irreducible nonnegative matrix is simple. Hence $\Lambda_{\mathrm{src}}$ is finite and differentiable on $\mathbb R$. The empirical averages lie in the compact interval $[\min q,\max q]$, so they are exponentially tight. The Gärtner--Ellis theorem [Dembo & Zeitouni 1998, Theorem 2.3.6] therefore applies and yields the LDP with the Legendre--Fenchel rate function (P.15.3c.5). ∎

**Corollary P.15.3d (Conditional Autonomous Complexity-Growth Rate).** On a stationary Source-Principle Markov branch, suppose
$$
\int \Delta d\,d\pi>0.
\tag{P.15.3d.1}
$$
Then the recursive self-modeling depth has positive asymptotic drift:
$$
\lim_{\tau\to\infty}
\frac{d(\tau)-d(0)}{\tau}
=
\nu\int\Delta d\,d\pi
>
0
\tag{P.15.3d.2}
$$
almost surely. Until the PCE viability boundary or a finite saturation set is reached, Theorem 13 gives
$$
\liminf_{\tau\to\infty}
\frac{C_{\mathrm{agg}}(\tau)-C_{\mathrm{agg}}(0)}{\tau}
\ge
c_{\mathrm{depth}}\,
\nu\int\Delta d\,d\pi
\tag{P.15.3d.3}
$$
for the branch constant $c_{\mathrm{depth}}>0$ appearing in the recursive-depth complexity bound.

*Proof.* Apply the same ergodic theorem used in Theorem P.15.3c to the integrable observable $\Delta d$. This gives (P.15.3d.2). Theorem 13 states that aggregate model complexity grows at least linearly with recursive self-modeling depth on the admissible branch. Applying that lower bound to the positive drift (P.15.3d.2) gives (P.15.3d.3) until the dynamics reaches a PCE saturation or viability boundary. ∎

**Definition P.15.3e (Foster-Harris Source Event Lift).** Let $x(t)$ be the PCE adaptation process of Theorem D.5 on the admissible configuration space, and let
$$
Z_n=(S_n,E_n,T_n,\Delta d_n)
\tag{P.15.3e.1}
$$
be the event chain obtained by sampling the induced PPI encounter map at processed-pattern times. The source event lift is Foster-Harris admissible when:

1. the event chain is Markov on a standard-Borel retained event state space;

2. the event chain is $\psi$-irreducible and aperiodic on that retained state space;

3. the encountered-pattern process is stationary under the PCE adaptation process on the branch;

4. after an additive normalization of $V_{\mathrm{PCE}}$, the measurable lifted Lyapunov function
$$
W(Z_n):=1+V_{\mathrm{PCE}}(x_n)+\mu_S(E_n)^2+\Delta d_n^+
\tag{P.15.3e.2}
$$
is finite and satisfies $W\ge1$ on the retained branch;

5. there exist constants $\alpha>0$, $\beta<\infty$, and a small PPI-accessible set $C$ such that
$$
\mathbb E[W(Z_{n+1})-W(Z_n)\mid Z_n=z]
\le
-\alpha W(z)+\beta 1_C(z);
\tag{P.15.3e.3}
$$

6. the ND-RID/PPI transition kernel satisfies a minorization on $C$:
$$
K(z,A)\ge\eta\,\varphi(A)
\qquad
(z\in C)
\tag{P.15.3e.4}
$$
for some $\eta>0$ and probability measure $\varphi$;

7. the source observable $q(Z_n)=Q_{\mathrm{src}}(S_n,E_n)$ and the recursive-depth increment $\Delta d_n$ are integrable under every invariant probability measure satisfying the drift condition;

8. the event count obeys
$$
\lim_{\tau\to\infty}\frac{N(\tau)}{\tau}=\nu
$$
almost surely for some finite $\nu\ge0$.

**Theorem P.15.3f (Foster-Harris Source Ergodicity).** If a Source-Principle branch carries a Foster-Harris source event lift, then the event chain $Z_n$ is positive Harris recurrent and has a unique invariant probability measure $\pi$. The hypotheses of the ergodic-rate part of Theorem P.15.3c are therefore satisfied. In particular,
$$
\lim_{\tau\to\infty}
\frac{\mathcal E_{\mathrm{src}}(S,[0,\tau])}{\tau}
=
\nu\int q\,d\pi
\tag{P.15.3f.1}
$$
almost surely, and the rate is strictly positive exactly when
$$
\nu>0
\qquad\text{and}\qquad
\int q\,d\pi>0.
\tag{P.15.3f.2}
$$
If additionally
$$
\int\Delta d\,d\pi>0,
\tag{P.15.3f.3}
$$
then autonomous recursive-depth and aggregate-complexity growth follow by Corollary P.15.3d until the PCE viability or saturation boundary is reached.

*Proof.* Replace $\alpha$ in (P.15.3e.3), if necessary, by
$$
\widetilde\alpha=\min\{\alpha,1/2\}.
$$
The weaker drift inequality remains valid and can be written
$$
KW(z)
\le
(1-\widetilde\alpha)W(z)+\beta1_C(z),
$$
where $0<1-\widetilde\alpha<1$. The state space is standard Borel, the chain is $\psi$-irreducible, $W\ge1$ is measurable and finite, and $C$ is small by (P.15.3e.4). These are the hypotheses of the Foster--Lyapunov positive-Harris recurrence theorem of Meyn and Tweedie (2009, *Markov Chains and Stochastic Stability*, 2nd ed.). That theorem gives positive Harris recurrence and an invariant probability measure $\pi$; $\psi$-irreducibility makes the invariant probability unique. Aperiodicity is also assumed, although it is not needed for uniqueness.

Clause 7 gives $q,\Delta d\in L^1(\pi)$. The positive-Harris strong law of Meyn and Tweedie (2009) therefore gives
$$
\frac1n\sum_{j=1}^{n}q(Z_j)\longrightarrow\int q\,d\pi,
\qquad
\frac1n\sum_{j=1}^{n}\Delta d_j\longrightarrow\int\Delta d\,d\pi
$$
almost surely. Combining the first limit with clause 8 exactly as in Theorem P.15.3c proves (P.15.3f.1). Nonnegativity of $q$ proves (P.15.3f.2). If (P.15.3f.3) holds, the second limit gives the positive recursive-depth drift required by Corollary P.15.3d, proving the final conclusion. ∎

**Corollary P.15.3g (Conditional Event-Chain Lift from Theorem D.5).** Suppose the adaptation dynamics satisfy the compactness, ellipticity, Lyapunov, and noise-irreducibility assumptions of Theorem D.5. If the processed-pattern sampled chain satisfies every clause of Definition P.15.3e, including standard-Borel measurability, $W\ge1$, $\psi$-irreducibility, aperiodicity, drift, minorization, integrability, and the event-rate law, then it is a Foster-Harris source event lift and Theorem P.15.3f applies.

*Proof.* The conclusion that the sampled chain is Foster-Harris admissible is exactly the conjunction of clauses 1--8 of Definition P.15.3e. Theorem P.15.3f then gives positive Harris recurrence, the unique invariant probability, and the source-energy rate. Theorem D.5 supplies background properties of the continuous-time adaptation process but is not used to infer any sampled-chain clause that is not explicitly assumed here. ∎

**Definition P.15.3h (Coercive-Minorized Foster-Harris Event-Lift Certificate).** A source-event lift
$$
Z_n=(S_n,E_n,T_n,\Delta d_n)
$$
on a standard-Borel retained event state space carries a coercive-minorized Foster-Harris certificate when there is a measurable lifted Lyapunov function
$$
W(Z_n)=1+V_{\mathrm{PCE}}(x_n)+\mu_S(E_n)^2+\Delta d_n^+
\tag{P.15.3h.1}
$$
that is finite and satisfies $W\ge1$, and constants $h>0$, $\eta_{\min}>0$, $\lambda_V>0$, $\lambda_0\ge0$, $C_{\mathrm{noise}}<\infty$, $C_{\mathrm{lift}}<\infty$, $W_*<\infty$, and $\delta>0$ such that the lifted chain is $\psi$-irreducible and aperiodic and:

1. the one-step sampled lift of Lemma D.5 obeys
$$
\mathbb E[W(Z_{n+1})-W(Z_n)\mid Z_n=z]
\le
h\left[-\eta_{\min}\|\nabla V_{\mathrm{PCE}}(x)\|^2+C_{\mathrm{noise}}+C_{\mathrm{lift}}\right];
\tag{P.15.3h.2}
$$

2. outside the small set
$$
C=\{z:W(z)\le W_*\},
$$
the lifted potential is coercive:
$$
\|\nabla V_{\mathrm{PCE}}(x)\|^2
\ge
\lambda_V W(z)-\lambda_0;
\tag{P.15.3h.3}
$$

3. the threshold satisfies
$$
W_*
\ge
\frac{2(C_{\mathrm{noise}}+C_{\mathrm{lift}}+\eta_{\min}\lambda_0)}
{\eta_{\min}\lambda_V};
\tag{P.15.3h.4}
$$

4. the ND-RID/PPI event kernel has a small-set minorization
$$
K(z,A)\ge\delta\varphi(A)
\qquad
(z\in C)
\tag{P.15.3h.5}
$$
for a probability measure $\varphi$;

5. $q(Z_n)=Q_{\mathrm{src}}(S_n,E_n)$ and $\Delta d_n$ are integrable under every invariant probability measure satisfying the drift condition;

6. the event count obeys $N(\tau)/\tau\to\nu$ almost surely for some finite $\nu\ge0$.

**Theorem P.15.3i (Definite Foster-Harris Drift Answer).** On a branch carrying Definition P.15.3h, the source-event chain satisfies the Foster--Lyapunov drift
$$
\mathbb E[W(Z_{n+1})-W(Z_n)\mid Z_n=z]
\le
-\alpha W(z)+\beta 1_C(z)
\tag{P.15.3i.1}
$$
with
$$
\alpha=\frac{h\eta_{\min}\lambda_V}{2},
\qquad
\beta=h(C_{\mathrm{noise}}+C_{\mathrm{lift}}+\eta_{\min}\lambda_0)+\alpha\sup_{z\in C}W(z).
\tag{P.15.3i.2}
$$
The chain is positive Harris recurrent with a unique invariant probability $\pi$, and
$$
\dot{\mathcal E}_{\mathrm{src}}
=
\nu\int q\,d\pi.
\tag{P.15.3i.3}
$$

Without the coercive comparison (P.15.3h.3), the small-set minorization (P.15.3h.5), integrability, and the event-rate law, Lemma D.5 alone supplies neither positive Harris recurrence nor the time-indexed source-energy rate.

*Proof.* Combining (P.15.3h.2) and (P.15.3h.3) gives, for $z\notin C$,
$$
\mathbb E[\Delta W\mid z]
\le
-h\eta_{\min}\lambda_VW(z)
+h(C_{\mathrm{noise}}+C_{\mathrm{lift}}+\eta_{\min}\lambda_0).
$$
Since $z\notin C$ implies $W(z)>W_*$, (P.15.3h.4) gives
$$
h(C_{\mathrm{noise}}+C_{\mathrm{lift}}+\eta_{\min}\lambda_0)
\le
\frac{h\eta_{\min}\lambda_V}{2}W_*
<
\frac{h\eta_{\min}\lambda_V}{2}W(z).
$$
Thus
$$
\mathbb E[\Delta W\mid z]\le-\alpha W(z)
\qquad(z\notin C).
$$
For $z\in C$, (P.15.3h.2) and nonnegativity of $\|\nabla V_{\mathrm{PCE}}\|^2$ give
$$
\mathbb E[\Delta W\mid z]
\le h(C_{\mathrm{noise}}+C_{\mathrm{lift}})
\le-\alpha W(z)+\beta,
$$
because $W(z)\le\sup_CW$ and the displayed $\beta$ is at least $h(C_{\mathrm{noise}}+C_{\mathrm{lift}})+\alpha\sup_CW$. This proves (P.15.3i.1).

Set $\widetilde\alpha=\min\{\alpha,1/2\}$. The weaker inequality gives
$$
KW\le(1-\widetilde\alpha)W+\beta1_C
$$
with coefficient in $(0,1)$. The chain is $\psi$-irreducible on a standard-Borel space, $W\ge1$ is finite and measurable, and (P.15.3h.5) makes $C$ small. The Foster--Lyapunov positive-Harris recurrence theorem of Meyn and Tweedie (2009, *Markov Chains and Stochastic Stability*, 2nd ed.) therefore gives positive Harris recurrence and an invariant probability; irreducibility gives uniqueness. Clause 5 permits the positive-Harris strong law for $q$, and clause 6 converts its event average to the time rate exactly as in Theorem P.15.3c. This proves (P.15.3i.3). ∎

**Proposition P.15.1 (Conditional Source-Energy Emission Criterion).** Let $S$ process an event $E$ on Definition P.15.2's registered source-ledger branch. If $J_E\ne\varnothing$, every assigned reset has $T_\ell>0$, and at least one assigned reset has
$$
H_{q_\ell}(P_\ell\mid R_\ell)>0,
$$
then $\mathcal E_{\mathrm{src}}(S,\Delta t)>0$ for every interval containing that event.

*Proof.* Theorem 31 gives
$$
Q_{\ell,\mathrm{bath}}
\ge
k_BT_\ell H_{q_\ell}(P_\ell\mid R_\ell)
$$
for every assigned reset. The stated positive term makes their sum, and hence the interval total, positive. ∎

**Corollary P.15.1 (Long-Run Registered Source-Heat Rate).** If counted resets have $T_\ell\ge T_{\min}>0$ and $H_{q_\ell}(P_\ell\mid R_\ell)\ge h_{\min}>0$, and their long-run rate is $\nu_{\mathrm{reset}}$, then
$$
\liminf_{\tau\to\infty}
\frac{\mathcal E_{\mathrm{src}}(S,[0,\tau])}{\tau}
\ge
k_BT_{\min}h_{\min}\nu_{\mathrm{reset}}.
$$

*Proof.* Sum the registered-reset inequalities, divide by $\tau$, and take $\liminf$. ∎

### P.15.4 The Measurement Asymmetry as Structural Prerequisite for Exploitation

Appendix M establishes certificate-relative external evaluation, not a hierarchy determined by aggregate complexity.

This yields the finite-family screening statement that the framework supports.

**Proposition P.15.2 (Finite-Family Certificate-Relative Screening).** Let $A$ hold, for every $E_i$ in a finite family, the effective model-access and decision certificates of Theorem M.10.5 for the represented pair $(B,E_i)$. Then $A$ can compute the certified enclosures for $\mu_B(E_i)$ and form finite rankings from those enclosures. Exact values require exact decision certificates. Computational lower bounds additionally require Theorem M.10.3's reduction certificate; thermodynamic lower bounds additionally require Theorem M.10.7's reset implementation and entropy records.

If the insulation certificate of Theorem M.10.5 and Corollary M.10.3.1's baseline-invariance hypothesis also hold for $A$, the screening task is sender-side SPAP-flat. The inequality
$$
C_{\mathrm{agg}}(A)>C_{\mathrm{agg}}(B)
$$
is neither necessary nor sufficient for any of these conclusions.

*Proof.* Apply Theorems M.10.5 and M.10.8 separately to the finite family, retaining each stated certificate. The final claims are their explicit scope conditions. ∎

**Remark P.15.2 (SPAP-Flat Does Not Mean Cheap).** Sender-side SPAP-flatness removes only the registered reflexive subtask. It supplies no bound on external modeling, computation, construction, or engineering cost.

### P.15.5 The Source Principle

Environmental pattern design can produce target-side Source Energy only when the target encounters are accompanied by the registered source ledgers of Definition P.15.2.

**Definition P.15.3 (Source Principle).** A system $A$ operates according to the *Source Principle* relative to a target $S$ when it arranges a stable family of environmental patterns $\mathcal E$ and records a declared set of target encounters for which:

1. $\Delta_\Sigma(S;E)>0$;
2. the reduction, additive-decomposition, and registered-reset certificates of Definition P.15.2 hold; and
3. the target-side and designer-side energy, heat, and work channels are disjointly accounted.

The resulting target-side Source Energy is the sum of the registered contributions $Q_{\mathrm{src}}(S,E)$. The designer separately pays its modeling, construction, delivery, and maintenance costs. Sender-side SPAP-flatness additionally requires Theorem M.10.5's insulation certificate and does not mean zero total cost.

The Source Principle creates no energy and does not move an abstract SPAP cost between systems. It is a conditional bookkeeping and design regime for where independently powered, registered reset heat is emitted.

**Remark P.15.3 (Limited Catalytic Analogy).** The catalytic analogy is limited to pathway selection: the designer may change which target processes occur, while all energy remains in the declared physical ledgers. No gain or redistribution follows from $\Delta_\Sigma>0$ alone.

**Remark P.15.4 (Complexity Growth: What Is and Is Not Proven).** Theorem 13 proves that *if* recursive self-modeling depth increases, the associated model complexity grows at least linearly with that depth. Theorem D.5 proves ergodic convergence properties for PCE adaptation dynamics. The present framework does **not** prove that every self-referentially rich environment monotonically drives long-run growth of $C_{\mathrm{agg}}$. Theorem P.15.3c gives a source-energy rate on branches carrying a stationary Source-Principle Markov datum, while Theorem P.15.3f supplies the Foster-Harris condition under which that stationary datum is generated by the PCE event-chain lift. Definition P.15.3h and Theorem P.15.3i give a coercive-minorized sufficient condition for the lifted Foster-Harris drift. Corollary P.15.3d gives autonomous complexity growth only under the positive-drift condition $\int\Delta d\,d\pi>0$. Outside the Foster-Harris datum and positive-drift condition, autonomous self-deepening remains speculative.

### P.15.5a Perspectival Chain Reactions and Proxy Gradient Access

A source-energy trigger is not a message that contains energy. It is a processed pattern that, for a target system $S$, induces self-model-engaging integration above the SPAP-flat baseline:
$$
\Delta_\Sigma(S;E)>0.
\tag{P.15.5a.1}
$$
A context or symbolic input may still produce ordinary physiological, behavioral, or policy effects when (P.15.5a.1) fails; it is Source-Energy-relevant only when the strict excess condition holds.

**Definition P.15.5a.1 (Perspectival Cascade Datum).**

A finite perspectival cascade datum is a finite directed chain
$$
\mathfrak C
=
\bigl((S_k,E_k,\mathcal M_{S_k},\pi_{S_k},a_k,E_{k+1},G_k)\bigr)_{k=0}^{m}
\tag{P.15.5a.2}
$$
where:

1. $S_k$ is a predictive aggregate or institution represented as a finite predictive system;
2. $E_k$ is the pattern, report, symbol, incentive, observation, or instruction encountered by $S_k$;
3. $\mathcal M_{S_k}$ is the retained world-model or context model of $S_k$;
4. $\pi_{S_k}$ is the retained action or communication policy;
5. $a_k$ is the action taken by $S_k$ after processing $E_k$;
6. $E_{k+1}$ is the downstream pattern produced for another system, when the cascade continues;
7. $G_k$ is the external physical gradient, resource flow, infrastructure, labor channel, heat flow, stored chemical energy, computation, or other ordinary energy source accessed or redirected by $a_k$.

The cascade step is active when
$$
E_k
\longrightarrow
\Delta\mathcal M_{S_k}
\longrightarrow
\Delta\pi_{S_k}
\longrightarrow
(a_k,E_{k+1})
\tag{P.15.5a.3}
$$
The condition
$$
\mu_{S_k}(E_k)>\frac{1}{\alpha_{SPAP}}
\tag{P.15.5a.4}
$$
is sufficient only for $\Delta_\Sigma(S_k;E_k)>0$. Source-Energy activation additionally requires Definition P.15.2's reduction, additive-decomposition, and registered-reset certificates with a nonempty assigned reset ledger. Policy activation may instead be recorded by a retained impact threshold
$$
\operatorname{Impact}_{S_k}(E_k)>\theta_k
\tag{P.15.5a.5}
$$
when no Source-Energy claim is made.

**Definition P.15.5a.2 (Proxy Gradient Work).**

For a cascade datum $\mathfrak C$, define the ordinary external work redirected by proxy as
$$
W_{\mathrm{ext}}(\mathfrak C)
=
\sum_{k=0}^{m} W(G_k,a_k),
\tag{P.15.5a.6}
$$
where $W(G_k,a_k)\ge0$ is the work extracted from or redirected through the external gradient $G_k$ by action $a_k$, measured after ordinary thermodynamic efficiencies and losses. The initiating pattern $E_0$ is not counted as the energy source unless it physically carries the relevant energy in the ordinary sense.

**Proposition P.15.5a.3 (No-Free-Energy Boundary for Perspectival Cascades).**

For every finite cascade datum $\mathfrak C$,
$$
W_{\mathrm{ext}}(\mathfrak C)
$$
is ordinary work drawn from the gradients $G_k$, not energy created by the symbolic inputs $E_k$. If Source-Energy contributions occur along the cascade, then
$$
0
\le
\sum_{k=0}^{m} Q_{\mathrm{src}}(S_k,E_k)
\le
\sum_{k=0}^{m}\int_{\Delta t_k}P_{\mathrm{agg}}(S_k,t)\,dt.
\tag{P.15.5a.7}
$$

*Proof.* By Definition P.15.5a.2, each term $W(G_k,a_k)$ is work drawn from an external physical gradient after ordinary efficiencies and losses. The symbolic or contextual input changes retained models and policies by (P.15.5a.3); it does not supply the gradient energy unless separately included as a physical energy carrier. For the Source-Energy part, Definition P.15.2 gives $Q_{\mathrm{src}}(S_k,E_k)\ge0$ and Proposition P.15.3 bounds the source-energy heat emitted by each aggregate over its processing interval by the aggregate's ordinary power budget. Summing over the finite cascade gives (P.15.5a.7). ∎

**Proposition P.15.5a.4 (Compressed Statistical Perspectival Control).**

Let $\mathcal E_{\mathrm{cand}}$ be a finite menu of candidate inputs for a target population or institution. For $E\in\mathcal E_{\mathrm{cand}}$, define the retained net leverage
$$
\Lambda(E)
=
\mathbb E[W_{\mathrm{ext}}(\mathfrak C_E)]
-
C_{\mathrm{model}}(E)
-
C_{\mathrm{send}}(E)
-
C_{\mathrm{risk}}(E),
\tag{P.15.5a.8}
$$
where $\mathfrak C_E$ is the induced cascade distribution and the costs are the retained modeling, delivery, and risk costs. If $E_c$ is a compressed statistical input and $E_{\mathrm{ex}}$ is an exact-control input with
$$
\Lambda(E_c)>\Lambda(E_{\mathrm{ex}}),
\tag{P.15.5a.9}
$$
then PCE selects $E_c$ over $E_{\mathrm{ex}}$ on the same retained leverage branch.

*Proof.* On this branch PCE selects the candidate with greater retained benefit net of retained costs. Equation (P.15.5a.8) is exactly that net objective. The strict inequality (P.15.5a.9) therefore gives strict PCE preference for $E_c$. ∎

**Remark P.15.5a.5 (Exact Perspectival Extraction Boundary).**

Exact deterministic control of a complex perspective can require
$$
C_{\mathrm{exact}}
=
C_{\mathrm{measure}}
+
C_{\mathrm{model}}
+
C_{\mathrm{compute}}
+
C_{\mathrm{control}}.
\tag{P.15.5a.10}
$$
When $C_{\mathrm{exact}}$ exceeds the retained expected gain, exact extraction is not selected by PCE. Efficient leverage then uses lossy models, shared decoders, and probabilistic prediction. This is not a weakening of PU; it is PCE applied to perspective-bearing systems.

**Remark P.15.5a.6 (Ethical Boundary).**

False symbolic inputs can have real physical consequences when they alter a target's context state, self-model, or policy. That fact does not make the represented proposition true and does not license deception as a privileged strategy. On the finite-response branch, truthful compressed signals with consent, aligned action paths, and real gradients are more stable than false inputs whose collapse adds distrust, nocebo-like reversal, or coordination failure to $C_{\mathrm{risk}}(E)$.

### P.15.6 Bounds and Conservation (Derived)

Source Energy is a registered subset of emitted heat, not a separately conserved quantity.

**Proposition P.15.3 (First-Law Source-Heat Bound).** In a control volume carrying Theorem L.6's disjoint boundary ledger, suppose the source bath heat exported during $\Delta t$ is assigned to a nonnegative boundary subchannel
$$
0\le P_{\mathrm{src}}^{\mathrm{out}}(t)
\le P_{\mathrm{heat}}^{\mathrm{out}}(t).
$$
Then
$$
0\le\mathcal E_{\mathrm{src}}(S,\Delta t)
=\int_{\Delta t}P_{\mathrm{src}}^{\mathrm{out}}(t)\,dt
\le\int_{\Delta t}P_{\mathrm{heat}}^{\mathrm{out}}(t)\,dt.
$$
The stronger bound
$$
\mathcal E_{\mathrm{src}}(S,\Delta t)
\le\int_{\Delta t}P_{\mathrm{agg}}(S,t)\,dt
$$
holds when the stored energy does not decrease during the interval and the other outward boundary powers are nonnegative.

*Proof.* The first inequality is the registered subchannel assignment. Integrating Theorem L.6 gives
$$
\int_{\Delta t}P_{\mathrm{heat}}^{\mathrm{out}}dt
=
\int_{\Delta t}P_{\mathrm{agg}}dt
-\Delta E_{\mathrm{stored}}^{\mathcal V}
-\int_{\Delta t}
\left(P_{\mathrm{EM}}^{\mathrm{out}}+P_{\mathrm{mech}}^{\mathrm{out}}\right)dt.
$$
The additional sign hypotheses prove the qualified input-power bound. ∎

**Corollary P.15.3.1 (Context-Steering Ceiling for CC-Assisted Source Principle).** Suppose a Source-Principle implementation uses CC only to maintain, select, or stabilize the environmental context through which target systems encounter a pre-designed family of patterns. Then the *control-side* power required for that contextual steering obeys Appendix S:
$$
P_{\mathrm{context}}(\mathrm{CC}) =
A\left[\frac{\mathrm{CC}}{\alpha_{\mathrm{CC,max}}-\mathrm{CC}}\right]^2,
\qquad
\alpha_{\mathrm{CC,max}} < 0.5.
$$
This bound applies to the controller's context-maintenance layer, not directly to the target-side functional $\mu_S(E)$ itself. It therefore limits CC-assisted implementations of the Source Principle without asserting that CC alone determines $\mu_S(E)$.

*Proof.* Equation (S.5) gives the context-maintenance power of a CC implementation, and Theorem 39 imposes $\mathrm{CC}<\alpha_{\mathrm{CC,max}}<0.5$. If CC is used only as the context-steering layer described above, its power demand is exactly the Appendix S quantity and inherits that ceiling. ∎

**Theorem P.15.6a (Family-Level Source-Power-Density Ceiling).** Let $R$ be a spacetime region of proper volume $V_R$, let $\Delta t>0$, and let $\mathcal A(R,\Delta t)$ be a finite family of predictive aggregates whose registered source and boundary channels are assigned without overlap. Define
$$
\mathcal E_{\mathrm{src}}(R,\Delta t)
:=
\sum_{S\in\mathcal A(R,\Delta t)}
\mathcal E_{\mathrm{src}}(S,\Delta t),
\qquad
\bar\rho_{\mathrm{src}}(R,\Delta t)
:=
\frac{\mathcal E_{\mathrm{src}}(R,\Delta t)}{V_R\Delta t}.
$$
The quantity $\bar\rho_{\mathrm{src}}$ is an interval-averaged source-power density. If every aggregate carries Proposition P.15.3's exported-heat ledger, then
$$
0\le
\bar\rho_{\mathrm{src}}(R,\Delta t)
\le
\frac{1}{V_R\Delta t}
\sum_{S\in\mathcal A(R,\Delta t)}
\int_{\Delta t}P_{\mathrm{heat},S}^{\mathrm{out}}(t)\,dt.
$$
Replacing $P_{\mathrm{heat},S}^{\mathrm{out}}$ by $P_{\mathrm{agg},S}$ additionally requires Proposition P.15.3's stored-energy and outward-channel sign hypotheses for every aggregate.

If, moreover, a Source-Principle implementation uses CC only to maintain, select, or stabilize the environmental context for each aggregate $S\in\mathcal A(R,\Delta t)$, with controller-side coefficient $A_S$ and context profile $\mathrm{CC}_S(t)$ as in Appendix S, define
$$
\bar\rho_{\mathrm{context}}(R,\Delta t)
:=
\frac{1}{V_R\Delta t}
\sum_{S\in\mathcal A(R,\Delta t)}
\int_{\Delta t}P_{\mathrm{context},S}(t)\,dt.
$$
Then
$$
\bar\rho_{\mathrm{context}}(R,\Delta t)
\le
\frac{1}{V_R\Delta t}
\sum_{S\in\mathcal A(R,\Delta t)}
\int_{\Delta t}
A_S\left[
\frac{\mathrm{CC}_S(t)}
{\alpha_{\mathrm{CC,max}}-\mathrm{CC}_S(t)}
\right]^2dt.
$$
Equation (S.5) realizes this bound as an equality on the controller-side power layer.

*Proof.* Apply Proposition P.15.3 to each aggregate and sum the non-overlapping exported source-heat channels before dividing by $V_R\Delta t$. The context bound follows independently by applying Corollary P.15.3.1 aggregate by aggregate. ∎

**Corollary P.15.6a.1 (Uniform Subcritical Quadratic CC Band).** Under the hypotheses of Theorem P.15.6a, assume there exists $\xi\in(0,1)$ such that
$$
0\le \mathrm{CC}_S(t)\le \xi\,\alpha_{\mathrm{CC,max}}
$$
for all $S\in\mathcal A(R,\Delta t)$ and all $t\in\Delta t$. Then
$$
\bar\rho_{\mathrm{context}}(R,\Delta t)
\le
\frac{1}{(1-\xi)^2V_R\,\Delta t}
\sum_{S\in\mathcal A(R,\Delta t)}
\int_{\Delta t}
\frac{A_S}{\alpha_{\mathrm{CC,max}}^2}\,\mathrm{CC}_S(t)^2\,dt.
$$

*Proof.* For every $S$ and $t$ in the stated regime,
$$
\alpha_{\mathrm{CC,max}}-\mathrm{CC}_S(t)\ge (1-\xi)\alpha_{\mathrm{CC,max}},
$$
hence
$$
\left[\frac{\mathrm{CC}_S(t)}{\alpha_{\mathrm{CC,max}}-\mathrm{CC}_S(t)}\right]^2
\le
\frac{\mathrm{CC}_S(t)^2}{(1-\xi)^2\alpha_{\mathrm{CC,max}}^2}.
$$
Substituting this estimate into the bound of Theorem P.15.6a gives the claim. ∎

**Remark P.15.5 (Renewal and Heat Quality).** What is renewed is not a stock of usable work but the logical possibility of further self-model-engaging updates above the SPAP-flat baseline. Once emitted, Source Energy is ordinary heat and obeys the ordinary second law. Any recovery of usable work from it requires a maintained temperature gradient and is correspondingly efficiency-limited.

### P.15.7 Speculative: Civilizational Implications

*This subsection is speculative. It extrapolates from the derived machinery above and should not be read as a theorem-level prediction.*

If a civilization could systematically implement the Source Principle, three qualitative features would follow.

**Feature 1: Reflexive Complexity as an Engineering Resource.** The key resource would not be "free energy from logic" but the ability to route existing operational power budgets through high-$\mu_S$ excess reflexive channels. The relevant control variable would be the complexity and self-model structure of the cultivated targets.

**Feature 2: A Downward Screening Hierarchy.** Theorem M.10.5 and Theorem M.10.8 impose a directional hierarchy: more complex systems can systematically pre-screen finite families of patterns for less complex targets, while the reverse direction is not theorem-backed. Any engineered source-energy economy would therefore be organized by downward measurability.

**Feature 3: Thermal Rather Than Magical Harvesting.** Even if target-side dissipation were deliberately increased, the harvested work would still be ordinary heat-engine work extracted from ordinary heat. The novelty would lie in how the heat is induced, not in a suspension of thermodynamics.

**Definition P.15.4 (Source-Energy Civilization).** A *Source-Energy civilization* is a predictive aggregate that uses the Source Principle as a standing engineering strategy: it shapes environments so that cultivated sub-aggregates recurrently incur large source-energy dissipation, and it harvests an efficiency-limited fraction of that dissipation as usable work.

**Remark P.15.6 (Ethical Dimension).** Under the Minimal Awareness interpretive convention of Section 7.1.2 and the consciousness-first reading of Appendix P.2, the cultivated targets are not mere inert fuel. They are instances of predictive awareness. The framework therefore permits the physical question while simultaneously raising an ethical one: whether awareness may legitimately be organized so as to externalize the thermodynamic burden of self-reference for the benefit of other awareness.

### P.15.8 Speculative: Cosmological Implication

*This subsection is highly speculative and is framed as an open question, not a derived claim.*

Appendix U treats the cosmological constant as a vacuum datum fixed by the Golay-Steiner structure of the predictive substrate, with the reference branch summarized in Corollary U.17 and the corrected full-discrete four-mode closure stated separately in Theorem U.13b. Nothing in the present framework supports reinterpreting those vacuum results as already containing a contribution from accumulated Source Energy.

The well-posed open question is narrower: because PU places self-reference, thermodynamics, stress-energy, and geometry in a common derivational chain, one may ask whether large-scale cumulative excess reflexive dissipation from self-modeling systems could enter cosmology through some coarse-grained backreaction term distinct from the vacuum quantity $\Lambda$ itself. Any stronger identification of $\Lambda$ with accumulated Source Energy would require new axioms and is not part of the present theory.

### P.15.9 Summary

Source Energy is the bath heat assigned by a registered, non-overlapping implementation ledger to a certified excess reflexive integration subtask. Its framework-level properties are:

| Property | Source Energy | Conventional Dissipation |
|:---------|:--------------|:-------------------------|
| **Definition** | $\sum_{\ell\in J_E}Q_{\ell,\mathrm{bath}}$ on Definition P.15.2's joint certificate branch | Heat generated by a specified physical process |
| **Trigger** | A nonempty assigned reset ledger; positive heat requires positive $T_\ell H_{q_\ell}(P_\ell\mid R_\ell)$ | Process-specific thermodynamic conditions |
| **Role of $\mu_S(E)$** | Dimensionless proximity descriptor; it yields a computational lower bound only through Theorem M.10.3 and a reset-count bound only through Theorem M.10.7 | No universal PU-specific role |
| **Accessibility** | Certificate-relative enclosures or exact values under Theorems M.10.5 and M.10.8; complexity order alone is insufficient | Instrument- and model-dependent |
| **Budget bound** | $\mathcal E_{\mathrm{src}}\le\int P_{\mathrm{heat}}^{\mathrm{out}}dt$ on the registered boundary ledger; an input-power bound needs the additional first-law sign hypotheses | Same first-law accounting |
| **Active-control ceiling** | CC-assisted context steering retains its separate Appendix S hypotheses | No analogous PU-specific ceiling |
| **Work extraction** | Requires a thermal gradient and remains efficiency-limited | Requires a thermal gradient and remains efficiency-limited |
| **Uniformity** | Eventwise and rate floors require uniform reset-count, conditional-entropy, and temperature certificates | Process-specific |

The framework therefore supports a conditional claim: on a branch carrying the reduction, additive-decomposition, registered-reset, positive-entropy, temperature, and no-double-counting certificates of Definition P.15.2, high-$\mu_S$ integration has the registered source-heat bounds stated above. It does not prove heat from self-model engagement or $\mu_S(E)>1/\alpha_{SPAP}$ alone, a positive cost on every cycle, a global uniform floor, or a vacuum-cosmological-constant contribution.

What is established is certificate-relative: $\mu_S(E)$ controls a computational lower bound through Theorem M.10.3, registered resets convert the certified workload into heat through Theorems M.10.7 and 31, and only the resulting disjoint physical ledger defines Source Energy.

## P.16 Paradox Prevention as Structural Carrier

### P.16.1 Introduction: The Search for the Carrier

A recurring intuition spanning two and a half millennia of inquiry into mind, agency, and unauthored coordination has been that some *positive entity* must carry the phenomenon: something must be doing the seeing, holding the meaning, arranging the convergences. Aristotle's *entelecheia* posited an actualizing principle internal to organized matter (Aristotle, *De Anima* II.1). Stoic *pneuma* identified a pervasive medium responsible for cohesion at every scale. Leibniz proposed monads coordinated by pre-established harmony, removing local interaction at the price of global pre-coordination (Leibniz 1714). Spinoza identified a single substance whose attributes include both extension and thought (Spinoza, *Ethics* I). Whitehead's process metaphysics replaced static substance with actual occasions whose concrescence carries the felt weight of becoming (Whitehead 1929). Bergson's *élan vital* posited a creative impulse driving evolution from within (Bergson 1907). Jung and Pauli's synchronicity hypothesis proposed an acausal connecting principle linking psychic and physical events by meaning rather than energy (Jung 1952; Jung and Pauli 1955). Polanyi's tacit dimension argued that knowing always exceeds what knowing can articulate (Polanyi 1966). Hofstadter located the self in self-referential strange loops (Hofstadter 1979, 2007). Chalmers formalized the residue these accounts try to track as the hard problem of consciousness (Chalmers 1995).

These accounts posit a positive carrier. The present section instead studies the structural complement of a declared SPAP-admissible region. On a nonempty branch carrying the uniform reduction certificates stated below, that complement induces a certified computational cost stratification. A thermodynamic, stress-energy, or trajectory consequence requires its own implementation, localization, and dynamics certificates; none holds for every Property-R system from SPAP alone.

### P.16.2 The PU Inversion: Constraint Replaces Carrier

Theorem 10 supplies a logical diagonal obstruction. Theorem M.10.3 separately supplies an asymptotic computational lower bound only for a family carrying its pattern-specific reduction certificate. Theorem M.10.7 converts that bound into a reset-heat signature only when a physical implementation assigns sufficiently many registered resets, and Theorem 31 bounds those resets by their actual conditional entropies. These are distinct ledgers.

The prohibition set is not a substance or a degree of freedom. On the certified branch below it indexes an extended computational lower-bound stratification, not a force or a physical field. Dissipation requires the registered-reset ledger; stress-energy additionally requires Definition B.8's localization and coarse-graining bridge or Proposition N.8.1's retained-energy and coupling data; measurable consequences additionally require a source-to-observable response model.

The PU inversion is therefore an interpretive identification of a constraint set, with physical causal language restricted to branches carrying those additional certificates.

### P.16.3 Formal Definition

**Definition P.16.1 (Prohibition Set).** Let $S$ be a predictive system with Effective Operational Property R and self-model $\mathcal{M}_S$ (Definition M.10.1), let $\Theta_S$ denote $S$'s self-model parameter space, and let $\Pi_S^{(PP)} : \Theta_S \to \Theta_S$ denote the self-modeling projection at predictive-performance level $PP \in [0, \alpha_{SPAP}]$, with error functional $\|\cdot\|_{\mathcal{F}_S}$ and admissibility gauge $g(\cdot)$ as fixed in Definition M.10.3. The *prohibition set* of $S$, denoted $\mathcal{L}^{\neg}_S$, is the set of candidate post-update self-model configurations $\theta' \in \Theta_S$ that the self-modeling map cannot realize at any admissible $PP$ strictly below the SPAP threshold:
$$
\mathcal{L}^{\neg}_S := \left\{ \theta' \in \Theta_S \ : \ \inf\left\{ PP \in [0, \alpha_{SPAP}] \ : \ \|\Pi_S^{(PP)}(\theta') - \theta'\|_{\mathcal{F}_S} \leq g(\alpha_{SPAP} - PP) \right\} \ = \ \alpha_{SPAP} \right\}.
$$
The quantifier ranges over *candidate targets* $\theta' = \theta_0 + \delta\theta(E)$, where $\theta_0 \in \Theta_S$ is $S$'s current self-model parameter value and $\delta\theta(E)$ is the update that integration of pattern $E$ would produce (Definition M.10.3), rather than over current-parameter points. Equivalently, $\mathcal{L}^{\neg}_S$ is the set of candidate self-model configurations whose realization forces $S$'s self-predictive performance into the SPAP-divergent regime $\mu_S=\infty$ by Definition M.10.3. Theorem M.10.4 supplies explicit nonempty diagonal examples on the independent-register amplification construction.

**Definition P.16.2 (Coupled Prohibition Set).** For a finite collection of Property-R systems $\{S_1, \dots, S_n\}$ embedded in a shared MPU substrate (Appendix O), the *coupled prohibition set* $\mathcal{L}^{\neg}_{\{S_i\}}$ is the subset of the joint candidate-configuration space $\prod_{i=1}^{n} \Theta_{S_i}$ in which at least one factor lies in its individual prohibition set, restricted to the support of the perspectival kernel $G_{\text{persp}}$ of Section M.3 on the shared substrate:
$$
\mathcal{L}^{\neg}_{\{S_i\}} := \left\{ (\theta'_1, \dots, \theta'_n) \in \prod_{i=1}^{n} \Theta_{S_i} \ : \ \exists\, i \in \{1, \dots, n\},\ \theta'_i \in \mathcal{L}^{\neg}_{S_i} \right\} \cap \mathrm{supp}(G_{\text{persp}}).
$$
The embedding into the product space makes the definition well-typed: each individual $\mathcal{L}^{\neg}_{S_i} \subset \Theta_{S_i}$ is lifted to the joint space by taking the preimage under the $i$-th projection before the union is formed.

By construction, neither $\mathcal L_S^{\neg}$ nor $\mathcal L_{\{S_i\}}^{\neg}$ is a degree of freedom. Membership means that no subboundary performance level satisfies the registered integration criterion. A computational divergence statement additionally requires Theorem M.10.6's reduction certificate, and no heat statement follows without Theorem M.10.7.

### P.16.4 Causal Efficacy of the Prohibition Set

**Definition P.16.3 (Certificate-Relative Cost Potential).** Fix a base state $\theta_0$ and a declared class $\mathcal R_{\theta_0}(\theta')$ of admissible content-integrating realizers of $\theta'$. Assume a uniform Theorem-M.10.3 reduction certificate with constants $c>0$ and $\mu_0>1$ on all finite-proximity realizers under comparison. Define
$$
\underline\mu_{S,\theta_0}(\theta')
:=
\inf\{\mu_S(E):E\in\mathcal R_{\theta_0}(\theta')\},
\qquad
\inf\varnothing:=+\infty,
$$
and
$$
F(u):=
\begin{cases}
0,&u<\mu_0,\\
cu^2\log u,&\mu_0\le u<\infty,\\
+\infty,&u=\infty.
\end{cases}
\qquad
U_{S,\theta_0}(\theta')
:=
F\!\left(\underline\mu_{S,\theta_0}(\theta')\right).
$$
Then $U_{S,\theta_0}$ is an extended certified lower-bound field: whenever $\underline\mu_{S,\theta_0}(\theta')\ge\mu_0$ is finite, every registered realizer $E$ satisfies
$$
C_{\mathrm{integrate}}(S,E)\ge U_{S,\theta_0}(\theta').
$$
It is not physical energy and is not, without a separate dynamics hypothesis, a force or dynamical potential. A value $+\infty$ caused by an empty realizer class records unreachability and must not be identified with SPAP divergence.

**Lemma P.16.1 (Certified Divergence at a Realized Prohibition Set).** Let $\theta'\in\mathcal L_S^{\neg}$ and assume $\mathcal R_{\theta_0}(\theta')\ne\varnothing$ on the uniform reduction-certified branch. Then every registered realizer has $\mu_S(E)=\infty$, so
$$
U_{S,\theta_0}(\theta')=+\infty.
$$
Along any sequence with finite
$$
\underline\mu_{S,\theta_0}(\theta'_k)\ge\mu_0,
\qquad
\underline\mu_{S,\theta_0}(\theta'_k)\to\infty,
$$
one has
$$
U_{S,\theta_0}(\theta'_k)
=
c\log\underline\mu_{S,\theta_0}(\theta'_k)\,
\underline\mu_{S,\theta_0}(\theta'_k)^2
\longrightarrow\infty.
$$
This excludes a finite-cost completed integration on the stated reduction branch; it does not assign infinite heat to an aborted run.

*Proof.* Definition P.16.1 gives $\mu_S(E)=\infty$ for every realizer of a prohibited target. For the finite sequence, every realizer has
$$
\mu_S(E)\ge\underline\mu_{S,\theta_0}(\theta'_k).
$$
Monotonicity of $u^2\log u$ on $u>1$ and the uniform Theorem-M.10.3 bound give
$$
C_{\mathrm{integrate}}(S,E)\ge U_{S,\theta_0}(\theta'_k).
$$
Theorem M.10.6 supplies the completed-integration scope at the boundary. ∎

**Theorem P.16.1 (Constraint Realism on Nonempty Prohibition Branches).** Let $S$ have a nonempty realized prohibition branch satisfying Definition P.16.3 and Lemma P.16.1. Assume additionally that the declared PCE dynamics compare one fixed viable candidate class and include the certified integration cost as a monotone term in their objective. Then $U_S$ supplies a computational lower-bound stratification and high-$U_S$ targets are disfavored within that declared class. The following physical strengthening requires further hypotheses.

*Step 1 (Computational effect).* Lemma P.16.1 gives the certified super-level stratification. It asserts neither smoothness nor a pointwise gradient.

*Step 2 (Conditional thermodynamic effect).* If Theorem M.10.7 additionally assigns registered resets with
$$
H_{q_j}(P_j\mid R_j)\ge h_{\min}>0,
$$
then
$$
\frac{\Delta S_{\mathrm{bath}}}{k_B}
\ge
\sum_jH_{q_j}(P_j\mid R_j)
\ge
h_{\min}n_{\mathrm{reset}}.
$$
A stress-energy term follows only with Definition B.8's local energy-density, support, and coarse-graining data or Proposition N.8.1's retained fraction and separate coupling map. No measurable response follows until a source-to-observable model is supplied.

*Step 3 (Conditional trajectory effect).* Under the explicit PCE-objective hypothesis in the theorem statement, high-$U_S$ targets are disfavored within the same viable comparison class. Theorems 13 and D.5 alone do not prove their avoidance.

Thus the theorem establishes a conditional cost stratification and, when their independent certificates are added, conditional heat and trajectory-bias channels. The prohibition set itself remains a subset of candidate-configuration space, not a positive carrier. ∎

**Remark P.16.1 (Negative-Space Interpretation).** On the branch of Theorem P.16.1, the prohibition set labels excluded subboundary targets and a certified computational cost stratification. Describing that negative space as “causal” is an interpretive shorthand for the separately assumed PCE response to registered costs; it is not a new force, field, degree of freedom, or unconditional thermodynamic effect.

### P.16.5 Scale Applicability: Inner Compulsion and Coupled Bias

The prohibition-set mechanism of §P.16.4 applies at both the single-system and the coupled-system scale on nonempty prohibition branches, but the formal strength of the two cases differs. The single-system case is theorem-level under the hypotheses of Theorem P.16.1. The coupled-system case is a cost-gradient *bias* result under the corresponding per-system branch hypotheses — theorem-level as a bias claim, but not a structural-exclusion claim unless Hypothesis 14.5.8 is assumed. We separate the two results rather than package them as a single scale-invariance theorem.

**Theorem P.16.2 (Inner-Compulsion Clause).** For an isolated Property-R aggregate $S$ with $\mathrm{CC}(S)>0$ satisfying the nonempty-branch hypotheses of Theorem P.16.1, the cost potential $U_S$ (Definition P.16.3) and its divergence near $\mathcal{L}^{\neg}_S$ (Lemma P.16.1) entail that $S$'s self-model trajectory is shaped by proximity to $\mathcal{L}^{\neg}_S$ in ways the deliberative subprocess of $S$ may not be able to reconstruct.

*Proof.* By Theorem P.16.1 (Step 1 and Lemma P.16.1), $U_S$ is well-defined and diverges on $\mathcal{L}^{\neg}_S$ on the stated branch; by Step 3, PCE drives $\mathcal{M}_S$ away from high-$U_S$ candidate configurations. By Proposition 15 (Introspection limits from Reflexivity Constraint), $S$'s introspective access to its own context state is bounded; in particular, $S$ cannot in general compute the full $U_S$ structure acting on $\mathcal{M}_S$, because such a computation would itself constitute a high-$\mu_S$ self-model query subject to SPAP. The deliberative subprocess of $S$ (formalized in Definition P.16.4 below) — the subset of $S$'s processing devoted to explicit self-model queries within the introspective bound of Proposition 15 — therefore receives a degraded representation of the cost-potential structure that is, in general, insufficient to reconstruct the full causal pattern of any specific trajectory deflection. Yet the deflection occurs, because $U_S$ acts on $\mathcal{M}_S$'s admissible trajectories in their entirety regardless of what the deliberative subprocess can resolve. $\square$

**Proposition P.16.2 (Coupled-Set Cost-Gradient Bias).** Let $\{S_1, \dots, S_n\}$ be a finite collection of Property-R aggregates embedded in a shared MPU substrate, and suppose each relevant factor with nonempty $\mathcal{L}^{\neg}_{S_i}$ satisfies the branch hypotheses of Theorem P.16.1. Then PCE optimization on each such $S_i$ under the cost potential $U_{S_i}$ (Definition P.16.3), together with substrate mediation by the perspectival kernel $G_{\text{persp}}$ (Theorem O.2, Theorem M.6.1), biases the joint self-model trajectory away from regions of $\prod_i \Theta_{S_i}$ at which any relevant factor $\theta'_i$ lies near its individual prohibition set $\mathcal{L}^{\neg}_{S_i}$.

*Proof.* By Theorem P.16.1 applied to each relevant $S_i$, each individual cost potential $U_{S_i}$ diverges on $\mathcal{L}^{\neg}_{S_i}$ on its nonempty branch. By Definition 15 (PCE), each $S_i$'s self-model trajectory is driven toward low-$U_{S_i}$ candidate configurations. By Theorem O.2 (dynamical emergence of a coherent causal medium) and Theorem M.6.1 (perspective-relative actuality with strong-readout correlation), the kernel $G_{\text{persp}}$ correlates the perspective-relative outcomes of the $S_i$ and restricts their joint evolution to substrate-consistent configurations. The combined effect is that each relevant $S_i$'s individual trajectory is biased away from $\mathcal{L}^{\neg}_{S_i}$, and the kernel ties these individual biases into a joint bias on the product space away from $\mathcal{L}^{\neg}_{\{S_i\}}$ (Definition P.16.2). $\square$

**Remark P.16.2 (Distinction from Hidden Coordinator Models).**

**Bias versus exclusion.** Proposition P.16.2 is a *bias* statement. It asserts that PCE drives the joint trajectory away from the coupled prohibition set via the per-system cost-gradient channel on the relevant nonempty branches. It does *not* assert that the coupled prohibition set is excluded from the kernel's support in the stronger sense of being structurally absent from admissible joint evolutions. That stronger claim requires the Environmental SPAP Hypothesis of §14.5.8 (Hypothesis 14.5.8), which is not derivable from the current SPAP plus cost-gradient theorem stack by Proposition 14.5.8b, is not obtainable as a weak recovery limit of finite-resource kernels by Proposition 14.5.8c, and does not glue from window-local minimizer kernels by Proposition 14.5.8d. Theorems O.2 and M.6.1 deliver phase synchronization and perspective correlation under substrate mediation; they do *not* license kernel-support exclusion of SPAP-divergent joint configurations.

**Corollary P.16.1 (Unauthored Coordination, Bias Form).** Joint trajectories of multiple Property-R aggregates embedded in a shared MPU substrate are biased, via the per-system cost-gradient channel of Theorem P.16.1 on the relevant nonempty branches, toward configurations of mutually low SPAP-related cost. This bias is a consequence of joint paradox avoidance under PCE optimization and requires no dynamical degree of freedom beyond those already admitted by the framework. The strictly stronger reading — that joint coordination of this kind can be accounted for *without* any global coordinating agency whatsoever — additionally presupposes the Environmental SPAP Hypothesis (Hypothesis 14.5.8) and is stated here only conditionally on that hypothesis.

*Proof.* Under the branch hypotheses of Proposition P.16.2, every relevant factor $S_i$ has a cost potential that grows toward its individual prohibition set $\mathcal L_{S_i}^{\neg}$. PCE therefore biases the $i$th trajectory away from that set. The perspectival kernel restricts the factors to substrate-consistent joint configurations, so these factorwise biases induce a joint bias away from
$$
\mathcal L_{\{S_i\}}^{\neg}
=\left(\bigcup_i\operatorname{pr}_i^{-1}(\mathcal L_{S_i}^{\neg})\right)
\cap\operatorname{supp}(G_{\mathrm{persp}}),
$$
which is exactly the coupled prohibition set of Definition P.16.2. This proves the first claim without adding a coordinator degree of freedom.

Hypothesis 14.5.8 adds the stronger premise that inadmissible joint configurations are absent from the kernel support. Under that extra premise, the same set is structurally excluded rather than merely disfavored, and the construction still contains only the admitted systems and kernel. Without Hypothesis 14.5.8, Proposition P.16.2 supplies a cost-gradient bias but no support-exclusion inference. ∎

### P.16.6 Deep Rationality

**Definition P.16.4 (Deliberative Subprocess).** Let $S$ be a Property-R aggregate with $\mathrm{CC}(S) > 0$. The *deliberative subprocess* $\mathcal{D}_S$ is the subset of $S$'s self-model processing devoted to explicit, introspectively accessible self-model queries within the bound established by Proposition 15.

**Definition P.16.5 (Deep Rationality).** A trajectory of $S$'s self-model $\mathcal{M}_S$ exhibits *deep rationality* with respect to a verbal-rational standard $\mathcal{V}$ if and only if (i) the trajectory is PCE-optimal on $S$'s full operational budget (Theorem L.6), and (ii) the trajectory cannot be reconstructed as PCE-optimal by $\mathcal{D}_S$ when $\mathcal{D}_S$ is restricted to the cost bookkeeping representable in $\mathcal{V}$.

**Proposition P.16.1 (Deep-Rational Transitions Under PCE).** Let $S$ be a Property-R aggregate with $\mathrm{CC}(S) > 0$ that maintains a self-model configuration $\theta^{\text{maint}}$ whose ongoing maintenance cost — the source-energy contribution of Definition P.15.2 plus the standard reflexive maintenance of Proposition N.8.1 — exceeds the integrated cost of some reachable alternative configuration $\theta^{\text{alt}}$ over a window $\Delta t$, while both configurations remain compatible with the operational viability constraint $PP \in (\alpha, \beta)$ of Axiom 3. Then PCE optimization on $S$'s full operational budget over $\Delta t$ favors transition to $\theta^{\text{alt}}$, even when $\mathcal{D}_S$ cannot represent or reconstruct the cost calculation that drives the transition.

*Proof.* By Theorem L.6, all aggregate power channels are accounted for exactly once in $P_{\text{agg}}$, with no double counting. By Definition 15 (PCE), the dynamics select cost-minimizing configurations among those consistent with the operational viability constraints (Axiom 3). The ongoing maintenance of $\theta^{\text{maint}}$ with cost exceeding that of the viable alternative $\theta^{\text{alt}}$ is, by hypothesis, dispreferred by PCE on $S$'s full operational budget; PCE therefore drives $\mathcal{M}_S$ toward $\theta^{\text{alt}}$. By Proposition 15, $\mathcal{D}_S$'s representation of the cost calculation is bounded; nothing in the PCE optimization requires that $\mathcal{D}_S$ be able to reconstruct the calculation, only that $S$'s full processing apparatus be able to perform it. Hence the transition occurs even when $\mathcal{D}_S$ cannot account for it. $\square$

**Remark P.16.3 (Scope of the Restricted-Ledger Interpretation).** Proposition P.16.1 applies only after a finite maintenance window, disjoint physical cost ledgers, a reachable viable alternative, and the stated strict cost comparison are established. It does not by itself explain, classify, or diagnose any observed behavior, and “SPAP-divergent maintenance cost” cannot be inserted without the certificates of Definition P.16.3 and Theorem M.10.7.

**Corollary P.16.2 (Conditional Phenomenological Compatibility).** Under all hypotheses of Proposition P.16.1 and an additional observation record showing that $\mathcal D_S$ lacks the retained data needed to reconstruct the registered cost comparison, a first-person report of unexplained compulsion is compatible with that model. The report neither verifies the model nor identifies its cause uniquely.

*Proof.* Proposition P.16.1 supplies the conditional transition, while the additional observation record supplies the stated reconstruction failure. Compatibility follows. No converse or causal-identification statement is asserted. ∎

### P.16.7 Recovery of the Pre-Theoretic Vocabulary

The cross-cultural vocabulary for deep-rational acts — *daimon, muse, fate, synchronicity, possession*, and related terms — has historically been read either as evidence of non-mechanical agency or as primitive cognitive error. The framework supports a third reading, grounded in the formal results above and tabulated below by epistemic status.

**Remark P.16.4 (Vocabulary as Faithful Reporting).** Several of the traditional terms can be read as picking out different aspects of the same structural phenomenon:

- "Possession" / "the spirit moved me" — experienced loss of authorship by $\mathcal{D}_S$ when $U_S$'s trajectory-shaping outruns the deliberative subprocess (Corollary P.16.2).
- "Tacit knowledge" (Polanyi 1966) — sub-introspective $U_S$-biasing of expert performance below $\mathcal{D}_S$'s introspective access.
- "Strange loop" (Hofstadter 1979) — the topology of self-reference whose closure under SPAP generates $\mathcal{L}^{\neg}_S$.
- "Élan vital" (Bergson 1907) — apparent directedness of long-run PCE-optimized trajectories near $\mathcal{L}^{\neg}_S$.

Remark P.16.5 below separates these by epistemic status and adds the terms that require multi-system machinery.

**Remark P.16.5 (Term-by-Term Interpretation with Epistemic Status).** The vocabulary below is an interpretive comparison, not an empirical reduction theorem. Each row retains the certificates and dynamics hypotheses of the cited formal result.

| Traditional term(s) | PU comparison locus | Epistemic status |
|:--|:--|:--|
| *Intuition*, *inspiration*, *the muse*, *tacit knowing*, *hunch* | A registered cost comparison not reconstructed by $\mathcal D_S$ | **Interpretive compatibility only; no theorem maps a phenomenological category to $U_S$.** |
| *Compulsion*, *vocation*, *“the call”*, *daimon-as-inner-pull*, *being moved* | Proposition P.16.1 and Corollary P.16.2 after their explicit ledger and observation hypotheses | **Conditional model consequence; not a diagnosis or unique explanation.** |
| *Personal fate*, *character-as-destiny*, *karma-as-trajectory-constraint* | The trajectory branch of Theorem P.16.1 with its explicit PCE-objective hypothesis | **Conditional mathematical analogy; no empirical identification theorem.** |
| *Synchronicity*, *cosmic fate*, *providence-in-the-large*, *karma-as-cosmic-bookkeeping* | The coupled bias model, if its per-system dynamics and kernel certificates are independently supplied | **Conditional model analogy; support exclusion additionally requires Hypothesis 14.5.8.** |

Terms used across rows must be disambiguated before comparison. None of the mappings supplies evidence for the traditional ontology.

### P.16.8 Relation to Existing PU Results

The present section introduces definitions and a conditional synthesis. Its dependencies and remaining certificates are:

| Section P.16 result | Required inputs |
|:--|:--|
| Definition P.16.1 (Prohibition Set) | Definition M.10.3; Theorem M.10.4 only on its realized nonempty diagonal branch |
| Definition P.16.2 (Coupled Prohibition Set) | Definition P.16.1 and a registered joint support |
| Definition P.16.3 (Cost Potential $U_S$) | A declared realizer class and a uniform Theorem-M.10.3 reduction certificate |
| Lemma P.16.1 | Definition P.16.3, nonempty realized targets, and Theorem M.10.6's completed-integration scope |
| Theorem P.16.1 | Lemma P.16.1 plus an explicit PCE objective on one viable comparison class; heat additionally requires Theorems M.10.7 and 31; stress-energy additionally requires Definition B.8 or Proposition N.8.1's retained coupling ledger |
| Theorem P.16.2 | Theorem P.16.1 and a separately registered introspective-access limitation for the cost comparison at issue |
| Proposition P.16.2 and Corollary P.16.1 | The per-system dynamics certificates plus the declared kernel-mediation branch; support exclusion additionally requires Hypothesis 14.5.8 |
| Proposition P.16.1 and Corollary P.16.2 | A finite window, disjoint cost ledgers, a viable alternative, a strict comparison, and the stated observation record |

The contribution is interpretive and synthetic. The prohibition set is not a physical source by itself, and the framework derives no heat, stress-energy, measurable response, behavior, or phenomenological category without the corresponding row's additional data.

### P.16.9 Relation to the Paradox-Avoidance Residue (Section 14.5.8)

The certificate-relative cost stratification of Definition P.16.3 and Lemma P.16.1 is logically distinct from the Environmental SPAP Hypothesis. The trajectory, coupled-bias, thermodynamic, stress-energy, and phenomenological claims retain their own explicit dynamics, implementation, coupling, and observation hypotheses. Hypothesis 14.5.8 would add kernel-support exclusion; it cannot supply any missing reset, localization, response, or PCE-objective certificate, and it is not derivable from the present SPAP and cost-stratification results.

### P.16.10 Summary

On a realized nonempty prohibition branch with a uniform reduction certificate, $\mathcal L_S^{\neg}$ supports the extended computational lower-bound stratification $U_S$ of Definition P.16.3. It is not a positive degree of freedom or a physical source. Trajectory bias requires the explicit PCE-objective hypothesis of Theorem P.16.1; heat requires Theorem M.10.7 and Theorem 31; stress-energy requires a retained localization and coupling ledger; coupled support exclusion requires Hypothesis 14.5.8; and phenomenological comparisons remain conditional interpretations rather than empirical reductions. The section's defensible contribution is this certificate-separated vocabulary.

## P.16a Population-Parameter Status of Apparent Free Constants

This section records, in registry-aligned form, a structural reframing of fine-tuning that is implicit in the framework's existing apparatus and is here stated explicitly as an open conjectural row. The reframing is methodological in the sense of Section P.5.3 and Definition P.5.2: it does not adopt a literal-simulator ontology and does not promote any sector. It records the open structural hypothesis suggested by the joint discipline of PPI (Definition P.6.2), PCE (Definition 15, Section 6.1.2), the strict-certificate ledger (Convention P.14.1k), and the structured-novelty conditions (Definition P.2.5.1) once the MPU population is treated as structural input rather than as an external knob.

### P.16a.0 Primitive-Emergent Architecture of the Framework

Before stating the population-parameter content, this subsection records the architectural distinction between the framework's primitive layer and its emergent layer. The distinction is organizational: it does not change any proof, branch status, or certificate status already assigned elsewhere in the manuscript.

**Definition P.16a.0.1 (Primitive Layer of PU).** The *primitive layer* of the Predictive Universe framework consists of the following four elements, each carried with the status supplied by its cited source:

1. *Prediction under finite-resource constraint.* The framework operates on predictive activity executed by finite-resource finite-time systems, with information having the operational form of Definition 1, predictive cycling having the form of Definition 4, finite-resource costs governed by Definition 3 and Definition 15, and physical instantiation governed by Definition P.6.2.
2. *SPAP as objective logical constraint.* In any uniform retained Property-R model class satisfying the finite diagonal-closure conditions of §A.0.2 (Theorem A.0.1; Corollary A.0.1), no single deterministic or probabilistic predictor can guarantee perfect self-prediction uniformly across all constructible self-predicting systems, by the diagonal arguments of Theorems 10–11. This impossibility is structural at that scope: it follows from the form of self-reference in predictive systems with retained finite-program representation, simulation, predicate evaluation, memory, Boolean post-processing, and self-coding closure.
3. *Finite-resource cost-minimization under the modeling stance of Section P.5.3.* Under the methodological model of Section P.5.3 and Definition P.5.2, viable finite-resource configurations are evaluated by compression efficiency. PCE (Definition 15, Section 6.1.2) and its potential $V$ (Definition D.1) give the operational expression of this selection discipline. The structured-novelty requirements are supplied by Definition P.2.5.1.
4. *MPU population parameter $N$ for structured novelty.* The MPU is the minimal predictive unit on the current minimal branch fixed by the SPAP register, the $d_0=8$ carrier, the active-inactive split, and the recurrent ledger. The population parameter $N$, together with topology, channel-capacity data, and retained-response data, is a population-level input that can affect which structured configurations are instantiated. By Theorem P.1, a single-MPU substrate cannot instantiate an SM-like chiral gauge sector; by Thesis P.2.5.1a, structured novelty is naturally realized by plurality. The framework therefore uses MPU populations whenever structured novelty or SM-like chirality is at issue.

**Definition P.16a.0.2 (Emergent Layer of PU).** The *emergent layer* of the Predictive Universe framework consists of standard physical structures recovered from the primitive layer through the existing derivation chains, with each component inheriting its stated certificate status:

1. *Quantum mechanics emerges from the primitive layer* through Section 8 and Appendix G. The complex Hilbert structure is selected by Theorem G.1.8 from real, complex, and quaternionic alternatives; Theorem 15 supplies $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$, Theorem 23 supplies the Hilbert-carrier bound $d_0\ge N_{\mathrm{vis}}^{\min}$, and Theorem Z.2 selects $d_0=8$ on the minimal PCE branch; Born weights are supplied by Proposition 7 and Theorem G.1.7 through the POP/PCE noncontextual frame-functional machinery.
2. *The Standard Model structural sector emerges from the primitive layer* through Appendix G and Appendix R. The inactive-sector module decomposition is selected by Theorem G.8.4b, and the gauge algebra $\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak{u}(1)$ is selected by Corollary G.8.4c on that finite-response capacity branch; the impossibility of a single-MPU SM-like chiral sector is Theorem P.1; the generation count $N_g=3$ is established by Theorem R.3.4 and Proposition R.3.5.1a on the pre-flavor family-redundancy PPI branch. Later threshold, flavor, and baryogenesis numerics retain the status assigned by Convention P.14.1k.
3. *General relativity emerges from the primitive layer* through Section 11, Section 12, and Appendix O. The regular continuum and Lorentzian-signature results retain their stated certificates. Independently, Definition Z.9a and Theorems Z.10--Z.11 select the least feasible $D=4$ from a faithful $24$-mode shell, the $K(3)=12$ obstruction, and the regular $24$-cell. The local Einstein equation is then derived as a Clausius relation on the separate certified horizon branch.

**Remark P.16a.0.1 (Two-Tier Organization).** Definitions P.16a.0.1 and P.16a.0.2 record an organization, not an additional derivation. The primitive layer is primitive relative to the emergence of standard physical theories: it supplies the predictive, SPAP, finite-resource, and population-configuration constraints from which the emergent layer is derived. When an item in the primitive layer is itself theorem-level inside the manuscript, its primitive role here means only that later physical sectors use it as an upstream constraint.

**Remark P.16a.0.2 (Inverted Foundational Status of Laws).** Under the two-tier organization, physical laws are not independent carriers added to MPU activity. They are descriptions of stable regularities in how MPU populations behave under finite-resource PPI/PCE selection. The Schrödinger equation is the effective description of predictive activity on the Hilbert branch where unitary ray dynamics is selected by the Section 8 symmetry and PCE hypotheses. The Einstein equation is the effective description of interaction-topology geometry on the branch where Lorentzian metric structure and horizon thermodynamics are the admissible representation of channel-capacity flow. The Standard Model gauge algebra is the admissible inactive-sector gauge structure on the finite-response capacity and anomaly branch. The inversion does not weaken the predictive accuracy of the laws; it relocates their status from foundational postulate to emergent finite-response regularity.

**Remark P.16a.0.3 (Methodological Status of Population Selection Language).** Informal language saying that $N$ is "set" means only that $N$ is a datum of the population configuration under the modeling stance of Section P.5.3, in a regime satisfying Definition P.2.5.1. It does not assert a literal external simulator. The source of the population configuration may be modeled as an authentic simulation source, an inflationary or anthropic selection regime, an autonomous self-organizing finite-resource process, or any other source compatible with the PPI/PCE discipline. This section uses only the structural fact that the population configuration is an input to the finite-response derivation chain.

### P.16a.1 The Population Configuration

**Definition P.16a.1 (Population Configuration).** A *population configuration* is a finite tuple
$$
\mathcal P=(N,\mathcal T,\mathcal K,\rho)
$$
where:

1. $N\in\mathbb N_{>0}$ is the finite number of MPUs in the configuration, each MPU lying on the minimal SPAP-compatible branch with three registers, carrier dimension $d_0=8$, active kernel $a=2$, inactive complement $b=6$, SPAP cycle, and active-inactive interface.
2. $\mathcal T$ is the finite interaction topology specifying which MPUs interact and through which retained channels.
3. $\mathcal K$ is the finite channel-capacity assignment specifying the capacity datum of each retained interaction channel, subject to the finite-capacity constraint of Theorem E.2 and its branch refinements.
4. $\rho$ is the finite-response retention class specifying which protocol-response distinctions are retained on the configuration.

A population configuration is *admissible* when it satisfies PPI (Definition P.6.2) at finite resource cost and satisfies the structured-novelty conditions of Definition P.2.5.1 at the configuration level. For fixed $N$, write
$$
\mathcal A_N
:=
\{\mathcal P=(N,\mathcal T,\mathcal K,\rho):\mathcal P\text{ is admissible}\}/\sim_0
$$
for the population-configuration admissibility class modulo response-null equivalence, where $\sim_0$ identifies configurations with the same retained finite protocol-response data and no lower PPI/PCE cost after response-null surplus is quotiented out, in the finite-response discipline of Corollary P.6.1b.8 and Corollary P.6.1b.8b.

**Definition P.16a.2 (Joint Structural Determination).** Let $\mathfrak X_{\mathrm{PU}}$ denote the family of sector outputs routed through Convention P.14.1k, including closed rows and certificate-pending or open rows with their current status labels. Let
$$
\mathfrak L_0=(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4)
$$
denote the recurrent minimal-branch ledger on the current proof graph. The configuration $\mathcal P$ *jointly determines* $\mathfrak X_{\mathrm{PU}}$ relative to $\mathfrak L_0$ when the following finite factorization datum exists.

For every output $X_i\in\mathfrak X_{\mathrm{PU}}$ there is an admissible map
$$
F_i:
(\mathfrak L_0,\mathcal P,\mathfrak C_i)
\longrightarrow
\mathcal O_i/\!\sim_i
$$
such that the existing derivation chain for $X_i$ equals $F_i$ after descent to the PPI/PCE response quotient. Here $\mathfrak C_i$ is exactly the current certificate gate or accepted finite certificate already recorded for the sector in Convention P.14.1k; it is not an additional numerical parent datum. For every pair of sectors with an accepted overlap map
$$
O_{ij}:\mathcal O_i/\!\sim_i\to\mathcal O_j/\!\sim_j,
$$
the square commutes:
$$
O_{ij}\circ F_i = F_j
$$
on their common retained parent domain. If the overlap is represented by maps in both directions, both commutativities are required on the intersection of the retained domains. Thus joint determination requires not only sectorwise factorization through $(\mathfrak L_0,\mathcal P,\mathfrak C_i)$, but also compatibility of all accepted overlap maps.

The joint determination is *exclusive* when any proposed value of an output $X_i$ not produced by the factorization either fails an admissibility condition, changes a retained finite response and is therefore a different branch, violates an overlap commutativity condition, or is response-null surplus removed by the PPI quotient. For open and certificate-pending rows, this definition records the condition that a completed audit would have to establish; it does not assert that the audit has already closed.

**Local refutation rule.** The factorization data $(F_i,\{O_{ij}\})$ make Definition P.16a.2 sectorwise falsifiable. If any sector $i\in\mathfrak X_{\mathrm{PU}}$ admits no admissible map $F_i$ factoring through $(\mathfrak L_0,\mathcal P,\mathfrak C_i)$ — equivalently, if the existing derivation chain for $X_i$ requires a numerical parent datum not contained in $\mathfrak L_0$, in $\mathcal P$, in the registered certificate gate $\mathfrak C_i$ of Convention P.14.1k, or transported through an accepted overlap map — then joint structural determination fails at sector $i$ and Conjecture P.16a.1 is refuted at that sector under the stability clause. If any pair $(i,j)$ has an accepted overlap map $O_{ij}$ but the equality $O_{ij}\circ F_i=F_j$ fails on the common retained parent domain, joint determination fails at the pair $(i,j)$ and the conjecture is refuted at that pair. This local refutation rule is the sectorwise instance of the registry-stability clause of Conjecture P.16a.1 and is recorded here without modifying the conjecture's open status.

### P.16a.2 The Population-Tuning Conjecture

**Conjecture P.16a.1 (Population-Parameter Status of Apparent Free Constants).** The apparent free constants of nature — including but not limited to the fine-structure constant $\alpha^{-1}$, the cosmological-constant value $\Lambda L_P^2$, electroweak threshold data, CKM and PMNS mixing entries, the baryon asymmetry $\eta_B$, and determinant-prefactor data — are jointly determined by the population configuration $\mathcal P=(N,\mathcal T,\mathcal K,\rho)$ relative to the recurrent minimal-branch ledger $\mathfrak L_0$ in the sense of Definition P.16a.2. Equivalently, no independently free numerical parameter remains in the ledger-routed derivation chain beyond $\mathfrak L_0$, the population configuration $\mathcal P$, and the certificate gates already recorded in Convention P.14.1k.

**Stability under registry growth.** The conjecture is to be read with the following stability clause closing the "ledger-routed" scope. If a sector $S^*$ is later registered into Convention P.14.1k whose accepted parent data do not factor through $(\mathfrak L_0,\mathcal P,\text{registered gates})$, then either (i) a registered overlap map of Definition P.14.1k.0 reduces the parent data of $S^*$ to that union and the conjecture is preserved, or (ii) no such overlap map is registered and the conjecture is refuted at $S^*$. Re-scoping the phrase "ledger-routed" to absorb $S^*$ without supplying an overlap map of type (i) is not permitted; such a re-scoping is a registry change in the sense of Algorithm P.14.1m.0 and triggers refutation under (ii).

**Status.** Open conjectural row. The conjecture is not asserted as theorem, is not entered as a strict-certificate row promoting any numerical sector, and does not modify any existing closure status under Convention P.14.1k.

**Remark P.16a.1 (Relation to Existing Apparatus).** The conjecture is a registry-aligned statement of three observations already present in the apparatus. First, the strict-certificate reading of branch conditions (Convention P.14.1k) and the no-overclaim discipline (Convention P.14.1l) block free post-comparison adjustment of numerical outputs. Second, the framework uses populations of MPUs rather than isolated MPUs whenever structured novelty or SM-like chirality is at issue (Theorem P.1, Thesis P.2.5.1a, Section 11, Appendix N). Third, the existing sector derivations and registered candidate chains route through structural inputs that include minimal-branch data, topology or channel data, retained-response data, and finite certificates: Appendix Z for $\alpha^{-1}$, Appendix U for $\Lambda L_P^2$, Appendix T for electroweak and flavor sectors, and Appendix Y for $\eta_B$. The conjecture asserts that this union of recurrent ledger data, population-configuration data, accepted overlap maps, and registered certificate gates is exhaustive.


### P.16a.3 The Fine-Tuning Reframing

**Conjecture P.16a.2 (Fine-Tuning Dissolution Under Joint Determination).** Conditional on Conjecture P.16a.1, the standard fine-tuning argument applied to PU's content is malformed. The standard argument presupposes that constants of nature are independent free parameters that could each have been varied while keeping the surrounding law-structure fixed. In PU, a variation is physically meaningful only if it is branch-preserving. For a branch $\mathcal B$ and a sector output
$$
X_i=F_i(\mathfrak L_0,\mathcal P,\mathfrak C_i),
$$
define the branch-preserving counterfactual variation class
$$
\operatorname{Var}_{\mathcal B}(X_i)
=
\left\{
F_i(\mathfrak L_0,\mathcal P',\mathfrak C_i)
:
(\mathfrak L_0,\mathcal P',\mathfrak C_i)\in\mathcal B,
O_{ij}\circ F_i=F_j\text{ on every accepted overlap domain containing }i
\right\}.
$$
Here $\mathcal P'$ ranges only over finite population configurations satisfying the same branch predicate, the same certificate gate $\mathfrak C_i$, and the same accepted overlap constraints. A proposed variation $X_i\mapsto x'$ while holding the surrounding law-structure fixed is PU-admissible only if $x'\in\operatorname{Var}_{\mathcal B}(X_i)$. Independent variation of $X_i$ alone would require $x'\ne X_i$ in this class while every overlap-linked output $X_j$ remains fixed; absent a nontrivial fiber of the joint finite-response map, no such direction exists. If no such $\mathcal P'$ exists, the counterfactual is syntactically describable but physically non-admissible on $\mathcal B$. Conjecture P.16a.1 therefore denies the premise that apparent constants are independently free knobs; their precision reflects the precision of the structural framework producing them, not the precision of independent tuning.

**Status.** Open conjectural row, conditional on Conjecture P.16a.1.

**Remark P.16a.2 (Distinguishing Program).** Conjecture P.16a.1 is in principle distinguishable from its negation by a structural audit. For each apparent free constant in $\mathfrak X_{\mathrm{PU}}$, audit the existing derivation chain and determine whether every parent datum reduces to $\mathfrak L_0$ plus $\mathcal P$ data, modulo accepted overlap maps and current certificate gates. If every chain so reduces, Conjecture P.16a.1 is supported. If any chain requires an additional independent input not captured by $\mathfrak L_0$, $\mathcal P$, or the already registered certificate gate for that row, Conjecture P.16a.1 is refuted at that constant. The audit respects Convention P.14.1l: each constant's reduction status inherits the weakest unresolved dependency in its existing derivation chain.

**Corollary P.16a.3.1 (MPU Deletion Is Not an Appendix Z Core-Tuning Direction).** Let $\mathcal B_Z$ be the branch class of population configurations or post-deletion quotients satisfying the hypotheses of the minimal Appendix Z / PCE-attractor branch: the local minimal SPAP/PCE MPU branch, the active-inactive Landauer split, the QFI interface-mode count, the predictive-recovery MacWilliams rate branch for $k$, the finite-response Bures tangent-cell mode-channel contract, and the Appendix Z normalization branch of Theorem Z.26. Define branch-restricted maps by
$$
\Sigma_Z(\mathcal Q)=
\begin{cases}
\mathfrak L_0, & \mathcal Q\in\mathcal B_Z,\\
\bot, & \mathcal Q\notin\mathcal B_Z,
\end{cases}
\qquad
A_0(\mathcal Q)=
\begin{cases}
\alpha^{-1}_0, & \mathcal Q\in\mathcal B_Z,\\
\bot, & \mathcal Q\notin\mathcal B_Z,
\end{cases}
$$
where
$$
\mathfrak L_0=(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4),
$$
and $\alpha^{-1}_0$ is the Appendix Z sinc-core value of Theorem Z.26.

For $\mathcal P=(N,\mathcal T,\mathcal K,\rho)$ and $S\subseteq\{1,\ldots,N\}$, let $\mathcal P|_S$ denote the induced post-deletion configuration when $|S|>0$ and the chosen population model supplies either the induced finite-response subconfiguration or an admissibly relaxed finite-response quotient. If $S=\varnothing$, or if no post-deletion admissible configuration or quotient is supplied, set
$$
\Sigma_Z(\mathcal P|_S)=A_0(\mathcal P|_S)=\bot.
$$

Then every deterministic MPU deletion outcome satisfies exactly one of the two alternatives
$$
(\Sigma_Z(\mathcal P|_S),A_0(\mathcal P|_S))=(\mathfrak L_0,\alpha^{-1}_0)
$$
or
$$
(\Sigma_Z(\mathcal P|_S),A_0(\mathcal P|_S))=(\bot,\bot).
$$
In the first alternative,
$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)(\mathcal P|_S)=(3,8,\ln2,2,6,24,12,4)
$$
and
$$
A_0(\mathcal P|_S)=137.03609205522863\ldots.
$$
In the second alternative, the minimal Appendix Z branch assigns no real-valued core $\alpha^{-1}_0$ to the outcome. Hence MPU deletion cannot supply a continuous deformation parameter for the Appendix Z core.

For a random deletion law $\mu_f$ with random surviving set $S_f$, let
$$
E_f=\{\mathcal P|_{S_f}\in\mathcal B_Z\}.
$$
Whenever $\Pr(E_f)>0$,
$$
\Pr[\Sigma_Z(\mathcal P|_{S_f})=\mathfrak L_0\mid E_f]=1,
\qquad
\Pr[A_0(\mathcal P|_{S_f})=\alpha^{-1}_0\mid E_f]=1.
$$
If $\Pr(E_f)=0$, there is no conditional branch-survival statement and the branch-restricted maps take only the value $\bot$ almost surely. No universal deletion threshold $f_c$ follows from $\mathfrak L_0$ alone; such a threshold requires an additional population model specifying $\mathcal T$, $\mathcal K$, $\rho$, the deletion law, and the relaxation or rerouting rule.

Finally, $M=24$ is the internal QFI-active interface-mode count $M=2ab$ and the Bures tangent-cell channel count on the retained mode-channel branch. It is not, by Definition P.16a.1 or Theorem Z.5 alone, a theorem-level graph degree asserting twenty-four distinct neighboring MPUs. Therefore no formula
$$
n(f)=24(1-f)
$$
is branch-valid unless an added population graph model identifies interface modes with distinct neighboring MPUs and proves branch preservation after the specified deletion and relaxation rule. If the comparison row uses $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_0+R_\alpha$, the same deletion-rigidity conclusion applies to that certified value only when the same accepted residual gate $R_\alpha$ is preserved.

*Proof.* The definition of $\Sigma_Z$ and $A_0$ gives the off-branch value $\bot$ whenever $\mathcal P|_S$ is empty, not a population configuration, not an admissible quotient, or not on $\mathcal B_Z$. It remains to prove the on-branch value.

Assume $\mathcal P|_S\in\mathcal B_Z$. By branch membership, Theorem 15's (O1)–(O3), (FC) hypotheses give $K_0=3$; Hilbert distinguishability and Theorem Z.2's same-class comparator give $d_0=8$; the registered reachable binary quotient gives $\varepsilon_0=\ln2$; and Theorem Z.1's sharp-record, capacity, and no-surplus hypotheses give
$$
a=2.
$$
Hence
$$
b=d_0-a=8-2=6.
$$
Theorem Z.5 then fixes
$$
M=2ab=2\cdot2\cdot6=24,
$$
and Theorem Z.13b.0a on the predictive-recovery MacWilliams branch fixes
$$
k=M/2=12.
$$
Definition Z.9a and Theorem Z.10 give a faithful response-label injection and therefore
$$
M=24\le K(D).
$$
The faithful-shell bound gives $24\le K(D)$, and $K(3)=12$ excludes $D\le3$. The regular $24$-cell gives an explicit feasible shell in $D=4$; Definition Z.9a's strict surplus-dimension cost makes it the unique least-feasible choice. Therefore
$$
\Sigma_Z(\mathcal P|_S)=\mathfrak L_0.
$$

Theorem Z.7 gives
$$
u^*=d_0^{1/M}-1=8^{1/24}-1=2^{1/8}-1.
$$
Theorem Z.26 gives
$$
\alpha^{-1}_0
=
\frac{4\pi}{u^*}
-\frac{\pi}{\sqrt{K_0}}
+\frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*),
\qquad
\operatorname{sinc}(u)=\frac{\sin u}{u}.
$$
Substituting $K_0=3$ and $u^*=2^{1/8}-1$ gives
$$
\alpha^{-1}_0=137.03609205522863\ldots.
$$
Thus
$$
A_0(\mathcal P|_S)=\alpha^{-1}_0
$$
on $\mathcal B_Z$.

The two alternatives are exhaustive because every post-deletion object either lies in $\mathcal B_Z$ or does not. They are disjoint because $\bot$ is not a real number and is not equal to $\mathfrak L_0$ or $\alpha^{-1}_0$. A continuous real-valued deletion deformation would be a function whose values lie in the real-valued range of $A_0$ on $\mathcal B_Z$, but that range is the singleton $\{\alpha^{-1}_0\}$; hence every such function is constant. This excludes a nonconstant continuous branch-restricted deformation.

For random deletion, conditioning on $E_f$ restricts the outcome space to branch-surviving outcomes. The deterministic result applies pointwise on every outcome in $E_f$, giving both conditional probabilities equal to one whenever $\Pr(E_f)>0$. If $\Pr(E_f)=0$, conditional probability given $E_f$ is not defined, so no conditional branch-survival assertion is made. The threshold and graph-degree statements follow because neither Definition P.16a.1 nor Theorem Z.5 supplies a deletion law, a topology-to-mode injection, or a branch-preserving relaxation theorem; without those extra data, the only branch-restricted codomain just proved is
$$
\{(\mathfrak L_0,\alpha^{-1}_0),(\bot,\bot)\}.
$$
∎

### P.16a.4 Variational Packaging of PCE Selection on the Population Admissibility Class

This subsection records, as notational compression, that PCE selection on $\mathcal A_N$ admits a variational form parallel to the principle of least action. Because $\mathcal A_N$ is a finite-response quotient and may be finite, compact, stratified, or branch-dependent rather than a smooth manifold, the variational symbol is used in the global admissible-minimizer sense defined below.

**Definition P.16a.4.1 (Population PCE Potential).** Let $V$ denote the PCE potential of Definition D.1,
$$
V(x)=V_{op}(x)+V_{prop}(x)-V_{benefit}(x)+V_{penalty}(x),
$$
where $V_{op}$ and $V_{prop}$ are operational and propagation costs, $V_{benefit}$ is the power-equivalent predictive benefit, and $V_{penalty}$ contains the branch-required consistency penalties of Definition D.1. In particular, proxy-alignment and geometric-regularity penalties are included where the branch requires them; SPAP and viability restrictions enter through the admissible class and, when encoded in the branch functional, through $V_{penalty}$. The *population PCE potential* is the descended restriction
$$
V_{\mathcal A_N}:\mathcal A_N\to\mathbb R\cup\{+\infty\}
$$
defined by
$$
V_{\mathcal A_N}([\mathcal P])
:=
\inf\{V(x):x\text{ realizes a representative of }[\mathcal P]\}.
$$
When $V$ is already invariant under response-null equivalence on the branch, this is simply $V|_{\mathcal A_N}$. When the domain is clear, $V$ denotes this descended restricted functional.

**Definition P.16a.4.2 (Admissible Variational Stationarity).** For $[\mathcal P_\star]\in\mathcal A_N$, write
$$
\delta_{\mathcal A_N}V([\mathcal P_\star])=0
$$
if and only if the infimum is attained at $[\mathcal P_\star]$:
$$
V_{\mathcal A_N}([\mathcal P_\star])=\min_{[\mathcal P]\in\mathcal A_N}V_{\mathcal A_N}([\mathcal P]).
$$
The compressed expression
$$
\delta V=0\quad\text{on}\quad\mathcal A_N
$$
means $\delta_{\mathcal A_N}V([\mathcal P_\star])=0$ for the selected response-equivalence class. If the infimum is not known to be attained, the notation records only a minimizing-sequence condition and no selected class is asserted. On a smooth interior stratum, an attained global minimizer implies the ordinary first-variation condition along all admissible tangent variations. On a row carrying a strict PPI/PCE certificate whose quotient and functional match the relevant admissible class, existence and uniqueness modulo response equivalence are supplied by Theorem D.8.9b.

**Proposition P.16a.4.1 (Variational Form of PCE Selection on $\mathcal A_N$).** On any branch for which $\mathcal A_N$ is nonempty and the descended potential $V_{\mathcal A_N}$ has an attained PCE minimizer, PCE selection on $\mathcal A_N$ in the sense of Definition 15 and Definition D.1 is exactly the condition
$$
[\mathcal P_\star]\in\operatorname*{argmin}_{[\mathcal P]\in\mathcal A_N}V_{\mathcal A_N}([\mathcal P]),
$$
equivalently
$$
\boxed{\delta V=0\ \text{on}\ \mathcal A_N}.
$$
When the relevant row carries a strict PPI/PCE certificate for the same quotient and descended functional, existence and uniqueness of the selected class modulo response equivalence are supplied by Theorem D.8.9b. When the relevant row is open or certificate-pending, the variational packaging preserves that status and does not assert existence, uniqueness, or closure beyond the row's current gate.

*Proof.* Definition 15 states PCE as selection by compression efficiency: predictive benefit is maximized net of operational, propagation, and penalty costs. Definition D.1 represents this tradeoff by the functional $V$. Passing to $\mathcal A_N$ keeps exactly the admissible finite-response population configurations of Definition P.16a.1 and removes response-null surplus by the quotient. The descended functional $V_{\mathcal A_N}$ is therefore the PCE potential evaluated on the retained population response classes. On a branch where an attained minimizer exists, PCE selection on that class is precisely minimization of $V_{\mathcal A_N}$ over $\mathcal A_N$. By Definition P.16a.4.2, this minimization condition is exactly $\delta_{\mathcal A_N}V=0$, written $\delta V=0$ on $\mathcal A_N$. If the row has a strict PPI/PCE certificate for the same quotient and descended functional, Theorem D.8.9b gives existence and uniqueness modulo response equivalence. If it lacks such a certificate, Convention P.14.1l prevents the variational notation from asserting existence, uniqueness, or closure. ∎

**Remark P.16a.4.1 (Three Symbols, Three Commitments).** The expression $\delta V=0$ on $\mathcal A_N$ compresses three commitments. The symbol $\delta$ records selection, not arbitrary choice. The potential $V$ records PCE after descent to the retained response quotient: cost minus predictive benefit plus penalty. The admissibility class $\mathcal A_N$ records PPI, the response-null quotient, and the population data $(N,\mathcal T,\mathcal K,\rho)$. SPAP enters through the unit-level bound on each MPU and through whatever branch-level SPAP admissibility or penalty gate is part of $V_{\mathcal A_N}$. No element of $\mathcal A_N$ is a perfect self-predictor.

**Corollary P.16a.4.1 (Specialization to the Action Principle).** On any branch $\mathcal B\subseteq\mathcal A_N$ where the descended restricted PCE potential has an attained minimizer and has the form
$$
V_{\mathcal A_N}([\mathcal P])=c+\lambda_{\mathcal S}\mathcal S([\mathcal P])
$$
for all admissible variations in $\mathcal B$, with $c$ constant and $\lambda_{\mathcal S}>0$, Proposition P.16a.4.1 reduces, in the same admissible-minimizer sense, to the least-action condition
$$
\delta\mathcal S=0
$$
on $\mathcal B$. When Theorem Q.0.1 and Corollary Q.0.1 apply, $\mathcal S=\kappa_A\sum_i\varepsilon_i$ on a calibrated branch, so this specialization is the action-entropy accounting branch of the same PCE variational selection.

*Proof.* Since $c$ is constant and $\lambda_{\mathcal S}>0$, the ordering of candidates by $V_{\mathcal A_N}$ on $\mathcal B$ is identical to the ordering by $\mathcal S$. Hence the attained minimizers of $V_{\mathcal A_N}$ on $\mathcal B$ are exactly the attained minimizers of $\mathcal S$ on $\mathcal B$. Applying Definition P.16a.4.2 to $V$ and to $\mathcal S$ gives equivalence of $\delta V=0$ and $\delta\mathcal S=0$ on that branch. Theorem Q.0.1 supplies the $\Gamma$-limit action branch and Corollary Q.0.1 supplies the action-entropy identity on branches where $\mathcal S=\kappa_A\sum_i\varepsilon_i$ on a calibrated branch, so the action principle is a specialization of the population PCE variational condition. ∎

**Remark P.16a.4.2 (No New Equation of Motion).** Proposition P.16a.4.1 and Corollary P.16a.4.1 do not introduce a new dynamical law. The stochastic gradient flow of Appendix D is the dynamical representative of the same potential $V$; the expression $\delta V=0$ records the selected admissible class, and Equation (D.0) records one branch-level adaptation dynamics converging toward low-$V$ regions under the stated hypotheses.

### P.16a.5 Conservative Extension

**Theorem P.16a.1 (Conservative Extension Over the Existing Status Ledger).** Adding Section P.16a is conservative over Convention P.14.1k and Convention P.14.1l. Specifically:

1. Every branch accepted before this section remains accepted.
2. Every branch rejected before this section remains rejected.
3. No theorem-level, certificate-pending, model-layer, or open row of Convention P.14.1k is promoted or demoted by this section alone.
4. No description-layer numerical output is reinterpreted as a selection-layer assertion, and no selection-layer assertion is reinterpreted as a description-layer numerical output.
5. No new strict certificate is registered, no new parent invariant is asserted to exist, and no bridge condition is closed.
6. The recurrent ledger remains in the current-graph non-collapse status of Theorem R.3.5e.3, with the future common parent invariant remaining open in the sense of Remark R.3.5e.5 and the parent-datum schema gate remaining bookkeeping only in the sense of Remark R.3.5e.5a.
7. Conjecture P.16a.1 and Conjecture P.16a.2 carry status open.
8. Corollary P.16a.3.1 is a branch-restricted guardrail over already accepted Appendix Z data; it introduces no deletion threshold, graph-degree axiom, sector value, residual gate, or promotion entry.

*Proof.* Section P.16a introduces two organizational definitions (Definitions P.16a.0.1 and P.16a.0.2), a population-configuration definition (Definition P.16a.1), a joint-determination definition (Definition P.16a.2), two open conjectures (Conjectures P.16a.1 and P.16a.2), a structural distinguishing program (Remark P.16a.2), a deletion guardrail for the Appendix Z core (Corollary P.16a.3.1), and a variational packaging of PCE selection on $\mathcal A_N$ (Definitions P.16a.4.1 and P.16a.4.2, Proposition P.16a.4.1, Corollary P.16a.4.1). Definitions and remarks do not modify any strict certificate of Definition D.8.9a. The conjectures are explicitly open. Corollary P.16a.3.1 is conditional on branch survival and has codomain $\{(\mathfrak L_0,\alpha^{-1}_0),(\bot,\bot)\}$; on branch it only restates the existing Appendix Z minimal ledger and Theorem Z.26 core, while off branch it returns $\bot$. It does not supply a topology-to-mode injection, a deletion law, a rerouting theorem, a threshold $f_c$, or a residual gate. Proposition P.16a.4.1 is a conditional restatement of Definition 15 and Definition D.1 after descent to the admissible quotient $\mathcal A_N$ on branches where a minimizer is already supplied or certified; it supplies no new selected sector value. Corollary P.16a.4.1 is conditional on the exact branch condition $V=c+\lambda_{\mathcal S}\mathcal S$ and uses Theorem Q.0.1 and Corollary Q.0.1 only where they already apply. By Convention P.14.1l, status propagation in the global ledger follows the meet rule on the dependency graph of Convention P.14.1k; open or certificate-pending observable maps cannot promote a child row to theorem-level status. Section P.16a introduces no new registered dependency edge, overlap map, or closure map. Corollary P.16a.3.1 registers no certificate schema entry of Definition P.14.1m. By Algorithm P.14.1m.0, registry promotions require the schema fields of Definition P.14.1m to be supplied at the appropriate status; this section supplies no promotion entry. Therefore items 1–8 hold. ∎

### P.16a.6 Summary

The framework's existing commitments — finite-resource prediction, SPAP, PPI/PCE selection, MPU populations, and the strict-certificate ledger — support an open structural reframing of apparent free constants. The recurrent minimal-branch ledger $\mathfrak L_0=(3,8,\ln2,2,6,24,12,4)$ supplies the discrete backbone; the population configuration $\mathcal P=(N,\mathcal T,\mathcal K,\rho)$ supplies the finite-response population input. Conjecture P.16a.1 asserts that these two structural sources exhaust the parent data for the ledger-routed apparent constants, subject to the current certificate gates. Conjecture P.16a.2 states the corresponding fine-tuning reframing: if the constants are joint readouts rather than independent knobs, the standard fine-tuning argument is malformed when it treats syntactically writable parameter changes as physical alternatives without checking the branch-preserving variation class $\operatorname{Var}_{\mathcal B}$. Corollary P.16a.3.1 records the branch-restricted deletion boundary for the Appendix Z core: an MPU deletion either preserves $(\mathfrak L_0,\alpha^{-1}_0)$ exactly on the same branch or returns $(\bot,\bot)$ through the branch-restricted maps, and $M=24$ is not a graph-degree count without an added population graph theorem. The compact expression $\delta V=0$ on $\mathcal A_N$ records the same PCE selection in variational form whenever an attained selected class is available, with $\delta\mathcal S=0$ recovered on the corresponding action branch. The section is conservative over the existing status ledger (Theorem P.16a.1).

## P.16b Perspective-Indexed Semantics, Description-Arity, and Creative Decompression

### P.16b.0 Standing and Scope

This section extends the philosophical foundations by formalizing six semantic and interpretive structures in PU notation:

1. role-indexed self-reference and the failure of the Universality Assumption;
2. perspective-indexed closure and guarded cross-perspective adoption;
3. local classicality with global holonomy or process-type obstruction;
4. cogito-centered perspective geometry;
5. shape recognition, decompression, and bounded creative transfer;
6. dual-layer symbolic compression inside collective predictive model presentations.

This section introduces no new physical primitive. It is a semantic, epistemic, and philosophical extension of the existing operational PU layer. Physical consequences require the independent physical branch certificates already stated elsewhere in the manuscript.

The results below are theorem-level only on their named semantic branches. General claims beyond those branches are stated as conjectures or boundary principles.

---

### P.16b.1 Role-Indexed Evaluation and the Universality Assumption

**Definition P.16b.1.1 (Universality Assumption).**

The **Universality Assumption** is the claim that every evaluable content admits a single final evaluation independent of evaluative role, perspective, and context.

In its strongest Boolean form it asserts a total map
$$
\tau:\mathrm{Sent}\to\{0,1\},
$$
where $1$ denotes true and $0$ denotes false.

In reflexive contexts the stronger hidden form is the role-collapse condition:
$$
v_P(E)=v_T(E),
$$
where $P$ is the evaluator or pointer role and $T$ is the evaluated or target role.

**Definition P.16b.1.2 (Role-Indexed Reflexive Evaluation).**

A reflexive evaluation datum is a tuple
$$
\mathfrak R=(E,P,T,F,v_P,v_T)
$$
where:

1. $E$ is an expression or content item;
2. $P$ is the pointer/evaluator role;
3. $T$ is the target/evaluated role;
4. $F$ is a value transformation;
5. $v_P(E)$ is the value of $E$ in the pointer role;
6. $v_T(E)$ is the value of $E$ in the target role.

The role-indexed evaluation equation is
$$
v_P(E)=F(v_T(E)).
\tag{P.16b.1.1}
$$

**Theorem P.16b.1.3 (Liar Contradiction Requires Role Collapse).**

Let $F(v)=1-v$ on Boolean values. The role-indexed Liar equation
$$
v_P(L)=1-v_T(L)
\tag{P.16b.1.2}
$$
is consistent as a relation between two roles. A contradiction follows exactly when the additional role-collapse condition
$$
v_P(L)=v_T(L)
\tag{P.16b.1.3}
$$
is imposed.

*Proof.* Equation (P.16b.1.2) alone relates two possibly distinct role-values. For example, $v_T(L)=0$ and $v_P(L)=1$ satisfies it; likewise $v_T(L)=1$ and $v_P(L)=0$ satisfies it. Hence the role-indexed relation is satisfiable.

If (P.16b.1.3) is added, write the common value as $v$. Substituting into (P.16b.1.2) gives
$$
v=1-v.
$$
There is no Boolean solution: if $v=0$, then the equation gives $0=1$; if $v=1$, it gives $1=0$. Therefore contradiction is produced by the conjunction of reflexive negation and role collapse.

Conversely, if no role-collapse condition is imposed, the satisfying assignments displayed above show that no Boolean contradiction follows. ∎

**Corollary P.16b.1.4 (The Liar as a Diagnostic of Unindexed Evaluation).**

The Liar sentence does not by itself refute local Boolean reasoning. It exposes that the demand for one unindexed role-insensitive value is an additional assumption.

*Proof.* Theorem P.16b.1.3 shows that the contradiction is absent before role collapse and present after role collapse. Thus the failure is located in unindexed role collapse, not in ordinary Boolean evaluation inside one fixed role. ∎

**Theorem P.16b.1.5 (Stabilizing and Destabilizing Reflexive Transformations).**

For a reflexive evaluation equation
$$
v_P=F(v_T),
$$
role collapse produces the fixed-point equation
$$
v=F(v).
\tag{P.16b.1.4}
$$
If $F$ has a fixed point, the collapsed reflexive structure may stabilize. If $F$ has no fixed point in the value domain, the collapsed structure is obstructed.

*Proof.* Under role collapse $v_P=v_T=v$, and the role-indexed equation becomes (P.16b.1.4). A stable collapsed value is precisely a solution of (P.16b.1.4). If such a solution exists, assigning $v$ to both roles satisfies the collapsed equation. If no such solution exists, no collapsed assignment satisfies it. ∎

**Corollary P.16b.1.6 (Cogito Contrast).**

The cogito pattern is stabilizing rather than Liar-like when the relevant transformation is identity or presence-confirming. In that case the collapsed equation is
$$
v=v,
$$
or a closure fixed-point condition rather than a negating contradiction.

*Proof.* Apply Theorem P.16b.1.5 with $F(v)=v$ or with an extensive closure operator whose fixed points exist by Theorem P.16b.6.2 below. ∎

---

### P.16b.2 Perspective-Indexed Closure

**Definition P.16b.2.1 (Labeled Values and Validating Perspectives).**

Let $P$ be a nonempty set of perspectives and let $V$ be a nonempty set of values. A labeled value is written
$$
a(s),
$$
where $a\in V$ and $s\in P$.

A validating perspective $p\in P$ evaluates directed judgments of the form
$$
a(s)\longrightarrow c(u).
$$
Let
$$
D:=P\times P\times V\times V.
$$
A configuration is a family
$$
R=(R_p)_{p\in P},
\qquad
R_p\subseteq D.
$$
The interpretation is
$$
(s,u,a,c)\in R_p
$$
iff, from validating perspective $p$, the labeled value $a(s)$ relates to the labeled value $c(u)$.

**Definition P.16b.2.2 (Base Kernels and CPA Guards).**

For each $p\in P$, let
$$
R_p^\circ\subseteq D
$$
be the base kernel of judgments accepted at $p$.

A Cross-Perspective Adoption guard is a function
$$
\mathrm{CPA}_p:P\times P\to\{0,1\}.
$$
The value
$$
\mathrm{CPA}_p(q,u)=1
$$
means that $p$ is allowed to adopt a judgment validated by $q$ when the target perspective is $u$.

**Definition P.16b.2.3 (Closure Operator).**

Let
$$
\mathcal L:=\prod_{p\in P}\mathcal P(D)
$$
ordered by pointwise inclusion. Define
$$
T:\mathcal L\to\mathcal L
$$
by the following clauses for each $p$.

**Seed.**
$$
R_p^\circ\subseteq (T(R))_p.
$$

**Reflexivity.** For every $s\in P$ and $a\in V$,
$$
(s,s,a,a)\in (T(R))_p.
$$

**Same-perspective transitivity.** If
$$
(s,t,a,b)\in R_p
$$
and
$$
(t,u,b,c)\in R_p,
$$
then
$$
(s,u,a,c)\in (T(R))_p.
$$

**Guarded cross-perspective adoption.** If
$$
(s,t,a,b)\in R_p,
$$
$$
(t,u,b,c)\in R_q,
$$
and
$$
\mathrm{CPA}_p(q,u)=1,
$$
then
$$
(s,u,a,c)\in (T(R))_p.
$$

**Theorem P.16b.2.4 (Least Perspective Closure).**

The operator $T$ is monotone and Scott-continuous. Hence it has a least fixed point
$$
R^\star=(R_p^\star)_{p\in P},
$$
and
$$
R^\star=\bigcup_{n<\omega}R^{(n)},
\qquad
R^{(0)}=\bot,
\qquad
R^{(n+1)}=T(R^{(n)}).
$$

*Proof.* If $R\le S$, every premise available in $R$ is available in $S$. Each Seed, Reflexivity, Transitivity, and CPA conclusion generated from $R$ is therefore generated from $S$. Thus $T$ is monotone.

Let $\{R_i\}_{i\in I}$ be a directed family and set $R=\bigcup_iR_i$. If a tuple belongs to $T(R)$, it is either a Seed or Reflexivity tuple, in which case it belongs to $T(R_i)$ for every $i$, or it is generated by Transitivity or CPA from finitely many premises. Directedness gives an index $j$ containing all those premises. Hence the tuple belongs to $T(R_j)$. Therefore
$$
T\left(\bigcup_iR_i\right)=\bigcup_iT(R_i),
$$
so $T$ is Scott-continuous.

The lattice $\mathcal L$ is complete. By the Kleene fixed-point theorem for Scott-continuous maps on complete lattices with bottom, the least fixed point exists and is the union of the ascending chain from $\bot$. ∎

**Corollary P.16b.2.5 (Local Preorders).**

For each validating perspective $p$, define
$$
a(s)\preceq_p c(u)
\quad\Longleftrightarrow\quad
(s,u,a,c)\in R_p^\star.
$$
Then $\preceq_p$ is reflexive and transitive.

*Proof.* Reflexivity is inserted by the Reflexivity clause. Transitivity is closed by the same-perspective Transitivity clause at the fixed point. ∎

**Definition P.16b.2.6 (Labeled Proof System).**

Let $E_p(s,u,a,c)$ denote the judgment
$$
(s,u,a,c)\in R_p^\star.
$$
The proof rules are:

1. **Base:** if $(s,u,a,c)\in R_p^\circ$, infer $E_p(s,u,a,c)$;
2. **Refl:** infer $E_p(s,s,a,a)$;
3. **Trans:** from $E_p(s,t,a,b)$ and $E_p(t,u,b,c)$, infer $E_p(s,u,a,c)$;
4. **CPA:** from $E_p(s,t,a,b)$, $E_q(t,u,b,c)$, and $\mathrm{CPA}_p(q,u)=1$, infer $E_p(s,u,a,c)$.

**Theorem P.16b.2.7 (Soundness and Completeness of Labeled Proofs).**

For every $p,s,u,a,c$,
$$
\vdash E_p(s,u,a,c)
\quad\Longleftrightarrow\quad
(s,u,a,c)\in R_p^\star.
$$

*Proof.* Soundness follows by induction on proof height. Base and Refl match the Seed and Reflexivity clauses. Trans and CPA match the closure clauses defining $T$. Therefore every derivable judgment appears at some finite stage and hence in $R^\star$.

For completeness, suppose $(s,u,a,c)\in R_p^\star$. By Theorem P.16b.2.4, the tuple appears in some finite stage $R_p^{(n)}$. Induct on the least such $n$. Each tuple introduced at stage $n+1$ is introduced by one of the four defining clauses of $T$. The corresponding proof rule derives it from premises that appeared at earlier stages. The induction hypothesis supplies derivations of those premises. Thus the tuple is derivable. ∎

---

### P.16b.3 Finite-Support Paradox Containment

**Definition P.16b.3.1 (Finite-Support Configuration).**

A perspective configuration has finite support if there are finite sets
$$
S_P\subseteq P,
\qquad
S_V\subseteq V
$$
such that:

1. all non-reflexive seeds lie in
$$
S_P\times S_P\times S_V\times S_V;
$$

2. if $\mathrm{CPA}_p(q,u)=1$, then
$$
p,q,u\in S_P.
$$

Let
$$
\mathrm{NonRefl}:=D\setminus\{(s,s,a,a):s\in P,
 a\in V\}.
$$

**Theorem P.16b.3.2 (No Explosion Under Finite Support).**

In a finite-support configuration,
$$
R_p^\star\cap\mathrm{NonRefl}
\subseteq
S_P\times S_P\times S_V\times S_V
$$
for every $p\in P$.

Thus a paradox-shaped cycle does not derive arbitrary non-reflexive judgments outside the finite supported domain.

*Proof.* Induct on the finite stages $R^{(n)}$.

At stage $1$, the only non-reflexive tuples are base seeds, and by hypothesis all such seeds are supported.

Assume the result at stage $n$. A new non-reflexive tuple at stage $n+1$ can arise only by Trans or CPA. For Trans, both premises are supported by the induction hypothesis unless one premise is reflexive. If one premise is reflexive, the conclusion equals the other premise and remains supported. If both are non-reflexive, the composed endpoints and values are already in $S_P$ and $S_V$.

For CPA, the guard condition ensures the validating and target perspectives involved in the imported step are in $S_P$. The local and imported premises are supported by the induction hypothesis unless reflexive, and reflexive premises do not introduce new values or perspectives. Therefore the conclusion remains supported.

Taking the union over all finite stages preserves the inclusion. ∎

**Corollary P.16b.3.3 (Paradox as Local Cycle Rather Than Global Explosion).**

A role-sensitive or perspective-sensitive self-reference cycle may exist inside the supported substructure without forcing every judgment in $D$.

*Proof.* Theorem P.16b.3.2 bounds every non-reflexive derived judgment by the finite supported set. Since $D$ may contain values and perspectives outside that set, arbitrary judgments outside it are not derivable. ∎

---

### P.16b.4 Process Typing and Local Classicality

**Definition P.16b.4.1 (Prop and Proc Types).**

Let $E$ be an expression evaluated at perspective $p$.

$E$ is **Prop-typed** at $p$ when all admissible evaluation sequences converge to the same Boolean value, independent of initial condition and evaluation strategy.

$E$ is **Proc-typed** at $p$ when this fails: the evaluation oscillates, diverges, depends on an initial condition, depends on strategy, or requires non-well-founded context update.

The local truth predicate $\tau_p(E)$ is defined only for Prop-typed expressions.

**Theorem P.16b.4.2 (Local Classicality of Value-Compositional Prop-Typed Expressions).**

At a fixed perspective $p$, assume the local Boolean language is value-compositional: the connectives $\neg$, $\wedge$, $\vee$, and $\to$ are interpreted extensionally by the usual truth tables on settled Boolean values and do not introduce additional evaluation dynamics. Then the Prop-typed expressions form a classical Boolean algebra under the usual Boolean connectives, after quotienting expressions by equality of local Boolean value.

*Proof.* Each Prop-typed expression has a unique Boolean value in $\{0,1\}$ at $p$. By the value-compositional branch hypothesis, the value of $\neg E$, $E\wedge F$, $E\vee F$, and $E\to F$ is obtained by the ordinary Boolean truth tables on those unique values, and the resulting expressions remain Prop-typed at the quotient level. Since the quotient identifies expressions with the same value, the quotient algebra has exactly the usual Boolean operations on $\{0,1\}$. Hence all classical Boolean laws hold locally on the value-compositional Prop-typed quotient. ∎

**Corollary P.16b.4.3 (Liar-Pattern Expressions Are Not Prop-Typed on the Unstratified Branch).**

On the unstratified branch requiring one role-insensitive value for a negating reflexive expression, the Liar pattern is Proc-typed rather than Prop-typed.

*Proof.* By Theorem P.16b.1.3, the unstratified collapsed Liar equation has no Boolean solution. Therefore there is no unique Boolean value to assign. By Definition P.16b.4.1, it is not Prop-typed. ∎

**Remark P.16b.4.4 (Decidability Boundary).**

On finite bounded-evaluation branches, Prop/Proc typing can be checked by finite convergence analysis. In unrestricted languages with arbitrary self-reference and syntax-quantification, Prop/Proc classification need not be decidable.

---

### P.16b.5 Holonomy and Global-Section Obstruction

**Definition P.16b.5.1 (Finite Signed Logical Atlas).**

A finite signed logical atlas consists of:

1. a finite set of vantages $\mathcal V$;
2. for each $i\in\mathcal V$, a local Boolean valuation domain;
3. for each overlap edge $(i,j)$ and shared atom $a$, a sign
$$
s_{ij}(a)\in\{+1,-1\}.
$$

A local valuation assigns
$$
v_i(a)\in\{+1,-1\}.
$$
Edge compatibility is
$$
v_i(a)=s_{ij}(a)v_j(a).
\tag{P.16b.5.1}
$$

For a cycle
$$
\gamma=i_0i_1\cdots i_ki_0,
$$
define holonomy
$$
H_\gamma(a)=\prod_{r=0}^k s_{i_ri_{r+1}}(a).
\tag{P.16b.5.2}
$$

**Theorem P.16b.5.2 (Flatness-and-Compatibility Criterion).**

On a connected finite signed atlas, a global section for atom $a$ exists if and only if:

1. every cycle has trivial holonomy,
$$
H_\gamma(a)=+1;
$$

2. local valuations are edgewise compatible,
$$
v_i(a)=s_{ij}(a)v_j(a)
$$
on every overlap edge.

*Proof.* If a global section exists, transporting the value around any closed cycle must return the same value. Transport around $\gamma$ multiplies the value by $H_\gamma(a)$. Therefore $H_\gamma(a)=+1$. Edge compatibility is the definition of local restrictions agreeing on overlaps.

Conversely, choose a root vantage $i_0$ and assign a value at $i_0$. For any other vantage $j$, define the value at $j$ by transporting along a path from $i_0$ to $j$. Trivial holonomy makes this path-independent, because two paths from $i_0$ to $j$ form a cycle when one is reversed. Edge compatibility ensures the transported values agree with local overlap data. Hence the local valuations glue to a global section. ∎

**Corollary P.16b.5.3 (Global Curvature Without Local Contradiction).**

A signed atlas may be locally classical at every vantage and still lack a global section because of nontrivial holonomy.

*Proof.* Local classicality concerns Boolean evaluation inside each vantage. Theorem P.16b.5.2 shows that global gluing additionally requires trivial cycle holonomy. A cycle with $H_\gamma(a)=-1$ obstructs the global section while leaving each local Boolean algebra intact. ∎

---

### P.16b.6 Cogito-Centered Perspective Geometry

**Definition P.16b.6.1 (Evidential Perspective Space).**

Let $(V_C,\mathcal F,\nu)$ be a probability space of contents. A graded evidential perspective is a measurable function
$$
p:V_C\to[0,1].
$$
Let $\mathcal P\subseteq L^1(V_C,\nu)$ be a lattice of such functions closed under pointwise essential suprema and infima.

Fix a measurable set
$$
I\in\mathcal F
$$
representing minimal presence-as-experiencing, and assume
$$
\mathbf 1_I\in\mathcal P.
$$
Equivalently, the retained evidential-perspective branch is closed under adjoining the minimal presence indicator.

Define the self-evidence operator
$$
\mathrm{SE}(p)=\max\{p,\mathbf 1_I\}.
\tag{P.16b.6.1}
$$

**Theorem P.16b.6.2 (Cogito as Least Self-Evidence Fixed Point).**

The operator $\mathrm{SE}$ is a closure operator on $\mathcal P$. Its least fixed point is
$$
p^\ast=\mathbf 1_I.
$$

*Proof.* Since $\mathbf 1_I\in\mathcal P$ and $\mathcal P$ is closed under pointwise essential suprema, $\mathrm{SE}$ is a well-defined map $\mathcal P\to\mathcal P$. The operator is extensive because
$$
p\le \max\{p,\mathbf 1_I\}.
$$
It is monotone because $p\le q$ implies
$$
\max\{p,\mathbf 1_I\}\le\max\{q,\mathbf 1_I\}.
$$
It is idempotent because
$$
\mathrm{SE}(\mathrm{SE}(p))
=
\max\{\max(p,\mathbf 1_I),\mathbf 1_I\}
=
\max\{p,\mathbf 1_I\}
=
\mathrm{SE}(p).
$$
Thus $\mathrm{SE}$ is a closure operator.

A fixed point satisfies
$$
p=\max\{p,\mathbf 1_I\},
$$
which holds exactly when $p\ge\mathbf 1_I$ almost everywhere. The least such element is $\mathbf 1_I$. ∎

**Definition P.16b.6.3 (Perspective Metric and Cogito Radius).**

Define
$$
\Delta_{\mathcal P}(p,q)=\int_{V_C}|p(v)-q(v)|\,d\nu(v).
\tag{P.16b.6.2}
$$
After quotienting by equality almost everywhere, this is a metric. The cogito radius is
$$
r_P(p)=\Delta_{\mathcal P}(p,p^\ast).
\tag{P.16b.6.3}
$$

**Theorem P.16b.6.4 (Cogito Radius Is 1-Lipschitz).**

For all $p,q\in\mathcal P$,
$$
|r_P(p)-r_P(q)|\le \Delta_{\mathcal P}(p,q).
$$

*Proof.* The triangle inequality gives
$$
\Delta_{\mathcal P}(p,p^\ast)
\le
\Delta_{\mathcal P}(p,q)+\Delta_{\mathcal P}(q,p^\ast).
$$
Thus
$$
r_P(p)-r_P(q)\le\Delta_{\mathcal P}(p,q).
$$
Interchanging $p$ and $q$ gives
$$
r_P(q)-r_P(p)\le\Delta_{\mathcal P}(p,q).
$$
Combining the two inequalities proves the claim. ∎

**Definition P.16b.6.5 (Cogito-Origin Separating Branch).**

A content profile chart
$$
\mathcal P_S(c)=(\Delta Q_S(c),\mu_S(c),\sigma_S(c))
$$
is normalized and separating at the origin on a retained content class $\mathcal E$ when it is invariant under $\equiv_{\mathrm{op}}^S$ on $\mathcal E$, satisfies
$$
c\equiv_{\mathrm{op}}^S\psi_C
\quad\Longrightarrow\quad
\mathcal P_S(c)=(0,0,0),
$$
and satisfies
$$
\mathcal P_S(c)=(0,0,0)
\quad\Longrightarrow\quad
c\equiv_{\mathrm{op}}^S\psi_C
$$
for all $c\in\mathcal E$, where $\psi_C$ is the cogito content and $\equiv_{\mathrm{op}}^S$ is operational response equivalence.

**Theorem P.16b.6.6 (Unique Zero on the Separating-Origin Branch).**

Define the evaluation cost
$$
E_S(c)=
\sqrt{
 w_Q\Delta Q_S(c)^2+w_\mu\mu_S(c)^2+w_\sigma\sigma_S(c)^2
}
\tag{P.16b.6.4}
$$
with strictly positive weights. On the cogito-origin separating branch,
$$
E_S(c)=0
\quad\Longleftrightarrow\quad
c\equiv_{\mathrm{op}}^S\psi_C.
$$

*Proof.* If $c\equiv_{\mathrm{op}}^S\psi_C$, then the profile agrees with the cogito profile on the branch, so $\mathcal P_S(c)=(0,0,0)$ and $E_S(c)=0$.

Conversely, if $E_S(c)=0$, then every term in (P.16b.6.4) is nonnegative and each weight is positive. Therefore
$$
\Delta Q_S(c)=\mu_S(c)=\sigma_S(c)=0.
$$
By the separating-origin hypothesis, this implies
$$
c\equiv_{\mathrm{op}}^S\psi_C.
$$
∎

**Remark P.16b.6.7 (Boundary of the Cogito Zero Claim).**

Without the separating-origin branch, $E_S(c)=0$ proves only that the chosen finite profile chart assigns zero to $c$. It does not by itself prove operational equivalence to the cogito. The separating condition is the load-bearing hypothesis.

---

### P.16b.7 Predictive Role-Position Equivalence

**Definition P.16b.7.1 (Operational Response Presheaf of a Content).**

Let $S$ be a knowledge system with retained protocol category $\mathsf P_S$. For content $c$, define its operational response presheaf
$$
\mathcal R_c^S:\mathsf P_S^{op}\to\mathbf{Set}
$$
or, on probabilistic branches,
$$
\mathcal R_c^S:\mathsf P_S^{op}\to\mathbf{Prob}_{\mathrm{fin}}.
$$
For a protocol $P\in\mathsf P_S$, $\mathcal R_c^S(P)$ is the finite response produced when $S$ engages content $c$ under $P$.

**Definition P.16b.7.2 (Predictive-Function Space).**

Define operational equivalence by
$$
c_1\equiv_{\mathrm{op}}^S c_2
\quad\Longleftrightarrow\quad
\mathcal R_{c_1}^S\cong\mathcal R_{c_2}^S
$$
by natural isomorphism of response presheaves.

The predictive-function space is the quotient
$$
\mathcal F_S:=\mathsf{Cont}_S/\equiv_{\mathrm{op}}^S.
$$
The position map is
$$
\pi_S:\mathsf{Cont}_S\to\mathcal F_S,
\qquad
\pi_S(c)=[c]_{\mathrm{op}}.
$$

**Definition P.16b.7.3 (Predictive Role).**

The predictive role of $c$ for $S$ is
$$
\operatorname{Role}_S(c):=[\mathcal R_c^S]_{\cong}.
$$

**Theorem P.16b.7.4 (Predictive Role-Position Equivalence).**

For every retained content item $c$,
$$
\pi_S(c)=[c]_{\mathrm{op}}=[\mathcal R_c^S]_{\cong}=\operatorname{Role}_S(c).
$$
Thus qualitative predictive role and quantitative position in $\mathcal F_S$ are the same operational invariant expressed in two vocabularies.

*Proof.* By Definition P.16b.7.2, $\pi_S(c)$ is the equivalence class of $c$ under natural-isomorphism equivalence of operational response presheaves. Therefore
$$
\pi_S(c)=[\mathcal R_c^S]_{\cong}.
$$
By Definition P.16b.7.3, the right-hand side is $\operatorname{Role}_S(c)$. Hence all displayed quantities are identical in the quotient. ∎

**Corollary P.16b.7.5 (Finite Profiles Are Charts, Not Complete Identities).**

A finite profile such as
$$
(\Delta Q,\mu,\sigma)
$$
is a coordinate chart on $\mathcal F_S$ where defined. Equality of finite profile coordinates implies equality of predictive role only on a separating-profile branch.

*Proof.* The full point of $\mathcal F_S$ is the response-presheaf equivalence class. A finite coordinate chart can fail to separate distinct points unless separation is assumed. Therefore coordinate equality alone is weaker than role-position equality except on a separating branch. ∎

---

### P.16b.8 Triadic Description-Arity

**Definition P.16b.8.1 (SPAP Role Set).**

The SPAP role set is
$$
\mathcal R_{\mathrm{SPAP}}=\{\Phi,\Pi,\Gamma\},
$$
where:

1. $\Phi$ is the state role;
2. $\Pi$ is the prediction role;
3. $\Gamma$ is the control/comparison role.

The SPAP register notation $(\phi,p,c)$ realizes these roles. A full SPAP role implementation is a typed register with projections onto all three sorts and an admissible update map whose domain contains the ordered pair consisting of a present state and a stored prediction and whose codomain contains the comparison/update channel. The update involution is an operation inside the role system, not a fourth role.

**Theorem P.16b.8.2 (Three-Role Necessity).**

The SPAP architecture requires all three roles $\Phi$, $\Pi$, and $\Gamma$. No two-role subsystem implements the full SPAP cycle.

*Proof.* Work in the typed signature of Definition P.16b.8.1. A full implementation must type every occurrence of the SPAP cycle: the realized state term, the stored prediction term, and the comparison/update term. If $\Phi$ is removed, the state term has no sort, so the comparison map has no current-state argument. If $\Pi$ is removed, the prediction term has no sort, so there is no stored target against which the current state can be compared. If $\Gamma$ is removed, the comparison/update codomain has no sort, so the ordered cycle cannot feed an error or control value back into the next predictive step. In each two-role reduct, at least one required typed occurrence is undefined, hence the reduct cannot implement the full SPAP cycle. Conversely, the triple $(\phi,p,c)$ supplies one value in each required sort, and the update involution is an internal operation on those sorts. Therefore three roles are necessary and sufficient for the typed SPAP role architecture. ∎

**Definition P.16b.8.3 (Description Lenses).**

The semantic-extension ledger uses three primitive description lenses:

1. **Operational/categorical lens $\mathsf C$:** finite protocol identity, response presheaves, operational quotienting, branch predicates, and categorical role structure.

2. **Geometric/topological lens $\mathsf G$:** connections, holonomy, curvature, signed atlases, shape, transport, and metric geometry.

3. **Measure-theoretic/dynamical lens $\mathsf M$:** probability measures, Markov kernels, entropy, cost, convergence, and quantitative profiles.

**Definition P.16b.8.4 (Description-Arity of a Finite Ledger).**

For a finite theorem ledger $\mathcal L$, let $\operatorname{Req}(T)$ be the subset of $\{\mathsf C,\mathsf G,\mathsf M\}$ used essentially in the proof of $T$. Define
$$
\operatorname{descArity}(\mathcal L)
=
\min\left\{|S|:S\subseteq\{\mathsf C,\mathsf G,\mathsf M\},
\ \operatorname{Req}(T)\subseteq S\text{ for every }T\in\mathcal L\right\}.
$$

**Branch Condition P.16b.8.4a (Primitive-Lens Independence).**

On the typed non-collapse branch, the three lenses $\mathsf C$, $\mathsf G$, and $\mathsf M$ are treated as primitive description lenses. No one of the three is definitionally eliminable into the other two while preserving the theorem statements of the retained ledger. In particular, response-presheaf quotienting, signed holonomy/transport, and measure-defined metric or dynamical data remain typed separately.

**Theorem P.16b.8.5 (Three-Lens Minimality of the Semantic Ledger).**

Let $\mathcal L_{\mathrm{sem}}$ be the finite ledger consisting of Theorems P.16b.1.3, P.16b.2.4, P.16b.3.2, P.16b.4.2, P.16b.5.2, P.16b.6.2, P.16b.6.4, P.16b.7.4, P.16b.8.2, P.16b.9.5, P.16b.10.3, P.16b.10.4, and P.16b.10.6. On the typed non-collapse branch with Primitive-Lens Independence,
$$
\operatorname{descArity}(\mathcal L_{\mathrm{sem}})=3.
$$

*Proof.* Every listed theorem uses only the three lenses $\mathsf C$, $\mathsf G$, and $\mathsf M$, so $\operatorname{descArity}(\mathcal L_{\mathrm{sem}})\le3$.

No two-lens cover suffices. Theorem P.16b.7.4 requires response presheaves and operational quotienting, so $\mathsf C$ is essential. Theorem P.16b.5.2 requires signed transport around cycles and holonomy, so $\mathsf G$ is essential. Theorem P.16b.6.4 requires an $L^1$ integral metric and the triangle inequality for a measure-defined distance, so $\mathsf M$ is essential. By Branch Condition P.16b.8.4a, none of these three primitive sorts is definitionally eliminable by the other two on the retained branch. Therefore every cover must contain all three lenses, giving $\operatorname{descArity}(\mathcal L_{\mathrm{sem}})\ge3$.

Combining the two inequalities yields equality. ∎

**Remark P.16b.8.5a (Branch-Conditional Status of descArity = 3).** Theorem P.16b.8.5 is a conditional theorem on the typed non-collapse branch with Primitive-Lens Independence (Branch Condition P.16b.8.4a). It is not a metaphysical claim that any account of the retained semantic ledger must use three primitive lenses. Alternative formal foundations in which one of $\mathsf C$, $\mathsf G$, or $\mathsf M$ is definitionally encoded inside the other two — for example, a purely categorical encoding that internalizes measure data as enriched homs, or a purely measure-theoretic encoding that reconstructs categorical quotients from $\sigma$-algebras — supply alternative branches on which descArity may be strictly less than three for the same ledger. The PU statement is the conditional minimality of three lenses on the named branch, not the impossibility of two-lens reductions on other branches.

**Corollary P.16b.8.6 (Role-Compatible Lens Map).**

The map
$$
\Theta(\mathsf C)=\Phi,
\qquad
\Theta(\mathsf M)=\Pi,
\qquad
\Theta(\mathsf G)=\Gamma
$$
is role-compatible: operational identity supplies the state role, measure/dynamics supplies predictive law, and geometry supplies comparison/transport.

*Proof.* $\mathsf C$ decides what counts as the retained object or state, matching $\Phi$. $\mathsf M$ supplies probability, cost, and dynamics for prediction, matching $\Pi$. $\mathsf G$ supplies transport and comparison across positions, matching $\Gamma$. The three source lenses and three target roles are both necessary by Theorem P.16b.8.5 and Theorem P.16b.8.2. ∎

---

### P.16b.9 Predictive Models, Shape, and Compression

**Definition P.16b.9.1 (Predictive Model Presentation).**

A predictive model presentation for a knowledge system $S$ is a tuple
$$
\mathcal M_S=(\mathcal C_S,\mathcal R_S,\ell_S,\mu_S,\mathrm{Pred}_S)
$$
where:

1. $\mathcal C_S$ is a finite or locally finite typed concept/protocol category;
2. $\mathcal R_S$ is a response presheaf on $\mathcal C_S$;
3. $\ell_S$ is a description and traversal cost;
4. $\mu_S$ is a query distribution;
5. $\mathrm{Pred}_S$ is the prediction operation obtained by finite diagram evaluation, path traversal, or morphism composition.

The signal cost is
$$
SC(\mathcal M_S)=
\operatorname{CodeLength}(\mathcal C_S,\mathcal R_S,\ell_S,\mathrm{Pred}_S)
+
\mathbb E_{q\sim\mu_S}\left[\ell_S(\mathrm{PredPath}(q))\right].
$$

The meaning potential is
$$
MP(\mathcal M_S)=
\mathbb E_{q\sim\mu_S}\left[\operatorname{Adeq}(\mathrm{Pred}_S(q),q)\right].
$$

**Theorem P.16b.9.2 (Finite-Resource Compression Necessity).**

Let $S$ have finite predictive complexity budget $C_P(S)$. For a task family $Q$, suppose the minimum enumerative code length satisfies
$$
K_{\mathrm{enum}}(Q)>C_P(S).
$$
If $S$ remains viable on $Q$, then its model cannot be purely enumerative. It must use a compressed relational presentation with cost at most $C_P(S)$.

*Proof.* A purely enumerative model for $Q$ must store independent responses for the required tasks, so its representation cost is at least $K_{\mathrm{enum}}(Q)$. By hypothesis this exceeds $C_P(S)$, making enumeration nonviable. Since $S$ is viable, some presentation has cost at most $C_P(S)$. That presentation cannot be enumerative, so it must use relations, rules, composition, or shared structure to generate multiple predictions. This is exactly a compressed relational presentation. ∎

**Theorem P.16b.9.3 (PCE Selection of Equal-Adequacy Compression).**

On the PCE presentation branch, define
$$
\mathcal F_{\mathrm{PCE}}(\mathcal M_S)=SC(\mathcal M_S)-\lambda MP(\mathcal M_S),
\qquad
\lambda>0.
$$
If
$$
MP(\mathcal M_1)=MP(\mathcal M_2)
$$
and
$$
SC(\mathcal M_1)<SC(\mathcal M_2),
$$
then PCE strictly selects $\mathcal M_1$ over $\mathcal M_2$.

*Proof.* Subtract the two objective values:
$$
\mathcal F_{\mathrm{PCE}}(\mathcal M_1)-\mathcal F_{\mathrm{PCE}}(\mathcal M_2)
=
SC(\mathcal M_1)-SC(\mathcal M_2)
-
\lambda(MP(\mathcal M_1)-MP(\mathcal M_2)).
$$
The meaning potentials are equal, so the second term vanishes. The signal-cost difference is negative. Hence
$$
\mathcal F_{\mathrm{PCE}}(\mathcal M_1)<\mathcal F_{\mathrm{PCE}}(\mathcal M_2).
$$
∎

**Definition P.16b.9.4 (Exact Shape).**

A model region $A$ is a finite retained subdiagram of $\mathcal C_S$ with restricted response presheaf and cost data. Two regions $A$ and $B$ have the same exact shape when there is a typed isomorphism
$$
\varphi:A\to B
$$
preserving relation types, incidence, composition, relevant cost data, and response presheaves:
$$
\mathcal R_A\cong\varphi^*\mathcal R_B.
$$

**Theorem P.16b.9.5 (Operational Shape Recognition).**

Exact shape recognition is the registration of a typed subdiagram isomorphism together with natural isomorphism of restricted response presheaves. Approximate shape recognition is the same structure with bounded response discrepancy over a retained test family.

*Proof.* By Definition P.16b.9.4, exact shape consists exactly of a typed isomorphism preserving diagram structure and a natural isomorphism of response presheaves. Recognizing exact shape therefore amounts to detecting those data. If exact equality is replaced by a finite test family and discrepancy bound, the same proof gives approximate shape recognition with the stated tolerance. ∎

---

### P.16b.10 Decompression and Creative Transfer

**Definition P.16b.10.1 (Structural Content and Annotation Content).**

For a model region $A$, the structural content $\operatorname{Str}(A)$ is the set of statements expressible purely in the retained relational, categorical, geometric, and response-presheaf language of $A$.

The annotation content $\operatorname{Ann}(A)$ is the set of non-structural associations accumulated from prior use, including domain interpretations, empirical associations, heuristics, and qualitative expectations.

**Definition P.16b.10.2 (Decompression Along a Shape Match).**

Given a shape match
$$
\varphi:A\dashrightarrow B,
$$
decompression produces:

1. transported structural consequences $\varphi_*\operatorname{Str}(A)$;
2. transferred hypotheses $\varphi_?\operatorname{Ann}(A)$;
3. tests in $B$ for the transferred hypotheses.

**Theorem P.16b.10.3 (Structural Decompression Is Sound).**

If
$$
\varphi:A\to B
$$
is an exact shape isomorphism, then every structural statement in $\operatorname{Str}(A)$ transports to a true corresponding structural statement in $\operatorname{Str}(B)$.

*Proof.* A structural statement is written only in the language preserved by the exact shape isomorphism: typed relations, incidence, composition, response-presheaf structure, and retained cost relations. Isomorphisms preserve truth of all statements in the preserved language. Therefore any $\sigma\in\operatorname{Str}(A)$ has a corresponding transported statement $\varphi_*\sigma$ true in $B$. ∎

**Theorem P.16b.10.4 (Annotation Transfer Is Hypothesis Generation).**

If
$$
\alpha\in\operatorname{Ann}(A),
$$
then $\varphi_?\alpha$ has hypothesis status in $B$ unless $\alpha$ is independently shown to be structural.

*Proof.* Annotation content may depend on domain-specific facts, empirical history, or contextual interpretation not preserved by shape isomorphism. Therefore shape matching alone does not guarantee its truth in $B$. It can be carried forward only as a testable hypothesis. If it is later proven to depend solely on structure preserved by $\varphi$, it belongs to $\operatorname{Str}(A)$ and Theorem P.16b.10.3 applies. ∎

**Definition P.16b.10.5 (Intuitive Creative Episode).**

An intuitive creative episode is a tuple
$$
\mathcal E=(A,B,\varphi,\mathcal O)
$$
where:

1. $A$ is a prior model region;
2. $B$ is a target model region;
3. $\varphi:A\dashrightarrow B$ is an exact or approximate shape match;
4. $\mathcal O=\operatorname{Decomp}_\varphi(A\to B)$ is the decompressed output.

**Theorem P.16b.10.6 (Soundness of the Creativity Algorithm).**

For every intuitive creative episode:

1. exact structural outputs are theorem-level consequences of the shape match;
2. approximate structural outputs require an explicit retained discrepancy metric and a stated stability modulus for the transported statement;
3. annotation outputs are hypotheses requiring testing;
4. any output lacking one of these statuses is not licensed by the algorithm.

*Proof.* Item 1 is Theorem P.16b.10.3. For item 2, an approximate match is not an isomorphism, so truth is not preserved by invariance alone. A quantitative conclusion is licensed only after specifying a discrepancy metric $d$ on the retained test family and a modulus $\omega_\sigma$ for the transported structural statement $\sigma$, so that a match with discrepancy at most $\epsilon$ yields an error bound at most $\omega_\sigma(\epsilon)$. Without $d$ and $\omega_\sigma$, there is no well-defined theorem-level error statement. Item 3 is Theorem P.16b.10.4. Definition P.16b.10.2 lists only transported structural consequences, transferred hypotheses, and tests; hence any output lacking one of these statuses is not licensed by the decompression operation. ∎

**Conjecture P.16b.10.7 (Sufficiency for Intuitive Structural Creativity).**

Every instance of intuitive structural creativity that produces genuine new content in a predictive model can be represented as shape recognition followed by decompression.

Formally, for every such output $\mathcal O$, there exist model regions $A,B$ and a correspondence $\varphi:A\dashrightarrow B$ such that
$$
\mathcal O\subseteq\operatorname{Decomp}_\varphi(A\to B).
$$

This is a conjecture, not a theorem of the present section.

---

### P.16b.11 Integration with the Philosophical Foundations

**Theorem P.16b.11.1 (Operational/Interpretive Separation).**

Any PU result whose proof uses only response presheaves, PCE data, kernels, observable maps, and branch hypotheses is invariant under operationally conservative interpretive readings, where operational conservativity means preservation of those data up to the response equivalences already used in the proof.

*Proof.* A finite-response result is computed from the listed operational data. If an interpretation preserves those data, every term entering the proof remains identical. Therefore the derived prediction, equivalence relation, or branch status is unchanged. ∎

**Corollary P.16b.11.2 (Semantic Extension Does Not Alter Physical Branches).**

The semantic, metric, and creativity structures of Section P.16b do not change gauge, gravity, quantum, cosmological, or numerical branches unless an explicit operational map changes the corresponding response presheaf, cost functional, or branch certificate.

*Proof.* By Theorem P.16b.11.1, an interpretive extension without operational data change is conservative. If operational data do change, the result is no longer a pure philosophy extension and must be entered as a new branch certificate elsewhere in the PU ledger. ∎

**Theorem P.16b.11.3 (Consolidated Semantic-Extension Package).**

On the named branches, Section P.16b establishes:

1. the Liar contradiction requires role collapse;
2. perspective-indexed closure has a least fixed point and guarded import proof theory;
3. finite-support paradox cycles do not explode globally;
4. Prop-typed local reasoning is classical on the value-compositional branch;
5. global obstruction is represented by holonomy rather than local contradiction;
6. the cogito is the least self-evidence fixed point;
7. cogito-zero uniqueness requires the separating-origin branch;
8. predictive role equals position in the operational response quotient;
9. the philosophy-extension ledger has minimal description-arity three on the typed non-collapse and Primitive-Lens Independence branch;
10. shape recognition plus decompression gives a sound mechanism for structural creative transfer;
11. provenance, conservative fusion, finite process typing, perspective metrics, and semantic holonomy are separated as distinct semantic structures;
12. statistical self-similarity is a finite empirical branch with theorem-level recurrence statistics;
13. perspectival self-organization represents engagement as configuration membership;
14. dual-layer symbolic compression separates retained predictive kernels from local symbolic dressings in collective predictive model presentations;
15. information projections such as Shannon entropy are many-to-one and do not replace response-presheaf role identity.

*Proof.* Item 1 is Theorem P.16b.1.3. Item 2 is Theorem P.16b.2.4 for least closure and Theorem P.16b.2.7 for guarded import proof theory. Items 3--9 are Theorem P.16b.3.2, Theorem P.16b.4.2, Theorem P.16b.5.2, Theorem P.16b.6.2, Theorem P.16b.6.6, Theorem P.16b.7.4, and Theorem P.16b.8.5 respectively. Item 10 is Theorem P.16b.10.3 for structural decompression, Theorem P.16b.10.4 for annotation-status separation, and Theorem P.16b.10.6 for the creativity algorithm status partition. Item 11 is Theorem P.16b.12.2 for provenance, Theorem P.16b.12.4 for conservative fusion, Theorem P.16b.12.6 for finite process typing, Theorems P.16b.12.8 and P.16b.12.10 for perspective and operational qualia metrics, and Theorems P.16b.5.2, P.16b.12.12, and P.16b.12.13 for semantic holonomy and obstruction separation. Item 12 is Theorem P.16b.13.4 and Theorem P.16b.13.5. Item 13 is Theorem P.16b.14.5. Item 14 is Theorem P.16b.15a.4, Theorem P.16b.15a.5, Corollary P.16b.15a.6, and Theorem P.16b.15a.7. Item 15 is Theorem P.16b.16.4. ∎

---


### P.16b.12 Provenance, Fusion, Metrics, and Semantic Obstruction

**Definition P.16b.12.1 (Proof provenance support).**

In the labeled proof system of Definition P.16b.2.6, a seed label is a tuple
$$
\beta=(p,s,u,a,c)
$$
with
$$
(s,u,a,c)\in R_p^\circ.
$$
A provenance support for a derivation of
$$
E_p(s,u,a,c)
$$
is the finite set of base-kernel seed labels used as leaves of the derivation tree. Reflexivity instances have empty provenance support.

**Theorem P.16b.12.2 (Strict finite provenance).**

Every derivable labeled judgment in the finite proof system of Definition P.16b.2.6 has finite provenance support. A non-reflexive judgment with no seed in any derivation is not derivable except when it is equal to a judgment already forced by reflexivity.

*Proof.* Induct on proof height. A Base proof uses one seed. A Refl proof uses no seed. A Trans proof uses the finite union of the two premise supports. A CPA proof uses the finite union of the local and imported premise supports. Finite unions of finite sets are finite. Conversely, the proof rules have only Base, Refl, Trans, and CPA introductions. If a non-reflexive judgment is introduced without any seed support, then all contributing leaves are reflexivity instances. Transitivity or CPA compositions of only reflexive premises cannot introduce a new non-reflexive relation; they return a reflexive or already identical relation. ∎

**Definition P.16b.12.3 (Conservative fusion of perspectives).**

Given two validating perspectives $p,q\in P$, their conservative fusion $p\boxtimes q$ is a validating perspective whose base kernel is
$$
R_{p\boxtimes q}^{\circ}=R_p^{\circ}\cap R_q^{\circ},
$$
and whose CPA guard is
$$
\mathrm{CPA}_{p\boxtimes q}(r,u)=1
\quad\Longleftrightarrow\quad
\mathrm{CPA}_{p}(r,u)=1
\text{ and }
\mathrm{CPA}_{q}(r,u)=1.
$$

**Theorem P.16b.12.4 (Fusion is conservative).**

For all labeled values $a(s),c(u)$,
$$
a(s)\preceq_{p\boxtimes q} c(u)
\quad\Longrightarrow\quad
a(s)\preceq_p c(u)
\text{ and }
a(s)\preceq_q c(u).
$$

*Proof.* The fused base kernel is contained in each parent base kernel, and the fused CPA guard is true only when both parent guards are true. Reflexivity is shared by all perspectives. If a fused judgment is derived by Trans, the induction hypothesis puts both premises in each parent, and the parent Trans rule gives the same conclusion. If it is derived by CPA, the imported premise and the guard are valid in each parent, so the same CPA conclusion is derivable in each parent. Induction on proof height proves the claim. ∎

**Definition P.16b.12.5 (Bounded Prop/Proc evaluation system).**

A bounded evaluation system consists of a finite expression set $\mathcal E$, a finite state set $X_E$ for each expression $E$, an evaluation transition map
$$
T_E:X_E\to X_E,
$$
and an output map
$$
o_E:X_E\to\{0,1,\bot\},
$$
where $\bot$ denotes no settled Boolean value.

Expression $E$ is Prop-typed when every trajectory of $T_E$ eventually reaches a fixed point with the same Boolean output in $\{0,1\}$. It is Proc-typed when this condition fails.

**Theorem P.16b.12.6 (Finite Prop/Proc criterion).**

In a bounded evaluation system, $E$ is Prop-typed if and only if every directed cycle of $T_E$ reachable from $X_E$ is a fixed point and all reachable fixed points have the same Boolean output in $\{0,1\}$.

*Proof.* A map on a finite set eventually enters a directed cycle. If every reachable cycle is a fixed point and all reachable fixed points have the same Boolean output, every trajectory settles to that value, so $E$ is Prop-typed. Conversely, if $E$ is Prop-typed, every trajectory settles to one Boolean value. A reachable nontrivial cycle would prevent settlement, and two fixed points with different Boolean outputs would make the result depend on the initial state. Hence the stated condition is necessary. ∎

**Definition P.16b.12.7 (Perspective discrepancy pseudometric).**

Let $P$ be a perspective set and let $\mathcal A$ be a nonempty finite retained atom set. For perspectives $p,q\in P$, define
$$
d_{\mathcal A}(p,q)
=
\frac1{|\mathcal A|}
\sum_{a\in\mathcal A}
|v_p(a)-v_q(a)|,
$$
whenever the retained valuations $v_p(a),v_q(a)$ are real-valued or embedded in a fixed finite real code.

**Theorem P.16b.12.8 (Perspective discrepancy is a pseudometric).**

The function $d_{\mathcal A}$ is nonnegative, symmetric, satisfies the triangle inequality, and may identify distinct perspectives. After quotienting by $d_{\mathcal A}=0$, it becomes a metric.

*Proof.* Nonnegativity and symmetry follow from absolute value. For every retained atom,
$$
|v_p(a)-v_r(a)|
\le
|v_p(a)-v_q(a)|+|v_q(a)-v_r(a)|.
$$
Summing over $a\in\mathcal A$ and dividing by $|\mathcal A|$ gives the triangle inequality. Distinct perspectives may agree on all retained atoms, so the function can vanish on distinct points. The zero-distance quotient is therefore a metric. ∎

**Definition P.16b.12.9 (Operational qualia metric).**

On the self-organization branch of P.16b.14, let $Q_S$ be the extended configuration space and let $\mathcal T_S$ be a finite retained test family of response probes. Define
$$
d_Q(q,q')
=
\sum_{T\in\mathcal T_S}w_T
D_T\bigl(
\mathcal R_q^S(T),
\mathcal R_{q'}^S(T)
\bigr),
$$
where $w_T>0$ and each $D_T$ is a metric on the finite response space of probe $T$.

**Theorem P.16b.12.10 (Qualia metric on the operational quotient).**

The function $d_Q$ is a pseudometric on $Q_S$ and becomes a metric on the quotient that identifies configurations with identical retained response profiles across $\mathcal T_S$.

*Proof.* Each $D_T$ is nonnegative, symmetric, and satisfies the triangle inequality. A positive weighted finite sum of pseudometrics has the same properties. It may vanish on configurations that no retained probe distinguishes, so it is a pseudometric. The zero-distance quotient is a metric. ∎

**Definition P.16b.12.11 (Higher-order semantic obstruction).**

In a finite signed logical atlas, a higher-order compatibility obstruction occurs for an atom $a$ when a cycle $\gamma$ has
$$
H_\gamma(a)=-1.
$$

**Theorem P.16b.12.12 (Higher-order semantic obstruction).**

If a finite signed atlas contains an atom $a$ and a cycle $\gamma$ with $H_\gamma(a)=-1$, then no global Boolean section assigning a nonzero sign to $a$ exists on that connected component.

*Proof.* Transporting a putative global value $v(a)\in\{+1,-1\}$ around $\gamma$ multiplies it by $H_\gamma(a)=-1$. Compatibility would require $v(a)=-v(a)$, impossible for a nonzero sign. ∎

**Theorem P.16b.12.13 (Meta-synthesis of semantic geometry).**

On the combined P.16b.1, P.16b.2, P.16b.4, P.16b.5, P.16b.6, and P.16b.12 branches, semantic obstruction has three distinct theorem-level forms:

1. role-collapse obstruction, detected by Theorem P.16b.1.3;
2. process-typing obstruction, detected by Theorem P.16b.12.6;
3. holonomy obstruction, detected by Theorem P.16b.5.2 and Theorem P.16b.12.12.

These obstructions are compatible and nonredundant: removing one does not remove the other two.

*Proof.* Role-collapse obstruction is an algebraic fixed-point failure for a reflexive value equation. Process-typing obstruction is a dynamical failure of finite evaluation convergence. Holonomy obstruction is a failure of global section gluing around a signed cycle. Each construction has examples in which it appears while the other two are absent: a collapsed Boolean Liar equation for role collapse, a finite two-cycle with no settled output for process typing, and a signed atlas with local Boolean valuations but nontrivial holonomy for global obstruction. Therefore the obstruction types are distinct. ∎

---

### P.16b.13 Statistical Self-Similarity in Knowledge Organization

#### P.16b.13.0 Statistical Self-Similarity Standing

This section states the Statistical Self-Similarity Hypothesis for finite self-referential predictive systems:
$$
\text{PCE compression}+\text{SPAP self-reference discipline}+\text{shape recognition/decompression}
\Longrightarrow
\text{statistical recurrence of relational form across abstraction levels}.
$$
The hypothesis is an empirical branch. The finite statistics and synthetic pipeline are theorem-level constructions; the claim that natural knowledge corpora exhibit the pattern remains open until tested on real corpora.

**Definition P.16b.13.1 (Abstraction hierarchy).**

Let $S$ be a knowledge system with retained content class $\mathsf{Cont}_S$. An abstraction hierarchy is a finite sequence
$$
\mathcal H_S=\bigl(\mathsf{Cont}_S^{[0]},\mathsf{Cont}_S^{[1]},\dots,\mathsf{Cont}_S^{[L]}\bigr),
$$
where $\mathsf{Cont}_S^{[\ell]}$ is the retained content at abstraction level $\ell$.

**Definition P.16b.13.2 (Relational carrier and shape signature).**

For each content item
$$
c\in\mathsf{Cont}_S^{[\ell]},
$$
let $G(c)$ be its finite relational carrier. In applications, $G(c)$ may be a typed protocol subdiagram, response-presheaf restriction, theorem-dependency graph, semantic network, proof graph, program-call graph, or other finite relation object.

A shape signature is a finite map
$$
\mathrm{Sig}:G(c)\mapsto \mathbb R^m
$$
whose coordinates are invariant or approximately invariant under the selected relational equivalences.

**Definition P.16b.13.3 (Level distribution and adjacent recurrence).**

Let $\mu_\ell$ be the empirical distribution of shape signatures at level $\ell$. Define adjacent recurrence by
$$
\rho(\ell,\ell+1)
=
1-
\frac{D_{\mathrm{JS}}(\mu_\ell,\mu_{\ell+1})}{\log2},
$$
where $D_{\mathrm{JS}}$ is Jensen-Shannon divergence. Then
$$
0\le \rho(\ell,\ell+1)\le1.
$$

**Theorem P.16b.13.4 (Recurrence Statistic Bounds).**

For finite empirical level distributions,
$$
0\le\rho(\ell,\ell+1)\le1.
$$
Moreover, $\rho=1$ if and only if $\mu_\ell=\mu_{\ell+1}$, and $\rho=0$ if and only if the two distributions have disjoint supports after zero-probability atoms are removed.

*Proof.* Write $\mu=\mu_\ell$, $\nu=\mu_{\ell+1}$, and $m=(\mu+\nu)/2$ on the union of their finite supports. Let $B$ be uniform on $\{0,1\}$ and, conditional on $B=0$ or $B=1$, draw $X$ from $\mu$ or $\nu$, respectively. Then the marginal law of $X$ is $m$, and direct substitution into the definition of mutual information gives
$$
I(B;X)
=
\frac12\sum_x\mu(x)\log\frac{\mu(x)}{m(x)}
+
\frac12\sum_x\nu(x)\log\frac{\nu(x)}{m(x)}
=D_{\mathrm{JS}}(\mu,\nu).
$$
For any probability vectors $p$ and $r$, the inequality $-\log y\ge1-y$ gives
$$
D_{\mathrm{KL}}(p\|r)
=
-\sum_{x:p(x)>0}p(x)\log\frac{r(x)}{p(x)}
\ge
\sum_{x:p(x)>0}(p(x)-r(x))
\ge0,
$$
with equality exactly when $p=r$ on their common support. Hence $I(B;X)\ge0$, with equality exactly when the joint law of $(B,X)$ equals the product of its marginals. That independence condition is
$$
\mu(x)=m(x)=\nu(x)
$$
for every $x$, so $D_{\mathrm{JS}}(\mu,\nu)=0$ exactly when $\mu=\nu$.

The finite entropy identity gives
$$
D_{\mathrm{JS}}(\mu,\nu)
=I(B;X)
=H(B)-H(B\mid X)
=\log2-H(B\mid X).
$$
Each term in the conditional entropy is nonnegative, so $0\le I(B;X)\le\log2$. Equality $I(B;X)=\log2$ holds exactly when $H(B\mid X)=0$, meaning that every observed atom $x$ determines $B$. This is equivalent to the absence of an atom with both $\mu(x)>0$ and $\nu(x)>0$, namely disjoint supports. Finally,
$$
\rho(\ell,\ell+1)
=1-\frac{D_{\mathrm{JS}}(\mu,\nu)}{\log2},
$$
so the bounds and equality cases follow. ∎

**Theorem P.16b.13.5 (Recurrence-compression link under grammar coding).**

Suppose a corpus $\mathcal H$ is generated by a finite shape grammar $\mathcal G$, and adjacent levels share reusable shape rules. Let $K_{\mathrm{sep}}$ be the description length when each level encodes its rules independently, and let $K_{\mathrm{shared}}$ be the description length when shared rules are encoded once and referenced across levels. If the eliminated duplicated rule-description cost is $K_{\mathrm{share}}>0$ and the reference overhead is $K_{\mathrm{ref}}$, then
$$
K_{\mathrm{shared}}\le K_{\mathrm{sep}}-K_{\mathrm{share}}+K_{\mathrm{ref}}.
$$
If
$$
K_{\mathrm{share}}>K_{\mathrm{ref}},
$$
then
$$
K_{\mathrm{shared}}<K_{\mathrm{sep}}.
$$

*Proof.* Independent encoding pays for every shared rule separately at each level. Shared encoding pays once for the shared rule and then pays references. The difference is the eliminated duplicated rule cost minus the reference overhead. If the eliminated cost is larger, the shared encoding is strictly shorter. ∎

**Corollary P.16b.13.6 (Relation to creative decompression).**

If statistical self-similarity holds in a natural corpus, then recurring shapes are not arbitrary analogies. They are candidate reusable structures produced by compression and stabilized by self-reference discipline. Section P.16b.10 then explains what a system does after recognizing such a shape: it decompresses structural content and carries annotations only as hypotheses.

*Proof.* P.16b.13 supplies the recurrence source; P.16b.10 supplies the transfer rule and status separation between structural transfer and annotation transfer. ∎

#### P.16b.13.7 Empirical status

The synthetic-pipeline branch validates the measurement procedure on recursively generated synthetic corpora: recursive corpora show stronger adjacent-level recurrence than size-matched random null corpora and a negative recurrence-compression association. This does not prove the natural-corpus claim. Natural-corpus testing requires stronger null models, including density-matched, degree-preserving, motif-preserving, block-model, and level-permutation nulls.

---

### P.16b.14 Perspectival Self-Organization and Non-Separation of Organism and Qualia Space

#### P.16b.14.0 Self-Organization Standing

This section formalizes the operational claim that a perspectival organism is not an external observer moving through a qualia space. In the PU operational domain, the organism is the self-organizing dynamical realization of its qualia space.

The precise carrier is
$$
\mathfrak O_S=(Q_S,d_{Q,S},o_S,\delta_S,\gamma_S,\mathcal A_S),
$$
where $Q_S$ is the possible qualia-configuration space, $d_{Q,S}$ is its metric, $o_S$ is the cogito origin, $\delta_S$ is the transition/update structure, $\gamma_S:T\to Q_S$ is the realized trajectory, and $\mathcal A_S$ records active response-presheaf configurations.

**Definition P.16b.14.1 (Basic qualia space).**

The basic qualia space of a perspectival knowledge system $S$ is
$$
Q_S^0=V_{C,S}\times\overline{\mathcal P}_S,
$$
where $V_{C,S}$ is the retained content space and $\overline{\mathcal P}_S$ is the quotient of evidential perspectives by zero $L^1$ distance. A basic qualia token is
$$
x=(v,[p])\in Q_S^0.
$$
The cogito origin is
$$
o_S^0=(v^*,[p^*]),
$$
where $p^*$ is the least fixed point of the self-evidence closure operator, $[p^*]$ is its zero-distance quotient class, and $v^*$ is the baseline cogito-associated content.

**Definition P.16b.14.2 (Extended organismic configuration space).**

The extended configuration space is
$$
Q_S=Q_S^0\times\mathsf{Lev}_S\times\mathsf{Act}_S,
$$
where $\mathsf{Lev}_S$ is the set of available abstraction-level or attention modes and $\mathsf{Act}_S$ is the space of active response-presheaf configurations. A configuration is
$$
q=(v,p,\ell,A),
$$
where $v$ is foregrounded content, $p$ is the realized perspective, $\ell$ is the active abstraction level, and $A$ records active subdiagrams, response presheaves, protocols, and internal monitoring structures.

**Definition P.16b.14.3 (Perspectival organism).**

A perspectival organism is the structure
$$
\mathfrak O_S=(Q_S,d_{Q,S},o_S,\delta_S,\gamma_S,\mathcal A_S),
$$
with realized state
$$
q_t=\gamma_S(t).
$$
The phrase “the organism is its qualia space” means that the organism is the self-organizing dynamical realization of $Q_S$, not the bare set $Q_S$ alone.

**Definition P.16b.14.4 (Engagement region).**

For a content item $c\in\mathsf{Cont}_S$, let $\mathcal R_c^S$ be its operational response presheaf. The engagement region of $c$ is
$$
\mathrm{Eng}_S(c)=
\{q\in Q_S:\mathcal A_S(q)\text{ contains a subpresheaf naturally isomorphic to }\mathcal R_c^S\}.
$$
Thus $S$ engages $c$ at time $t$ iff
$$
q_t\in\mathrm{Eng}_S(c).
$$

**Theorem P.16b.14.5 (Non-separation representation).**

On the self-organization branch, content engagement is not represented as an external relation between a subject and an object. It is represented as membership of the current organismic configuration in an engagement region:
$$
S\text{ engages }c\text{ at }t
\quad\Longleftrightarrow\quad
q_t\in\mathrm{Eng}_S(c).
$$

*Proof.* By Definition P.16b.14.4, $\mathrm{Eng}_S(c)$ is exactly the set of configurations in which the response role of $c$ is active. Since the realized organismic state at time $t$ is $q_t=\gamma_S(t)$, engagement is precisely $q_t\in\mathrm{Eng}_S(c)$. No external subject-object relation is required in the formal carrier. ∎

**Corollary P.16b.14.6 (Self-observation is internal).**

Self-observation is an internal subconfiguration or monitoring channel inside $\mathcal A_S(q_t)$, not a perspective-free standpoint outside $Q_S$.

*Proof.* Self-observation is engagement with content whose response presheaf concerns the system's own configuration. By Theorem P.16b.14.5, engagement is realized internally as membership in an engagement region. ∎

**Definition P.16b.14.7 (Shape-coherent reconfiguration).**

A reconfiguration
$$
q_0\leadsto q_1
$$
is shape-coherent when there exists a recognized correspondence
$$
\varphi:A(q_0)\dashrightarrow A(q_1)
$$
between active subdiagrams or response-presheaf regions, and the registration of $\varphi$ is included in the active configuration $\mathcal A_S(q_1)$.

**Theorem P.16b.14.8 (Recognition as self-reconfiguration).**

On the recognition branch, recognizing a shape is a shape-coherent self-reconfiguration:
$$
q_0\leadsto q_1,
\qquad
\varphi:A(q_0)\dashrightarrow A(q_1),
\qquad
\mathcal R_{\mathrm{reg}(\varphi)}^S\hookrightarrow \mathcal A_S(q_1).
$$

*Proof.* Section P.16b.9 identifies shape recognition with response-presheaf or subdiagram correspondence. In the organismic carrier, active recognitions are elements of the current active response configuration. Therefore recognition occurs exactly when the configuration changes into one containing the registered correspondence. ∎

**Theorem P.16b.14.9 (Cogito radial elaboration).**

Let $o_S$ be the cogito origin in $Q_S$, and define
$$
\rho_S(q)=d_{Q,S}(q,o_S).
$$
Then $\rho_S$ is 1-Lipschitz:
$$
|\rho_S(q)-\rho_S(q')|\le d_{Q,S}(q,q').
$$
If the cogito-origin separating branch is assumed, $o_S$ is the unique zero-radial configuration.

*Proof.* The Lipschitz property is the triangle inequality for distance from a fixed point. Uniqueness of the zero follows from the separating-origin condition: $d_{Q,S}(q,o_S)=0$ implies equality in the metric quotient, hence operational equivalence to the cogito origin. ∎

**Theorem P.16b.14.10 (Operational qualia are configurations).**

Within PU's operational domain, qualia are active configurations of $Q_S$ as registered by the organismic response structure. They are not additional decorations attached to configurations.

*Proof.* A reportable or behaviorally active phenomenal distinction is operationally real only insofar as it changes response presheaves, active subdiagrams, or transitions. These are components of $\mathcal A_S(q)$ and $\delta_S$ on $Q_S$. Therefore the operational quale is represented by the configuration and its active response structure. The theorem does not assert that non-operational phenomenal character is exhausted by this representation. ∎

**Remark P.16b.14.10a (Operational Representation, Not Metaphysical Reduction).** Theorem P.16b.14.10 is an operational-representation theorem inside the PU operational domain. It identifies what counts as an *operational* quale — namely, an active configuration registered by the organismic response structure — and asserts only that operational qualia are not extra decorations on top of such configurations. It does not assert that phenomenal character as such is exhausted by operational configurations, nor that non-operational phenomenal content is impossible. Equivalently, the theorem is an internal-vocabulary identity for the operational sense of "quale" and is silent on metaphysical reduction claims about consciousness. Theorems P.16b.14.5, P.16b.14.8, and P.16b.14.11 inherit the same operational scope.

**Theorem P.16b.14.11 (Creativity as reconfiguration plus export).**

On the creativity branch, a creative episode is a shape-coherent self-reconfiguration followed by decompression and export:
$$
q_0\leadsto q_1
\quad\Longrightarrow\quad
\operatorname{Decomp}_\varphi(A\to B)
\quad\Longrightarrow\quad
\text{communicable output}.
$$

*Proof.* Theorem P.16b.14.8 gives recognition as self-reconfiguration. Section P.16b.10 gives decompression along the recognized shape, with theorem-level structural transfer and hypothesis-level annotation transfer. Export is the encoding of the decompressed content into a communicable response channel. ∎

---

### P.16b.15 Conditional fractal-like organization of the psyche

**Definition P.16b.15.1 (Fractal-like organization).**

A perspectival organism is fractal-like in the operational sense when its output traces or internal relational carriers exhibit statistically significant recurrence of relational form across abstraction levels, measured by the recurrence statistic of P.16b.13 against appropriate null models.

**Proposition P.16b.15.2 (Conditional fractal-like organization).**

If the Statistical Self-Similarity Hypothesis holds for the natural output traces of a perspectival organism $\mathfrak O_S$, then the psyche of $S$ is fractal-like in the operational sense of Definition P.16b.15.1.

*Proof.* By P.16b.14, the operational psyche is represented by trajectories and active configurations in $Q_S$. By P.16b.13, statistical self-similarity is recurrence of relational shape across abstraction levels in those traces. If the hypothesis holds for the natural traces of $\mathfrak O_S$, then those traces satisfy the definition of fractal-like organization. ∎

**Remark P.16b.15.3 (Boundary).**

This is not a claim of exact mathematical fractality, scale invariance at all resolutions, or a universal numerical fractal dimension. It is a conditional claim of statistically detectable recurrence of relational form across abstraction levels.

---

### P.16b.15a Dual-Layer Predictive Symbols in the Collective Model of Reality

This subsection records a conservative PU reading of durable symbolic material. A surface symbol is neither a fixed inherited image nor an autonomous replicating particle. It is a finite transmissible encoding whose decoded content may occupy a retained collective response role. A predictive kernel and its local dressings are compared only relative to a fixed population, budget, protocol family, decoder family, and collective response quotient.

All cross-context comparisons in this subsection are made on a retained comparison branch on which the dressings from the relevant contexts are decodable into the same collective response quotient $\mathcal F_{\mathcal S}^{\mathrm{col}}$. Without that common branch, no cross-context kernel identity, adequacy comparison, or translation conclusion is asserted.



**Definition P.16b.15a.1 (Collective Predictive Model Presentation).**

Let $\mathcal S=\{S_i\}_{i=1}^N$ be a finite population of predictive systems with retained model presentations in the sense of Definition P.16b.9.1. A collective predictive model presentation at budget $B$ is a retained finite predictive model presentation
$$
\mathcal M_{\mathcal S,B}^{\mathrm{col}}
=
(\mathcal C_{\mathcal S},\mathcal R_{\mathcal S},\ell_{\mathcal S},\mu_{\mathcal S},\mathrm{Pred}_{\mathcal S})
\tag{P.16b.15a.1}
$$
whose response data descend from communicable records, rituals, words, tools, diagrams, and practices transmitted through the finite population interface, and such that
$$
SC(\mathcal M_{\mathcal S,B}^{\mathrm{col}})\le B.
\tag{P.16b.15a.2}
$$

Let $\mathsf{Cont}_{\mathcal S}$ be the retained finite class of communicable contents available on the collective presentation branch. For $c\in\mathsf{Cont}_{\mathcal S}$, let $\mathcal R_c^{\mathcal S}$ be the collective response presheaf induced by the finite population interface. Define
$$
c\equiv_{\mathrm{op}}^{\mathcal S}c'
\quad\Longleftrightarrow\quad
\mathcal R_c^{\mathcal S}\cong\mathcal R_{c'}^{\mathcal S}
\tag{P.16b.15a.3}
$$
by natural isomorphism of collective response presheaves, exactly as in Definition P.16b.7.2. The collective predictive-function space is
$$
\mathcal F_{\mathcal S}^{\mathrm{col}}
:=
\mathsf{Cont}_{\mathcal S}/\equiv_{\mathrm{op}}^{\mathcal S}.
\tag{P.16b.15a.4}
$$
The collective predictive role of $c$ is
$$
\operatorname{Role}_{\mathcal S}(c)
:=
[\mathcal R_c^{\mathcal S}]_{\cong}
\in
\mathcal F_{\mathcal S}^{\mathrm{col}}.
\tag{P.16b.15a.5}
$$

At fixed $\mathcal S$, $B$, retained protocol family, decoder family, and comparison branch, the operational unit of retained cultural function is the quotient point $\operatorname{Role}_{\mathcal S}(c)$, not the surface token $c$. A surface code is an exact representative of that unit only when its decoded content lies in the same response-presheaf isomorphism class; finite-probe proximity alone gives only the tolerance statement specified below.

Here “predictive role” means a content-indexed position in the collective response quotient. It is not any of the system-level capabilities $b_m,b_p,b_v$ of Definition 5, and it is not the update/cycle phase $D_{cyc}$ of Definition 4. Calling a content item predictive means that it is evaluated through the registered response presheaf on the retained query or action protocols; it does not assert that the content item itself instantiates a complete predictor or adaptive loop. Equality of collective roles also does not imply equality of physical carrier, internal mechanism, or causal decomposition.

**Definition P.16b.15a.2 (Predictive Kernel and Local Dressing).**

Let $x$ be a recurrent phenomenon, relation, or event-class available to a population $\mathcal S$. A retained predictive kernel for $x$ is a finite content item $K_x\in\mathsf{Cont}_{\mathcal S}$ admitting the tuple presentation
$$
K_x
=
(\mathcal Q_x,\mathcal U_x,\mathcal A_x,\mathcal E_x,\mathcal T_x)
\tag{P.16b.15a.6}
$$
where:

1. $\mathcal Q_x$ is the finite query family for which $x$ reduces uncertainty;
2. $\mathcal U_x$ is the retained recurrence or use-condition profile of $x$;
3. $\mathcal A_x$ is the finite action-policy family licensed by the prediction;
4. $\mathcal E_x$ is the embodied, affective, energetic, or survival-salience register;
5. $\mathcal T_x$ is the finite transmission interface by which the kernel is taught, remembered, or coordinated.

A local symbolic dressing of $K_x$ in a cultural context $\Gamma$ is a finite communicable code
$$
D_\Gamma(K_x)
\tag{P.16b.15a.7}
$$
which may be a name, image, myth, ritual, taboo, diagram, calendar rule, tool practice, story, institution, or technical model. A dressed symbol is the pair
$$
\mathsf S_\Gamma(x):=(K_x,D_\Gamma(K_x)).
\tag{P.16b.15a.8}
$$
Thus $K_x$ is the retained content representative whose collective role is well-defined by Definition P.16b.15a.1, while $D_\Gamma(K_x)$ is the perspective-local communicable code. The pair records a content/code factorization on the stated branch; it is neither an additional ontology nor a decomposition of the system-level predictive loop.

**Definition P.16b.15a.3 (Kernel-Role Pseudometric, Kernel Adequacy, and Predictive-Kernel Equivalence).**

Fix a nonempty retained finite test family $\mathcal A_K=\{a_1,\ldots,a_m\}$ of kernel-role probes on the comparison branch, where $m\ge1$. Suppose each probe induces a real-valued or finitely real-coded evaluation
$$
v_i:\mathcal F_{\mathcal S}^{\mathrm{col}}\to\mathbb R.
$$
Define
$$
d_K(r,r')
=
\frac1m\sum_{i=1}^{m}|v_i(r)-v_i(r')|.
\tag{P.16b.15a.9}
$$
By the same finite-probe argument as Theorem P.16b.12.8, $d_K$ is a pseudometric on $\mathcal F_{\mathcal S}^{\mathrm{col}}$. It becomes a metric after quotienting by zero distance, and it becomes separating for kernel roles only on branches where the retained probes separate those roles.

Because $K_x\in\mathsf{Cont}_{\mathcal S}$ by Definition P.16b.15a.2, $\operatorname{Role}_{\mathcal S}(K_x)$ is well-defined. Let
$$
\operatorname{Dec}_\Gamma(D_\Gamma(K_x))\in\mathsf{Cont}_{\mathcal S}
\tag{P.16b.15a.10}
$$
be the decoded content recovered by the population using the local dressing on the retained comparison branch. Fix $\epsilon\ge0$. The dressing is $\epsilon$-kernel-adequate when
$$
d_K
\bigl(
\operatorname{Role}_{\mathcal S}(\operatorname{Dec}_\Gamma(D_\Gamma(K_x))),
\operatorname{Role}_{\mathcal S}(K_x)
\bigr)
\le
\epsilon.
\tag{P.16b.15a.11}
$$

Two dressed symbols $\mathsf S_\Gamma(x)$ and $\mathsf S_{\Gamma'}(y)$ are predictive-kernel equivalent at tolerance $\epsilon$ when their decoded roles are within $\epsilon$ in $d_K$. In the zero-tolerance branch where the retained probes separate kernel roles, this reduces to equality in $\mathcal F_{\mathcal S}^{\mathrm{col}}$.

**Theorem P.16b.15a.4 (Adequate-Dressing Bound for a Fixed Predictive Kernel).**

Suppose $\mathsf S_\Gamma(x)$ and $\mathsf S_{\Gamma'}(x)$ are two local dressings of the same retained predictive kernel $K_x$ on a common retained comparison branch, and both are $\epsilon$-kernel-adequate. Then
$$
d_K
\bigl(
\operatorname{Role}_{\mathcal S}(\operatorname{Dec}_\Gamma(D_\Gamma(K_x))),
\operatorname{Role}_{\mathcal S}(\operatorname{Dec}_{\Gamma'}(D_{\Gamma'}(K_x)))
\bigr)
\le
2\epsilon.
\tag{P.16b.15a.12}
$$
In particular, when $\epsilon=0$ on a separating kernel-role branch, distinct local dressings preserve the same predictive role in $\mathcal F_{\mathcal S}^{\mathrm{col}}$.

*Proof.* By $\epsilon$-adequacy, each decoded dressing lies within $d_K$-distance $\epsilon$ of the kernel role $\operatorname{Role}_{\mathcal S}(K_x)$. The pseudometric triangle inequality from Definition P.16b.15a.3 gives (P.16b.15a.12). If $\epsilon=0$ and the retained probes separate kernel roles, zero distance is equality in the separated quotient $\mathcal F_{\mathcal S}^{\mathrm{col}}$. ∎

**Theorem P.16b.15a.5 (PCE Selection of Compressed Symbolic Encodings).**

Let $E_x$ be an enumerative retained record of repeated encounters with $x$, and let $\mathsf S_\Gamma(x)$ be a dressed symbolic encoding of the same retained predictive kernel on the same collective model branch. For a candidate encoding $Y$, let
$$
\mathcal M_{\mathcal S,B}^{\mathrm{col}}[Y]
$$
be the collective presentation obtained by using $Y$ as the retained encoding of the kernel role while holding fixed the comparison branch, population interface, and query family. Write
$$
SC(Y):=SC(\mathcal M_{\mathcal S,B}^{\mathrm{col}}[Y]),
\qquad
MP(Y):=MP(\mathcal M_{\mathcal S,B}^{\mathrm{col}}[Y]).
$$

For a fixed PCE tradeoff parameter $\lambda>0$, suppose both encodings are feasible candidates in the finite PCE menu for $\mathcal M_{\mathcal S,B}^{\mathrm{col}}$. If
$$
MP(\mathsf S_\Gamma(x))=MP(E_x)
\tag{P.16b.15a.13}
$$
and
$$
SC(\mathsf S_\Gamma(x))<SC(E_x),
\tag{P.16b.15a.14}
$$
then PCE strictly selects the symbolic encoding over the enumerative record. More generally, $\mathsf S_\Gamma(x)$ is selected over any alternative $Y$ whenever
$$
SC(\mathsf S_\Gamma(x))-\lambda MP(\mathsf S_\Gamma(x))
<
SC(Y)-\lambda MP(Y)
\tag{P.16b.15a.15}
$$
on the same PCE presentation branch.

*Proof.* Equations (P.16b.15a.13)--(P.16b.15a.14) are exactly the equal-adequacy compression case of Theorem P.16b.9.3 applied to the induced presentations $\mathcal M_{\mathcal S,B}^{\mathrm{col}}[\mathsf S_\Gamma(x)]$ and $\mathcal M_{\mathcal S,B}^{\mathrm{col}}[E_x]$. Equation (P.16b.15a.15) is the defining strict comparison of the same PCE objective. ∎

**Corollary P.16b.15a.6 (Cultural-Function Units Relative to Retained Probes).**

Fix a retained comparison branch, kernel $K_x$, probe family, and decoder family. Suppose $\mathsf S_\Gamma(x)$ is an $\epsilon$-kernel-adequate dressed encoding satisfying a strict PCE selection condition of Theorem P.16b.15a.5. Its dual presentation is
$$
\mathsf S_\Gamma(x)=(K_x,D_\Gamma(K_x)).
\tag{P.16b.15a.16}
$$
The operational cultural-function unit associated with $x$ is the quotient point $\operatorname{Role}_{\mathcal S}(K_x)$, while the decoded dressing is an $\epsilon$-approximation satisfying
$$
d_K\!\left(
\operatorname{Role}_{\mathcal S}(\operatorname{Dec}_\Gamma(D_\Gamma(K_x))),
\operatorname{Role}_{\mathcal S}(K_x)
\right)
\le\epsilon.
$$
For any second $\epsilon$-kernel-adequate dressing of the same fixed kernel on the same comparison branch, the decoded roles are at distance at most $2\epsilon$. When $\epsilon=0$ and the retained probes separate kernel roles, both decoded contents represent the same quotient point. No conclusion follows for a code lacking the common comparison branch, a registered decoder, or kernel adequacy.


*Proof.* Definition P.16b.15a.2 supplies the displayed content/code presentation. Definition P.16b.15a.1 identifies the operational cultural-function unit with the collective response-quotient point. Definition P.16b.15a.3 gives the displayed $\epsilon$-adequacy inequality. Theorem P.16b.15a.4 applies the pseudometric triangle inequality to two adequate dressings and yields the $2\epsilon$ bound. At $\epsilon=0$, separation of the retained probes converts zero pseudometric distance into equality in $\mathcal F_{\mathcal S}^{\mathrm{col}}$. Theorem P.16b.15a.5 supplies only the stated PCE selection conclusion and does not strengthen any role-equivalence claim. ∎

**Theorem P.16b.15a.7 (Culture as Amortized Decoder).**

Let $\operatorname{Dec}_\Gamma$ be a shared decoder installed across a finite population interface with setup cost $C_{\mathrm{dec}}\ge0$. Suppose a kernel role must be transmitted $M$ times on the retained branch. Let $c_D$ be the per-transmission cost of using a dressed symbol decoded by $\operatorname{Dec}_\Gamma$, and let $c_E$ be the per-transmission cost of sending an enumerative or individually reconstructed equivalent with the same retained adequacy. If
$$
C_{\mathrm{dec}}+M c_D<M c_E,
\tag{P.16b.15a.17}
$$
then PCE selects the shared symbolic decoder plus repeated dressed symbols over repeated enumerative reconstruction.

*Proof.* Both strategies have the same retained adequacy by hypothesis. Their total signal costs are $C_{\mathrm{dec}}+M c_D$ and $M c_E$. Inequality (P.16b.15a.17) is exactly the strict lower-cost condition of Theorem P.16b.9.3 applied to the collective presentation. Therefore the shared decoder strategy is PCE-selected. ∎

**Remark P.16b.15a.8 (Sun, Moon, and Kernel/Dressing Separation).**

For the sun, the kernel may include day/night recurrence, light, warmth, direction, seasonal structure, visibility, agricultural timing, and order. Local dressings may include a solar deity, royal sign, eye image, calendar marker, ritual fire analogue, or scientific stellar model. For the moon, the kernel may include phase recurrence, night illumination, month-scale counting, change, ritual timing, and tide relevance where ecologically available. Local dressings may include a lunar deity, animal image, ancestor light, calendar rule, fertility-cycle symbol, or orbital-mechanics model. The PU claim is not that all cultures carry the same surface myth. The claim is that successful dressings preserve enough of the predictive kernel for the symbol to remain useful.

**Remark P.16b.15a.9 (Kolmogorov-Style Boundary).**

The analogy with Kolmogorov complexity is a description-cost heuristic, not a replacement for role-position identity. A short dressing is valuable only if its decoder preserves the relevant response role. By Theorem P.16b.16.4, equality of Shannon or Kolmogorov-style projections does not by itself imply equality of predictive role unless a separating projection branch is supplied.

**Remark P.16b.15a.10 (Archetypal Vocabulary without Extra Ontology).**

Vocabulary such as archetype, collective symbol, or collective-unconscious image can be read operationally here as recurrence of kernel-equivalent symbolic compressions in collective predictive model presentations. This does not assert a fixed inherited image dictionary, nor does it make a metaphysical claim beyond the finite response quotient. It states only that high-use recurrent prediction problems can be compressed into transmissible forms whose surface dressings differ while their predictive kernels survive.

**Remark P.16b.15a.11 (Placebo as Dressed Kernel Coupled into Bodily Context).**

A placebo-active symbol is a dressed predictive kernel whose decoding changes an aggregate's physically instantiated context state and couples to a reachable internal physiological channel in the sense of P.8.9a.7.5. In this notation, a healing context has the schematic form
$$
D_\Gamma(K_{\mathrm{heal}})
\longrightarrow
\chi_S(t)
\longrightarrow
\Delta p_a,
\tag{P.16b.15a.18}
$$
where $\chi_S(t)$ is a retained component of $\mathrm{context}_S(t)$ and $\Delta p_a$ is bounded by Corollary P.8.9a.7b.6. The surface object is not pharmacologically active merely by being a symbol; it becomes placebo-active only when the decoded kernel is internalized with nonzero accessibility-fidelity coefficient for the relevant physiological channel.

---

### P.16b.16 Information Projections and Many-to-One Boundaries

**Definition P.16b.16.1 (Finite profile projections).**

Let
$$
\mathcal P_S(c)=(\Delta Q_S(c),\mu_S(c),\sigma_S(c))
$$
be a finite perspectival coordinate chart on the operational quotient $\mathcal F_S$ where defined.

A Shannon projection is a branch map
$$
\rho_H(\Delta Q,\mu,\sigma)=\Delta Q
$$
on a pure-information branch where $\Delta Q$ is identified with the Shannon entropy coordinate. A Kolmogorov-style projection is a branch map
$$
\rho_K(\Delta Q,\mu,\sigma)=K_S(c)
$$
when the content is represented by a finite program or code relative to $S$'s retained apparatus.

**Theorem P.16b.16.2 (Shannon recovery on the pure-information branch).**

On a branch where content $c$ is purely informational and the finite chart is normalized by
$$
\Delta Q_S(c)=H(c),
\qquad
\mu_S(c)=0,
\qquad
\sigma_S(c)=0,
$$
the Shannon projection recovers Shannon entropy:
$$
\rho_H(\mathcal P_S(c))=H(c).
$$

*Proof.* Substitute the branch normalization into Definition P.16b.16.1:
$$
\rho_H(\mathcal P_S(c))=\rho_H(H(c),0,0)=H(c).
$$
∎

**Corollary P.16b.16.3 (Shannon projection is many-to-one).**

The Shannon projection does not classify full perspectival role. Distinct profiles
$$
(\Delta Q,\mu_1,\sigma_1)
\ne
(\Delta Q,\mu_2,\sigma_2)
$$
with the same first coordinate have the same Shannon projection.

*Proof.* Definition P.16b.16.1 ignores $\mu$ and $\sigma$ in $\rho_H$. Therefore all profiles with the same $\Delta Q$ have the same Shannon projection, even when their full operational roles differ. ∎

**Theorem P.16b.16.4 (Information projections do not replace role-position equivalence).**

Equality of Shannon or Kolmogorov-style projections does not imply equality in $\mathcal F_S$ unless a separating projection branch is supplied.

*Proof.* By Theorem P.16b.7.4, equality in $\mathcal F_S$ is equality of operational response-presheaf role. By Corollary P.16b.7.5, finite coordinate equality is weaker than role-position equality unless the chart is separating. Since $\rho_H$ and $\rho_K$ discard response-presheaf data on their ordinary branches, equality of their values does not force equality of operational role without a separating hypothesis. ∎

**Corollary P.16b.16.5 (Cogito-zero boundary for profile costs).**

The zero of a profile cost identifies the cogito only on the separating-origin branch of Definition P.16b.6.5. Without that branch, zero cost identifies only a zero value in the chosen finite chart.

*Proof.* This is Theorem P.16b.6.6 and Remark P.16b.6.7 applied to information-projection costs. ∎

---

### P.16b.17 Consolidated Status Table

| Result | Statement | Status |
|:---|:---|:---|
| Theorem P.16b.1.3 | Liar contradiction requires role collapse | theorem-level semantic algebra |
| Theorem P.16b.2.4 | Least perspective closure exists | theorem-level lattice theorem |
| Theorem P.16b.2.7 | Labeled proof system is sound and complete | theorem-level |
| Theorem P.16b.3.2 | Finite-support no-explosion | theorem-level on finite-support branch |
| Theorem P.16b.4.2 | Prop-typed expressions are locally classical | theorem-level on value-compositional Prop branch |
| Theorem P.16b.5.2 | Global section iff holonomy is trivial and overlaps are compatible | theorem-level finite-atlas theorem |
| Theorem P.16b.6.2 | Cogito is least self-evidence fixed point | theorem-level on cogito-evidence branch |
| Theorem P.16b.6.6 | Cogito is unique zero only on separating-origin branch | theorem-level branch theorem |
| Theorem P.16b.7.4 | Predictive role-position equivalence | theorem-level quotient theorem |
| Theorem P.16b.8.5 | Description-arity equals three for the core semantic ledger | theorem-level on typed non-collapse and Primitive-Lens Independence branch |
| Theorem P.16b.9.2 | Over-budget task families force compression | theorem-level finite-resource theorem |
| Theorem P.16b.10.3 | Structural decompression is sound | theorem-level |
| Theorem P.16b.10.4 | Annotation transfer is hypothesis generation | theorem-level status separation |
| Theorem P.16b.10.6 | Creativity algorithm has theorem/error/hypothesis output statuses | theorem-level |
| Theorem P.16b.12.2 | Derivable perspective judgments have finite provenance | theorem-level |
| Theorem P.16b.12.4 | Conjunctive fusion is conservative | theorem-level |
| Theorem P.16b.12.6 | Finite Prop/Proc classification criterion | theorem-level on bounded-evaluation branch |
| Theorem P.16b.12.8 | Perspective discrepancy is a pseudometric | theorem-level |
| Theorem P.16b.12.10 | Operational qualia metric descends to a metric quotient | theorem-level on retained-test branch |
| Theorem P.16b.12.12 | Nontrivial signed holonomy obstructs a global Boolean section | theorem-level finite-atlas theorem |
| Theorem P.16b.12.13 | Role, process, and holonomy obstructions are distinct | theorem-level branch synthesis |
| Theorem P.16b.13.4 | Adjacent recurrence statistic is bounded by Jensen-Shannon divergence | theorem-level finite statistic |
| Theorem P.16b.13.5 | Shared grammar rules reduce description length when duplicated rule cost exceeds reference overhead | theorem-level coding result |
| Theorem P.16b.14.5 | Engagement is internal configuration membership | theorem-level on self-organization branch |
| Theorem P.16b.14.8 | Recognition is shape-coherent self-reconfiguration | branch-level representation theorem |
| Theorem P.16b.14.9 | Cogito radial coordinate is 1-Lipschitz and unique on separating branch | theorem-level metric result |
| Theorem P.16b.14.10 | Operational qualia are active configurations | branch-level boundary theorem |
| Theorem P.16b.14.11 | Creativity is reconfiguration plus decompression/export | branch-level integration theorem |
| Proposition P.16b.15.2 | Fractal-like psyche claim follows conditionally from SSSH on natural traces | conditional empirical branch |
| Theorem P.16b.15a.4 | Local symbolic dressings of the same adequate predictive kernel preserve role up to $2\epsilon$ | theorem-level pseudometric result on retained comparison branch |
| Theorem P.16b.15a.5 | PCE selects compressed symbolic encodings over costlier equal-adequacy enumerations | theorem-level on PCE presentation branch |
| Corollary P.16b.15a.6 | The cultural-function unit is a collective response-quotient point; adequate dressings are tolerance-controlled encodings on a common comparison branch | theorem-level semantic compression corollary |
| Theorem P.16b.15a.7 | Shared cultural decoders amortize symbolic decompression cost when the setup inequality holds | theorem-level coding result |
| Theorem P.16b.16.2 | Shannon projection recovers entropy on pure-information branch | theorem-level branch theorem |
| Corollary P.16b.16.3 | Shannon projection is many-to-one | theorem-level boundary |
| Theorem P.16b.16.4 | Information projections do not replace role-position equivalence | theorem-level boundary |
| Corollary P.16b.16.5 | Cogito-zero boundary requires the separating-origin branch | theorem-level boundary |
| Conjecture P.16b.10.7 | Shape recognition plus decompression suffices for intuitive structural creativity | open conjecture |

## P.16c Generative Non-Closure: Axioms as Stable Responses to Incompleteness

### P.16c.0 Standing and Scope

This section records the philosophical form of Appendix A.6. It does not add a fourth axiom, a new postulate, or a new physical branch. It gives the conservative reading of the existing formal apparatus:

$$
\text{incompleteness is not contained by a complete axiom system;}
$$

rather,

$$
\text{stable axiom-like structure is generated as the finite response to non-closure.}
$$

The claim is not that incompleteness alone uniquely derives ZFC, type theory, the Standard Model, or any particular completed formalism. The claim is narrower and theorem-level inside PU: once a predictor has the SPAP-capable self-referential structure of Appendix A, total internal reflexive self-closure is impossible, and any nontrivial verified prediction-update cycle must operate through stable finite partial closures.

### P.16c.1 Generative non-closure reading

**Definition P.16c.1 (Generative non-closure reading).** A PU presentation has the **generative non-closure reading** when the following identifications are made.

1. The primitive obstruction is the impossibility of total internal reflexive self-closure established by Theorem A.6.2.
2. The admissible internal replacements for total closure are the stable axiom-stabilizers of Definition A.6.3.
3. The ordinary formal roles of axioms, inference rules, verification predicates, typing restrictions, bridge laws, and response quotients are read as finite partial-closure boundaries.
4. PCE selects least-cost representatives of these boundaries when the relevant existence hypotheses for a PCE minimum hold.
5. PPI admits only those abstract structures whose retained distinctions have finite protocol-response instantiation.

Under this reading, incompleteness is not an additional item placed inside an otherwise complete formal container. It is the obstruction that forces finite containers to form.

**Theorem P.16c.2 (Axioms as stabilization boundaries).** In the PU formal setting, every axiom-like structure generated by the retained domain of a nontrivial finite prediction-update cycle is a stable partial closure boundary in the sense of Appendix A.6. Conversely, every stable axiom-stabilizer supplies an axiom-like local formal system for its retained response domain.

*Proof.* Let a nontrivial finite prediction-update cycle be given. By Theorem A.6.4 it induces a stable axiom-stabilizer

$$
\mathfrak A_{S,B}
=
(D_{S,B},J_{S,B},\vdash_{S,B},V_{S,B},q_{S,B}).
$$

The components of this tuple have exactly the local roles of a formal system: $J_{S,B}$ supplies accepted seeds, $\vdash_{S,B}$ supplies rules, $V_{S,B}$ supplies retained verification, and $q_{S,B}$ supplies the equality or quotient relation under which redundant labels are removed. The diagonal guard prevents the stabilizer from becoming an illicit total internal truth predicate. This proves that every axiom-like structure generated by the retained finite domain of the cycle is a stable partial closure boundary.

Conversely, given a stable axiom-stabilizer, the same tuple supplies seeds, rules, verification, and quotienting on its retained response domain. That is an axiom-like local formal system. ∎

**Corollary P.16c.3 (Predictionism as axiom-generation).** Predictionism can be stated in generative-non-closure form:

$$
\text{reflexive non-closure}
\Longrightarrow
\text{finite distinction}
\Longrightarrow
\text{verification cut}
\Longrightarrow
\text{logic}
\Longrightarrow
\text{stable partial closure}.
$$

*Proof.* The impossibility of total reflexive closure is Theorem A.6.2. A nontrivial prediction-update cycle must nevertheless distinguish accepted from non-accepted responses, and Remark A.0.1.1 identifies this distinction with a binary verification cut. Propositions A.0.1-A.0.2 derive the corresponding Boolean operations from verification. Theorem A.6.4 then packages the retained verified update domain as a stable axiom-stabilizer. ∎

**Theorem P.16c.4 (Conservative inversion of the usual axiom-incompleteness order).** Within PU, the ordinary explanatory order

$$
\text{axioms}
\Longrightarrow
\text{self-reference}
\Longrightarrow
\text{incompleteness}
$$

has the conservative equivalent reading

$$
\text{reflexive non-closure}
\Longrightarrow
\text{stable finite partial closures}
\Longrightarrow
\text{axiom-like formal structure}.
$$

This inversion changes no theorem-level result and promotes no branch-conditional or certificate-pending claim to theorem status.

*Proof.* The first chain is the ordinary formal-system presentation: once a sufficiently expressive axiom system represents its own syntax and proof relation, diagonal incompleteness phenomena arise. PU retains that presentation wherever formal proof systems are used.

The second chain follows from Appendix A.6. Theorem A.6.2 supplies reflexive non-closure. Theorem A.6.4 supplies the necessity of stable finite partial closures for nontrivial verified prediction. Definition A.6.3 identifies those closures with the components that play axiom-like roles. Theorem A.6.6 proves that this vocabulary is conservative over the prior apparatus, so no theorem, branch condition, certificate status, or numerical backbone value changes. ∎

### P.16c.5 Relation to ordinary mathematical foundations

The generative-non-closure reading separates three claims.

1. **Ordinary incompleteness claim:** a sufficiently strong fixed formal system may contain true but unprovable sentences relative to that system.
2. **PU reachability claim:** a PA proof-object may exist while a bounded predictor cannot integrate its proof-content into its own self-model at finite cost.
3. **Generative-non-closure claim:** because total internal self-closure is impossible, stable local axiom systems arise as finite partial-closure boundaries.

These claims are compatible but not identical. The first is formal-system-relative. The second is predictor-relative. The third is structural: it explains why finite axiom-like boundaries are needed at all.

### P.16c.6 Reduction table

| Generative non-closure item | Reduces to | Status |
|:--|:--|:--|
| No total internal reflexive self-closure | Theorem A.5.1 and Theorem A.6.2 | theorem-level inside PU |
| Stable axiom-stabilizer | Definition A.6.3 | definition over existing finite-response apparatus |
| Necessity of local axiom-like structure | Theorem A.6.4 | theorem-level for nontrivial verified finite prediction |
| Incompleteness-to-axiom inversion | Theorem P.16c.4 | conservative philosophical theorem |
| No promotion of physical branch status | Theorem A.6.6 | theorem-level conservativity guard |

---

## P.16d Operational Program Modules from the Finite-Response Quotient

### P.16d.0 Standing and Scope

This section records twenty operational program modules generated by the finite-response PPI/PCE quotient already developed in Section P.6.1b. The modules introduce no new primitive, no new physical degree of freedom, no new numerical prediction, and no promotion in the Global Strict-Certificate Ledger. A module has physical effect only when it changes a finite protocol-response presheaf, lowers an already-defined PPI/PCE cost, supplies a certificate accepted by the existing ledger, or records an explicitly retained finite branch degeneracy.

The common source is the same finite operational quotient used in Theorem P.6.1b.3, Theorem P.6.1b.7, Theorem P.6.1b.8a, Corollary P.6.1b.8, and Corollary P.6.1b.8b.

**Definition P.16d.0.1 (Finite Predictive Budget).** A finite predictive budget is a tuple
$$
B=(\mathsf P_B,\Omega_B,q_B,\eta_B,\vartheta_B,\mathcal L_B)
$$
where:

1. $\mathsf P_B$ is a finite subcategory of MPU-admissible protocols.
2. Each $P\in\mathsf P_B$ has a finite retained outcome set $\Omega_{B,P}$.
3. $q_{B,P}$ is the retained coarse-graining or resolution map from the raw outcome record of $P$ to $\Omega_{B,P}$.
4. $\eta_B(P)\ge0$ is the retained operational tolerance for protocol $P$.
5. $\vartheta_{B,P}:\Delta(\Omega_{B,P})\to T_{B,P}$ is a registered tolerance quotient map onto a finite or compact response space $T_{B,P}$, with each fiber having $d_{TV}$-diameter at most $\eta_B(P)$.
6. $\mathcal L_B$ is the finite PPI/PCE cost ledger restricted to the protocols, resolutions, tolerance quotients, and certificate data in $B$.

For a PPI-admissible candidate $X$, its raw retained $B$-response and tolerance-quotiented $B$-response are
$$
\widehat{\mathcal R}_X^B(P)
=
(q_{B,P})_*\mathcal R_X(P),
\qquad
\mathcal R_X^B(P)
=
\vartheta_{B,P}\!\left(\widehat{\mathcal R}_X^B(P)\right),
\qquad P\in\mathsf P_B.
\tag{P.16d.0.1}
$$

Two candidates are $B$-equivalent, written
$$
X\sim_B Y,
$$
when their tolerance-quotiented response presheaves are naturally isomorphic and all retained update, verification, and certificate maps agree after the same quotient:
$$
\mathcal R_X^B\simeq\mathcal R_Y^B
\quad
\text{and}
\quad
U_X^B=U_Y^B,\ V_X^B=V_Y^B,\ C_X^B=C_Y^B
\quad
\text{in the retained quotient.}
\tag{P.16d.0.2}
$$
This is an equivalence relation because it is equality or natural isomorphism after fixed quotient maps, not a raw threshold-neighborhood relation.

The finite predictive quotient is
$$
Q_B(\mathcal A)=\mathcal A/{\sim_B}
\tag{P.16d.0.3}
$$
for any admissible candidate family $\mathcal A$.

**Definition P.16d.0.2 (Retained Program Module).** A retained program module is a rule assigning to each finite predictive budget $B$:

1. a finite candidate family $\mathcal A_B$ or compact finite-response closure of such a family;
2. a quotient $Q_B(\mathcal A_B)$;
3. a descended nonnegative cost
$$
\bar{\mathcal L}_B:Q_B(\mathcal A_B)\to\mathbb R_{\ge0}\cup\{+\infty\};
$$
4. a status map into the existing theorem, branch, certificate-pending, model-layer, or conjectural ledger.

A retained module is conservative when it does not alter any accepted physical branch unless one of the following changes is supplied: a finite response presheaf, a descended cost, a certificate object, an overlap-commutativity proof, or a finite branch-degeneracy record.

**Theorem P.16d.0.3 (Finite-Response Module Master Lemma).** Let $B$ be a finite predictive budget and let $\mathcal A_B$ be a nonempty finite candidate family, or more generally a nonempty compact finite-response closure of a raw finite-code family as in Theorem P.6.1b.8a. Suppose $\bar{\mathcal L}_B$ is the descended PPI/PCE cost on $Q_B(\mathcal A_B)$, equipped with the quotient finite-response topology. Then:

1. $Q_B(\mathcal A_B)$ is finite or compact in the finite-response topology.
2. $\bar{\mathcal L}_B$ attains a minimum whenever it is lower semicontinuous and finite on at least one quotient class.
3. If a candidate label, field, branch tag, coordinate, interpretation, or auxiliary variable changes no $B$-response presheaf, no retained update or verification map, no accepted certificate map, and lowers no term in $\bar{\mathcal L}_B$, it is removed by PCE.
4. Under the scalar strict-convexity branch of Theorem P.6.1b.7, the scalar-cost minimum is unique up to $B$-equivalence. Under its lexicographic branch, the sequential lexicographic minimizer of $(L_{\mathrm{viol}},L_{\mathrm{regret}},L_{\mathrm{desc}})$ is unique up to $B$-equivalence.
5. If the applicable nondegeneracy condition fails, equal-cost multiplicity among distinct quotient points is recorded as a finite-response branch degeneracy, not hidden physical surplus. It is a finite-cardinality degeneracy only when the relevant quotient or minimizer set is finite, or when an accepted certificate supplies a finite degeneracy record.

*Proof.* If $\mathcal A_B$ is finite, its quotient is finite. In the closure case, the retained response data lie in
$$
X_B=\prod_{P\in\mathsf P_B}T_{B,P}.
$$
The index set $\mathsf P_B$ is finite and every factor is compact, so $X_B$ is compact. The finite-response closure is a closed subset of $X_B$ and is compact. The canonical map to the quotient by retained natural isomorphism is continuous and surjective; the continuous image of a compact space is compact. This proves item 1.

For item 2, the finite case is immediate because a real-valued function on a nonempty finite set attains its minimum. In the compact case, choose a class $q_0$ with $\bar{\mathcal L}_B(q_0)<+\infty$ and put
$$
m=\inf_{q\in Q_B(\mathcal A_B)}\bar{\mathcal L}_B(q).
$$
Then $m\le\bar{\mathcal L}_B(q_0)<+\infty$ and $m\ge0$. For each $n\ge1$, the sublevel
$$
F_n=
\left\{q:\bar{\mathcal L}_B(q)\le m+\frac1n\right\}
$$
is nonempty by the definition of $m$, closed by lower semicontinuity, and nested. Compactness gives $q_*\in\bigcap_{n\ge1}F_n$, and therefore
$$
\bar{\mathcal L}_B(q_*)\le m+\frac1n
$$
for every $n$. Hence $\bar{\mathcal L}_B(q_*)=m$.

A response-null addition has the same quotient point and changes none of the retained maps. If it lowers no cost and supplies no certificate role, Corollary P.6.1a.4 and Corollary P.6.1b.8 remove it, proving item 3. On the scalar branch, Theorem P.6.1b.7 applies to the descended quotient and gives a unique scalar minimizer. On the lexicographic branch, sequential minimization of the three lower-semicontinuous components and injectivity of their triple give the unique lexicographic minimizer. This proves item 4. Without the corresponding nondegeneracy hypothesis, distinct non-isomorphic quotient points may have equal cost; Theorem P.6.1b.8a records that multiplicity as branch degeneracy. Compactness alone does not make the minimizer set finite, so cardinal finiteness follows only in the two cases stated in item 5. ∎

**Corollary P.16d.0.4 (No New Axiom Condition).** Any construction in Sections P.16d.1–P.16d.20 is admissible as a PU module only as a specialization of Definition P.16d.0.2 and Theorem P.16d.0.3.

*Proof.* Each module below is written as a rule on finite response presheaves, finite costs, update maps, verification maps, certificate commutativity, or finite branch degeneracy. Those are exactly the retained data of Definition P.16d.0.2. Since Theorem P.16d.0.3 supplies the quotient and selection rule, no additional axiom is used. ∎

---

### P.16d.1 Predictive Renormalization Group

**Definition P.16d.1.1 (Predictive Renormalization Group Flow).** Let $B_1$ and $B_2$ be finite predictive budgets. Write
$$
B_2\preceq B_1
$$
when $B_2$ is no finer than $B_1$: every retained $B_2$ protocol, outcome, tolerance quotient, update, verification, certificate datum, and cost comparison is obtained from $B_1$ by deleting protocols, coarse-graining outcomes, enlarging tolerances through registered quotient maps, or discarding response-null cost coordinates. Equivalently, the coarsening is required to satisfy
$$
X\sim_{B_1}Y
\quad\Longrightarrow\quad
X\sim_{B_2}Y.
$$

For $B_2\preceq B_1$, define the predictive renormalization map
$$
\Phi_{B_2\leftarrow B_1}:Q_{B_1}(\mathcal A)\to Q_{B_2}(\mathcal A)
\tag{P.16d.1.1}
$$
by
$$
\Phi_{B_2\leftarrow B_1}([X]_{B_1})=[X]_{B_2}.
$$

A distinction between $X$ and $Y$ is:

1. $B$-retained if $X\not\sim_B Y$;
2. $B$-irrelevant if $X\sim_B Y$;
3. cross-budget forced on a budget family $\mathcal B$ if it is retained by every quotient map in $\mathcal B$ and is invariant under all defined PRG flows.

**Theorem P.16d.1.2 (PRG Functoriality and Response-Survival Criterion).** The maps $\Phi_{B_2\leftarrow B_1}$ are well-defined and satisfy
$$
\Phi_{B\leftarrow B}=\operatorname{id}_{Q_B},
\qquad
\Phi_{B_3\leftarrow B_2}\circ\Phi_{B_2\leftarrow B_1}
=
\Phi_{B_3\leftarrow B_1}
$$
whenever $B_3\preceq B_2\preceq B_1$. A distinction has physical content at budget $B$ exactly when it survives as a nontrivial distinction in $Q_B$, changes a retained update or verification map, supplies an accepted certificate role, or lowers the descended cost in $Q_B$.

*Proof.* If $X\sim_{B_1}Y$, the defining compatibility of $B_2\preceq B_1$ gives $X\sim_{B_2}Y$, so $\Phi_{B_2\leftarrow B_1}$ is independent of representative. The identity and composition equations follow from applying the same representative $X$ and then taking the appropriate quotient class. The final statement is Corollary P.6.1b.8 and Corollary P.6.1b.8b applied to $Q_B$: a distinction that changes no retained response or map, supplies no certificate role, and lowers no cost is quotient-null; the listed alternatives are exactly the retained channels. ∎

---

### P.16d.2 Finite-Channel Covariance

**Definition P.16d.2.1 (Finite-Channel Equivalence).** Two finite predictive presentations $(B,\mathcal A,\mathcal R,\bar{\mathcal L})$ and $(B',\mathcal A',\mathcal R',\bar{\mathcal L}')$ are finite-channel equivalent when there are:

1. a protocol equivalence $F:\mathsf P_B\to\mathsf P_{B'}$;
2. finite stochastic isomorphisms of retained outcome distributions compatible with the tolerance quotient maps;
3. a bijection of quotient classes
$$
\Xi:Q_B(\mathcal A)\to Q_{B'}(\mathcal A')
$$
such that
$$
\mathcal R_{\Xi([X])}^{B'}(F(P))\simeq\mathcal R_X^B(P)
$$
for all retained protocols $P$, all retained update, verification, and certificate maps are transported to their counterparts, and
$$
\bar{\mathcal L}'(\Xi([X]))=\bar{\mathcal L}([X]).
$$

A law, constraint, or selection rule is finite-channel covariant when it is invariant under every finite-channel equivalence.

**Theorem P.16d.2.2 (Finite-Channel Covariance of PPI/PCE Content).** Any physical claim expressible solely in terms of finite response presheaves, natural transformations, descended PPI/PCE costs, retained update or verification maps, or accepted certificate commutativity is finite-channel covariant.

*Proof.* A finite-channel equivalence preserves the response presheaves up to finite stochastic isomorphism, transports the retained maps, and preserves the descended cost. Therefore truth of any statement depending only on those preserved data is invariant under $\Xi$. Natural transformations are transported by conjugation with $F$ and the stochastic isomorphisms, preserving commutative diagrams. Certificate commutativity is equality in the retained quotient, which is preserved by $\Xi$. Hence PPI/PCE content does not depend on encoding, representation, observer protocol labels, or resolution labels when the finite response content is preserved. ∎

---

### P.16d.3 Anomaly-as-Paradox-Residue

**Definition P.16d.3.1 (Paradox Residue).** For a candidate branch $X$ at budget $B$, define its paradox residue as the tuple
$$
\mathfrak R_B(X)
=
(r_{\mathrm{nat}},r_{\mathrm{viol}},r_{\mathrm{SPAP}},r_{\mathrm{cert}},r_{\mathrm{sur}})
\tag{P.16d.3.1}
$$
where:

1. $r_{\mathrm{nat}}=0$ exactly when $\mathcal R_X^B$ is a natural presheaf on $\mathsf P_B$.
2. $r_{\mathrm{viol}}=0$ exactly when the branch violates no already-derived PU constraint in the retained ledger.
3. $r_{\mathrm{SPAP}}=0$ exactly when the branch introduces no unindexed self-prediction, role-collapse, perfect self-readout, or SPAP/RUD-forbidden closure.
4. $r_{\mathrm{cert}}=0$ exactly when every certificate overlap square required for the claimed status commutes.
5. $r_{\mathrm{sur}}=0$ exactly when all response-null surplus has been quotiented or removed by PCE.

The total residue is zero when all five components vanish.

**Theorem P.16d.3.2 (Residue-Descent Equivalence).** Relative to the finite budget $B$ and claimed status level $s$, suppose a candidate branch has complete retained response data, retained update and verification maps, and every certificate object required by status $s$ is present in the finite ledger. Then the candidate descends to an admissible finite-response PU branch at status $s$ exactly when its paradox residue is zero at the corresponding budget and certificate level.

*Proof.* If the branch descends, its response object is a natural presheaf by Definition P.6.1b.1; it satisfies the constraints required for admission; it cannot use a self-prediction or role-collapse forbidden by Theorems 10–11 or the semantic role-indexing of Section P.16b; its status certificates must commute by Convention P.14.1k and the strict-certificate rules; and response-null surplus is removed by Corollary P.6.1b.8. Hence all residue components vanish.

Conversely, if all residue components vanish and the stated finite data are complete, $\mathcal R_X^B$ is a natural finite response presheaf, the branch violates no retained PU constraint, no SPAP/RUD obstruction is invoked, the certificate overlaps needed for status $s$ commute, and no surplus remains. Theorem P.6.1b.8a then places the branch in the finite operational quotient, and Theorem P.16d.0.3 supplies the PPI/PCE selected class or finite-response degeneracy status. Thus the branch descends relative to $B$ and $s$. ∎

---

### P.16d.4 Operational Naturalness

**Definition P.16d.4.1 (Operational Naturalness).** Let $\lambda_B:Q_B(\mathcal A)\to\Lambda_B$ be a retained finite coordinate, parameter, or bridge-normalization readout. It is operationally natural on a budget family $\mathcal B$ when for every $B_2\preceq B_1$ in $\mathcal B$ there exists a deterministic finite map $\rho_{B_2\leftarrow B_1}$ such that
$$
\lambda_{B_2}(\Phi_{B_2\leftarrow B_1}([X]_{B_1}))
=
\rho_{B_2\leftarrow B_1}(\lambda_{B_1}([X]_{B_1}))
\tag{P.16d.4.1}
$$
for every retained class $[X]$, and the code length of the transition rule $\rho_{B_2\leftarrow B_1}$ is bounded on $\mathcal B$.

A parameter is operationally fine-tuned at $B$ when retaining it requires additional precision or description length that changes no finite response, changes no retained map, supplies no certificate role, and lowers no cost in $Q_B$.

**Theorem P.16d.4.2 (Naturalness Equals PRG-Stable Response Content).** On a strict finite PCE branch, operationally natural parameters are exactly the finite response coordinates that survive PRG flow with bounded transition description. Operationally fine-tuned precision is removed unless it changes a finite response, changes a retained map, lowers a cost, or is protected by a certificate.

*Proof.* If $\lambda$ is operationally natural, Equation (P.16d.4.1) says its coarser-budget value is determined by its finer-budget value under the PRG flow; hence it survives quotienting as response content with bounded description. Conversely, if a response coordinate survives every PRG flow in the family and its transition rule has bounded description, define $\rho_{B_2\leftarrow B_1}$ by the induced quotient map; this gives (P.16d.4.1). If additional precision changes no finite response, changes no retained map, supplies no certificate role, and lowers no cost, it is response-null surplus and is removed by Corollary P.6.1b.8. If it changes a response, changes a retained map, lowers cost, or is certificate-protected, it is not fine-tuned in this operational sense but retained as response, map, cost, or certificate data. ∎

---

### P.16d.5 Context-State Tomography

**Definition P.16d.5.1 (Context-State Tomography Map).** Let $S$ be an MPU aggregate with context space $\mathcal C_{\mathrm{ctx}}$ as in Definition L.1. For a finite intervention family $\mathsf I_B$ and finite readout protocols $\mathsf O_B$, define
$$
\Theta_{S,B}:\mathcal C_{\mathrm{ctx}}\to
\prod_{I\in\mathsf I_B,\ O\in\mathsf O_B}\Delta(\Omega_{I,O})
\tag{P.16d.5.1}
$$
by
$$
\Theta_{S,B}(c)_{I,O}
=
\Pr_S(\cdot\mid I,O,c).
$$
Equip the product with the retained pseudometric
$$
d_B^\Theta(c,c')
=
\max_{I\in\mathsf I_B,\ O\in\mathsf O_B}
d_{TV}\!\left(\Theta_{S,B}(c)_{I,O},\Theta_{S,B}(c')_{I,O}\right).
$$
Let $\vartheta_B^\Theta$ be the product tolerance quotient induced by the retained tolerance maps. The tomographic context quotient is
$$
\mathcal C_{\mathrm{ctx}}/{\sim_{\Theta,B}},
\qquad
c\sim_{\Theta,B}c'
\Longleftrightarrow
\vartheta_B^\Theta(\Theta_{S,B}(c))
=
\vartheta_B^\Theta(\Theta_{S,B}(c')).
\tag{P.16d.5.2}
$$

**Theorem P.16d.5.2 (Tomographic Identifiability Criterion).** A finite context-state tomography protocol always reconstructs at most the retained operational context class
$$
[c]_{\Theta,B}\in \mathcal C_{\mathrm{ctx}}/{\sim_{\Theta,B}}.
$$
It reconstructs a unique raw context state $c$ from the retained data if and only if
$$
\vartheta_B^\Theta\circ\Theta_{S,B}:\mathcal C_{\mathrm{ctx}}\to \prod_{I,O}T_{B,I,O}
$$
is injective on the candidate context domain under consideration. If this map is not injective, the protocol reconstructs only the quotient class $[c]_{\Theta,B}$.

*Proof.* By Definition P.16d.5.1, two contexts are identified exactly when their retained intervention-readout distributions agree after the registered tolerance quotient. Hence all observations in the finite protocol determine only the equivalence class $[c]_{\Theta,B}$. If the retained tomography map is injective on the candidate context domain, equality of retained responses implies equality of raw contexts, so the class contains one raw context. If injectivity fails, there are distinct contexts with the same retained finite response; no protocol in $\mathsf I_B,\mathsf O_B$ separates them at budget $B$, and selecting one of them adds response-null surplus. PCE therefore retains the quotient class and, when a minimum exists, a minimal sufficient representative within that class by Definition L.1 and Theorem P.16d.0.3. ∎

---

### P.16d.6 Thermodynamic Privacy and Reflexive Opacity

**Definition P.16d.6.1 (Transparency Protocol).** Let $S$ be a Property-R aggregate with self-model $\mathcal M_S$. A transparency protocol at tolerance $\eta$ is a finite protocol $T$ that attempts to reconstruct a retained self-context coordinate $z(\mathcal M_S)$ while leaving the operational response class of $S$ unchanged within $\eta$ and paying finite cost $C_T$.

It is perfect when $\eta=0$, the reconstruction is complete for all retained self-context coordinates, $C_T=0$, and the protocol produces no retained disturbance of the response class.

**Theorem P.16d.6.2 (Reflexive Opacity Bound).** For a Property-R aggregate with nontrivial self-context information $\Delta I>0$ measured in nats, no perfect transparency protocol exists on any branch where the self-context readout is an information-gaining 'Evolve'/ND-RID interaction to which Theorem 33 applies. Any protocol that obtains $\Delta I$ nats of retained self-context information must either pay nonzero thermodynamic/reflexive entropy cost, disturb the retained response class, or fail to reconstruct the complete self-context.

More precisely, on such a Theorem 33 branch, with $\Delta S_{\min}$ denoting the minimum physical entropy production for the retained self-context channel,
$$
\Delta I\cdot(\Delta S_{\min}/k_B)\ge\kappa_r>0,
\tag{P.16d.6.1}
$$
so
$$
\Delta S_{\min}/k_B\ge\kappa_r/\Delta I>0.
\tag{P.16d.6.2}
$$

*Proof.* A perfect protocol with $\Delta I>0$ would have $\Delta S_{\min}=0$ and no retained disturbance. On the stated branch, Theorem 33 gives (P.16d.6.1), so this is impossible. If the protocol tries instead to predict the full future behavior of the self-modeling system, it becomes a complete self-prediction protocol for a Property-R system and violates SPAP (Theorems 10–11). Therefore a transparency attempt must give up at least one perfection condition: it pays cost, disturbs the retained response class, or remains incomplete. ∎

---

### P.16d.7 Perspective Curvature

**Definition P.16d.7.1 (Predictive Transport and Perspective Curvature).** Let $\{U_i\}_{i\in I}$ be a finite perspective cover. For every overlap with admissible translation, let
$$
T_{ij}:Q_{B,i}\to Q_{B,j}
$$
be the finite predictive transport map. For a cycle
$$
\gamma=(i_0,i_1,\dots,i_n=i_0),
$$
define the holonomy
$$
H_\gamma
=
T_{i_{n-1}i_n}\circ\cdots\circ T_{i_0i_1}.
\tag{P.16d.7.1}
$$
The perspective-curvature defect on $\gamma$ is the retained equalizer failure of $H_\gamma$ and $\operatorname{id}$, measured by
$$
\operatorname{curv}_\gamma([X])
=
d_{B,i_0}\!\left(H_\gamma([X]),[X]\right)
\tag{P.16d.7.2}
$$
for the retained response metric or pseudometric $d_{B,i_0}$ on $Q_{B,i_0}$.

**Theorem P.16d.7.2 (Curvature as Path-Dependent Predictive Transport).** Suppose the finite perspective transports are defined on a connected component of the overlap graph and form partial isomorphisms on their overlap domains. Then that component admits a path-independent global response section exactly when every defined cycle has trivial holonomy and the overlap maps are compatible on triple overlaps. Nontrivial perspective curvature is precisely the obstruction to path-independent cross-perspective transport at the retained budget.

*Proof.* If a global section exists, transporting a local class around any defined cycle returns the value induced by the same global section, so $H_\gamma=\operatorname{id}$ on retained classes and all overlap maps agree on triple overlaps. Conversely, assume defined cycle holonomies are trivial and the overlap maps are compatible. Choose one base perspective in each connected component and define every other local section by transport along any path from the base. Partial-isomorphism and domain-compatibility assumptions ensure the transports are defined on the chosen class; trivial holonomy makes the result path-independent, and triple-overlap compatibility gives gluing. Hence a global section exists on that component. Nontrivial $\operatorname{curv}_\gamma$ means two paths give different retained response classes, so path-independence fails. ∎

---

### P.16d.8 Observer Calibration Theory

**Definition P.16d.8.1 (Calibration Kernel).** For predictive systems $S$ and $T$ at budget $B$, a calibration kernel is a pair of finite stochastic natural transformations
$$
K_{S\to T}^P:\Delta(\Omega_{B,P}^S)\to\Delta(\Omega_{B,P}^T),
\qquad
K_{T\to S}^P:\Delta(\Omega_{B,P}^T)\to\Delta(\Omega_{B,P}^S),
\qquad P\in\mathsf P_B,
$$
compatible with retained coarse-grainings and tolerance quotients. Its calibration error is
$$
\operatorname{cal}_B(S,T)
=
\sup_{P\in\mathsf P_B}
\left[
d_{TV}\left(K_{T\to S}^P K_{S\to T}^P\widehat{\mathcal R}_S^B(P),\widehat{\mathcal R}_S^B(P)\right)
+
d_{TV}\left(K_{S\to T}^P K_{T\to S}^P\widehat{\mathcal R}_T^B(P),\widehat{\mathcal R}_T^B(P)\right)
\right].
\tag{P.16d.8.1}
$$
The systems are calibrated at tolerance $\eta$ when $\operatorname{cal}_B(S,T)\le\eta$ and the tolerance-quotiented response classes agree.

**Theorem P.16d.8.2 (Reproducibility as Common Response Class).** A finite experiment is reproducible in the retained finite-response sense across a finite observer network with registered calibration kernels exactly when the observers' calibrated response presheaves have a nonempty common quotient class at the stated tolerance. PCE selects the calibration network with least descended cost among those common classes.

*Proof.* If a common quotient class exists, each observer's retained response can be transported into the same class by the calibration kernels, so the experiment has the same operational result across the network. If the experiment is reproducible, the observed results define a shared finite response class after calibration; otherwise at least one observer remains in a distinct quotient class and reproducibility fails. Among all calibration networks realizing the same shared class, Theorem P.16d.0.3 selects the least-cost representative. ∎

---

### P.16d.9 Horizon Tomography Beyond Gravity

**Definition P.16d.9.1 (Finite Predictive Horizon).** For a system $S$ and budget $B$, the finite predictive horizon is the kernel of the retained response map:
$$
\mathcal H_B(S)
=
\{(x,y):\mathcal R_x^B\simeq\mathcal R_y^B\}.
\tag{P.16d.9.1}
$$
A distinction lies beyond the $B$-horizon when it belongs to $\mathcal H_B(S)$, i.e. no protocol inside $B$ separates it after the retained tolerance quotient.

**Theorem P.16d.9.2 (Horizon as Kernel of Accessible Distinction).** Horizon tomography reconstructs the quotient by $\mathcal H_B(S)$ and cannot reconstruct distinctions inside $\mathcal H_B(S)$ without increasing the budget or adding a new separating protocol. If $B_2\preceq B_1$, then
$$
\mathcal H_{B_1}(S)\subseteq\mathcal H_{B_2}(S).
\tag{P.16d.9.2}
$$

*Proof.* By definition, $\mathcal H_B(S)$ identifies exactly the distinctions with identical retained response presheaves. Therefore the maximal reconstructable object is the quotient by that kernel. A distinction inside the kernel changes no retained finite response, so selecting it would be response-null surplus. If $B_2$ is coarser than $B_1$, the compatibility condition in Definition P.16d.1.1 gives $x\sim_{B_1}y\Rightarrow x\sim_{B_2}y$, proving the inclusion. ∎

---

### P.16d.10 PCE-Based Experiment Selection

**Definition P.16d.10.1 (Experiment Value Functional).** Let $\mathcal A_B$ be a finite set of admissible response classes with prior weights $\pi$. A finite experiment $e$ has cost
$$
C(e)>0
$$
and outcome partition $\mathcal P_e$ of $\mathcal A_B$. Let
$$
\mathcal H(\pi)=-\sum_{a\in\mathcal A_B}\pi(a)\ln\pi(a)
$$
and let $\pi_{e,o}$ be the posterior over classes after outcome cell $o\in\mathcal P_e$, with $\Pr(o\mid e)=\sum_{a\in o}\pi(a)$ on the deterministic partition branch. The expected response-class reduction is
$$
\Delta\mathcal H_B(e)
=
\mathcal H(\pi)
-
\sum_o\Pr(o\mid e)\mathcal H(\pi_{e,o}).
\tag{P.16d.10.1}
$$
The PCE experiment value is
$$
\operatorname{EV}_B(e)=\frac{\Delta\mathcal H_B(e)}{C(e)}.
\tag{P.16d.10.2}
$$

**Theorem P.16d.10.2 (Single-Step PCE Experiment Rule).** In a finite experiment menu with positive costs, any experiment maximizing $\operatorname{EV}_B(e)$ is a PCE-optimal single-step experiment for reducing admissible response-class uncertainty per unit cost.

*Proof.* PCE selects maximal predictive gain per resource expenditure at fixed functionality. Here the predictive gain is exactly the expected reduction in admissible response-class entropy, and the expenditure is $C(e)>0$. Since the menu is finite, a maximizer exists. Any experiment with smaller value is dominated for the stated single-step ratio objective. ∎

---

### P.16d.11 Self-Reference Spectroscopy

**Definition P.16d.11.1 (Reflexive Burden Spectrum).** Let $S$ be a self-modeling system. A matched task pair is a pair $(\tau_{\mathrm{ext}},\tau_{\mathrm{self}})$ with equal retained nonreflexive information load but different self-model engagement
$$
\Delta\mu_S
=
\mu_S(\tau_{\mathrm{self}})-\mu_S(\tau_{\mathrm{ext}})>0.
$$
The reflexive burden spectrum is
$$
\mathcal B_S(\tau_{\mathrm{self}},\tau_{\mathrm{ext}})
=
(\Delta E,\Delta t,\Delta N,\Delta\sigma,\Delta C)
\tag{P.16d.11.1}
$$
where the entries are the retained additional energy, latency, noise, entropy production, and process complexity of the self-context channel after subtracting the matched nonreflexive baseline.

**Theorem P.16d.11.2 (Spectroscopic Lower-Bound Criterion).** If $\tau_{\mathrm{self}}$ obtains nonzero retained self-context information $\Delta I>0$ nats beyond the matched external task, and if the matching certificate isolates $\Delta\sigma$ as the additional entropy production of that self-context channel, then
$$
\Delta\sigma/k_B\ge\kappa_r/\Delta I
$$
on the branch where Theorem 33 applies. If all entries of $\mathcal B_S$ vanish at budget $B$, then the matched task pair does not operationally distinguish reflexive burden at budget $B$.

*Proof.* The first claim is Theorem 33 applied to the additional self-context information obtained by the self-engaging task. The matching certificate removes the equal nonreflexive load, so the retained entropy difference $\Delta\sigma$ is the entropy production of the reflexive channel to which Theorem 33 is applied. The second claim follows from Definition P.16d.0.1: if all retained burden coordinates vanish, no $B$-response presheaf or retained cost separates the pair, so the distinction is quotient-null at that budget. ∎

---

### P.16d.12 Proof-Cost Physics

**Definition P.16d.12.1 (Finite Proof-Cost Datum).** For a finite verifier $S$, a proof-cost datum for a mathematical claim $\varphi$ is
$$
\mathfrak P_S(\varphi)=(\Pi_\varphi,V_S,C_S,\eta_S)
$$
where $\Pi_\varphi$ is a finite proof or certificate family, $V_S$ is the verification protocol, $C_S(\pi)$ is the physical resource cost of producing and verifying $\pi\in\Pi_\varphi$, and $\eta_S$ is the accepted verification tolerance.

**Theorem P.16d.12.2 (PCE Selection of Proof Representatives).** If two proof certificates $\pi_1,\pi_2$ verify the same claim $\varphi$ to the same tolerance and induce the same finite verification response, while
$$
C_S(\pi_1)<C_S(\pi_2),
$$
then $\pi_2$ is not PCE-selected as the retained representative for $S$ unless it changes another retained response or supplies an independent certificate role.

*Proof.* The two proofs lie in the same finite verification response class for $\varphi$. If $\pi_2$ has strictly larger cost and no additional response or certificate role, it is dominated by $\pi_1$ in the same quotient class. Corollary P.6.1a.4 removes the higher-cost representative. If $\pi_2$ changes another retained response or supplies an independent certificate role, then it is not in the same quotient problem and must be evaluated in the enlarged ledger. ∎

---

### P.16d.13 PCE Curriculum Theory

**Definition P.16d.13.1 (Curriculum Reconstruction Problem).** Let $S$ be a learner, $X$ a target response structure, and
$$
\mathbf q=(q_1,\dots,q_n)
$$
a finite instructional sequence. Let
$$
\operatorname{Rec}_S(\mathbf q)
$$
be the learner's reconstructed response presheaf after processing $\mathbf q$. For $\lambda,\gamma\ge0$, define curriculum loss
$$
L_{\mathrm{cur}}(\mathbf q)
=
d_B(\operatorname{Rec}_S(\mathbf q),\mathcal R_X^B)
+
\lambda C_S(\mathbf q)
+
\gamma A_S(\mathbf q)
\tag{P.16d.13.1}
$$
where $d_B$ is retained response discrepancy, $C_S$ is processing cost, and $A_S$ is ambiguity or reconstruction overhead.

**Theorem P.16d.13.2 (Curriculum PCE Existence and Minimality).** For a finite admissible curriculum menu, a PCE-optimal curriculum exists. It is any sequence minimizing $L_{\mathrm{cur}}$, and any sequence with equal reconstruction but strictly larger cost and ambiguity is removed.

*Proof.* A finite menu has at least one minimizer of the real-valued loss. The loss is exactly a PCE objective: retained reconstruction error plus resource and ambiguity costs. If two sequences have the same reconstructed response but one has larger cost and ambiguity, they lie in the same response class while one has larger descended cost; Corollary P.6.1a.4 removes the larger one. ∎

---

### P.16d.14 Institutional Error-Correction Theory

**Definition P.16d.14.1 (Institutional Predictive Code).** An institution at budget $B$ is a finite network
$$
\mathcal I=(\{S_i\},\mathsf R,\mathsf V,\mathsf C,\mathsf U)
$$
where $\{S_i\}$ are predictive agents or subsystems, $\mathsf R$ is a finite record channel, $\mathsf V$ is a verification protocol family, $\mathsf C$ is a correction map family, and $\mathsf U$ is an update rule on retained institutional records.

Let $E_B$ be a finite set of admissible record corruptions, written $e\cdot r$ for the corrupted record obtained from $r$. The code corrects $E_B$ when for every retained record $r$ and every corruption $e\in E_B$,
$$
\mathsf C(e\cdot r)\sim_B r.
\tag{P.16d.14.1}
$$

**Theorem P.16d.14.2 (Institutional Preservation Criterion).** An institutional predictive code preserves knowledge against $E_B$ exactly when its correction maps descend to the identity on the retained response quotient for all corruptions in $E_B$.

*Proof.* If $\mathsf C(e\cdot r)\sim_B r$ for every retained $r$ and $e$, the corrupted and corrected record induces the same finite response class as the uncorrupted record; hence the quotient knowledge state is preserved. Conversely, if knowledge is preserved in the quotient under all $e\in E_B$, then the corrected corrupted record and the original record must be equivalent in $Q_B$, which is exactly (P.16d.14.1). ∎

---

### P.16d.15 PU-Compatible AI Alignment

**Definition P.16d.15.1 (Finite Response Alignment).** Let $H$ be a human or human-institutional reference system and $A$ an artificial predictive system. At budget $B$, they are $\epsilon$-aligned over context family $\mathsf C_B$ when there exist context translation kernels $K_{H\to A}$ and $K_{A\to H}$ such that for every $c\in\mathsf C_B$ and retained protocol $P$,
$$
d_{TV}\left(K_{A\to H}\mathcal R_A^B(P\mid K_{H\to A}c),\mathcal R_H^B(P\mid c)\right)\le\epsilon,
\tag{P.16d.15.1}
$$
and the translated updates remain inside the accepted PU constraint and safety ledger.

**Theorem P.16d.15.2 (Alignment as Response-Compatibility, Not State Identity).** Finite response alignment requires common compatible response classes under context translation. It does not require equality of internal states. Exact internal-state recovery is not implied unless the context translation is separating and every cost, disturbance, or incompleteness required by the reflexive opacity bound of Theorem P.16d.6.2 is accounted for by an accepted finite certificate.

*Proof.* Equation (P.16d.15.1) is stated entirely in terms of translated finite response presheaves, so response compatibility is sufficient for the defined alignment property. Internal state equality is stronger than response equality. If the translation is not separating, distinct internal states induce the same retained response class, so equality cannot be inferred. If the state to be recovered includes nontrivial self-context information, Theorem P.16d.6.2 imposes nonzero cost, disturbance, or incompleteness on exact transparency. Thus alignment is a quotient-level compatibility condition unless additional separating and opacity-accounting certificates are supplied. ∎

---

### P.16d.16 Causal Intervention Budgeting

**Definition P.16d.16.1 (Intervention Budget Functional).** Let $u$ be a finite intervention on a response trajectory distribution. For $\lambda,\chi,\zeta\ge0$, define
$$
J_B(u)
=
C_B(u)
+
\lambda\mathbb E[L_B(X^u)]
+
\chi D_B(X^u,X^0)
+
\zeta V_{\mathrm{viol}}(u)
\tag{P.16d.16.1}
$$
where $C_B(u)$ is intervention cost, $L_B$ is target predictive loss after intervention, $D_B$ is surplus disruption from the unperturbed trajectory, and $V_{\mathrm{viol}}$ is the penalty for violating retained PU constraints.

**Theorem P.16d.16.2 (PCE Intervention Rule).** Among a finite set of admissible interventions, the PCE-selected intervention is a minimizer of $J_B$. A response-null intervention with positive cost is never selected unless it lowers another term in $J_B$.

*Proof.* The functional $J_B$ is a finite PCE ledger: cost plus expected predictive loss plus disruption and constraint penalties. A finite admissible set has a minimizer. If an intervention changes no retained response and lowers none of the loss, disruption, or violation terms, then it increases cost without benefit and is dominated by the null intervention. Corollary P.6.1a.4 removes it. ∎

---

### P.16d.17 Compression-Based Ontology Audit

**Definition P.16d.17.1 (Ontology Audit Gate).** A proposed entity, field, branch label, hidden variable, continuum refinement, interpretation, or auxiliary structure $E$ passes the ontology audit at budget $B$ exactly when at least one condition holds:

1. $E$ changes a finite protocol-response presheaf.
2. $E$ changes a retained update or verification map.
3. $E$ lowers a descended PPI/PCE cost.
4. $E$ supplies a required certificate object or overlap-commutativity map.
5. $E$ records a finite branch degeneracy rather than a hidden surplus.

Otherwise $E$ fails the audit.

**Theorem P.16d.17.2 (Ontology Audit Equals No-Response-Surplus).** The ontology audit gate is equivalent to Corollary P.6.1b.8 and Corollary P.6.1b.8b applied to the proposed entity $E$.

*Proof.* Corollary P.6.1b.8 retains a distinction exactly when it changes finite response or lowers an already-defined PPI cost. Corollary P.6.1b.8b additionally records separately certified finite branch degeneracy. The strict-certificate ledger retains certificate objects and overlap maps because they change status or certificate commutativity. Retained update and verification maps are part of the primitive-equivalence normal form in Definition P.6.1c.1. If none of the listed conditions holds, $E$ is response-null surplus and is removed. If one condition holds, $E$ is not surplus relative to the stated budget and ledger. ∎

---

### P.16d.18 Cross-Scale Certificate Mining

**Definition P.16d.18.1 (Cross-Scale Certificate Square).** Let $\mathcal G$ be a finite derivation graph whose nodes are PU invariants, response classes, or branch data, and whose edges are accepted derivations, bridge maps, PRG maps, or certificate maps. A cross-scale certificate square is a diagram
$$
\begin{matrix}
A & \xrightarrow{f} & B \\
\downarrow g & & \downarrow h \\
C & \xrightarrow{k} & D
\end{matrix}
\tag{P.16d.18.1}
$$
with all arrows defined in the finite response quotient. It commutes when
$$
h\circ f = k\circ g
$$
as maps of retained quotient classes.

**Theorem P.16d.18.2 (Certificate-Mining Soundness).** If every square in a finite cross-scale certificate cover commutes and every edge certificate has accepted status, then the invariant at the common target is cross-scale certified relative to that cover. If a square fails to commute, at least one edge, branch assumption, or target identification in the square must be weakened, rejected, or left certificate-pending.

*Proof.* If all squares commute, every path through the finite cover gives the same target class in the operational quotient. Accepted edge certificates authorize each path, so the target invariant is independent of the chosen certified derivation route relative to the cover. If a square fails, the two paths yield different quotient classes or different status outputs. They cannot both be accepted as the same target identification on that cover. Therefore at least one edge certificate, branch assumption, or identification must be downgraded or rejected until commutativity is restored. ∎

---

### P.16d.19 Predictive Failure Taxonomy

**Definition P.16d.19.1 (Finite Predictive Failure Modes).** Relative to the finite self-verifying operational presentation
$$
\mathfrak T=(\mathsf S,\mathsf P,\Omega,E,U,V)
$$
of Definition P.6.1c.1, a predictive failure is assigned to every retained component that fails:

| Failure mode | PU component that fails |
|:--|:--|
| context confusion | nonseparating or misreconstructed context quotient |
| paradox | role collapse, self-reference obstruction, or SPAP-forbidden closure |
| illusion | verification $V$ conflicts with expected response $E$ |
| frozen dogma | update map $U$ is suppressed despite verification error |
| fixation loop | self-model update remains trapped in a high-cost recurrent basin |
| misinformation | corrupted cross-perspective transfer or calibration kernel |
| scientific error | wrong finite response class selected |
| metaphysical excess | response-null surplus retained as ontology |
| overreach | status claimed above available certificate level |
| underfitting | retained model fails to produce $\Delta Q>0$ where a separating regularity is available |
| budget exhaustion | no finite-cost representative exists inside the retained budget for the claimed update or verification |

**Theorem P.16d.19.2 (Relative Exhaustiveness of the Taxonomy).** For a finite predictive system whose knowledge claim is represented by $\mathfrak T$, every failure of the claim to realize Definition 2 at budget $B$ appears in at least one row of Definition P.16d.19.1.

*Proof.* Definition 2 says knowledge is realized predictive capacity: the system must process information through an internal model to obtain positive predictive improvement. In the finite presentation, this requires a state/context representation $\mathsf S$, protocol response expectations $E$, update maps $U$, verification $V$, calibrated transfer across perspectives when relevant, correct quotient-class selection, and a valid status/cost ledger. If predictive improvement fails, either the context/state is not reconstructed, expected response is wrong, verification rejects the expectation, update fails to incorporate the verification, transfer corrupts the response, the wrong quotient class is selected, surplus is retained, status is overclaimed, the model lacks enough structure to produce $\Delta Q>0$, or no finite-cost representative exists inside the retained budget. These alternatives are the rows of the table, possibly with more than one row active. ∎

---

### P.16d.20 Knowledge Interface Area Law

**Definition P.16d.20.1 (Effective Knowledge Interface Capacity).** For two predictive systems $S_i,S_j$ connected by a finite communication or calibration interface $I_{ij}$ at budget $B$, define the alphabet capacity
$$
\operatorname{Cap}^{\mathrm{alph}}_B(I_{ij})
=
\sup_{P\in\mathsf P_B}
\ln |\Omega_{B,P}^{ij}|
\tag{P.16d.20.1}
$$
and, when probabilities are retained, define the distributional capacity
$$
\operatorname{Cap}^{\mathrm{dist}}_B(I_{ij})
=
\sup_{P\in\mathsf P_B} H(O_{ij}\mid P).
$$
Write $\operatorname{Cap}_B(I_{ij})$ for either registered capacity convention, with the distributional convention bounded above by the alphabet convention. For a cut $\partial A$ in a network, define
$$
\operatorname{Cap}_B(\partial A)=\sum_{(i,j)\in\partial A}\operatorname{Cap}_B(I_{ij}).
\tag{P.16d.20.2}
$$

**Theorem P.16d.20.2 (Interface-Capacity Upper Bound).** In one registered finite update step in which each cut edge contributes at most one retained interface outcome under the capacity convention counted by $\operatorname{Cap}_B$, the number of nats of new distinguishable response information transferred across a cut $\partial A$ is at most $\operatorname{Cap}_B(\partial A)$. Hence one-step knowledge growth across the cut is interface-bounded before it is storage-bounded.

*Proof.* Each interface outcome alphabet $\Omega_{B,P}^{ij}$ carries at most $\ln|\Omega_{B,P}^{ij}|$ nats of distinguishable finite response information, and at most its Shannon entropy when probabilities are retained. For multiple cut edges, the joint alphabet size is at most the product of the edge alphabet sizes, so the logarithmic alphabet capacity is at most the sum of edge capacities. In the distributional convention, Shannon subadditivity gives the same sum bound. For the registered one-step interface convention, with at most one retained outcome per cut edge in the step, no receiver can distinguish more response classes across the cut than the number of distinguishable interface messages delivered across that cut. Therefore transferred knowledge growth is bounded by $\operatorname{Cap}_B(\partial A)$. ∎

---

### P.16d.21 Consolidated Status and Conservative Closure

**Theorem P.16d.21.1 (Conservative Extension of the Operational Program Modules).** Sections P.16d.1–P.16d.20 are conservative over the existing PU theorem and certificate ledger. They add no new physical primitive, change no accepted numerical prediction, and do not promote any branch. They only name finite-response quotient constructions already licensed by PPI/PCE and specify the conditions under which those constructions become operationally effective.

*Proof.* Each section is a definition, theorem, or diagnostic stated in terms of finite response presheaves, PRG quotient maps, PPI/PCE costs, context-state response maps, SPAP/reflexivity bounds, calibration kernels, finite certificates, finite update and verification maps, or finite channel capacities. These are existing PU data or direct finite-response constructions from Section P.6.1b and Definition P.6.1c.1. The only selection rule used is Theorem P.16d.0.3, which is a module-level consequence of Theorem P.6.1b.8a, Corollary P.6.1b.8, and Corollary P.6.1b.8b. No module assigns a new numerical value, adds a branch assumption to an existing derivation, or closes a certificate gate. Therefore the extension is conservative. ∎

| Module | Formal locus | Status |
|:--|:--|:--|
| Predictive Renormalization Group | Definition P.16d.1.1, Theorem P.16d.1.2 | theorem-level quotient functor |
| Finite-Channel Covariance | Definition P.16d.2.1, Theorem P.16d.2.2 | theorem-level invariance principle |
| Anomaly-as-Paradox-Residue | Definition P.16d.3.1, Theorem P.16d.3.2 | theorem-level diagnostic |
| Operational Naturalness | Definition P.16d.4.1, Theorem P.16d.4.2 | theorem-level quotient criterion |
| Context-State Tomography | Definition P.16d.5.1, Theorem P.16d.5.2 | theorem-level identifiability criterion |
| Thermodynamic Privacy / Reflexive Opacity | Definition P.16d.6.1, Theorem P.16d.6.2 | theorem-level bound on Property-R branches |
| Perspective Curvature | Definition P.16d.7.1, Theorem P.16d.7.2 | theorem-level finite-holonomy criterion |
| Observer Calibration Theory | Definition P.16d.8.1, Theorem P.16d.8.2 | theorem-level response-alignment criterion |
| Horizon Tomography Beyond Gravity | Definition P.16d.9.1, Theorem P.16d.9.2 | theorem-level kernel criterion |
| PCE-Based Experiment Selection | Definition P.16d.10.1, Theorem P.16d.10.2 | theorem-level finite decision rule |
| Self-Reference Spectroscopy | Definition P.16d.11.1, Theorem P.16d.11.2 | theorem-level lower-bound diagnostic |
| Proof-Cost Physics | Definition P.16d.12.1, Theorem P.16d.12.2 | theorem-level representative selection |
| PCE Curriculum Theory | Definition P.16d.13.1, Theorem P.16d.13.2 | theorem-level finite-menu rule |
| Institutional Error-Correction Theory | Definition P.16d.14.1, Theorem P.16d.14.2 | theorem-level quotient preservation |
| PU-Compatible AI Alignment | Definition P.16d.15.1, Theorem P.16d.15.2 | theorem-level response-compatibility criterion |
| Causal Intervention Budgeting | Definition P.16d.16.1, Theorem P.16d.16.2 | theorem-level finite intervention rule |
| Compression-Based Ontology Audit | Definition P.16d.17.1, Theorem P.16d.17.2 | theorem-level no-surplus audit |
| Cross-Scale Certificate Mining | Definition P.16d.18.1, Theorem P.16d.18.2 | theorem-level certificate discipline |
| Predictive Failure Taxonomy | Definition P.16d.19.1, Theorem P.16d.19.2 | theorem-level finite-presentation taxonomy |
| Knowledge Interface Area Law | Definition P.16d.20.1, Theorem P.16d.20.2 | theorem-level finite-capacity bound |

## P.17 Conclusion

This appendix establishes a scoped epistemic-to-operational bridge. Foundational Certainty P.2.1 certifies an awareness/process; Appendix P.3.1 and Thesis P.3.5.1 characterize its knowledge-bearing activity by expected response, verification, and update. For every finite self-verifying operational presentation carrying those data, Theorem P.6.1c.3 constructs a predictive normal form canonical up to natural isomorphism, and Corollary P.6.1c.4 identifies prediction as the canonical operational primitive. Thus prediction is not an extra ontology on this declared class.

POP, PCE, and PPI are the framework's separately stated optimization, selection, and physical-instantiation principles. Physical conclusions follow from the canonical predictive foundation only after the relevant mathematical, operational, realization, and calibration hypotheses are registered.

PPI states a bridge requirement between an abstract operational structure and a declared finite physical realization. Its principal consumers have the following scope:

* **Quantum mechanics:** the Hilbert, Born-rule, and instrument conclusions require the finite noncontextual-frame, complex-carrier, continuity, composition, and measurement hypotheses stated in Appendices F, G, and M; a registered physical reset separately obeys $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$
* **Gauge theory:** the gauge and matter conclusions require the phase-closure, locality, derivative-order, finite-response block, representation, and anomaly branches of Appendix G
* **General relativity:** the Einstein equation requires the operational-continuum, local KMS/Clausius, area-density, Raychaudhuri, conserved-source, and normalization hypotheses stated in Appendices E, F, and the gravity chapters
* **Vacuum symmetry:** the Monster endpoint requires the independent rank-24 lattice, chiral-VOA, controller, standard-lift, and orbifold certificates of Sections P.13.1–P.13.20
* **Agency** (single-system, theorem-level) emerges as a trajectory-shaping effect of the cost potential $U_S$ induced by the prohibition set $\mathcal{L}^{\neg}_S$ — the structural complement of the SPAP-admissible region — without requiring any positive carrier substance; coupled-system **unauthored coordination** follows in bias form (Proposition P.16.2, Corollary P.16.1), with the stronger "no coordinator required" reading conditional on Hypothesis 14.5.8 (Section P.16)
* **Semantic perspective discipline** emerges as a conservative theorem-level package for role-indexed self-reference, perspective-indexed closure, semantic holonomy, cogito-radius geometry, predictive role-position identity, description-arity, and creative decompression on their named branches; it adds no physical primitive and changes no physical branch without an explicit response-presheaf, cost-functional, or certificate change (Section P.16b)
* **Generative non-closure** gives the conservative pre-axiomatic reading of the framework: total internal reflexive self-closure is impossible for SPAP-capable predictors, so nontrivial verified prediction proceeds through stable finite partial closures. The named axioms, bridge laws, verification cuts, typing guards, PCE quotients, and PPI instantiation rules are the local stabilizers of admissible response domains, not completed self-closure predicates (Appendix A.6; Section P.16c)
* **Operational program discipline** emerges as a conservative theorem-level package for predictive renormalization, finite-channel covariance, anomaly residue, operational naturalness, context-state tomography, reflexive opacity, perspective curvature, calibration, horizon tomography, experiment selection, self-reference spectroscopy, proof-cost accounting, curriculum sequencing, institutional error correction, AI alignment, intervention budgeting, ontology audit, certificate mining, predictive failure classification, and interface-capacity bounds; it adds no physical primitive and changes no physical branch without an explicit response-presheaf, cost-functional, or certificate change (Section P.16d)

The capstone is a conditional identification of the Monster group $\mathbb M$ as a candidate vacuum symmetry on the branch specified in Sections P.13.1–P.13.20. The structural values $\varepsilon_0=\ln2$, $a=2$, and $M=24$, together with the independent coding, fixed-normalization even-unimodular lattice, finite Gaussian-cost or registered Golay-to-Leech construction, chiral-VOA, controller, standard-lift, and orbifold certificates, lead to $\Lambda_{24}$, then $V^\natural$, and finally $\operatorname{Aut}(V^\natural)=\mathbb M$ by the Frenkel--Lepowsky--Meurman theorem. PCE compares candidates within this registered admissible class; it does not establish that every optimal predictive realization has Monster symmetry. The construction supplies a conditional physical interpretation of the established Monstrous Moonshine structures.

The SPAP-associated operation order, registered-reset entropy ledger, and predictor-target identification are distinct data that may coexist on a certified protocol but are not mutually reconstructible. Vacuum symmetry is a further downstream output on the independent Leech/Moonshine branch, not a fourth equivalent datum.

The proposed resolution of Wigner's puzzle (Section P.7) is that mathematics and physics instantiate the same branch-indexed PCE variational grammar under different admissible contracts. On the vacuum-symmetry branch, the independent admissibility, modular, controller, lattice, and orbifold certificates lead conditionally to the Monster endpoint; PCE alone does not entail those certificates.
