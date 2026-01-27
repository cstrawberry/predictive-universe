# Appendix E: Thermodynamic Limits and Horizon Entropy Area Law

**E.1 Introduction**

This Appendix provides a rigorous derivation of the fundamental information-theoretic and thermodynamic limits imposed by the Non-Deterministic Reflexive Interaction Dynamics (ND–RID, Definition 6, Definition A.2) governing the MPU 'Evolve' process (Definition 27). These limits are consequences of the PU framework's core principles (POP/PCE, SPAP, interaction constraints), underpinned by quantum thermodynamics and information theory. We quantify the inherent thermodynamic irreversibility and bounds on information capacity associated with ND–RID interactions across causal boundaries, culminating in the derivation of the Horizon Entropy Area Law (Theorem 49), foundational for the thermodynamic derivation of Einstein's Field Equations (Section 12).

The derivation proceeds logically:
1.  Establish ND–RID irreversibility by lower-bounding minimal entropy production, linking it to the necessary state-change cost $\varepsilon \ge \ln 2$ (Theorem 31, derived in Appendix J). (Section E.2: Theorem E.1, Corollary E.1)
2.  Prove that this irreversibility implies strict channel contractivity ($f_{\mathrm{RID}} < 1$) for the average 'Evolve' channel. (Section E.3: Lemma E.1)
3.  Derive a strict bound ($C(\mathcal{E}_N) < \ln d_0$) on the channel's classical information capacity based on this contractivity. (Section E.4: Theorem E.2)
4.  Establish the geometric scaling of effective independent boundary information channels, conditional on emergent geometric regularity (Theorem 43), incorporating correlation effects. (Section E.5: Theorem E.3)
5.  Synthesize these results to derive the Horizon Entropy Area Law (Theorem E.6, identified as Theorem 49 in the main text), explicitly calculating the Bekenstein-Hawking coefficient $1/4$. (Section E.6)
6.  Perform a structural consistency check linking the emergent Planck scale to microscopic MPU parameters. (Section E.7)

Natural units where $\hbar=c=k_B=1$ are used for core derivations, restored where appropriate. Dimensionless quantities like entropy, capacity, and $\varepsilon$ are in nats.

**E.2 Irreversibility and Thermodynamic Costs of Reflexive MPU Interactions**

The 'Evolve' process (Definition 27) instantiates Non-Deterministic Reflexive Interaction Dynamics (ND–RID, Definition A.2), represented formally by a quantum instrument $\mathcal{I}_N = \{\mathcal{E}_{N,o}\}_{o \in O}$, where $\mathcal{E}_{N,o}$ are completely positive (CP) maps satisfying $\sum_o \mathcal{E}_{N,o}^\dagger(\mathbb{I}) \le \mathbb{I}$. The probability of outcome $o$ given initial state $\rho$ is $P(o|\rho, N) = \text{Tr}[\mathcal{E}_{N,o}(\rho)]$, and the post-outcome state is $\rho'_o = \mathcal{E}_{N,o}(\rho) / P(o|\rho, N)$. The average channel is the trace-preserving (TP) CP map $\mathcal{E}_N(\rho) = \sum_o \mathcal{E}_{N,o}(\rho)$.

**Theorem E.1 (Minimal Entropy Production Bound for ND–RID Step).** The minimal necessary total entropy production $\Delta S_{tot}(o)$ (system + environment, in units of $k_B$) for the pathway of an 'Evolve'/ND–RID interaction yielding outcome $o$ and state $\rho'_o$ from initial state $\rho$, associated with an information gain $I(\rho; \mathcal{E}_{N}, o) > 0$ (nats), satisfies the lower bound:
$$
\frac{\Delta S_{tot}(o)}{k_B} \geq I(\rho; \mathcal{E}_{N}, o) + D_{KL}[\rho'_o || \mathcal{E}_{N}(\rho)] + \varepsilon \cdot \Theta(I(\rho; \mathcal{E}_{N}, o))
\tag{E.1}
$$
where $I$ is the quantum mutual information gain, $D_{KL}$ is the quantum relative entropy representing feedback cost, $\varepsilon \ge \ln 2$ is the fundamental minimum dimensionless entropy production from the SPAP update cycle logic (Theorem 31, derived in Appendix J, Theorem J.1), and $\Theta(I)$ is the Heaviside step function.

*Proof:* This theorem synthesizes standard second‑law‑with‑information inequalities for measurement and feedback (e.g., Sagawa & Ueda, Phys. Rev. Lett. 104, 090602 (2010); Parrondo, Horowitz & Sagawa, Nat. Phys. 11, 131 (2015)) with the PU framework’s SPAP‑based irreducible cost $\varepsilon$ (Theorem 31, Appendix J). The contributions $I(\rho;\mathcal{E}_N,o)$ and $D_{KL}[\rho'_o\|\mathcal{E}_N(\rho)]$ capture information acquisition and feedback costs, respectively. The $\varepsilon\ge \ln 2$ term applies only on those cycles that execute self‑referential SPAP processing with nonzero information gain ($I>0$), as enforced by the factor $\Theta(I)$. Thus
$$
\Delta S_{tot}/k_B \;\ge\; I + D_{KL} + \varepsilon\,\Theta(I),
$$
with additivity reflecting independent sources of entropy production. QED

**Corollary E.1 (Fundamental Irreversibility of ND–RID 'Evolve').** The average 'Evolve' channel $\mathcal{E}_N = \sum_o \mathcal{E}_{N,o}$ is thermodynamically irreversible whenever it facilitates non-trivial information gain $I > 0$ related to self-referential processing.
*Proof.* If $I>0$ for some pathway involving self-referential update logic, then from Equation (E.1), the minimum total entropy production $\Delta S_{tot}(o)/k_B \ge I + \varepsilon > 0$ (since $\varepsilon \ge \ln 2 > 0$). Averaging over outcomes $o$ will yield a positive mean entropy production for the process, precluding thermodynamic reversibility. A process is thermodynamically reversible if and only if the total entropy production is zero. QED

**E.3 Strict Contractivity of the Average 'Evolve' Channel**

Thermodynamic irreversibility guarantees strict contractivity of the average channel $\mathcal{E}_N$ with respect to measures of state distinguishability.


**Lemma E.1 (Strict Contractivity of the Average 'Evolve' Channel).**
Let the average ND–RID ‘Evolve’ channel be the completely positive and trace-preserving (CPTP) map:
$$
\mathcal{E}_{N}(\rho)\;=\;\sum_{o}\,\mathcal{E}_{N,o}(\rho), \qquad
\mathcal{E}_{N}:\mathcal{B}(\mathcal{H}_{d_{0}})\longrightarrow\mathcal{B}(\mathcal{H}_{d_{0}}),
$$
acting on the MPU's $d_0$-dimensional Hilbert space $\mathcal{H}_{d_0}$ ($\dim\mathcal H_{d_{0}}=d_{0}<\infty$). Then:

1.  **Primitivity.** The channel $\mathcal{E}_N$ is primitive (i.e., irreducible and aperiodic [Baumgartner & Narnhofer 2008]). This primitivity is a consequence of the MPU 'Evolve' dynamics (Definition 27), as detailed in Step 1 of the proof below.

2.  **Strict trace-norm contractivity.** Given primitivity, there exists a constant $0 \le f_{\mathrm{RID}} < 1$ such that for all distinct density operators $\rho_1, \rho_2 \in \mathcal{S}(\mathcal{H}_{d_0})$:
    $$
    D_{\mathrm{tr}}\!\bigl(\mathcal{E}_{N}(\rho_{1}),\mathcal{E}_{N}(\rho_{2})\bigr)
    \;\le\;
    f_{\mathrm{RID}}\;
    D_{\mathrm{tr}}(\rho_{1},\rho_{2}),
    \tag{E.2}
    $$
    where $D_{\mathrm{tr}}(\rho_{1},\rho_{2})=\tfrac12\lVert\rho_{1}-\rho_{2}\rVert_{1}$ is the trace distance. The contractivity factor is $f_{\mathrm{RID}} \equiv \lambda_{gap}(\mathcal{E}_N) < 1$, where $\lambda_{gap}(\mathcal{E}_N)$ is the spectral radius of $\mathcal{E}_N$ restricted to the subspace of traceless operators acting on $\mathcal{H}_{d_0}$.

*Proof.*
1.  **Primitivity and quantitative contractivity via a two‑phase ND–RID micro‑model.** Consider the averaged ‘Evolve’ channel as the convex combination
$$
\mathcal{E}_N \;=\; (1-p)\,\Psi \;+\; p\,T_\sigma,\qquad 0<p\le 1,
$$
where $\Psi$ is an arbitrary CPTP map representing the reversible/update phase and $T_\sigma(\rho)=\mathrm{tr}(\rho)\,\sigma$ is the full–rank reset channel to $\sigma\succ 0$. By construction,
$$
\boxed{\ \mathcal{E}_N(\rho)\ \ge\ p\,\mathrm{tr}(\rho)\,\sigma\ }\tag{E.2a}
$$
(order on positive operators). Since $T_\sigma$ is strictly positive and appears with weight $p>0$, $\mathcal{E}_N$ is **primitive** [Sanz et al. 2010]. Moreover, for any traceless Hermitian $X$,
$$
\|\mathcal{E}_N(X)\|_1 \le (1-p)\,\|X\|_1,\qquad \mathrm{tr}X=0, \tag{E.2b}
$$
because $T_\sigma(X)=0$ and $\|\Psi(X)\|_1\le \|X\|_1$ [Nielsen & Chuang 2010]. Finally, by Appendix J (irreversibility cost $\varepsilon\ge \ln 2$) and choosing $\sigma=\tfrac{\mathbf 1_{d_0}}{d_0}$ so that a reset contributes at most $\ln d_0$ nats of entropy, the reset probability obeys the **non‑zero lower bound**
$$
p \;\ge\; \frac{\varepsilon}{\ln d_0}\ \ge\ \frac{\ln 2}{\ln d_0},
$$
hence the RID contractivity factor satisfies $f_{\mathrm{RID}}(\mathcal{E}_N)\le 1-p \le 1 - \tfrac{\ln 2}{\ln d_0}<1$. This bound is derived by conservatively assuming the reset channel is the dominant contributor to the cycle's average irreversibility cost $\varepsilon$; other sources of dissipation would only increase $p$ and further decrease $f_{\mathrm{RID}}$. More generally, any mechanism realizing the necessary irreversibility $\varepsilon>0$ will ensure primitivity and thus $f_{\mathrm{RID}}<1$.

2.  **Consequences of Primitivity:** For a primitive CPTP map $\mathcal{E}_N$ on $\mathcal{B}(\mathcal{H}_{d_0})$ [Frigerio & Verri 1982; Wolf 2012]:
    *   There is a unique full-rank fixed point state $\rho_{fix}$ such that $\mathcal{E}_N(\rho_{fix}) = \rho_{fix}$.
    *   The eigenvalue 1 of $\mathcal{E}_N$ (as a superoperator) is simple (non-degenerate in the sense that its eigenspace is one-dimensional, spanned by $\rho_{fix}$).
    *   Let $\lambda_{gap}(\mathcal{E}_N)$ be the spectral radius of $\mathcal{E}_N$ when restricted to the invariant subspace of traceless operators $\mathcal{B}_0(\mathcal{H}_{d_0}) = \{X \in \mathcal{B}(\mathcal{H}_{d_0}) : \text{Tr}(X)=0\}$. For a primitive channel, it is strictly less than 1: $0 \le \lambda_{gap}(\mathcal{E}_N) < 1$. This $\lambda_{gap}$ governs the exponential rate of convergence of $\mathcal{E}_N^k(\rho)$ to $\rho_{fix}$ for any initial state $\rho$.

3.  **Contraction in Trace Distance:** For any two states $\rho_1, \rho_2$, let $\Delta = \rho_1 - \rho_2$. Since $\text{Tr}(\Delta)=0$, $\Delta \in \mathcal{B}_0(\mathcal{H}_{d_0})$. It is a standard result in the theory of primitive quantum channels that the action of $\mathcal{E}_N$ on this space of traceless operators is strictly contractive with respect to the trace norm, bounded by $\lambda_{gap}(\mathcal{E}_N)$ [Wolf 2012]. Specifically:
    $$
    \|\mathcal{E}_N(\rho_1 - \rho_2)\|_1 \le \lambda_{gap}(\mathcal{E}_N) \|\rho_1 - \rho_2\|_1.
    $$
    Dividing by 2 gives the trace distance contraction:
    $$
    D_{\mathrm{tr}}(\mathcal{E}_N(\rho_1), \mathcal{E}_N(\rho_2)) \le \lambda_{gap}(\mathcal{E}_N) D_{\mathrm{tr}}(\rho_1, \rho_2).
    $$

4.  **Identification of $f_{\mathrm{RID}}$:** We identify the maximal contractivity factor $f_{\mathrm{RID}}$ with this spectral quantity: $f_{\mathrm{RID}} \equiv \lambda_{gap}(\mathcal{E}_N)$. Since $\lambda_{gap}(\mathcal{E}_N) < 1$ for a primitive channel, we have $f_{\mathrm{RID}} < 1$. The factor cannot be negative by definition of operator norms, so $0 \le f_{\mathrm{RID}} < 1$.

This establishes the strict contractivity of the average 'Evolve' channel $\mathcal{E}_N$. QED

**E.4 Limited Information Capacity Across Boundaries due to ND–RID**

The average Evolve channel $\mathcal{E}_N$ is strictly contractive (Lemma E.1):
$$
f_{\mathrm{RID}}\bigl(\mathcal{E}_N\bigr)<1 ,
$$
a consequence of the irreversibility parameter $\varepsilon\ge\ln 2$.
That contractivity forces the channel’s classical capacity to be strictly below the ideal $\ln d_0$ for a $d_0$-dimensional system.

**E.4.1 Definitions for Channel Capacity**

To formalize this, we use standard definitions from quantum information theory (all logarithms are natural, giving units of nats, unless specified otherwise):

*   **Quantum Channel:** A quantum channel is a completely–positive, trace–preserving (CPTP) linear map $\Phi: \mathcal{B}(\mathcal{H}_{in}) \to \mathcal{B}(\mathcal{H}_{out})$, where $\mathcal{H}_{in}$ and $\mathcal{H}_{out}$ are finite-dimensional Hilbert spaces. For the ND–RID 'Evolve' channel $\mathcal{E}_N$, we have $\mathcal{H}_{in} = \mathcal{H}_{out} = \mathcal{H}_{d_0}$, the $d_0$-dimensional MPU Hilbert space. $\mathcal{B}(\mathcal{H})$ denotes the space of bounded linear operators on $\mathcal{H}$, and $\mathcal{S}(\mathcal{H}_{d_0})$ the set of density operators on $\mathcal{H}_{d_0}$.
*   **Trace-Norm Contractivity Factor $f_{\mathrm{RID}}(\Phi)$:** As implied by Lemma E.1, the contractivity factor is $f_{\mathrm{RID}}(\Phi) = \sup_{\rho,\sigma\in\mathcal S(\mathcal H_{d_0}), \rho\neq\sigma} \frac{D_{tr}(\Phi(\rho),\Phi(\sigma))}{D_{tr}(\rho,\sigma)}$, where $D_{tr}(\rho,\sigma)=\tfrac12\lVert\rho-\sigma\rVert_{1}$ is the trace distance. Lemma E.1 establishes $f_{\mathrm{RID}}(\mathcal{E}_N) < 1$. For context, when $\dim\mathcal{H}_{in}=\dim\mathcal{H}_{out}=d_0$, a channel $\Phi$ has $f_{\mathrm{RID}}(\Phi)=1$ if and only if $\Phi$ is a unitary channel (a surjective isometry) [Pérez-García et al. 2006].
*   **One–Shot and Regularized Classical Capacities:** For a channel $\Psi$, the one–shot Holevo capacity is
    $$
    \chi^{\ast}(\Psi):=\max_{\{p_{k},\rho_{k}\}} \Bigl[ S\Bigl(\sum_{k}p_{k}\Psi(\rho_{k})\Bigr) -\sum_{k}p_{k}S\bigl(\Psi(\rho_{k})\bigr) \Bigr]
    \tag{E.3a}
    $$
    where $S(\cdot)$ is the von Neumann entropy. The classical Shannon capacity $C(\Phi)$ is the regularized limit (HSW Theorem):
    $$
    C(\Phi):=\lim_{n\to\infty}\frac1n\chi^{\ast}(\Phi^{\otimes n})
    \tag{E.3b}
    $$
    It is always true that $\chi^{\ast}(\Phi)\le C(\Phi)\le\ln d_0$. For the PU framework, we are interested in the true information transmission rate $C(\mathcal{E}_N)$. The following theorem establishes that this rate is strictly less than the ideal maximum if the channel is contractive.


**Theorem E.2 (Fundamental Strict Bound on ND–RID Channel Capacity).**
Let $\mathcal{E}_N$ be the average 'Evolve' channel associated with an ND–RID process, acting on the $d_0$-dimensional MPU Hilbert space $\mathcal{H}_{d_0}$. If the trace-norm contractivity factor $f_{\mathrm{RID}}(\mathcal{E}_N) < 1$ (as established by Lemma E.1 due to $\varepsilon > 0$), then the classical Shannon capacity $C(\mathcal{E}_N)$ is strictly bounded below the ideal capacity:
$$
C(\mathcal{E}_N) < \ln d_0
\tag{E.3}
$$
The quantity $C_{max}(f_{RID})$ used in subsequent sections is defined as $C_{max}(f_{RID}) \equiv C(\mathcal{E}_N)$.

*Proof.*
Let $f := f_{\mathrm{RID}}(\mathcal{E}_N)$. By Lemma E.1, $f < 1$.
Assume, for contradiction, that $C(\mathcal{E}_N) = \ln d_0$.

By the *$d_{0}$-signal converse* or strong converse for classical channel coding [e.g. Holevo 1998; Winter 1999; König & Wehner 2009; Mosonyi & Ogawa 2017], a channel $\Phi$ that achieves the maximum possible classical capacity $C(\Phi) = \ln d_0$ must, for some block length $n_0 \ge 1$, be able to transmit $M = d_0^{n_0}$ messages reliably (or with vanishing error probability for large $n_0$). This implies the existence of $M$ input codeword states $\{\rho^{(n_0)}_k\}_{k=1}^M$ such that their corresponding $n_0$-copy output states under $\mathcal{E}_N^{\otimes n_0}$, i.e., $\{\sigma^{(n_0)}_k = \mathcal{E}_N^{\otimes n_0}(\rho^{(n_0)}_k)\}$, are (asymptotically) mutually orthogonal or perfectly distinguishable.
Orthogonality of the $n_0$-copy outputs implies $\|\mathcal E_N^{\otimes n_0}(\rho^{(n_0)}_k)-\mathcal E_N^{\otimes n_0}(\rho^{(n_0)}_l)\|_1=2$ for any two distinct input codewords $\rho^{(n_0)}_k,\rho^{(n_0)}_l$.
The trace-norm contractivity factor is monotone under tensor power: $f_{\mathrm{RID}}(\Phi^{\otimes n_0})\le f_{\mathrm{RID}}(\Phi)$ [Pérez-García et al. 2006].
Thus, $f_{\mathrm{RID}}(\mathcal{E}_N^{\otimes n_0}) \le f$.
Applying the definition of contractivity to the block channel $\mathcal{E}_N^{\otimes n_0}$ and the input codewords:
$$
\|\mathcal{E}_N^{\otimes n_0}(\rho^{(n_0)}_k) - \mathcal{E}_N^{\otimes n_0}(\rho^{(n_0)}_l)\|_1 \le f_{\mathrm{RID}}(\mathcal{E}_N^{\otimes n_0}) \|\rho^{(n_0)}_k - \rho^{(n_0)}_l\|_1
$$
Substituting the known distance for the orthogonal outputs (which is 2) and using $f_{\mathrm{RID}}(\mathcal{E}_N^{\otimes n_0}) \le f$ and $\|\rho^{(n_0)}_k - \rho^{(n_0)}_l\|_1 \le 2$:
$$
2 \le f \cdot 2
$$
This implies $1 \le f$.
But we know from Lemma E.1 that $f = f_{\mathrm{RID}}(\mathcal{E}_N) < 1$ due to the fundamental irreversibility of the ND–RID process.
This yields the contradiction $1 \le f < 1$.

Therefore, the assumption that $C(\mathcal{E}_N) = \ln d_0$ must be false. Consequently, if $f_{\mathrm{RID}}(\mathcal{E}_N) < 1$, then the classical capacity $C(\mathcal{E}_N)$ must be strictly less than $\ln d_0$.
This completes the proof. QED



**Corollary E.2 (Maximum Entropy per ND–RID Channel).** The maximum thermodynamic entropy $S_{channel}^{max}$ (in units of $k_B$), associated with the information degrees of freedom reliably transmitted by a single ND–RID channel across a boundary, is bounded by the channel capacity:
$$
S_{channel}^{max} \leq k_B C_{max}(f_{RID})
\tag{E.4}
$$
*Proof.* The maximum amount of reliably transmissible classical information through the channel is $C_{max}(f_{RID})$ nats (where $C_{max}(f_{RID}) \equiv C(\mathcal{E}_N)$ as per Theorem E.2). If this information is used to specify one of $M_{eff}$ effectively distinguishable states, then $C_{max}(f_{RID}) = \ln M_{eff}$. The maximum thermodynamic entropy associated with these $M_{eff}$ states is $S = k_B \ln M_{eff}$. Therefore, $S_{channel}^{max} = k_B C_{max}(f_{RID})$. Since this is the maximum *reliable* information, the entropy associated with it is bounded as stated. QED

**E.5 Geometric Scaling of Boundary Information Channels (Conditional Derivation)**

The derivation of the Area Law requires understanding how the number of effective independent information channels crossing a boundary scales with the boundary's area in the emergent regular spacetime. This scaling is a consequence of the geometric regularity established by Theorem 43.

**Theorem E.3 (Boundary Channel Density from Geometric Regularity).**
Conditional on the Necessary Emergence of Geometric Regularity (Theorem 43), consider the MPU network $\mathcal{N}$ whose emergent geometry is described by a D=4 dimensional manifold $(M, g_{\mu\nu})$ satisfying uniform volume growth and bounded Ricci curvature. Let $\mathcal{H} \subset M$ be a smooth, compact, 2-dimensional boundary surface (e.g., a cross-section of a causal horizon) with area $\mathcal{A} = \text{Area}(\mathcal{H})$. The total number of effective independent information channels $N_{eff_links}$ crossing this boundary $\mathcal{H}$ (representing the fundamental pathways for reliable information transfer via ND–RID interactions) scales linearly with its area $\mathcal{A}$ in the macroscopic limit ($\mathcal{A} \gg \delta^{2}$, where $\delta$ is the mean microscopic MPU spacing):
$$
N_{eff_links} = \sigma_{eff_link}\;\mathcal A\;+\;o(\mathcal A)
\tag{E.5}
$$
where $\sigma_{eff_link}$ is the effective surface density of independent information channels. This density is related to the underlying geometric density of potential links and the impact of correlations. Specifically:
*   Let $\sigma_{geom_link} = 1/(\eta \delta^2)$ be the purely geometric surface density of potential links based on MPU spacing $\delta$ and a packing/orientation factor $\eta$. Here $\eta$ captures the dependence on surface orientation and lattice/packing anisotropy: $\eta=1$ for a simple‑cubic packing with the surface normal aligned to a lattice axis, while for generic orientations or isotropic regular packings $\eta$ remains $\mathcal{O}(1)$ with small deviations around unity.
*   Correlations between the states and interactions of nearby MPUs reduce the number of *independent* degrees of freedom that contribute to the total information capacity across the boundary.
*   Let $\chi$ be the dimensionless correlation factor ($0 < \chi \le 1$) quantifying this reduction. $\chi=1$ represents fully independent channels, while $\chi<1$ reflects the loss of effective channel density due to correlations.
*   The effective density is therefore $\sigma_{eff_link} = \chi \, \sigma_{geom_link} = \chi / (\eta \delta^2)$. The precise value of $\chi$ depends on the equilibrium state of the MPU network (determined by PCE optimization) and is treated here as a parameter bounded between 0 and 1.

*Proof.* Geometric regularity (Theorem 43) ensures that on scales larger than the MPU spacing $\delta$, the network locally resembles a smooth D-dimensional manifold (here D=4). For a 2-dimensional surface $\mathcal{H}$ embedded in this manifold, the number of fundamental units (MPUs or links between them) piercing this surface is expected to scale with the area of the surface divided by the characteristic area occupied by one such unit or link.
1.  **Geometric Link Density:** If MPUs are arranged with an average spacing $\delta$, the number of MPUs per unit volume is $\sim 1/\delta^3$ (in 3D space). For a 2D surface, the number of links crossing it per unit area, $\sigma_{geom_link}$, would be proportional to $1/\delta^2$. The factor $\eta$ accounts for geometric details of packing and orientation relative to the surface (e.g., for a simple cubic lattice with spacing $\delta$, a surface normal to one axis would be pierced by $1/\delta^2$ links per unit area, so $\eta=1$).
2.  **Reduction due to Correlations:** If the MPUs or their interaction channels are correlated, not all geometric links represent independent information channels. The factor $\chi$ accounts for this effective reduction in degrees of freedom. For example, if blocks of $1/\chi$ geometric links are strongly correlated such that they effectively act as a single information channel, then the density of *independent* channels is reduced by $\chi$.
3.  **Linear Scaling:** Combining these, the density of effective independent channels is $\sigma_{eff_link} = \chi \sigma_{geom_link} = \chi / (\eta \delta^2)$. Since geometric regularity implies this density is uniform on average over macroscopic scales, integrating over the area $\mathcal{A}$ gives $N_{eff_links} = \sigma_{eff_link} \cdot \mathcal{A}$ as the leading term for large $\mathcal{A}$. Higher-order corrections $o(\mathcal{A})$ (e.g., boundary effects proportional to perimeter) become negligible for $\mathcal{A} \gg \delta^2$. QED

**E.6 Area Law from Entanglement Structure**

The horizon entropy-area relationship is derived here from fundamental principles of quantum information and many-body physics, independent of gravitational field equations. This establishes the area law as a consequence of the MPU network's quantum structure.

### E.6.1 Prerequisites: ND-RID Satisfies Quantum Many-Body Assumptions

**Lemma E.6.1 (ND-RID Locality and Clustering).**
The MPU network dynamics governed by ND-RID (Definition 27) satisfy the core assumptions required for quantum many-body area laws:

1. **Locality:** Interactions have finite range in the network metric $d_{\mathcal{N}}$ (Definition 35).

2. **Finite Lieb-Robinson Velocity:** Information propagation is bounded by $v_{LR} < \infty$ (established in Appendix F, Proposition F.1 from ND-RID channel contractivity $f_{RID} < 1$).

3. **Spectral Gap:** The average ND-RID channel $\mathcal{E}_N$ is strictly contractive (Lemma E.1), implying the existence of a spectral gap $\Delta_{gap} > 0$ in the effective MPU network Hamiltonian.

4. **Clustering:** Correlations decay exponentially with distance: $|\langle O_A O_B \rangle - \langle O_A \rangle \langle O_B \rangle| \le C e^{-d_{\mathcal{N}}(A,B)/\xi}$ for some correlation length $\xi < \infty$.

*Proof Sketch.* 

**Locality:** By construction, ND-RID acts on individual MPUs or nearest-neighbor pairs in the network (Definition 27). The interaction range is finite by network construction.

**Finite $v_{LR}$:** Appendix F (Proposition F.1) proves that the strictly contractive channel ($f_{RID} < 1$, Lemma E.1) bounds information velocity. The Lieb-Robinson velocity satisfies:

$$
v_{LR} \le \frac{r_0}{\tau}\ln\!\Big[c_0\,z_{max}\,K^{2D}\Big] < \infty
$$

where $r_0$ is the interaction radius, $\tau$ is the MPU cycle time (Theorem 29), $z_{max}$ is the maximum network degree, and $D$ is the circuit depth. Since $f_{RID} < 1$ strictly (from $\varepsilon > 0$), this is finite.

**Spectral Gap:** Contractivity of $\mathcal{E}_N$ with factor $f_{RID} < 1$ (Lemma E.1) implies the spectral radius of $\mathcal{E}_N$ restricted to traceless operators is strictly less than unity. For a quantum channel $\mathcal{E}_N$, the generator $\mathcal{L}_N$ defined by $\mathcal{E}_N = e^{\tau \mathcal{L}_N}$ (where $\tau$ is the MPU cycle time) has spectral properties directly related to the channel contractivity. Specifically, the contractivity factor $f_{RID} = \lambda_{gap}(\mathcal{E}_N)$ (Definition from Lemma E.1) translates to a gap in the generator spectrum:
$$
\Delta_{gap} = -\frac{1}{\tau}\ln f_{RID} > 0
$$
This provides a positive lower bound on the energy gap of the effective Hamiltonian governing MPU dynamics.

**Clustering:** Standard result: Finite $v_{LR}$ + spectral gap implies exponential clustering of correlations [Hastings & Koma, Commun. Math. Phys. 265, 781 (2006)]. QED

### E.6.2 Theorem E.4' (Entanglement Entropy Area Scaling)

**Theorem E.4' (Entanglement Entropy Area Scaling).**
Consider a spatial region $A$ with smooth boundary $\partial A$ in the emergent geometric structure (conditional on Theorem 43). Let $\rho_A = \text{Tr}_{\bar{A}}[\rho_{total}]$ be the reduced density matrix for region $A$, where $\rho_{total}$ is the global MPU network ground state. The entanglement entropy satisfies:

$$
S_{ent}(A) := -\text{Tr}[\rho_A \ln \rho_A] = \eta_{ent} \cdot |\partial A| + \mathcal{O}(1)
\tag{E.6a}
$$

where $|\partial A|$ is the boundary area and $\eta_{ent}$ is a constant entropy density determined by the local MPU interaction structure.

*Proof (Hastings-Type Bound).*

The proof follows the general strategy of Hastings [Hastings, J. Stat. Mech. P08024 (2007)] for gapped local Hamiltonians:

**Step 1 (Boundary Law Generic for Gapped Systems):** For any quantum many-body system satisfying:
- Local interactions (finite range $r$)
- Spectral gap $\Delta > 0$
- Exponential clustering

the ground state entanglement entropy for a region $A$ is bounded:

$$
S_{ent}(A) \le C(\Delta, r, D) \cdot |\partial A|
$$

where $C(\Delta, r, D)$ depends on the gap, interaction range, and spatial dimension $D$, but is independent of the system size or $|A|$.

**Step 2 (Apply to MPU Network):** By Lemma E.6.1, the MPU network satisfies all required conditions:
- Locality: ND-RID finite range
- Gap: $\Delta_{gap} = -\tau^{-1}\ln f_{RID} > 0$  
- Clustering: Proven consequence

Therefore, Hastings' theorem applies directly to the MPU network ground state:

$$
S_{ent}(A) \le C_{MPU} \cdot |\partial A|
$$

**Step 3 (Saturation at PCE Equilibrium):** The PCE optimization (Definition 15) drives the system toward maximal information efficiency subject to physical constraints. For boundary-crossing correlations, the entanglement entropy represents the minimal quantum information required to specify the reduced state of region $A$. PCE favors configurations that maximize this boundary entropy (subject to energy and interaction constraints) as it represents maximal exploitation of available quantum resources. This optimization pressure drives the entanglement entropy toward saturation of the Hastings bound:

$$
S_{ent}(A) = \eta_{ent} \cdot |\partial A| + \mathcal{O}(1)
$$

where $\eta_{ent} = C_{MPU}$ at equilibrium. The $\mathcal{O}(1)$ term represents sub-leading corrections (corners, topology) that vanish in the large-area limit. QED

### E.6.3 Theorem E.5 (Thermodynamic Coefficient Matching)

The area law coefficient $\eta_{ent}$ is not arbitrary but fixed by requiring consistency between the quantum entanglement structure and local thermodynamics on causal horizons.

**Theorem E.5 (Bekenstein-Hawking Coefficient from Local Clausius Consistency).**
To satisfy local thermodynamic consistency—specifically, that the Clausius relation $\delta S = \delta Q / T$ holds for all local Rindler horizons in the emergent spacetime—the entanglement entropy density must equal the Bekenstein-Hawking value:

$$
\boxed{\eta_{ent} = \frac{k_B c^3}{4 G \hbar} \quad \text{(SI units)}, \quad \eta_{ent} = \frac{1}{4G} \quad \text{(natural units)}}
\tag{E.6b}
$$

This identifies the gravitational constant $G$ as an emergent quantity determined by the MPU network's entanglement structure:

$$
G = \frac{k_B c^3}{4\hbar\,\eta_{ent}}
\tag{E.6c}
$$

*Proof (Jacobson Logic).*

The proof uses the fact that certain thermodynamic and quantum field theory results on curved spacetime are *kinematic* (geometry-dependent) rather than *dynamic* (field-equation-dependent), allowing us to constrain the coefficient without assuming the Einstein equations.

**Step 1 (Unruh Temperature - Kinematic Result):** For any local causal horizon (e.g., Rindler) with surface gravity $\kappa$, an accelerating observer measures a thermal bath at the Unruh temperature:

$$
T_U = \frac{\hbar \kappa}{2\pi k_B c}
\tag{E.6d}
$$

This result follows from quantum field theory in curved spacetime (QFTCS) and depends only on the geometric structure (the existence of a horizon with surface gravity $\kappa$), not on the Einstein field equations. This is kinematic, not dynamic.

**Step 2 (Entanglement First Law - Kinematic Result):** For a small perturbation $\delta\rho$ to the vacuum state across a causal horizon $\mathcal{H}$, the first law of entanglement entropy [Jacobson, Phys. Rev. Lett. 116, 201101 (2016); Casini, Huerta & Myers, J. High Energy Phys. 05, 036 (2011)] relates entropy change to expectation value change:


$$
\delta S_{ent} = \delta \langle K \rangle
\tag{E.6e}
$$

where $K$ is the "modular Hamiltonian" generating boosts normal to $\mathcal{H}$. For local perturbations, this becomes:

$$
\delta S_{ent} = \frac{2\pi}{\hbar \kappa} \delta\langle T_{\mu\nu} \rangle \chi^\mu d\Sigma^\nu = \frac{\delta Q}{T_U}
\tag{E.6f}
$$

where $\delta Q := \delta\langle T_{\mu\nu}\rangle \chi^\mu d\Sigma^\nu$ is the energy flux through the horizon and $\chi^\mu$ is the boost Killing vector. This entanglement first law is also kinematic—it follows from the structure of QFTCS and local quantum statistical mechanics, independent of the specific dynamics (EFE).

**Step 3 (Geometric Entropy-Area Relation):** From Theorem E.4', we have:

$$
S_{ent}(\mathcal{H}) = \eta_{ent} \cdot \mathcal{A}_{\mathcal{H}}
$$

where $\mathcal{A}_{\mathcal{H}}$ is the horizon area. For an infinitesimal change:

$$
\delta S_{ent} = \eta_{ent} \cdot \delta \mathcal{A}
\tag{E.6g}
$$

**Step 4 (Consistency Requirement):** Equating the two expressions for $\delta S_{ent}$ from (E.6f) and (E.6g):

$$
\eta_{ent} \cdot \delta \mathcal{A} = \frac{\delta Q}{T_U}
$$

This is the *local Clausius relation* $\delta S = \delta Q / T$, which must hold for thermodynamic consistency.

**Step 5 (Derive $\eta_{ent}$ Value):** The Clausius relation must hold for *every* local horizon, not just specific geometries. This universality forces:

$$
\eta_{ent} = \frac{k_B c^3}{4\hbar\,G}
$$

The derivation (following [Jacobson, Phys. Rev. Lett. 75, 1260 (1995)], Section 12 of main text, Theorem 12.1) proceeds by:
1. Applying the Clausius relation to an infinitesimal Rindler horizon
2. Using the Raychaudhuri equation (kinematic, relates area change to stress-energy)
3. Requiring consistency for arbitrary $\delta Q$ and $\kappa$
4. Extracting the unique coefficient

**Why This is Not Circular:**
- Unruh temperature (E.6d): Kinematic (from QFTCS)
- Entanglement first law (E.6f): Kinematic (from QFTCS modular theory)
- Area law (E.6a): From quantum many-body physics (Theorem E.4')
- Raychaudhuri equation: Kinematic (from differential geometry)

**What is NOT assumed:**
- Einstein field equations
- Specific value of $G$ (we derive it)
- Pre-existing horizon entropy formula

**What IS assumed:**
- Emergent smooth geometry exists (Theorem 43)
- QFTCS applies on emergent geometry (consistency requirement)
- Local thermodynamic equilibrium (Postulate 4)

The gravitational constant $G$ emerges as the unique value ensuring consistency between the MPU network's quantum entanglement structure and local thermodynamic reasoning. QED

### E.6.4 Connection to Channel Capacity Derivation

The coefficient $\eta_{ent}$ from quantum entanglement structure (Theorem E.4') must be consistent with the channel-based derivation from Theorem E.3. Specifically, from Theorem E.3:

$$
\sigma_{eff\_link} = \frac{\chi}{\eta \delta^2}, \quad S_{max} = \sigma_{eff\_link} \cdot C_{max}(f_{RID}) \cdot k_B \cdot \mathcal{A}
$$

From Theorem E.5:
$$
\eta_{ent} = \frac{1}{4G} \quad \text{(natural units)}
$$

Consistency requires:
$$
\frac{\chi C_{max}(f_{RID})}{\eta \delta^2} = \frac{1}{4G}
$$

This relationship connects the microscopic MPU parameters ($\delta, \chi, \eta, C_{max}$) to the emergent gravitational constant $G$, exactly as derived in the operational formulation. The entanglement-based derivation provides the physical justification for why this relationship must hold, grounding it in quantum information theory rather than purely operational counting.


### E.6.5 Derivation of the Horizon Entropy Area Law (Unified Synthesis)

We synthesize the limit on entropy per channel (Corollary E.2) with the geometric scaling of the number of *effective independent* channels (Theorem E.3) to derive the Area Law (Theorem 49).

**Theorem E.6 (Area Law for Horizon Entropy, cf. Thm 49).**
Conditional on emergent geometric regularity (Theorem 43) and the resulting linear scaling of effective boundary channels with area (Theorem E.3), the maximum thermodynamic entropy $S_{max}$ associated with the MPU degrees of freedom constituting or crossing a causal horizon $\mathcal{H}$ with area $\mathcal{A}$ scales linearly with the area. The entanglement-based derivation (Theorem E.4') establishes that $S_{ent} = \eta_{ent} \mathcal{A}$ with $\eta_{ent} = 1/(4G)$. The channel-based approach shows this maximum entropy corresponds to saturating the capacity of the effective independent channels:
$$
S_{max}(\mathcal{A}) = N_{eff_links} \cdot S_{channel}^{max} = (\sigma_{eff_link} \mathcal{A}) \cdot (k_B C_{max}(f_{RID}))
$$
Substituting $\sigma_{eff_link} = \chi / (\eta \delta^2)$:
$$
S_{max}(\mathcal{A}) = k_B \left(\frac{\chi C_{max}(f_{RID})}{\eta \delta^2}\right) \mathcal{A}
\tag{E.6}
$$
To match the universal Bekenstein-Hawking form $S_{BH} = k_B \mathcal{A} / (4 L_P^2)$ (where $L_P^2 = G\hbar/c^3$ is the squared Planck length), we identify the coefficients (fixing $G$ in terms of microscopic MPU parameters; this is not an additional assumption):
$$
\frac{\chi C_{max}(f_{RID})}{\eta \delta^2} = \frac{1}{4 L_P^2} = \frac{c^3}{4 G \hbar}
\tag{E.7}
$$
This identification implies the standard form of the area law:
$$
S_{max}(\mathcal{A}) = \frac{k_B c^3 \mathcal{A}}{4 G \hbar} = \frac{k_B \mathcal{A}}{4 L_P^2}
\tag{E.8}
$$
and yields an expression for the emergent gravitational constant $G$ in terms of the fundamental MPU parameters encoded in spacing ($\delta$), packing ($\eta$), correlations ($\chi$), and ND–RID channel capacity ($C_{max}$, which is limited by $\varepsilon$ via $f_{RID}$):
$$
G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{max}(f_{RID})}
\tag{E.9}
$$
*Proof.*
1.  **Total Maximum Entropy:** The total entropy is the sum over effective independent channels, $S_{max} = N_{eff_links} \cdot S_{channel}^{max}$, assuming each channel operates at its maximum capacity for reliable information transfer.
2.  **Substitution of Components:** From Theorem E.3, $N_{eff_links} = (\chi / (\eta \delta^2)) \mathcal{A}$. From Corollary E.2, $S_{channel}^{max} = k_B C_{max}(f_{RID})$. Substituting these into the expression for $S_{max}$ directly yields Equation (E.6).
3.  **Identification with Bekenstein-Hawking Form:** The Bekenstein-Hawking entropy for a horizon of area $\mathcal{A}$ is $S_{BH} = k_B \mathcal{A} / (4 L_P^2)$, where $L_P^2 = G\hbar/c^3$. For the PU framework's emergent entropy (Equation E.6) to match this empirically established form, their coefficients of $\mathcal{A}$ must be equal. This leads to Equation (E.7).
4.  **Emergent G:** Rearranging Equation (E.7) to solve for $G$ yields Equation (E.9). It is important to note that this step fixes the absolute value of $G$ by identifying the microscopic information density of the PU substrate with the Bekenstein-Hawking coefficient $1/(4L_P^2)$. The thermodynamic derivation of the Einstein Field Equations in Section 12, by contrast, only requires that horizon entropy is *proportional* to area; this identification provides the specific constant of proportionality.
5.  **Interpretation:** The Horizon Entropy Area Law emerges as a direct consequence of: (a) the fundamental limit on information capacity per ND–RID channel ($C_{max} < \ln d_0$, Theorem E.2), which itself stems from the irreversibility cost $\varepsilon \ge \ln 2$ (Theorem 31); and (b) the geometric fact that the number of such independent channels crossing a boundary scales with the boundary's area (Theorem E.3, conditional on emergent regularity). The constant of proportionality, which defines the Planck scale and thus $G$, is thereby fixed by the microscopic parameters of the MPU network ($\delta, \eta, \chi, C_{max}$). 

**E.6.1 Explicit Derivation of the Bekenstein-Hawking Coefficient $1/4$**

Theorem E.6 establishes $S_{max} = k_B \left(\frac{\chi C_{max}(f_{RID})}{\eta \delta^2}\right) \mathcal{A}$. Equation (E.9) defines $G$ in terms of these same microscopic parameters: $G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{max}(f_{RID})}$.
We can solve Equation (E.9) for the group of microscopic parameters:
$$
\frac{\chi C_{max}(f_{RID})}{\eta \delta^2} = \frac{c^3}{4 \hbar G}
\tag{E.10}
$$
Now, substitute this expression (E.10) back into the entropy formula (E.6):
$$
S_{max}(\mathcal{A}) = k_B \left( \frac{c^3}{4 \hbar G} \right) \mathcal{A}
\tag{E.11}
$$
Using the definition of Planck length $L_P^2 = G\hbar/c^3$, we can rewrite $c^3/(G\hbar) = 1/L_P^2$. Thus:
$$
S_{max}(\mathcal{A}) = k_B \frac{\mathcal{A}}{4 L_P^2}
\tag{E.12}
$$
This is the Bekenstein-Hawking formula with the explicit coefficient $1/4$. This derivation shows that the $1/4$ is not an additional assumption but arises self-consistently if the emergent gravitational constant $G$ is indeed determined by the microscopic MPU network parameters as per Equation (E.9). The argument relies on the universality of the information-theoretic approach: the density of information channels times the capacity per channel gives the total information (entropy) capacity per unit area, and this same density also sets the scale of $G$.

**Remark E.1 (Unit Cell Interpretation of Horizon Entropy from SPAP Cost)**

The derivation of the Area Law (Theorem E.6 / main text, Theorem 49) and the emergent gravitational constant $G$ (Equation E.9) is based on the effective surface density of independent information channels ($\sigma_{eff_link}$) and the capacity per channel ($C_{max}$). An alternative, complementary perspective on the origin of the $1/4$ coefficient in the Bekenstein-Hawking formula can be obtained by considering the fundamental entropy unit associated with the MPU's self-referential processing.

As established in Appendix J (Theorem J.1, proving main text Theorem 31), each 'Evolve' interaction cycle (main text, Definition 27) involving non-trivial self-referential information processing (the SPAP update cycle) incurs a minimal irreducible dimensionless entropy cost $\varepsilon = \ln 2$ nats. Let this fundamental quantum of entropy generation be denoted $\Delta S_{\text{SPAP}} = \ln 2$.

$$
\Delta S_{\text{SPAP}} = \ln 2
\tag{E.13}
$$


If we consider this $\Delta S_{\text{SPAP}}$ as the fundamental entropy unit associated with each effective degree of freedom contributing to the horizon entropy, we can define a "minimal horizon cell area," $\Delta\mathcal{A}_{cell}$, as the area whose Bekenstein-Hawking entropy (using the already derived form $S=\mathcal{A}/(4G)$ from Theorem E.6) is precisely this quantum:
$$
\Delta S_{\text{SPAP}} = \frac{\Delta\mathcal{A}_{cell}}{4G} \quad \text{(in natural units where } \hbar=c=k_B=1 \text{)}.
\tag{E.13a}
$$
Substituting $\Delta S_{\text{SPAP}} = \ln2$:
$$
\ln2 = \frac{\Delta\mathcal{A}_{cell}}{4G} \quad \Rightarrow \quad \Delta\mathcal{A}_{cell} = 4G\ln2.
\tag{E.13b}
$$
The total horizon entropy $S$ can then be conceptualized as arising from $N_{cells} = \mathcal{A}/\Delta\mathcal{A}_{cell}$ such independent "SPAP-entropy cells" tiling the horizon:
$$
S = N_{cells} \cdot \Delta S_{\text{SPAP}} = \left( \frac{\mathcal{A}}{4G\ln2} \right) \ln2 = \frac{\mathcal{A}}{4G}.
\tag{E.13c}
$$
This "tiling" argument self-consistently reproduces the $S=\mathcal{A}/(4G)$ formula. It provides an interpretation where the horizon entropy is composed of fundamental $\ln 2$ units, each associated with an area $4G\ln2$. The value of $G$ itself is determined by the more fundamental MPU parameters ($\delta, C_{max}, \eta, \chi$) as per Equation (E.9). While $C_{\max}(f_{\mathrm{RID}})$ is bounded by $\ln d_0$ (Theorem E.2), PCE optimisation plausibly drives it near $\ln2$ for consistency with this unit cell interpretation in some regimes; this assumption is used here only illustratively to connect to $\Delta S_{SPAP}$ and is not required for the main derivation of the Area Law form.

The consistency of this unit cell interpretation with the primary derivation in Theorem E.6 requires an alignment between the "entropy per effective channel" ($C_{max}(f_{RID})$ in nats, from Theorem E.2) and this fundamental SPAP cost ($\ln 2$ nats). Specifically, the product of channel density and capacity per channel must yield the same overall entropy density: $\sigma_{eff_link} \cdot C_{max}(f_{RID}) = (\text{density of SPAP cells}) \cdot \ln 2$. Since density of SPAP cells is $1/\Delta\mathcal{A}_{cell} = 1/(4G\ln2)$, this requires $\sigma_{eff_link} \cdot C_{max}(f_{RID}) = 1/(4G)$. This is precisely what Equation (E.7) (and its natural units version, Equation E.10) states, confirming the structural consistency between the two viewpoints. Essentially, PCE optimizes the network such that the effective boundary channel capacity $C_{max}$ (influenced by $\varepsilon=\ln 2$) and the effective channel density $\sigma_{eff_link}$ (influenced by $\delta$) combine to yield the emergent value of $G$ and thus the Bekenstein-Hawking entropy with the standard $1/4$ coefficient.

**E.7 PCE-Derived Planck-MPU Scale Relation**

The relationship between the emergent gravitational constant $G$ and the microscopic MPU parameters (Equation E.9) is not merely a consistency requirement but is quantitatively fixed by the framework's core optimization principle. As rigorously derived in Appendix Q, the Principle of Compression Efficiency (PCE, Definition 15) dictates the optimal values for the network parameters that determine the scale ratio $\delta/L_P$.

The derivation proceeds by analyzing the partitioning of the MPU's total information potential, $\ln(d_0)$, as a resource allocation problem. PCE optimization requires that the MPU's finite information budget be optimally divided between the cost of internal self-referential processing ($\varepsilon$) and the capacity for external communication ($C_{max}$). As derived in Appendix Q, this leads to the PCE-optimal channel capacity being the total potential minus the irreducible processing cost:
$$
C_{max}^{*} = \ln(d_0) - \varepsilon
\tag{E.14}
$$
Using the framework's logically-derived values for the fundamental MPU parameters, `d₀=8` (from the Horizon Constant $K_0=3$ bits, Theorem 23) and `ε=ln(2)` (from the minimal SPAP cycle cost, Theorem 31), the PCE-optimal channel capacity is calculated to be:
$$
C_{max}^{*} = \ln(8) - \ln(2) = 2\ln(2)
\tag{E.15}
$$
Substituting this result, along with PCE-optimized values for the correlation and packing factors (`χ*` and `η`, which are `O(1)` constants), into the scale relation derived from Equation E.9 (`δ²/L_P² = 4 χ C_max / η`) yields a direct, quantitative prediction for the ratio of the MPU spacing to the Planck length. For the idealized case (`χ*≈1`, `η≈1`), this ratio is:
$$
\frac{\delta}{L_P} \approx \sqrt{8\ln 2} \approx 2.355
\tag{E.16}
$$
This result demonstrates that the relationship between the fundamental microscopic scale `δ` and the emergent Planck scale `L_P` is a calculable, `O(1)` constant determined by the information-theoretic necessities of the MPU's predictive cycle, providing strong evidence for the internal consistency of the framework. The full derivation is provided in Appendix Q.



## E.8 Bulk Reconstruction from Boundary Channels

The area law (Theorem 49) establishes that boundary entropy scales with area. This section derives the reconstruction of bulk information from boundary data, completing the holographic structure.

### E.8.1 The Reconstruction Problem

**Definition E.8.1 (Bulk-Boundary Correspondence).** For a region $A$ with boundary $\partial A$ in the emergent geometry, the bulk-boundary correspondence is an encoding map:

$$\Phi: \mathcal{H}_{\text{bulk}}(A) \to \mathcal{H}_{\text{boundary}}(\partial A)$$

that isometrically embeds bulk degrees of freedom into boundary data up to the channel capacity limit.

**Theorem E.8.1 (Bulk Reconstruction from ND-RID Channels).** The bulk state in region $A$ can be reconstructed from the boundary channel states on $\partial A$ up to the channel capacity bound.

*Proof.*

**Step 1 (Channel decomposition).** By Theorem E.3, the boundary $\partial A$ hosts $N_{\text{channels}} = \sigma_{\text{eff}} \cdot |\partial A|$ effective independent ND-RID channels connecting interior to exterior, where $\sigma_{\text{eff}} = \chi/(\eta\delta^2)$ is the effective channel density. The correlation factor $\chi \leq 1$ accounts for correlations between neighboring channels, ensuring the count reflects genuinely independent degrees of freedom.

**Step 2 (Information encoding).** The boundary degrees of freedom collectively encode information about the bulk. While the full boundary state $\rho_{\partial A}$ may exhibit correlations between channel subsystems, the effective information capacity for bulk-to-exterior communication is determined by the $N_{\text{channels}}$ independent modes identified by the correlation analysis of Theorem E.3.

**Step 3 (Bulk-boundary entanglement).** The bulk state $\rho_A$ and environment state $\rho_{\bar{A}}$ are entangled through correlations mediated by ND-RID interactions across the boundary. The primitivity of $\mathcal{E}_N$ (Lemma E.1) ensures a unique full-rank fixed point, implying that correlations between $A$ and $\bar{A}$ are mediated entirely through the boundary channels. This locality structure is consistent with boundary-mediated conditional independence; in the ideal limit of strong subadditivity saturation it becomes a quantum Markov chain [Hayden et al. 2004], and we bound the mutual information $I(A:\bar{A})$ by the total capacity of boundary channels.

**Step 4 (Operator reconstruction).** For a bulk observable $\mathcal{O}_A$ supported in $A$, the boundary reconstruction $\widetilde{\mathcal{O}}_{\partial A}$ is defined through the Heisenberg-picture dual of the encoding channel. Let $\mathcal{N}: \mathcal{B}(\mathcal{H}_A) \to \mathcal{B}(\mathcal{H}_{\partial A})$ denote the encoding channel induced by the ND-RID structure. The reconstructed boundary operator is:

$$\widetilde{\mathcal{O}}_{\partial A} := \mathcal{N}^{\dagger}(\mathcal{O}_A)$$

where $\mathcal{N}^{\dagger}$ is the adjoint (Heisenberg-picture) channel satisfying:

$$\text{Tr}\left(\mathcal{O}_A \cdot \rho_A\right) = \text{Tr}\left(\mathcal{N}^{\dagger}(\mathcal{O}_A) \cdot \mathcal{N}(\rho_A)\right)$$

for all states $\rho_A$ in the code subspace $\mathcal{C} \subseteq \mathcal{H}_A$, where $\mathcal{C}$ is the subspace of bulk states with entropy $S(\rho_A) \leq C_{\text{total}}$ that can be faithfully encoded by the boundary channels. This adjoint relation ensures expectation values are preserved under the encoding-reconstruction pair.

**Step 5 (Capacity bound).** The ND-RID channel $\mathcal{E}_N$ is primitive with strictly positive reset component (Equation E.2a), ensuring strict contractivity $f_{\text{RID}} < 1$ (Lemma E.1). By Theorem E.2, the classical capacity of each channel is strictly bounded. The total capacity across the boundary satisfies:

$$C_{\text{total}} \leq N_{\text{channels}} \cdot C_{\max}(f_{\text{RID}})$$

where $C_{\max}(f_{\text{RID}}) < \ln d_0$ is the single-channel capacity bound (Theorem E.2).

**Step 6 (Reconstruction condition).** High-fidelity reconstruction is achievable when $S(\rho_A) < C_{\text{total}}$, as guaranteed by the quantum channel coding theorem [Lloyd 1997; Shor 2002; Devetak 2005]. This condition is satisfied for regions obeying the area law, since by Theorem E.6:

$$S(\rho_A) \leq \frac{|\partial A|}{4G} = N_{\text{channels}} \cdot \frac{1}{4G\sigma_{\text{eff}}}$$

The coefficient matching established in Theorem E.5 ensures $C_{\max}(f_{\text{RID}}) \cdot \sigma_{\text{eff}} = 1/(4G)$, so $C_{\text{total}} \geq S(\rho_A)$ at the entropy bound. ∎

### E.8.2 Reconstruction Without AdS

**Theorem E.8.2 (Channel-Capacity Holography).** The bulk reconstruction map exists for any geometry satisfying:
1. Geometric regularity (Theorem 43)
2. Area-law entropy scaling (Theorem 49)
3. ND-RID channel structure (Definition 27)

No assumption of AdS geometry, conformal boundary, or large-$N$ gauge theory is required.

*Proof.*

**Step 1 (Local reconstruction).** For any point $p$ in the bulk, consider a small ball $B_\epsilon(p)$ of radius $\epsilon$. The boundary $\partial B_\epsilon$ has area $\mathcal{A} = 4\pi\epsilon^2$ (in the locally flat approximation valid for $\epsilon \ll R_{\text{curv}}$) and hosts $N = \sigma_{\text{eff}} \cdot \mathcal{A} \sim \epsilon^2/(\eta\delta^2)$ effective channels.

**Step 2 (Encoding capacity).** The total channel capacity is:

$$C_{\text{total}} = N \cdot C_{\max}(f_{\text{RID}}) = \frac{\chi \cdot C_{\max}(f_{\text{RID}})}{\eta \delta^2} \cdot 4\pi\epsilon^2$$

Using $C_{\max}(f_{\text{RID}}) = \ln(d_0) - \varepsilon = 2\ln 2$ (Equation E.15) and $\delta^2/L_P^2 = 8\ln 2$ (Appendix Q, Equation Q.18) with $\chi = \eta = 1$ at PCE equilibrium:

$$C_{\text{total}} = \frac{2\ln 2}{8\ln 2 \cdot L_P^2} \cdot 4\pi\epsilon^2 = \frac{\pi\epsilon^2}{L_P^2}$$

The maximum bulk entropy from the area law is $S_{\max} = \mathcal{A}/(4L_P^2) = \pi\epsilon^2/L_P^2$. Thus $C_{\text{total}} = S_{\max}$: the channel capacity exactly saturates the entropy bound, enabling reconstruction at the holographic limit for $\epsilon \gg L_P$.

**Step 3 (Nested reconstruction).** For a larger region $A$, decompose into nested shells:

$$A = \bigcup_{n=0}^{\lfloor R/\epsilon \rfloor} \text{Shell}_n$$

where $\text{Shell}_n$ is the annulus between radii $n\epsilon$ and $(n+1)\epsilon$.

Each shell's interior can be reconstructed from its boundary via Step 1. Iterating from the outermost shell inward, with error bounded by the capacity surplus at each step, reconstructs the entire bulk.

**Step 4 (Independence from global geometry).** The reconstruction uses only local properties:
- Local channel density $\sigma_{\text{eff}}$ (from geometric regularity, Theorem 43)
- Local capacity bound $C_{\max}(f_{\text{RID}})$ (from ND-RID structure, Theorem E.2)
- Local entropy bound (from area law, Theorem 49)

No global geometric assumptions (asymptotic flatness, negative cosmological constant, conformal boundary) enter the construction. ∎

*Remark (Distinction from AdS/CFT).* The holography established here differs fundamentally from AdS/CFT correspondence [Maldacena 1999]. AdS/CFT posits a duality between quantum gravity in anti-de Sitter space and conformal field theory on its boundary, with bulk reconstruction proceeding via the Ryu-Takayanagi formula [Ryu & Takayanagi 2006] and entanglement wedge reconstruction [Dong et al. 2016]. The present construction requires neither AdS geometry nor conformal field theory; it follows solely from ND-RID channel capacity limits and geometric regularity. The two approaches may be complementary descriptions in contexts where both apply.

**Corollary E.8.1 (Emergent Holography).** Holography is not an additional principle but a consequence of the derivation chain:

$$\text{ND-RID channels} + \text{Geometric regularity} + \text{Finite capacity} \Rightarrow \text{Area law} \Rightarrow \text{Bulk reconstruction}$$

The bulk contains no independent information beyond what is encoded in boundary channels. Volume is an emergent description of nested boundary structures.

**Corollary E.8.2 (Resolution Limit).** Bulk reconstruction has resolution limit $\sim L_P$. Finer structure cannot be encoded because:
- Channel spacing is $\delta = \sqrt{8\ln 2} \cdot L_P \approx 2.355 \cdot L_P$ (Appendix Q, Equation Q.18)
- Each channel carries finite capacity $C_{\max}(f_{\text{RID}}) = 2\ln 2$ nats (Equation E.15)
- Sub-Planckian features would require encoding $> C_{\max}$ bits per channel

This provides an information-theoretic derivation of the Planck-scale resolution limit, independent of gravitational arguments.

## E.8.3 Holographic Saturation as PCE Attractor

### E.8.3.1 Introduction

The preceding sections established that the entropy associated with a causal boundary is bounded by the Bekenstein-Hawking area law $S \leq \mathcal{A}/4G$ (Theorem 49), derived from the finite channel capacity $C_{max} < \ln d_0$ of ND-RID interactions (Theorem E.2). This section demonstrates a stronger result: the Principle of Compression Efficiency (PCE, Definition 15) does not merely permit boundary-area scaling of entropy but *dynamically selects* it as the unique stable equilibrium. We prove that PCE dynamics drive the system toward holographic saturation, establishing $S = \mathcal{A}/4G$ as an attractor of the PCE potential landscape.

The progression from bounds to attractor completes the logical arc of the thermodynamic derivations:

| Section | Result | Status |
|---------|--------|--------|
| E.2 | $\varepsilon \geq \ln 2$ (irreversibility) | Bound |
| E.3 | $f_{RID} < 1$ (contractivity) | Bound |
| E.4 | $C_{max} < \ln d_0$ (capacity limit) | Bound |
| E.6 | $S \leq \mathcal{A}/4G$ (area law) | Bound |
| **E.8.3** | $S \to \mathcal{A}/4G$ (saturation) | **Attractor** |

### E.8.3.2 Bulk vs. Boundary Information Storage

Consider a spatial region $\mathcal{R}$ with boundary $\partial\mathcal{R}$ of area $\mathcal{A}$, containing a configuration of MPUs storing total accessible information $I_{tot}$. The information may be encoded in two qualitatively distinct ways:

**Definition E.8.3.1 (Encoding Modes).**
- **Bulk encoding:** Information distributed throughout the interior of $\mathcal{R}$, scaling with volume $\mathcal{V}$.
- **Boundary encoding:** Information localized to degrees of freedom at or near $\partial\mathcal{R}$, scaling with area $\mathcal{A}$.

We analyze the PCE cost of each encoding mode for fixed total information $I_{tot}$.

### E.8.3.3 Derivation of the Retrieval Cost Coefficient from PCE Potential

Before analyzing bulk versus boundary encoding costs, we derive the retrieval cost coefficient $\gamma_{ret}$ from the fundamental PCE potential structure (Definition D.1).

**Lemma E.8.3.1 (Retrieval Cost Coefficient from $V_{prop}$).**
The cost coefficient for retrieving information at depth $r$ from the boundary, denoted $\gamma_{ret}$, is determined by the propagation cost structure $V_{prop}$ (Definition D.1) and the fundamental ND-RID parameters:
$$
\gamma_{ret} = \frac{\varepsilon}{\delta \cdot C_{max}}
\tag{E.8.3a}
$$
where $\varepsilon \geq \ln 2$ is the minimum entropy cost per ND-RID interaction (Theorem 31), $\delta$ is the mean MPU spacing, and $C_{max} < \ln d_0$ is the channel capacity (Theorem E.2).

*Proof.*

**Step 1 (Link Cost from $V_{prop}$).** From Definition D.1, the propagation cost for a link $(u,v)$ is:
$$
V_{prop}^{(u,v)} = \langle \Phi(w_{uv}) \rangle_{\rho(x)}
$$
where $\Phi(w_{uv})$ scales with the information rate required for coherence, penalized by finite channel capacity. The link weight $w_{uv}$ is related to ND-RID fidelity $f_{RID}$ and cost $\varepsilon$ (Definition 35).

**Step 2 (Minimum Link Cost).** Each ND-RID interaction across a link incurs the irreducible entropy cost $\varepsilon \geq \ln 2$ (Theorem 31, Appendix J). For information retrieval requiring one bit of mutual information, the minimum thermodynamic cost per link is:
$$
\Phi_{min} = \varepsilon \geq \ln 2 \text{ nats}
\tag{E.8.3b}
$$
This follows from Landauer's principle: erasing one bit of information, or more generally any logically irreversible operation on one bit, requires minimum entropy production $\ln 2$ [Landauer 1961].

**Step 3 (Path Cost for Retrieval).** Retrieving information at depth $r$ from the boundary requires traversing a path of approximately $n = r/\delta$ links, where $\delta$ is the characteristic MPU spacing (Definition 35). The total propagation cost for retrieval is:
$$
V_{prop}^{(retrieval)}(r) = n \cdot \Phi_{min} = \frac{r}{\delta} \cdot \varepsilon
\tag{E.8.3c}
$$

**Step 4 (Per-Bit Cost Coefficient).** Each link has capacity $C_{max}$ nats (Theorem E.2), so transmitting one nat of information incurs entropy cost $\varepsilon/C_{max}$ per link (Theorem 31). For a path of $n = r/\delta$ links to depth $r$, the cost per nat is $(r/\delta) \cdot (\varepsilon/C_{max})$. The cost per nat of accessible information per unit retrieval depth is:
$$
\gamma_{ret} = \frac{(r/\delta) \cdot (\varepsilon/C_{max})}{r} = \frac{\varepsilon}{\delta \cdot C_{max}}
$$
This has dimensions $[1/\text{length}]$ in natural units. $\square$

**Corollary E.8.3.1 (Numerical Estimate).**
Using $\varepsilon = \ln 2$, $C_{max} = 2\ln 2$ (Equation E.15), and $\delta = \sqrt{8\ln 2} \cdot L_P$ (Appendix Q, Equation Q.18):
$$
\gamma_{ret} = \frac{\ln 2}{\sqrt{8\ln 2} \cdot L_P \cdot 2\ln 2} = \frac{1}{2\sqrt{8\ln 2} \cdot L_P} \approx \frac{0.213}{L_P}
$$

### E.8.3.4 PCE Cost of Bulk Encoding

**Theorem E.8.3.1 (Excess Cost of Bulk Encoding).**
For a region $\mathcal{R}$ with characteristic linear dimension $L$ (so $\mathcal{V} \sim L^D$ and $\mathcal{A} \sim L^{D-1}$ in $D$ spatial dimensions), bulk-encoded information incurs a PCE cost exceeding that of boundary-encoded information by a factor scaling with $L$.

*Proof.*

**Step 1 (Retrieval Cost Structure).** Consider an external observer (or subsystem at the boundary) that must access information stored in the bulk. Accessing information at average depth $\bar{r} \sim L$ from the boundary requires propagating queries and responses across $\sim L/\delta$ MPU links.

**Step 2 (Channel Fidelity Decay).** Each ND-RID interaction along the retrieval path incurs the contractivity factor $f_{RID} < 1$ (Lemma E.1). For a path of $n = L/\delta$ steps, the effective fidelity of information retrieval decays exponentially:
$$
f_{eff}(L) = f_{RID}^{L/\delta}
\tag{E.8.3d}
$$
Since $f_{RID} < 1$ strictly (guaranteed by $\varepsilon > 0$, Lemma E.1), this decays exponentially with depth.

**Step 3 (Compensation Cost).** To maintain reliable access to bulk-stored information despite this exponential degradation, the system must implement error correction. In fault-tolerant schemes, achieving a target logical fidelity requires resources that grow at most logarithmically with the inverse logical error rate; modeling the minimal correction overhead as logarithmic in the inverse effective fidelity yields:
$$
\text{Overhead} = O\left(\log\frac{1}{f_{eff}}\right) = O\left(\frac{L}{\delta} \cdot \log\frac{1}{f_{RID}}\right)
\tag{E.8.3e}
$$
This confirms that the compensation cost scales linearly with $L/\delta$ [Nielsen & Chuang 2010; Preskill 1998].

**Step 4 (Thermodynamic Cost from $V_{prop}$).** From Lemma E.8.3.1, accessing bulk information at depth $r$ produces entropy:
$$
\Delta S_{access}(r) \geq \frac{r}{\delta} \cdot \varepsilon \geq \frac{r}{\delta} \cdot \ln 2
\tag{E.8.3f}
$$
Averaged over bulk-distributed information (with mean depth $\bar{r} \sim L/2$):
$$
\langle \Delta S_{access} \rangle_{bulk} \sim \frac{L}{2\delta} \cdot \varepsilon
\tag{E.8.3g}
$$

**Step 5 (Operational Cost Rate).** The operational cost rate $V_{op}$ (Definition D.1) includes the complexity cost of maintaining accessible information. Using the retrieval cost coefficient $\gamma_{ret}$ derived in Lemma E.8.3.1, for bulk encoding:
$$
V_{op}^{(bulk)} = V_{op}^{(0)} + \gamma_{ret} \cdot I_{tot} \cdot L
\tag{E.8.3h}
$$
where $V_{op}^{(0)}$ is the baseline cost independent of encoding location, and the second term represents the additional cost of maintaining accessibility for bulk-stored information at mean depth $\bar{r} \sim L$.

**Step 6 (Boundary Encoding Cost).** For boundary-encoded information, the retrieval depth is $O(\delta)$ (information is already at the interface), yielding:
$$
V_{op}^{(boundary)} = V_{op}^{(0)} + \gamma_{ret} \cdot I_{tot} \cdot c_0 \delta
\tag{E.8.3i}
$$
where $c_0 = O(1)$ and $c_0 \delta$ is the effective retrieval depth for boundary-encoded information.

**Step 7 (Excess Cost).** The difference in PCE cost contributions is:
$$
\Delta V_{op} = V_{op}^{(bulk)} - V_{op}^{(boundary)} = \gamma_{ret} \cdot I_{tot} \cdot \left(L - c_0 \delta\right)
\tag{E.8.3j}
$$
For $L \gg \delta$ (the regime where continuum geometry emerges, Theorem 43):
$$
\Delta V_{op} \sim \gamma_{ret} \cdot I_{tot} \cdot L > 0
$$
Thus, bulk encoding incurs an excess PCE cost scaling linearly with system size $L$. $\square$

### E.8.3.5 PCE Selection of Boundary Encoding

**Theorem E.8.3.2 (Boundary Encoding as PCE Minimum).**
For fixed total accessible information $I_{tot}$ in a region $\mathcal{R}$, the PCE-optimal encoding strategy localizes information to the boundary $\partial\mathcal{R}$.

*Proof.*

Let $\phi \in [0,1]$ denote the fraction of information that is boundary-encoded, with $(1-\phi)$ bulk-encoded. The total PCE potential for this mixed configuration is:
$$
V(\phi) = V^{(0)} + (1-\phi) \cdot I_{tot} \cdot \gamma_{ret} \cdot L + \phi \cdot I_{tot} \cdot \gamma_{ret} \cdot c_0 \delta
\tag{E.8.3k}
$$

The derivative with respect to $\phi$ is:
$$
\frac{\partial V}{\partial \phi} = I_{tot} \cdot \gamma_{ret} \cdot \left(c_0 \delta - L\right)
\tag{E.8.3l}
$$

For $L \gg \delta$ (required for continuum emergence, Theorem 43), we have $L \gg c_0 \delta$, and therefore:
$$
\frac{\partial V}{\partial \phi} < 0 \quad \text{throughout } [0,1]
\tag{E.8.3m}
$$

Since $V(\phi)$ is linear in $\phi$ with strictly negative slope throughout the domain, the minimum occurs at the boundary $\phi = 1$: pure boundary encoding. $\square$

### E.8.3.6 Derivation of Idle Channel Cost Structure

Before proving saturation is an attractor, we must derive the cost structure for channels that are present but not utilized.

**Lemma E.8.3.2 (Idle Channel Cost from $V_{prop}$).**
Each ND-RID channel crossing a boundary incurs a baseline maintenance cost, even when idle, modeled as:
$$
\Phi_{idle} = \kappa_{maint} \cdot \varepsilon
\tag{E.8.3n}
$$
where $\kappa_{maint} > 0$ is a maintenance coefficient of order unity determined by the ratio of maintenance period to MPU cycle time $\tau_{min}$ (Theorem 29), and $\varepsilon \geq \ln 2$.

*Proof.*

**Step 1 (Channel Infrastructure).** From Definition D.1, $V_{prop}$ represents the cost of maintaining predictive coherence and communication infrastructure. Each channel crossing a boundary represents an element of this infrastructure.

**Step 2 (Coherence Maintenance).** Even for an idle channel, maintaining the *capability* for information transmission requires:
- Preserving quantum coherence of the channel states
- Periodic refresh cycles to counteract decoherence
- Structural maintenance of the network topology

**Step 3 (Thermodynamic Cost of Coherence).** Maintaining coherence in a thermal environment requires active refresh and error-suppression operations. Any refresh cycle that discards entropy into the environment is logically irreversible at the effective level and therefore carries a strictly positive entropy cost per cycle, bounded below by $\ln 2$ per irreversibly discarded bit [Landauer 1961]. In the PU parametrization, this baseline cost per maintenance cycle is absorbed into $\varepsilon \geq \ln 2$ (Theorem 31), giving:
$$
\Phi_{idle} = \kappa_{maint} \cdot \varepsilon, \quad \kappa_{maint} \equiv \frac{\tau_{maint}}{\tau_{cycle}}
$$
where the ratio $\kappa_{maint}$ captures the maintenance period relative to cycle time. For stable operation at PCE equilibrium, $\kappa_{maint} \sim O(1)$.

**Step 4 (Lower Bound).** The minimum maintenance cost is bounded below by the irreducible entropy cost of any physical operation involving the channel:
$$
\Phi_{idle} \geq \varepsilon_{min} > 0
$$
where $\varepsilon_{min}$ is a positive constant. The strict positivity follows from the impossibility of maintaining any physical structure without entropy production (Second Law). $\square$

**Corollary E.8.3.2 (Total Idle Channel Cost).**
For a boundary with $N_{idle}$ idle channels, the total propagation cost contribution is:
$$
V_{prop}^{(idle)} = N_{idle} \cdot \Phi_{idle} = N_{idle} \cdot \kappa_{maint} \cdot \varepsilon
\tag{E.8.3o}
$$
This cost provides no predictive benefit, representing pure inefficiency.

### E.8.3.7 Construction of the PCE Potential as Function of Boundary Entropy

We now construct the explicit form of the PCE potential $V(S)$ as a function of boundary entropy $S$, enabling rigorous verification of attractor conditions.

**Definition E.8.3.2 (Channel Utilization).**
For a region with boundary area $\mathcal{A}$:
- Total effective channels: $N_{eff} = \sigma_{link} \cdot \mathcal{A}$, where $\sigma_{link} = \chi/(\eta\delta^2)$ (Theorem E.3)
- Maximum entropy: $S_{max} = N_{eff} \cdot C_{max} = \mathcal{A}/(4G)$ (Theorem 49)
- Active channels: $N_{active}(S) = S/C_{max}$
- Idle channels: $N_{idle}(S) = N_{eff} - N_{active}(S)$

**Theorem E.8.3.3 (Explicit PCE Potential for Boundary Entropy).**
The PCE potential as a function of boundary entropy $S \in [0, S_{max}]$ for a region with boundary area $\mathcal{A}$ is:
$$
V(S) = V_0 + \Phi_{idle} \cdot \left(N_{eff} - \frac{S}{C_{max}}\right) - \Gamma_0 B_0 \cdot \frac{S}{S_{max}}
\tag{E.8.3p}
$$
where:
- $V_0$ is a baseline cost independent of $S$
- $\Phi_{idle}$ is the per-channel idle cost (Lemma E.8.3.2)
- $\Gamma_0 B_0$ is the maximum predictive benefit at full utilization (Definition D.1)

*Proof.*

**Step 1 (Propagation Cost Component).** From Definition D.1, $V_{prop}$ includes costs for all channels. Decomposing by utilization:
$$
V_{prop}(S) = N_{active} \cdot \Phi_{active} + N_{idle} \cdot \Phi_{idle}
$$
where $\Phi_{active}$ is the cost for an actively transmitting channel. At capacity saturation, $\Phi_{active} \approx \Phi_{idle}$ (both require maintenance), so:
$$
V_{prop}(S) \approx N_{eff} \cdot \Phi_{idle} = \text{constant}
$$
However, the *net* cost attributable to underutilization is:
$$
V_{prop}^{(net)}(S) = N_{idle}(S) \cdot \Phi_{idle} = \left(N_{eff} - \frac{S}{C_{max}}\right) \cdot \Phi_{idle}
\tag{E.8.3q}
$$
This captures the cost of maintaining unused capacity.

**Step 2 (Benefit Component).** From Definition D.1, $V_{benefit} = \sum_v \Gamma_0 B(PP_v)$. For boundary channels, the predictive benefit scales with channel utilization. At the network level, let $B(u)$ be the benefit function of utilization fraction $u \in [0,1]$, with $B(0) = 0$ and $B(1) = B_0$ representing maximum benefit at full utilization:
$$
V_{benefit}(S) = \Gamma_0 \cdot B\left(\frac{S}{S_{max}}\right)
$$
For the simplest consistent form where $B(u) = B_0 u$ is linear:
$$
V_{benefit}(S) = \Gamma_0 B_0 \cdot \frac{S}{S_{max}}
\tag{E.8.3r}
$$
This represents the power-equivalent predictive benefit from utilizing fraction $S/S_{max}$ of available capacity, with $V_{benefit}(S_{max}) = \Gamma_0 B_0$. The attractor result (Theorem E.8.3.4) holds for any monotonically increasing $B(u)$; linearity is adopted for analytical transparency.

**Step 3 (Total Potential).** Combining the components (absorbing $\Phi_{active}$ costs into $V_0$):
$$
V(S) = V_0 + \Phi_{idle} \cdot \left(N_{eff} - \frac{S}{C_{max}}\right) - \Gamma_0 B_0 \cdot \frac{S}{S_{max}}
$$
This is the explicit PCE potential as a function of boundary entropy. $\square$

### E.8.3.8 Saturation of the Holographic Bound as PCE Attractor

**Theorem E.8.3.4 (Holographic Saturation as Global Attractor).**
Under PCE dynamics (Equation D.8), the entropy of a region $\mathcal{R}$ with boundary area $\mathcal{A}$ evolves toward the saturation value:
$$
S \xrightarrow{t \to \infty} S_{max} = \frac{\mathcal{A}}{4G}
$$
This saturation is the unique global minimum of the PCE potential $V(S)$ on the domain $[0, S_{max}]$.

*Proof.*

**Step 1 (Gradient Calculation).** From Theorem E.8.3.3, the gradient of $V(S)$ with respect to $S$ is:
$$
\frac{\partial V}{\partial S} = -\frac{\Phi_{idle}}{C_{max}} - \frac{\Gamma_0 B_0}{S_{max}}
\tag{E.8.3s}
$$

**Step 2 (Sign of Gradient).** Since $\Phi_{idle} > 0$ (Lemma E.8.3.2), $C_{max} > 0$ (Theorem E.2), $\Gamma_0 > 0$ (Definition 20), $B_0 > 0$ (benefit is positive), and $S_{max} > 0$:
$$
\frac{\partial V}{\partial S} = -\left(\frac{\Phi_{idle}}{C_{max}} + \frac{\Gamma_0 B_0}{S_{max}}\right) < 0
\tag{E.8.3t}
$$
The gradient is strictly negative throughout the domain $[0, S_{max}]$.

**Step 3 (Attractor Identification).** Since $\partial V/\partial S < 0$ for all $S \in [0, S_{max})$, the PCE dynamics (Equation D.8):
$$
dS = -\eta_S \frac{\partial V}{\partial S} dt + \text{noise}
$$
with $\eta_S > 0$, imply:
$$
\langle dS \rangle = -\eta_S \frac{\partial V}{\partial S} dt > 0
$$
The expected drift is positive, driving $S$ toward larger values.

**Step 4 (Boundary Constraint).** The entropy cannot exceed the holographic bound (Theorem 49):
$$
S \leq S_{max} = \frac{\mathcal{A}}{4G}
$$
This provides a hard upper boundary for the dynamics.

**Step 5 (Unique Minimum at Boundary).** Since $V(S)$ is linear with negative slope, it achieves its unique minimum at the maximum allowed value:
$$
S^* = S_{max} = \frac{\mathcal{A}}{4G}
\tag{E.8.3u}
$$

**Step 6 (Stability).** At $S = S_{max}$, the system is at the boundary of the allowed domain. The dynamics cannot push $S$ beyond $S_{max}$ (physical constraint from Theorem 49), and the negative gradient ensures the expected drift is toward $S_{max}$ from any $S < S_{max}$. Thus $S_{max}$ is a stable equilibrium—an attractor of the mean dynamics.

**Step 7 (Convergence Rate).** The approach to saturation is characterized by:
$$
\frac{d(S_{max} - S)}{dt} = -\eta_S \left|\frac{\partial V}{\partial S}\right| = -\eta_S \left(\frac{\Phi_{idle}}{C_{max}} + \frac{\Gamma_0 B_0}{S_{max}}\right)
$$
Since $V(S)$ is linear, this derivative is constant, yielding a constant drift velocity toward saturation. The characteristic timescale for saturation from initial entropy $S_0$ is:
$$
t_{sat}(S_0) = \frac{S_{max} - S_0}{\eta_S \left(\frac{\Phi_{idle}}{C_{max}} + \frac{\Gamma_0 B_0}{S_{max}}\right)}
\tag{E.8.3v}
$$
The stochastic term in Equation D.8 introduces fluctuations about this mean trajectory; the formula gives the expected saturation time for the deterministic component of the dynamics. $\square$

**Corollary E.8.3.3 (Lyapunov Function).**
The function $\mathcal{L}(S) = S_{max} - S$ serves as a Lyapunov function for the deterministic component of the PCE dynamics on $[0, S_{max}]$:
- $\mathcal{L}(S) \geq 0$ with equality only at $S = S_{max}$
- $\langle d\mathcal{L}/dt \rangle < 0$ for $S < S_{max}$

Combined with the constraint $S \leq S_{max}$ (Theorem 49), this confirms $S_{max}$ is the unique stable equilibrium in the mean.

### E.8.3.9 Physical Interpretation

**Corollary E.8.3.4 (Holography as Economic Principle).**
The holographic nature of entropy bounds—scaling with area rather than volume—emerges from PCE optimization rather than being imposed as an independent principle. Boundary encoding is selected because:

1. **Minimal retrieval cost:** Boundary-localized information requires no bulk traversal for external access, minimizing $V_{prop}$ contributions from Equation (E.8.3h).
2. **Maximal channel utilization:** PCE penalizes unused capacity via the maintenance cost $\Phi_{idle}$ (Lemma E.8.3.2), driving the system toward saturation in the mean.
3. **Optimal predictive coordination:** Boundary channels mediate all cross-region predictive interactions; saturating them maximizes $V_{benefit}$ (Equation E.8.3r).

**Corollary E.8.3.5 (Black Hole Entropy Maximality).**
Black holes saturate the holographic bound ($S_{BH} = \mathcal{A}/4G$) because they represent a PCE equilibrium for a given boundary area. The argument proceeds as follows:

1. Any matter configuration with $S < \mathcal{A}/4G$ occupying the same boundary area has higher PCE potential (Theorem E.8.3.4).
2. PCE dynamics drive such configurations toward saturation.
3. Gravitational collapse, from this perspective, is the PCE-driven evolution toward the minimum-potential configuration for a given boundary area.

*Remark:* Uniqueness of the black hole as THE equilibrium (versus A equilibrium) would require additional arguments about the topology of the PCE potential landscape for different matter configurations, which we do not pursue here.

### E.8.3.10 Implications for Emergent Gravity

The identification of holographic saturation as a PCE attractor strengthens the thermodynamic derivation of Einstein's Field Equations (Section 12). The Clausius relation $\delta Q = T \delta S$ applied to local Rindler horizons (Theorem 12.1) assumes the entropy $S$ takes its equilibrium (maximal) value for the horizon area. Theorem E.8.3.4 provides the dynamical justification: PCE ensures that local causal horizons are driven toward holographic saturation, validating the equilibrium assumption underlying the EFE derivation as a consequence of the framework's dynamics rather than an independent postulate.

This reduces the logical status of "equilibrium saturation" from an assumption to a theorem within the PU framework.


## E.9 General Horizon Theorem

### E.9.1 Prediction Saturation

**Definition E.9.1 (Causal Prediction Boundary).** A surface $\Sigma$ in the emergent spacetime is a *causal prediction boundary* if:
1. $\Sigma$ separates spacetime into regions $A$ (interior) and $\bar{A}$ (exterior)
2. Prediction of states in $A$ from data in $\bar{A}$ requires information transfer across $\Sigma$
3. All ND-RID channels crossing $\Sigma$ operate at capacity saturation

**Definition E.9.2 (Channel Saturation).** A channel is *saturated* when it transmits at the maximum reliable rate. From Equation E.15, the PCE-optimal channel capacity is:

$$C_{\max}(f_{\text{RID}}) = \ln(d_0) - \varepsilon = \ln(8) - \ln(2) = 2\ln 2 \approx 1.386 \text{ nats}$$

where $d_0 = 8$ is the MPU Hilbert space dimension (Theorem 23) and $\varepsilon = \ln 2$ is the irreducible SPAP entropy cost (Theorem 31).

### E.9.2 The Universal Area Law

**Theorem E.9.1 (Universal Area Law).** For any causal prediction boundary $\Sigma$ with area $\mathcal{A}$, the associated entropy is:

$$S_\Sigma = \frac{\mathcal{A}}{4G}$$

in natural units ($c = \hbar = k_B = 1$, $L_P^2 = G$).

*Proof.*

**Step 1 (Channel counting).** By Theorem E.3, the number of effective independent ND-RID channels crossing $\Sigma$ is:

$$N_{\text{channels}} = \sigma_{\text{eff}} \cdot \mathcal{A}$$

where $\sigma_{\text{eff}} = \chi/(\eta\delta^2)$ is the effective channel density.

**Step 2 (Information-entropy correspondence).** At saturation, each channel transmits information at the maximum reliable rate $C_{\max}(f_{\text{RID}})$. By Landauer's principle [Landauer 1961], any logically irreversible loss of information (in particular erasure) exports at least $k_B$ of entropy per nat (or 1 in natural units) to the environment. The maximum entropy associated with a saturated channel is therefore:

$$S_{\text{channel}} = C_{\max}(f_{\text{RID}}) = 2\ln 2 \text{ nats}$$

This identification—treating the channel's maximal information budget as an entropy budget—underlies the Bekenstein-Hawking formula and is operationally grounded in the equivalence between information erasure and heat dissipation established by the SPAP cost $\varepsilon \geq \ln 2$ (Theorem 31).

**Step 3 (Total entropy).** The boundary entropy is:

$$S_\Sigma = N_{\text{channels}} \times S_{\text{channel}} = \sigma_{\text{eff}} \cdot \mathcal{A} \cdot 2\ln 2 = \frac{\chi \cdot 2\ln 2}{\eta \delta^2} \cdot \mathcal{A}$$

**Step 4 (Coefficient matching).** By Theorem E.5, thermodynamic consistency (the Clausius relation $\delta S = \delta Q/T$ on local Rindler horizons) requires:

$$\frac{\chi \cdot C_{\max}(f_{\text{RID}})}{\eta \delta^2} = \frac{1}{4L_P^2} = \frac{1}{4G}$$

Substituting $C_{\max}(f_{\text{RID}}) = 2\ln 2$, $\chi = \eta = 1$ (PCE-optimal values), and $\delta^2 = 8\ln 2 \cdot L_P^2$ (Appendix Q, Equation Q.18):

$$\frac{1 \cdot 2\ln 2}{1 \cdot 8\ln 2 \cdot L_P^2} = \frac{1}{4L_P^2} = \frac{1}{4G} \quad \checkmark$$

Therefore:

$$S_\Sigma = \frac{\mathcal{A}}{4G}$$

In SI units, restoring $c$, $\hbar$, and $k_B$:

$$S_\Sigma = \frac{k_B c^3 \mathcal{A}}{4G\hbar}$$

∎

### E.9.3 Classification of Horizons

**Theorem E.9.2 (Horizon Classification).** All causal prediction boundaries fall into three classes, each satisfying the universal area law:

| Horizon Type | Physical Context | Saturation Mechanism |
|:-------------|:-----------------|:---------------------|
| Event horizon | Black holes | Gravitational redshift freezes information flow |
| Cosmological | de Sitter space | Expansion rate exceeds signal speed |
| Rindler | Accelerated observers | Acceleration defines causal boundary |

*Proof.*

**Part A (Event Horizons).** For a Schwarzschild black hole of mass $M$, the surface gravity is $\kappa = c^4/(4GM)$, determining the Hawking temperature [Hawking 1975]:

$$T_H = \frac{\hbar\kappa}{2\pi k_B c} = \frac{\hbar c^3}{8\pi G M k_B}$$

Information crossing the horizon is gravitationally redshifted; asymptotic observers see channels freeze at the horizon with infinite coordinate time required for signals to escape. Channel saturation occurs because outgoing information capacity vanishes at the horizon.

The Bekenstein-Hawking entropy [Bekenstein 1973; Hawking 1975]:

$$S_{\text{BH}} = \frac{k_B c^3 \mathcal{A}}{4G\hbar}$$

follows from the universal area law with horizon area $\mathcal{A} = 16\pi G^2 M^2/c^4$.

**Part B (Cosmological Horizons).** In de Sitter space with cosmological constant $\Lambda > 0$, the cosmological horizon radius is:

$$r_\Lambda = \sqrt{\frac{3}{\Lambda}}$$

Regions beyond $r_\Lambda$ recede superluminally due to metric expansion; no causal contact is possible [Gibbons & Hawking 1977]. Channels to the exterior are permanently saturated since no return signal can propagate against the expansion.

The de Sitter entropy in natural units ($c = \hbar = 1$):

$$S_{\text{dS}} = \frac{\mathcal{A}}{4G} = \frac{4\pi r_\Lambda^2}{4G} = \frac{\pi r_\Lambda^2}{G} = \frac{3\pi}{G\Lambda}$$

In SI units: $S_{\text{dS}} = 3\pi k_B c^3/(G\hbar\Lambda)$.

**Part C (Rindler Horizons).** An observer with constant proper acceleration $a$ in flat spacetime perceives a Rindler horizon at proper distance $c^2/a$ [Rindler 1966]. The Unruh effect [Unruh 1976] implies the accelerated observer detects a thermal bath at temperature:

$$T_U = \frac{\hbar a}{2\pi k_B c}$$

The entanglement entropy across the Rindler horizon satisfies the area law, with $\mathcal{A}$ being the transverse area of the horizon patch. This case provided the foundation for Jacobson's thermodynamic derivation of Einstein's equations [Jacobson 1995], which the present framework extends (Section 12). ∎

#### E.9.3.1 Temperature as Information Rate

All horizon temperatures appearing in the framework share a common structure reflecting the rate of information processing at causal boundaries.

**Theorem E.9.4 (Horizon Temperature Structure).** *Horizon temperatures take the universal form:*
$$
T = \frac{\hbar}{2\pi k_B} \cdot \Gamma
$$
*where $\Gamma$ is a characteristic rate with dimensions of inverse time.*

| Horizon Type | Rate $\Gamma$ | Temperature | Reference |
|:-------------|:--------------|:------------|:----------|
| Rindler | Proper acceleration $a/c$ | $T_U = \hbar a/(2\pi k_B c)$ | Unruh 1976 |
| Schwarzschild | Surface gravity $\kappa/c$ | $T_H = \hbar\kappa/(2\pi k_B c)$ | Hawking 1975 |
| de Sitter | Hubble rate $H_\Lambda$ | $T_{dS} = \hbar H_\Lambda/(2\pi k_B)$ | Gibbons & Hawking 1977 |

*Proof.* The Unruh temperature $T_U = \hbar a/(2\pi k_B c)$ can be written:
$$
T_U = \frac{\hbar}{2\pi k_B} \cdot \frac{a}{c} = \frac{\hbar}{2\pi k_B} \cdot \Gamma_a
$$
where $\Gamma_a = a/c$ has dimensions of inverse time.

For Hawking radiation, the surface gravity $\kappa = c^4/(4GM)$ gives $\Gamma_\kappa = \kappa/c$, the rate of exponential peeling of null generators from the horizon.

For de Sitter space, $H_\Lambda = c\sqrt{\Lambda/3}$ is the Hubble expansion rate at the cosmological horizon.

In each case, the temperature measures how rapidly an observer encounters the causal boundary—the rate at which the horizon processes the observer's trajectory through spacetime. ∎

**Corollary E.9.4.1 (Prefactor Universality).** *The prefactor $\hbar/(2\pi k_B)$ relates the quantum of action $\hbar$ to thermal energy via Boltzmann's constant $k_B$, with the factor $2\pi$ arising from the periodicity of Euclidean time in the thermal field theory representation* [Gibbons & Hawking 1977].

### E.9.4 Holographic Content

Throughout this subsection, we work in natural units ($c = \hbar = k_B = 1$, $L_P^2 = G$) where entropy and information are measured in nats.

**Theorem E.9.3 (Entropy as Information Limit).** The boundary entropy $S_\Sigma$ equals the maximum information specifiable about the interior $A$ from exterior measurements:

$$I_{\max}(A \mid \bar{A}) = S_\Sigma = \frac{\mathcal{A}}{4G}$$

*Proof.*

**Step 1 (Information bound).** By the Holevo bound [Holevo 1973], the maximum classical information extractable from quantum channels is bounded by the Holevo capacity:

$$I_{\text{classical}} \leq \sum_{i=1}^{N_{\text{channels}}} \chi(\mathcal{E}_i)$$

where $\chi(\mathcal{E}_i)$ is the Holevo information of channel $i$. For the ND-RID channels, the strict contractivity $f_{\text{RID}} < 1$ (Lemma E.1) implies $\chi(\mathcal{E}_i) \leq C_{\max}(f_{\text{RID}})$, where $C_{\max}$ is the classical capacity bound established in Theorem E.2.

**Step 2 (Saturation at boundary).** For a causal prediction boundary, channels operate at saturation (Definition E.9.2), achieving the capacity bound:

$$I_{\max} = N_{\text{channels}} \cdot C_{\max}(f_{\text{RID}}) = \sigma_{\text{eff}} \cdot \mathcal{A} \cdot C_{\max}(f_{\text{RID}}) = \frac{\mathcal{A}}{4G}$$

using the coefficient relation from Theorem E.9.1.

**Step 3 (Entropy interpretation).** In natural units, $S_\Sigma = I_{\max} = \mathcal{A}/(4G)$. This counts the logarithm of the number of distinguishable interior states consistent with exterior data, which is the Bekenstein bound [Bekenstein 1981]:

$$S \leq \frac{2\pi R E}{\hbar c}$$

At the gravitational limit $E = Mc^2 = Rc^4/(2G)$, this reduces to $S \leq \mathcal{A}/(4L_P^2) = \mathcal{A}/(4G)$ in natural units. ∎

**Corollary E.9.1 (Holographic Principle).** The degrees of freedom describing a region $A$ are fully encoded on its boundary $\partial A$:

$$\dim(\mathcal{H}_A) \leq \exp\left(\frac{\mathcal{A}}{4G}\right)$$

in natural units. This is not an additional principle but a theorem following from ND-RID channel structure and capacity saturation.


## E.9.5 Information Conservation from Causal Structure

The preceding results establish that causal boundaries have finite information capacity. We now show that this finiteness implies global information conservation—unitarity is not an independent axiom but a theorem following from the structure of self-referential prediction and the closed-system assumption.

### E.9.5.1 Preliminary Definitions and Prior Results

This section derives global unitarity from the causal and thermodynamic structure established in preceding sections. For reference, the key prior results upon which the derivation depends are:

- **Hypothesis 1 (MPU Reality Model):** Physical reality, from the internal perspective, is fundamentally constituted by a network of interacting Minimal Predictive Units (MPUs). This network $\mathcal{N}$ constitutes the complete internal substrate; no external degrees of freedom are accessible to internal systems.

  *Remark (Consistency with P.5):* The closed-system assumption is consistent with the authentic simulation architecture (Appendix P.5). "No external degrees of freedom accessible to internal systems" refers to internal physical reality; external observation channels (Definition P.5.3) operate outside this substrate by construction, satisfying internal inaccessibility ($\mathbb{E}[\Delta Q \mid E; M] = 0$ for all internal procedures $M \in \mathcal{M}_{int}$) and non-intervention.

- **Definition 6 / Definition A.2.2 (ND-RID):** Non-Deterministic Reflexive Interaction Dynamics govern the MPU 'Evolve' process, characterized by probabilistic outcomes $P(o|x,y)$ and state transitions $P(x'|x,y,o)$. The defining characteristic is the dependence of state transformation on outcome, creating a reflexive loop.

- **Definition 26 (Internal Evolution):** Between 'Evolve' interactions, each MPU evolves unitarily via $U_0(\Delta t) = e^{-i\hat{H}\Delta t/\hbar}$ with self-adjoint Hamiltonian $\hat{H}$.

- **Definition 27 ('Evolve'/ND-RID):** The interaction process between MPUs, implementing reflexive state updates. By construction, 'Evolve' acts on pairs of interacting MPUs through their joint Hilbert space $\mathcal{H}_A \otimes \mathcal{H}_B$, without coupling to additional external systems. This is an instance of ND-RID (Definition 6, Definition A.2.2).

- **Definition 35 (Propagation Cost Metric):** The fundamental MPU spacing $\delta$ defines the characteristic length scale of the network, with the propagation cost metric $d_{\mathcal{N}}(u,v)$ measuring minimum cumulative cost along network paths.

- **Theorem 23 (MPU Dimension):** The MPU Hilbert space dimension is $d_0 = 8$.

- **Theorem 29 (Minimum Cycle Time):** The MPU cycle time satisfies $\tau \geq \tau_{\min} > 0$, establishing finite processing speed.

- **Theorem 31 (Entropy Cost):** The minimum dimensionless entropy production per SPAP cycle is $\varepsilon \geq \ln 2$ nats, arising from the 2-to-1 logical state merge inherent in self-referential prediction (Appendix J, Lemma J.1).

- **Lemma E.1 (Strict Contractivity):** The averaged ND-RID channel $\mathcal{E}_N$ satisfies $D_{\text{tr}}(\mathcal{E}_N(\rho_1), \mathcal{E}_N(\rho_2)) \leq f_{\text{RID}} \cdot D_{\text{tr}}(\rho_1, \rho_2)$ with contractivity factor $f_{\text{RID}} = \lambda_{\text{gap}}(\mathcal{E}_N) < 1$, where $\lambda_{\text{gap}}$ is the spectral radius of $\mathcal{E}_N$ restricted to traceless operators. As derived in Appendix M (Section M.4), the channel decomposition $\mathcal{E}_N = (1-p)\Psi + pT_\sigma$ with reset probability $p \geq \varepsilon/\ln d_0 = \ln 2/\ln 8 = 1/3$ yields the quantitative bound $f_{\text{RID}} \leq 1 - p \leq 2/3$.

- **Theorem E.2 (Capacity Bound):** The classical information capacity satisfies $C_{\max} \equiv C(\mathcal{E}_N) < \ln d_0$.

- **Theorem E.10.2 (Velocity Bound):** Information propagation velocity is bounded by $v_{\max} = \delta/\tau_{\min} = c$.

### E.9.5.2 Notation

Throughout this section:

- $\mathcal{S}(\mathcal{H})$ denotes the set of density operators (positive semidefinite, trace-one) on Hilbert space $\mathcal{H}$
- $\mathcal{B}(\mathcal{H})$ denotes the algebra of bounded linear operators on $\mathcal{H}$
- $\mathcal{U}(\mathcal{H})$ denotes the group of unitary operators on $\mathcal{H}$
- $\text{Tr}_B[\cdot]$ denotes the partial trace over subsystem $B$
- $D_{\text{tr}}(\rho, \sigma) = \frac{1}{2}\|\rho - \sigma\|_1$ denotes trace distance
- $S(\rho) = -\text{Tr}(\rho \ln \rho)$ denotes von Neumann entropy (in nats) [von Neumann 1932]
- $I(A:B)_\rho = S(\rho_A) + S(\rho_B) - S(\rho_{AB})$ denotes quantum mutual information
- $d_0 = 8$ is the MPU Hilbert space dimension (Theorem 23)
- $\delta$ is the fundamental MPU spacing (Definition 35)
- $\varepsilon = \ln 2$ is the irreducible SPAP entropy cost (Theorem 31)

### E.9.5.3 Information Capacity of Cauchy Surfaces

**Definition E.9.5.1 (Information Capacity of a Cauchy Surface).** For a Cauchy surface $\Sigma$ in the emergent spacetime (Theorem 43), define the information capacity as the maximum von Neumann entropy achievable by states on $\Sigma$. For the finite-dimensional Hilbert space $\mathcal{H}_{\Sigma}$ arising from the discrete MPU network:

$$\mathcal{C}(\Sigma) := \sup_{\rho \in \mathcal{S}(\mathcal{H}_{\Sigma})} S(\rho) = \ln \dim(\mathcal{H}_{\Sigma})$$

where $\mathcal{S}(\mathcal{H}_{\Sigma})$ denotes the set of density operators on the Hilbert space $\mathcal{H}_{\Sigma}$ associated with $\Sigma$, and the equality holds because the supremum is achieved by the maximally mixed state $\rho_* = \mathbb{I}/\dim(\mathcal{H}_{\Sigma})$.

*Proof of equality.* For any density operator $\rho$ on a $d$-dimensional Hilbert space, $S(\rho) \leq \ln d$ with equality if and only if $\rho = \mathbb{I}/d$ [Nielsen & Chuang 2010, Theorem 11.8]. ∎

### E.9.5.4 Closed System Assumption and Exhaustive Channel Mediation

**Assumption E.9.5.1 (Closed System).** The MPU network $\mathcal{N}$ constitutes a closed system from the internal perspective: no information exchange occurs with degrees of freedom accessible to internal systems. 

This assumption follows from Hypothesis 1 (Section 7.1) together with the authentic simulation architecture (Appendix P.5). External observation channels (Definition P.5.3) satisfy internal inaccessibility ($\mathbb{E}[\Delta Q \mid E; M] = 0$ for all internal procedures $M \in \mathcal{M}_{int}$, Definition P.5.3(ii)) and non-intervention (Definition P.5.3(iii)), ensuring that from the internal perspective, the network evolves as if closed (Remark P.5.1). External observation extracts information without constituting an interaction from the internal viewpoint.

For the derivation of global unitarity (Theorem E.9.5), this internal closure is sufficient: the Stinespring environment for any reduced subsystem dynamics is contained within $\mathcal{H}_{\Sigma}$ as experienced by internal systems, and information conservation holds for internal evolution.

**Lemma E.9.5.1 (Exhaustive Channel Mediation).** *All information transfer between spacelike-separated regions in the MPU network is mediated by ND-RID channels. There exists no mechanism for information propagation outside this channel structure.*

*Proof.*

**Step 1 (MPU network structure).** By Definition 23, the MPU network $\mathcal{N} = (\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ consists of vertices $v \in \mathcal{V}$ representing MPUs and weighted edges $(u,v) \in \mathcal{E}$ representing possible ND-RID interactions. Each MPU has Hilbert space dimension $d_0 = 8$ (Theorem 23). The network topology determines which MPUs can interact directly.

**Step 2 (Definitional completeness of dynamics).** The MPU dynamics are exhaustively specified by:

- Definition 26: Internal unitary evolution $U_0(\Delta t) = e^{-i\hat{H}\Delta t/\hbar}$ between interactions
- Definition 27: 'Evolve'/ND-RID interactions between MPUs (instantiating Definition 6/A.2.2)
- Hypothesis 1: The network $\mathcal{N}$ constitutes the complete substrate; no external degrees of freedom exist

These definitions constitute the complete dynamical specification of the framework. Any hypothetical mechanism $\mathcal{M}$ for information transfer that is not reducible to compositions of internal evolution and ND-RID interactions would, by definition, lie outside the framework's ontology.

**Step 3 (Interaction locality from ND-RID structure).** By Definition A.2.2, ND-RID interactions act on specific subsystems $(A, B)$ with probabilistic outcome functions $V_{\text{prob}}: X \times Y \to \Delta(O)$ and state transformations $T_{\text{prob}}: X \times Y \times O \to \Delta(X)$. For the MPU 'Evolve' process (Definition 27), these functions act on the joint state space of interacting MPU pairs. By Theorem E.10.2, information propagation velocity is bounded by $v_{\max} = \delta/\tau_{\min} = c$. This bound arises because each link traversal requires execution of the ND-RID update cycle, which cannot complete in time less than $\tau_{\min}$ (Theorem 29). Consequently, information transfer between non-adjacent MPUs must proceed through intermediate links via sequential ND-RID operations.

**Step 4 (Channel decomposition at boundaries).** Consider any two spacelike-separated regions $A$ and $B$ on a Cauchy surface $\Sigma$. Let $\bar{A} = \Sigma \setminus A$ denote the complement of $A$. The Hilbert space factorizes as $\mathcal{H}_{\Sigma} = \mathcal{H}_{A} \otimes \mathcal{H}_{\bar{A}}$. Any causal curve connecting $A$ to $B \subseteq \bar{A}$ must pass through the boundary $\partial A$. By Theorem E.3, this boundary hosts $N_{\text{channels}} = \sigma_{\text{eff}} \cdot |\partial A|$ effective independent ND-RID channels, where:

$$\sigma_{\text{eff}} = \frac{\chi}{\eta\delta^2}$$

is the effective channel density, $\eta$ is the geometric packing coefficient, and $\chi \in (0,1]$ is the correlation correction factor (Theorem E.3).

**Step 5 (Pre-existing correlations).** The tensor product structure $\mathcal{H}_{\Sigma} = \mathcal{H}_{A} \otimes \mathcal{H}_{\bar{A}}$ implies that correlations between $A$ and $\bar{A}$ are encoded in the joint state $\rho_{A\bar{A}} \in \mathcal{S}(\mathcal{H}_A \otimes \mathcal{H}_{\bar{A}})$. Pre-existing correlations (including entanglement established by prior interactions) persist via the tensor product structure. All dynamical modifications to correlations between $A$ and $\bar{A}$—that is, changes to the mutual information $I(A:\bar{A})$—are mediated exclusively through ND-RID channels crossing $\partial A$.

**Step 6 (Completeness).** By Steps 2–5, the ND-RID channel structure exhaustively accounts for all information transfer mechanisms within the framework's ontology. ∎

### E.9.5.5 Hilbert Space Dimension Conservation

**Lemma E.9.5.2 (Hilbert Space Dimension Conservation).** *For a closed MPU network of fixed topology evolving between Cauchy surfaces $\Sigma_1 \to \Sigma_2$, the Hilbert space dimensions satisfy:*

$$\dim(\mathcal{H}_{\Sigma_1}) = \dim(\mathcal{H}_{\Sigma_2})$$

*Proof.*

**Step 1 (MPU counting).** A Cauchy surface $\Sigma$ intersects a definite number $N_{\text{MPU}}(\Sigma)$ of MPUs in the network. By Theorem 23, each MPU has Hilbert space dimension $d_0 = 8$. The total Hilbert space dimension is:

$$\dim(\mathcal{H}_{\Sigma}) = d_0^{N_{\text{MPU}}(\Sigma)} = 8^{N_{\text{MPU}}(\Sigma)}$$

**Step 2 (Conservation of MPU number).** We establish that ND-RID dynamics preserve the total MPU count through three sub-arguments:

*(a) Local preservation:* By Definition 27 and Definition A.2.2, the 'Evolve' process acts on the state spaces of participating MPUs without creating or destroying network vertices. The quantum instrument representation (Section E.2) maps $\mathcal{E}_N: \mathcal{S}(\mathcal{H}_{d_0}^{\otimes k}) \to \mathcal{S}(\mathcal{H}_{d_0}^{\otimes k})$ for $k$ interacting MPUs, preserving the tensor product structure and thus the count of constituent factors.

*(b) Global vertex set invariance:* The MPU network $\mathcal{N} = (\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ (Definition 23) has vertex set $\mathcal{V}$ corresponding to MPUs. The 'Evolve' dynamics modify edge weights $w_{uv}$ and vertex states but not the vertex set itself. For a closed network (Hypothesis 1 with no external boundary), $|\mathcal{V}|$ is an invariant of the dynamics.

*(c) Cauchy surface intersection:* A Cauchy surface $\Sigma$ intersects each MPU worldline exactly once (by definition of Cauchy surface in the emergent spacetime, established via Theorem 43 and Section 11). Therefore:

$$N_{\text{MPU}}(\Sigma_1) = |\mathcal{V}| = N_{\text{MPU}}(\Sigma_2) \equiv N_{\text{total}}$$

**Step 3 (Dimension equality).** Combining Steps 1 and 2:

$$\dim(\mathcal{H}_{\Sigma_1}) = d_0^{N_{\text{total}}} = \dim(\mathcal{H}_{\Sigma_2})$$

∎

### E.9.5.6 Joint Unitarity of ND-RID Operations

The following lemma establishes the central technical result: while the reduced ND-RID channel on a single MPU is strictly contractive, the joint operation on interacting pairs is unitary.

**Lemma E.9.5.3 (Joint ND-RID Operations are Unitary).** *For any pair of interacting MPUs $A$ and $B$, the joint evolution $U_{AB}: \mathcal{H}_{A} \otimes \mathcal{H}_{B} \to \mathcal{H}_{A} \otimes \mathcal{H}_{B}$ implementing their ND-RID interaction is unitary.*

*Proof.*

**Step 1 (Kraus representation of reduced channel).** The reduced ND-RID channel $\mathcal{E}_N^{(A)}$ acting on MPU $A$ alone is a CPTP map. By the Kraus representation theorem [Kraus 1983], there exist operators $\{K_i\}_{i=1}^r$ with $K_i: \mathcal{H}_A \to \mathcal{H}_A$ satisfying $\sum_i K_i^\dagger K_i = \mathbb{I}_A$ such that:

$$\mathcal{E}_N^{(A)}(\rho_A) = \sum_{i=1}^r K_i \rho_A K_i^\dagger$$

The minimal number of Kraus operators required is $r = \text{rank}(\mathcal{J}_{\mathcal{E}})$, where $\mathcal{J}_{\mathcal{E}}$ is the Choi-Jamiołkowski matrix of the channel [Choi 1975].

**Step 2 (Physical locality constrains Kraus rank).** By Definition 27 and Definition A.2.2, the 'Evolve' process for an interacting pair $(A, B)$ couples only the degrees of freedom in $\mathcal{H}_A \otimes \mathcal{H}_B$, without involving additional external systems. This locality constraint is a structural feature of ND-RID as specified in Definition A.2.2: the probabilistic state transformation $T_{\text{prob}}: X \times Y \times O \to \Delta(X)$ acts on the participating subsystems alone, where the state space $X$ for the 'Evolve' process is $\mathcal{H}_A \otimes \mathcal{H}_B$.

We now prove that physical locality bounds the Kraus rank. Let $\mathcal{E}_N^{(A)}$ arise from a joint operation on $\mathcal{H}_A \otimes \mathcal{H}_B$ followed by tracing out $B$. The most general such operation is:

$$\mathcal{E}_N^{(A)}(\rho_A) = \text{Tr}_B\left[\mathcal{E}_{AB}(\rho_A \otimes \sigma_B)\right]$$

where $\mathcal{E}_{AB}$ is a CPTP map on $\mathcal{H}_A \otimes \mathcal{H}_B$ and $\sigma_B \in \mathcal{S}(\mathcal{H}_B)$ is the initial state of $B$.

**Claim:** The Kraus rank of $\mathcal{E}_N^{(A)}$ satisfies $r \leq d_0^2$, where $d_0 = \dim(\mathcal{H}_B) = 8$.

*Proof of Claim:* Any CPTP map $\mathcal{E}_{AB}$ on $\mathcal{H}_A \otimes \mathcal{H}_B$ has Kraus operators $\{M_j\}$ with $M_j: \mathcal{H}_A \otimes \mathcal{H}_B \to \mathcal{H}_A \otimes \mathcal{H}_B$. Expanding in an orthonormal basis $\{|b\rangle\}$ of $\mathcal{H}_B$:

$$\mathcal{E}_N^{(A)}(\rho_A) = \sum_j \text{Tr}_B\left[M_j(\rho_A \otimes \sigma_B)M_j^\dagger\right] = \sum_j \sum_{b,b'} \langle b|M_j(\rho_A \otimes \sigma_B)M_j^\dagger|b'\rangle \delta_{bb'}$$

Define $K_{jb} := \langle b|M_j|\cdot\rangle \sqrt{\sigma_B}$ as operators on $\mathcal{H}_A$. Then:

$$\mathcal{E}_N^{(A)}(\rho_A) = \sum_{j,b} K_{jb} \rho_A K_{jb}^\dagger$$

The number of independent Kraus operators is at most $(\text{rank of } \mathcal{E}_{AB}) \times d_0 \leq d_0^2 \times d_0 = d_0^3$. However, completeness $\sum_{jb} K_{jb}^\dagger K_{jb} = \mathbb{I}_A$ and the structure of the partial trace further constrain this. For the minimal Kraus representation, $r \leq d_0^2$, since the Choi matrix has dimension $d_0^2 \times d_0^2$ and the minimal Kraus rank equals the Choi rank [Choi 1975].

**Step 3 (Stinespring dilation with bounded environment).** By the Stinespring dilation theorem [Stinespring 1955], any CPTP map $\mathcal{E}_N^{(A)}$ on $\mathcal{H}_A$ with Kraus rank $r$ admits the representation:

$$\mathcal{E}_N^{(A)}(\rho_A) = \text{Tr}_E\left[V(\rho_A \otimes |0\rangle_E\langle 0|)V^\dagger\right]$$

where $V: \mathcal{H}_A \otimes \mathcal{H}_{E,\text{in}} \to \mathcal{H}_A \otimes \mathcal{H}_{E,\text{out}}$ is an isometry and $\dim(\mathcal{H}_E) = r$.

The minimal Stinespring dilation has environment dimension equal to the Kraus rank: $\dim(\mathcal{H}_{E,\min}) = r \leq d_0^2$.

**Step 4 (Closed bipartite structure).** By Definition 27, the 'Evolve' process for an interacting pair $(A, B)$ acts on the joint Hilbert space $\mathcal{H}_A \otimes \mathcal{H}_B$. This pairwise structure is a definitional feature of ND-RID (Definition A.2.2). By Assumption E.9.5.1 (Closed System, following from Hypothesis 1), no degrees of freedom external to the network exist. For the pairwise interaction, the relevant closed system is precisely the bipartite space $\mathcal{H}_A \otimes \mathcal{H}_B$.

The Stinespring representation (Step 3) demonstrates that any CPTP map on $\mathcal{H}_A$ can be realized via an isometry to an extended space. For the pairwise 'Evolve' interaction, this extended space is the joint space $\mathcal{H}_A \otimes \mathcal{H}_B$ by the closed-system constraint. The joint operation is therefore an isometry:

$$V: \mathcal{H}_A \otimes \mathcal{H}_B \to \mathcal{H}_A \otimes \mathcal{H}_B$$

**Step 5 (Isometry to unitary).** For the isometry $V: \mathcal{H}_A \otimes \mathcal{H}_B \to \mathcal{H}_A \otimes \mathcal{H}_B$:

$$\dim(\mathcal{H}_A \otimes \mathcal{H}_B)_{\text{in}} = \dim(\mathcal{H}_A \otimes \mathcal{H}_B)_{\text{out}} = d_0^2 = 64$$

When input and output dimensions are equal, an isometry is necessarily a unitary operator [Nielsen & Chuang 2010, Section 2.2.5]. The 'Evolve' process preserves the Hilbert space dimensions of participating MPUs (the channel maps $\mathcal{S}(\mathcal{H}_{d_0}) \to \mathcal{S}(\mathcal{H}_{d_0})$ by Definition 27). Therefore:

$$U_{AB} := V \in \mathcal{U}(\mathcal{H}_A \otimes \mathcal{H}_B)$$

is unitary, satisfying $U_{AB}^\dagger U_{AB} = U_{AB} U_{AB}^\dagger = \mathbb{I}_{AB}$.

**Step 6 (Contractivity as partial trace effect).** The strict contractivity $f_{\text{RID}} < 1$ of the reduced channel $\mathcal{E}_N^{(A)}$ (Lemma E.1) arises because:

$$\mathcal{E}_N^{(A)}(\rho_A) = \text{Tr}_B\left[U_{AB}(\rho_A \otimes \rho_B)U_{AB}^\dagger\right]$$

The partial trace over $B$ discards the correlations established by $U_{AB}$ between $A$ and $B$. This produces apparent information loss when examining $A$ alone. Quantitatively, the data processing inequality [Nielsen & Chuang 2010, Theorem 9.2] ensures:

$$D_{\text{tr}}(\mathcal{E}_N^{(A)}(\rho_1), \mathcal{E}_N^{(A)}(\rho_2)) \leq D_{\text{tr}}(\rho_1, \rho_2)$$

with strict inequality (contractivity factor $f_{\text{RID}} < 1$) when the channel is non-unitary. As derived in Appendix M (Section M.4), the channel decomposition $\mathcal{E}_N = (1-p)\Psi + pT_\sigma$ with $p \geq 1/3$ yields $f_{\text{RID}} \leq 2/3 < 1$.

**Step 7 (Thermodynamic consistency).** The entropy production $\varepsilon \geq \ln 2$ (Theorem 31, rigorously derived in Appendix J from Lemma J.1) quantifies the irreversibility of the reduced dynamics on $A$, not the joint dynamics on $AB$. From the perspective of the joint system:

$$S(U_{AB}\rho_{AB}U_{AB}^\dagger) = S(\rho_{AB})$$

von Neumann entropy is conserved under unitary evolution [von Neumann 1932]. The SPAP-mandated entropy production represents the minimum information that must flow from $A$ to correlations with $B$ (or vice versa) during the self-referential update cycle. This is information relocated to $A$-$B$ correlations, not destroyed.

Specifically, if the initial state is $\rho_A \otimes \rho_B$ (product state), the mutual information after the interaction satisfies:

$$\Delta I(A:B) = I(A:B)_{\rho'} - I(A:B)_{\rho} = I(A:B)_{\rho'} \geq 0$$

Since $S(\rho_{AB}') = S(\rho_{AB}) = S(\rho_A) + S(\rho_B)$ (unitary evolution preserves entropy), and generically $S(\rho_A') \neq S(\rho_A)$ and $S(\rho_B') \neq S(\rho_B)$, the entropy increase in subsystem $A$ is compensated by correlation generation:

$$\Delta S_A = S(\rho_A') - S(\rho_A) = I(A:B)_{\rho'} - \Delta S_B$$

where $\Delta S_B = S(\rho_B') - S(\rho_B)$. The total is conserved: $\Delta S_A + \Delta S_B = I(A:B)_{\rho'}$.

This reconciliation is central to the entropy unification thesis (Thesis P.6.1, Appendix P): what appears as "entropy production" from a subsystem perspective is "correlation generation" from the global perspective. ∎

### E.9.5.7 Composition Lemmas

**Lemma E.9.5.4 (Composition of Unitary Operations).** *The composition of unitary operations is unitary. If $U_1: \mathcal{H} \to \mathcal{H}$ and $U_2: \mathcal{H} \to \mathcal{H}$ are unitary, then $U_2 U_1$ is unitary.*

*Proof.*

$$(U_2 U_1)^\dagger (U_2 U_1) = U_1^\dagger U_2^\dagger U_2 U_1 = U_1^\dagger \mathbb{I} U_1 = U_1^\dagger U_1 = \mathbb{I}$$

Similarly:

$$(U_2 U_1)(U_2 U_1)^\dagger = U_2 U_1 U_1^\dagger U_2^\dagger = U_2 \mathbb{I} U_2^\dagger = U_2 U_2^\dagger = \mathbb{I}$$

∎

**Lemma E.9.5.5 (Tensor Product of Unitary Operations).** *If $U_1: \mathcal{H}_1 \to \mathcal{H}_1$ and $U_2: \mathcal{H}_2 \to \mathcal{H}_2$ are unitary, then $U_1 \otimes U_2: \mathcal{H}_1 \otimes \mathcal{H}_2 \to \mathcal{H}_1 \otimes \mathcal{H}_2$ is unitary.*

*Proof.*

$$(U_1 \otimes U_2)^\dagger (U_1 \otimes U_2) = (U_1^\dagger \otimes U_2^\dagger)(U_1 \otimes U_2) = (U_1^\dagger U_1) \otimes (U_2^\dagger U_2) = \mathbb{I}_1 \otimes \mathbb{I}_2 = \mathbb{I}_{12}$$

The reverse product follows analogously. ∎

### E.9.5.8 Main Theorem: Unitarity from Closed-System ND-RID Structure

**Theorem E.9.5 (Unitarity from Closed-System ND-RID Structure).** *Global unitarity—the conservation of quantum information under time evolution—is a necessary consequence of the structure of ND-RID interactions in a closed MPU network.*

**Statement:** For any closed system evolving between Cauchy surfaces $\Sigma_1 \to \Sigma_2$, the evolution operator $U: \mathcal{H}_{\Sigma_1} \to \mathcal{H}_{\Sigma_2}$ is unitary.

*Proof.*

**Step 1 (Decomposition into elementary operations).** The time evolution from $\Sigma_1$ to $\Sigma_2$ is implemented by a sequence of elementary operations in the MPU network. By Lemma E.9.5.1, all information transfer occurs through ND-RID channels. The evolution decomposes into:

*(a)* Internal unitary evolution of individual MPUs between interactions (Definition 26), governed by $U_0^{(v)}(\Delta t) = e^{-i\hat{H}_v \Delta t/\hbar}$ for each MPU $v$

*(b)* Pairwise 'Evolve' interactions between MPUs (Definition 27), instantiating ND-RID (Definition 6/A.2.2)

Let $\{t_k\}_{k=0}^{n}$ with $t_0 = t_{\Sigma_1}$ and $t_n = t_{\Sigma_2}$ denote the sequence of interaction times.

**Step 2 (Unitarity of internal evolution).** By Definition 26, internal MPU evolution is explicitly unitary, governed by the Schrödinger equation with self-adjoint Hamiltonian $\hat{H}_v$. For each MPU $v$ and time interval $[t_k, t_{k+1}]$ without interactions:

$$U_0^{(v)}(t_{k+1} - t_k) = e^{-i\hat{H}_v (t_{k+1} - t_k)/\hbar}$$

satisfies $(U_0^{(v)})^\dagger U_0^{(v)} = \mathbb{I}$.

For the entire network during a non-interaction interval:

$$U_{\text{free}}(t_k, t_{k+1}) = \bigotimes_{v \in \mathcal{V}} U_0^{(v)}(t_{k+1} - t_k)$$

This is unitary by Lemma E.9.5.5 (applied inductively).

**Step 3 (Unitarity of pairwise interactions).** By Lemma E.9.5.3, each pairwise ND-RID interaction between MPUs $A$ and $B$ is implemented by a unitary operator $U_{AB}$ on the joint Hilbert space $\mathcal{H}_A \otimes \mathcal{H}_B$.

**Step 4 (Unitarity of simultaneous non-overlapping interactions).** At any instant, multiple non-overlapping MPU pairs may interact simultaneously. The ND-RID structure (Definition 27, Definition A.2.2) specifies pairwise interactions; simultaneous interactions involving disjoint subsystems decompose into concurrent pairwise operations.

Let $\mathcal{P}_k = \{(A_1, B_1), (A_2, B_2), \ldots, (A_m, B_m)\}$ denote the set of interacting pairs at time $t_k$, where $\{A_1, B_1, A_2, B_2, \ldots, A_m, B_m\}$ are pairwise disjoint. The joint interaction operator is:

$$U_{\text{int}}(t_k) = U_{A_1 B_1} \otimes U_{A_2 B_2} \otimes \cdots \otimes U_{A_m B_m} \otimes \mathbb{I}_{\text{rest}}$$

where $\mathbb{I}_{\text{rest}}$ is the identity on non-interacting MPUs. By Lemma E.9.5.5, this tensor product of unitaries is unitary.

**Step 5 (Unitarity of full evolution).** The complete evolution from $\Sigma_1$ to $\Sigma_2$ is the composition:

$$U_{\text{total}} = U_{\text{int}}(t_{n-1}) \cdot U_{\text{free}}(t_{n-2}, t_{n-1}) \cdot U_{\text{int}}(t_{n-2}) \cdots U_{\text{free}}(t_0, t_1) \cdot U_{\text{int}}(t_0)$$

(with $U_{\text{int}}(t_k) = \mathbb{I}$ if no interactions occur at $t_k$).

By Lemma E.9.5.4, the composition of unitary operators is unitary:

$$U_{\text{total}}^\dagger U_{\text{total}} = \mathbb{I}, \qquad U_{\text{total}} U_{\text{total}}^\dagger = \mathbb{I}$$

**Step 6 (Closed system constraint).** By Assumption E.9.5.1 (Closed System), following from Hypothesis 1:

- No information can enter from outside the system (none accessible to internal systems)
- No information can exit to outside the system (none detectable by internal systems)
- All MPU interactions are internal to the total system
- The Stinespring environment for any reduced subsystem dynamics is contained within $\mathcal{H}_{\Sigma}$ itself

A Cauchy surface $\Sigma$ is, by definition, a complete spatial slice through the emergent spacetime (Theorem 43, Section 11). For internal dynamics with no boundary accessible to internal systems, this completeness is exact.

**Step 7 (Conclusion).** The total evolution operator $U_{\text{total}}: \mathcal{H}_{\Sigma_1} \to \mathcal{H}_{\Sigma_2}$ is:

- A composition of unitary operators (Steps 2–5)
- Therefore unitary (Lemmas E.9.5.4, E.9.5.5)
- Acting between spaces of equal dimension (Lemma E.9.5.2)

Hence $U_{\text{total}}^\dagger U_{\text{total}} = U_{\text{total}} U_{\text{total}}^\dagger = \mathbb{I}$, establishing global unitarity. ∎

### E.9.5.9 Corollaries

**Corollary E.9.5.1 (Unitarity as Derived, Not Assumed).** *Unitarity of quantum evolution is not an independent axiom but a theorem following from the structure of self-referential prediction in a closed system.*

The SPAP entropy cost $\varepsilon \geq \ln 2$ (Theorem 31) generates two parallel derivation chains:

**Branch I (Causal Capacity Characterization):**

$$\varepsilon \geq \ln 2 \xrightarrow[\text{Lem E.1}]{} f_{\text{RID}} < 1 \xrightarrow[\text{Thm E.2}]{} C_{\max} < \ln d_0 \xrightarrow[\text{Thm E.3}]{} \text{finite boundary capacity} \xrightarrow[\text{Thm E.6}]{} S_{BH} = \frac{\mathcal{A}}{4G}$$

**Branch II (Global Unitarity):**

$$\varepsilon \geq \ln 2 + \text{Closed System (Hyp 1)} + \text{ND-RID structure (Def 27)} \xrightarrow[\text{Lem E.9.5.3}]{} U_{AB} \text{ unitary} \xrightarrow[\text{Thm E.9.5}]{} \text{global unitarity}$$

For systems with observation channels (Appendix P.5), Branch II applies to internal dynamics when the channel satisfies Definition P.5.3, ensuring internal closure from the internal perspective.

The same SPAP constraint ($\varepsilon \geq \ln 2$) that generates causal structure (finite $c = \delta/\tau_{\min}$, Theorem E.10.2) also ensures the reduced channels are contractive while joint operations remain unitary. Causality and unitarity are thus dual consequences of the framework's foundational structure.

*Proof.* The derivation chains are verified by tracing the logical dependencies:

**Branch I:**
1. SPAP (Theorem 10) → irreducible entropy cost $\varepsilon \geq \ln 2$ (Theorem 31, Appendix J)
2. $\varepsilon > 0$ + channel decomposition (Appendix M) → strict contractivity $f_{\text{RID}} \leq 2/3 < 1$ (Lemma E.1)
3. $f_{\text{RID}} < 1$ → bounded capacity $C_{\max} < \ln d_0$ (Theorem E.2)
4. Bounded capacity + geometric regularity (Theorem 43) → finite boundary information $S_{\max} \propto \mathcal{A}$ (Theorem E.3)
5. Thermodynamic consistency → $S_{BH} = \mathcal{A}/(4G)$ (Theorem E.6)

**Branch II:**
1. Closed system (Hypothesis 1) → Stinespring environment internal to network (Assumption E.9.5.1)
2. ND-RID pairwise structure (Definition 27/A.2.2) → locality constraint on interactions
3. Locality + closed system → joint operations unitary (Lemma E.9.5.3)
4. Unitary composition → global unitarity (Theorem E.9.5)

Both branches originate from the thermodynamic cost of self-referential prediction. ∎

---

**Corollary E.9.5.2 (Black Hole Information Conservation).** *For an evaporating black hole, the total information—encoded jointly in the horizon and emitted radiation—is conserved throughout the evaporation process.*

**Statement:** Let $\mathcal{A}_H(t)$ denote the horizon area at time $t$, and $S_{\text{rad}}(t)$ the coarse-grained entropy of emitted Hawking radiation. Then the fine-grained von Neumann entropy of the total state satisfies:

$$S_{\text{fine}}(\rho_{\text{total}}(t)) = S_{\text{fine}}(\rho_{\text{total}}(0))$$

throughout the evaporation process.

*Proof.*

**Step 1 (System definition).** Consider the black hole plus radiation as a closed system occupying a region $\mathcal{R}$ with boundary $\partial\mathcal{R}$ at spatial infinity (or a large sphere encompassing all radiation). The total Hilbert space factorizes as $\mathcal{H}_{\text{total}} = \mathcal{H}_{\text{BH}} \otimes \mathcal{H}_{\text{rad}}$, where the dimensions evolve as the horizon shrinks and radiation accumulates.

**Step 2 (Unitarity application).** By Theorem E.9.5, the evolution of this closed system is unitary:

$$\rho_{\text{total}}(t) = U(t)\rho_{\text{total}}(0)U(t)^\dagger$$

Unitary evolution preserves von Neumann entropy:

$$S(\rho_{\text{total}}(t)) = S(U(t)\rho_{\text{total}}(0)U(t)^\dagger) = S(\rho_{\text{total}}(0))$$

by the unitary invariance of von Neumann entropy [von Neumann 1932].

**Step 3 (Capacity transfer).** The horizon $\mathcal{H}$ has channel capacity $C_H(t) \propto \mathcal{A}_H(t)/(4G)$ (Theorem E.6). As the black hole evaporates, $\mathcal{A}_H(t) \to 0$, so $C_H(t) \to 0$. By unitarity, the information initially associated with the black hole must be relocated to the radiation field and horizon-radiation correlations.

**Step 4 (Page curve emergence—conditional result).** The entanglement entropy between radiation and remaining black hole, $S_{\text{ent}}(t) = S(\rho_{\text{rad}}(t))$ for the reduced radiation state, follows the Page curve under the following assumption:

**Assumption (Approximate k-design dynamics).** The black hole's internal MPU dynamics, governed by PCE optimization (Definition 15), generates scrambling dynamics that approximate a unitary $k$-design for sufficiently large $k$. This assumption is motivated by:

- PCE optimization drives systems toward configurations that maximize predictive efficiency, which generically produces chaotic dynamics with rapid information spreading [Brandão et al. 2016]
- Scrambling dynamics generically approach random unitary behavior [Hayden & Preskill 2007]
- The thermalization timescale $t_{\text{scramble}} \sim \beta \ln S_{BH}$ [Sekino & Susskind 2008] is short compared to the evaporation timescale
- The spectral gap $\Delta_{\text{gap}} > 0$ (Lemma E.6.1) ensures exponential approach to equilibrium, a necessary condition for design formation [Brandão et al. 2016]

Under this assumption, by Theorem K.3 (Appendix K), the expected entanglement entropy satisfies:

$$\left|\mathbb{E}[S_{\text{ent}}(t)] - S_{\text{Page}}(d_E(t), d_L(t))\right| \leq \epsilon_t$$

where $d_E(t)$ and $d_L(t)$ are the dimensions of the early (radiation) and late (black hole) Hilbert spaces, and:

$$S_{\text{Page}}(m,n) = \sum_{k=n+1}^{mn}\frac{1}{k} - \frac{m-1}{2n} \quad \text{for } m \leq n$$

is the exact average entropy for Haar-random unitaries [Page 1993]. The error term $\epsilon_t$ is bounded by the deviation from exact Haar-randomness, which is controlled by the frame potential of the dynamics [Roberts & Yoshida 2017].

The Page curve exhibits:

- *Early times* ($t < t_{\text{Page}}$): $S_{\text{ent}}(t) \approx S_{\text{rad}}(t)$, increasing as radiation accumulates
- *Page time* ($t = t_{\text{Page}}$): $S_{\text{ent}}$ reaches maximum when $S_{\text{rad}} \approx S_{\text{BH}}/2$
- *Late times* ($t > t_{\text{Page}}$): $S_{\text{ent}}(t) \approx \mathcal{A}_H(t)/(4G)$, decreasing as horizon shrinks

**Step 5 (Final state).** At complete evaporation ($\mathcal{A}_H \to 0$), unitarity (Theorem E.9.5) guarantees that the final radiation state $\rho_{\text{rad}}^{\text{final}}$ is pure if the initial state was pure: $S(\rho_{\text{rad}}^{\text{final}}) = S(\rho_{\text{initial}}) = 0$. All information is encoded in the radiation correlations. ∎

**Remark E.9.5.1 (Status of k-design assumption).** The k-design assumption in Step 4 is supported by the following framework elements but not yet derived from first principles:

*(i) Supporting evidence:*
- The spectral gap $\Delta_{\text{gap}} = -\tau^{-1}\ln f_{\text{RID}} > 0$ (Lemma E.6.1) ensures exponential mixing
- PCE optimization selects for detailed balance (Theorem G.1.9.2), producing thermal equilibrium states
- The scrambling time $t_{\text{scramble}} \sim (S_{BH}/C_{\max}) \ln S_{BH}$ (Appendix K.3.2) matches the fast-scrambler bound [Sekino & Susskind 2008]

*(ii) Required for first-principles derivation:*
- Spectral characterization of PCE-optimal Hamiltonians (chaotic level statistics)
- Frame potential calculation for PCE dynamics
- Verification of eigenstate thermalization hypothesis (ETH) compliance

*(iii) Independence of core result:* The central claim—information conservation via unitarity (Steps 1–3)—is independent of the k-design assumption and follows directly from Theorem E.9.5. The Page curve (Step 4) provides additional structure under the stated assumption.

---

**Corollary E.9.5.3 (Predictive Necessity of Information Conservation).** *Information conservation is required for prediction to remain possible. Unitarity is necessary for the framework's foundational axiom (POP, Axiom 1) to remain satisfiable.*

*Proof.*

**Step 1 (Prediction requires regularity).** By Theorem 6 (Regularity Necessity, Appendix C), non-trivial prediction requires environmental regularities: patterns that persist and can be exploited for anticipation. These regularities are encoded in correlations between system states at different times.

**Step 2 (Correlations require information preservation).** The mutual information between system states at times $t$ and $t + \Delta t$ is:

$$I(S(t); S(t+\Delta t)) = S(\rho(t)) + S(\rho(t+\Delta t)) - S(\rho_{t,t+\Delta t})$$

where $\rho_{t,t+\Delta t}$ is the joint state encoding correlations across the time interval. For unitary evolution with $\rho(t+\Delta t) = U(\Delta t)\rho(t)U(\Delta t)^\dagger$, the mutual information is maximal: complete information about $\rho(t)$ determines $\rho(t+\Delta t)$ and vice versa.

**Step 3 (Non-unitary evolution destroys correlations).** Suppose the evolution were implemented by a strictly contractive channel $\mathcal{E}$ with $f_{\mathcal{E}} < 1$ acting on the global state (not merely a reduced subsystem). Consider the joint state $\rho_{01}$ encoding correlations between times $t_0$ and $t_1$. Under evolution $\mathcal{E} \otimes \text{id}$ applied to the later subsystem, the data processing inequality [Lindblad 1975] yields:

$$I(S_0 : S_1)_{(\text{id} \otimes \mathcal{E})(\rho_{01})} \leq I(S_0 : S_1)_{\rho_{01}}$$

with strict inequality when $\mathcal{E}$ is non-unitary and the state is not in its fixed-point subspace.

For a channel with spectral gap $1 - f_{\mathcal{E}} > 0$, repeated application yields exponential convergence to the fixed point $\rho_*$ [Wolf 2012]:

$$D_{\text{tr}}(\mathcal{E}^n(\rho), \rho_*) \leq f_{\mathcal{E}}^n \cdot D_{\text{tr}}(\rho, \rho_*)$$

As $n \to \infty$, all initial states converge to $\rho_*$. The mutual information between initial and final states decays:

$$I(S(0); S(n\tau)) \xrightarrow{n \to \infty} 0$$

The system becomes unpredictable: past states carry asymptotically zero information about future states beyond the fixed point.

**Step 4 (Quantitative bound).** For a globally non-unitary channel with contractivity factor $f < 1$ applied $n$ times:

$$I(S(0); S(n\tau)) \leq S(\rho(0)) - S(\rho_*) + S(\rho_*) f^{2n} \cdot \text{const}$$

The correlation term decays exponentially with rate $-2\ln f > 0$. This violates the existence of persistent regularities required by Theorem 6 (Regularity Necessity).

**Step 5 (Unitarity as necessary condition for POP satisfiability).** The Prediction Optimization Problem (POP, Axiom 1) asserts that predictive systems exist and can achieve sustained better-than-random performance: $\bar{\alpha} > \alpha_{\text{rand}}$, where $\alpha_{\text{rand}}$ is random-guess performance. By Steps 3–4, such performance is achievable only if regularities persist, which requires global information conservation. Therefore, global unitarity is a *necessary condition* for POP to be satisfiable.

**Step 6 (Self-consistency).** The framework exhibits self-consistency: SPAP (derived from POP via Theorems 10–11) generates $\varepsilon \geq \ln 2$, which—through the closed-system constraint (Hypothesis 1) and the joint unitarity of ND-RID operations (Lemma E.9.5.3)—implies global unitarity (Theorem E.9.5), which is necessary for POP to be satisfiable (Step 5). The axiom generates the conditions for its own validity. ∎

---

**Corollary E.9.5.4 (Apparent vs. Fundamental Non-Unitarity).** *The strict contractivity $f_{\text{RID}} < 1$ of reduced ND-RID channels (Lemma E.1) represents apparent non-unitarity arising from subsystem restriction, not fundamental information loss.*

*Proof.* By Lemma E.9.5.3, the joint evolution $U_{AB}$ of interacting MPUs is unitary. The reduced channel on MPU $A$:

$$\mathcal{E}_N^{(A)}(\rho_A) = \text{Tr}_B\left[U_{AB}(\rho_A \otimes \rho_B)U_{AB}^\dagger\right]$$

exhibits $f_{\text{RID}} \leq 2/3 < 1$ (Lemma E.1, Appendix M) because the partial trace discards $A$-$B$ correlations established by $U_{AB}$.

**Quantitative analysis:** Let the initial state be $\rho_{AB} = \rho_A \otimes \rho_B$ (product state). After the interaction:

$$\rho_{AB}' = U_{AB}(\rho_A \otimes \rho_B)U_{AB}^\dagger$$

The mutual information generated is:

$$\Delta I(A:B) = I(A:B)_{\rho'} - I(A:B)_{\rho} = I(A:B)_{\rho'} \geq 0$$

Since $S(\rho_{AB}') = S(\rho_{AB}) = S(\rho_A) + S(\rho_B)$ (unitary evolution preserves total entropy), and generically $S(\rho_A') \neq S(\rho_A)$:

$$I(A:B)_{\rho'} = S(\rho_A') + S(\rho_B') - S(\rho_{AB}') = S(\rho_A') + S(\rho_B') - S(\rho_A) - S(\rho_B)$$

The apparent "information loss" in subsystem $A$—quantified by the entropy increase $\Delta S_A = S(\rho_A') - S(\rho_A) \geq 0$—is precisely compensated by correlations with $B$. The entropy production $\varepsilon \geq \ln 2$ (Theorem 31, Appendix J) measures the minimum correlation generation required by the SPAP update cycle.

For the joint system: $S(U_{AB}\rho_{AB}U_{AB}^\dagger) = S(\rho_{AB})$. No information is destroyed globally.

This distinction—between subsystem-level apparent erasure and global conservation—is central to the entropy unification thesis (Thesis P.6.1, Appendix P). What appears as "entropy production" from a subsystem perspective is "correlation generation" from the global perspective.

This principle extends to observation channels (Appendix P.5): external observation accesses correlated information without participating in internal dynamics. The observation channel's internal inaccessibility ($\Delta I_{int} = 0$, Definition P.5.3(ii)) ensures no internal entropy production is triggered, while external agents extracting information incur costs in their own thermodynamic context. ∎

### E.9.5.10 Numerical Values

For reference, we collect the key numerical values appearing in this section:

| Quantity | Symbol | Value | Source |
|:---------|:-------|:------|:-------|
| MPU Hilbert space dimension | $d_0$ | 8 | Theorem 23 |
| Irreducible entropy cost | $\varepsilon$ | $\ln 2 \approx 0.693$ nats | Theorem 31 (Appendix J) |
| Maximum channel capacity | $C_{\max}$ | $\ln d_0 - \varepsilon = 2\ln 2 \approx 1.386$ nats | Eq. E.15 (Appendix E) |
| Contractivity factor bound | $f_{\text{RID}}$ | $\leq 1 - \frac{\ln 2}{\ln 8} = \frac{2}{3} \approx 0.667$ | Appendix M, Sec. M.4 |
| MPU spacing / Planck length | $\delta/L_P$ | $\sqrt{8\ln 2} \approx 2.355$ | Appendix Q, Eq. Q.18 |

### E.9.5.11 Concluding Remarks

**Remark E.9.5.2 (Relation to Standard Quantum Mechanics).** In standard quantum mechanics, unitarity is postulated as an axiom governing closed-system evolution (Postulate 2 of von Neumann's formulation [von Neumann 1932]). The present derivation reveals unitarity as a theorem following from more fundamental principles: the structure of self-referential prediction (SPAP), the thermodynamic constraints it implies ($\varepsilon \geq \ln 2$), and the closed-system assumption (Hypothesis 1).

The key insight is that while individual ND-RID channels are strictly contractive ($f_{\text{RID}} \leq 2/3 < 1$, Lemma E.1, Appendix M), this contractivity arises from partial-trace effects on joint unitary operations (Lemma E.9.5.3), not from fundamental information destruction. The derivation applies to closed systems; open systems exhibit apparent non-unitarity through entanglement with external degrees of freedom, consistent with the standard quantum formalism and with Corollary E.9.5.4.

**Remark E.9.5.3 (Consistency with Arrow of Time).** Global unitarity (Theorem E.9.5) and thermodynamic irreversibility (Appendix O, Theorem O.3) are compatible because they describe different operational levels:

- *Global level:* The von Neumann entropy of the total closed-system state is conserved under $U_{\text{total}}$. If $\rho_{\text{total}}(0)$ is pure, it remains pure throughout evolution.

- *Subsystem level:* Every physical observer occupies a subsystem perspective, accessing only reduced states via partial trace. The entropy production $\varepsilon \geq \ln 2$ (Theorem 31) quantifies information flowing into correlations invisible from that perspective—information relocated, not destroyed.

The arrow of time (Appendix O, Theorem O.3) emerges not from fundamental non-unitarity but from the universality of the perspectival restriction: every predictor is necessarily embedded in what it predicts (SPAP self-other partition, Appendix P.12), ensuring that the thermodynamic ratchet operates for all observers. This reconciliation exemplifies the entropy unification thesis (Thesis P.6.1): apparent irreversibility and fundamental reversibility coexist because "irreversibility" is always relative to a subsystem boundary.

**Remark E.9.5.4 (Derivational Priority).** The framework achieves what might initially seem paradoxical: deriving both unitarity (information conservation) and the second law (entropy increase) from the same source ($\varepsilon \geq \ln 2$). The resolution is that these describe the same physics from different vantage points—global versus perspectival—unified by the structure of self-referential prediction.

The parallel derivation structure:

$$\text{SPAP} \xrightarrow[\text{Thm 31}]{\varepsilon \geq \ln 2} \begin{cases} \text{Branch I:} & f_{\text{RID}} < 1 \to C_{\max} < \ln d_0 \to S_{BH} = \mathcal{A}/(4G) \\ \text{Branch II:} & U_{AB} \text{ unitary} \to \text{global unitarity (internally closed)} \end{cases}$$

demonstrates that the causal capacity bounds (Branch I) and global unitarity (Branch II) are complementary consequences of a single constraint: the thermodynamic cost of self-referential prediction.

**Remark E.9.5.5 (Role of Closed-System Assumption).** The derivation of global unitarity (Theorem E.9.5) critically depends on Hypothesis 1. Without this assumption, the Stinespring environment for reduced dynamics could include external degrees of freedom, and global evolution could in principle be non-unitary. Within the PU framework, Hypothesis 1 is a foundational postulate asserting that the MPU network constitutes internally complete physical reality—no information leaks to degrees of freedom accessible by internal systems (consistent with the observation channel architecture of Appendix P.5). This transforms unitarity from a postulate into a theorem.

The assumption admits a natural extension to systems with external observation (Appendix P.5). An observation channel satisfying Definition P.5.3 permits external information extraction while preserving internal closure: internal systems gain no information from the channel ($\Delta I_{int} = 0$) and internal states are not modified by external reading. From the internal perspective, such a system satisfies Assumption E.9.5.1, and Theorem E.9.5 applies to its internal dynamics. The external observer incurs the thermodynamic cost $\varepsilon \geq \ln 2$ in their own context (Theorem 33), consistent with the Reflexivity Constraint.

---


## E.10 Lieb-Robinson Velocity from PCE Entropy Costs

The finite Lieb-Robinson velocity bounding information propagation emerges directly from PCE optimization of correlation maintenance costs.

### E.10.1 Entropy Cost of Correlation Extension

**Definition E.10.1 (Correlation Extension Cost).** The PCE cost of extending a correlation from distance $r$ to $r + \delta r$ in the MPU network is:

$$\Delta V_{\text{corr}}(r \to r + \delta r) = \varepsilon_{\text{link}} \cdot n_{\text{links}}(r, \delta r) + V_{\text{prop}}(r, \delta r)$$

where $\varepsilon_{\text{link}} \geq \ln 2$ is the per-link entropy cost (Theorem 31) and $n_{\text{links}}$ counts required intermediate links.

**Lemma E.10.1 (Linear Scaling of Link Count).** In the geometrically regular network (Theorem 43), extending correlations by distance $\delta r$ requires:

$$n_{\text{links}}(r, \delta r) = \frac{\delta r}{\delta} + O(1)$$

where $\delta$ is the MPU spacing.

*Proof.* Geometric regularity (Definition C.3) implies locally Euclidean structure at scales $\gg \delta$. The minimum path between points separated by $\delta r$ traverses $\lceil \delta r / \delta \rceil$ links. The $O(1)$ correction accounts for discrete lattice effects. ∎

**Theorem E.10.1 (Locality from Entropy Cost).** PCE optimization implies that maintaining long-range correlations is thermodynamically prohibitive, producing effective locality.

*Proof.*

**Step 1 (Cumulative cost).** The total entropy cost of maintaining a correlation across distance $R$ is obtained by summing over the $\lceil R/\delta \rceil$ links traversed. In the continuum approximation valid for $R \gg \delta$:

$$S_{\text{total}}(R) = \int_0^R \frac{\varepsilon_{\text{link}}}{\delta} \, dr = \frac{\varepsilon_{\text{link}} \cdot R}{\delta}$$

With $\varepsilon_{\text{link}} = \ln 2$ (Theorem 31):

$$S_{\text{total}}(R) = \frac{R \ln 2}{\delta}$$

**Step 2 (Thermodynamic cost).** By Landauer's principle [Landauer 1961], this entropy production requires minimum energy dissipation:

$$E_{\text{dissipated}}(R) \geq k_B T \cdot S_{\text{total}}(R) = \frac{k_B T \ln 2 \cdot R}{\delta}$$

with equality achieved at the Landauer limit of optimal erasure.

**Step 3 (PCE penalty).** The PCE potential (Definition D.1) includes propagation costs proportional to thermodynamic dissipation. Since $E_{\text{dissipated}} \geq \text{const} \times R$, the PCE cost grows at least linearly with distance:

$$V_{\text{prop}}(R) \geq \alpha \cdot R$$

for some $\alpha > 0$. Long-range correlations incur linearly growing PCE cost. PCE optimization (Definition 15) therefore favors local correlations, as non-local correlations have higher Signal Cost without proportionate increase in Meaning Potential. ∎

### E.10.2 Thermodynamic Derivation of the Light Cone

**Theorem E.10.2 (Maximum Propagation Velocity from PCE).** The maximum velocity for information propagation is:

$$v_{\text{max}} = \frac{\delta}{\tau_{\min}} = c$$

where $\tau_{\min}$ is the minimum MPU cycle time (Theorem 29) and $c$ is the emergent speed of light (Theorem 46).

*Proof.*

**Step 1 (Minimum time per link).** Each ND-RID interaction requires minimum time $\tau_{\min}$ (Theorem 29). This bound arises from the finite complexity of the predictive update cycle and cannot be circumvented without violating the logical structure of the Fundamental Predictive Loop (Definition 4).

**Step 2 (Maximum propagation rate).** Information propagating across distance $R$ must traverse $R/\delta$ links, each requiring time $\geq \tau_{\min}$:

$$t_{\min}(R) = \frac{R}{\delta} \cdot \tau_{\min}$$

**Step 3 (Velocity bound).** The maximum propagation velocity is:

$$v_{\max} = \frac{R}{t_{\min}(R)} = \frac{\delta}{\tau_{\min}}$$

**Step 4 (Identification with $c$).** Lorentz invariance of the emergent spacetime (Theorem 46) requires that spatial and temporal discretization scales maintain the same ratio as the Planck units:

$$\frac{\delta}{L_P} = \frac{\tau_{min}}{t_P}$$

where $L_P$ and $t_P$ are the Planck length and time. This ratio equality follows from the requirement that the discretization not select a preferred frame. Since $c = L_P/t_P$ by definition of Planck units:

$$v_{\max} = \frac{\delta}{\tau_{\min}} = \frac{L_P}{t_P} = c$$

The emergent speed of light is thus identified with the maximum causal propagation velocity of the MPU network. ∎

*Remark (Relation to Standard Lieb-Robinson Bounds).* The standard Lieb-Robinson theorem [Lieb & Robinson 1972] establishes finite propagation speed in quantum lattice systems through analytic bounds on commutator growth, requiring local bounded Hamiltonians and finite interaction range. The present derivation reaches the same conclusion—finite maximum velocity—through thermodynamic arguments: the entropy cost $\varepsilon \geq \ln 2$ per link and finite processing time $\tau_{\min}$ per cycle together bound $v_{\max}$. The two approaches are complementary; the thermodynamic derivation clarifies *why* the velocity is bounded (information processing has irreducible cost), while the standard proof provides rigorous analytic bounds.

**Corollary E.10.1 (Entropy Production Rate Bound).** The rate of entropy production for information propagation is bounded below:

$$\frac{dS}{dt} \geq \frac{\varepsilon}{\tau_{\min}} = \frac{\ln 2}{\tau_{\min}}$$

per active channel. Faster propagation would require $\varepsilon < \ln 2$, violating Theorem 31.

*Proof.* Each link traversal produces entropy $\geq \varepsilon = \ln 2$ (Theorem 31) and requires time $\geq \tau_{\min}$ (Theorem 29). The minimum rate follows by division. ∎

**Corollary E.10.2 (Thermodynamic Origin of Locality).** Locality is not a primitive axiom but emerges from:
1. Finite entropy cost per link: $\varepsilon \geq \ln 2$ (Theorem 31)
2. Finite minimum cycle time: $\tau_{\min} > 0$ (Theorem 29)
3. PCE optimization minimizing total entropy production (Definition 15)

Superluminal propagation would require either $\varepsilon < \ln 2$ (violating Theorem 31) or $\tau < \tau_{\min}$ (violating Theorem 29). Both are forbidden by the logical structure of self-referential prediction established in Appendix J.

*Proof.* Suppose information could propagate at speed $v > c = \delta/\tau_{\min}$. Then crossing distance $\delta$ would require time $t < \tau_{\min}$. But each link crossing requires executing the ND-RID update cycle, which by Theorem 29 cannot complete in time less than $\tau_{\min}$. Alternatively, if $t = \tau_{\min}$ but multiple links were traversed, the entropy production per link would be $< \varepsilon$, violating Theorem 31. Both possibilities contradict established bounds, so $v \leq c$. ∎

### E.10.3 Summary

| Result | Statement | Origin |
|:-------|:----------|:-------|
| Theorem E.10.1 | Long-range correlations incur linear entropy cost $S(R) \geq R\ln 2/\delta$ | PCE + Landauer |
| Theorem E.10.2 | $v_{\max} = \delta/\tau_{\min} = c$ | Finite cycle time + spacing |
| Corollary E.10.1 | $dS/dt \geq \ln 2/\tau_{\min}$ per channel | Entropy bound + time bound |
| Corollary E.10.2 | Locality emerges from thermodynamics | PCE optimization |

The causal structure of spacetime—the light cone—is not imposed but derived from the entropy costs of information propagation in the MPU network. The speed of light $c$ emerges as the ratio of the fundamental length scale $\delta$ to the fundamental time scale $\tau_{\min}$, both determined by PCE optimization of predictive processing.

---


## E.11 Conclusion

This appendix provided a theoretical derivation of the Horizon Entropy Area Law (Theorem 49 / Theorem E.6) from PU principles, extended by bulk reconstruction (Section E.8), general horizon classification (Section E.9), and thermodynamic derivation of Lieb-Robinson velocity (Section E.10). The core derivation proceeds in two complementary stages:

**Stage 1 (Quantum Entanglement Foundation, Sections E.6.1–E.6.3):** The area law is first established from quantum many-body entanglement structure, independent of gravitational field equations. The MPU network's ND-RID dynamics satisfy the prerequisites for quantum many-body area laws (Lemma E.6.1): locality, finite Lieb-Robinson velocity, spectral gap, and exponential clustering. Applying Hastings-type bounds to the MPU network ground state yields the entanglement entropy area scaling $S_{ent}(A) = \eta_{ent} \cdot |\partial A| + \mathcal{O}(1)$ (Theorem E.4'). Local thermodynamic consistency—requiring the Clausius relation $\delta S = \delta Q / T$ to hold for all local Rindler horizons using only kinematic results (Unruh temperature, entanglement first law, Raychaudhuri equation)—uniquely fixes the coefficient $\eta_{ent} = 1/(4G)$ in natural units (Theorem E.5). This identifies the gravitational constant $G$ as an emergent quantity determined by the MPU network's quantum information structure, grounding the area law in fundamental quantum entanglement principles.

**Stage 2 (Operational Channel Counting, Sections E.6.4–E.6.5):** The same result is independently derived from operational principles. ND-RID irreversibility ($\varepsilon \ge \ln 2$, Theorem 31, rigorously proven in Appendix J) guarantees strict channel contractivity ($f_{RID}<1$, Lemma E.1), fundamentally bounding classical information capacity ($C_{max} < \ln d_0$, Theorem E.2). Combined with the geometric scaling of effective information channels across a boundary ($N_{eff\_links} \propto \mathcal{A}$, incorporating correlation factor $\chi$, conditional on Theorem 43, Theorem E.3), this yields the linear entropy-area relation $S_{max} = k_B \left(\frac{\chi C_{max}(f_{RID})}{\eta \delta^2}\right) \mathcal{A}$ (Equation E.6). Consistency between the two approaches (Section E.6.4) requires $\frac{\chi C_{max}(f_{RID})}{\eta \delta^2} = \frac{1}{4G}$, yielding the explicit Bekenstein-Hawking coefficient $1/(4L_P^2)$ (Theorem E.6).

**Synthesis:** This dual derivation—from quantum entanglement structure AND operational channel capacity—demonstrates that the area law emerges necessarily from the MPU framework's foundational principles. The emergent gravitational constant is expressed as $G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{max}(f_{RID})}$ (Equation E.9), linking the Planck scale ($L_P^2 = G\hbar/c^3$) to fundamental MPU parameters ($\delta, \eta, \chi, \varepsilon$ via $C_{max}$) controlling geometric density and information capacity. As shown in **Section E.7 (Equations E.14, E.15)**, PCE optimization of the vacuum state yields $C_{max}^* = \ln(d_0) - \varepsilon = 2\ln(2)$, with $\chi^* \approx 1$ and $\eta^* \approx 1$, demonstrating structural consistency and predicting $\delta/L_P \approx 2.355$. The derived Area Law interprets the black hole horizon thermodynamically as representing the maximal information boundary defined by both the fundamental quantum entanglement structure and the ND-RID capacity limits. This provides the necessary thermodynamic foundation (Theorem 49) for deriving Einstein's Field Equations (Section 12).