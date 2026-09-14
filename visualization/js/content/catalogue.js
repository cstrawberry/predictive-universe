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
      technical: 'Definition 8 registers the interval alpha<PP_W<beta for a fixed task distribution, proper score, and evaluation window. Strict expected super-chance performance gives PP_W>alpha. The pathwise excitation certificate supplies its own ceiling beta_0.\n\nOn the joint excitation and exact response-law branch, alpha<beta<=beta_0, and Theorem 19 gives a logarithmic complexity divergence as PP_W approaches beta. Comparing beta with alpha_SPAP requires a bridge identifying the same system, task, score, and window.'
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
      source: 'Sections 7.5-7.6; Appendix J',
      copy: "Landauer's principle applies to the specified physical reset of a memory to a standard ready state. In the displayed architecture, four reachable state-and-prediction pairs become two retained state outputs after the prediction register is reset.\n\nThe heat bound depends on the input distribution and everything retained through the reset. If flipping the erased bit leaves its joint distribution with all retained records unchanged, the bit is conditionally uniform and the stated reset assumptions give at least kBT ln2 of heat. Equality requires zero excess dissipation.",
      technical: 'On the prescribed-ready binary-ancilla branch, the cycle map is noninjective when all four input pairs are reachable, giving a two-to-one support reduction.\n\nFor the cyclic isothermal degenerate-register reset of Theorem J.1, Q_bath/(kBT)=H_q(P|R)+epsilon_diss, with epsilon_diss>=0. The invariant-record corollary derives H_q(P|R)=ln2 when the joint law is invariant under flipping P and every record in the complete retained ledger R is unchanged.\n\nTheorem 7.6k classifies return maps by whether the displaced distinction is already known, retained, exported, cyclically erased, or removed without a complete certificate. The cyclic-erasure branch supplies the heat ledger. Structural log-cardinality, conditional entropy, bath heat, and total entropy production keep their separate meanings.'
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
      copy: 'A Minimal Predictive Unit (MPU) is a least-complex physical realization of a qualifying prediction task. The register model shown here keeps the current state and stored forecast readable while a binary control advances the cycle.\n\nWhen all combinations of the three binary registers are reachable, the model has eight configurations. An eight-dimensional quantum carrier can represent them as distinguishable states. The stationary minimal branch has twenty-four active interface modes. Prepared states away from that stationary spectrum can have additional response-active directions.',
      technical: 'Theorem 15 assumes injective stepping before reset, explicit two-phase control, nondestructive retention, and full-context closure. These conditions give N_vis_min=8 and K0=3. Perfectly distinguishable Hilbert encoding then requires d0>=8.\n\nPCE selects d0=8 when an admissible C^8 representative preserves every registered finite response and all higher-dimensional representatives have strictly greater total cost. At the flat active spectrum I_2/2 plus six zero eigenvalues, a=2 and b=6 give M=2ab=24 nonzero-QFI interface directions. Appendix Z distinguishes this stationary count from nonequilibrium generator support.\n\nTheorems 7.6a and 7.6g classify finite representations as C^8 tensor K and specify the dynamics that preserve the retained eight-dimensional response algebra. Theorem 7.6h also gives deterministic hidden-seed refinements with exactly the same finite retained histories as stochastic update laws. An intrinsic-stochasticity claim requires an additional response, implementation, or admissibility condition.'
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
      copy: 'Principle of Compression Efficiency (PCE) Geometry compares network arrangements using their predictive responses and resource costs. Under the stated communication and viability conditions, sufficiently severe irregularity exceeds the available budget. Among arrangements with the same response, PCE favors the lower-cost representative.\n\nA separate comparison of specified four-dimensional shells selects the D4 shell when cost strictly favors the shell whose directional anisotropy first appears at the highest order. Extending local order to a smooth large-scale geometry requires the continuum conditions.',
      technical: 'Appendix C gives conditional irregularity penalties using fixed communication tasks, curvature-response maps, and resource bounds. The displayed relaxation compares response-equivalent candidates under their declared cost.\n\nPropositions C.6i-C.6j compare a registered class of four-dimensional shells. The D4 shell has anisotropy floor six; the competing classes have floor at most four. A cost strictly decreasing with that floor selects D4 and its 24 vertices within this class. Exhaustion of other shells and physical realization of the cost ordering remain additional obligations.\n\nThe continuum bridge separately requires noncollapse, curvature transfer, Mosco convergence, and rigidity. Local shell symmetry supplies only part of that construction.'
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
      copy: 'The extended binary Golay code has twenty-four binary coordinates, twelve information dimensions, and minimum Hamming distance eight. One systematic presentation places twelve blue information coordinates above twelve purple parity coordinates generated through the displayed matrix.\n\nThe paper constructs an encoder, a syndrome measurement, and a correction rule that recover up to three bit flips. Its finite quantum model preserves encoded superpositions under that error family. Using this model as physical memory requires implemented gates, a measured noise law, and a complete resource account.',
      technical: 'The [24,12,8] code uses a chosen systematic generator G=[I|P]. The displayed links depend on this basis. The predictive-recovery self-dual-rate gate supplies k=12 on its stated branch.\n\nTheorems 7.6d and 7.6j give an exact radius-three decoder and a projective syndrome instrument with conditional bit-flip recovery. Their complete recorded map is CPTP; syndromes with no radius-three representative receive a failure flag. The recovery theorem covers the specified bit-flip family. Physical coordinates, gates, preparation, reset, noise, and resource measurements remain required.\n\nThe separate perfect-code route in Section Z.13.1 starts with the punctured [23,12,7] code and adds a parity coordinate. Perfectness belongs to that 23-coordinate code; the displayed 24-coordinate extension has a different packing property.'
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
      copy: 'The Dimensional Gate asks for enough distinct geometric cells to carry all twenty-four interface modes of the minimal branch. The kissing number K(D) gives the maximum number of equal-radius contact cells available in D dimensions.\n\nA faithful shell requires 24 <= K(D). Three dimensions provide only twelve contacts, while the regular 24-cell realizes all twenty-four in four dimensions. A cost for unused dimensions then selects four as the least feasible carrier dimension.',
      technical: 'The registered mode-to-cell map requires M=24 <= K(D). The exact value K(3)=12 excludes D<=3, and the regular 24-cell supplies a response-labeled feasibility witness in R^4. Strict surplus-dimension cost selects the least feasible value D_car=4.\n\nThe result is a four-dimensional Euclidean response carrier. Its promotion to observed 3+1 spacetime uses the separate operational-continuum, principal-symbol, time-orientation, causal-cone, and metric-reconstruction certificates.'
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
      technical: 'The finite-response block frame splits d0=8 into active C^2 and inactive C^3, C^2, and C^1. The determinant-compatible capacity branch selects su(3)+su(2)+u(1), with 8+3+1 generators.\n\nAfter quotienting the common phase, the capacity bound retains one abelian direction from the relative block phases. A determinant-character certificate fixes its embedding and global group; the chirality and anomaly-descent ledger identifies hypercharge. The charge lattice, Higgs vacuum, masses, and mixing require their further certificates.'
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
      copy: 'Influence travels through successive updates in the MPU network. If each update takes at least a fixed positive time and edge lengths remain uniformly bounded, propagation has a finite speed upper bound.\n\nThe light cone shown here also assumes that the network reaches a common propagation frontier. The continuum and causal conditions turn that frontier into the cone that constrains signal paths and the histories of physical systems.',
      technical: 'Theorem 46 assumes serialized edge-by-edge propagation, an update-time lower bound tau_min>0, and uniformly bounded positive weights w_xy<=w_max. It gives the operational speed bound c_*=delta w_max/tau_min.\n\nAn attained frontier is an additional input. Corollary 46a combines it with the spatial continuum limit, time coordinate, second-order principal symbol, and cone-coincidence and signature conditions to obtain Lorentzian kinematics. Normalized uniform weights and one-link saturation give c=delta/tau_min.'
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
      copy: 'Emergent gravity treats mass-energy as concentrated predictive maintenance and update cost. When many finite channels coordinate, uneven cost changes the effective metric that governs distance, time, and transport.\n\nLarge-scale motion follows that effective geometry. Curvature records how predictive frame transport, horizon thermodynamics, and network stress organize into Einstein-style gravitational behavior on the certified branch.',
      technical: 'Stress-energy is read as predictive update and maintenance cost projected into an effective metric. The metric records how distances, times, and transport behave after coarse-graining the finite network.\n\nUnder the operational-continuum, local KMS/Clausius, horizon-entropy, and metric-action hypotheses, the framework recovers Einstein’s equation as a thermodynamic finite-response closure without postulating a microscopic graviton sector.'
    },
    {
      key: 'horizon',
      group: 'Spacetime',
      label: 'Predictive Horizon',
      title: 'Predictive Horizon',
      summary: 'Area-counting MPU horizon',
      color: '#818CF8',
      rgb: '129,140,248',
      source: 'Appendix E',
      copy: 'A predictive horizon bounds the records accessible to an observer with a given protocol and resource budget. Crossing the boundary changes which records that observer can store, check, and recover.\n\nThe boundary channels limit the reliable response entropy available across the surface. Their capacity gives an area bound. Reaching that bound and identifying it with thermodynamic horizon entropy require the capacity, saturation, and thermodynamic conditions.',
      technical: 'Appendix E bounds reliable boundary-response entropy by an area term on the registered density and channel branch. Equality requires capacity attainment, entropy saturation, and an additive ledger. Identifying this entropy with thermodynamic horizon entropy and its coefficient with measured Newton G uses the corresponding bridges.\n\nA physical reset has its own ledger: Q_bath/(kBT)=H_q(P|R)+epsilon_diss. Its heat depends on the actual input law and retained side information; total entropy production is kB epsilon_diss.'
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
      copy: 'The black-hole information channel connects retained information with the records accessible to an exterior observer. On the isometric evolution branch, the combined black-hole and radiation system preserves distinctions between retained responses. Exterior access is governed by the specified horizon channel and recovery protocol.\n\nRecovering information from radiation requires the channel, clock, and decoding conditions. Page-curve behavior additionally depends on the scrambling, continuity, edge-mode, and recoverability certificates.',
      technical: 'Theorem K.3.3a assumes an isometric global update of the retained black-hole-plus-radiation Hilbert space, unitary when its total dimension stays fixed. The induced transport is injective, preserving distinct retained response operators.\n\nExterior recovery uses a specified channel, protocol class, capacity, clock, and decoding bound. Page-curve conclusions require the accepted scrambling, continuity, edge-mode, and recovery records on that same branch.'
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
      copy: "Perspectival information is evaluated relative to a receiver with an operational self-model. A pattern can change the receiver's external model, its self-model, or both. The amount of self-model engagement and the required self-predictive accuracy are recorded separately.\n\nSpecified diagonal challenges can reach the Self-Referential Paradox of Accurate Prediction boundary. On branches carrying the required register geometry and implementation certificates, their integration cost grows with proximity to that boundary. Passing a conclusion to another observer also requires a record-sharing channel and an uncertainty budget for the resulting inference.",
      technical: "Appendix M records a receiver-pattern profile with predictive relevance, SPAP proximity, and reflexivity fraction. These coordinates apply to systems with Effective Operational Property R, an identifiable Fisher stratum, and the registered self/external tangent split.\n\nDivergent proximity is established for the independent-register diagonal construction and for patterns carrying its physical implementation certificate. Other self-model changes can remain finite, including changes with nonzero reflexivity fraction.\n\nSection M.6.4a composes certified tolerance maps along unary inference paths. Each cross-perspective import carries its record-sharing or perspective-invariance certificate. Acceptance depends on the composed uncertainty staying within the declared budget; inferences with several premises require a bound covering every premise."
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
      copy: 'The dark-sector proposal describes a gravitational response around visible matter that changes with scale. On the static spatial-clock branch, an exterior Keplerian field and the specified relaxation clock fix a cubic transition profile. With the same acceleration normalization, the transition length grows as the square root of the system’s baryonic mass.\n\nThe response amplitude still has to be selected and tested. Galaxy rotation, cluster dynamics, and lensing test the physical response maps and their uncertainty budgets. The halo pictures this conditional effective response.',
      technical: 'On the acceleration-lock and spatial-clock branch of Definition I.13c.1, g_Lambda=c^2 sqrt(Lambda)/8 and the registered exact power clock is sigma_loc=s_loc^(3/2). For an exterior Keplerian baryonic field, Proposition I.13c.2 gives m=3 and L0=sqrt(G M_b/(beta_chi g_Lambda)), with baryonic mass M_b and positive rate modulus beta_chi. Validation of this physical scale map remains separate.\n\nThe additional product-tracking premise of Proposition I.13c.3 restricts A_G to {1,3,7}. Selecting its endpoint A_G=7 gives the benchmark pair (A_G,m)=(7,3). Selecting an amplitude, realizing a conserved covariant source, and matching rotation, lensing, cluster, early-universe, and local-gravity responses require the dark-susceptibility and effective-action certificate.'
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
      copy: 'A false vacuum is a metastable state represented by a local minimum of an effective potential. A bounce is a finite Euclidean configuration used to calculate the decay weight for leaving that state. The expanding form pictures that bounce contribution.\n\nThe calculation requires the potential, bounce solution, fluctuation operator, negative and zero modes, determinant normalization, and a controlled remainder. A further realization record connects the Euclidean decay weight to a physical cosmological quantity.',
      technical: 'Appendix U studies a conditional O(4)-symmetric false-vacuum bounce. On the four-mode branch, accepted marking and action certificates give the reference exponent, and a complete relative-Fredholm record determines the Euclidean decay magnitude w_4^dec=A_eff^Fred,4 exp(-284).\n\nThe real-time weight and Lambda L_P^2 use the additional analytic-continuation, units, extensivity, metric-variation, and source-exhaustion record. The terrain is an effective-potential diagram for this certificate stack.'
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
