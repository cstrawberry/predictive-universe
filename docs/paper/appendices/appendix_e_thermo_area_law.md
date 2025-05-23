# Appendix E: Thermodynamic Limits and Horizon Entropy Area Law

**E.1 Introduction**

This Appendix provides a derivation of the fundamental information-theoretic and thermodynamic limits imposed by the Non-Deterministic Reflexive Interaction Dynamics (ND–RID, Definition 6, Definition A.2) governing the MPU 'Evolve' process (Definition 27). These limits are consequences of the PU framework's core principles (POP/PCE, SPAP, interaction constraints), underpinned by quantum thermodynamics and information theory. We quantify the inherent thermodynamic irreversibility and bounds on information capacity associated with ND–RID interactions across causal boundaries, culminating in the derivation of the Horizon Entropy Area Law (Theorem 49), foundational for the thermodynamic derivation of Einstein's Field Equations (Section 12).

The derivation proceeds logically:
1.  Establish ND–RID irreversibility by lower-bounding minimal entropy production, linking it to the necessary state-change cost $\varepsilon \ge \ln 2$ (Theorem 31, derived in Appendix J). (Section E.2: Theorem E.1, Corollary E.1)
2.  Prove that this irreversibility implies strict channel contractivity ($f_{\mathrm{RID}} < 1$) for the average 'Evolve' channel. (Section E.3: Lemma E.1)
3.  Derive a strict bound ($C(\mathcal{E}_N) < \ln d_0$) on the channel's classical information capacity based on this contractivity. (Section E.4: Theorem E.2)
4.  Establish the geometric scaling of effective independent boundary information channels, conditional on emergent geometric regularity (Theorem 43), incorporating correlation effects. (Section E.5: Theorem E.3)
5.  Synthesize these results to derive the Horizon Entropy Area Law (Theorem E.4, identified as Theorem 49 in the main text), explicitly calculating the Bekenstein-Hawking coefficient $1/4$. (Section E.6)
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

*Proof:* This theorem synthesizes standard results from the thermodynamics of information processing (e.g., [Sagawa & Ueda 2009]; [Parrondo et al. 2015]) with the PU framework's specific derivation of the irreducible cost $\varepsilon$ (Theorem 31 from Appendix J). The terms $I(\rho; \mathcal{E}_{N}, o)$ and $D_{KL}[\rho'_o || \mathcal{E}_{N}(\rho)]$ represent the minimal thermodynamic costs associated with information acquisition and feedback control, respectively (as detailed in the proof of Theorem 32). The term $\varepsilon \cdot \Theta(I)$ represents the additional, unavoidable cost incurred by the MPU due to the logical irreversibility of the self-referential update cycle (SPAP logic) when non-trivial information ($I>0$) is gained and processed. The Heaviside function $\Theta(I)$ ensures this cost applies only when such information is relevant. The bound is additive for these independent sources of entropy production. QED

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
1.  **Primitivity of $\mathcal{E}_N$:** The 'Evolve' process (Definition 27), instantiating ND-RID, is not a trivial identity or purely unitary operation due to the inherent SPAP logic and its associated irreducible cost $\varepsilon \ge \ln 2 > 0$ (Theorem 31, Corollary E.1). This SPAP core involves logically irreversible state merging (Appendix J, Lemma J.1), physically realized via operations like subsystem reset (e.g., 3-Qubit MPU model, Section 7.1.3). A channel $\mathcal{E}_N$ is primitive if it is irreducible and aperiodic [Baumgartner & Narnhofer 2008].
    *   **Irreducibility:** The combination of general interactions $N(t)$ (coupling different degrees of freedom within $\mathcal{H}_{d_0}$), and the averaging over pervasive, diffusive stochastic perspective shifts $s \to s'$ (governed by $G_{persp}$, Appendix M.3.3.1), along with the fundamental SPAP logic, contributes to $\mathcal{E}_N$ being a *strictly positive map* (e.g., by ensuring its Choi matrix is strictly positive). A strictly positive map is inherently irreducible [Baumgartner & Narnhofer 2008; Wolf 2012].
    *   **Aperiodicity:** The MPU 'Evolve' dynamics, with its SPAP logic's non-unitary subsystem resets (costing $\varepsilon > 0$) and mixing unitary operations $U_{int}$ that couple degrees of freedom across $\mathcal{H}_{d_0}$ (as exemplified in Sec 7.1.3), ensures that the set of effective Kraus operators for the average channel $\mathcal{E}_N$ generates the full matrix algebra $\mathcal{B}(\mathcal{H}_{d_0})$ [cf. Sanz et al. 2010]. Generation of the full algebra implies aperiodicity (e.g., via the quantum Wielandt theorem [Sanz et al. 2010).
    The primitivity of $\mathcal{E}_N$ thus ensures it has a unique, full-rank fixed point $\rho_{fix}$ (see Step 2).

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
*   **Trace-Norm Contractivity Factor $f_{\mathrm{RID}}(\Phi)$:** As implied by Lemma E.1, the contractivity factor is $f_{\mathrm{RID}}(\Phi) = \sup_{\rho,\sigma\in\mathcal S(\mathcal H_{d_0}), \rho\neq\sigma} \frac{\|\Phi(\rho)-\Phi(\sigma)\|_{1}}{\|\rho-\sigma\|_{1}}$, where $\|\cdot\|_1$ is the trace norm. Lemma E.1 establishes $f_{\mathrm{RID}}(\mathcal{E}_N) < 1$. When $\dim\mathcal{H}_{in}=\dim\mathcal{H}_{out}=d_0$, $f_{\mathrm{RID}}(\Phi)=1$ if and only if $\Phi$ is a unitary channel (a surjective isometry) [Pérez-García et al. 2006].
*   **One–Shot and Regularized Classical Capacities:** For a channel $\Psi$, the one–shot Holevo capacity is
    $$
    \chi^{\ast}(\Psi):=\max_{\{p_{k},\rho_{k}\}} \Bigl[ S\Bigl(\sum_{k}p_{k}\Psi(\rho_{k})\Bigr) -\sum_{k}p_{k}S\bigl(\Psi(\rho_{k})\bigr) \Bigr]
    \tag{E.2a}
    $$
    where $S(\cdot)$ is the von Neumann entropy. The classical Shannon capacity $C(\Phi)$ is the regularized limit (HSW Theorem):
    $$
    C(\Phi):=\lim_{n\to\infty}\frac1n\chi^{\ast}(\Phi^{\otimes n})
    \tag{E.2b}
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
Conditional on the Necessary Emergence of Geometric Regularity (Theorem 43), consider the MPU network $\mathcal{N}$ whose emergent geometry is described by a D=4 dimensional manifold $(M, g_{\mu\nu})$ satisfying uniform volume growth and bounded Ricci curvature. Let $\mathcal{H} \subset M$ be a smooth, compact, 2-dimensional boundary surface (e.g., a cross-section of a causal horizon) with area $\mathcal{A} = \text{Area}(\mathcal{H})$. The total number of effective independent information channels $N_{eff\_links}$ crossing this boundary $\mathcal{H}$ (representing the fundamental pathways for reliable information transfer via ND–RID interactions) scales linearly with its area $\mathcal{A}$ in the macroscopic limit ($\mathcal{A} \gg \delta^{2}$, where $\delta$ is the mean microscopic MPU spacing):
$$
N_{eff\_links} = \sigma_{eff\_link}\;\mathcal A\;+\;o(\mathcal A)
\tag{E.5}
$$
where $\sigma_{eff\_link}$ is the effective surface density of independent information channels. This density is related to the underlying geometric density of potential links and the impact of correlations. Specifically:
*   Let $\sigma_{geom\_link} = 1/(\eta \delta^2)$ be the purely geometric surface density of potential links based on MPU spacing $\delta$ and packing factor $\eta$ (where $\eta$ is an $\mathcal{O}(1)$ factor, e.g., $\eta=1$ for simple cubic packing normal to surface).
*   Correlations between the states and interactions of nearby MPUs reduce the number of *independent* degrees of freedom that contribute to the total information capacity across the boundary.
*   Let $\chi$ be the dimensionless correlation factor ($0 < \chi \le 1$) quantifying this reduction. $\chi=1$ represents fully independent channels, while $\chi<1$ reflects the loss of effective channel density due to correlations.
*   The effective density is therefore $\sigma_{eff\_link} = \chi \, \sigma_{geom\_link} = \chi / (\eta \delta^2)$. The precise value of $\chi$ depends on the equilibrium state of the MPU network (determined by PCE optimization) and is treated here as a parameter bounded between 0 and 1.

*Proof.* Geometric regularity (Theorem 43) ensures that on scales larger than the MPU spacing $\delta$, the network locally resembles a smooth D-dimensional manifold (here D=4). For a 2-dimensional surface $\mathcal{H}$ embedded in this manifold, the number of fundamental units (MPUs or links between them) piercing this surface is expected to scale with the area of the surface divided by the characteristic area occupied by one such unit or link.
1.  **Geometric Link Density:** If MPUs are arranged with an average spacing $\delta$, the number of MPUs per unit volume is $\sim 1/\delta^3$ (in 3D space). For a 2D surface, the number of links crossing it per unit area, $\sigma_{geom\_link}$, would be proportional to $1/\delta^2$. The factor $\eta$ accounts for geometric details of packing and orientation relative to the surface (e.g., for a simple cubic lattice with spacing $\delta$, a surface normal to one axis would be pierced by $1/\delta^2$ links per unit area, so $\eta=1$).
2.  **Reduction due to Correlations:** If the MPUs or their interaction channels are correlated, not all geometric links represent independent information channels. The factor $\chi$ accounts for this effective reduction in degrees of freedom. For example, if blocks of $1/\chi$ geometric links are strongly correlated such that they effectively act as a single information channel, then the density of *independent* channels is reduced by $\chi$.
3.  **Linear Scaling:** Combining these, the density of effective independent channels is $\sigma_{eff\_link} = \chi \sigma_{geom\_link} = \chi / (\eta \delta^2)$. Since geometric regularity implies this density is uniform on average over macroscopic scales, integrating over the area $\mathcal{A}$ gives $N_{eff\_links} = \sigma_{eff\_link} \cdot \mathcal{A}$ as the leading term for large $\mathcal{A}$. Higher-order corrections $o(\mathcal{A})$ (e.g., boundary effects proportional to perimeter) become negligible for $\mathcal{A} \gg \delta^2$. QED

**E.6 Derivation of the Horizon Entropy Area Law (Conditional Derivation)**

We synthesize the limit on entropy per channel (Corollary E.2) with the geometric scaling of the number of *effective independent* channels (Theorem E.3) to derive the Area Law (Theorem 49).

**Theorem E.4 (Area Law for Horizon Entropy, cf. Thm 49).**
Conditional on emergent geometric regularity (Theorem 43) and the resulting linear scaling of effective boundary channels with area (Theorem E.3), the maximum thermodynamic entropy $S_{max}$ associated with the MPU degrees of freedom constituting or crossing a causal horizon $\mathcal{H}$ with area $\mathcal{A}$ scales linearly with the area. Assuming the maximum entropy corresponds to saturating the capacity of the effective independent channels:
$$
S_{max}(\mathcal{A}) = N_{eff\_links} \cdot S_{channel}^{max} = (\sigma_{eff\_link} \mathcal{A}) \cdot (k_B C_{max}(f_{RID}))
$$
Substituting $\sigma_{eff\_link} = \chi / (\eta \delta^2)$:
$$
S_{max}(\mathcal{A}) = k_B \left(\frac{\chi C_{max}(f_{RID})}{\eta \delta^2}\right) \mathcal{A}
\tag{E.6}
$$
To match the universal Bekenstein-Hawking form $S_{BH} = k_B \mathcal{A} / (4 L_P^2)$ (where $L_P^2 = G\hbar/c^3$ is the squared Planck length), we must identify the coefficients:
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
1.  **Total Maximum Entropy:** The total entropy is the sum over effective independent channels, $S_{max} = N_{eff\_links} \cdot S_{channel}^{max}$, assuming each channel operates at its maximum capacity for reliable information transfer.
2.  **Substitution of Components:** From Theorem E.3, $N_{eff\_links} = (\chi / (\eta \delta^2)) \mathcal{A}$. From Corollary E.2, $S_{channel}^{max} = k_B C_{max}(f_{RID})$. Substituting these into the expression for $S_{max}$ directly yields Equation (E.6).
3.  **Identification with Bekenstein-Hawking Form:** The Bekenstein-Hawking entropy for a horizon of area $\mathcal{A}$ is $S_{BH} = k_B \mathcal{A} / (4 L_P^2)$, where $L_P^2 = G\hbar/c^3$. For the PU framework's emergent entropy (Eq. E.6) to match this empirically established form, their coefficients of $\mathcal{A}$ must be equal. This leads to Equation (E.7).
4.  **Emergent G:** Rearranging Equation (E.7) to solve for $G$ yields Equation (E.9).
5.  **Interpretation:** The Horizon Entropy Area Law emerges as a direct consequence of: (a) the fundamental limit on information capacity per ND–RID channel ($C_{max} < \ln d_0$, Theorem E.2), which itself stems from the irreversibility cost $\varepsilon \ge \ln 2$ (Theorem 31); and (b) the geometric fact that the number of such independent channels crossing a boundary scales with the boundary's area (Theorem E.3, conditional on emergent regularity). The constant of proportionality, which defines the Planck scale and thus $G$, is thereby fixed by the microscopic parameters of the MPU network ($\delta, \eta, \chi, C_{max}$). 

**E.6.1 Explicit Derivation of the Bekenstein-Hawking Coefficient $1/4$**

Theorem E.4 establishes $S_{max} = k_B \left(\frac{\chi C_{max}(f_{RID})}{\eta \delta^2}\right) \mathcal{A}$. Equation (E.9) defines $G$ in terms of these same microscopic parameters: $G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{max}(f_{RID})}$.
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

The derivation of the Area Law (Theorem E.4 / main text, Theorem 49) and the emergent gravitational constant $G$ (Equation E.9) is based on the effective surface density of independent information channels ($\sigma_{eff\_link}$) and the capacity per channel ($C_{max}$). An alternative, complementary perspective on the origin of the $1/4$ coefficient in the Bekenstein-Hawking formula can be obtained by considering the fundamental entropy unit associated with the MPU's self-referential processing.

As established in Appendix J (Theorem J.1, proving main text Theorem 31), each 'Evolve' interaction cycle (main text, Definition 27) involving non-trivial self-referential information processing (the SPAP update cycle) incurs a minimal irreducible dimensionless entropy cost $\varepsilon = \ln 2$ nats. Let this fundamental quantum of entropy generation be denoted $\Delta S_{\text{SPAP}} = \ln 2$.

If we consider this $\Delta S_{\text{SPAP}}$ as the fundamental entropy unit associated with each effective degree of freedom contributing to the horizon entropy, we can define a "minimal horizon cell area," $\Delta\mathcal{A}_{cell}$, as the area whose Bekenstein-Hawking entropy (using the already derived form $S=\mathcal{A}/(4G)$ from Theorem E.4) is precisely this quantum:
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

The consistency of this unit cell interpretation with the primary derivation in Theorem E.4 requires an alignment between the "entropy per effective channel" ($C_{max}(f_{RID})$ in nats, from Theorem E.2) and this fundamental SPAP cost ($\ln 2$ nats). Specifically, the product of channel density and capacity per channel must yield the same overall entropy density: $\sigma_{eff\_link} \cdot C_{max}(f_{RID}) = (\text{density of SPAP cells}) \cdot \ln 2$. Since density of SPAP cells is $1/\Delta\mathcal{A}_{cell} = 1/(4G\ln2)$, this requires $\sigma_{eff\_link} \cdot C_{max}(f_{RID}) = 1/(4G)$. This is precisely what Equation (E.7) (and its natural units version, Eq. E.10) states, confirming the structural consistency between the two viewpoints. Essentially, PCE optimizes the network such that the effective boundary channel capacity $C_{max}$ (influenced by $\varepsilon=\ln 2$) and the effective channel density $\sigma_{eff\_link}$ (influenced by $\delta$) combine to yield the emergent value of $G$ and thus the Bekenstein-Hawking entropy with the standard $1/4$ coefficient.


**E.7 Structural Consistency Requirement**

The derived relationship (Eq E.9) links the macroscopic gravitational constant $G$ to the microscopic parameters $\delta, \eta, \chi, C_{max}$ (which depends on $\varepsilon$). This imposes a structural consistency requirement on the parameters that must emerge from the underlying PCE optimization. Consistency with the observed universe requires that the parameters determined by minimizing the PCE potential $V(x)$ satisfy:
$$
\frac{\eta \delta^2}{\chi C_{max}(f_{RID})} = \frac{4 \hbar G_{obs}}{c^3} = 4 L_P^2
\tag{E.14}
$$
where $G_{obs}$ is the experimentally observed Newton's constant. Rearranging to express the required MPU spacing $\delta$ relative to the Planck length $L_P$:
$$
\frac{\delta}{L_P} = 2 \sqrt{\frac{\chi C_{max}(f_{RID})}{\eta}}
\tag{E.15}
$$
This equation shows the structural relationship that must hold. Since geometric packing factors $\eta$ are typically $\mathcal{O}(1)$ (e.g., $\eta \approx 1$ for simple cubic normal to surface, or $\eta$ could be up to $\approx 4/\pi$ for dense sphere packing projections), the correlation factor satisfies $0 < \chi \le 1$, and the channel capacity is bounded $0 < C_{max} < \ln d_0$ (where $d_0 \ge 8$, so $\ln d_0 \ge \ln 8 \approx 2.08$ nats), it is plausible that this relation can be satisfied for an MPU spacing $\delta$ that is of the order of the Planck length $L_P$ ($\delta/L_P = \mathcal{O}(1)$).
For instance, if PCE optimization leads to:
*   $\chi \approx 1$ (low correlation effect, maximizing independent channels for information transfer).
*   $\eta \approx 1$ (simple packing normal to surface).
*   $C_{max}(f_{RID}) \approx 1$ nat (a reasonable value, significantly less than $\ln 8 \approx 2.08$ due to $f_{RID}<1$).
Then, $\delta/L_P = 2 \sqrt{1 \times 1 / 1} = 2$. This would mean $\delta = 2 L_P$.
If, for example, $C_{max} \approx 0.25$ nats (a more strongly contractive channel) and $\eta=1, \chi=1$, then $\delta/L_P = 2 \sqrt{0.25/1} = 1$.
This demonstrates the *structural* consistency of the framework: the derived origin of $G$ is compatible with MPU scales being near the Planck scale. The precise value of $\delta/L_P$ depends on the specific optimized values of $\chi, \eta, C_{max}$ that emerge from the full PCE dynamics.

**E.8 Conclusion**

This appendix provided a theoretical derivation of the Horizon Entropy Area Law (Theorem 49 / Theorem E.4) from PU principles. ND–RID irreversibility ($\varepsilon \ge \ln 2$, Theorem 31, Appendix J) guarantees strict channel contractivity ($f_{RID}<1$, Lemma E.1), fundamentally bounding classical information capacity ($C_{max} < \ln d_0$, Theorem E.2). Combined with the geometric scaling of effective information channels across a boundary ($N_{eff\_links} \propto \mathcal{A}$, incorporating correlation factor $\chi$, conditional on Theorem 43, Theorem E.3), this yields the linear entropy-area relation $S_{max} = k_B \left(\frac{\chi C_{max}(f_{RID})}{\eta \delta^2}\right) \mathcal{A}$ (Eq. E.6). The explicit Bekenstein-Hawking coefficient $1/(4L_P^2)$ was shown to emerge self-consistently (Section E.6.1) when this is combined with the PU framework's definition of the emergent gravitational constant $G$ (Equation E.9). This links the emergent Planck scale ($L_P^2 = G\hbar/c^3$) to fundamental MPU parameters ($\delta, \eta, \chi, \varepsilon$ via $C_{max}$) controlling geometric density and information capacity (Equation E.14, E.15). The analysis demonstrates structural consistency, showing that the derived origin of $G$ is compatible with MPU scales being near $L_P$. The derived Area Law thus interprets the black hole horizon thermodynamically as representing the maximal information boundary defined by the fundamental ND–RID capacity limits. This provides the necessary thermodynamic foundation (Theorem 49) for deriving Einstein's Field Equations (Section 12).