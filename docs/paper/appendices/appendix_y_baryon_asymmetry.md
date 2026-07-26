# Appendix Y — Baryon Asymmetry from Predictive Anomaly Inflow

## Y.1 Overview and Derivation Chain

This appendix formulates a conditional baryogenesis transport branch. The finite structural chain fixes registered exponent and flavor inputs, but the baryon yield is an output only after a source, transport, freeze-out, washout, normalization, and residual certificate is supplied:
$$
K_0=3\longrightarrow d_0=8\longrightarrow(a,b)=(2,6)\longrightarrow M=24
\longrightarrow\kappa_{EW}=38.5\longrightarrow\kappa_B=19.48.
$$
Without an accepted transport certificate, the numerical value of $\eta_B$ is open. The observed value is comparison data, not a PU output.

| Quantity | Branch value | Observed | Status |
|----------|--------------|----------|--------|
| $\eta_B$ | illustrative factor product $\approx 6.15 \times 10^{-10}$; no theory interval is defined | $(6.12 \pm 0.04) \times 10^{-10}$ | source, transport, freeze-out, washout, normalization, residual, and covariance certificate pending |
| $\delta_{\mathrm{CKM}}$ | $66.7^\circ$ on the registered nonlinear phase-response ansatz of Theorem T.56 | $65.72^\circ\pm1.49^\circ$ | model-conditional; $+0.7\sigma$ comparison |
| $J_{CP}$ | $3.22 \times 10^{-5}$ on the same conditional flavor branch | $(3.12^{+0.13}_{-0.12}) \times 10^{-5}$ | model-conditional; $+0.8\sigma$ comparison |


---

## Y.2 Foundations: Matter-Antimatter Duality from SPAP

### Y.2.1 The NOT Operation and Binary Duality

**Recall from Theorem 10 (SPAP).** Any non-trivial predictive system $\mathcal{P}$ attempting to predict its own future state $\phi_{t+1}$ while the prediction $p$ is stored internally generates a logical contradiction resolved by the update rule
$$\phi_{t+1} = \text{NOT}(p_{\text{stored}}).$$
This binary contradiction is the source of the duality structure used below.

The NOT operation on binary states generates two complementary branches:
- Branch $\mathcal{A}$: prediction was 0 → outcome is 1
- Branch $\mathcal{B}$: prediction was 1 → outcome is 0

**Proposition Y.1** (Predictive $\mathbb{Z}_2$ Involution and Charge-Conjugation Modeling). *The SPAP update determines a canonical logical $\mathbb{Z}_2$ involution on the predictive two-branch state space. Interpreting that involution as particle-antiparticle exchange is an additional physical identification, modeled by charge conjugation $\mathsf{C}$ on a chosen two-state sector.*

This proposition establishes a correspondence principle between logical and physical structures:

| SPAP Logic | Particle Physics Interpretation |
|:-----------|:--------------------------------|
| Binary state $\phi \in \{0,1\}$ | Two-state particle/antiparticle sector |
| NOT operation | Modeled by charge conjugation $\mathsf{C}$ |
| $\mathbb{Z}_2$ symmetry | Discrete exchange symmetry in the chosen sector |
| 2-to-1 merge | Effective annihilation / branch-selection analogue |

*Proof.* The SPAP update rule $\phi_{t+1} = \text{NOT}(\hat{\phi}_t)$ acts on the binary set $\{0,1\}$, and NOT is the unique non-trivial involution on that set. Therefore the predictive state space carries a canonical $\mathbb{Z}_2$ action. By the Principle of Physical Instantiation (Definition P.6.2), any concrete realization of this two-branch structure must choose a physical involution exchanging the two branches. In a relativistic particle-antiparticle sector, a natural choice is charge conjugation $\mathsf{C}$. The CPT theorem [Pauli 1955; Lüders 1954] guarantees that such a charge-conjugation operator fits consistently into the usual discrete-symmetry structure of local relativistic QFT, but it does not by itself prove that every predictive $\mathbb{Z}_2$ involution must equal $\mathsf{C}$. After adopting this modeling identification, one may choose a basis $|0\rangle,|1\rangle$ with
$$
\mathsf{C}|0\rangle = |1\rangle, \qquad \mathsf{C}|1\rangle = |0\rangle.
$$
The proposition therefore establishes a model-level correspondence between the predictive involution and charge conjugation, not an unconditional derivation of $\mathsf{C}$ from CPT. ∎

### Y.2.2 The 2-to-1 Merge and Branch Selection

**Recall from Definition 28, Theorem J.1, and Theorem 31.** Definition 28 registers the reachable binary verification quotient, and Theorem J.1 gives its structural log-cardinality $\varepsilon_0=\ln2$. Theorem 31 gives the separate registered-reset bound $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; a physical $\ln2$ lower bound additionally requires a conditionally uniform binary record with no retained copy.

**Corollary Y.1.1** (Irreversible Branch Selection). At the verification step of each nontrivial SPAP cycle, the 2-to-1 merge selects one retained branch of the predictive $\mathbb Z_2$ ledger and exports at least $\ln2$ nats of bath entropy only when the discarded binary label is conditionally uniform and not retained as side information. Let $\mathcal E_\Omega$ be a finite set of baryon-relevant update events in a finite spacetime region $\Omega$, equipped with the charge-conjugation pairing $e\mapsto\bar e$ from Proposition Y.1 and an orientation character
$$
\chi(e)\in\{+1,-1\},
\qquad
\chi(\bar e)=-\chi(e).
\tag{Y.1.1}
$$
Let $q_B(e)\ge0$ be the baryon-number magnitude contributed by event $e$ on the chosen transport branch, and let $w(e)$ be the forward-oriented event weight after the Appendix O time-orientation gate. Define the predictive momentum ledger
$$
\mathcal P_B(\Omega)
:=
\sum_{e\in\mathcal E_\Omega}
\chi(e)q_B(e)w(e).
\tag{Y.1.2}
$$
Then
$$
\mathcal P_B(\Omega)
=
\sum_{[e]}
q_B(e)\big(w(e)-w(\bar e)\big),
\tag{Y.1.3}
$$
where the sum is over charge-conjugation pairs with $q_B(e)=q_B(\bar e)$ and with the representative chosen so that $\chi(e)=+1$. In any CP-symmetric equilibrium branch for which
$$
w(e)=w(\bar e)
\tag{Y.1.4}
$$
for every pair, the predictive momentum ledger vanishes:
$$
\mathcal P_B(\Omega)=0.
\tag{Y.1.5}
$$
A nonzero matter excess on the Appendix Y branch is therefore exactly the finite retained value of the CP-odd, forward-oriented, baryon-number transport ledger (Y.1.2). This is the precise sense in which the matter excess is predictive momentum: its sign is the sign of the baryon transport ledger relative to the Appendix O update orientation, while its magnitude is fixed only by the anomaly, CP, out-of-equilibrium, sphaleron, washout, and transport certificates used later in Appendix Y.

*Proof.* The event set decomposes into disjoint charge-conjugation pairs $\{e,\bar e\}$ on the retained odd sector. A fixed point would require $\chi(e)=-\chi(e)$, impossible for $\chi\in\{\pm1\}$, so fixed points carry no retained odd contribution. Summing the two members of a pair gives
$$
\chi(e)q_B(e)w(e)+\chi(\bar e)q_B(\bar e)w(\bar e)
=
\chi(e)q_B(e)\big(w(e)-w(\bar e)\big).
$$
Choosing the representative with $\chi(e)=+1$ gives (Y.1.3). If CP symmetry and equilibrium make the paired weights equal, each pair contribution is zero, proving (Y.1.5). The positive entropy cost of the branch selection is Theorem J.1, and the forward orientation of the ledger is supplied by Appendix O. ∎

---

## Y.3 Conditional Sakharov-Branch Realization

**Theorem Y.2 (Conditional Sakharov-Branch Realization).** Suppose the retained branch carries: (i) the electroweak anomaly channel, (ii) a nonzero certified CP-odd datum, (iii) active baryon-number-changing transitions, and (iv) an accepted response-active nonstationary transport, boundary/inflow, preparation, or freeze-out record satisfying Theorems Y.6.1i--Y.6.1j and Corollary Y.6.1k. Then the three Sakharov conditions are realized on that branch. The SPAP arrow and update cost alone do not discharge item (iv).


### Y.3.1 Baryon Number Non-Conservation

The gauge structure $\mathfrak{g} = \mathfrak{su}(3) \oplus \mathfrak{su}(2) \oplus \mathfrak{u}(1)$ emerges as PCE-preserving automorphisms of predictive frames (Theorem G.8.4b). On this branch the gauge anomaly classes vanish by the predictive-descent requirement of Theorem X.8d and Section G.8.2.3. The current $B+L$ is not a gauge/frame redundancy; it is a global current. Its electroweak anomaly is therefore an admissible physical update channel rather than a failure of predictive descent. On the retained $SU(2)_L$ topological-transition branch, assume that the integrated hypercharge and gravitational Pontryagin contributions to the $B+L$ Ward identity vanish. The remaining $SU(2)_L$ contribution is

$$\partial_\mu J_{B+L}^\mu = \frac{N_g g^2}{16\pi^2} W^a_{\mu\nu}\tilde{W}^{a\mu\nu}. \tag{Y.1}$$

where $N_g$ is the number of generations. Theorem R.3.4 gives the minimal admissible count $N_{\min}=3$ in the anomaly-plus-CP family-charge class, and Proposition R.3.5.1a gives the exact realized value $N_g=3$ on the pre-flavor family-redundancy PPI branch used here. The tensor $W^a_{\mu\nu}$ is the $SU(2)_L$ field strength, and $\tilde{W}^{a\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}W^a_{\rho\sigma}$ is its dual.

*Derivation.* Use the Adler–Bell–Jackiw chiral-anomaly theorem (Adler, 1969; Bell and Jackiw, 1969) with $SU(2)$ generators normalized in the fundamental representation by $\operatorname{tr}(T^aT^b)=\frac12\delta^{ab}$. A unit global charge carried by one left-handed $SU(2)_L$ doublet then has
$$
\partial_\mu j^\mu
=\frac{g^2}{32\pi^2}
W^a_{\mu\nu}\widetilde W^{a\mu\nu}.
$$
The electroweak fermions are left-handed fundamental doublets, so the representation and trace hypotheses of the anomaly theorem are satisfied. In one generation, the three color copies of the quark doublet have total baryon charge
$$
3\cdot\frac13=1,
$$
and the lepton doublet has total lepton charge $1$. Linearity of the anomaly in the global charge therefore gives total $B+L$ weight
$$
1+1=2
$$
per generation. Hence
$$
\partial_\mu J^\mu_{B+L}
=2\cdot\frac{g^2}{32\pi^2}
W^a_{\mu\nu}\widetilde W^{a\mu\nu}
=\frac{g^2}{16\pi^2}
W^a_{\mu\nu}\widetilde W^{a\mu\nu}.
$$
All $N_g$ generations have the same electroweak representation and charge weights, so summing them multiplies the coefficient by $N_g$ and yields Equation (Y.1). ∎

### Y.3.2 C and CP Violation

**Imported results (Theorems T.54--T.56, Berry phase, visibility, and phase-response gate).** On the minimal Berry-area branch of Theorem T.54, the flavor quadrilateral on $\text{Gr}(2,8)$ has the nonzero base Berry phase

$$\delta_0 = 2\arctan(\sqrt{2}/2) = 70.53°.$$

Theorem T.55 gives the uniform phase-noise visibility

$$\left|\left\langle e^{i(\delta_0+\xi)}\right\rangle\right|=\text{sinc}(1/\sqrt{3})=0.9454,$$

while leaving the phase equal to $\delta_0$. On the additional nonlinear phase-response ansatz registered in Theorem T.56, one defines

$$\delta_{\mathrm{CKM}}:=\delta_0\,\text{sinc}(1/\sqrt{3})=66.7°.$$

The base Berry phase is nonzero on the declared minimal-area branch because the up and down quark sectors use the distinct geometric data
- Down quarks: $(d^2_{32}, d^2_{31}) = (2, 4)$
- Up quarks: $(d^2_{32}, d^2_{31}) = (4, 8)$

The value $66.7°$ is a conditional nonlinear-response branch value, not the phase of the averaged complex amplitude in Theorem T.55.

### Y.3.3 Departure from Thermal Equilibrium

On a registered physical-reset branch, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; strict positivity requires an additional positive conditional-entropy floor. The cosmological arrow of time and nonzero predictive-update cost do not by themselves prove that the retained electroweak state departs from KMS stationarity. In the PU baryogenesis mechanism, active sphalerons produce a net yield only when an accepted $\dot\theta_{\mathrm{PU}}$, boundary/inflow, nonstationary preparation, or freeze-out record discharges Theorem Y.6.1i; $e^{-\kappa_B}$ is only a multiplicative branch weight.

*Proof of Theorem Y.2.*  
(1) On the SM-gauge branch of Theorem G.8.4b, Equation (Y.1) gives $\partial_\mu J^\mu_{B+L}\ne0$ whenever an active transition has nonzero integrated topological density $W\widetilde W$. Hypotheses (i) and (iii) therefore supply baryon-number violation.  
(2) Hypothesis (ii) supplies a nonzero certified CP-odd datum. On the minimal Berry-area branch, Theorem T.54 supplies the nonzero base datum $\delta_0=70.53^\circ$. If the numerical CKM specialization is used, the additional nonlinear phase-response ansatz of Theorem T.56 supplies $\delta_{\mathrm{CKM}}=66.7^\circ$. Thus CP is violated only on a branch carrying the corresponding certified nonzero datum.  
(3) Hypothesis (iv), through Theorems Y.6.1i--Y.6.1j and Corollary Y.6.1k, supplies the response-active nonstationary transport, boundary/inflow, preparation, or freeze-out record. This is the required departure from thermal equilibrium. The reset-heat bound of Theorem 31 and the macroscopic arrow of Appendix O do not replace this baryogenesis-specific hypothesis, and $e^{-\kappa_B}$ is only a branch weight. Hence the three Sakharov conditions hold exactly under hypotheses (i)--(iv), with no unconditional claim from the bare PU axioms. ∎


---

## Y.4 Anomaly Inflow and Topological Baryon Production

### Y.4.1 Chern-Simons Number and Vacuum Structure

**Definition Y.3** (Chern-Simons Functional). *Let $T_a$ be Hermitian fundamental generators with $\operatorname{tr}(T_aT_b)=\frac12\delta_{ab}$, and let $\mathcal A=-igW^aT_a$ be the dimensionless anti-Hermitian $SU(2)$ connection on a spatial hypersurface $\Sigma$. With $F=d\mathcal A+\mathcal A\wedge\mathcal A$, define*

$$
N_{CS}(\Sigma)
:=-\frac{1}{8\pi^2}\int_\Sigma
\operatorname{tr}\left(
\mathcal A\wedge d\mathcal A
+\frac23\mathcal A\wedge\mathcal A\wedge\mathcal A
\right)
\pmod{\mathbb Z}.
\tag{Y.2}
$$

*Choose a real lift of $N_{CS}$ along each retained interpolation. On a pure-gauge vacuum this lift is an integer, and a unit-winding transition has $\Delta N_{CS}=\pm1$. With the same convention,*
$$
-\frac{1}{8\pi^2}\int_X\operatorname{tr}(F\wedge F)=\Delta N_{CS}.
$$
*Such a transition changes $B+L$ by $2N_g\Delta N_{CS}$ on the anomaly branch of Theorem Y.4.*

**Theorem Y.4** (Baryon Number from Anomaly Inflow). *Let $\mathcal V$ be a spacetime four-volume whose oriented boundary consists of Cauchy surfaces $\Sigma_f\sqcup(-\Sigma_i)$ and either has no additional boundary or has vanishing $B+L$ current and Chern-Simons flux through every additional boundary component. Assume the anomaly restriction of Equation (Y.1) and a finite-action gauge history with pure-gauge endpoints in the normalization of Definition Y.3. Then*

$$\Delta B + \Delta L = 2N_g \left[N_{CS}(\Sigma_f) - N_{CS}(\Sigma_i)\right]. \tag{Y.3}$$

*Proof.* The divergence theorem and the zero-side-flux hypothesis give
$$
\Delta(B+L)
=\int_{\mathcal V}\partial_\mu J_{B+L}^\mu\,d^4x
=\frac{N_gg^2}{16\pi^2}\int_{\mathcal V}W^a_{\mu\nu}\widetilde W^{a\mu\nu}\,d^4x.
$$
Define
$$
Q_W:=\frac{g^2}{32\pi^2}\int_{\mathcal V}W^a_{\mu\nu}\widetilde W^{a\mu\nu}\,d^4x.
$$
The Chern-Weil transgression formula for Definition Y.3, together with the pure-gauge endpoint hypothesis, gives
$$
Q_W=N_{CS}(\Sigma_f)-N_{CS}(\Sigma_i).
$$
Therefore $\Delta(B+L)=2N_gQ_W=2N_g\Delta N_{CS}$. ∎

**Corollary Y.4a (Electroweak Anomaly as an Admissible Predictive Update Channel).** On the SM-gauge branch of Theorem G.8.4b, the electroweak relation in Theorem Y.4 is compatible with Predictive Anomaly Descent. The gauge anomaly class vanishes, while the $B+L$ anomaly is a global-current update channel:
$$
[\mathcal A_{\mathrm{gauge}}^{\mathrm{tot}}]=0,
\qquad
\partial_\mu J_{B+L}^\mu
=
\frac{N_g g^2}{16\pi^2}W^a_{\mu\nu}\tilde W^{a\mu\nu}.
$$
Thus baryon-plus-lepton number changes are physical transitions between topological sectors, not inconsistencies of the gauge quotient.

*Proof.* Gauge transformations belong to the redundancy groupoid $\mathcal R$ of Theorem X.8d, so their anomaly class must vanish for the branch to be admissible. This is precisely the anomaly-free SM-gauge hypothesis propagated through Theorem G.8.4b. The $B+L$ transformation is not part of the gauge quotient on this branch; it labels a global current. By Corollary X.8d.1, a nonzero Ward identity for such a current is a physical update channel rather than a descent obstruction. Integrating that Ward identity over $\mathcal V$ gives Theorem Y.4, so the topological transition changes $B+L$ while preserving gauge consistency. ∎

### Y.4.2 Sphaleron Transitions

At temperatures $T \gtrsim 100$ GeV, thermal fluctuations can excite the gauge-Higgs system over the energy barrier (the sphaleron) between adjacent $N_{CS}$ sectors. The sphaleron rate per unit volume in the symmetric phase is [D'Onofrio et al. 2014]:

$$\frac{\Gamma_{\text{sph}}}{V} = \kappa_{\text{sph}} \alpha_W^5 T^4 \tag{Y.4}$$

with $\kappa_{\text{sph}} \approx 18 \pm 3$ from lattice simulations and $\alpha_W = g^2/(4\pi) \approx 1/30$.

**Definition Y.4.1 (Registered CP Transport Affinity).** Let $A_{CP}(t)$ be the dimensionless signed affinity obtained from a specified nonequilibrium transport calculation.

**Definition Y.4.2 (Two-Rate Response Branch).** If $\Gamma_0(t)>0$ and
$$
\Gamma_\pm(t)=\Gamma_0(t)e^{\pm A_{CP}(t)},
$$
then
$$
\frac{\Gamma_+(t)-\Gamma_-(t)}{\Gamma_+(t)+\Gamma_-(t)}
=\tanh A_{CP}(t).
$$
The lattice sphaleron rate does not supply $A_{CP}$, and no universal factor $1/(2\pi\alpha_W)$ follows. ∎

---

### Y.4.3 Predictive Index Form of Anomaly-Mediated Update

**Definition Y.4.3a (Chiral Predictive Update Operator).** Let $X$ be a compact oriented Riemannian spin four-manifold with boundary $\partial X=\Sigma_f\sqcup(-\Sigma_i)$ and product metric and connection in collars of the boundary. Let $E_{\mathbf2}$ be one complex rank-two bundle in the fundamental representation of $SU(2)$, normalized by $\operatorname{tr}(T_aT_b)=\frac12\delta_{ab}$, with no flavor, color, or family multiplicity. Let
$$
D_{X,\mathbf2}^+:\Gamma(S^+\otimes E_{\mathbf2})\longrightarrow\Gamma(S^-\otimes E_{\mathbf2})
$$
carry Atiyah-Patodi-Singer boundary conditions. Define
$$
\operatorname{Ind}_{\mathrm{upd}}(D_X)
:=dim\ker D_{X,\mathbf2}^+-\dim\ker(D_{X,\mathbf2}^+)^*.
\tag{Y.12a}
$$

Assume that the degree-four gravitational contribution to $\widehat A(TX)\operatorname{ch}(E_{\mathbf2})$ vanishes and that the finite-action gauge history has pure-gauge endpoints whose boundary Dirac operators are unitarily equivalent. Then the eta and kernel differences of those endpoints vanish and
$$
Q_W=\Delta N_{mathrm{CS}}.
$$

**Theorem Y.4.3b (Predictive Index Theorem for Baryon Update).** Under the hypotheses of Definition Y.4.3a,
$$
\operatorname{Ind}_{\mathrm{upd}}(D_X)
=
\int_X \widehat A(TX)\operatorname{ch}(E_{\mathbf2})\big|_4
-
\frac{\eta(D_{\Sigma_f})-\eta(D_{\Sigma_i})+h_f-h_i}{2},
\tag{Y.12b}
$$
and, for the stated fundamental normalization and pure-gauge endpoints,
$$
\operatorname{Ind}_{\mathrm{upd}}(D_X)=Q_W=\Delta N_{CS}.
$$
Consequently the Standard-Model fermion multiplicities give
$$
\Delta(B+L)
=
2N_g\,\operatorname{Ind}_{\mathrm{upd}}(D_X)
=
2N_g\,\Delta N_{CS}.
\tag{Y.12c}
$$

*Proof.* The Atiyah-Patodi-Singer index theorem (Atiyah, Patodi, and Singer, 1975) applies because $X$ is compact, spin, and product near its boundary and because the APS realization is Fredholm. It gives (Y.12b), with the opposite orientations of $\Sigma_f$ and $\Sigma_i$ producing the displayed eta/kernel difference. For the fundamental representation, $2T(\mathbf2)=1$, so the gauge part of the degree-four Chern character integrates to $Q_W$. The gravitational contribution vanishes by hypothesis, and unitary equivalence of the pure-gauge endpoint operators gives $\eta(D_{\Sigma_f})=\eta(D_{\Sigma_i})$ and $h_f=h_i$. Thus (Y.12b) reduces to $\operatorname{Ind}_{\mathrm{upd}}(D_X)=Q_W$. Chern-Weil transgression for the normalized connection gives $Q_W=\Delta N_{CS}$. Finally, in each generation the three quark doublets have total baryon charge $3(1/3)=1$ and the lepton doublet has lepton charge $1$, so weighting the one-doublet index gives $\Delta(B+L)=2N_gQ_W$. ∎

**Corollary Y.4.3c (Chirality, Anomaly Inflow, and Baryogenesis Share One Index).** On the Appendix Y branch, chiral spectral flow, anomaly-mediated update, and baryon production are three descriptions of the same integer index.

*Proof.* Theorem Y.4.3b identifies the chiral spectral flow with $\operatorname{Ind}_{\mathrm{upd}}(D_X)$ and identifies the same integer with $\Delta N_{CS}$. Theorem Y.4 identifies $\Delta N_{CS}$ with anomaly-mediated baryon update. Therefore all three quantities are the same index data with different projections. ∎

## Y.5 CP-Odd Berry Datum and Driven Baryon Transport

### Y.5.1 The Predictive Flavor Bundle

**Definition Y.5** (Predictive Flavor Bundle). *Over the electroweak vacuum manifold $\mathcal{M}_{EW}$, the predictive flavor bundle $\mathcal{E} \to \mathcal{M}_{EW}$ has fiber at each point carrying the generation structure inherited from the $E_8$ embedding (Appendix R). On a graph chart of $\operatorname{Gr}(2,8)$ write $Z\in\mathbb C^{6\times2}$ and let $\mathcal L=\det(\mathcal S)^*$ be the dual determinant of the tautological bundle. Its standard Hermitian metric has Kähler potential*
$$
K(Z,\bar Z)=\log\det(I_2+Z^\dagger Z).
$$
*A local real connection one-form on $\mathcal L$ and its curvature are*
$$
\mathcal A
=\frac{i}{2}(\bar\partial K-\partial K),
\tag{Y.5}
$$
$$
\mathcal F=d\mathcal A=i\,\partial\bar\partial K=\omega_{\operatorname{Gr}}.
\tag{Y.6}
$$
*On an overlap, a unitary change of local frame gives $\mathcal A' =\mathcal A+d\lambda$ with $\lambda$ real modulo $2\pi$, while $\mathcal F$ is global.*

### Y.5.2 Holonomy as Geometric CP Violation

**Theorem Y.6** (CP-Odd Holonomy Datum). *Let $c$ be the CP involution on the retained flavor branch and assume $c^*\mathcal F=-\mathcal F$. For a closed flavor loop $\gamma$, define its Berry phase by*
$$
e^{i\delta_{\mathrm{hol}}}
:=exp\left(i\oint_\gamma\mathcal A\right).
$$
*If $\gamma=\partial\Sigma$ and the pulled-back line is trivialized over $\Sigma$, then*
$$
\delta_{\mathrm{hol}}
\equiv
\oint_\gamma\mathcal A
\equiv
\int_\Sigma\mathcal F
\pmod{2\pi}.
\tag{Y.7}
$$
*If CP maps the oriented surface to $c(\Sigma)$, then $\delta_{\mathrm{hol}}\mapsto-\delta_{\mathrm{hol}}$ modulo $2\pi$. This CP-odd phase becomes a baryon source only through the nonstationary transport gate of Theorems Y.6.1i--Y.6.1j.*

*Proof.* Under a unitary frame change, $\oint_\gamma\mathcal A$ changes by $\oint_\gamma d\lambda=2\pi n$ for some $n\in\mathbb Z$, so its exponential and its class modulo $2\pi$ are gauge-invariant. Stokes' theorem on the chosen trivialization gives $\oint_{\partial\Sigma}\mathcal A=\int_\Sigma d\mathcal A$. Finally,
$$
\int_{c(\Sigma)}\mathcal F
=\int_\Sigma c^*\mathcal F
=-\int_\Sigma\mathcal F,
$$
which proves CP oddness. The source qualification is Theorem Y.6.1i. ∎

For the flavor-changing loop $\gamma: u_3 \to d_3 \to d_2 \to u_2 \to u_3$, Theorem T.54 gives the conditional base holonomy
$$\delta_0 = 2\arctan\left(\frac{\sqrt{2}}{2}\right)=70.53°.$$
Theorem T.55 gives the visibility factor $\text{sinc}(1/\sqrt{3})=0.9454$ and leaves the phase $\delta_0$ unchanged. On the independently registered nonlinear phase-response ansatz of Theorem T.56,
$$\delta_{\mathrm{CKM}}:=\delta_0\,\text{sinc}\left(\frac{1}{\sqrt{3}}\right)=70.53°\times0.9454=66.7°.$$

On that nonlinear-response branch, the CP factor used in the illustrative master-formula row is
$$\sin\delta_{\mathrm{CKM}} = \sin(66.7°) = 0.918 \tag{Y.8}$$

### Y.5.3 CP-Odd Effective Action

**Theorem Y.6.1 (Normalized CP-Odd Operator and Open Matching Coefficient).** Under the finite-action and pure-gauge boundary conditions registered before Theorem Y.4.3b, define
$$
Q_W
:=\frac{g^2}{32\pi^2}
\int W^a_{\mu\nu}\widetilde W^{a\mu\nu}\,d^4x
=\Delta N_{\mathrm{CS}}.
$$
Let $\delta$ be a compact phase modulo $2\pi$. A local CP-odd topological contribution compatible with phase periodicity has the form
$$
\frac{\Delta S_{CP}}{\hbar}=\chi_{CP}f(\delta)Q_W,
$$
where $f(-\delta)=-f(\delta)$, $f(\delta+2\pi)=f(\delta)$, and $\chi_{CP}$ is a matching coefficient. These symmetry conditions determine neither $\chi_{CP}$ nor a nonequilibrium rate affinity. On a separately certified two-rate branch, the bounded response is $\tanh A_{CP}$; a static phase term alone supplies no production bias.

*Proof.* The boundary hypotheses and Chern-Weil transgression give the first equality. CP reverses the sign of the topological density and of the retained CP phase, so CP oddness requires an odd coefficient function; compactness requires $2\pi$ periodicity. Every sufficiently regular such function has a sine expansion
$$
f(\delta)=\sum_{n\ge1}a_n\sin(n\delta),
$$
whose coefficients, including the overall normalization $\chi_{CP}$, are not determined by oddness or periodicity. Definition Y.4.2 gives the rate ratio $\tanh A_{CP}$ only after a signed affinity is supplied. Theorem Y.6.1i shows that a time-independent phase in a stationary state produces no secular change. ∎

**Proposition Y.7** (Saturated CP Weight in a Certified Driven Single-Harmonic Truncation). *Assume the two-rate branch*
$$
\Gamma_\pm=\Gamma_0e^{\pm\mathcal S\sin\delta},
\qquad
\Gamma_0>0.
$$
*Then*
$$
\mathcal F_{CP}
:=\frac{\Gamma_+-\Gamma_-}{\Gamma_++\Gamma_-}
=\tanh(\mathcal S\sin\delta).
$$
*Along any branch on which $\mathcal S\sin\delta\to+\infty$, $\mathcal F_{CP}\to1$. Net baryon production still requires the independently certified source, transport, freeze-out, and washout records of Theorems Y.6.1i--Y.6.1j and Corollary Y.6.1k.*

*Proof.* Division of numerator and denominator by $\Gamma_0e^{-\mathcal S\sin\delta}$ gives
$$
\mathcal F_{CP}
=\frac{e^{2\mathcal S\sin\delta}-1}{e^{2\mathcal S\sin\delta}+1}
=\tanh(\mathcal S\sin\delta).
$$
The final limit follows because $e^{2\mathcal S\sin\delta}\to\infty$. ∎

### Y.5.4 Comparison with Spontaneous Baryogenesis

The PU mechanism has structural similarities to spontaneous baryogenesis [Cohen & Kaplan 1987, 1988]. 

**Spontaneous Baryogenesis (Cohen-Kaplan):**

A time-dependent scalar field $\phi(t)$ couples to the baryon current:
$$\mathcal{L}_{int} = \frac{\partial_\mu \phi}{M} J_B^\mu$$

This induces an effective chemical potential:
$$\mu_B = \frac{\dot{\phi}}{M}$$

The baryon asymmetry generated is:
$$\eta_B^{CK} \propto \frac{\dot{\phi}}{M T} \cdot \frac{\Gamma_{sph}}{H}$$

**PU Baryogenesis:**

On a registered local-operator branch, let
$$
q_W:=\frac{g^2}{32\pi^2}W^a_{\mu\nu}\widetilde W^{a\mu\nu}.
$$
The Berry phase may enter a CP-odd local term only through the matching data of Theorem Y.6.1:
$$
\frac{\mathcal L_{CP}}{\hbar}=\chi_{CP}f(\delta_{\mathrm{hol}})q_W,
$$
where $f$ is odd and $2\pi$-periodic and $\chi_{CP}$ is determined by an accepted matching certificate. The phase is
$$
\delta_{\mathrm{hol}}\equiv\oint_\gamma\mathcal A\pmod{2\pi}.
$$

$$
\eta_B-\eta_{\mathrm{hom}}-r_B
=
\int_{t_i}^{t_f}K_B(t)\dot\theta_{\mathrm{PU}}(t)\,dt,
\qquad
r_B\in\mathcal R_B.
$$
Static factors such as $\tanh(\mathcal S\sin\delta)$ and $e^{-\kappa_B}$ may occur only inside the certified kernel or a separately proved product reduction; they are not additional sources.

**Structural Correspondence:**

| Spontaneous (CK) | PU Baryogenesis | Role |
|:-----------------|:----------------|:-----|
| Scalar field $\phi$ | Berry phase $\gamma$ | CP-odd datum; $\dot\theta_{\mathrm{PU}}$ or boundary inflow is the source |
| $\dot{\phi}/M$ | $\dot\theta_{\mathrm{PU}}$ or accepted boundary/inflow | response-active source; $\sin\delta$ is a CP-odd weight |
| Driven $\dot\theta_{\mathrm{PU}}$, boundary inflow, or freeze-out | accepted APS-Kubo source and $f_{\mathrm{neq}}$ | response-active departure from equilibrium |
| $\Gamma_{sph}/H$ | certified $\Gamma_{CS}/H$ and transport kernel | transition activity relative to expansion; the separate factor $\tanh(\mathcal S\sin\delta)$ is a CP-odd rate bias |

**Key Differences:**

1. **Origin of CP-odd field:** In Cohen-Kaplan, the scalar $\phi$ is postulated with an ad hoc coupling. In PU, the Berry phase emerges from the derived generation manifold structure.

2. **Time dependence:** Cohen-Kaplan requires explicit $\dot{\phi}(t)$ during a phase transition. PU requires time dependence to appear explicitly in the certified $\dot\theta_{\mathrm{PU}}$, boundary/inflow, nonstationary preparation, or freeze-out entry.

3. **Suppression mechanism:** Cohen-Kaplan uses the expansion rate $H$ for departure from equilibrium. PU uses a certified driven or boundary/freeze-out record for departure from equilibrium; $\kappa_B$ supplies only a branch weight.

4. **Saturation:** Cohen-Kaplan is linear in $\dot{\phi}/M$ (perturbative regime). PU saturates via $\tanh(\mathcal{S}\sin\delta) \to 1$ (non-perturbative regime).

**Theorem Y.7.1** (PU Holonomy on a Geometric Spontaneous-Baryogenesis Branch). *Let $\theta_{\mathrm{PU}}$ be a differentiable real lift of the compact Berry phase on a finite transport region. Assume an accepted anomaly and matching certificate supplies constants $C_B\ne0$ and $\chi_{CP}$ such that*
$$
\partial_\mu J_B^\mu=C_Bq_W,
\qquad
\frac{\mathcal L_{CP}}{\hbar}=\chi_{CP}\theta_{\mathrm{PU}}q_W,
$$
*and assume the boundary integral of $\theta_{\mathrm{PU}}J_B^\mu$ vanishes or is retained explicitly as inflow. Then the bulk interaction is equivalent to the derivative-current coupling*
$$
\frac{S_{CP}^{\mathrm{bulk}}}{\hbar}
=-\frac{\chi_{CP}}{C_B}
\int (\partial_\mu\theta_{\mathrm{PU}})J_B^\mu\,d^4x.
$$
*Thus this certified branch has the mathematical source form of spontaneous baryogenesis under the correspondence $\partial_\mu\phi/M\leftrightarrow-(\chi_{CP}/C_B)\partial_\mu\theta_{\mathrm{PU}}$. The coefficient is matching data, the physical source is $\dot\theta_{\mathrm{PU}}$ or retained boundary inflow, and $e^{-\kappa_B}$ is only a reduced branch weight.*

*Proof.* Substitute $q_W=C_B^{-1}\partial_\mu J_B^\mu$ into the local action and integrate by parts:
$$
\frac{S_{CP}}{\hbar}
=\frac{\chi_{CP}}{C_B}\int\theta_{\mathrm{PU}}\partial_\mu J_B^\mu\,d^4x
=-\frac{\chi_{CP}}{C_B}\int(\partial_\mu\theta_{\mathrm{PU}})J_B^\mu\,d^4x
+\frac{\chi_{CP}}{C_B}\int_{\partial X}\theta_{\mathrm{PU}}J_B^\mu n_\mu\,d^3\sigma.
$$
The final term vanishes or is retained by hypothesis. The remaining bulk term is precisely the derivative-current form. A constant phase has zero bulk source, in agreement with Theorem Y.6.1i. ∎

---

## Y.6 Baryogenesis Complexity from Configuration Space

### Y.6.1 The Complexity Principle

The PU framework exhibits a universal pattern: physical quantities involving vacuum selection or symmetry breaking are exponentially suppressed by configuration space complexity:

$$\mathcal{O} = A \cdot e^{-\kappa} \tag{Y.10}$$

where $\kappa$ counts the effective dimensionality of the relevant configuration space and $A$ is an $O(1)$ prefactor.

| Quantity | Complexity | Configuration Space | Suppression | Result |
|:---------|:----------:|:--------------------|:-----------:|:-------|
| $\Lambda L_P^2$ | $\kappa_{\mathrm{ref}} = 141.5$ on the Appendix U five-mode reference branch | $\text{Gr}(12, 24)$ | $e^{-2\kappa}$ on that branch | $\sim 10^{-122}$ |
| $v/M_{Pl}$ | $\kappa_{EW} = 38.5$ | $(SU(2) \times U(1))/U(1)$ | $e^{-\kappa}$ | $\sim 10^{-17}$ |
| $\eta_B$ | $\kappa_B = 19.48$ | CP-odd sphaleron moduli | $e^{-\kappa}$ | $\sim 10^{-9}$ |

### Y.6.2 Derivation of Baryogenesis Complexity

**Theorem Y.8** (Baryogenesis Complexity). Assume that Lemma Y.8.1 supplies a nonzero complement-equivariant midpoint readout, Lemma Y.8.2 supplies three parallel $S_3$-related family saddles sharing one binary verification budget, and the accepted transport certificate composes the CP half-history weight with the family-channel sum without exact destructive cancellation. Then
$$
\boxed{
\kappa_B
=\kappa_{CP}+\kappa_{gen}
=\frac{77}{4}+\frac{\ln2}{3}
=19.481049060186648\ldots
}.
\tag{Y.11}
$$

*Proof.*

**Step 1: Electroweak Base Complexity.** Definition T.13 and Theorem T.5 give the unique registered unit-update path $x_*(t)=te_{p_A}$ and
$$
\kappa_{EW}=\frac{77}{2}.
$$

**Step 2: CP-Odd Half-Path Complexity.**

**Lemma Y.8.1 (CP-Odd Complexity from the Complement-Equivariant Half-Path).** Let $x_*(t)=te_{p_A}$ be the unique path of Theorem T.5 and define
$$
\mathsf C_{p_A}(x)=e_{p_A}-x.
$$
Then $\mathsf C_{p_A}(x_*(1-t))=x_*(t)$, the midpoint $x_*(1/2)=e_{p_A}/2$ is fixed, and the action density is invariant under $t\mapsto1-t$. Define the baryogenic CP-odd observable as the registered oriented midpoint-crossing readout of the first half-history, and require its CP/transport coefficient $A_{CP}$ to be nonzero. Its leading saddle weight is then $A_{CP}e^{-\kappa_{CP}}$, where
$$
\kappa_{CP}
=\frac12\int_0^{1/2}\|B\dot x_*\|^2dt
=\frac12\kappa_{EW}
=\frac{77}{4}.
$$

*Proof.* The complement identity and midpoint identity are direct. Since $\dot x_*=e_{p_A}$, the action density is constant. Its integral over the first half interval is exactly half the full action. The nonzero registered readout coefficient prevents the half-history contribution from being removed from the observable. Without the midpoint-support condition, the involution alone would not divide the full-saddle exponent. ∎

**Step 3: Generational Coherence Correction.**

**Lemma Y.8.2 (Parallel Symmetric Generation Saddles).** Let $N_g\ge2$ and let $c_1,\ldots,c_{N_g}\ge0$ be the actions assigned to $N_g$ parallel pre-flavor family saddles. Require that they share one registered binary verification budget,
$$
\sum_{g=1}^{N_g}c_g=\varepsilon_0=\ln2
$$
and that the saddle certificate is invariant under $S_{N_g}$ permutations. Then
$$
c_1=\cdots=c_{N_g}=\frac{\varepsilon_0}{N_g}.
$$
If the generation-sector transition weight is
$$
W_{\mathrm{gen}}
=\sum_{g=1}^{N_g}A_g e^{-c_g}
$$
and the accepted transport certificate proves $\sum_gA_g\ne0$, then
$$
W_{\mathrm{gen}}
=\left(\sum_gA_g\right)e^{-\varepsilon_0/N_g},
\qquad
\kappa_{\mathrm{gen}}=\frac{\varepsilon_0}{N_g}.
$$
At $N_g=3$ this is $\kappa_{\mathrm{gen}}=\ln2/3$. The finite orbit sum belongs to the prefactor. If the channels instead compose sequentially, their exponent is $\sum_gc_g=\ln2$ and this lemma's parallel-saddle conclusion does not apply.

*Proof.* Transitivity of the $S_{N_g}$ action gives $c_1=\cdots=c_{N_g}$. The fixed budget gives the unique common value $\varepsilon_0/N_g$. Factoring this common exponential out of the parallel sum proves the result; the noncancellation condition makes its coefficient nonzero. ∎

**Remark Y.8.2.1 (Branch Dependence of the Sharing Rule).** The exponent $\ln2/3$ is exact only on the fixed-total-budget, parallel, $S_3$-invariant, noncancelling branch of Lemma Y.8.2 at $N_g=3$. Unequal parallel actions are controlled by the least surviving exponent rather than their arithmetic average, while sequential composition adds the actions and gives total exponent $\ln2$. These alternatives are different registered transport models, not uncertainties in the same theorem.

**Step 4: Leading-Exponential Factorization.** By the factorization hypothesis in the theorem statement, the baryogenesis measure separates at leading exponential order into a CP-odd gauge contribution and a generation-coherence contribution:
$$
d\mu_B = d\mu_{CP}\, d\mu_{gen}\,(1+o(1)).
$$
Hence the suppression factors multiply:
$$
e^{-\kappa_B} = e^{-\kappa_{CP}} e^{-\kappa_{gen}},
$$
and therefore the exponents add:
$$
\kappa_B = \kappa_{CP} + \kappa_{gen}.
$$

**Step 5: Total Complexity.**
$$
\kappa_B
=\frac{77}{4}+\frac{\ln2}{3}
=19.481049060186648\ldots.
$$

The term $\ln2/3$ is the common action of the three parallel symmetric saddles sharing one fixed total budget; it is not a sequential reset count.

∎

**Corollary Y.8.3** (Sensitivity to Generation Number). *On the democratic single-verification and CKM-source branch:*
- *For $N_g=2$, the CKM matrix has no physical CP phase, so this particular CKM-sourced product branch has $\mathcal F_{CP}=0$ unless an independently certified CP source is added.*
- *For $N_g=4$, the structural substitutions give*
$$
\kappa_{gen}=\frac{\ln2}{4}=0.173286\ldots,
\qquad
\kappa_B=19.25+\frac{\ln2}{4}=19.423286\ldots,
$$
*and the Harvey--Turner conversion with one Higgs doublet is*
$$
c_{\mathrm{sph}}=\frac{8(4)+4}{22(4)+13}=\frac{36}{101}=0.356435\ldots.
$$
*These substitutions do not determine $\mathcal C_{\mathrm{eff}}$, the CP response, washout, or $\eta_B$ without a four-generation transport certificate.*

*Proof.* The two-generation CKM statement is the rephasing result used in Theorem R.3.4. For four generations, substitute $N_g=4$ into Lemma Y.8.2 and Proposition Y.9.1. No equation in those results fixes the remaining transport factors, so no numerical baryon yield follows. ∎

### Y.6.3 Structure Summary

| Component | Value | Physical Origin |
|:----------|:-----:|:----------------|
| $\kappa_{EW}/2$ | 19.25 | CP-odd complexity of the complement-equivariant half-path (Lemma Y.8.1) |
| $\varepsilon_0/N_g$ | $\ln2/3$ | Common action on the fixed-budget, parallel, $S_3$-symmetric, noncancelling family-saddle branch |

| $\kappa_B$ | 19.48 | Total baryogenesis complexity |

---

## Y.7 Master Formula and Numerical Derivation

### Y.7.1 The Baryogenesis Master Formula

**Definition Y.6.1a (APS-Eta Baryon Transport Certificate).** An APS-eta baryon transport certificate is a finite record
$$
\mathfrak A_\eta
=
\left(
W_{\mathrm{EW}},
A_{\mathrm{EW}},
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
\Gamma_{\mathrm{fl}},
\mathcal L_{\mathrm{Berry}},
D_W,
\Delta N_{CS},
\eta_{\partial W},
h_{\partial W},
\mathfrak o_{\mathrm{KMS}},
B_{\mathrm{ret}},
\mathcal N_{\mathrm{APS}},
I_{CP},
I_{tr},
\mathfrak h_\eta
\right)
\tag{Y.6.1a.1}
$$
where:

1. $W_{\mathrm{EW}}$ is a compact oriented four-dimensional Euclidean electroweak interpolation cobordism with APS boundary $\partial W_{\mathrm{EW}}=\Sigma_i\cup\Sigma_f$.

2. $A_{\mathrm{EW}}$ is the determinant-compatible electroweak connection on the same global gauge form and hypercharge lattice used by the accepted electroweak threshold record.

3. $\mathfrak R_{\mathrm{EW}}$ is an accepted electroweak threshold certificate of Definition T.78.10, or an accepted equivalent spectral-action/torus threshold certificate with the same normalization and forward lock. It fixes the finite sector projections, Dynkin-index map, gauge normalization, and threshold finite parts entering the baryogenesis calculation.

4. $\mathfrak C_{\mathrm{fl}}^{\circ}$ is either the accepted flavor/CP certificate $\mathfrak C_{\mathrm{fl}}$ of Definition T.79.4, the accepted joint threshold-flavor certificate $\mathfrak J_{\mathrm{RHG-fl}}$, or an explicitly registered flavor-independent CP certificate $\mathfrak C_{CP}^{0}$ proving a nonzero CP-odd source without using masses, mixings, or phases as targets. In the absence of $\mathfrak C_{CP}^{0}$ the Appendix Y numerical baryogenesis route is downstream of the accepted threshold and flavor rows.

5. $\Gamma_{\mathrm{fl}}:W_{\mathrm{EW}}\to\mathrm{Gr}(2,8)$ is the retained flavor-generation branch map pulled from $\mathfrak C_{\mathrm{fl}}^{\circ}$, and $\mathcal L_{\mathrm{Berry}}$ is its determinant-line Berry line with orientation already fixed by the flavor certificate.

6. $D_W$ is the chiral retained Dirac operator on $W_{\mathrm{EW}}$, twisted by $A_{\mathrm{EW}}$ and by $\Gamma_{\mathrm{fl}}^*\mathcal L_{\mathrm{Berry}}$, with APS boundary conditions. Its determinant line, boundary zero-mode convention, and finite-part convention are part of the same certificate and are not selected from $\eta_B$.

7. $\Delta N_{CS}\in\mathbb Z\setminus\{0\}$ is the oriented Chern-Simons change of the nontrivial sphaleron interpolation in the gauge normalization recorded by $\mathfrak R_{\mathrm{EW}}$. A zero-transition branch does not define the normalized ratios $I_{CP}$ and $I_{tr}$ and must be recorded without those quotients.

8. $\eta_{\partial W}=\eta(D_{\Sigma_f})-\eta(D_{\Sigma_i})$ and $h_{\partial W}=\dim\ker D_{\Sigma_f}-\dim\ker D_{\Sigma_i}$ are the oriented APS boundary eta and kernel corrections, computed with the same finite-part convention as $D_W$.

9. $\mathfrak o_{\mathrm{KMS}}\in\{+1,-1\}$ is the PCE/KMS time orientation of the determinant line.

10. $B_{\mathrm{ret}}$ is the finite baryon-number generator on the retained chiral matter quotient. It is a diagonal finite operator on the accepted matter package and includes the response-null quotient, global gauge form, and anomaly-bordism orientation used by the electroweak and flavor certificates.

11. $\mathcal N_{\mathrm{APS}}=(\mathcal N_{CP},\mathcal N_B,\mathcal D_{\mathrm{Dyn}})$ is the coefficient-normalization ledger: $\mathcal D_{\mathrm{Dyn}}$ maps the finite sector projections to Dynkin indices, $\mathcal N_{CP}$ normalizes the CP-odd topological-density coefficient, and $\mathcal N_B$ normalizes the baryon-number spectral-flow coefficient.

12. The Berry-to-topological-density matching index is
$$
I_{CP}
=
\mathcal N_{CP}
\left[
\frac{1}{\Delta N_{CS}}
\left(
\int_{W_{\mathrm{EW}}}
\hat A(R)\operatorname{ch}\left(E_{\mathrm{EW}}\otimes\Gamma_{\mathrm{fl}}^*\mathcal L_{\mathrm{Berry}}\right)\big|_{[4]}
-
\frac{\eta_{\partial W}+h_{\partial W}}2
\right)
\right].
\tag{Y.6.1a.2}
$$

13. Assume the spatial APS family $D_t$ is a $C^1$ self-adjoint Fredholm path with regular isolated crossings and that $B_{\mathrm{ret}}$ is self-adjoint and preserves every crossing kernel $\ker D_{t_*}$. Define
$$
\operatorname{SF}_{B_{\mathrm{ret}}}(D_W)
:=
\sum_{t_*}
\operatorname{tr}_{\ker D_{t_*}}
\left(
B_{\mathrm{ret}}\operatorname{sgn}\Gamma(D,t_*)
\right),
$$
where $\Gamma(D,t_*)$ is the nondegenerate crossing form. For a nonregular path, define the same quantity only when an accepted homotopy to a regular path preserves $B_{\mathrm{ret}}$ and the endpoint gap. The baryon-number transport index is
$$
I_{tr}
=
\mathcal N_B
\frac{\operatorname{SF}_{B_{\mathrm{ret}}}(D_W)}{N_g\Delta N_{CS}}.
\tag{Y.6.1a.3}
$$

14. $\mathfrak h_\eta$ is the source-exhaustion and forward-lock entry. It records that the CP-odd source, baryon generator, Dynkin-index map, determinant orientation, eta finite part, and normalization factors were fixed before comparison with $\eta_B$ and that no source is counted again in the electroweak threshold, flavor, sphaleron, washout, or photon-normalization records.

The certificate is accepted exactly when all entries above are finite, the APS boundary problem is Fredholm, the anomaly/bordism signs agree with the determinant-line orientation, and $\mathfrak h_\eta$ proves overlap compatibility with $\mathfrak R_{\mathrm{EW}}$ and $\mathfrak C_{\mathrm{fl}}^{\circ}$.

**Theorem Y.6.1b (APS-Eta Transport Gate).** Let a baryogenesis branch carry an accepted APS-eta certificate $\mathfrak A_\eta$ of Definition Y.6.1a. Suppose, in addition, that the certificate contains a determinant-variation or anomaly-descent matching identity proving that the normalized local CP coefficient and baryon transport coefficient equal the two displayed index ratios. Then
$$
\chi_{CP}=I_{CP},
\qquad
\chi_{tr}=I_{tr}.
\tag{Y.6.1b.1}
$$
The canonical unit-response branch is theorem-level when the matching identity holds and
$$
I_{CP}=1,
\qquad
I_{tr}=1,
\qquad
\mathfrak o_{\mathrm{KMS}}
\operatorname{or}(W_{\mathrm{EW}})
\operatorname{or}(\mathcal L_{\mathrm{Berry}})
=+1.
\tag{Y.6.1b.2}
$$
Without the matching identity, $I_{CP}$ and $I_{tr}$ are normalized topological data but do not determine $\chi_{CP}$ or $\chi_{tr}$. If no accepted $\mathfrak A_\eta$ exists, the Berry-to-density coefficient, determinant-line sign, and baryon-number spectral-flow normalization are irreducible branch data.

*Proof.* Items 1--8 of Definition Y.6.1a give a Fredholm APS boundary problem. The Atiyah-Patodi-Singer index theorem computes the bulk Chern-character term minus the eta/kernel boundary correction, hence the numerator in (Y.6.1a.2). The spectral-flow theorem computes the normalized transport datum in (Y.6.1a.3). By the additional matching identity, these two normalized data are respectively the local CP coefficient and baryon transport coefficient, which proves (Y.6.1b.1). If their values are one and the three recorded orientations have positive product, substitution gives the unit-response branch in (Y.6.1b.2). No converse from the index theorem alone is used. ∎

**Corollary Y.6.1b.2 (Normalized Unit Spectral-Flow Branch).** Suppose an accepted $\mathfrak A_\eta$ records the matching identity required by Theorem Y.6.1b and one mapping-torus family whose APS index, spectral flow, eta/kernel boundary correction, orientation, Chern-Simons increment, and normalization satisfy
$$
I_{CP}
=
\mathcal N_{CP}
\frac{\operatorname{sf}(D_\gamma)}{\Delta N_{CS}}
=\sigma_{CP},
\qquad
|\sigma_{CP}|=1.
\tag{Y.6.1b.3}
$$
Then $\chi_{CP}=\sigma_{CP}$. Unit spectral flow by itself does not imply this conclusion; the matching identity, denominator, normalization, boundary correction, and orientation are all essential.

*Proof.* The displayed equality gives $I_{CP}=\sigma_{CP}$. The certified matching identity and Theorem Y.6.1b give $\chi_{CP}=I_{CP}$. Transitivity yields $\chi_{CP}=\sigma_{CP}$. ∎

**Corollary Y.6.1b.3 (Normalized Unit Spectral-Flow Branch).** Suppose an accepted $\mathfrak A_\eta$ records the matching identity required by Theorem Y.6.1b and a mapping-torus family with $\Delta N_{CS}\ne0$ and proves, in one orientation and normalization,
$$
I_{CP}
=\mathcal N_{CP}
\frac{\operatorname{Ind}_{\mathrm{APS}}(D_W)}{\Delta N_{CS}}
=\mathcal N_{CP}
\frac{\operatorname{SF}(D_\gamma)}{\Delta N_{CS}}
=\sigma_{CP},
\qquad |\sigma_{CP}|=1.
\tag{Y.6.1b.3.1}
$$
Then $\chi_{CP}=\sigma_{CP}$. Unit spectral flow without the matching identity, denominator, APS boundary correction, normalization, and orientation is insufficient.

*Proof.* The APS spectral-flow theorem gives the middle equality under the mapping-torus hypotheses. The displayed normalization gives $I_{CP}=\sigma_{CP}$, and the certified matching identity gives $\chi_{CP}=I_{CP}$. ∎

**Definition Y.6.1c (APS-Kubo Baryon Transport Certificate).** An APS-Kubo baryon transport certificate is a finite record
$$
\mathfrak C_B^{\mathrm{APSK}}
=
\left(
\mathfrak A_\eta,
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
B_{\mathrm{ret}},
\theta_{\mathrm{PU}},
\dot\theta_{\mathrm{PU}},
\Gamma_{CS},
\Gamma_{\mathrm{wash}},
W_{\mathrm{PU}},
s,
\mathcal N_\gamma,
\mathcal N_B,
[t_i,t_f],
Y_B(t_i),
\mathcal Q_B,
\mathcal R_B^{\mathrm{APSK}},
\chi_{\mathrm{APSK}}
\right)
\tag{Y.6.1c.1}
$$
where:

1. $\mathfrak A_\eta$ is an accepted APS-eta certificate of Definition Y.6.1a, and its threshold and CP entries agree with the displayed $\mathfrak R_{\mathrm{EW}}$ and $\mathfrak C_{\mathrm{fl}}^{\circ}$.

2. $B_{\mathrm{ret}}$ is the finite baryon-number generator of Definition Y.6.1a and fixes the baryon functional used in the transport equation.

3. $\theta_{\mathrm{PU}}(t)$ is a continuous determinant-line CP phase lift on the retained transport window,
$$
\theta_{\mathrm{PU}}(t)
=
\frac12\eta(D_{\partial X,t})
+
\int_{\gamma_t}\mathcal A_{\mathrm{Berry}}
\quad \mathrm{mod}\ 2\pi,
\tag{Y.6.1c.2}
$$
and $\dot\theta_{\mathrm{PU}}$ is the derivative in the accepted clock convention. Both are fixed by $\mathfrak C_{\mathrm{fl}}^{\circ}$ or by the accepted flavor-independent CP substitute.

4. $\Gamma_{CS}(t)$ is the finite Kubo Chern-Simons diffusion ledger. It consists of finite volume/time windows $(V_j,\tau_j)$, estimator values,
$$
\Gamma_{CS,j}(t)
=
\frac{1}{V_j\tau_j}
\left\langle
\left(N_{CS}(t+\tau_j)-N_{CS}(t)\right)^2
\right\rangle_j,
\tag{Y.6.1c.3}
$$
and a certified tail interval whose limit is the accepted $\Gamma_{CS}(t)$. The branch may not replace the window, estimator, or tail bound after dependent threshold or flavor rows are fixed.

5. $\Gamma_{\mathrm{wash}}(t)\ge0$ is the washout/freeze-out profile on $[t_i,t_f]$.

6. $W_{\mathrm{PU}}(t)$ is the CP Kubo pairing from the determinant-line phase source to the finite baryon-number generator. It includes the susceptibility, chemical-potential conversion, and sphaleron-generator normalization not already contained in $\Gamma_{CS}$.

7. $s(t)>0$ is the entropy density convention, $\mathcal N_\gamma(t_f)=s(t_f)/n_\gamma(t_f)$ is the photon-normalization factor, and $\mathcal N_B$ is the coefficient normalization inherited from $\mathcal N_{\mathrm{APS}}$.

8. $[t_i,t_f]$ is a finite transport window and $Y_B(t_i)$ is the initial baryon-to-entropy vector or scalar specified by the branch.

9. The profiles are measurable and satisfy
$$
\Gamma_{\mathrm{wash}}\in L^1([t_i,t_f]),
\qquad
S_B(t):=
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\dot\theta_{\mathrm{PU}}(t)\Gamma_{CS}(t)}{s(t)}
\in L^1([t_i,t_f]).
$$
The retained transport equation holds almost everywhere for an absolutely continuous $Y_B$:
$$
\frac{dY_B}{dt}
+
\Gamma_{\mathrm{wash}}(t)Y_B(t)
=S_B(t),
\qquad
Y_B(t_i)\ \text{specified}.
\tag{Y.6.1c.4}
$$

10. $\mathcal Q_B$ is the quadrature and tail ledger for the time or temperature integral, including endpoint, interpolation, and Kubo-tail errors.

11. $\mathcal R_B^{\mathrm{APSK}}$ is the propagated residual interval for all finite approximations and certified tails.

12. $\chi_{\mathrm{APSK}}$ records source exhaustion, no target-fitting, and no double counting with electroweak threshold, flavor, sphaleron, washout, photon-normalization, or future residual rows.

**Theorem Y.6.1d (APS-Kubo Transport Lock).** On a branch carrying an accepted $\mathfrak C_B^{\mathrm{APSK}}$, the baryon-to-photon ratio is the certified interval
$$
\eta_B
\in
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{t_i}^{t_f}
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\dot\theta_{\mathrm{PU}}(t)\Gamma_{CS}(t)}{s(t)}
\exp\left[-\int_t^{t_f}\Gamma_{\mathrm{wash}}(u)\,du\right]dt
\right]
+
\mathcal R_B^{\mathrm{APSK}}.
\tag{Y.6.1d.1}
$$
If the branch uses temperature as a monotone clock with
$$
dt=-\frac{dT}{H(T)T},
\tag{Y.6.1d.2}
$$
then the source term in (Y.6.1d.1) is equivalently
$$
\int_{T_f}^{T_i}
\mathcal N_B
\frac{W_{\mathrm{PU}}(T)\dot\theta_{\mathrm{PU}}(T)\Gamma_{CS}(T)}{s(T)H(T)T}
\exp\left[-\int_{T_f}^{T}\frac{\Gamma_{\mathrm{wash}}(T')}{H(T')T'}\,dT'\right]dT.
\tag{Y.6.1d.3}
$$
Thus the CP source, APS index, sphaleron diffusion, transport coefficient, washout, entropy density, photon normalization, and residual interval are one finite record. A scalar product formula is theorem-level only when it is derived as the evaluated reduction of (Y.6.1d.1) with the same $\mathcal Q_B$ and $\mathcal R_B^{\mathrm{APSK}}$.

*Proof.* Equation (Y.6.1c.4) is a finite first-order linear transport equation with fixed coefficients on the accepted window. Multiplication by the integrating factor $\exp(\int_{t_i}^t\Gamma_{\mathrm{wash}})$ gives (Y.6.1d.1) after integration and multiplication by the fixed photon-normalization factor. The temperature form is the change of variables (Y.6.1d.2). The quadrature ledger and Kubo-tail certificate propagate exactly into $\mathcal R_B^{\mathrm{APSK}}$. Since $\mathfrak A_\eta$, $\mathfrak R_{\mathrm{EW}}$, and $\mathfrak C_{\mathrm{fl}}^{\circ}$ are entries of the same certificate, the output is downstream of the accepted threshold and CP/flavor records unless the explicit substitute $\mathfrak C_{CP}^{0}$ has already discharged flavor independence. ∎

**Corollary Y.6.1e (Product-Formula Reduction of the APS-Kubo Ledger).** If the APS-Kubo certificate has a factorized transport window on which the entire nonresidual transport output satisfies
$$
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{t_i}^{t_f}
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\dot\theta_{\mathrm{PU}}(t)\Gamma_{\mathrm{CS}}(t)}{s(t)}
\exp\left[-\int_t^{t_f}\Gamma_{\mathrm{wash}}(u)\,du\right]dt
\right]
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B},
\tag{Y.6.1e.1}
$$
and the product-level theorem branch has $\mathcal R_B^{\mathrm{APSK}}=\{0\}$, then Theorem Y.9 follows from Theorem Y.6.1d with the same certified normalization and transport window. If the equality (Y.6.1e.1) or the zero-residual product branch is not supplied, the interval (Y.6.1d.1) replaces the product formula for theorem-level use.

*Proof.* Substitute the full bracketed equality (Y.6.1e.1) into (Y.6.1d.1). The zero-residual condition removes the remaining interval term, giving the master formula of Theorem Y.9 on that product branch. If (Y.6.1e.1) or the zero-residual condition is absent, Theorem Y.6.1d still supplies the unique transport output, while the bare product decomposition is not licensed. ∎

**Definition Y.6.1f (Holonomy-Transport Surface).** On an accepted APS-Kubo branch, a holonomy-transport surface is a $C^1$ map
$$
\Gamma:[t_i,t_f]\times S^1\to\mathrm{Gr}(2,8)
\tag{Y.6.1f.1}
$$
together with a $C^1$ real lift of the determinant-line phase on $[t_i,t_f]$. The time slices $\gamma_t(s)=\Gamma(t,s)$ are the retained flavor loops used in the phase lift of Definition Y.6.1c. Let
$$
\Theta_\eta(t)=\frac12\eta(D_{\partial X,t})
$$
be the accepted $C^1$ APS boundary phase representative in the same finite-part convention. The real lift is required to satisfy
$$
\theta_{\mathrm{PU}}(t)
\equiv
\Theta_\eta(t)+\oint_{\gamma_t}\mathcal A_{\mathrm{Berry}}
\pmod{2\pi}.
\tag{Y.6.1f.2}
$$
Define the baryogenesis transport weight
$$
\mathcal W_B(t)
:=
\mathcal N_B
\frac{W_{\mathrm{PU}}(t)\Gamma_{\mathrm{CS}}(t)}{s(t)}
\exp\left[-\int_t^{t_f}\Gamma_{\mathrm{wash}}(u)\,du\right],
\tag{Y.6.1f.3}
$$
and require $\mathcal W_B\in L^1([t_i,t_f])$.

**Theorem Y.6.1g (Holonomy-Index Normal Form for Baryon Transport).** On a branch carrying an accepted APS-Kubo certificate and a holonomy-transport surface of Definition Y.6.1f, the certified transport output in Theorem Y.6.1d has the exact normal form
$$
\eta_B
\in
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{t_i}^{t_f}\mathcal W_B(t)\dot\Theta_\eta(t)\,dt
+
\int_{[t_i,t_f]\times S^1}\mathcal W_B(t)\,\Gamma^*\mathcal F_{\mathrm{Berry}}
\right]
+
\mathcal R_B^{\mathrm{APSK}}.
\tag{Y.6.1g.1}
$$
If the accepted APS boundary convention is stationary on the transport window, $\dot\Theta_\eta(t)=0$, then the CP-active source is precisely the weighted Berry-curvature flux through the finite predictive flavor surface:
$$
\eta_B
\in
\mathcal N_\gamma(t_f)
\left[
Y_B(t_i)e^{-\int_{t_i}^{t_f}\Gamma_{\mathrm{wash}}(u)\,du}
+
\int_{[t_i,t_f]\times S^1}\mathcal W_B(t)\,\Gamma^*\mathcal F_{\mathrm{Berry}}
\right]
+
\mathcal R_B^{\mathrm{APSK}}.
\tag{Y.6.1g.2}
$$
Thus the Appendix Y CP source is not an independent scalar insertion on an accepted transport branch. It is the finite predictive transport image of APS boundary phase plus Berry curvature, pushed through the same sphaleron, washout, entropy, photon, and residual ledgers.

*Proof.* By Definition Y.6.1f, the accepted real lift gives an integer $m$ that is constant on the connected transport window such that
$$
\theta_{\mathrm{PU}}(t)
=
\Theta_\eta(t)+\oint_{S^1}\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_s)\,ds+2\pi m.
$$
Differentiating the loop integral gives
$$
\frac{d}{dt}\oint_{S^1}\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_s)\,ds
=
\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds.
\tag{Y.6.1g.3}
$$
Indeed, in any accepted local gauge for the pulled-back Berry line,
$$
\partial_t\big(\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_s)\big)
=
\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)
+
\partial_s\big(\Gamma^*\mathcal A_{\mathrm{Berry}}(\partial_t)\big),
$$
and the total $s$-derivative integrates to zero on the closed loop $S^1$. On overlaps, a gauge change adds a closed-loop integral of a total derivative and, for a nontrivial transition winding, an integer multiple of $2\pi$ that is constant on the connected lift interval. Its derivative is therefore zero. Hence the derivative of the accepted real holonomy lift is the curvature flux. Therefore
$$
\dot\theta_{\mathrm{PU}}(t)
=
\dot\Theta_\eta(t)
+
\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds.
\tag{Y.6.1g.4}
$$
Substitute (Y.6.1g.4) into the integral term of Theorem Y.6.1d and use the definition (Y.6.1f.3) of $\mathcal W_B(t)$. Fubini's theorem on the finite retained transport window converts
$$
\int_{t_i}^{t_f}\mathcal W_B(t)
\left[
\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds
\right]dt
$$
into the surface integral in (Y.6.1g.1). The residual interval is unchanged because no approximation is introduced; only the accepted phase derivative is rewritten by Stokes-Cartan calculus on the same finite record. Setting $\dot\Theta_\eta=0$ gives (Y.6.1g.2). ∎

**Corollary Y.6.1h (No Scalar CP-Source Replacement).** On an accepted APS-Kubo branch, replacing $\dot\theta_{\mathrm{PU}}$ by a scalar CP parameter is theorem-level only if the replacement is the evaluated value of the right-hand side of (Y.6.1g.4) under the same holonomy-transport surface, APS boundary convention, transport normalization, and residual ledger.

*Proof.* Theorem Y.6.1g expresses the certified source as a fixed finite transport image. A scalar substitute that does not factor through the same expression changes the source entry of the certificate. By Theorem Y.11.7h, changing a required source entry creates a different branch and cannot promote the original numerical row. ∎

**Theorem Y.6.1i (Static-Holonomy KMS Obstruction).** Let $\mathcal L$ be the accepted finite transport generator, let $\rho_\beta$ be an exact stationary KMS state with $\mathcal L(\rho_\beta)=0$, and let $B_{\mathrm{ret}}$ have no explicit time dependence. Then
$$
\frac{d}{dt}\operatorname{tr}(\rho_\beta B_{\mathrm{ret}})
=
\operatorname{tr}\!\left(\mathcal L(\rho_\beta)B_{\mathrm{ret}}\right)=0.
\tag{Y.6.1i.1}
$$
Therefore a time-independent Berry holonomy angle is CP-odd branch data but cannot change the stationary baryon expectation. If a separate CP/CPT, chemical-potential, and boundary certificate fixes that expectation to zero, it remains zero; this theorem does not itself determine the value. A secularly generated yield requires at least one response-active nonequilibrium entry: $\dot\theta_{\mathrm{PU}}\ne0$, nonstationary state preparation, boundary/inflow spectral flow, an initial asymmetry followed by freeze-out, or another explicitly certified drive.

*Proof.* Stationarity and absence of explicit observable time dependence give the displayed equality. A static parameter may change the stationary generator or equilibrium state, but once the accepted state is stationary it cannot produce secular change of $\langle B_{\mathrm{ret}}\rangle$. Its constant value is not fixed by stationarity alone. The listed alternatives are precisely ways to leave that premise or add boundary transport. ∎

**Theorem Y.6.1j (Sharp Holonomy-Transport Cost Bound).** On a real finite transport window, suppose the accepted linear-response reduction is
$$
\eta_B
=
\eta_{\mathrm{hom}}
+\int_{t_i}^{t_f}K_B(t)q(t)\,dt
+r_B,
\qquad
q(t)=\dot\theta_{\mathrm{PU}}(t),
\qquad
r_B\in\mathcal R_B,
\tag{Y.6.1j.1}
$$
where $\mathcal R_B\subset\mathbb R$ is nonempty and closed and $m(t)>0$ almost everywhere. Define
$$
\Sigma_\theta[q]=\int_{t_i}^{t_f}m(t)q(t)^2\,dt,
\qquad
X_B=\int_{t_i}^{t_f}\frac{K_B(t)^2}{m(t)}\,dt<\infty.
\tag{Y.6.1j.2}
$$
Every pair $(q,r_B)$ that attains a target value $\eta_B^{\mathrm{tar}}$ obeys
$$
\Sigma_\theta[q]
\ge
\frac{\operatorname{dist}\!\left(\eta_B^{\mathrm{tar}}-\eta_{\mathrm{hom}},\mathcal R_B\right)^2}{X_B}
\tag{Y.6.1j.3}
$$
whenever $X_B>0$. If the admissible set is $L^2([t_i,t_f],m\,dt)\times\mathcal R_B$, the bound is sharp: with a closest residual representative fixed, equality holds exactly when
$$
q(t)=\lambda\frac{K_B(t)}{m(t)}
\tag{Y.6.1j.4}
$$
almost everywhere, with $\lambda$ chosen to reach the target. For a constrained admissible set, the lower bound remains valid, and equality is asserted only when the closest residual and proportional drive are jointly admissible.

*Proof.* Weighted Cauchy--Schwarz gives
$$
\left|\int K_Bq\,dt\right|^2
\le
\left(\int\frac{K_B^2}{m}\,dt\right)
\left(\int mq^2\,dt\right)
=X_B\Sigma_\theta[q].
$$
For any allowed residual, the magnitude of the response integral is at least the distance appearing in (Y.6.1j.3). Equality in weighted Cauchy--Schwarz is equivalent to (Y.6.1j.4). ∎

**Corollary Y.6.1k (Status of the Product Formula).** Theorem Y.9 is a reduced product representation only on a nonstationary transport branch whose $\chi_{\mathrm{tr}}$, $f_{\mathrm{neq}}$, source $q=\dot\theta_{\mathrm{PU}}$, freeze-out map, and residual ledger reproduce (Y.6.1j.1). A static factor such as $\tanh(\mathcal S\sin\delta)$ may weight a driven response but cannot replace $q$. The factor $e^{-\kappa_B}$ is a branch weight, not a proof of departure from equilibrium.

*Proof.* Theorem Y.6.1i proves that a stationary state and time-independent phase produce no secular baryon change. Theorem Y.6.1j writes every accepted linear response in terms of the drive $q=\dot\theta_{\mathrm{PU}}$ plus its homogeneous and residual terms. Therefore any product reduction must reproduce that response data; multiplying by static factors cannot supply a missing drive. ∎

**Relation to Corollary Y.6.1h.** Corollary Y.6.1h already forbids an uncertified scalar replacement of $\dot\theta_{\mathrm{PU}}$. Theorems Y.6.1i--Y.6.1j add, respectively, the exact stationary-state obstruction and the sharp minimum-cost theorem for an accepted driven response.

**Theorem Y.9 (Conditional Reduced Product Formula).** Assume an accepted transport certificate proves that its finite output factorizes into an efficiency coefficient, a CP-odd response, a washout survival factor, and the registered complexity weight. Then
$$
\eta_B
=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}.
\tag{Y.12}
$$
The three prefactors are outputs of that same certificate; the factorization assigns none of them a default value. Without the factorization certificate, the applicable statement is the certified finite transport image and residual interval.

*Proof.* By hypothesis, the nonresidual output of the accepted certificate is the product of the four named factors, with their normalization and branch placement supplied by that certificate. Writing that assumed factorization gives (Y.12). If the certificate supplies a nonzero residual interval, its Minkowski sum must be retained and the equality (Y.12) is unavailable. ∎

### Y.7.2 Derivation of Efficiency Coefficient

**Proposition Y.9.1 (Conditional Transport Coefficient).** Let an accepted transport certificate reduce the finite yield to Theorem Y.9's product form. Then $\mathcal C_{\mathrm{eff}}$ is the coefficient obtained from that reduction. Assume the Harvey--Turner chemical-equilibrium regime: all retained species are relativistic, gauge interactions make multiplet chemical potentials equal, the relevant Yukawa reactions and electroweak sphalerons are in equilibrium, chemical potentials are generation-independent, the plasma is hypercharge neutral, and there are $N_g$ fermion generations and $n_H$ Higgs doublets. Then
$$
c_{\mathrm{sph}}
=\frac{B}{B-L}
=\frac{8N_g+4n_H}{22N_g+13n_H}.
$$
For $(N_g,n_H)=(3,1)$,
$$
c_{\mathrm{sph}}=\frac{24+4}{66+13}=\frac{28}{79}.
$$
This identity supplies no universal factor $1/(2\pi\alpha_W)$, unit transport coefficient, or default nonequilibrium factor.

*Proof.* Let $\mu_q,\mu_u,\mu_d,\mu_\ell,\mu_e,\mu_H$ denote the common chemical potentials. Yukawa equilibrium gives
$$
\mu_u=\mu_q+\mu_H,
\qquad
\mu_d=\mu_q-\mu_H,
\qquad
\mu_e=\mu_\ell-\mu_H.
$$
Electroweak sphaleron equilibrium gives $3\mu_q+\mu_\ell=0$. Including the factor two between bosonic and fermionic number susceptibilities, hypercharge neutrality is
$$
N_g(\mu_q+2\mu_u-\mu_d-\mu_\ell-\mu_e)+2n_H\mu_H=0.
$$
Substitution of the Yukawa and sphaleron relations yields
$$
8N_g\mu_q+(4N_g+2n_H)\mu_H=0,
\qquad
\mu_H=-\frac{4N_g}{2N_g+n_H}\mu_q.
$$
Up to the common fermionic susceptibility factor,
$$
B=N_g(2\mu_q+\mu_u+\mu_d)=4N_g\mu_q,
$$
and
$$
L=N_g(2\mu_\ell+\mu_e)=N_g(-9\mu_q-\mu_H).
$$
Therefore
$$
B-L=N_g(13\mu_q+\mu_H)
=N_g\mu_q\frac{22N_g+13n_H}{2N_g+n_H},
$$
so
$$
\frac{B}{B-L}
=\frac{4(2N_g+n_H)}{22N_g+13n_H}
=\frac{8N_g+4n_H}{22N_g+13n_H}.
$$
∎

### Y.7.3 Washout Correction

**Proposition Y.9.2 (Conditional Washout Survival).** Let $\gamma_{\mathrm{wash}}:[t_i,t_f]\to[0,\infty]$ be measurable and define
$$
G_{\mathrm{wash}}:=\int_{t_i}^{t_f}\gamma_{\mathrm{wash}}(t)\,dt\in[0,\infty].
$$
Set
$$
f_{\mathrm{wash}}:=e^{-G_{\mathrm{wash}}},\qquad e^{-\infty}:=0.
$$
Then $0\le f_{\mathrm{wash}}\le1$, with $f_{\mathrm{wash}}>0$ exactly when $G_{\mathrm{wash}}<\infty$.

*Proof.* If $G_{\mathrm{wash}}<\infty$, then $-G_{\mathrm{wash}}\le0$ and the exponential is in $(0,1]$. If $G_{\mathrm{wash}}=\infty$, the declared convention gives $f_{\mathrm{wash}}=0$. These two exhaustive cases prove both the bound and the equivalence. ∎

### Y.7.4 Validation-Run Electroweak Coupling

**Lemma Y.9.3** (Validation-Run Electroweak Coupling). *The SU(2)$_L$ coupling $\alpha_W$ at the sphaleron temperature $T_{sph} \approx 160$ GeV is evaluated from:*
$$\alpha_W = \frac{\alpha_{em}}{\sin^2\theta_W}$$

*Proof.*

**Step 1 (Fine structure constant).** On the conditional sinc-core branch of Appendix Z, Theorem Z.26 gives
$$
\alpha^{-1}_{0}=137.03609205522863\ldots.
$$
The Thomson comparison quantity is the residual-gated row
$$
\alpha_{em}^{-1}(\text{Thomson})
=
\alpha^{-1}_{0}+R_\alpha
$$
of Corollary Z.26b. Theorem Z.26 does not fix $R_\alpha$. The scales in Section Z.27.9 are comparison-budget diagnostics and become a certified interval only through an accepted pre-comparison residual gate.

**Step 2 (Electromagnetic input at the sphaleron scale).** This validation row adopts
$$
\alpha_{em}^{-1}(160\,\mathrm{GeV})=127.5
$$
as an external scheme-dependent running-coupling input. A derivation within the manuscript would require a specified renormalization scheme, charged-particle thresholds, matching conditions, and beta functions.

**Step 3 (Weak-angle input at the sphaleron scale).** Appendix T supplies the conditional tree-level normalization $\sin^2\theta_W^{(0)}=3/8$ and the validation tuple described there, but it does not supply a closed RG certificate to $160\,\mathrm{GeV}$. This validation row therefore adopts
$$
\sin^2\theta_W(160\,\mathrm{GeV})=0.234
$$
as a second external input in the same coupling convention.

**Step 4 (Combination).** At a common scale and in a common scheme, $e=g\sin\theta_W$ implies
$$
\alpha_{em}=\alpha_W\sin^2\theta_W.
$$
Hence
$$
\alpha_W^{-1}
=\alpha_{em}^{-1}\sin^2\theta_W
=127.5\times0.234
=29.835,
$$
or
$$
\alpha_W=0.0335177\ldots\approx\frac1{29.8}\approx\frac1{30}.
$$

This is conditional arithmetic from two adopted running inputs, not a manuscript-internal RG derivation. A theorem-level value requires an accepted global spectral/RG branch extension registered before comparison and evaluated forward. ∎

### Y.7.5 Complete Numerical Calculation

**Input and Open-Output Ledger:**

The registered inputs give

$$
\kappa_B
=
\frac{38.5}{2}+\frac{\ln2}{3}
=
19.481049060\ldots,
\qquad
e^{-\kappa_B}
=
3.463282285\ldots\times10^{-9}.
$$

A baryon yield additionally requires the transport coefficient $\mathcal C_{\mathrm{eff}}$, a CP response $\mathcal F_{CP}$, and the washout survival $f_{\mathrm{wash}}$ from one accepted transport certificate. The conditional reduction is
$$
\eta_B=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}.
$$
The values $0.282$, $0.9997$, and $0.63$ are not derived by the current archive. Inserting them with the exact registered exponent gives the arithmetic product

$$
0.282\times0.9997\times0.63\times e^{-19.481049060\ldots}
=
6.151021447823927981\ldots\times10^{-10},
$$

but this is an illustrative factor product, not a prediction or validation interval.

#### Y.7.5a Uncertainty Status

No uncertainty for $\eta_B$ is defined until the source, transport, washout, threshold, normalization, residual, and covariance records are fixed. The factor $c_{\mathrm{sph}}=28/79$ is a chemical-equilibrium conversion under its field-content assumptions; it is not a lattice quantity with a $3\%$ uncertainty.

## Y.8 Comparison with Observation

### Y.8.1 Baryon-Yield Status

The observational comparison value is
$$
\eta_B^{\mathrm{obs}}=(6.12\pm0.04)\times10^{-10}.
$$
The present Appendix Y branch has no certified numerical theory interval because its CP-source, transport, washout, and normalization certificate is open. Consequently no baryon-yield pull, agreement claim, or falsification interval is reported.

### Y.8.2 Independent Flavor Diagnostics

The conditional CKM rows are separate diagnostics and do not close the baryon transport certificate. The $66.7^\circ$ CKM phase is itself conditional on the nonlinear phase-response ansatz in Theorem T.56.

### Y.8.3 Parameter Accounting

The open outputs include $A_{CP}(t)$, $\mathcal C_{\mathrm{eff}}$, $\mathcal F_{CP}$, $\gamma_{\mathrm{wash}}$, the transport generator, the photon normalization, and their covariance/residual ledger. Therefore the displayed illustrative product does not have zero adjustable or external parameters.

## Y.9 Sign of the Baryon Asymmetry

**Theorem Y.10 (Conditional Sign of the Baryon Asymmetry).** The initial condition $N_{CS}(\Sigma_i)=0$ and a time orientation do not determine the sign of $\Delta N_{CS}$. Let an accepted transport branch satisfy the integrability hypotheses of Definition Y.11.7e, let $\nu_B$ be real-valued, and let $\mathcal N_\gamma>0$. If the initial homogeneous term vanishes, then
$$
\operatorname{sign}(\eta_B)
=\operatorname{sign}\!\left[
\mathcal N_\gamma\nu_B\!\left(
\int_{t_i}^{t_f}\mathcal U_B(t_f,t)S_{CP}(t)
e^{-\int_t^{t_f}W_B(u)\,du}\,dt
\right)
\right].
$$
Matter dominance follows only if this certified quantity is positive.

*Proof.* Equation (Y.11.7e.1) gives the final transport state as the homogeneous term plus the displayed source integral. The first term is zero by hypothesis. Applying the real linear readout $\nu_B$ and multiplying by the positive photon normalization gives the displayed scalar. Taking its sign proves the identity. The condition $N_{CS}(\Sigma_i)=0$ does not determine the sign of the source integral or of $\Delta N_{CS}$, so no further sign conclusion follows. ∎

**Corollary Y.10.1 (Open Sign Gate).** There is no continuous sign parameter after a complete signed transport certificate is accepted, but the current archive has not derived that certificate from the boundary condition alone.

*Proof.* Theorem Y.10 expresses the sign as the sign of one real transport functional. Once every entry of that functional is specified and its value is nonzero, its sign is discrete. The condition $N_{CS}(\Sigma_i)=0$ leaves the signed source and oriented transport kernel unspecified, so two admissible completions can give opposite signs. ∎

**Corollary Y.10.2 (CP Phase as Predictive Orientation Defect).** On the Berry-loop baryogenesis branch, define the predictive-orientation holonomy
$$
\delta_{\mathrm{hol}}
=
\oint_{\gamma_{\mathrm{flavor}}}\mathcal A_{\mathrm{Berry}}
=
\int_{\Sigma_{\mathrm{flavor}}}\mathcal F_{\mathrm{Berry}}.
$$
Suppose an accepted signed transport certificate additionally proves that its nonzero yield has a positive magnitude factor $M_B>0$ and the factorization
$$
\eta_B
=
M_B\,
\sin\delta_{\mathrm{hol}}\,
\Delta N_{CS}\,
\mathcal T_{\mathrm{KMS}},
\qquad
\mathcal T_{\mathrm{KMS}}\in\{+1,-1\}.
$$
Then
$$
\mathrm{sign}(\eta_B)
=
\mathrm{sign}\!\left(
\sin\delta_{\mathrm{hol}}\cdot
\Delta N_{CS}\cdot
\mathcal T_{\mathrm{KMS}}
\right).
$$
Identification of $\delta_{\mathrm{hol}}$ with the numerical value $66.7°$ additionally requires the nonlinear phase-response ansatz of Theorem T.56.

*Proof.* Theorems T.53--T.54 and Theorem Y.6 identify the base CP datum with Berry holonomy over the retained flavor loop. Stokes' theorem on the chosen Berry surface gives the first display. Under the stated signed-factorization hypothesis, $M_B>0$ contributes no sign, so taking the sign of the product gives the final display. The general case remains the complete signed transport functional of Theorem Y.10. ∎

---

## Y.10 Relation to Standard Electroweak Baryogenesis

### Y.10.1 The Standard Model Deficit

For a schematic order-of-magnitude comparison, adopt the illustrative factorization
$$
\eta_B^{\mathrm{SM,schematic}}
\sim J_{CP}f_{\mathrm{sphaleron}}f_{\mathrm{PT}}f_{\mathrm{washout}}
$$
and the four illustrative inputs
$$
J_{CP}\sim10^{-5},
\qquad
f_{\mathrm{sphaleron}}\sim10^{-2},
\qquad
f_{\mathrm{PT}}\sim10^{-9},
\qquad
f_{\mathrm{washout}}\sim10^{-4}.
$$
Their arithmetic product is
$$
\eta_B^{\mathrm{SM,schematic}}\sim10^{-20}.
$$
Relative to $6.12\times10^{-10}$, the ratio is
$$
\frac{6.12\times10^{-10}}{10^{-20}}=6.12\times10^{10}.
$$
This schematic comparison illustrates the Standard Model baryogenesis deficit; it is not a controlled transport calculation or an uncertainty-bearing Standard-Model prediction.

### Y.10.2 PU Resolution

On the illustrative Appendix Y product branch, the proposed factors compare with the schematic Standard-Model factors as follows; a resolution claim requires an accepted baryogenesis transport certificate:

| Factor | Standard EWBG | PU Baryogenesis | Enhancement |
|:-------|:-------------:|:---------------:|:-----------:|
| CP source | $J_{CP} \sim 10^{-5}$ | $\tanh(\mathcal{S}\sin\delta) \approx 1$ | $\sim 10^{5}$ |
| Complexity weight | not represented by $f_{\text{PT}}$ | $e^{-\kappa_B} \sim 3 \times 10^{-9}$ on the declared branch | no nonequilibrium comparison |
| Washout survival | $f_{\text{washout}} \sim 10^{-4}$ | $f_{wash} \sim 0.6$ | $\sim 6 \times 10^{3}$ |
| Efficiency | $f_{\text{sphaleron}} \sim 10^{-2}$ | $\mathcal{C}_{eff} \sim 0.3$ | $\sim 30$ |
| **Total** | $\sim 10^{-20}$ | $\sim 6 \times 10^{-10}$ | $\sim 10^{10}$ |

**Mechanism 1: Saturated Geometric CP Violation**

The Jarlskog invariant measures flavor-path interference, while the retained PU truncation uses the bounded profile $\tanh(\mathcal S\sin\delta)$. At $\mathcal S\sin\delta=4.38$ this profile is near one, so it is a saturated CP-odd weight. It neither supplies time dependence nor proves a baryon yield without the response-active certificate of Y.6.1i--Y.6.1k. In the PU mechanism, the Berry holonomy $\delta$ enters through $\tanh(\mathcal{S}\sin\delta)$. Since $\mathcal{S}\sin\delta = 4.38 \gg 1$, the CP asymmetry *saturates* at unity rather than suffering kinematic suppression.

**Mechanism 2: Complexity-Regulated Efficiency**

In PU, the configuration-space complexity $\kappa_B$ may supply a reduced response weight, but nonequilibrium is controlled by the response-active drive, inflow, preparation, and freeze-out data of Theorems Y.6.1i--Y.6.1j and Corollary Y.6.1k. The branch value $\kappa_B=19.48$ gives $e^{-\kappa_B}\sim3\times10^{-9}$ only as a multiplicative weight; it neither establishes departure from equilibrium nor replaces a certified transport solution.

**Mechanism 3: Reduced Washout**

A reduced-washout PU branch would require an accepted $\Gamma_{\mathrm{wash}}(t)$ and freeze-out solution proving greater survival than the comparison branch. The current archive leaves that transport entry open.

## Y.10.3 The Hierarchy Unification Theorem

### Y.10.3.1 Statement of Result

**Theorem Y.11** (Conditional Algebraic Square-Root Reduction). *Assume the equal-exponent decomposition, the Appendix T determinant relation, and an accepted transport certificate fixing every prefactor. Then:*

$$\boxed{\eta_B = \mathcal{P}_{\mathrm{eff}}\sqrt{\frac{v}{M_{Pl}}}}$$

*Equivalently:*

$$\boxed{\eta_B^2 = \mathcal{P}_{\mathrm{eff}}^2\frac{v}{M_{Pl}}}$$

*Proof.* Theorem T.6 gives
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-\kappa_{EW}}.
$$
Under the determinant-model branch of Theorem T.29, Proposition T.4 supplies the central value $A_{EW}=1.08407\ldots$ and adopts the working model allowance $A_{EW}=1.084\pm0.005$; the allowance is not a theorem-level remainder bound. On the Steiner active-pair response-action branch of Definition T.13, Principle T.13a, and Theorem T.5, $\kappa_{EW}=77/2=38.5$.

From Theorem Y.8, the baryogenesis complexity is
$$
\kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon_0}{N_g}.
$$
Therefore
$$
e^{-\kappa_B}
=
e^{-\varepsilon_0/N_g} e^{-\kappa_{EW}/2}
=
e^{-\varepsilon_0/N_g} A_{EW}^{-1/2}\sqrt{\frac{v}{M_{Pl}}}.
$$

The remaining CP and washout factors are dimensionless and are collected into the prefactor
$$
\mathcal{P}_{\mathrm{eff}} := \mathcal{C}_{eff}\mathcal{F}_{CP}f_{wash}e^{-\varepsilon_0/N_g}A_{EW}^{-1/2}.
$$
Hence the full hierarchy link takes the stated prefactor-weighted square-root form. ∎

### Y.10.3.2 Numerical Verification

**Proposition Y.11.1 (Open Numerical Prefactor).** The square-root formula in Theorem Y.11 is an algebraic rearrangement after $\mathcal C_{\mathrm{eff}}$, $\mathcal F_{CP}$, $f_{\mathrm{wash}}$, the equal-exponent decomposition, and $A_{EW}$ are specified. The current archive does not independently determine the first three entries. Therefore the observational ratio
$$
\frac{\eta_B^{\mathrm{obs}}}{\sqrt{v_{\mathrm{obs}}/M_{Pl}}}
$$
is an inversion target, not a numerical verification of the prefactor.

*Proof.* Theorem Y.11 defines
$$
\mathcal P_{\mathrm{eff}}
=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}
e^{-\varepsilon_0/N_g}A_{EW}^{-1/2}.
$$
If the first three factors are not determined upstream, the observed ratio supplies one equation for their product. Substituting observation therefore selects a compatible product and cannot independently verify it. ∎

### Y.10.3.3 Origin of the Square Root

**Theorem Y.11.2** (Conditional CP Half-Step Law). *Assume that the CP involution acts freely on the relevant electroweak saddle sector, preserves the reduced measure on that sector, and splits the leading PCE complexity equally between the CP-even and CP-odd components. Then*
$$
\kappa_{CP} = \frac{\kappa_{EW}}{2},
\qquad
e^{-\kappa_{CP}} = e^{-\kappa_{EW}/2}.
$$

*Proof.*

**Step 1 (CP involution).** The CP transformation satisfies $(\mathsf{CP})^2 = 1$, so it defines a $\mathbb{Z}_2$ action on the relevant electroweak configuration sector $\mathcal{M}_{EW}$.

**Step 2 (Isotypic decomposition).** Measure preservation makes the pullback $U_{CP}$ a unitary involution on the retained $L^2$ saddle space. The orthogonal projectors
$$
P_\pm=\frac12(I\pm U_{CP})
$$
give the representation-space decomposition
$$
L^2(\mathcal M_{EW},\mu)=\mathcal H_+\oplus\mathcal H_-.
$$
Freeness means that geometric orbits have two points; it does not imply that $\mathcal M_{EW}$ is the disjoint union of two topological components.

**Step 3 (Equal leading complexity split).** By the independent equal-split hypothesis, the leading PCE complexities assigned to the two nonzero isotypic sectors satisfy
$$
\kappa(\mathcal H_+)=\kappa(\mathcal H_-)=\frac{\kappa_{EW}}2.
$$

**Step 4 (Definition of the CP contribution).** The baryogenesis CP contribution is the leading suppression exponent assigned to the nonzero CP-odd isotypic sector, so
$$
\kappa_{CP}:=\kappa(\mathcal H_-)=\frac{\kappa_{EW}}2.
$$

**Step 5 (Suppression factor).** Exponentiating the previous identity gives
$$
e^{-\kappa_{CP}} = e^{-\kappa_{EW}/2}.
$$

This is the square-root relation used in Theorem Y.8. ∎

**Theorem Y.11.2a (Finite Abelian Group-Step Exponent Template).** Let
$$
\mathfrak D_G=(\mathcal M,G,\mu,\widehat G,\kappa_{\mathcal M},\mathcal O_{\mathcal M})
$$
be a finite abelian PCE reduction datum on a retained saddle sector $\mathcal M$, where $G$ is finite abelian of order $n=|G|$, $\mu$ is the reduced PCE measure, $\widehat G$ is the character group, and
$$
\mathcal O_{\mathcal M}=A_{\mathcal M}e^{-\kappa_{\mathcal M}}(1+o(1))
$$
is the parent observable on the PCE-exponential branch. For $\chi\in\widehat G$, let
$$
P_\chi=\frac1{|G|}\sum_{g\in G}\overline{\chi(g)}U_g
$$
be the character projector whenever the action is measure-preserving.

Assume the following branch hypotheses:

1. the $G$-action is free on the retained leading saddle support, or all fixed-locus contributions are response-null;
2. the reduced PCE measure is $G$-invariant;
3. the leading saddle fiber carries the regular $G$-representation and the leading PCE complexity form is scalar on that regular fiber;
4. the character projection has nonzero leading coefficient;
5. the observable uses exponential placement rather than prefactor, variance, or normalization placement;
6. (**Equal-exponent decomposition**) the parent exponential weight factorizes additively along the $G$-orbit into $|G|$ equal PCE-exponential components,
$$
\kappa_{\mathcal M}=\sum_{g\in G}\kappa_g,
\qquad
\kappa_g=\frac{\kappa_{\mathcal M}}{|G|}\quad\text{for every }g\in G,
$$
and the retained character observable selects one such normalized component at exponential order rather than at the prefactor or normalization level.

Then every retained nonzero character component has
$$
\kappa_\chi=\frac{\kappa_{\mathcal M}}{|G|},
$$
and
$$
\mathcal O_\chi
=
A_\chi e^{-\kappa_{\mathcal M}/|G|}(1+o(1)).
$$
For $G=\mathbb Z_2$, this reduces to the CP half-step law
$$
\kappa_{CP}=\frac{\kappa_{EW}}2.
$$
The load-bearing hypotheses are the regular-isotypic equal split, the equal-exponent decomposition (hypothesis 6), the nonzero leading projection, and the exponential-placement branch. Without hypothesis 6, character projection generically changes amplitudes and prefactors while leaving the saddle exponent unchanged; the $1/|G|$ exponent step is not automatic from group theory alone. Group theory alone does not promote a physical sector.

*Proof.* Write $n=|G|$. Hypothesis 6 gives $\kappa_g=\kappa_{\mathcal M}/n$ for every orbit component and states that a retained character observable selects one such component at exponential order. Hypothesis 4 makes its leading coefficient nonzero. Hence, for each retained $\chi$,
$$
\mathcal O_\chi
=A_\chi e^{-\kappa_g}(1+o(1))
=A_\chi e^{-\kappa_{\mathcal M}/n}(1+o(1)),
$$
so $\kappa_\chi=\kappa_{\mathcal M}/n$. For $G=\mathbb Z_2$, $n=2$, which gives the final display. Notice that the projector formula alone contributes the amplitude factor $1/n$; the change of exponent is supplied entirely by hypothesis 6. ∎

**Theorem Y.11.2b (Finite Isotropic Character-Projection Template).** Let $V_{\mathrm{reg}}$ be one complex regular representation of a finite abelian group $G$ of order $n=|G|$. Let $X$ be a mean-zero $V_{\mathrm{reg}}$-valued fluctuation whose covariance operator on that fiber is
$$
C=\frac{\sigma_{\mathrm{tot}}^2}{n}I,
\qquad
\mathbb E\lVert X\rVert^2=\operatorname{tr}C=\sigma_{\mathrm{tot}}^2.
$$
Then projection onto a normalized complex character line satisfies
$$
\mathbb E\lVert P_\chi X\rVert^2=\frac{\sigma_{\mathrm{tot}}^2}{|G|},
\qquad
\lVert P_\chi X\rVert_{\mathrm{RMS}}
=
\frac{\lVert X\rVert_{\mathrm{RMS}}}{\sqrt{|G|}}.
$$
If the physical field is real, $\chi\ne\bar\chi$, and the observable retains the full orthogonal conjugate pair $V_\chi\oplus V_{\bar\chi}$, the RMS factor is
$$
\sqrt{\frac{2}{|G|}},
$$
not $|G|^{-1/2}$. For a self-conjugate character, the factor is determined by the retained real rank. Therefore a claimed $1/\sqrt{|G|}$ physical factor requires a certificate that the observable selects one normalized complex character line, one oriented real projection direction, or an equivalent response-normalized component.

This RMS projection law is distinct from Theorem Y.11.2a. It does not imply
$$
\kappa_\chi=\frac{\kappa_{\mathcal M}}{|G|},
$$
and the exponent-step law does not imply an RMS factor.

*Proof.* For any orthogonal projector $P$,
$$
\mathbb E\lVert PX\rVert^2
=\operatorname{tr}(PCP)
=\operatorname{tr}(PC).
$$
For a rank-one character projector, isotropy gives
$$
\operatorname{tr}(P_\chi C)
=\frac{\sigma_{\mathrm{tot}}^2}{n}\operatorname{tr}P_\chi
=\frac{\sigma_{\mathrm{tot}}^2}{n}.
$$
Taking square roots proves the first RMS formula. If $\chi\ne\bar\chi$, the projector onto the orthogonal conjugate pair has rank two, so the same trace is $2\sigma_{\mathrm{tot}}^2/n$ and its square root gives $\sqrt{2/n}$. A self-conjugate real sector contributes its actual real rank by the identical trace calculation. No exponential asymptotic enters this covariance computation. ∎

**Proposition Y.11.2c (Certificate-Pending Triality Route for a Majorana Projection Factor).** A triality route to a Majorana coefficient is certificate-pending unless a finite record
$$
\mathfrak C_{\mathbb Z_3\text{-Maj}}
=(\rho_3,\mathcal M_\nu,\mu_\nu,V_\nu,K_\nu,\mathcal B_\nu)
$$
verifies all of the following:

1. an order-three lift $\rho_3$ acts on the retained Majorana saddle package and stabilizes $\mathcal M_\nu$;
2. fixed loci are absent on the retained support or response-null with no leading quotient-stack correction;
3. $\mu_\nu$ is triality-invariant;
4. $V_\nu$ carries a regular isotropic $\mathbb Z_3$ fiber at leading order;
5. the physical Weinberg-overlap observable selects one normalized nontrivial character line or equivalent oriented response component, not the whole real conjugate pair;
6. the branch-placement record $\mathcal B_\nu$ proves that the RMS factor lands on the Gaussian exponent coefficient.

Only under these conditions does Theorem Y.11.2b give
$$
\alpha_\nu=\frac{\alpha_{\mathrm{UV}}}{\sqrt3}=\frac{\sqrt3}{2}
$$
when $\alpha_{\mathrm{UV}}=3/2$. The equality is not selected merely because it numerically matches a target. It is falsified if the triality lift fails, if non-null invariant points contribute, if the real observable keeps $\chi\oplus\bar\chi$, or if the projection factor lands in a prefactor, distance variable, or covariance rather than the exponent coefficient.

A global free $\mathbb Z_3$ action on all of $\mathrm{Gr}_{\mathbb C}(2,8)$ is obstructed because
$$
\chi(\mathrm{Gr}_{\mathbb C}(2,8))=\binom82=28
$$
is not divisible by $3$. Thus any free-action assertion must be restricted to the retained Majorana saddle support or accompanied by an invariant-locus response-null audit.

*Proof.* Conditions 1--5 instantiate the rank-one complex-character case of Theorem Y.11.2b with $|G|=3$, giving the RMS multiplier $1/\sqrt3$. Condition 6 places that multiplier in $\alpha_\nu$, so $\alpha_\nu=(3/2)/\sqrt3=\sqrt3/2$. For the obstruction, a free action of a finite group on a finite CW complex gives a covering $X\to X/G$ of degree $|G|$ and hence $\chi(X)=|G|\chi(X/G)$. Since $\chi(\operatorname{Gr}_{\mathbb C}(2,8))=28$ is not divisible by $3$, no free global $\mathbb Z_3$ action exists. ∎

**Corollary Y.11.3** (Certified Half-Step Origin). *On the hypotheses of Theorem Y.11.2, equivalently the finite group-step template of Theorem Y.11.2a with $G=\mathbb Z_2$, the denominator $2$ in $\kappa_{CP}=\kappa_{EW}/2$ is exact on that branch. It reflects both the order of the CP action and the equal-exponent exponential-placement certificate. It is not a consequence of group order alone.*

*Proof.* Apply Theorem Y.11.2a with $|G|=2$, parent exponent $\kappa_{\mathcal M}=\kappa_{EW}$, and the nonzero CP-odd character projection. Hypothesis 6 of that theorem gives $\kappa_{CP}=\kappa_{EW}/|G|=\kappa_{EW}/2$. Without hypothesis 6, the theorem supplies no exponent division. ∎

### Y.10.3.4 Unification of Hierarchy Problems

**Theorem Y.11.4** (Conditional Shared-Exponent Statement). *Assume the equal-exponent decomposition and generation-sharing hypotheses of Theorem Y.8, the electroweak determinant relation $v/M_{Pl}=A_{EW}e^{-\kappa_{EW}}$, and a complete baryon transport certificate whose reduced output is Theorem Y.9. Then the two model expressions share the electroweak exponent in the conditional square-root relation.*

*Proof.* The two registered expressions are
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-\kappa_{EW}}
$$
and
$$
\eta_B
=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}
e^{-\varepsilon_0/N_g}e^{-\kappa_{EW}/2}.
$$
Thus
$$
\eta_B
=\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}
e^{-\varepsilon_0/N_g}A_{EW}^{-1/2}
\sqrt{\frac{v}{M_{Pl}}}.
$$
At $\kappa_{EW}=38.5$, $\varepsilon_0=\ln2$, and $N_g=3$, the exponent and weight are
$$
\kappa_B=19.25+\frac{\ln2}{3}=19.481049\ldots,
\qquad
e^{-\kappa_B}=3.46328\ldots\times10^{-9}.
$$
The shared exponent is therefore conditional on the stated branch data, while every remaining factor is retained explicitly.

On the joint Appendix T/Y branch carrying Theorem T.5's Steiner response action, Lemma Y.8.1's nonzero midpoint readout, Lemma Y.8.2's noncancelling parallel-family saddles, and Theorem Y.11's factorization, transport, and prefactor hypotheses, the same $\kappa_{EW}$ enters both suppressions and yields the conditional square-root relation. Theorem T.5 alone does not constrain $\eta_B$. ∎

**Corollary Y.11.4a (Hierarchy Bridge Ratio).** *The prefactor $\mathcal{P}_{\mathrm{eff}}$ has two determinations, one from the adopted Appendix T/Y model branch and one from observational inversion, and their unrounded values agree at approximately the $0.65\%$ level.*

*Proof.* Theorem Y.11 gives
$$
\mathcal{P}_{\mathrm{eff}} = \mathcal{C}_{eff}\,\mathcal{F}_{CP}\,f_{wash}\,e^{-\varepsilon_0/N_g}A_{EW}^{-1/2}.
$$
On the registered binary-quotient branch of Definition 28, Definition J.1, and Theorem J.1 and the independent $N_g=3$ family-selection branch of Appendix R,
$$
e^{-\varepsilon_0/N_g} = e^{-\ln 2/3} = 2^{-1/3}.
$$
Using the branch-fixed values $\mathcal{C}_{eff} = 0.282$, $\mathcal{F}_{CP} = 0.9997$, $f_{wash} = 0.63$, and $A_{EW} = 1.084$ gives
$$
\mathcal{P}_{\mathrm{eff}}^{(\mathrm{th})}
=
0.282 \times 0.9997 \times 0.63 \times 2^{-1/3} \times 1.084^{-1/2}
=
0.1354.
$$
For comparison, with $\eta_B^{\mathrm{obs}} = 6.12 \times 10^{-10}$, $v_{\mathrm{obs}} = 246.22\,\mathrm{GeV}$, and $M_{Pl} = 1.2209 \times 10^{19}\,\mathrm{GeV}$,
$$
\mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs})}
=
\frac{\eta_B^{\mathrm{obs}}}{\sqrt{v_{\mathrm{obs}}/M_{Pl}}}
=
\frac{6.12 \times 10^{-10}}{\sqrt{246.22/(1.2209 \times 10^{19})}}
=
0.1363.
$$
Therefore
$$
\frac{\left|\mathcal{P}_{\mathrm{eff}}^{(\mathrm{th})} - \mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs})}\right|}{\mathcal{P}_{\mathrm{eff}}^{(\mathrm{obs})}}
\approx 0.0065,
$$
i.e. approximately $0.65\%$. ∎

**Remark Y.11.4a.** On the conditional shared-exponent branch, the ratio $\eta_B / \sqrt{v/M_{Pl}}$ removes the common exponential factor and isolates the branch prefactor $\mathcal{P}_{\mathrm{eff}}$. Its transport, CP-response, and washout components remain open until determined by an accepted baryogenesis certificate.

**Corollary Y.11.4b (Electroweak–Baryon Square-Root Lock).** Assume: (i) an accepted transport certificate proves the product reduction of Theorem Y.9; (ii) the CP half-step and leading-exponential factorization hypotheses of Theorem Y.8 hold; (iii) the democratic single-verification rule gives $\varepsilon_0/N_g$ with $\varepsilon_0=\ln2$ and $N_g=3$; and (iv) the Appendix T determinant branch gives $v/M_{Pl}=A_{EW}e^{-\kappa_{EW}}$. Then
$$
\boxed{
\eta_B
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}2^{-1/3}
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
}
\tag{Y.11.4b}
$$
Equivalently,
$$
\boxed{
\frac{\eta_B}
{
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}
}
=
2^{-1/3}
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
}
$$
The factor $2^{-1/3}$ is the generation-sharing factor on hypothesis (iii), and the square root is the CP half-step on hypothesis (ii).

*Proof.* Theorem Y.9 gives
$$
\eta_B
=
\mathcal C_{\mathrm{eff}}\mathcal F_{CP}f_{\mathrm{wash}}e^{-\kappa_B}.
$$
Theorem Y.8 gives
$$
\kappa_B=\frac{\kappa_{EW}}2+\frac{\varepsilon_0}{N_g}.
$$
On the minimal branch, $\varepsilon_0=\ln2$ and $N_g=3$, so
$$
e^{-\varepsilon_0/N_g}=e^{-\ln2/3}=2^{-1/3}.
$$
The electroweak branch gives
$$
\frac{v}{M_{Pl}}=A_{EW}e^{-\kappa_{EW}},
$$
hence
$$
e^{-\kappa_{EW}/2}
=
\sqrt{\frac{v}{A_{EW}M_{Pl}}}.
$$
Multiplying these two factors gives
$$
e^{-\kappa_B}
=
2^{-1/3}\sqrt{\frac{v}{A_{EW}M_{Pl}}},
$$
and substitution into the master formula proves the result. ∎

### Y.10.3.5 Experimental Consequences

**Prediction Y.1** (Constant-Prefactor Square-Root Sensitivity). *On the complete branch of Corollary Y.11.4b, consider an infinitesimal deformation for which $A_{EW}$, $M_{Pl}$, $\mathcal C_{\mathrm{eff}}$, $\mathcal F_{CP}$, and $f_{\mathrm{wash}}$ are held constant. Then, to first order,*

$$\frac{\delta\eta_B}{\eta_B} = \frac{1}{2}\frac{\delta v}{v}+o(\delta v/v).$$

*Proof.* From the leading scaling $\eta_B \propto \sqrt{v}$ at fixed prefactor regime,
$$\delta\eta_B = \frac{\partial\eta_B}{\partial v}\delta v = \frac{\eta_B}{2v}\delta v.$$

Therefore:
$$\frac{\delta\eta_B}{\eta_B} = \frac{1}{2}\frac{\delta v}{v}. $$

∎

**Corollary Y.11.5** (Constant-Prefactor Sensitivity). *Assume the complete branch hypotheses of Corollary Y.11.4b and hold $A_{EW}$, $M_{Pl}$, $\mathcal C_{\mathrm{eff}}$, $\mathcal F_{CP}$, and $f_{\mathrm{wash}}$ constant. For infinitesimal variations,*
$$
\frac{\delta\eta_B}{\eta_B}=\frac12\frac{\delta v}{v}.
$$
*Thus the constant-prefactor linearized changes corresponding to $1\%$, $10\%$, and $50\%$ changes in $v$ are $0.5\%$, $5\%$, and $25\%$, respectively. These numbers are conditional sensitivities, not observational exclusions of a BSM model whose threshold or transport entries also change.*

*Proof.* Take the logarithmic differential of (Y.11.4b) while holding every listed factor constant. A finite $50\%$ change is outside the infinitesimal regime; the quoted $25\%$ is only its linear extrapolation. ∎

### Y.10.3.6 Conceptual Significance

On the combined hypotheses of Theorems Y.11, Y.11.2, and Y.11.4, the conditional shared-exponent branch has the following implications:

1. **Conditional common exponent.** The electroweak and baryogenesis model expressions share one exponential input after the equal-exponent decomposition, determinant relation, and transport certificate are specified. This relates the two hierarchy questions on that branch but does not determine the open prefactors.

2. **Branch compatibility.** A completion of this branch must satisfy the electroweak and baryogenesis constraints simultaneously; models outside its hypotheses are not constrained by the square-root identity.

3. **CP half-step.** The factor $1/2$ follows only when the CP action is free on the retained saddle support, preserves the reduced measure, and carries an accepted equal-exponent split. The order of $\mathbb Z_2$ alone does not determine the power law.

4. **Constant-prefactor correlation.** Within the same certified baryogenesis regime, with the transport, thermal, CP-response, generation, and determinant prefactors held constant, $\delta\eta_B/\eta_B=(1/2)\delta v/v$ at leading order. A BSM deformation that changes those entries does not obey this one-variable differential relation without an additional calculation.

**Theorem Y.11.6 (Generation-Locked Baryogenesis in the Appendix Y Channel).** Work on the pre-flavor family-redundancy PPI branch of Proposition R.3.5.1a and on a certified CP-active Berry-loop branch. Within the PU electroweak baryogenesis mechanism of this appendix, the same family and CP data required for flavor CP violation enter the baryogenesis formula. In particular:

1. Theorem R.3.4 gives the minimal admissible anomaly-plus-CP family-charge pattern $\{a,-a,0\}$ with $N_{\min}=3$, while Proposition R.3.5.1a gives exact $N_g=3$ on the stated pre-flavor branch.
2. Theorem T.54 gives a nonzero base Berry phase on its minimal-area branch. The numerical value $\delta_{\mathrm{CKM}}=66.7°$ is available only on the additional nonlinear phase-response ansatz of Theorem T.56.
3. Theorem Y.2 uses the family count and nonzero CP datum only for the family/CP part of its conditional branch. Those two inputs do not by themselves realize the Sakharov conditions: the electroweak anomaly, an active baryon-number-changing transition, and a response-active nonequilibrium record remain independent required inputs.
4. On the separate hypotheses of Theorems Y.8 and Y.9, the family count and CP datum enter the reduced formula through
$$
\kappa_B=\frac{\kappa_{EW}}{2}+\frac{\varepsilon_0}{N_g},
\qquad
\mathcal F_{CP}=\tanh(\mathcal S\sin\delta)
$$
on the registered single-harmonic response branch.

Consequently, within this complete Appendix Y branch package, the flavor-topology and matter-asymmetry sectors share the stated family and CP inputs. If $N_g<3$ in the modeled CKM class or if the registered CP datum vanishes, this particular baryogenesis channel has no CP-active reduced product.

*Proof.* Theorem R.3.4 excludes a physical CKM phase for two generations and selects $\{a,-a,0\}$ as the smallest primitive orbit on the SM15 anomaly branch (primitive-minimal-norm on the SM16 branch) with a CP-active realization. Proposition R.3.5.1a supplies exact three-family realization on the declared pre-flavor branch. Theorem T.54 supplies the nonzero base Berry datum, with the $66.7°$ numerical specialization conditional on Theorem T.56. Theorem Y.2 combines those family/CP inputs with its separately required anomaly, transition, and response-active nonequilibrium records. Theorem Y.8 inserts $N_g$ through $\varepsilon_0/N_g$, and Theorem Y.9 inserts the certified CP response on its accepted factorization branch. If $N_g<3$, the modeled CKM class has no physical CP phase; if the registered CP datum is zero, the single-harmonic factor is $\tanh(0)=0$. ∎

**Corollary Y.11.6a (Three Generations Are Operational in the Appendix Y Mechanism).** In the present PU baryogenesis channel, three generations are not merely compatible with the asymmetry calculation; they are part of the mechanism's operating conditions.

*Proof.* Theorem Y.11.6 gives two failure cases. If $N_g<3$, the modeled CKM sector has no physical rephasing-invariant CP phase, so the CP-active input required by Theorem Y.2 is absent. If $\delta=0$, then the response factor is
$$
\mathcal F_{CP}=\tanh(\mathcal S\sin\delta)=\tanh(0)=0,
$$
so the Appendix Y baryogenesis channel produces no CP-odd source. The operating branch uses $N_g=3$ together with $\delta\ne0$; therefore the three-generation datum is an operating condition of this mechanism. ∎

**Remark Y.11.7a.0 (Anchor to the Global Ledger).** Definition Y.11.7a supplies the local strict PPI/PCE certificate of the baryon asymmetry row in Convention P.14.1k. Theorem Y.11.7b is the local determinacy theorem and Definition Y.11.7e refines the certificate to the finite transport-integral form. Definition Y.6.1c and Theorem Y.6.1d supply the APS-Kubo transport route. An accepted $\mathfrak C_B$, accepted $\mathfrak C_B^{\mathrm{tr}}$, or accepted $\mathfrak C_B^{\mathrm{APSK}}$ closes the row by the corresponding finite transport certificate.

**Definition Y.11.7a (Baryogenesis Transport Certificate).** A baryogenesis transport certificate is a finite record
$$
\mathfrak C_B
=
\left(
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
\mathcal G_B,
\mathcal S_{\mathrm{sph}},
\mathcal A_{\mathrm{APS}},
\mathcal P_{CP},
\mathcal K_{CP},
\mathcal W_{\mathrm{wash}},
\mathcal T_B,
\mathcal N_\gamma,
\mathcal N_{\mathrm{coeff}},
\mathcal R_B,
\mathfrak O_B,
\chi_B
\right)
\tag{Y.11.7a.1}
$$
fixed before comparison with $\eta_B$, where:

1. $\mathfrak R_{\mathrm{EW}}$ is an accepted electroweak threshold record: an accepted $\mathfrak R_{\mathrm{RHG}}$, accepted $\mathfrak C_{\mathrm{tor}}$, accepted spectral-action threshold record, or accepted equivalent satisfying Definition T.78.10.

2. $\mathfrak C_{\mathrm{fl}}^{\circ}$ is an accepted $\mathfrak C_{\mathrm{fl}}$, accepted $\mathfrak J_{\mathrm{RHG-fl}}$, or accepted flavor-independent CP certificate $\mathfrak C_{CP}^{0}$. Without $\mathfrak C_{CP}^{0}$ the source remains downstream of the flavor/CP row.

3. $\mathcal G_B$ is the finite baryon-number generator on the retained matter quotient, including global gauge form, hypercharge normalization, anomaly-bordism orientation, and response-null quotient.

4. $\mathcal S_{\mathrm{sph}}$ is the sphaleron generator and Chern-Simons transition ledger, including the Dynkin-index map and the finite convention for $\Delta N_{CS}$.

5. $\mathcal A_{\mathrm{APS}}$ is either the accepted APS-eta record $\mathfrak A_\eta$ of Definition Y.6.1a or the statement that the chosen baryogenesis branch does not use an APS source.

6. $\mathcal P_{CP}$ is the determinant-line CP phase profile, with phase origin, orientation, derivative convention, and finite interpolation record.

7. $\mathcal K_{CP}$ is the CP Kubo pairing that maps $\mathcal P_{CP}$ and $\mathcal G_B$ to a baryon-number source.

8. $\mathcal W_{\mathrm{wash}}$ is the washout and freeze-out profile, including the finite transport window and tail bound.

9. $\mathcal T_B$ is the finite transport map from source profile to final baryon-to-entropy output.

10. $\mathcal N_\gamma$ is the photon normalization and $\mathcal N_{\mathrm{coeff}}$ is the coefficient-normalization ledger for entropy, sphaleron, anomaly, and Dynkin-index conventions.

11. $\mathcal R_B$ is the certified residual interval for threshold, CP, Kubo, washout, quadrature, and normalization errors.

12. $\mathfrak O_B$ is the no-double-counting audit proving that no contribution is simultaneously assigned to the electroweak threshold row, flavor row, APS source, sphaleron generator, washout map, photon normalization, or any future residual entry.

13. $\chi_B$ records that no entry is chosen from the observed baryon asymmetry or from a downstream validation tuple.

The certificate is accepted exactly when every response-active contribution to $\eta_B$ is assigned to one named source in (Y.11.7a.1), every overlap map in $\mathfrak O_B$ commutes, and the only residual uncertainty is the interval $\mathcal R_B$.

**Theorem Y.11.7b (Certified Baryogenesis Determinacy and Branch Classification).** If $\mathfrak C_B$ is accepted, then the Appendix Y baryon asymmetry is the deterministic interval
$$
\eta_B
\in
\mathcal N_\gamma\,\mathcal T_B
\left(
\mathcal K_{CP}(\mathcal P_{CP},\mathcal G_B,\mathcal S_{\mathrm{sph}})
\right)
+
\mathcal R_B.
\tag{Y.11.7b.1}
$$
If no accepted $\mathfrak C_B$ exists, the surviving admissible baryogenesis branches are classified by the finite labels
$$
\left(
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
\mathcal G_B,
\mathcal S_{\mathrm{sph}},
\mathcal A_{\mathrm{APS}},
\mathcal P_{CP},
\mathcal K_{CP},
\mathcal W_{\mathrm{wash}},
\mathcal N_\gamma,
\mathcal N_{\mathrm{coeff}}
\right),
\tag{Y.11.7b.2}
$$
and the numerical value of $\eta_B$ is model-layer for every branch whose label is not fully certified.

*Proof.* Definition Y.11.7a fixes the threshold, CP/flavor, anomaly, sphaleron, transport, washout, photon, and coefficient-normalization entries before comparison. Therefore the finite composition in (Y.11.7b.1) is single-valued up to the certified interval $\mathcal R_B$. The overlap audit prevents assigning the same source twice or moving a source between ledgers after the fact. If any entry in (Y.11.7a.1) is absent, changing that entry while preserving all already accepted rows gives a distinct admissible finite transport branch with a different possible $\eta_B$, so Theorem P.14.1f gives non-identifiability and the classification labels (Y.11.7b.2) are irreducible branch data. ∎

**Corollary Y.11.7c (No Baryogenesis Back-Fitting).** Changing the sphaleron coefficient, washout integral, CP profile, threshold input, photon normalization, coefficient normalization, no-double-counting audit, or uncertainty interval after comparison with $\eta_B$ defines a new transport branch and cannot confirm the original Appendix Y numerical branch.

*Proof.* Each listed item is part of $\mathfrak C_B$. The forward-lock condition $\chi_B$ forbids choosing it from the target value. ∎

**Corollary Y.11.7d (Baryogenesis Numerical Dependence on Threshold and CP Certificates).** The Appendix Y baryogenesis number is theorem-level only if the electroweak threshold record, flavor/CP certificate or accepted flavor-independent CP substitute, sphaleron generator, APS/Kubo source, washout integral, photon normalization, coefficient normalization, no-double-counting audit, and uncertainty interval are all fixed in an accepted $\mathfrak C_B$. The existence of $N_g=3$ and nonzero CP capacity is not by itself a numerical baryogenesis prediction.

*Proof.* Theorem Y.11.7b states that $\eta_B$ is the deterministic image of $\mathfrak C_B$. Exact $N_g=3$ and the existence of CP-active structure determine qualitative admissibility of the channel, while the magnitude requires the finite records listed in Definition Y.11.7a. ∎

**Definition Y.11.7e (Finite Baryogenesis Transport Integral Certificate).** A finite baryogenesis transport integral certificate is a refinement of $\mathfrak C_B$:
$$
\mathfrak C_B^{\mathrm{tr}}
=
\left(
\mathfrak C_B,
[t_i,t_f],
\mathcal H_B,
Y_B(t_i),
\mathcal L_B(t),
S_{CP}(t),
W_B(t),
\mathcal U_B,
\mathcal Q_B,
\mathcal N_\gamma,
\mathcal R_B^{\mathrm{tr}},
\chi_B^{\mathrm{tr}}
\right)
\tag{Y.11.7e}
$$
where:

1. $\mathcal H_B$ is the finite retained baryon-transport state space and quotient by response-null baryon labels.

2. $[t_i,t_f]$ is the certified electroweak transport window.

3. $Y_B(t_i)$ is the fixed initial baryon vector or scalar.

4. $\mathcal L_B:[t_i,t_f]\to\operatorname{End}(\mathcal H_B)$ is strongly measurable and satisfies $\int_{t_i}^{t_f}\lVert\mathcal L_B(t)\rVert\,dt<\infty$. It includes the reversible transport part and any linear washout/freeze-out part not represented separately by $W_B(t)$.

5. $S_{CP}:[t_i,t_f]\to\mathcal H_B$ is strongly measurable and Bochner integrable and is produced by $\mathcal K_{CP}$.

6. $W_B:[t_i,t_f]\to[0,\infty)$ is a measurable washout rate with dimensions of inverse time and $W_B\in L^1([t_i,t_f])$ when the branch uses a scalar survival factor. If washout is already contained in $\mathcal L_B(t)$, then $W_B(t)=0$ and this entry is marked response-null.

7. $\mathcal U_B(t_2,t_1)$ is the unique absolutely continuous propagator satisfying $\partial_{t_2}\mathcal U_B(t_2,t_1)=\mathcal L_B(t_2)\mathcal U_B(t_2,t_1)$ almost everywhere and $\mathcal U_B(t_1,t_1)=I$.

8. $\mathcal Q_B$ is the quadrature and tail-bound ledger for all time integrals and finite Kubo sums.

9. $\mathcal N_\gamma$ is the photon-normalization convention inherited from $\mathfrak C_B$.

10. $\mathcal R_B^{\mathrm{tr}}$ is the propagated residual interval.

11. $\chi_B^{\mathrm{tr}}$ records that no transport entry is selected using the observed baryon asymmetry.

The transport solution is
$$
Y_B(t_f)
=
\mathcal U_B(t_f,t_i)Y_B(t_i)
+
\int_{t_i}^{t_f}
\mathcal U_B(t_f,t)
S_{CP}(t)
\exp\left[-\int_t^{t_f}W_B(u)\,du\right]
\,dt.
\tag{Y.11.7e.1}
$$
The propagator is
$$
\mathcal U_B(t_2,t_1)
=
\mathcal T\exp
\left(
\int_{t_1}^{t_2}\mathcal L_B(s)\,ds
\right).
\tag{Y.11.7e.2}
$$

**Theorem Y.11.7f (Certified Baryogenesis Transport Determinacy).** If $\mathfrak C_B^{\mathrm{tr}}$ is accepted, then the baryon asymmetry satisfies
$$
\eta_B
\in
\mathcal N_\gamma\,\nu_B\!\bigl(Y_B(t_f)\bigr)
+
\mathcal R_B^{\mathrm{tr}},
\tag{Y.11.7f.1}
$$
where $\nu_B$ is the finite baryon-number readout functional fixed by $\mathcal G_B$. The interval in (Y.11.7f.1) is the only theorem-level numerical output of the transport branch.

*Proof.* The finite state space, initial condition, generator, CP source, washout profile, photon normalization, and readout functional are fixed entries of $\mathfrak C_B^{\mathrm{tr}}$. Finite-dimensional nonautonomous linear transport therefore has the unique time-ordered solution (Y.11.7e.1). The quadrature and Kubo-tail ledger supplies the residual interval $\mathcal R_B^{\mathrm{tr}}$. Applying the fixed readout and photon normalization gives (Y.11.7f.1). ∎

**Corollary Y.11.7g (No Transport-Factor Replacement).** The product form
$$
0.282\cdot0.9997\cdot0.63\cdot3.463\times10^{-9}
$$
is theorem-level only if it is the evaluated reduction of an accepted $\mathfrak C_B^{\mathrm{tr}}$ or an accepted certificate explicitly proving equivalence to that transport integral. Otherwise it remains the Appendix Y transport-branch value.

*Proof.* Theorem Y.11.7f defines theorem-level transport closure through the finite generator, CP source, washout profile, quadrature ledger, and residual interval. A scalar product not derived from those entries does not instantiate the transport equation. If a factor is replaced after comparison, $\chi_B^{\mathrm{tr}}$ fails and the replacement is a new branch. ∎

**Theorem Y.11.7h (Baryogenesis Certificate Classification and Current Status).** The theorem-level baryogenesis row is accepted exactly on one finite record
$$
\mathfrak C_B,
\qquad
\mathfrak C_B^{\mathrm{tr}},
\qquad
\mathfrak C_B^{\mathrm{APSK}},
\tag{Y.11.7h.1}
$$
or on an equivalent completed spectral tuple proving equality to one of these records. Such a record must fix, before comparison, the electroweak threshold record, flavor/CP record or explicitly registered flavor-independent CP substitute, sphaleron generator, APS eta/index data when used, CP Kubo pairing, finite baryon-number generator, transport window, CP source, washout/freeze-out profile, quadrature and tail ledger, photon normalization, coefficient normalization, residual interval, overlap audit, and forward-lock entry.

On an accepted finite-transport branch the certified interval is
$$
\eta_B
\in
\mathcal N_\gamma
\left[
\nu_B\!\left(
\mathcal U_B(t_f,t_i)Y_B(t_i)
+
\int_{t_i}^{t_f}
\mathcal U_B(t_f,t)S_{CP}(t)\exp\!\left[-\int_t^{t_f}W_B(u)\,du\right]\,dt
\right)
\right]
+
\mathcal R_B^{\mathrm{tr}},
\tag{Y.11.7h.2}
$$
with $\nu_B$ the branch-fixed baryon-number readout. On an accepted APS-Kubo branch the certified interval is the interval of Theorem Y.6.1d after the same photon-normalization and overlap audit. A product formula is theorem-level only when Corollary Y.6.1e or Corollary Y.11.7g proves that it is the evaluated reduction of one of these finite intervals.

If no record in (Y.11.7h.1) is accepted, Appendix Y supplies no certified numerical yield or uncertainty interval. The legacy factor product is illustrative only. The irreducible branch coordinates are precisely the missing entries among threshold input, CP/flavor source, sphaleron normalization, APS/Kubo coefficient, finite transport generator, washout and freeze-out profile, photon normalization, quadrature/tail ledger, residual interval, and no-double-counting audit.

*Proof.* Definitions Y.6.1c, Y.11.7a, and Y.11.7e are the only Appendix Y finite baryogenesis routes. When one is accepted, the finite nonautonomous transport equation or APS-Kubo integral is single-valued up to its stated residual interval. If a listed entry is absent, two admissible completions can agree on all accepted upstream data while differing in the absent CP, transport, washout, photon, or residual datum, and hence in $\eta_B$. Theorem P.14.1f blocks theorem-level promotion in that case. The overlap audit prevents double counting with electroweak thresholds, flavor determinants, hypercharge, APS boundary terms, sphaleron negative modes, thermal finite parts, primordial determinants, vacuum determinant entries, or final spectral calibration symbols. ∎

## Y.11 Baryogenesis Derivation Chain Summary

The branch-resolved logical chain from $K_0 = 3$ to the illustrative $\eta_B$ row is:

$$\boxed{
\begin{aligned}
K_0 = 3 &\xrightarrow{\text{Thm 15}} N_{\mathrm{vis}}^{\min}=2^{K_0}=8 \xrightarrow{\text{Thm 23/Z.2}} d_0 = 8 \\[4pt]
&\xrightarrow{\text{Thm Z.1}} a = 2, \quad b = d_0 - a = 6 \\[4pt]
&\xrightarrow{\text{Thm Z.5}} M = 2ab = 24, \quad k = 12 \\[4pt]
&\xrightarrow{\substack{\text{Def T.13; Thm T.5}\\\text{Steiner active-pair action}}}
\kappa_{EW}
=\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}
=\frac{77}{2}
=38.5 \\[4pt]
&\xrightarrow{\text{Def 15a}} \varepsilon_0=\ln2 \\[4pt]
&\xrightarrow{\text{Thm R.3.4}} N_{\min}=3
\xrightarrow{\text{Prop R.3.5.1a}} N_g=3 \\[4pt]
&\xrightarrow{\text{Thm Y.8}} \kappa_B = \frac{\kappa_{EW}}{2} + \frac{\varepsilon_0}{N_g} = 19.48 \\[4pt]
&\xrightarrow{\text{Thm T.54}} \delta_0=70.53°
\xrightarrow{\text{Thm T.55}} \mathcal V_{\mathrm{sinc}}=0.9454 \\[4pt]
&\xrightarrow{\text{Thm T.56; registered nonlinear ansatz}} \delta_{\mathrm{CKM}}=66.7°
\implies \sin\delta_{\mathrm{CKM}}=0.918 \\[4pt]
&\xrightarrow{\text{Thm Y.6.1g, APSK branch}} \dot\theta_{\mathrm{PU}}=\dot\Theta_\eta+\int_{S^1}\Gamma^*\mathcal F_{\mathrm{Berry}}(\partial_t,\partial_s)\,ds \\[4pt]
&\xrightarrow{\text{Thm Y.9; accepted product reduction}} \eta_B = \mathcal{C}_{eff} \cdot \tanh(\chi_{CP}\mathcal{S}\sin\delta_{\mathrm{CKM}}) \cdot f_{wash} \cdot e^{-\kappa_B} \\[4pt]
&=0.282\times0.9997\times0.63\times e^{-19.481049060\ldots}
=6.151021447823927981\ldots\times10^{-10}
\quad\text{as an illustrative factor product}.
\end{aligned}
}$$

**Open-input status.** The displayed illustrative factor product uses undetermined transport, CP-response, washout, threshold, and normalization entries. A theorem-level numerical row requires an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ fixing the electroweak threshold record, flavor/CP record or accepted flavor-independent CP substitute, sphaleron generator, APS/Kubo source, washout and freeze-out profile, photon normalization, quadrature ledger, residual interval, overlap audit, and forward-lock entry. Before those finite entries are accepted, the displayed product is a validation-run branch value with zero retuning inside the branch, not an unconditional PU prediction.


---

## Y.12 Experimental Predictions and Tests

### Y.12.1 Precision CMB Measurements

The Planck satellite constrains $\eta_B = (6.12 \pm 0.04) \times 10^{-10}$. Future experiments will improve precision:

| Experiment | Projected $\sigma(\eta_B)/\eta_B$ | Timeline |
|:-----------|:---------------------------------:|:---------|
| Planck (current) | $0.7\%$ | Complete |
| LiteBIRD | $0.2\%$ | 2030s |

**Illustrative factor-product value:** $\eta_B^{\mathrm{illustr}}\approx6.15\times10^{-10}$. The current archive defines no theory interval and therefore no numerical falsification window for this illustrative product. A future measurement tests a baryogenesis branch numerically only after an accepted source, transport, freeze-out, washout, normalization, residual, and covariance certificate fixes its forward interval before comparison.

### Y.12.2 CKM Phase Measurements

The CP phase $\delta$ is measured at B-factories and LHCb. Current world average [Particle Data Group 2024]:
$$\delta_{\mathrm{CKM}}=65.72^\circ\pm1.49^\circ$$

**Conditional response value:** $\delta=66.7°$ on the independently registered nonlinear phase-response ansatz of Theorem T.56; the base Berry phase is $\delta_{\mathrm{flat}}=70.53°$ under Theorem T.54's branch.

Projected LHCb sensitivity of order $1^\circ$ concerns the unitarity-triangle angle $\gamma$. It constrains this branch only after a specified standard-unitary mapping from $\gamma$ to $\delta_{\mathrm{CKM}}$ and a theory covariance are fixed.

### Y.12.3 Saturation Regime Test

**Prediction Y.2** (Conditional Driven Sphaleron-Weight Saturation). *On a certified nonstationary reduction with specified source, freeze-out, and residual ledger, set $x=\mathcal S\sin\delta\ge0$. For a declared tolerance $0<\tau<1$, the bound*
$$
1-\tanh x\le\tau
$$
*holds exactly when*
$$
x\ge\operatorname{artanh}(1-\tau)
=\frac12\log\left(\frac{2-\tau}{\tau}\right).
$$
*Thus phase-insensitivity follows only on a branch whose allowed phase interval and specified $\mathcal S$ satisfy this product bound; no universal threshold $\sin\delta>0.2$ follows. The source requirement of Theorem Y.6.1i remains independent.*

*Proof.* Since $1-\tanh x=2/(e^{2x}+1)$, the inequality $1-\tanh x\le\tau$ is equivalent to $e^{2x}\ge(2-\tau)/\tau$, which gives the displayed threshold. ∎

### Y.12.4 CPT Tests

On a physical branch that independently satisfies the hypotheses of the CPT theorem—local Lorentz-covariant quantum fields, microcausality, the spin-statistics connection, and unitary dynamics—CPT invariance follows. The logical NOT involution alone does not establish those hypotheses.

**Conditional prediction:** No CPT violation on that local relativistic QFT branch. A reproducible hydrogen-antihydrogen discrepancy would falsify the conjunction of that branch, its observable mapping, and the CPT hypotheses; it would not by itself refute the abstract binary SPAP involution.

### Y.12.5 Electric Dipole Moments

CP violation beyond the CKM mechanism would manifest in electric dipole moments (EDMs). Representative current bounds are:

| System | $90\%$ CL bound | Primary source |
|:-------|:-----------------|:---------------|
| Electron | $\lvert d_e\rvert < 4.1 \times 10^{-30}$ e·cm | Roussy et al. (2023) |
| Neutron | $\lvert d_n\rvert < 1.8 \times 10^{-26}$ e·cm | Abel et al. (2020) |

**Conditional prediction:** On a branch carrying an accepted effective-action certificate that excludes every CP-odd operator beyond the Standard-Model CKM source, EDMs equal the corresponding Standard-Model predictions within the certificate's residual interval. Appendix Y does not itself supply that operator-exclusion certificate. A quantitative Standard-Model benchmark requires a specified operator calculation and uncertainty convention.

---

## Y.13 Theoretical Uncertainties

### Y.13.1 Identified Sources

No numerical uncertainty interval for $\eta_B$ is defined by the current archive. A valid uncertainty ledger must be produced by the same accepted transport certificate and must include the CP source, transport kernel, washout and freeze-out histories, electroweak thresholds, photon normalization, residual interval, covariance, and forward-lock record. The factor $c_{\mathrm{sph}}=28/79$ is an exact chemical-equilibrium conversion under the stated Standard-Model field-content assumptions, not a lattice quantity with a $3\%$ error. The illustrative values $0.282$, $0.9997$, and $0.63$ cannot be assigned a quadrature uncertainty before their joint source and covariance are supplied.

### Y.13.2 CP-Response Sensitivity Status

The CP-response sensitivity remains open until an accepted transport calculation supplies $A_{CP}(t)$ or an equivalent certified affinity. The sphaleron rate and a static phase do not determine that affinity, so no saturation table or phase-insensitivity conclusion follows from the current archive.

---

## Y.14 Conclusion

The Appendix Y branch gives the illustrative factor-product value

$$
\eta_B^{\mathrm{illustr}}
=
\mathcal{C}_{eff}\cdot\tanh(\mathcal{S}\sin\delta)\cdot f_{wash}\cdot e^{-\kappa_B}
\approx
6.15\times10^{-10},
$$

where the displayed number uses $\mathcal C_{\mathrm{eff}}=0.282$, $\tanh(\mathcal S\sin\delta)=0.9997$, $f_{\mathrm{wash}}=0.63$, and

$$
\kappa_B
=
\frac{38.5}{2}+\frac{\ln2}{3}
=
19.481049060\ldots.
$$

No theory interval is defined for this illustrative product. Theorem-level numerical status requires an accepted $\mathfrak C_B$, $\mathfrak C_B^{\mathrm{tr}}$, or $\mathfrak C_B^{\mathrm{APSK}}$ that fixes the forward value, residual interval, and covariance before comparison.

The derivation reveals that:
- **CP violation** is geometric transport data. On an accepted APS-Kubo branch, $\dot\theta_{\mathrm{PU}}$ is the APS boundary-phase derivative plus Berry-curvature flux around the retained flavor loop. Transport weighting produces the surface term in (Y.6.1g.1). The approximation $\tanh(\mathcal S\sin\delta)\approx1$ belongs only to the separately certified saturated product branch.
- **Complexity weight** is controlled by the branch value $\kappa_B=19.48$; transport efficiency, CP response, and washout remain separate certificate entries.
- **Matter dominance** is determined only by a complete retained signed transport certificate, including its source, oriented kernel, topological transition, and readout convention; the initial-condition record alone does not determine the sign.

The framework provides a structurally constrained branch explanation for the sign and scale of the matter excess. The exact numerical row is the finite transport image of an accepted baryogenesis certificate, with the conditional transport coefficient and washout survival defined in Sections Y.7.2--Y.7.3 and the finite certificate routes specified by Definition Y.11.7a, Definition Y.11.7e, and Definition Y.6.1c.

---

## Y.A: Self-Contained Derivations of Key Inputs

### Y.A.1 Conditional Evaluation of $\kappa_{EW}=38.5$

**Sources:** Theorem T.5; Definition T.13 (Appendix T)

Let $B$ be the octad-by-pair incidence matrix and $p_A$ the registered active pair of Definition T.13. Theorem T.5 gives
$$
e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}
=\lambda_2(S(5,8,24))
=77.
$$
The fixed-time quadratic response action therefore has the unique minimizer $x_*(t)=te_{p_A}$ and
$$
\kappa_{EW}
=\frac12e_{p_A}^{\mathsf T}B^{\mathsf T}Be_{p_A}
=\frac{77}{2}
=38.5.
$$
Principle T.13a is the explicit action-to-suppression premise. Gaussian determinants and zero-mode volumes belong to the prefactor rather than to this exponent.
∎

### Y.A.2 Derivation of $\delta = 66.7°$

**Sources:** Theorems T.54--T.56 (Appendix T)

The base Berry phase, uniform-noise visibility, and nonlinear phase response are distinct branch statements.

**Step 1:** On the minimal Berry-area branch of Theorem T.54, the $E_8$ triads for the quark sectors are:
- Down: $(d^2_{32}, d^2_{31}) = (2, 4)$
- Up: $(d^2_{32}, d^2_{31}) = (4, 8)$

**Step 2:** The mismatch angle at the 3↔2 interface is
$$\theta_{mismatch} = \arctan\left(\frac{\sqrt{2}}{2}\right) = 35.26°.$$

**Step 3:** The base holonomy around the flavor quadrilateral is
$$\delta_0 = 2\theta_{mismatch} = 70.53°.$$

**Step 4:** Theorem T.55 gives the finite-wavepacket visibility
$$f_{sinc} = \text{sinc}(1/\sqrt{3}) = \frac{\sin(1/\sqrt{3})}{1/\sqrt{3}} = 0.9454,$$
while the averaged complex amplitude retains phase $\delta_0$.

**Step 5:** On the independently registered nonlinear phase-response ansatz of Theorem T.56,
$$\delta_{\mathrm{CKM}}:=\delta_0 f_{sinc}=70.53°\times0.9454=66.7°.$$

**Result:** $\delta_{\mathrm{CKM}}=66.7°$ on the Theorem T.56 nonlinear-response branch. ∎

### Y.A.3 Derivation of $N_g = 3$

**Sources:** Theorem R.3.4, Proposition R.3.5.1a, and Theorem R.8.5b (Appendix R)

The minimal admissible count and exact branch realization are separate statements.

**Constraint 1 (Anomaly cancellation):** On the family-redundancy branch, family charges $\{F_g\}$ satisfy
$$\sum_g F_g = 0, \quad \sum_g F_g^3 = 0.$$

**Constraint 2 (CP activity):** The Jarlskog invariant requires
$$J_{CP} = c_{12}s_{12}c_{23}s_{23}c_{13}^2s_{13}\sin\delta \neq 0.$$

For two generations every CKM phase is removable. Theorem R.3.4 therefore gives the minimal admissible anomaly-descending CP-capable pattern $\{a,-a,0\}$ and the minimal count $N_{\min}=3$; it does not exclude larger anomaly-free patterns.

**Branch realization:** Proposition R.3.5.1a removes response-null supernumerary family copies on the pre-flavor family-redundancy PPI branch and gives
$$N_g=3.$$
Theorem R.8.5b supplies the separate PCE minimal-selection audit within its declared integer family-charge class.

**Result:** $N_{\min}=3$ in the anomaly-plus-CP class, and exact $N_g=3$ on the pre-flavor family-redundancy PPI branch. ∎

---