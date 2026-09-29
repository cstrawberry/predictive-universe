/*
 * Scene catalogue.
 *
 * Ordering follows the paper. Each entry carries:
 *   key       registry key of the drawing code
 *   group     heading used in the scene index
 *   label     short name in the index
 *   title     stage title
 *   summary   one line under the title in the explanation drawer
 *   source    where the idea is developed in docs/paper/
 *   copy      plain-language explanation
 *   technical the same idea in the paper's own terms
 */
(function (PU) {
  'use strict';

  PU.catalogue = [
    {
      key: 'cogito',
      group: 'Foundations',
      label: 'Cogito',
      title: 'Cogito',
      summary: 'Certainty to backbone',
      color: '#FBBF24',
      rgb: '251,191,36',
      source: 'Sections 1-2, 5',
      copy: 'Cogito is the certainty that awareness is occurring. The framework takes this as its starting point and models adaptive learning as a cycle of prediction, comparison, and update.\n\nThe register construction keeps the current state and forecast readable while a control bit advances the cycle. Its full set of binary configurations leads to K0=3. Further conditions on distinguishability, cost, and geometric realization connect this construction to an eight-dimensional carrier, twenty-four interface modes, and a four-dimensional response space.',
      technical: 'Theorem 15 assumes injective stepping before reset, explicit two-phase control, nondestructive retention of state and forecast, and full-context closure. Within this class, the minimum of eight visited configurations gives K0=3. A perfectly distinguishable Hilbert encoding gives d0>=8.\n\nPCE selects d0=8 when an admissible eight-dimensional representative preserves the same finite responses and every higher-dimensional representative costs more. The minimal active-kernel and QFI conditions give M=24. A faithful tangent shell with strict surplus-dimension cost selects D_car=4; Lorentzian spacetime requires the continuum and causal certificates.'
    },
    {
      key: 'becoming',
      group: 'Foundations',
      label: 'Space of Becoming',
      title: 'Space of Becoming',
      summary: 'Expected performance between alpha and beta',
      color: '#FF5A36',
      rgb: '255,90,54',
      source: 'Section 3',
      copy: 'The Space of Becoming is a range of expected predictive performance for a chosen task, scoring rule, and evaluation window. Alpha marks the random-forecast baseline. Operational viability requires performance above alpha and below a specified upper endpoint, beta.\n\nThe model must establish that its attainable performance stays below beta. On the exponential response-law branch, the required complexity grows without bound as performance approaches that endpoint. Relating beta to a self-prediction limit requires a comparison using the same system, task, score, and window.',
      technical: 'Definition 8 registers the interval alpha<PP_W<beta for a fixed task distribution, proper score, and evaluation window. Strict expected super-chance performance gives PP_W>alpha. The pathwise excitation certificate supplies its own ceiling beta_0.\n\nOn the joint excitation and exact response-law branch, alpha<beta<=beta_0, and Theorem 19 gives a logarithmic complexity divergence as PP_W approaches beta. Theorem 19e realizes the response law on a binary noisy-copy task: alpha=1/2, and beta=1-eta is the Bayes accuracy of the task, fixed by the task law alone. Comparing beta with alpha_SPAP requires a bridge identifying the same system, task, score, and window.'
    },
    {
      key: 'ledger',
      group: 'Foundations',
      label: 'PPI / PCE Ledger',
      title: 'PPI / PCE Ledger',
      summary: 'Records, quotient, and certificate gates',
      color: '#FF3B4F',
      rgb: '255,59,79',
      source: 'Sections 2, 6',
      copy: 'The Principle of Physical Instantiation (PPI) says abstract requirements count physically through finite records, checks, maintenance, and update-use. The Principle of Compression Efficiency (PCE) selects lower-cost representatives with the same usable response.\n\nThe ledger separates naming from status. Claims advance through finite records, quotienting of surplus distinctions, certificates, and overlap checks before receiving stronger branch status.',
      technical: 'The Principle of Physical Instantiation (PPI) admits only finite records, finite verification, finite maintenance, and finite update-use. The Principle of Compression Efficiency (PCE) ranks admissible representatives by predictive benefit against cost.\n\nResponse-null distinctions are quotiented away before selection. Strong branch status requires certificate entries, retained maps, and overlap checks to commute inside the finite-response ledger.'
    },

    {
      key: 'spap',
      group: 'Self-reference',
      label: 'SPAP',
      title: 'SPAP Boundary',
      summary: 'A binary limit from self-reference',
      color: '#22D3EE',
      rgb: '34,211,238',
      source: 'Section 4, Appendix A',
      copy: 'The Self-Referential Paradox of Accurate Prediction (SPAP) names the limit faced by a system predicting its own future response. Once the forecast becomes part of the system, an allowed response can change the very outcome being forecast.\n\nThe stable binary completion assigns equal weight to the two opposite responses. A physical device may also store and reset a prediction record. That reset has its own resource ledger, determined by the implemented process and the distribution of recorded inputs.',
      technical: 'SPAP is the diagonal obstruction for a retained evaluator with the stated predicate-realization closure. On the binary completion branch, invariance under logical negation gives q(0)=q(1)=1/2.\n\nCorollary 2c gives a concrete reachability example on the Pure S selected trajectory: a fixed finite detector checks each present term, while deciding whether it ever accepts is undecidable. Every fixed finite horizon is decidable. Positive prediction-error floors additionally require the scoring and task-distribution hypotheses.\n\nThe registered binary alphabet has structural log-cardinality epsilon0=ln2. A physical Landauer ledger begins only when a reachable prediction register is returned to a prescribed ready state with its retained side information and input law specified.'
    },
    {
      key: 'entropy',
      group: 'Self-reference',
      label: 'Reset Ledger',
      title: 'Conditional Reset Ledger',
      summary: 'A registered binary reset maps four input pairs to two retained outputs',
      color: '#FB7185',
      rgb: '251,113,133',
      source: 'Sections 7.5-7.6; Appendices E, J',
      copy: "Landauer's principle applies to the specified physical reset of a memory to a standard ready state. In the displayed architecture, four reachable state-and-prediction pairs become two retained state outputs after the prediction register is reset.\n\nThe heat bound depends on the input distribution and everything retained through the reset. If flipping the erased bit leaves its joint distribution with all retained records unchanged, the bit is conditionally uniform and the stated reset assumptions give at least kBT ln2 of heat. That floor is approached but not reached: gradual exchanges with a thermal bath bring the heat arbitrarily close to kBT ln2, while every exact reset of the bit dissipates strictly more, and a bath with finitely many states cannot reset it exactly.",
      technical: 'On the prescribed-ready binary-ancilla branch, the cycle map is noninjective when all four input pairs are reachable, giving a two-to-one support reduction.\n\nFor the cyclic isothermal degenerate-register reset of Theorem J.1, Q_bath/(kBT)=H_q(P|R)+epsilon_diss, with epsilon_diss>=0. The invariant-record corollary derives H_q(P|R)=ln2 when the joint law is invariant under flipping P and every record in the complete retained ledger R is unchanged. Theorem E.1b shows that an exact reset with H_q(P|R)>0 has epsilon_diss>0 and cannot be realized with finite-dimensional bath and auxiliary resources, while approximate resets with vanishing output error bring the heat to kBT H_q(P|R) in the limit. Theorem 7.6r populates a thermal exchange-invariant source with H_q(P|R)=ln2 and a swap-return family with 0<epsilon_diss<=e^(1/n)/(2n), and Corollary 7.6r.1 attains the limit for every binary record law.\n\nTheorem 7.6k classifies return maps by whether the displaced distinction is already known, retained, exported, cyclically erased, or removed without a complete certificate. The cyclic-erasure branch supplies the heat ledger. Structural log-cardinality, conditional entropy, bath heat, and total entropy production keep their separate meanings.'
    },

    {
      key: 'mpu',
      group: 'Substrate',
      label: 'MPU',
      title: 'Minimal Predictive Unit',
      summary: 'The eight-state register and its 24 interface modes',
      color: '#60A5FA',
      rgb: '96,165,250',
      source: 'Sections 5, 7; Appendix Z',
      copy: 'A Minimal Predictive Unit (MPU) is a least-complex physical realization of a qualifying prediction task. The register model shown here keeps the current state and stored forecast readable while a binary control advances the cycle.\n\nWhen all combinations of the three binary registers are reachable, the model has eight configurations. An eight-dimensional quantum carrier can represent them as distinguishable states. The stationary minimal branch has twenty-four active interface modes. Prepared states away from that stationary spectrum can have additional response-active directions.\n\nOne concrete realization uses four spin-one-half particles: three carry the registers, a fixed coupling performs the prediction step in a set time, and a fourth surplus spin precesses without affecting any retained response. For two entangled units with the stated measurement settings, measurement independence and no-signaling at the level of hidden variables exclude every deterministic hidden-seed account of their joint outcomes.',
      technical: 'Theorem 15 assumes injective stepping before reset, explicit two-phase control, nondestructive retention, and full-context closure. These conditions give N_vis_min=8 and K0=3. Perfectly distinguishable Hilbert encoding then requires d0>=8.\n\nPCE selects d0=8 when an admissible C^8 representative preserves every registered finite response and all higher-dimensional representatives have strictly greater total cost. At the flat active spectrum I_2/2 plus six zero eigenvalues, a=2 and b=6 give M=2ab=24 nonzero-QFI interface directions. Appendix Z distinguishes this stationary count from nonequilibrium generator support.\n\nTheorems 7.6a and 7.6g classify finite representations as C^8 tensor K and specify the dynamics that preserve the retained eight-dimensional response algebra. Theorem 7.6o realizes this branch with three spin-1/2 registers and a surplus spin: static local fields and a Z_M X_P coupling generate the Internal Prediction CNOT in time t_*, attaining the orthogonalization bound, while the surplus spin precesses without changing any retained response. Theorem 7.6h also gives deterministic hidden-seed refinements with exactly the same finite retained histories as stochastic update laws. An intrinsic-stochasticity claim requires an additional condition. Theorem 7.6p supplies one for a two-MPU Evolve law with CHSH value 2sqrt2: under exogeneity (E1) and seed-level no-signaling (E2), no seed refinement predicts either outcome with probability above (3-sqrt2)/2, so every deterministic refinement is excluded, and each premise is necessary.'
    },
    {
      key: 'network',
      group: 'Substrate',
      label: 'MPU Network',
      title: 'MPU Network',
      summary: 'Predictive substrate graph',
      color: '#38BDF8',
      rgb: '56,189,248',
      source: 'Section 7, Appendix C',
      copy: 'Minimal Predictive Units (MPUs) are proposed as the smallest physical carriers of a prediction cycle. Each unit stores a current state, forms a forecast, compares with outcome, and updates through finite resources.\n\nA network of MPUs exchanges information through channels with delay, energy cost, and possible loss. Stable coordination among many units supplies the substrate from which geometry, fields, and larger observers are later described.',
      technical: 'The Principle of Physical Instantiation (PPI) admits content through finite records, finite response, finite maintenance, and finite update-use. A Minimal Predictive Unit (MPU) is the least carrier sustaining that loop under the Principle of Compression Efficiency (PCE).\n\nChannel weights combine propagation delay, fidelity loss, update cost, and irreversible entropy cost. Stable MPU aggregates form the finite substrate used by later geometry, gauge, quantum, and observer branches.'
    },
    {
      key: 'pcegeo',
      group: 'Substrate',
      label: 'PCE Geometry',
      title: 'PCE Geometry',
      summary: 'Proto-structure relaxes to regularity',
      color: '#A78BFA',
      rgb: '167,139,250',
      source: 'Appendix C',
      copy: 'Principle of Compression Efficiency (PCE) Geometry compares network arrangements using their predictive responses and resource costs. Under the stated communication and viability conditions, sufficiently severe irregularity exceeds the available budget. Among arrangements with the same response, PCE favors the lower-cost representative.\n\nA separate census covers every symmetric four-dimensional shell. Over all shells, the latest-appearing directional anisotropy, at order twelve, belongs to shells with the symmetry of the 600-cell. Among shells whose points span a lattice, the highest order is six, and the D4 shell with 24 points is the smallest shell reaching it. A cost that favors later-appearing anisotropy and then fewer points therefore selects D4 among lattice shells. A lattice network with fixed link costs has a faceted, non-round large-scale distance, so extending local order to a smooth large-scale geometry requires the continuum conditions.',
      technical: 'Appendix C gives conditional irregularity penalties using fixed communication tasks, curvature-response maps, and resource bounds. The displayed relaxation compares response-equivalent candidates under their declared cost.\n\nPropositions C.6i-C.6j compare a registered class of four-dimensional shells. The D4 shell has anisotropy floor six; the competing classes have floor at most four. A cost strictly decreasing with that floor selects D4 and its 24 vertices within this class.\n\nTheorem C.6k classifies every admissible shell by its reflection group, with floors 3, 4, 4, 6, and 12 for types A4, B4, D4, F4, and H4. Over all shells the maximum floor is 12, attained by H4 shells such as the 120-vertex 600-cell, so no cost strictly decreasing in the floor alone has D4 as minimizer. On crystallographic shells the maximum floor is 6, attained exactly by F4 shells, and the least such cardinality is 24, attained exactly by the D4 shell; the 96 vectors of squared norm 6 in the D4 lattice tie at floor 6. A cost strictly decreasing in the floor and, at equal floor, strictly increasing in cardinality therefore has the unique minimizer D4, with M=24. A physical PCE functional realizes this comparison when its coefficient and defect map certify the ordering.\n\nThe continuum bridge separately requires noncollapse, curvature transfer, Mosco convergence, and rigidity. Theorem C.6c.1 shows that every Bravais propagation-cost network with fixed edge costs, including uniform D4 root edges, converges to a polytope-normed space with non-Euclidean tangent cones and non-quadratic Cheeger energy, so a smooth limit requires costs outside that class. Local shell symmetry supplies only part of that construction.'
    },

    {
      key: 'quantum',
      group: 'Quantum branch',
      label: 'Quantum State',
      title: 'Quantum State',
      summary: 'Pure states, phase, and outcome probabilities',
      color: '#00E5FF',
      rgb: '0,229,255',
      source: 'Section 8',
      copy: 'The Bloch sphere displays pure states of the active two-level sector. The moving point represents one pure state; its direction sets the probabilities for a chosen measurement. Mixed states occupy the interior of the Bloch ball.\n\nComplex amplitudes describe a pure state through magnitude and relative phase. Under the Born-rule conditions, their squared magnitudes give outcome probabilities in the chosen measurement basis.',
      technical: 'The active kernel is C^2. Its normalized pure-state rays form the Bloch sphere, while general density operators fill the Bloch ball. The moving point represents a pure-state ray.\n\nOn the certified Born branch, an effect E has probability tr(rho E). For rho=|psi><psi| and a rank-one projective measurement, this reduces to the squared amplitude in that measurement basis. The probability assignment uses the retained-response, additivity, and Born-domain certificates.'
    },
    {
      key: 'spinor',
      group: 'Quantum branch',
      label: 'Spinor',
      title: 'Spinor Double Cover',
      summary: '4 pi return structure',
      color: '#C084FC',
      rgb: '192,132,252',
      source: 'Section 8, Appendix G',
      copy: 'A spinor is a quantum state structure that changes sign after one full turn and returns after two full turns. This 4 pi return behavior is central to two-component quantum states.\n\nWithin the framework, spinor structure belongs to the active two-complex-dimensional C^2 branch with special unitary group SU(2), the symmetry group for two-component states.',
      technical: 'The spinor branch uses the two-complex-dimensional active kernel and special unitary group SU(2), the symmetry of two-component quantum states. A 2 pi rotation acts as -I, so the amplitude changes sign while its physical ray remains the same; a 4 pi rotation restores the amplitude.\n\nThe two visible markers show the two lift sheets over one spatial orientation. The SU(2) double-cover sign and the SPAP diagonal operation are mathematically separate structures.'
    },
    {
      key: 'golay',
      group: 'Quantum branch',
      label: 'Golay Code',
      title: 'Golay Code',
      summary: 'Signal and parity structure',
      color: '#2DD4BF',
      rgb: '45,212,191',
      source: 'Sections 7.6, 13.9; Appendix Z',
      copy: 'The extended binary Golay code has twenty-four binary coordinates, twelve information dimensions, and minimum Hamming distance eight. One systematic presentation places twelve blue information coordinates above twelve purple parity coordinates generated through the displayed matrix.\n\nThe paper constructs an encoder, a syndrome measurement, and a correction rule that recover up to three bit flips. Its finite quantum model preserves encoded superpositions under that error family. The paper places the whole construction on twelve MPU carriers: an 88-gate encoder, a 100-gate syndrome circuit, a retained failure flag, preparation and reset of the check qubits, and a per-round account of gates, reset heat, and error probabilities. Using this model as physical memory still requires a test on a real substrate with measured noise.',
      technical: 'The [24,12,8] code uses a chosen systematic generator G=[I|P]. The displayed links depend on this basis. The predictive-recovery self-dual-rate gate supplies k=12 on its stated branch.\n\nTheorems 7.6d and 7.6j give an exact radius-three decoder and a projective syndrome instrument with conditional bit-flip recovery. Their complete recorded map is CPTP; syndromes with no radius-three representative receive a failure flag. The recovery theorem covers the specified bit-flip family. Theorem 7.6s populates the remaining fields on twelve MPU carriers: data coordinates on Q_M, parity on Q_I, and syndrome bits on Q_P; an 88-CNOT encoder and a 100-CNOT syndrome circuit; a retained failure flag on the 1771 weight-four syndromes; preparation and flag-conditioned reset through Corollary 7.6r.1; and a resource certificate with exact success, flag, and miscorrection probabilities and the zero-excess limit of the syndrome-reset heat. The held-out substrate test with measured noise is ET-MPU-06.\n\nThe separate perfect-code route in Section Z.13.1 starts with the punctured [23,12,7] code and adds a parity coordinate. Perfectness belongs to that 23-coordinate code; the displayed 24-coordinate extension has a different packing property.'
    },

    {
      key: 'dim',
      group: 'Structure selection',
      label: 'D = 4 Gate',
      title: 'Dimensional Gate',
      summary: 'Twenty-four faithful shell cells require a four-dimensional carrier',
      color: '#F472B6',
      rgb: '244,114,182',
      source: 'Appendix Z',
      copy: 'The Dimensional Gate asks for enough distinct geometric cells to carry all twenty-four interface modes of the minimal branch. The kissing number K(D) gives the maximum number of equal-radius contact cells available in D dimensions.\n\nA faithful shell requires 24 <= K(D). Three dimensions provide only twelve contacts, while the regular 24-cell realizes all twenty-four in four dimensions. A cost for unused dimensions then selects four as the least feasible carrier dimension. Placing the modes on the 24-cell keeps every mode at the same response weight, but the assignment itself is a registered marking, because no symmetry-respecting assignment exists in fewer than twenty-four dimensions.',
      technical: 'The registered mode-to-cell map requires M=24 <= K(D). The exact value K(3)=12 excludes D<=3, and the regular 24-cell supplies a response-labeled feasibility witness in R^4. Strict surplus-dimension cost selects the least feasible value D_car=4. Proposition Z.10b shows that for every D<24 each stabilizer-equivariant real-linear map of the 24-dimensional tangent space into a D-dimensional orthogonal representation is zero. The four-dimensional injection therefore keeps the per-mode QFI and equal cell radii, while its pairwise kernel is registered symmetry-breaking data, such as the marked syndrome-to-frame map.\n\nThe result is a four-dimensional Euclidean response carrier. Its promotion to observed 3+1 spacetime uses the separate operational-continuum, principal-symbol, time-orientation, causal-cone, and metric-reconstruction certificates.'
    },
    {
      key: 'gauge',
      group: 'Structure selection',
      label: 'Gauge Sectors',
      title: 'Gauge Sectors',
      summary: 'SU(3), SU(2), and U(1)',
      color: '#FACC15',
      rgb: '250,204,21',
      source: 'Appendix G',
      copy: 'Gauge sectors organize internal symmetry actions. On the block-frame branch, the eight-dimensional carrier divides into an active two-state sector and inactive blocks of dimensions three, two, and one.\n\nThe inactive blocks support the selected su(3), su(2), and u(1) algebra. The abelian generator acts through relative block phases. The embedding and matter construction identify these actions with color, weak interactions, and hypercharge. Electromagnetic charge follows from the weak and hypercharge generators after electroweak breaking.',
      technical: 'The finite-response block frame splits d0=8 into active C^2 and inactive C^3, C^2, and C^1. Within the determinant-compatible full-block family, capacity saturation with an injective isotropic gauge response selects su(3)+su(2)+u(1), with 8+3+1 generators.\n\nAfter quotienting the common phase, this capacity-saturating branch retains one abelian direction from the relative block phases. The capacity bound alone is an upper bound on the number of generators. A determinant-character certificate fixes its embedding and global group; the chirality and anomaly-descent ledger identifies hypercharge. The charge lattice, Higgs vacuum, masses, and mixing require their further certificates.'
    },
    {
      key: 'particles',
      group: 'Structure selection',
      label: 'Particle Defects',
      title: 'Particle Defects',
      summary: 'Conditional sector-labelled defects in a coded background',
      color: '#4ADE80',
      rgb: '74,222,128',
      source: 'Appendices R, T, Z',
      copy: 'This scene shows the proposed defect route to particle-like excitations. A coded record supplies finite labels, and the gauge blocks supply color, weak, and hypercharge sector labels.\n\nA physical defect also needs a configuration space, dynamics, locality, a vacuum constraint, and a response-preserving map from the finite record. With those entries in place, localized classes can be tested for quark-like, lepton-like, or gauge-boson-like behavior.',
      technical: 'A realized particle-defect branch fixes an operator algebra or configuration space, local dynamics, a vacuum-constraint family, a superselection criterion, and a response-preserving map from a marked syndrome record. The resulting localized nonzero quotient classes can carry sector labels.\n\nThe gauge skeleton alone leaves the matter package, exact spectrum, masses, mixing angles, running couplings, and confinement realization to their branch and calibration certificates.'
    },

    {
      key: 'relativity',
      group: 'Spacetime',
      label: 'Relativity',
      title: 'Relativity',
      summary: 'A propagation bound and the causal-cone construction',
      color: '#93C5FD',
      rgb: '147,197,253',
      source: 'Section 11',
      copy: 'Influence travels through successive updates in the MPU network. If each update takes at least a fixed positive time and edge lengths remain uniformly bounded, propagation has a finite speed upper bound.\n\nThe light cone shown here also assumes that the network reaches a common propagation frontier. The continuum and causal conditions turn that frontier into the cone that constrains signal paths and the histories of physical systems. On a regular lattice whose links repeat the same fixed costs, the frontier is faceted rather than round, so a round cone needs a richer cost structure. When all fields share one quadratic cone, requiring a well-posed evolution from data at one time leaves only the Lorentzian signature.',
      technical: 'Theorem 46 assumes serialized edge-by-edge propagation, an update-time lower bound tau_min>0, and uniformly bounded positive weights w_xy<=w_max. It gives the operational speed bound c_*=delta w_max/tau_min.\n\nAn attained frontier is an additional input. Proposition 43.5e shows that level-independent translation-invariant weights on the D4 lattice converge to a polytope norm, max(|v|_inf, |v|_1/2) for uniform weights, and not to a Euclidean metric; a D4 continuum therefore requires propagation costs outside that class. Corollary 46a combines the frontier with the spatial continuum limit, time coordinate, second-order principal symbol, and cone-coincidence and signature conditions to obtain Lorentzian kinematics. Theorem 46a.4 shows that when all retained sectors share the characteristic set of one nondegenerate quadratic form in dimension at least three, one-time well-posedness excludes the elliptic and ultrahyperbolic alternatives and forces a Lorentzian symbol cq^m, and strict hyperbolicity selects m=1. Normalized uniform weights and one-link saturation give c=delta/tau_min.'
    },
    {
      key: 'gravity',
      group: 'Spacetime',
      label: 'Emergent Gravity',
      title: 'Emergent Gravity',
      summary: 'Curved prediction-cost geometry',
      color: '#F97316',
      rgb: '249,115,22',
      source: 'Section 12',
      copy: 'Emergent gravity treats mass-energy as concentrated predictive maintenance and update cost. When many finite channels coordinate, uneven cost changes the effective metric that governs distance, time, and transport.\n\nLarge-scale motion follows that effective geometry. Curvature records how predictive frame transport, horizon thermodynamics, and network stress organize into Einstein-style gravitational behavior on the certified branch. The entropy record used in that step needs an entropy step that shrinks with the horizon patch: counting whole channels of fixed capacity fixes the area coefficient, but on its own it would force the local energy flow to vanish.',
      technical: 'Stress-energy is read as predictive update and maintenance cost projected into an effective metric. The metric records how distances, times, and transport behave after coarse-graining the finite network.\n\nUnder the operational-continuum, local KMS/Clausius, horizon-entropy, and metric-action hypotheses, the framework recovers Einstein’s equation as a thermodynamic finite-response closure without postulating a microscopic graviton sector.\n\nProposition 49b separates two roles of the horizon entropy record. A fixed-quantum channel-count or min-cut ledger fixes the area coefficient, while no quantized ledger meets the differentiable first-variation hypothesis. On shrinking local horizons, a fixed quantum satisfying the local Clausius relation forces R_ab k^a k^b=T_ab k^a k^b=0; at nonzero null flux the quantum must be at most of order A h^2, and quanta with q/(A h^2)->0 suffice.'
    },
    {
      key: 'horizon',
      group: 'Spacetime',
      label: 'Predictive Horizon',
      title: 'Predictive Horizon',
      summary: 'Area-counting MPU horizon',
      color: '#818CF8',
      rgb: '129,140,248',
      source: 'Section 12; Appendix E',
      copy: 'A predictive horizon bounds the records accessible to an observer with a given protocol and resource budget. Crossing the boundary changes which records that observer can store, check, and recover.\n\nThe boundary channels limit how much classical information can be reliably communicated per common use of the boundary. Their combined capacity gives an area bound under the stated channel conditions. Reaching that bound and identifying the resulting entropy rate with thermodynamic horizon entropy require the capacity, saturation, and thermodynamic conditions.',
      technical: 'Appendix E bounds the asymptotically reliable classical information rate per common boundary use by an area term on its registered density and unassisted memoryless-channel branch. Combining the crossing channels requires the accepted aggregate-channel converse or a certified additivity budget. Equality requires capacity attainment, entropy saturation, and the corresponding additive ledger. Identifying this entropy with thermodynamic horizon entropy and its coefficient with measured Newton G uses the corresponding bridges. The density branch of Theorem E.3 admits a network and surface only when the geometric link density does not exceed the reference maximum 1/delta^2. Channel counts change in fixed quanta; by Proposition 49b such a ledger fixes the area coefficient, while the local gravitational first variation needs entropy quanta that shrink with the horizon patch.\n\nA physical reset has its own ledger: Q_bath/(kBT)=H_q(P|R)+epsilon_diss. Its heat depends on the actual input law and retained side information; total entropy production is kB epsilon_diss.'
    },
    {
      key: 'blackhole',
      group: 'Spacetime',
      label: 'Black Hole',
      title: 'Perspectival Channel',
      summary: 'Black-hole information channel',
      color: '#E879F9',
      rgb: '232,121,249',
      source: 'Appendix K',
      copy: 'The black-hole information channel connects retained information with the records accessible to an exterior observer. On the isometric evolution branch, the combined black-hole and radiation system preserves distinctions between retained responses. Exterior access is governed by the specified horizon channel and recovery protocol.\n\nRecovering information from radiation requires the channel, clock, and decoding conditions. When the radiation state has the second moments of a random state and each registered step at least doubles the radiation dimension, the average radiation entropy stays within ln 2 of the Page value, rises, turns over at the Page time, and falls. A sharp entropy estimate with certified error additionally requires an entropy-continuity certificate, and physical Page-curve claims depend on the scrambling, edge-mode, and recoverability certificates.',
      technical: 'Theorem K.3.3a assumes an isometric global update of the retained black-hole-plus-radiation Hilbert space, unitary when its total dimension stays fixed. The induced transport is injective, preserving distinct retained response operators.\n\nExterior recovery uses a specified channel, protocol class, capacity, clock, and decoding bound. Corollary K.3.1b turns a mean-purity bound into a band for the mean radiation entropy that contains the Page value, with width below ln2+ln(1+d_< eta_t). On a fixed-carrier ledger whose radiation dimension at least doubles at each registered time, Corollary K.3.1c gives, for exact second moments, a strict rise, a turnover at the Page time, and a strict fall. By Corollary K.3d.6, the von Neumann Page-entropy estimate with certified error requires the continuity promotion certificate C_PageTV; a bare t_des=2 design certificate gives the Page-purity law. Half-entropy and zero-endpoint claims use the separate coarse-conservation and final-state gates, and physical Page-curve conclusions require the accepted scrambling, edge-mode, and recovery records on that same branch.'
    },

    {
      key: 'predictors',
      group: 'Observers',
      label: 'Prediction Relativity',
      title: 'Prediction Relativity',
      summary: 'Kinematic and predictive costs share a frame-consistent work ledger',
      color: '#22D3EE',
      rgb: '34,211,238',
      source: 'Appendix N',
      copy: 'Prediction Relativity places motion and predictive operation in one work account while keeping their contributions separately measurable. The warm side represents the kinetic work of acceleration. The blue side represents operation, refresh, and implementation costs for a registered predictive process.\n\nBoth costs rise near their declared limits. The combined ledger lets a finite system compare trajectory work with predictive resources using one frame and one set of units.',
      technical: 'Theorem N.UCT assumes a payload initially at rest in the laboratory, unchanged endpoint invariant mass and internal stored energy, no unregistered recoverable field energy, isotropic comoving export, and disjoint kinetic and predictive-loss ledgers. Then W_tot^lab is at least m0 c^2(gamma_f-1) plus the proper-time integral of gamma R_com.\n\nPredictive divergence requires the task-specific SPAP reduction certificate. Acceleration-dependent refresh costs use the detector-response, active-refresh, temperature, and implementation conditions.'
    },
    {
      key: 'perspectival',
      group: 'Observers',
      label: 'Perspectival Info',
      title: 'Perspectival Information',
      summary: 'Self-model cost boundary',
      color: '#84CC16',
      rgb: '132,204,22',
      source: 'Appendix M',
      copy: "Perspectival information is evaluated relative to a receiver with an operational self-model. A pattern can change the receiver's external model, its self-model, or both. The amount of self-model engagement and the required self-predictive accuracy are recorded separately.\n\nSpecified diagonal challenges can reach the Self-Referential Paradox of Accurate Prediction boundary. On branches carrying the required register geometry and implementation certificates, their integration cost grows at least as fast as the square of their proximity to that boundary. Passing a conclusion to another observer also requires a record-sharing channel and an uncertainty budget for the resulting inference.",
      technical: "Appendix M records a receiver-pattern profile with predictive relevance, SPAP proximity, and reflexivity fraction. These coordinates apply to systems with Effective Operational Property R, an identifiable Fisher stratum, and the registered self/external tangent split.\n\nDivergent proximity is established for the independent-register diagonal construction and for patterns carrying its physical implementation certificate. Other self-model changes can remain finite, including changes with nonzero reflexivity fraction. On certified proximity ladders, Theorem M.10.3b bounds the integration cost below by (3c_s/128) mu^2 ln(mu/4), and the asymptotic cost exponents admitted by the certificate data are exactly [2, infinity].\n\nSection M.6.4a composes certified tolerance maps along unary inference paths. Each cross-perspective import carries its record-sharing or perspective-invariance certificate. Acceptance depends on the composed uncertainty staying within the declared budget; inferences with several premises require a bound covering every premise."
    },
    {
      key: 'consciousness',
      group: 'Observers',
      label: 'Consciousness Com.',
      title: 'Consciousness Complexity',
      summary: 'Aggregate predictive integration',
      color: '#C084FC',
      rgb: '192,132,252',
      source: 'Sections 9-10, 13; Appendix L',
      copy: 'Consciousness Complexity (CC) measures a proposed ability of organized predictive aggregates to change update probabilities. The declared bounded-bias branch keeps the maximum permitted bias below 0.5, excluding free choice between both deterministic binary outcomes. The proposed 3/8 saturation additionally assumes a physical map from interface size to response and a restriction to active rank two.\n\nA local quantum implementation preserves a distant observer’s unconditional outcome distribution. The separate QCP hypothesis proposes a change in that distribution before a light signal can arrive. Testing it requires late independent context choices, timing and artifact controls, and replication.',
      technical: 'CC is the operational norm of the probability-modification map. Theorem 39 assumes alpha_CC,max=sup_S CC(S)<0.5 and excludes two contexts that force opposite deterministic outcomes of one binary measurement. One endpoint can still be reached from a sufficiently biased baseline. Exact no-signaling separately requires the full remote marginal to be invariant.\n\nThe interface-fraction hypothesis identifies the asymptotic response with 2a(8-a)/64. Restricting the admitted active ranks to a=2 gives 3/8; admitting a=4 reaches 1/2. The physical response map, complete rank class, and scaling law are independently tested assumptions.\n\nPostulate 3 separates local CPTP updates, shared-past preparation, and a proposed nonlocal context law. Local CPTP updates preserve Bob’s unconditional marginal. A certified and replicated pre-lightcone marginal shift under late randomization would establish a noisy statistical-FTL channel on the third branch and falsify the local no-signaling description for that implementation. Protocol 3 supplies the timing, attribution, sensitivity, and artifact requirements.'
    },

    {
      key: 'dark',
      group: 'Cosmology',
      label: 'Dark Sector',
      title: 'Dark Sector',
      summary: 'Scale-dependent gravity view',
      color: '#6366F1',
      rgb: '99,102,241',
      source: 'Appendix I',
      copy: 'The dark-sector proposal describes a gravitational response around visible matter that changes with scale. On the static spatial-clock branch, an exterior Keplerian field and the specified relaxation clock fix a cubic transition profile. With the same acceleration normalization, the transition length grows as the square root of the system’s baryonic mass. Inside the visible matter the profile departs from the cubic form, which holds exactly where no baryons remain.\n\nA static field equation realizes this response for every amplitude up to about 13.4, including the candidate amplitudes 1, 3, and 7, and the response is necessarily nonlinear in the visible mass. The amplitude still has to be selected and tested. In the linear covariant class, rotation data do not fix lensing, and no linear member reproduces the mass-dependent transition length, so galaxy rotation, cluster dynamics, and lensing test a nonlinear covariant completion and its uncertainty budgets. The halo pictures this conditional effective response.',
      technical: 'On the acceleration-lock and spatial-clock branch of Definition I.13c.1, g_Lambda=c^2 sqrt(Lambda)/8 and the registered exact power clock is sigma_loc=s_loc^(3/2). For an exterior Keplerian baryonic field, Proposition I.13c.2 gives m=3 and L0=sqrt(G M_b/(beta_chi g_Lambda)), with baryonic mass M_b and positive rate modulus beta_chi. Theorem I.13c.4 shows that the clock has the fixed form (R/L0)^m on an interval exactly for enclosed-mass profiles M_b proportional to R^alpha with 0<=alpha<2, with m=3 exactly on baryon-free intervals and m<3 wherever the interval carries baryons. Validation of this physical scale map remains separate.\n\nThe additional product-tracking premise of Proposition I.13c.3 restricts A_G to {1,3,7}. Selecting its endpoint A_G=7 gives the benchmark pair (A_G,m)=(7,3). Theorem I.13c.5 realizes the kernel through a convex static action with field equation div[mu(|grad Phi|/a_chi) grad Phi]=4 pi G rho_b for A_G<=13.3695..., which covers {1,3,7}, and by no C^1 radial potential above that value; its spherical and planar solutions are exact, and for A_G>0 no response homogeneous of degree one in the source, in particular no linear kernel, reproduces the exterior law. Theorem I.13j shows that on the linear covariant conserved-response class the static dynamical response does not determine the lensing response, with no gravitational slip exactly where they agree, and that for A_G>0 no nondegenerate member reproduces the mass-dependent L0. Selecting an amplitude, realizing a conserved covariant source, which for A_G>0 lies outside the linear class, and matching rotation, lensing, cluster, early-universe, and local-gravity responses require the dark-susceptibility and effective-action certificate.'
    },
    {
      key: 'vacuum',
      group: 'Cosmology',
      label: 'False-Vacuum Weight',
      title: 'False-Vacuum Weight',
      summary: 'Conditional bounce and decay ledger',
      color: '#94A3B8',
      rgb: '148,163,184',
      source: 'Appendix U',
      copy: 'A false vacuum is a metastable state represented by a local minimum of an effective potential. A bounce is a finite Euclidean configuration used to calculate the decay weight for leaving that state. The expanding form pictures that bounce contribution.\n\nThe calculation requires the potential, bounce solution, fluctuation operator, negative and zero modes, determinant normalization, and a controlled remainder. A further realization record determines the real vacuum stress that enters the cosmological constant; equating it with the Euclidean decay weight requires a derived relation.',
      technical: 'Appendix U studies a conditional O(4)-symmetric false-vacuum bounce. On the four-mode branch, accepted marking and action certificates give the reference exponent, and a complete relative-Fredholm record determines the Euclidean decay magnitude w_4^dec=A_eff^Fred,4 exp(-284).\n\nThe real vacuum-stress coefficient w_4^real requires the additional analytic-continuation, units, extensivity, metric-variation, and source-exhaustion record. On that branch, Lambda L_P^2=8 pi w_4^real. Equating w_4^real with w_4^dec requires a derived bridge; the decay magnitude alone does not determine the cosmological constant. The terrain is an effective-potential diagram for this certificate stack.'
    },

    {
      key: 'cascade',
      group: 'Backbone',
      label: 'K0 Cascade',
      title: 'K0 Cascade',
      summary: 'Six-phase bridge to D=4',
      color: '#F59E0B',
      rgb: '245,158,11',
      source: 'Sections 5, 7; Appendix Z',
      copy: 'The cascade follows the register construction from the Cogito starting point to a finite geometric carrier. The full-context register model gives K0=3. Perfect distinguishability and a strict cost comparison select an eight-dimensional carrier; the minimal active-kernel construction supplies twenty-four interface modes.\n\nA faithful geometric representation places those modes in distinct contact cells. Four dimensions are the least that can accommodate all twenty-four under the stated cost rule. The later continuum and causal conditions connect that Euclidean carrier to Lorentzian spacetime.',
      technical: 'Theorem 15 gives K0=3 under injective stepping, explicit two-phase control, nondestructive retention, and full-context closure. Sharp Hilbert encoding gives d0>=8. An admissible C^8 representative and strictly greater cost for every higher-dimensional representative with the same responses select d0=8. The minimal active-kernel and QFI conditions give a=2, b=6, and M=24.\n\nThe faithful-shell condition is M=24<=K(D). K(3)=12 excludes D<=3; the response-preserving 24-cell realization and strict surplus-dimension cost select D_car=4. Lorentzian spacetime uses the continuum, time-orientation, principal-symbol, and causal-cone certificates.'
    }
  ];

  PU.catalogueByKey = {};
  for (var i = 0; i < PU.catalogue.length; i++) {
    PU.catalogueByKey[PU.catalogue[i].key] = PU.catalogue[i];
  }
})(window.PU);
