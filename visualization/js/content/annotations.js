/*
 * Scene annotations.
 *
 * Each entry labels one element of a scene. `at` is either a fixed world-space
 * point or a function of scene time returning one; the overlay projects it each
 * frame and pins an HTML marker there. Returning null hides the marker.
 */
(function (PU) {
  'use strict';

  var D = PU.data;
  var gravitySurfaceY = D.gravitySurfaceY;
  var terrainHeight = D.terrainHeight;

  function note(label, plain, technical, at) {
    return { label: label, plain: plain, technical: technical, at: at };
  }

  /* Shared motion paths, so a marker tracks exactly what the scene draws. */
  function quantumTip(t) {
    var th = 1.05 + Math.sin(t * 0.55) * 0.48;
    var ph = t * 0.82;
    return [Math.sin(th) * Math.cos(ph) * 86, Math.cos(th) * 86, Math.sin(th) * Math.sin(ph) * 86];
  }

  function spinorTip(t) {
    var u = (t * 0.85) % (Math.PI * 4);
    return [Math.cos(u) * 66, Math.sin(u / 2) * 54, Math.sin(u) * 66];
  }

  function spinorMate(t) {
    var p = spinorTip(t);
    return [p[0], -p[1], p[2]];
  }

  function dimMode(t) {
    return D.project4([1, 1, 0, 0], t, 62);
  }

  function defectPos(idx, t, r, y) {
    var a = t * 0.35 + (idx * Math.PI * 2) / 3;
    return [Math.cos(a) * r, y + Math.sin(t + idx) * 8, Math.sin(a) * r];
  }

  function packetPos(idx, t, r, y, total) {
    var a = t * 0.32 + (idx * Math.PI * 2) / (total || 6);
    return [Math.cos(a) * r, y + Math.sin(t + idx) * 4, Math.sin(a) * r];
  }

  function vacuumBounceEdge(t) {
    var ph = (t % 18) / 18;
    var grow = PU.math.smooth01(0.12, 0.42, ph) * (1 - PU.math.smooth01(0.86, 1, ph));
    return [12 + grow * 54, terrainHeight(0, 0) * 0.72 - 10, 0];
  }

  PU.annotations = {
    cogito: [
      note('Cogito certainty', 'The first point is the fact that awareness is occurring. The framework treats this as certainty, then asks what structure prediction must have.', 'The foundations section treats the Cogito as indubitable awareness/process and uses it as the epistemic root.', [0, 0, 0]),
      note('K0 = 3', 'The three binary registers hold the current state, forecast, and cycle phase. Under the stepping, retention, and full-context conditions, eight visited configurations give the minimum K0=3.', 'Theorem 15 gives N_vis_min=8 and K0=3 within the realization class satisfying injective stepping, explicit two-phase control, nondestructive retention, and full-context closure.', function (t) { return [Math.cos(t * 0.4) * 48, 42, Math.sin(t * 0.4) * 48]; }),
      note('d0 = 8', 'The cube represents eight perfectly distinguishable register configurations. An eight-dimensional carrier is selected when it preserves the required responses and every larger carrier with those responses costs more.', 'Sharp Hilbert encoding of the eight contexts gives d0>=8. An admissible C^8 representative and strict total-cost separation from higher-dimensional representatives with the same finite responses select d0=8.', [-42, -42, -42]),
      note('M = 24', 'The outer shell is the twenty-four-mode interface. It appears when the active two-state kernel meets the six-dimensional inactive sector.', 'Using active kernel a=2 and inactive sector b=6 gives M=2ab=24. This is the finite interface count.', [72, -54, -28]),
      note('D = 4 carrier', 'The completed shell marks the least feasible carrier for twenty-four distinct interface cells. The later causal construction turns this Euclidean carrier into a spacetime model.', 'Faithfulness requires M=24 <= K(D). Since K(3)=12 and the regular 24-cell supplies a witness in R4, strict surplus-dimension cost selects D_car=4. Lorentzian promotion uses separate certificates.', [118, 0, 0])
    ],

    becoming: [
      note('Alpha baseline', 'The red boundary marks the random-forecast baseline for the chosen task and score. Viable expected performance must exceed it over the specified evaluation window.', 'Theorem 8 gives PP_W>alpha when strict expected super-chance performance is required. Alpha is defined from the registered task distribution, proper score, and evaluation window.', [-92, -58, 0]),
      note('Viability flow', 'The points represent expected performance within the chosen viability interval. Each value summarizes forecasting over an evaluation window.', 'The operational-viability condition is alpha<PP_W<beta for the registered task and score. The upper inequality requires the endpoint certificate specified in Definition 8.', function (t) { return [Math.sin(t * 0.45) * 20, 0, 0]; }),
      note('Beta endpoint', 'The blue boundary marks the model’s upper performance endpoint. On the exponential response-law branch, approaching it requires increasing complexity without bound.', 'The analytic endpoint beta is registered separately from the excitation ceiling beta_0. The joint branch requires alpha<beta<=beta_0. Theorem 19 gives the logarithmic divergence; comparison with alpha_SPAP requires a bridge for the same system, task, score, and window.', [-92, 58, 0])
    ],

    ledger: [
      note('Finite records', 'The left pulses are finite records that can be kept and checked. A claim enters the framework through these physical responses.', 'PPI admits content through finite records, finite verification, finite maintenance, and finite update-use.', [-112, 42, 0]),
      note('Response quotient', 'The middle channels merge labels that make no operational difference. If no finite protocol can tell them apart, PPI treats them as the same.', 'The quotient removes distinctions that no finite protocol can detect. PCE only ranks representatives after that quotient is fixed.', [-8, 0, 0]),
      note('Certificate gates', 'The right rings mark status gates. A branch becomes closed only when its finite certificates and overlap maps commute.', 'Branch, bridge, model, and closed statuses are certificate gates. A sector closes only when finite certificates and overlap maps commute.', [108, 0, 0])
    ],

    spap: [
      note('Self-reference loop', 'The blue loop feeds a forecast back into the system being predicted. In the stated class, an allowed diagonal response can contradict that forecast.', 'The SPAP obstruction requires the retained evaluator, logical memory, and uniform diagonal closure. Corollary 2c separately supplies a Pure S trajectory with decidable finite-horizon observations and an undecidable eventual-detection question.', [86, -16, 0]),
      note('NOT / diagonal branch', 'The red branch is the counter-move created by self-reference. It is the moment the system can use the prediction against itself.', 'The NOT branch is the diagonal response. It maps a predicted binary outcome to its opposite when prediction becomes part of the system state.', [-72, 18, 0]),
      note('Registered reset branch', 'The gold pulse shows a physical reset that can follow the logical diagonal event. Its cost depends on the chosen device and the records it clears.', 'SPAP supplies a structural binary split. A registered many-to-fewer reset adds an implementation cost. For the prescribed-ready uniform binary architecture, the conditional record loss is ln2 nats; other distributions and implementations have their own ledger.', [0, -68, 0])
    ],

    entropy: [
      note('Input records', 'Four reachable input pairs enter a prescribed-ready reset. Each pair contains a retained result and one temporary bit.', 'The diagram uses the conditional architecture in which four reachable (P,R) pairs map to two output records while preserving R.', [-105, 48, -34]),
      note('Reset gate', 'The center clears the temporary bit while keeping the registered result. If the two bit values remain equally likely given every retained record, the stated cyclic reset has a kBT ln2 heat floor.', 'Theorem J.1 gives Q_bath/(kBT)=H(P|R)+epsilon_diss. Invariance of the joint law under flipping P, with the complete retained R unchanged, gives H(P|R)=ln2. Equality of heat with kBT ln2 additionally requires zero excess dissipation.', [0, -24, 0]),
      note('Retained results', 'Two result records remain after the temporary bit returns to its ready state. The full account also tracks any copy of the displaced bit and what happens to it.', 'Theorem 7.6k separates retained copies, certified export, completed cyclic erasure, and uncertified removal. Only the completed cyclic-erasure branch supplies the stated Landauer ledger; its source distribution and retained side information must be included.', [112, 42, 0])
    ],

    mpu: [
      note('Hilbert space C^8', 'The cube holds the eight distinguishable configurations of the full-context register model. Its minimal Hilbert realization has eight dimensions under the stated response and cost conditions.', 'Theorem 15 gives eight visited contexts under its stepping, control, retention, and full-context hypotheses. Sharp encoding gives d0>=8; an admissible C^8 representative and strictly greater total cost for every higher-dimensional representative with the same responses select d0=8.', [-38, -56, -38]),
      note('State register', 'This register carries the present stance toward the world. Without a current state, there is nothing for the prediction to be about.', 'This is the phi register in the state-prediction-control triple. It supplies the current physical representative for the loop.', function (t) { return [-54, -72 + Math.sin(t) * 5, 0]; }),
      note('Prediction register', 'This register carries the forecast waiting to be tested. Prediction becomes physical only when it can be held long enough to meet an outcome.', 'The p register carries the forecast until verification. PPI requires a finite response channel, so the forecast cannot be only an abstract label.', function (t) { return [0, -72 + Math.sin(t + 1) * 5, 0]; }),
      note('Control register', 'This register orders the cycle: predict, compare, update. A physical clock determines how long that cycle takes.', 'The c register sequences prediction, verification, and update. Theorems 7.6i and 7.6n keep the physical time scale and reference energy in a separate calibration record.', function (t) { return [54, -72 + Math.sin(t + 2) * 5, 0]; }),
      note('24 interface modes', 'The outer points represent the twenty-four interface modes of the stationary minimal branch. A prepared state away from that spectrum can have additional response-active directions.', 'At I_2/2 plus six zero eigenvalues, a=2 and b=6 give M=2ab=24 nonzero-QFI interface directions. Prediction Z.1 counts 26 or 42 generators for its specified nonequilibrium spectra. A response-preserving mode-to-cell map is an additional condition of the dimensional construction.', [92, -26, 28])
    ],

    network: [
      note('MPU nodes', 'Each point is a minimal predictive unit. Alone it is small; together the nodes form the substrate from which geometry and fields can be read.', 'Each node is an MPU, the minimal finite carrier selected by PPI/PCE. It has internal state and finite response channels.', [0, -32, 0]),
      note('Cost edges', 'Lines are finite channels. Every connection carries cost, delay, and possible loss, so the graph already contains the seeds of geometry.', 'Edges carry finite update cost, delay, and fidelity loss. Their weights are the raw material later read as geometry.', [78, -18, 20]),
      note('Aggregate structure', 'Clusters are higher-level predictive organizations. At large scale, stable clusters can support spacetime, field behavior, and complex observers.', 'Aggregates are stable organizations of many MPUs. Depending on branch certificates, they can support spacetime, gauge sectors, and CC models.', function () { return (D.network.clusters[2] && D.network.clusters[2].center) || [-80, 0, 0]; })
    ],

    pcegeo: [
      note('Irregular representative', 'The red offsets show a higher-cost arrangement on the displayed finite-response branch.', 'Appendix C treats irregularity as costly for viable MPU networks when the extra geometry changes no registered finite response.', [-94, 38, 20]),
      note('Regular representative', 'The cyan lattice is the lower-cost arrangement among the response-equivalent candidates in this scene.', 'Propositions C.6i-C.6j separately select the D4 shell within a specified four-dimensional comparison class, under a strict cost ordering by anisotropy floor. The smooth continuum also requires noncollapse, curvature transfer, convergence, and rigidity.', [94, -18, 0]),
      note('PCE relaxation', 'The moving nodes show response-equivalent candidates settling toward lower declared cost.', 'Relaxation removes response-null surplus within the admitted comparison class.', function (t) { return [Math.cos(t * 0.4) * 50, 0, Math.sin(t * 0.4) * 40]; })
    ],

    quantum: [
      note('Bloch sphere', 'The surface represents pure states of the active two-level sector. Mixed states lie inside the Bloch ball.', 'Pure-state rays in C^2 form the Bloch sphere. General states are density operators; their outcome probabilities use tr(rho E) on the certified Born domain.', [0, 88, 0]),
      note('Pure-state ray', 'The moving point represents a pure state. Its direction determines the outcome probabilities for a chosen measurement.', 'For the pure state rho=|psi><psi|, a rank-one projective outcome has probability |<i|psi>|^2 on the certified Born branch. The Bloch point represents the ray, with a common amplitude phase identified.', quantumTip),
      note('Probability ring', 'The ring sketches the changing outcome probabilities as the pure state moves relative to a chosen measurement basis.', 'For a fixed projective measurement, the pure-state probabilities are the squared components of psi in that basis. The general probability rule is tr(rho E).', [54, -112, 0])
    ],

    spinor: [
      note('Spinor state vector', 'The cyan marker shows a state that needs two full turns to come home. This is why spinors behave differently from ordinary arrows.', 'The path belongs to the SU(2) double cover. A 2pi turn changes sign, and a 4pi turn returns to the original state.', spinorTip),
      note('Second lift sheet', 'The red marker shows the same spatial orientation on the other spinor sheet. One full turn changes the amplitude sign; the second full turn returns it.', 'The SU(2) lift sends a 2pi rotation to -I. The vectors psi and -psi define the same physical ray while retaining a sign that matters in interference. This double-cover structure is mathematically separate from the SPAP diagonal operation.', spinorMate)
    ],

    golay: [
      note('Information coordinate', 'Blue vertices are the twelve information coordinates in one chosen systematic presentation of the code.', 'The marked representative uses a systematic generator G=[I|P] for the extended binary Golay code [24,12,8]. Another basis can mix these presentation roles.', [-85, 45, 0]),
      note('Parity coordinate', 'Purple vertices are the twelve parity coordinates calculated from the information half. Each illuminated link follows the displayed parity matrix.', 'The matrix P specifies which information coordinates contribute to each parity coordinate in this representative.', [-85, -45, 0]),
      note('Syndrome path', 'The moving pulses trace the parity checks used to identify and correct up to three bit flips. Implementing those checks physically requires the specified gates and noise model.', 'Theorems 7.6d and 7.6j give the exact radius-three decoder and a CPTP syndrome-and-recovery model for the stated bit-flip family. Syndromes without a radius-three representative are flagged; correction outside the guaranteed radius is channel dependent.', [0, 0, 12])
    ],

    dim: [
      note('Central MPU', 'The center is the predictive unit whose possible contacts are being counted. The question is how many directions a minimal unit can use without surplus.', 'The MPU contributes the interface modes to be packed. The branch uses the M=24 contract produced by K0, d0, and the active/inactive split.', [0, -26, 0]),
      note('Faithful shell cell', 'Each outer point is one distinct cell assigned to an interface mode. The shell needs room for all twenty-four modes.', 'The D4 root configuration supplies twenty-four response-labeled cells in R4. Faithfulness requires M=24 <= K(D).', dimMode),
      note('D = 4 carrier gate', 'Three dimensions fit only twelve equal contacts. The regular 24-cell fits all twenty-four in four dimensions, and the surplus-dimension cost selects the least feasible carrier.', 'K(3)=12 excludes D<=3, while the regular 24-cell proves feasibility in D=4. The selected object is a Euclidean response carrier; Lorentzian 3+1 spacetime follows through separate continuum and causal certificates.', [118, -18, 0])
    ],

    gauge: [
      note('Active kernel C^2', 'The two active nodes carry the match/mismatch response. The comparison and reflex step can run reversibly. Clearing a record at cycle closure uses a separately specified reset.', 'The block frame contains an active C^2 kernel. Section 7 gives an injective diagnostic and reflex step; the physical closure-reset cost depends on the erased record, its input law, and the retained side information.', [0, 48, 0]),
      note('SU(3) strong sector', 'The red block is the three-dimensional memory sector. Its eight internal generators match the strong interaction algebra on the stated branch.', 'The C^3 memory block yields su(3), with eight generators. Appendix G treats this as a finite-response block-frame sector.', [-92, -58, 0]),
      note('SU(2) weak sector', 'The gold block is the two-dimensional memory sector. Its three generators supply the weak interaction algebra.', 'The C^2 memory block yields su(2), with three generators. It is distinct from the active C^2 kernel in the split.', [14, -58, 0]),
      note('U(1) phase direction', 'The green marker represents the retained relative-phase direction. The embedding and matter conditions identify this direction with hypercharge. Electromagnetic charge follows after electroweak breaking.', 'After the common-phase quotient, the capacity bound retains one abelian direction from the block-center torus. A determinant-character certificate fixes its embedding; the chirality and anomaly-descent ledger identifies hypercharge. The selected algebra has 8+3+1 generators.', [98, -52, 0])
    ],

    particles: [
      note('Quark-like sector marker', 'The red marker identifies a candidate defect carrying strong-sector labels. A particle interpretation also needs the registered configuration, dynamics, locality, and physical map.', 'The coded-background branch can label candidate defects by su(3) data. Confinement and an identification with quarks require their additional certificates.', function (t) { return defectPos(0, t, 32, 22); }),
      note('Lepton-like sector marker', 'The gold marker identifies a candidate defect with electroweak labels. Its physical interpretation depends on the matter and charge construction.', 'A sector label constrains a candidate excitation. Fermion content, chirality, charge, spectrum, and mixing use further branch records.', function (t) { return defectPos(1, t, 52, 22); }),
      note('Gauge-boson-like marker', 'The green marker identifies a candidate gauge-sector excitation. The physical carrier map determines whether it realizes an interaction boson.', 'Adjoint or redundancy excitations supply gauge-boson-like candidates. Their physical interpretation follows only after the dynamics and continuum maps close.', function (t) { return defectPos(2, t, 72, 22); }),
      note('Mass hierarchy ring', 'The lower ring reminds the viewer that masses need more than the skeleton. The structural sectors constrain them, but numerical values require further certificates.', 'The skeleton constrains sector labels and possible hierarchy. Numerical mass rows stay threshold, running, and certificate dependent.', [50, -72, 0])
    ],

    relativity: [
      note('Light cone', 'The cone bounds influence on the branch with an attained propagation frontier and a Lorentzian continuum. Its edge shows the common limiting speed.', 'Serialized updates, a uniform positive minimum update time, and bounded edge weights give the speed upper bound in Theorem 46. The depicted cone also requires an attained frontier and the continuum, cone-coincidence, and signature conditions of Corollary 46a.', [82, 86, 0]),
      note('Worldline', 'The gold trace is one system moving through that causal order. It is a history constrained by the same finite speed as every signal.', 'Worldlines are histories in the emergent causal metric. Their admissibility depends on finite propagation and the selected spacetime branch.', [12, 20, 12]),
      note('Mass-information node', 'The gold points show relational information carried by a particle. Rest mass is treated as the maintenance cost of that relation.', 'The paper treats rest mass as maintenance cost for relational information. The node visualizes an entry in that ledger.', function (t) { return [Math.cos(t * 0.32) * 48, Math.sin(t) * 16, Math.sin(t * 0.32) * 48]; })
    ],

    gravity: [
      note('Mass source', 'The warm center is cost made visible. In this framework, mass is resistance in the predictive update ledger, and curvature records how that cost shapes motion.', 'The gravity derivation identifies stress-energy and predictive update cost as the universal source seen by the metric. Curvature is a response of frame transport to that cost.', [0, -54, 0]),
      note('Curved cost grid', 'The surface bends where predictive transport becomes expensive. Signals follow the low-cost geometry, which appears at large scale as gravity.', 'Network cost and finite update rules coarse-grain into a metric. Curvature records nonclosure of predictive frame transport.', [92, gravitySurfaceY(92, 34) + 6, 34])
    ],

    horizon: [
      note('Causal horizon', 'The purple surface bounds the records accessible to an observer with a specified protocol and resource budget. The crossing channels determine the available boundary capacity.', 'Appendix E bounds reliable boundary-response entropy by area on its registered channel and density branch. Thermodynamic horizon entropy uses the additional saturation and physical-identification conditions.', [0, 0, 0]),
      note('Information crossing', 'Gold packets cross the boundary and change the records accessible from each side. The boundary-channel capacity sets the entropy bound; physical heat depends on the process used to store or clear those records.', 'The area result bounds reliable response entropy. Equality requires capacity attainment, entropy saturation, and an additive ledger. Reset heat uses the actual conditional entropy H_q(P|R) and implementation dissipation.', function (t) { return [Math.cos(t * 1.3) * 44, 42 - Math.abs(Math.sin(t)) * 82, Math.sin(t * 1.3) * 24]; }),
      note('MPU network', 'The blue and violet nodes are the substrate divided by the horizon. The boundary limits access and updates across the same underlying network.', 'The same MPU substrate exists on both sides, while the horizon separates update access.', [-72, 34, 40])
    ],

    blackhole: [
      note('Photon ring', 'The warm ring frames the black hole boundary as seen from outside. It marks the visible edge of a deeper information problem.', 'The ring is an exterior visual marker. The paper separates apparent horizon behavior from finite-response structural conservation.', [58, 0, 0]),
      note('Perspectival channel', 'Blue threads follow retained distinctions on the branch where the total evolution preserves them. Exterior recovery depends on what the horizon channel transmits and what an observer can decode.', 'Theorem K.3.3a preserves distinct retained response operators under an isometric global update, unitary at fixed total dimension. Exterior recovery requires the separate channel, clock, scrambling, and decoding certificates.', function (t) { return [Math.cos(t * 0.35) * 96, 42 + Math.sin(t) * 18, Math.sin(t * 0.35) * 96]; }),
      note('Accretion disk', 'Orange filaments are infalling matter. They make the horizon visible while the information ledger remains governed by finite recovery conditions.', 'The disk shows matter entering the horizon region. Its brightness is visual context, while the information claim lives in the ledger.', [78, -14, 20]),
      note('Page curve', 'The blue arc marks the recovery question. Page-curve behavior is allowed only on branches with the needed scrambling and continuity certificates.', 'Page-curve behavior is branch certified only when continuity, scrambling, and recovery assumptions are accepted. Without them it remains weaker status.', [-90, 56, 0])
    ],

    predictors: [
      note('Kinematic work', 'The warm structure represents the work assigned to motion in one frame description.', 'Appendix N compares kinematic work with the resource cost of the corresponding predictive operation.', [-92, 0, 0]),
      note('Predictive resource cost', 'The blue structure represents the physical resources used to implement a registered prediction task.', 'The prediction-computation equivalence branch assigns an implementation cost to the registered physical prediction map.', [92, 0, 0]),
      note('Common work ledger', 'The white pulses combine kinetic work and exported predictive-loss work in a single laboratory account for a payload initially at rest.', 'Theorem N.UCT assumes equal endpoint mass and internal energy, no unregistered recoverable field energy, isotropic comoving export, and disjoint kinetic and predictive-loss ledgers. Exported work enters the lab account through the proper-time integral of gamma R_com.', function (t) { return [-92 + 184 * ((t * 0.34) % 1), Math.sin(t * 2) * 5, 0]; }),
      note('Limit cost', 'The red arc marks a limiting regime where the required work grows, such as a massive payload approaching the speed of light.', 'The kinetic term diverges as v approaches c. Predictive divergence requires its task-specific SPAP reduction and resource certificates. Acceleration-dependent refresh costs use the separate detector and implementation conditions.', [0, -64, 0])
    ],

    perspectival: [
      note('Self-model', 'The center is the receiver model of itself. Some information changes the world model; other information reaches into the self-model and becomes costly.', 'Appendix M defines perspective space and self-model engagement. The receiver state sets the cost of integrating a pattern.', [0, -34, 0]),
      note('External-model update', 'Green packets mainly change the receiver’s model of its surroundings. Their cost stays finite on the displayed branch.', 'Low-reflexivity patterns act mostly in the registered external tangent sector and can retain finite update cost.', function (t) { return packetPos(0, t, 35, 2); }),
      note('Self-model update', 'Gold packets engage the receiver’s self-model. Their cost depends on both reflexivity and closeness to a certified diagonal challenge.', 'Reflexivity fraction and SPAP proximity are separate coordinates. A self-model change can remain finite.', function (t) { return packetPos(3, t, 72, 30); }),
      note('Certified SPAP boundary', 'The red wall marks the limit reached by a registered diagonal challenge that demands complete prediction of the receiver’s own future output.', 'Cost divergence is established for the independent-register diagonal construction and patterns carrying its physical implementation certificate.', [92, 58, 0]),
      note('Diagonal challenge', 'Red packets represent the certified challenge approaching that boundary. Their path is one special class of self-referential update.', 'The construction requires Effective Operational Property R, the registered tangent split, and the stated implementation record.', function (t) { return packetPos(4, t, 90, 66); })
    ],

    consciousness: [
      note('MPU aggregate', 'The central form is many predictive units acting as one organized system. Consciousness Complexity begins after aggregate structure can modulate local updates.', 'The CC appendix presents consciousness as a model-level extension with its own branch conditions and empirical tests.', [0, -76, 0]),
      note('Level rings', 'The rings show levels of integration. The bounded-bias branch sets its maximum below 0.5. The proposed 3/8 saturation uses a particular interface-to-response map and active rank two.', 'The interface-fraction hypothesis uses 2a(8-a)/64: a=2 gives 3/8, while a=4 gives 1/2. A strict sub-half ceiling requires a declared admissible rank class and a physical response map that realizes the identification.', [68, -20, 0]),
      note('Context-bias field', 'The green field represents a change in local outcome probabilities. A maximum bias below 0.5 prevents free choice between both deterministic outcomes; one endpoint can still be reached from a sufficiently biased baseline.', 'Theorem 39 assumes sup_S CC(S)<0.5. Exact no-signaling separately requires invariance of the remote unconditional marginal. Local CPTP maps satisfy it. Postulate 3’s nonlocal branch proposes a pre-lightcone marginal shift whose physical realization is tested under Protocol 3.', [64, -100, 0])
    ],

    dark: [
      note('Spiral galaxy', 'The spiral is the visible galaxy. Its baryonic mass enters the transition-length relation on the static spatial-clock branch.', 'For an exterior Keplerian field, Proposition I.13c.2 gives L0=sqrt(G M_b/(beta_chi g_Lambda)). The mass definition, geometry, acceleration normalization, and observable response map are part of that branch.', [36, -22, 36]),
      note('Rotation indicators', 'The cyan markers show the flat rotation behavior that motivates the problem. Stars keep moving too fast for visible matter alone.', 'The markers visualize the empirical rotation tension. The framework parameterizes an effective response at benchmark status.', function (t) { return [Math.cos(t * 0.5) * 82, 18, Math.sin(t * 0.5) * 82]; }),
      note('Effective gravitational halo', 'The faint halo shows the conditional gravitational response around visible matter. The spatial-clock assumptions fix its cubic transition, while the enhancement amplitude still needs selection and testing.', 'Definition I.13c.1 and Proposition I.13c.2 give the response A_G[1-exp(-(R/L0)^3)]. With the additional product-tracking premise, A_G lies in {1,3,7}; choosing 7 gives the benchmark endpoint. The covariant source and observational projections require the dark-response certificate.', [128, -22, 0]),
      note('MOND-scale ring', 'The gold ring marks the transition acceleration. A fixed normalization gives a transition length proportional to the square root of baryonic mass in the stated exterior-field model.', 'The acceleration-lock branch gives g_Lambda=c^2 sqrt(Lambda)/8, and the spatial-clock branch places the transition at beta_chi g_Lambda. Constancy across systems or redshifts requires the same beta_chi, Lambda, geometry conventions, and calibrated response map.', [92, -18, 0])
    ],

    vacuum: [
      note('Effective-potential sketch', 'The terrain sketches an effective potential with local minima and barriers. It provides visual context for a conditional decay calculation.', 'Appendix U begins with a registered effective potential and an O(4)-symmetric Euclidean field equation.', [-58, terrainHeight(-58, 28) * 0.72 - 22, 28]),
      note('False-vacuum state', 'The bright marker is a metastable local minimum. Its decay weight is calculated from a bounce that crosses the barrier in Euclidean field space.', 'The false vacuum, true-vacuum comparison, boundary conditions, and bounce action belong to the accepted marking and action records.', [0, terrainHeight(0, 0) * 0.72 - 16, 0]),
      note('Bounce profile', 'The expanding form represents the bounce contribution to the decay amplitude. A physical cosmological value needs the later realization record.', 'The fluctuation determinant, negative and zero modes, normalization, and controlled remainder determine the relative-Fredholm prefactor multiplying the bounce exponent.', vacuumBounceEdge)
    ],

    cascade: [
      note('Cogito', 'The cascade begins with the certainty that awareness is occurring. Its later stages follow a register construction with explicit conditions on stepping, retention, distinguishability, and cost.', 'Theorem 15 supplies K0=3 on the full-context register branch. Sharp encoding gives d0>=8; the admissible C^8 realization and strict comparison against higher-dimensional representatives with the same responses select d0=8.', function (t) { return PU.cascade.pointPosition(0, t); }),
      note('D = 4 carrier gate', 'The final form is the regular 24-cell, a faithful shell for the twenty-four interface modes in the least feasible Euclidean carrier dimension.', 'Stages 5 and 6 pass through M=24 <= K(D), the K(3)=12 obstruction, four-dimensional feasibility, and strict surplus-dimension cost. Lorentzian spacetime uses the subsequent continuum and causal certificates.', function (t) { return PU.cascade.stageAt(t).index >= 4 ? PU.cascade.pointPosition(18, t) : null; })
    ]
  };
})(window.PU);
