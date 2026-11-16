# Finite exclusion-state and controlled-bond calculations

These exact integer tables evaluate the finite sources and rate-sum refinement of Theorem 20u in [the complexity and resources chapter](../../../06_complexity_resources.md). The complete source law, refinement algorithm, proofs of strong lumpability/minimality, entropy calculations, controlled-clock coupling and finite-time error bounds remain in that chapter.

For $\Omega_{N,k}=\{\eta\in\{0,1\}^N:\sum_j\eta_j=k\}$, every cyclic neighboring bond has its own unit-rate clock and
$$
 (Lf)(\eta)=\sum_{j=0}^{N-1}[f(\eta^{j,j+1})-f(\eta)].
$$
The four-site coefficient vectors are $(1,0,-1,0)$ and $(0,1,0,-1)$. The six-site vectors are $c=(2,1,-1,-2,-1,1)$ and $s=(0,1,1,0,-1,-1)$, with $Z(\eta)=(\sum_jc_j\eta_j,\sum_js_j\eta_j)$. These are the same fixed clocks and mode coordinates as in the theorem. The tables report their derived state adjacency, mode and coarsest-refinement labels.

<a id="state-tables"></a>

## State, generator and autonomous-cell evaluations

The following finite tables specify every state and generator needed for the examples. States are occupied-site sets in lexicographic order. The column $\mathcal J_i$ lists every distinct state reached at rate one from state $i$; all unlisted off-diagonal entries are zero and $L_{ii}=-|\mathcal J_i|$. The column $R_i$ gives the terminal cell of Theorem 20u, with labels local to each table.


$N=4$, $k=2$:

| $i$ | Occupied sites | $Z_i$ | $R_i$ | $\mathcal J_i$ |
|---:|---|---|---:|---|
| 0 | $\{0,1\}$ | $(1,1)$ | 4 | $\{1,4\}$ |
| 1 | $\{0,2\}$ | $(0,0)$ | 2 | $\{0,2,3,5\}$ |
| 2 | $\{0,3\}$ | $(1,-1)$ | 3 | $\{1,4\}$ |
| 3 | $\{1,2\}$ | $(-1,1)$ | 1 | $\{1,4\}$ |
| 4 | $\{1,3\}$ | $(0,0)$ | 2 | $\{0,2,3,5\}$ |
| 5 | $\{2,3\}$ | $(-1,-1)$ | 0 | $\{1,4\}$ |

$N=6$, $k=2$:

| $i$ | Occupied sites | $Z_i$ | $R_i$ | $\mathcal J_i$ |
|---:|---|---|---:|---|
| 0 | $\{0,1\}$ | $(3,1)$ | 14 | $\{1,8\}$ |
| 1 | $\{0,2\}$ | $(1,1)$ | 11 | $\{0,2,5,11\}$ |
| 2 | $\{0,3\}$ | $(0,0)$ | 6 | $\{1,3,6,13\}$ |
| 3 | $\{0,4\}$ | $(1,-1)$ | 10 | $\{2,4,7,14\}$ |
| 4 | $\{0,5\}$ | $(3,-1)$ | 13 | $\{3,8\}$ |
| 5 | $\{1,2\}$ | $(0,2)$ | 9 | $\{1,6\}$ |
| 6 | $\{1,3\}$ | $(-1,1)$ | 4 | $\{2,5,7,9\}$ |
| 7 | $\{1,4\}$ | $(0,0)$ | 7 | $\{3,6,8,10\}$ |
| 8 | $\{1,5\}$ | $(2,0)$ | 12 | $\{0,4,7,11\}$ |
| 9 | $\{2,3\}$ | $(-3,1)$ | 1 | $\{6,10\}$ |
| 10 | $\{2,4\}$ | $(-2,0)$ | 2 | $\{7,9,11,12\}$ |
| 11 | $\{2,5\}$ | $(0,0)$ | 8 | $\{1,8,10,13\}$ |
| 12 | $\{3,4\}$ | $(-3,-1)$ | 0 | $\{10,13\}$ |
| 13 | $\{3,5\}$ | $(-1,-1)$ | 3 | $\{2,11,12,14\}$ |
| 14 | $\{4,5\}$ | $(0,-2)$ | 5 | $\{3,13\}$ |

$N=6$, $k=3$:

| $i$ | Occupied sites | $Z_i$ | $R_i$ | $\mathcal J_i$ |
|---:|---|---|---:|---|
| 0 | $\{0,1,2\}$ | $(2,2)$ | 12 | $\{1,12\}$ |
| 1 | $\{0,1,3\}$ | $(1,1)$ | 9 | $\{0,2,4,14\}$ |
| 2 | $\{0,1,4\}$ | $(2,0)$ | 11 | $\{1,3,5,15\}$ |
| 3 | $\{0,1,5\}$ | $(4,0)$ | 13 | $\{2,6\}$ |
| 4 | $\{0,2,3\}$ | $(-1,1)$ | 5 | $\{1,5,10,17\}$ |
| 5 | $\{0,2,4\}$ | $(0,0)$ | 6 | $\{2,4,6,7,11,18\}$ |
| 6 | $\{0,2,5\}$ | $(2,0)$ | 11 | $\{3,5,8,12\}$ |
| 7 | $\{0,3,4\}$ | $(-1,-1)$ | 4 | $\{5,8,13,19\}$ |
| 8 | $\{0,3,5\}$ | $(1,-1)$ | 8 | $\{6,7,9,14\}$ |
| 9 | $\{0,4,5\}$ | $(2,-2)$ | 10 | $\{8,15\}$ |
| 10 | $\{1,2,3\}$ | $(-2,2)$ | 3 | $\{4,11\}$ |
| 11 | $\{1,2,4\}$ | $(-1,1)$ | 5 | $\{5,10,12,13\}$ |
| 12 | $\{1,2,5\}$ | $(1,1)$ | 9 | $\{0,6,11,14\}$ |
| 13 | $\{1,3,4\}$ | $(-2,0)$ | 2 | $\{7,11,14,16\}$ |
| 14 | $\{1,3,5\}$ | $(0,0)$ | 7 | $\{1,8,12,13,15,17\}$ |
| 15 | $\{1,4,5\}$ | $(1,-1)$ | 8 | $\{2,9,14,18\}$ |
| 16 | $\{2,3,4\}$ | $(-4,0)$ | 0 | $\{13,17\}$ |
| 17 | $\{2,3,5\}$ | $(-2,0)$ | 2 | $\{4,14,16,18\}$ |
| 18 | $\{2,4,5\}$ | $(-1,-1)$ | 4 | $\{5,15,17,19\}$ |
| 19 | $\{3,4,5\}$ | $(-2,-2)$ | 1 | $\{7,18\}$ |


<a id="bond-witnesses"></a>

## Single-bond rate-sum witnesses

For $j=0,\ldots,5$, let $(B_jf)(\eta)=f(\eta^{j,j+1})-f(\eta)$ and $L_a=L+aB_j$, $a>0$. In the following table each $(z,d)$ gives a target mode $z$ and the nonzero difference $d$ between the two indicated states' $B_j$ rate sums into that mode. Their $L$ rate-sum differences into every initial mode cell are zero. State indices are those of the twenty-state $(6,3)$ table above. The main proof multiplies these differences by $a$, retains the alternating-state outgoing-law witness, and applies the coarsest-refinement theorem.

| Ordered state-index pair | Common mode | $j=0$ | $j=1$ | $j=2$ | $j=3$ | $j=4$ | $j=5$ |
|---|---|---|---|---|---|---|---|
| $(13,17)$ | $(-2,0)$ | $((-2,0),-1)$ | $((-4,0),1)$ | $((-2,0),-1)$ | $((-2,0),1)$ | $((-4,0),-1)$ | $((-2,0),1)$ |
| $(7,18)$ | $(-1,-1)$ | $((-2,0),1)$ | $((-1,-1),1)$ | $((-2,-2),-1)$ | $((-2,0),-1)$ | $((-1,-1),-1)$ | $((-2,-2),1)$ |
| $(4,11)$ | $(-1,1)$ | $((-2,2),1)$ | $((-1,1),-1)$ | $((-2,0),-1)$ | $((-2,2),-1)$ | $((-1,1),1)$ | $((-2,0),1)$ |
| $(8,15)$ | $(1,-1)$ | $((0,0),1)$ | $((-1,-1),-1)$ | $((1,-1),-1)$ | $((0,0),-1)$ | $((-1,-1),1)$ | $((1,-1),1)$ |
| $(1,12)$ | $(1,1)$ | $((1,1),1)$ | $((-1,1),1)$ | $((0,0),-1)$ | $((1,1),-1)$ | $((-1,1),-1)$ | $((0,0),1)$ |
| $(2,6)$ | $(2,0)$ | $((1,1),-1)$ | $((0,0),1)$ | $((1,-1),-1)$ | $((1,1),1)$ | $((0,0),-1)$ | $((1,-1),1)$ |
