# Retrospective SPARC rotation-curve comparison tables

These tables belong to [Remarks I.5j and I.13c.8b](../../../appendices/appendix_i_scaled_gravity.md). The owning remarks define the laws, state the conclusions and bind them to their branches. Every comparison below is retrospective: the SPARC tables and the empirical radial acceleration relation were published in 2016 and had been inspected before the comparisons were specified, and the three full-field galaxies belong to the SPARC sample. No entry is a forward-locked test, and no parameter of a PU law was adjusted to these data except in the fits labelled as after-the-fact fits.

<a id="inputs"></a>
## Inputs and sample

| Item | Value |
| --- | --- |
| Data | SPARC mass models and galaxy table [Lelli et al. 2016]: `MassModels_Lelli2016c.mrt` (SHA-256 `9108994b12cc401b94a1768beca61c53ec354779385c9c9cc571049f3043244c`) and `SPARC_Lelli2016c.mrt` (SHA-256 `5aa0501f6b0d881fa579030e315e7b5b6ef561a5bd3a07472f9929c7e5728243`) |
| Table sizes | 175 galaxies; 3391 radii; 361 radii with negative $V_{\mathrm{gas}}$; no negative $V_{\mathrm{disk}}$ or $V_{\mathrm{bul}}$ |
| Sample | quality flag $Q\le2$, inclination $i\ge30^\circ$, $V_{\mathrm{obs}}>0$, $R>0$, $e_V\le0.1\,V_{\mathrm{obs}}$, $V_{\mathrm{bar}}^2>0$: 2700 radii in 149 galaxies |
| Baryons | $V_{\mathrm{bar}}^2=V_{\mathrm{gas}}\lvert V_{\mathrm{gas}}\rvert+\Upsilon_{\mathrm d}V_{\mathrm{disk}}^2+\Upsilon_{\mathrm b}V_{\mathrm{bul}}^2$ with $\Upsilon_{\mathrm d}=0.5$, $\Upsilon_{\mathrm b}=0.7$ at $3.6\,\mu\mathrm m$ for every galaxy (the values of [McGaugh et al. 2016]); $V_{\mathrm{gas}}$ includes helium as tabulated |
| Accelerations | $g_{\mathrm{obs}}=V_{\mathrm{obs}}^2/R$, $g_{\mathrm{bar}}=V_{\mathrm{bar}}^2/R$, $1\,\mathrm{kpc}=3.085677581491367\times10^{19}\,\mathrm m$ |
| Scale $g_\Lambda$ | $\Lambda=3H_0^2\Omega_\Lambda/c^2=1.09712\times10^{-52}\,\mathrm{m^{-2}}$ from $H_0=67.4\,\mathrm{km\,s^{-1}\,Mpc^{-1}}$ and $\Omega_\Lambda=0.6889$ (Equations (V.4)–(V.5), rounded Planck 2018 marginals [Planck Collaboration 2020a]); $g_\Lambda=c^2\sqrt\Lambda/8=1.17674\times10^{-10}\,\mathrm{m\,s^{-2}}$, the central value of (H.6d) |
| Comparator | empirical radial acceleration relation $g=g_{\mathrm{bar}}/(1-e^{-\sqrt{g_{\mathrm{bar}}/g_\dagger}})$ with $g_\dagger=1.20\times10^{-10}\,\mathrm{m\,s^{-2}}$ [McGaugh et al. 2016] |

<a id="laws"></a>
## Laws and metrics

Each law is applied pointwise to $g_{\mathrm{bar}}$, as the empirical relation is. For the spatial-clock laws this is the spherical law (I.13c.5.5), and for the elastic law the spherical field of Theorem I.5e; Theorem I.5g states exactly when such an algebraic relation is the field of a nonspherical source, and Remark I.13c.8a quantifies the departure of the spatial-clock action force from the spherical law on a flattened source. The [full-field summary](#full-field) uses the action solutions.

| Label | Law | Status of its parameters |
| --- | --- | --- |
| Benchmark | $g=g_{\mathrm{bar}}\bigl[1+7\bigl(1-e^{-(g_\Lambda/g_{\mathrm{bar}})^{3/2}}\bigr)\bigr]$: (I.13c.5.5) with $(A_G,n,\beta_\chi)=(7,3/2,1)$ | $A_G=7$ Definition I.13a benchmark; $n=3/2$ power clock of Remark K.9.5i; $\beta_\chi=1$ convention |
| $A_G=1$ | the same with $A_G=1$ | amplitude selected by Theorem I.13c.10 on the source of Construction I.13c.9; $\beta_\chi=1$ convention |
| Elastic | $g=g_{\mathrm{bar}}/(1-e^{-\sqrt{g_{\mathrm{bar}}/g_\Lambda}})$: (I.5j.1), the action of Proposition I.5f with $a=g_\Lambda$ | scale $g_\Lambda$ from Corollary I.3a; shape imported by Definition I.5c |
| RAR | the same function with $g_\dagger$ | empirical comparator |
| Newton | $g=g_{\mathrm{bar}}$ | reference |

Residual $r=\log_{10}(g_{\mathrm{pred}}/g_{\mathrm{obs}})$ at each radius. "Median ratio" is the median of $g_{\mathrm{pred}}/g_{\mathrm{obs}}$; "rms" is $\sqrt{\langle r^2\rangle}$ in dex; "vs RAR" compares the rms of a galaxy with the rms of the RAR on the same galaxy.

<a id="summary"></a>
## Summary on the sample

| Law | Radii | Galaxies | Median ratio | Median $r$ (dex) | rms (dex) | Radii overpredicted | Velocity rms ($\mathrm{km\,s^{-1}}$) | Galaxies worse / better than RAR |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Benchmark | 2700 | 149 | 2.200 | +0.3424 | 0.4032 | 94.4% | 110.62 | 135 / 14 |
| $A_G=1$ | 2700 | 149 | 0.706 | -0.1512 | 0.2919 | 20.9% | 36.80 | 122 / 27 |
| $A_G=3$, $\beta_\chi=1$ | 2700 | 149 | 1.202 | +0.0800 | 0.2185 | 67.2% | 44.34 | 115 / 34 |
| Elastic | 2700 | 149 | 1.000 | -0.0002 | 0.1327 | 50.0% | 22.90 | 63 / 86 |
| RAR | 2700 | 149 | 1.006 | +0.0024 | 0.1328 | 51.0% | 22.85 | reference |
| Newton | 2700 | 149 | 0.368 | -0.4339 | 0.5145 | 4.6% | 63.34 | 146 / 3 |

Nominal enhancements: 117 radii in 23 galaxies have $g_{\mathrm{obs}}/g_{\mathrm{bar}}>8=1+A_G$ of the benchmark, and 6 radii in 3 galaxies exceed $1+A_{\mathrm{crit}}(3/2)=14.3695$, the largest spherical enhancement of any admitted amplitude (Theorem I.13c.5, item 1). The RAR exceeds the benchmark cap for $g_{\mathrm{bar}}<g_\dagger\ln^2(8/7)=2.140\times10^{-12}\,\mathrm{m\,s^{-2}}$.

<a id="robustness"></a>
## Mass-to-light, sample and input variations

One common pair $(\Upsilon_{\mathrm d},\Upsilon_{\mathrm b})$ for all galaxies; same cuts. Every pair keeps 2700 radii in 149 galaxies.

| $\Upsilon_{\mathrm d}$ | $\Upsilon_{\mathrm b}$ | RAR rms | Benchmark rms | Benchmark median ratio | Benchmark worse | $A_G=1$ rms | $A_G=1$ worse | Elastic rms | Elastic worse / better |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 0.3 | 0.5 | 0.1753 | 0.3013 | 1.662 | 115 | 0.3922 | 140 | 0.1769 | 109 / 40 |
| 0.3 | 0.7 | 0.1639 | 0.3126 | 1.720 | 116 | 0.3826 | 138 | 0.1654 | 107 / 42 |
| 0.3 | 1.0 | 0.1617 | 0.3289 | 1.776 | 120 | 0.3764 | 135 | 0.1629 | 103 / 46 |
| 0.5 | 0.5 | 0.1379 | 0.3953 | 2.163 | 134 | 0.2977 | 123 | 0.1380 | 66 / 83 |
| 0.5 | 0.7 | 0.1328 | 0.4032 | 2.200 | 135 | 0.2919 | 122 | 0.1327 | 63 / 86 |
| 0.5 | 1.0 | 0.1389 | 0.4150 | 2.274 | 135 | 0.2908 | 120 | 0.1386 | 59 / 90 |
| 0.8 | 0.5 | 0.1600 | 0.4926 | 2.807 | 142 | 0.2388 | 91 | 0.1586 | 29 / 120 |
| 0.8 | 0.7 | 0.1618 | 0.4981 | 2.852 | 142 | 0.2377 | 90 | 0.1602 | 28 / 121 |
| 0.8 | 1.0 | 0.1725 | 0.5068 | 2.910 | 142 | 0.2425 | 88 | 0.1709 | 26 / 123 |

| Sample | Radii | Galaxies | RAR rms | Benchmark rms / worse | $A_G=1$ rms / worse | Elastic rms / worse |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| all valid radii, no quality, inclination or error cut | 3389 | 175 | 0.1989 | 0.4341 / 158 | 0.3183 / 130 | 0.1983 / 64 |
| primary cuts with $i\ge45^\circ$ | 2369 | 126 | 0.1346 | 0.4105 / 117 | 0.2955 / 102 | 0.1344 / 52 |

Input $\Lambda$: replacing $\Omega_\Lambda=0.6889$ by $1-0.315=0.685$ (flat, $\Omega_{\mathrm m}=0.315$ [Planck Collaboration 2020a]) gives $g_\Lambda=1.1734\times10^{-10}\,\mathrm{m\,s^{-2}}$; the benchmark rms changes from 0.4032 to 0.4029 dex and the elastic rms from 0.13267 to 0.13266 dex.

<a id="fits"></a>
## After-the-fact fits

These parameters were fitted to the sample by minimizing the pooled rms of $r$. They are diagnostics of the shape of each law; no PU statement supplies them.

| Law fitted | Fitted values | rms (dex) | Median ratio | Galaxies worse / better than RAR |
| --- | --- | ---: | ---: | ---: |
| $A_G=7$, $n=3/2$, free $\beta_\chi$ | $\beta_\chi=0.0752$ | 0.1768 | 0.936 | 113 / 36 |
| $A_G=3$, $n=3/2$, free $\beta_\chi$ | $\beta_\chi=0.2605$ | 0.1633 | 0.933 | 101 / 48 |
| $A_G=1$, $n=3/2$, free $\beta_\chi$ | $\beta_\chi=1.0676$ | 0.2918 | 0.709 | 123 / 26 |
| $n=3/2$, free $A_G\le A_{\mathrm{crit}}(3/2)$ and $\beta_\chi$ | $A_G=3.937$, $\beta_\chi=0.1776$ | 0.1558 | 0.953 | 100 / 49 |
| RAR shape, free scale | $g_0=1.1603\times10^{-10}\,\mathrm{m\,s^{-2}}=0.9861\,g_\Lambda$ | 0.1327 | — | 65 / 84 |

Rate modulus at which the $A_G=7$, $n=3/2$ spherical law equals the RAR at a given $g_{\mathrm{bar}}$:

| $\log_{10}(g_{\mathrm{bar}}/\mathrm{m\,s^{-2}})$ | $-12$ | $-11.5$ | $-11$ | $-10.5$ | $-10$ | $-9.5$ | $-9$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| $\beta_\chi$ | none (RAR above cap) | 0.0377 | 0.0575 | 0.1036 | 0.1839 | 0.2915 | 0.3531 |

<a id="full-field"></a>
## Full-field summary

The full-field rows use axisymmetric finite-element solutions of the field equations for three-dimensional baryonic sources: the Euler–Lagrange equation of (I.13c.5.4) for the spatial-clock laws (Theorem I.13c.7) and the field equation of Theorem I.5e with the Proposition I.5f action for the elastic law. Stellar sources come from SPARC $3.6\,\mu\mathrm m$ surface photometry with $\Upsilon_\ast=0.5$ and an exponential vertical profile; gas sources from 21-cm moment-zero maps of THINGS (Walter et al. 2008, *AJ* 136, 2563) (thin sheet, helium factor 1.33); geometry is the published kinematic geometry. For NGC 2403 the "catalog" source rescales the reconstructed stellar light by 1.26862516 and the gas by 1.32956039 to the SPARC catalog totals, that is, the reconstruction lies 21.2% (light) and 24.8% (HI) below them. The DDO 154 and NGC 3198 sources were frozen before their rotation curves were opened. The algebraic column applies (I.5j.1) to the Newtonian midplane field of the same source; it uses $g_\Lambda$, not $g_\dagger$.

Root-mean-square rotation-speed residuals ($\mathrm{km\,s^{-1}}$) against the SPARC speeds:

| Galaxy and source | Radii | Benchmark | $A_G=1$, $\beta_\chi=1$ | Elastic action | Algebraic (I.5j.1) | Newtonian baryons | Benchmark over / under |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| NGC 2403, reconstructed | 73 | 48.54 | 40.50 | 16.94 | 15.18 | 58.93 | 66 / 7 |
| NGC 2403, catalog-normalized | 73 | 60.83 | 33.15 | 9.89 | 8.50 | 52.45 | 71 / 2 |
| DDO 154 | 12 | 8.56 | — | 3.79 | 5.11 | 23.07 | 12 / 0 |
| NGC 3198 | 43 | 86.70 | — | 11.17 | 10.86 | 55.82 | 43 / 0 |

NGC 2403 details. Elastic action: underpredicts all 73 speeds for both sources. $A_G=1$: underpredicts 73 (reconstructed) and 68 (catalog) of 73 speeds. Benchmark over the 17 one-at-a-time source variations of the computational package (mass-to-light, gas scale, distance, inclination, scale heights, stellar tail, catalog normalizations): rms 26.7–70.0 $\mathrm{km\,s^{-1}}$, larger than the algebraic comparator in 17 of 17. After-the-fact rate-modulus fits at $A_G=7$: $\beta_\chi=0.171$ (reconstructed) and $0.109$ (catalog) give 13.36 and 15.63 $\mathrm{km\,s^{-1}}$.

Numerical controls. NGC 2403 benchmark: six solver variants per source (grid $N=192,256,384$; outer boundary at 25, 40 and 60 kpc; boundary multipoles on or off) change the predicted speeds by at most 0.78 (reconstructed) and 0.91 (catalog) $\mathrm{km\,s^{-1}}$ and the rms by at most 0.006 $\mathrm{km\,s^{-1}}$. The $A_G=1$ entries come from coarser runs ($N=128$, boundary at 40 kpc), which reproduce the benchmark rms within 0.011 $\mathrm{km\,s^{-1}}$. Elastic DDO 154 and NGC 3198: grids $N=192,256,384$ and a doubled domain spread the rms by 0.002 and 0.008 $\mathrm{km\,s^{-1}}$.

Provenance and limits. The rms values above are recomputed from the stored predicted and observed curves; the observed speeds equal the SPARC values. The source reconstructions and field solutions are the stored outputs of the computational packages and were not recomputed here; their numerical sensitivity is the one listed under the numerical controls. The packages record gas-source discrepancies against the SPARC gas components of 34–38% (NGC 2403, fractional rms), 10.0% (DDO 154) and 188% (NGC 3198, dominated by small inner gas speeds; 5.22 $\mathrm{km\,s^{-1}}$); these figures are quoted, not recomputed. No covariance for distance, inclination, photometry or gas is propagated.

<a id="per-galaxy-benchmark"></a>
## Per-galaxy values: benchmark $(A_G,n,\beta_\chi)=(7,3/2,1)$

| Galaxy | Radii | Median ratio | rms (dex) | vs RAR |
| --- | ---: | ---: | ---: | --- |
| CamB | 2 | 4.290 | 0.628 | worse |
| D512-2 | 1 | 1.879 | 0.274 | worse |
| D564-8 | 5 | 1.424 | 0.204 | better |
| D631-7 | 14 | 1.643 | 0.384 | worse |
| DDO064 | 3 | 2.111 | 0.318 | worse |
| DDO154 | 11 | 1.380 | 0.194 | worse |
| DDO161 | 26 | 2.511 | 0.471 | worse |
| DDO168 | 9 | 1.937 | 0.456 | worse |
| DDO170 | 7 | 1.879 | 0.281 | worse |
| ESO079-G014 | 12 | 2.617 | 0.455 | worse |
| ESO116-G012 | 14 | 2.030 | 0.357 | worse |
| ESO444-G084 | 6 | 1.312 | 0.133 | better |
| ESO563-G021 | 28 | 2.426 | 0.429 | worse |
| F565-V2 | 3 | 1.054 | 0.021 | better |
| F568-3 | 9 | 1.570 | 0.241 | worse |
| F568-V1 | 4 | 0.765 | 0.117 | better |
| F571-8 | 11 | 2.433 | 0.564 | worse |
| F571-V1 | 5 | 1.569 | 0.188 | worse |
| F574-1 | 12 | 1.353 | 0.165 | worse |
| F583-1 | 10 | 0.781 | 0.149 | better |
| F583-4 | 8 | 1.817 | 0.264 | worse |
| IC2574 | 22 | 2.000 | 0.319 | worse |
| IC4202 | 31 | 3.520 | 0.532 | worse |
| KK98-251 | 8 | 2.919 | 0.485 | worse |
| NGC0024 | 20 | 1.924 | 0.263 | worse |
| NGC0055 | 20 | 2.774 | 0.497 | worse |
| NGC0100 | 16 | 2.125 | 0.363 | worse |
| NGC0247 | 26 | 2.040 | 0.284 | worse |
| NGC0289 | 22 | 2.115 | 0.376 | worse |
| NGC0300 | 16 | 1.679 | 0.259 | worse |
| NGC0801 | 13 | 3.065 | 0.483 | worse |
| NGC0891 | 18 | 3.646 | 0.522 | worse |
| NGC1003 | 35 | 1.507 | 0.312 | worse |
| NGC1090 | 22 | 3.463 | 0.535 | worse |
| NGC2403 | 72 | 2.983 | 0.449 | worse |
| NGC2683 | 11 | 2.726 | 0.438 | worse |
| NGC2841 | 50 | 1.674 | 0.237 | worse |
| NGC2903 | 32 | 2.354 | 0.404 | worse |
| NGC2915 | 21 | 0.620 | 0.205 | better |
| NGC2955 | 24 | 3.091 | 0.464 | worse |
| NGC2976 | 21 | 4.287 | 0.639 | worse |
| NGC2998 | 10 | 2.821 | 0.456 | worse |
| NGC3109 | 21 | 1.000 | 0.098 | worse |
| NGC3198 | 37 | 3.035 | 0.460 | worse |
| NGC3521 | 34 | 1.878 | 0.300 | worse |
| NGC3726 | 12 | 4.770 | 0.619 | worse |
| NGC3741 | 19 | 0.789 | 0.155 | worse |
| NGC3769 | 10 | 2.763 | 0.468 | worse |
| NGC3877 | 11 | 4.467 | 0.624 | worse |
| NGC3893 | 10 | 2.807 | 0.460 | worse |
| NGC3917 | 16 | 2.737 | 0.432 | worse |
| NGC3949 | 6 | 3.465 | 0.521 | worse |
| NGC3953 | 8 | 3.613 | 0.539 | worse |
| NGC3972 | 9 | 2.820 | 0.451 | worse |
| NGC3992 | 9 | 2.727 | 0.423 | worse |
| NGC4010 | 9 | 2.978 | 0.543 | worse |
| NGC4013 | 36 | 3.192 | 0.495 | worse |
| NGC4051 | 6 | 4.992 | 0.696 | worse |
| NGC4068 | 2 | 3.660 | 0.563 | worse |
| NGC4085 | 6 | 4.527 | 0.669 | worse |
| NGC4088 | 11 | 5.175 | 0.698 | worse |
| NGC4100 | 24 | 2.817 | 0.461 | worse |
| NGC4138 | 4 | 3.000 | 0.455 | worse |
| NGC4157 | 16 | 3.477 | 0.559 | worse |
| NGC4183 | 20 | 2.374 | 0.367 | worse |
| NGC4217 | 18 | 4.519 | 0.639 | worse |
| NGC4559 | 29 | 3.071 | 0.544 | worse |
| NGC5005 | 17 | 1.811 | 0.317 | worse |
| NGC5033 | 22 | 2.282 | 0.380 | worse |
| NGC5055 | 27 | 2.972 | 0.482 | worse |
| NGC5371 | 19 | 4.124 | 0.601 | worse |
| NGC5585 | 23 | 2.650 | 0.545 | worse |
| NGC5907 | 19 | 2.877 | 0.460 | worse |
| NGC5985 | 33 | 2.076 | 0.311 | worse |
| NGC6015 | 44 | 2.530 | 0.407 | worse |
| NGC6195 | 23 | 3.995 | 0.562 | worse |
| NGC6503 | 30 | 1.788 | 0.340 | worse |
| NGC6674 | 14 | 2.035 | 0.315 | worse |
| NGC6789 | 1 | 1.215 | 0.085 | better |
| NGC6946 | 54 | 3.704 | 0.553 | worse |
| NGC7331 | 36 | 3.350 | 0.524 | worse |
| NGC7793 | 26 | 3.869 | 0.568 | worse |
| NGC7814 | 18 | 2.445 | 0.378 | worse |
| UGC00128 | 21 | 1.204 | 0.100 | worse |
| UGC00191 | 8 | 1.975 | 0.316 | worse |
| UGC00634 | 4 | 1.533 | 0.218 | worse |
| UGC00731 | 12 | 0.988 | 0.291 | worse |
| UGC00891 | 4 | 1.673 | 0.240 | worse |
| UGC01281 | 6 | 1.383 | 0.141 | worse |
| UGC02259 | 8 | 1.328 | 0.125 | better |
| UGC02487 | 17 | 1.765 | 0.272 | worse |
| UGC02885 | 19 | 2.340 | 0.405 | worse |
| UGC02916 | 41 | 3.428 | 0.495 | worse |
| UGC02953 | 113 | 1.511 | 0.243 | worse |
| UGC03205 | 46 | 2.562 | 0.406 | worse |
| UGC03546 | 22 | 3.074 | 0.458 | worse |
| UGC03580 | 39 | 5.329 | 0.644 | worse |
| UGC04278 | 15 | 1.570 | 0.195 | worse |
| UGC04325 | 8 | 1.665 | 0.196 | better |
| UGC04483 | 6 | 2.501 | 0.409 | worse |
| UGC04499 | 8 | 2.297 | 0.371 | worse |
| UGC05005 | 1 | 1.451 | 0.162 | worse |
| UGC05253 | 72 | 1.845 | 0.302 | worse |
| UGC05414 | 5 | 2.883 | 0.465 | worse |
| UGC05716 | 11 | 1.297 | 0.131 | worse |
| UGC05721 | 20 | 1.066 | 0.210 | better |
| UGC05750 | 2 | 1.787 | 0.253 | worse |
| UGC05764 | 10 | 1.061 | 0.176 | better |
| UGC05829 | 5 | 2.382 | 0.367 | worse |
| UGC05918 | 4 | 1.448 | 0.165 | worse |
| UGC05986 | 15 | 1.900 | 0.319 | worse |
| UGC06399 | 7 | 1.672 | 0.223 | worse |
| UGC06446 | 14 | 1.314 | 0.142 | worse |
| UGC06614 | 10 | 3.862 | 0.576 | worse |
| UGC06667 | 8 | 0.771 | 0.272 | better |
| UGC06786 | 41 | 2.182 | 0.329 | worse |
| UGC06787 | 68 | 1.873 | 0.303 | worse |
| UGC06818 | 5 | 1.838 | 0.324 | worse |
| UGC06917 | 11 | 2.058 | 0.354 | worse |
| UGC06923 | 4 | 2.848 | 0.461 | worse |
| UGC06930 | 9 | 2.293 | 0.352 | worse |
| UGC06983 | 15 | 1.697 | 0.237 | worse |
| UGC07089 | 9 | 2.932 | 0.486 | worse |
| UGC07125 | 12 | 3.338 | 0.511 | worse |
| UGC07151 | 11 | 2.651 | 0.448 | worse |
| UGC07232 | 2 | 2.347 | 0.372 | worse |
| UGC07261 | 6 | 2.174 | 0.345 | worse |
| UGC07323 | 8 | 3.113 | 0.516 | worse |
| UGC07399 | 10 | 0.966 | 0.104 | better |
| UGC07524 | 27 | 1.618 | 0.251 | worse |
| UGC07603 | 11 | 1.516 | 0.243 | worse |
| UGC07690 | 7 | 2.785 | 0.467 | worse |
| UGC08286 | 16 | 1.296 | 0.114 | better |
| UGC08490 | 30 | 1.290 | 0.186 | worse |
| UGC08550 | 11 | 1.469 | 0.182 | worse |
| UGC08699 | 38 | 3.218 | 0.419 | worse |
| UGC08837 | 6 | 3.462 | 0.545 | worse |
| UGC09037 | 20 | 4.945 | 0.717 | worse |
| UGC09133 | 67 | 1.905 | 0.338 | worse |
| UGC10310 | 6 | 2.098 | 0.325 | worse |
| UGC11455 | 35 | 3.384 | 0.554 | worse |
| UGC11557 | 4 | 5.655 | 0.750 | worse |
| UGC11820 | 5 | 1.740 | 0.241 | worse |
| UGC11914 | 61 | 1.254 | 0.160 | worse |
| UGC12506 | 28 | 1.987 | 0.305 | worse |
| UGC12632 | 13 | 1.431 | 0.198 | worse |
| UGC12732 | 16 | 1.314 | 0.155 | worse |
| UGCA442 | 7 | 1.597 | 0.240 | worse |
| UGCA444 | 1 | 2.602 | 0.415 | worse |

<a id="per-galaxy-a1"></a>
## Per-galaxy values: $A_G=1$, $n=3/2$, $\beta_\chi=1$

| Galaxy | Radii | Median ratio | rms (dex) | vs RAR |
| --- | ---: | ---: | ---: | --- |
| CamB | 2 | 1.072 | 0.119 | better |
| D512-2 | 1 | 0.470 | 0.328 | worse |
| D564-8 | 5 | 0.356 | 0.459 | worse |
| D631-7 | 14 | 0.411 | 0.444 | worse |
| DDO064 | 3 | 0.528 | 0.286 | worse |
| DDO154 | 11 | 0.345 | 0.470 | worse |
| DDO161 | 26 | 0.628 | 0.220 | better |
| DDO168 | 9 | 0.484 | 0.266 | worse |
| DDO170 | 7 | 0.470 | 0.328 | worse |
| ESO079-G014 | 12 | 0.654 | 0.192 | worse |
| ESO116-G012 | 14 | 0.508 | 0.303 | worse |
| ESO444-G084 | 6 | 0.328 | 0.537 | worse |
| ESO563-G021 | 28 | 0.675 | 0.222 | worse |
| F565-V2 | 3 | 0.263 | 0.586 | worse |
| F568-3 | 9 | 0.393 | 0.399 | worse |
| F568-V1 | 4 | 0.191 | 0.718 | worse |
| F571-8 | 11 | 0.608 | 0.434 | worse |
| F571-V1 | 5 | 0.392 | 0.417 | worse |
| F574-1 | 12 | 0.338 | 0.453 | worse |
| F583-1 | 10 | 0.195 | 0.659 | worse |
| F583-4 | 8 | 0.454 | 0.344 | worse |
| IC2574 | 22 | 0.500 | 0.298 | worse |
| IC4202 | 31 | 0.928 | 0.139 | worse |
| KK98-251 | 8 | 0.730 | 0.131 | better |
| NGC0024 | 20 | 0.482 | 0.381 | worse |
| NGC0055 | 20 | 0.694 | 0.151 | better |
| NGC0100 | 16 | 0.531 | 0.312 | worse |
| NGC0247 | 26 | 0.510 | 0.326 | worse |
| NGC0289 | 22 | 0.529 | 0.270 | worse |
| NGC0300 | 16 | 0.420 | 0.383 | worse |
| NGC0801 | 13 | 1.013 | 0.092 | better |
| NGC0891 | 18 | 1.123 | 0.101 | better |
| NGC1003 | 35 | 0.377 | 0.454 | worse |
| NGC1090 | 22 | 0.891 | 0.113 | worse |
| NGC2403 | 72 | 0.816 | 0.254 | worse |
| NGC2683 | 11 | 0.754 | 0.179 | worse |
| NGC2841 | 50 | 0.607 | 0.315 | worse |
| NGC2903 | 32 | 0.921 | 0.141 | worse |
| NGC2915 | 21 | 0.155 | 0.806 | worse |
| NGC2955 | 24 | 1.055 | 0.055 | better |
| NGC2976 | 21 | 1.120 | 0.058 | better |
| NGC2998 | 10 | 0.706 | 0.153 | worse |
| NGC3109 | 21 | 0.250 | 0.587 | worse |
| NGC3198 | 37 | 0.759 | 0.228 | worse |
| NGC3521 | 34 | 0.939 | 0.062 | worse |
| NGC3726 | 12 | 1.214 | 0.188 | worse |
| NGC3741 | 19 | 0.197 | 0.666 | worse |
| NGC3769 | 10 | 0.691 | 0.294 | worse |
| NGC3877 | 11 | 1.233 | 0.097 | better |
| NGC3893 | 10 | 0.891 | 0.113 | worse |
| NGC3917 | 16 | 0.684 | 0.183 | worse |
| NGC3949 | 6 | 1.113 | 0.057 | worse |
| NGC3953 | 8 | 1.039 | 0.042 | better |
| NGC3972 | 9 | 0.705 | 0.159 | worse |
| NGC3992 | 9 | 0.693 | 0.196 | worse |
| NGC4010 | 9 | 0.745 | 0.117 | worse |
| NGC4013 | 36 | 0.836 | 0.189 | worse |
| NGC4051 | 6 | 1.309 | 0.121 | better |
| NGC4068 | 2 | 0.915 | 0.039 | better |
| NGC4085 | 6 | 1.286 | 0.148 | worse |
| NGC4088 | 11 | 1.533 | 0.164 | better |
| NGC4100 | 24 | 0.734 | 0.150 | worse |
| NGC4138 | 4 | 0.873 | 0.065 | worse |
| NGC4157 | 16 | 1.078 | 0.126 | worse |
| NGC4183 | 20 | 0.593 | 0.249 | worse |
| NGC4217 | 18 | 1.350 | 0.226 | better |
| NGC4559 | 29 | 0.768 | 0.130 | better |
| NGC5005 | 17 | 0.983 | 0.037 | better |
| NGC5033 | 22 | 0.655 | 0.211 | worse |
| NGC5055 | 27 | 1.155 | 0.150 | worse |
| NGC5371 | 19 | 1.129 | 0.113 | better |
| NGC5585 | 23 | 0.662 | 0.247 | worse |
| NGC5907 | 19 | 0.740 | 0.166 | worse |
| NGC5985 | 33 | 0.534 | 0.289 | worse |
| NGC6015 | 44 | 0.667 | 0.254 | worse |
| NGC6195 | 23 | 1.262 | 0.105 | better |
| NGC6503 | 30 | 0.447 | 0.356 | worse |
| NGC6674 | 14 | 0.544 | 0.324 | worse |
| NGC6789 | 1 | 0.304 | 0.517 | worse |
| NGC6946 | 54 | 1.125 | 0.071 | better |
| NGC7331 | 36 | 1.203 | 0.101 | worse |
| NGC7793 | 26 | 0.992 | 0.081 | worse |
| NGC7814 | 18 | 0.819 | 0.154 | worse |
| UGC00128 | 21 | 0.301 | 0.540 | worse |
| UGC00191 | 8 | 0.494 | 0.298 | worse |
| UGC00634 | 4 | 0.383 | 0.418 | worse |
| UGC00731 | 12 | 0.247 | 0.686 | worse |
| UGC00891 | 4 | 0.418 | 0.407 | worse |
| UGC01281 | 6 | 0.346 | 0.462 | worse |
| UGC02259 | 8 | 0.332 | 0.513 | worse |
| UGC02487 | 17 | 0.503 | 0.326 | worse |
| UGC02885 | 19 | 0.696 | 0.195 | worse |
| UGC02916 | 41 | 1.084 | 0.077 | better |
| UGC02953 | 113 | 0.773 | 0.197 | worse |
| UGC03205 | 46 | 0.788 | 0.153 | worse |
| UGC03546 | 22 | 1.067 | 0.114 | worse |
| UGC03580 | 39 | 1.556 | 0.304 | worse |
| UGC04278 | 15 | 0.393 | 0.499 | worse |
| UGC04325 | 8 | 0.416 | 0.453 | worse |
| UGC04483 | 6 | 0.625 | 0.196 | worse |
| UGC04499 | 8 | 0.574 | 0.233 | worse |
| UGC05005 | 1 | 0.363 | 0.440 | worse |
| UGC05253 | 72 | 0.981 | 0.102 | worse |
| UGC05414 | 5 | 0.721 | 0.154 | worse |
| UGC05716 | 11 | 0.324 | 0.477 | worse |
| UGC05721 | 20 | 0.266 | 0.500 | worse |
| UGC05750 | 2 | 0.447 | 0.351 | worse |
| UGC05764 | 10 | 0.265 | 0.649 | worse |
| UGC05829 | 5 | 0.596 | 0.242 | worse |
| UGC05918 | 4 | 0.362 | 0.439 | worse |
| UGC05986 | 15 | 0.475 | 0.353 | worse |
| UGC06399 | 7 | 0.418 | 0.380 | worse |
| UGC06446 | 14 | 0.328 | 0.481 | worse |
| UGC06614 | 10 | 1.380 | 0.232 | worse |
| UGC06667 | 8 | 0.193 | 0.810 | worse |
| UGC06786 | 41 | 0.749 | 0.248 | worse |
| UGC06787 | 68 | 0.853 | 0.219 | worse |
| UGC06818 | 5 | 0.460 | 0.327 | worse |
| UGC06917 | 11 | 0.515 | 0.269 | worse |
| UGC06923 | 4 | 0.712 | 0.142 | worse |
| UGC06930 | 9 | 0.573 | 0.254 | worse |
| UGC06983 | 15 | 0.424 | 0.368 | worse |
| UGC07089 | 9 | 0.733 | 0.155 | better |
| UGC07125 | 12 | 0.835 | 0.113 | better |
| UGC07151 | 11 | 0.663 | 0.173 | worse |
| UGC07232 | 2 | 0.587 | 0.254 | worse |
| UGC07261 | 6 | 0.543 | 0.266 | worse |
| UGC07323 | 8 | 0.778 | 0.100 | better |
| UGC07399 | 10 | 0.241 | 0.601 | worse |
| UGC07524 | 27 | 0.405 | 0.366 | worse |
| UGC07603 | 11 | 0.379 | 0.440 | worse |
| UGC07690 | 7 | 0.696 | 0.150 | worse |
| UGC08286 | 16 | 0.324 | 0.500 | worse |
| UGC08490 | 30 | 0.322 | 0.480 | worse |
| UGC08550 | 11 | 0.367 | 0.455 | worse |
| UGC08699 | 38 | 0.859 | 0.142 | worse |
| UGC08837 | 6 | 0.865 | 0.099 | better |
| UGC09037 | 20 | 1.237 | 0.203 | better |
| UGC09133 | 67 | 0.928 | 0.191 | worse |
| UGC10310 | 6 | 0.525 | 0.292 | worse |
| UGC11455 | 35 | 1.062 | 0.108 | worse |
| UGC11557 | 4 | 1.414 | 0.156 | better |
| UGC11820 | 5 | 0.435 | 0.371 | worse |
| UGC11914 | 61 | 0.757 | 0.127 | worse |
| UGC12506 | 28 | 0.497 | 0.304 | worse |
| UGC12632 | 13 | 0.358 | 0.431 | worse |
| UGC12732 | 16 | 0.328 | 0.463 | worse |
| UGCA442 | 7 | 0.399 | 0.449 | worse |
| UGCA444 | 1 | 0.650 | 0.187 | better |

<a id="per-galaxy-elastic"></a>
## Per-galaxy values: elastic law (I.5j.1) with $g_\Lambda$

| Galaxy | Radii | Median ratio | rms (dex) | vs RAR |
| --- | ---: | ---: | ---: | --- |
| CamB | 2 | 3.326 | 0.521 | better |
| D512-2 | 1 | 1.329 | 0.124 | better |
| D564-8 | 5 | 1.748 | 0.260 | better |
| D631-7 | 14 | 1.226 | 0.203 | better |
| DDO064 | 3 | 1.100 | 0.045 | better |
| DDO154 | 11 | 1.135 | 0.104 | better |
| DDO161 | 26 | 1.730 | 0.278 | better |
| DDO168 | 9 | 1.279 | 0.188 | better |
| DDO170 | 7 | 1.577 | 0.193 | better |
| ESO079-G014 | 12 | 0.897 | 0.093 | worse |
| ESO116-G012 | 14 | 0.827 | 0.089 | worse |
| ESO444-G084 | 6 | 0.689 | 0.169 | worse |
| ESO563-G021 | 28 | 0.725 | 0.170 | worse |
| F565-V2 | 3 | 0.838 | 0.085 | worse |
| F568-3 | 9 | 1.018 | 0.113 | worse |
| F568-V1 | 4 | 0.438 | 0.365 | worse |
| F571-8 | 11 | 0.855 | 0.243 | worse |
| F571-V1 | 5 | 1.131 | 0.052 | better |
| F574-1 | 12 | 0.840 | 0.106 | worse |
| F583-1 | 10 | 0.690 | 0.158 | worse |
| F583-4 | 8 | 1.211 | 0.081 | better |
| IC2574 | 22 | 1.676 | 0.258 | better |
| IC4202 | 31 | 0.953 | 0.137 | worse |
| KK98-251 | 8 | 1.920 | 0.306 | better |
| NGC0024 | 20 | 0.569 | 0.245 | worse |
| NGC0055 | 20 | 1.496 | 0.193 | better |
| NGC0100 | 16 | 1.031 | 0.072 | better |
| NGC0247 | 26 | 1.090 | 0.056 | better |
| NGC0289 | 22 | 1.243 | 0.116 | better |
| NGC0300 | 16 | 0.904 | 0.068 | worse |
| NGC0801 | 13 | 1.291 | 0.132 | better |
| NGC0891 | 18 | 1.136 | 0.107 | better |
| NGC1003 | 35 | 1.107 | 0.072 | better |
| NGC1090 | 22 | 1.237 | 0.092 | better |
| NGC2403 | 72 | 0.890 | 0.053 | worse |
| NGC2683 | 11 | 1.129 | 0.071 | better |
| NGC2841 | 50 | 0.662 | 0.177 | worse |
| NGC2903 | 32 | 0.975 | 0.044 | worse |
| NGC2915 | 21 | 0.566 | 0.266 | worse |
| NGC2955 | 24 | 1.108 | 0.070 | better |
| NGC2976 | 21 | 1.121 | 0.089 | better |
| NGC2998 | 10 | 1.074 | 0.106 | better |
| NGC3109 | 21 | 0.835 | 0.094 | worse |
| NGC3198 | 37 | 1.036 | 0.046 | better |
| NGC3521 | 34 | 0.948 | 0.036 | worse |
| NGC3726 | 12 | 1.348 | 0.138 | better |
| NGC3741 | 19 | 0.894 | 0.055 | worse |
| NGC3769 | 10 | 1.248 | 0.104 | better |
| NGC3877 | 11 | 1.191 | 0.097 | better |
| NGC3893 | 10 | 0.956 | 0.035 | worse |
| NGC3917 | 16 | 0.973 | 0.053 | worse |
| NGC3949 | 6 | 1.116 | 0.055 | better |
| NGC3953 | 8 | 1.003 | 0.044 | worse |
| NGC3972 | 9 | 0.867 | 0.057 | worse |
| NGC3992 | 9 | 0.892 | 0.074 | worse |
| NGC4010 | 9 | 1.106 | 0.078 | better |
| NGC4013 | 36 | 1.106 | 0.062 | better |
| NGC4051 | 6 | 1.319 | 0.129 | better |
| NGC4068 | 2 | 1.838 | 0.264 | better |
| NGC4085 | 6 | 1.252 | 0.142 | better |
| NGC4088 | 11 | 1.571 | 0.184 | better |
| NGC4100 | 24 | 0.940 | 0.058 | worse |
| NGC4138 | 4 | 0.994 | 0.062 | better |
| NGC4157 | 16 | 1.234 | 0.092 | better |
| NGC4183 | 20 | 1.204 | 0.080 | better |
| NGC4217 | 18 | 1.316 | 0.236 | better |
| NGC4559 | 29 | 1.335 | 0.129 | better |
| NGC5005 | 17 | 1.010 | 0.040 | better |
| NGC5033 | 22 | 0.970 | 0.056 | worse |
| NGC5055 | 27 | 1.302 | 0.117 | better |
| NGC5371 | 19 | 1.441 | 0.157 | better |
| NGC5585 | 23 | 1.126 | 0.150 | better |
| NGC5907 | 19 | 1.093 | 0.079 | better |
| NGC5985 | 33 | 0.628 | 0.262 | worse |
| NGC6015 | 44 | 0.930 | 0.087 | worse |
| NGC6195 | 23 | 1.297 | 0.109 | better |
| NGC6503 | 30 | 0.999 | 0.024 | better |
| NGC6674 | 14 | 0.903 | 0.094 | worse |
| NGC6789 | 1 | 0.440 | 0.356 | worse |
| NGC6946 | 54 | 1.180 | 0.081 | better |
| NGC7331 | 36 | 1.189 | 0.085 | better |
| NGC7793 | 26 | 1.056 | 0.054 | better |
| NGC7814 | 18 | 0.818 | 0.086 | worse |
| UGC00128 | 21 | 1.110 | 0.092 | better |
| UGC00191 | 8 | 0.980 | 0.082 | worse |
| UGC00634 | 4 | 0.978 | 0.026 | better |
| UGC00731 | 12 | 0.837 | 0.216 | worse |
| UGC00891 | 4 | 1.198 | 0.095 | better |
| UGC01281 | 6 | 0.980 | 0.026 | worse |
| UGC02259 | 8 | 0.752 | 0.205 | worse |
| UGC02487 | 17 | 0.694 | 0.169 | worse |
| UGC02885 | 19 | 0.958 | 0.055 | worse |
| UGC02916 | 41 | 1.150 | 0.101 | better |
| UGC02953 | 113 | 0.824 | 0.084 | worse |
| UGC03205 | 46 | 0.911 | 0.093 | worse |
| UGC03546 | 22 | 1.083 | 0.066 | better |
| UGC03580 | 39 | 1.511 | 0.247 | better |
| UGC04278 | 15 | 0.955 | 0.119 | worse |
| UGC04325 | 8 | 0.656 | 0.230 | worse |
| UGC04483 | 6 | 1.540 | 0.190 | better |
| UGC04499 | 8 | 1.214 | 0.095 | better |
| UGC05005 | 1 | 1.316 | 0.119 | better |
| UGC05253 | 72 | 1.004 | 0.035 | worse |
| UGC05414 | 5 | 1.345 | 0.141 | better |
| UGC05716 | 11 | 0.993 | 0.066 | better |
| UGC05721 | 20 | 0.623 | 0.225 | worse |
| UGC05750 | 2 | 1.337 | 0.126 | better |
| UGC05764 | 10 | 0.659 | 0.223 | worse |
| UGC05829 | 5 | 1.415 | 0.152 | better |
| UGC05918 | 4 | 1.244 | 0.101 | better |
| UGC05986 | 15 | 0.700 | 0.142 | worse |
| UGC06399 | 7 | 0.886 | 0.052 | worse |
| UGC06446 | 14 | 0.784 | 0.131 | worse |
| UGC06614 | 10 | 1.412 | 0.133 | better |
| UGC06667 | 8 | 0.568 | 0.289 | worse |
| UGC06786 | 41 | 0.749 | 0.136 | worse |
| UGC06787 | 68 | 0.838 | 0.119 | worse |
| UGC06818 | 5 | 1.116 | 0.117 | better |
| UGC06917 | 11 | 0.959 | 0.049 | worse |
| UGC06923 | 4 | 1.112 | 0.052 | better |
| UGC06930 | 9 | 1.157 | 0.084 | better |
| UGC06983 | 15 | 0.852 | 0.093 | worse |
| UGC07089 | 9 | 1.527 | 0.199 | better |
| UGC07125 | 12 | 2.040 | 0.350 | better |
| UGC07151 | 11 | 1.146 | 0.084 | better |
| UGC07232 | 2 | 0.857 | 0.097 | worse |
| UGC07261 | 6 | 1.031 | 0.034 | better |
| UGC07323 | 8 | 1.242 | 0.126 | better |
| UGC07399 | 10 | 0.481 | 0.316 | worse |
| UGC07524 | 27 | 1.024 | 0.076 | better |
| UGC07603 | 11 | 0.763 | 0.112 | worse |
| UGC07690 | 7 | 1.139 | 0.086 | better |
| UGC08286 | 16 | 0.764 | 0.165 | worse |
| UGC08490 | 30 | 0.787 | 0.119 | worse |
| UGC08550 | 11 | 0.903 | 0.065 | worse |
| UGC08699 | 38 | 0.890 | 0.056 | worse |
| UGC08837 | 6 | 1.982 | 0.329 | better |
| UGC09037 | 20 | 1.540 | 0.236 | better |
| UGC09133 | 67 | 1.043 | 0.051 | better |
| UGC10310 | 6 | 1.118 | 0.095 | better |
| UGC11455 | 35 | 1.053 | 0.094 | better |
| UGC11557 | 4 | 2.192 | 0.326 | better |
| UGC11820 | 5 | 1.356 | 0.120 | better |
| UGC11914 | 61 | 0.783 | 0.119 | worse |
| UGC12506 | 28 | 0.770 | 0.166 | worse |
| UGC12632 | 13 | 1.046 | 0.093 | better |
| UGC12732 | 16 | 0.935 | 0.078 | worse |
| UGCA442 | 7 | 1.060 | 0.077 | better |
| UGCA444 | 1 | 1.613 | 0.208 | better |

<a id="per-galaxy-rar"></a>
## Per-galaxy values: RAR with $g_\dagger$ (reference)

| Galaxy | Radii | Median ratio | rms (dex) |
| --- | ---: | ---: | ---: |
| CamB | 2 | 3.356 | 0.525 |
| D512-2 | 1 | 1.341 | 0.127 |
| D564-8 | 5 | 1.765 | 0.264 |
| D631-7 | 14 | 1.237 | 0.206 |
| DDO064 | 3 | 1.110 | 0.048 |
| DDO154 | 11 | 1.146 | 0.107 |
| DDO161 | 26 | 1.746 | 0.282 |
| DDO168 | 9 | 1.290 | 0.190 |
| DDO170 | 7 | 1.592 | 0.197 |
| ESO079-G014 | 12 | 0.903 | 0.092 |
| ESO116-G012 | 14 | 0.834 | 0.086 |
| ESO444-G084 | 6 | 0.694 | 0.165 |
| ESO563-G021 | 28 | 0.729 | 0.168 |
| F565-V2 | 3 | 0.846 | 0.081 |
| F568-3 | 9 | 1.027 | 0.113 |
| F568-V1 | 4 | 0.442 | 0.361 |
| F571-8 | 11 | 0.862 | 0.242 |
| F571-V1 | 5 | 1.141 | 0.055 |
| F574-1 | 12 | 0.847 | 0.104 |
| F583-1 | 10 | 0.696 | 0.156 |
| F583-4 | 8 | 1.222 | 0.084 |
| IC2574 | 22 | 1.691 | 0.261 |
| IC4202 | 31 | 0.959 | 0.137 |
| KK98-251 | 8 | 1.937 | 0.309 |
| NGC0024 | 20 | 0.573 | 0.241 |
| NGC0055 | 20 | 1.509 | 0.197 |
| NGC0100 | 16 | 1.039 | 0.074 |
| NGC0247 | 26 | 1.099 | 0.057 |
| NGC0289 | 22 | 1.253 | 0.120 |
| NGC0300 | 16 | 0.911 | 0.065 |
| NGC0801 | 13 | 1.295 | 0.134 |
| NGC0891 | 18 | 1.144 | 0.109 |
| NGC1003 | 35 | 1.117 | 0.074 |
| NGC1090 | 22 | 1.247 | 0.095 |
| NGC2403 | 72 | 0.897 | 0.051 |
| NGC2683 | 11 | 1.139 | 0.074 |
| NGC2841 | 50 | 0.667 | 0.175 |
| NGC2903 | 32 | 0.982 | 0.044 |
| NGC2915 | 21 | 0.571 | 0.262 |
| NGC2955 | 24 | 1.114 | 0.072 |
| NGC2976 | 21 | 1.128 | 0.092 |
| NGC2998 | 10 | 1.083 | 0.106 |
| NGC3109 | 21 | 0.843 | 0.092 |
| NGC3198 | 37 | 1.045 | 0.049 |
| NGC3521 | 34 | 0.952 | 0.035 |
| NGC3726 | 12 | 1.358 | 0.141 |
| NGC3741 | 19 | 0.902 | 0.054 |
| NGC3769 | 10 | 1.259 | 0.107 |
| NGC3877 | 11 | 1.199 | 0.098 |
| NGC3893 | 10 | 0.963 | 0.034 |
| NGC3917 | 16 | 0.980 | 0.052 |
| NGC3949 | 6 | 1.121 | 0.057 |
| NGC3953 | 8 | 1.009 | 0.044 |
| NGC3972 | 9 | 0.873 | 0.054 |
| NGC3992 | 9 | 0.899 | 0.072 |
| NGC4010 | 9 | 1.115 | 0.080 |
| NGC4013 | 36 | 1.115 | 0.064 |
| NGC4051 | 6 | 1.327 | 0.131 |
| NGC4068 | 2 | 1.853 | 0.268 |
| NGC4085 | 6 | 1.260 | 0.144 |
| NGC4088 | 11 | 1.579 | 0.186 |
| NGC4100 | 24 | 0.946 | 0.057 |
| NGC4138 | 4 | 0.999 | 0.062 |
| NGC4157 | 16 | 1.243 | 0.095 |
| NGC4183 | 20 | 1.214 | 0.082 |
| NGC4217 | 18 | 1.325 | 0.237 |
| NGC4559 | 29 | 1.347 | 0.132 |
| NGC5005 | 17 | 1.013 | 0.040 |
| NGC5033 | 22 | 0.977 | 0.056 |
| NGC5055 | 27 | 1.309 | 0.120 |
| NGC5371 | 19 | 1.451 | 0.159 |
| NGC5585 | 23 | 1.136 | 0.153 |
| NGC5907 | 19 | 1.101 | 0.080 |
| NGC5985 | 33 | 0.632 | 0.259 |
| NGC6015 | 44 | 0.937 | 0.086 |
| NGC6195 | 23 | 1.302 | 0.111 |
| NGC6503 | 30 | 1.007 | 0.025 |
| NGC6674 | 14 | 0.911 | 0.092 |
| NGC6789 | 1 | 0.444 | 0.353 |
| NGC6946 | 54 | 1.186 | 0.083 |
| NGC7331 | 36 | 1.196 | 0.087 |
| NGC7793 | 26 | 1.063 | 0.055 |
| NGC7814 | 18 | 0.824 | 0.084 |
| UGC00128 | 21 | 1.120 | 0.092 |
| UGC00191 | 8 | 0.989 | 0.082 |
| UGC00634 | 4 | 0.987 | 0.026 |
| UGC00731 | 12 | 0.844 | 0.214 |
| UGC00891 | 4 | 1.209 | 0.098 |
| UGC01281 | 6 | 0.988 | 0.026 |
| UGC02259 | 8 | 0.758 | 0.202 |
| UGC02487 | 17 | 0.699 | 0.166 |
| UGC02885 | 19 | 0.965 | 0.054 |
| UGC02916 | 41 | 1.159 | 0.102 |
| UGC02953 | 113 | 0.830 | 0.082 |
| UGC03205 | 46 | 0.918 | 0.091 |
| UGC03546 | 22 | 1.091 | 0.067 |
| UGC03580 | 39 | 1.521 | 0.249 |
| UGC04278 | 15 | 0.963 | 0.117 |
| UGC04325 | 8 | 0.661 | 0.227 |
| UGC04483 | 6 | 1.553 | 0.194 |
| UGC04499 | 8 | 1.224 | 0.098 |
| UGC05005 | 1 | 1.328 | 0.123 |
| UGC05253 | 72 | 1.006 | 0.035 |
| UGC05414 | 5 | 1.357 | 0.145 |
| UGC05716 | 11 | 1.002 | 0.067 |
| UGC05721 | 20 | 0.628 | 0.221 |
| UGC05750 | 2 | 1.349 | 0.130 |
| UGC05764 | 10 | 0.665 | 0.220 |
| UGC05829 | 5 | 1.427 | 0.155 |
| UGC05918 | 4 | 1.256 | 0.105 |
| UGC05986 | 15 | 0.707 | 0.140 |
| UGC06399 | 7 | 0.894 | 0.049 |
| UGC06446 | 14 | 0.791 | 0.128 |
| UGC06614 | 10 | 1.419 | 0.135 |
| UGC06667 | 8 | 0.573 | 0.285 |
| UGC06786 | 41 | 0.752 | 0.134 |
| UGC06787 | 68 | 0.843 | 0.117 |
| UGC06818 | 5 | 1.126 | 0.120 |
| UGC06917 | 11 | 0.967 | 0.047 |
| UGC06923 | 4 | 1.121 | 0.055 |
| UGC06930 | 9 | 1.167 | 0.086 |
| UGC06983 | 15 | 0.859 | 0.091 |
| UGC07089 | 9 | 1.540 | 0.203 |
| UGC07125 | 12 | 2.058 | 0.354 |
| UGC07151 | 11 | 1.156 | 0.086 |
| UGC07232 | 2 | 0.864 | 0.094 |
| UGC07261 | 6 | 1.039 | 0.036 |
| UGC07323 | 8 | 1.252 | 0.129 |
| UGC07399 | 10 | 0.485 | 0.313 |
| UGC07524 | 27 | 1.033 | 0.078 |
| UGC07603 | 11 | 0.769 | 0.109 |
| UGC07690 | 7 | 1.149 | 0.088 |
| UGC08286 | 16 | 0.771 | 0.162 |
| UGC08490 | 30 | 0.794 | 0.116 |
| UGC08550 | 11 | 0.911 | 0.063 |
| UGC08699 | 38 | 0.894 | 0.054 |
| UGC08837 | 6 | 1.999 | 0.333 |
| UGC09037 | 20 | 1.552 | 0.238 |
| UGC09133 | 67 | 1.046 | 0.053 |
| UGC10310 | 6 | 1.128 | 0.097 |
| UGC11455 | 35 | 1.059 | 0.095 |
| UGC11557 | 4 | 2.210 | 0.329 |
| UGC11820 | 5 | 1.368 | 0.124 |
| UGC11914 | 61 | 0.786 | 0.117 |
| UGC12506 | 28 | 0.776 | 0.164 |
| UGC12632 | 13 | 1.055 | 0.095 |
| UGC12732 | 16 | 0.944 | 0.077 |
| UGCA442 | 7 | 1.069 | 0.079 |
| UGCA444 | 1 | 1.628 | 0.212 |
