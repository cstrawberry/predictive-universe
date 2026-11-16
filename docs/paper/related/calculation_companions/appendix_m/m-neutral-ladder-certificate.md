# Neutral-ladder coercivity: ordered bases and exact rational matrices

<a id="neutral-ladder-certificate"></a>

These companion calculations give the exact finite input tables used in [Theorem M.6.13cn](../../../appendices/appendix_m_perspectival_quantum_dynamics.md). The principal manuscript retains the hypotheses, constructive argument, coefficient identities, error bounds and positivity proof.

All indices, ordered products, adjoints and rational denominators have the conventions stated below. Matrix entries are exact integers divided by their stated denominator; no decimal approximation or implicit numerical tolerance is used. Numbered equation references in this note refer to the owning result in the principal manuscript.

## Notation, hypotheses and construction

**Source and domain.**

Use the normalized source, Hermitian/Jordan form and Fourier projections of Theorem M.6.13ci. Thus $L_B=-3\partial_\theta^2+\mathcal J_{W_B}$, $\mathcal J_W(X)=(WX+XW)/2$, $P$ projects onto constant Fourier modes, $Q=I-P$, $L_0=-3\partial_\theta^2$, and $R_0=(QL_0Q)^{-1}$. The form domain remains $H^1(S^1;\operatorname{Herm}_d)$, with ordinary coefficient trace and normalized Haar measure. The Schur operator is
$$
\mathfrak F_B=P L_B P-P L_B Q(Q L_B Q)^{-1}Q L_B P.
$$
All finite coefficient dimensions are allowed. The complete-reference, charge, degeneracy, correlation, retained-flag, pointer and all-input conventions of Theorems M.6.13ch–M.6.13ck remain unchanged. In particular $u\le q$; no new operational error equality is asserted.

**Part I. Neutral constant-Schur coercivity.**

Let $b$ be an arbitrary complex $d$-by-$d$ matrix, and let $B$ be the neutral ladder
$$
B_{01}=B_{23}=\frac{\sqrt3}{2}b,\qquad B_{12}=b,\qquad B_{03}=0,
$$
with reverse adjoint blocks. If $\|B\|\le1$, then for every Hermitian constant $H$, with $Z=bb^*+b^*b$,
$$
\boxed{\quad
\langle H,\mathfrak F_BH\rangle
\ge\frac1{100}\left(\|[H,b]\|_{\rm HS}^2+\operatorname{Tr}H^2Z^2\right).
\quad}                                                    
$$
Consequently $\mathcal Q_B(G)\ge0$ on the full Hermitian $H^1$ domain. No normality, nilpotency, grading, rank, invertibility or activity-gap assumption is imposed on $b$ or $H$.

**Proof: the complete mean-zero inverse.** The neutral potential is
$$
W_b(\theta)=-\frac32(bz+b^*z^{-1})+\frac34Z
 +\frac98(b^2z^2+(b^*)^2z^{-2}),\qquad z=e^{i\theta}.

$$
Compression gives $\|b\|\le1$. Since $0\le B^2\le I$, its $02$ block has norm at most $1/2$. This block equals $(\sqrt3/2)b^2$, so $\|b^2\|\le1/\sqrt3$. The $11$ and $22$ diagonal compressions give
$$
bb^*+\tfrac34b^*b\le I,\qquad b^*b+\tfrac34bb^*\le I,
\qquad Z\le\tfrac87I.
$$
The nonconstant potential coefficients therefore have norms at most $c_1=3/2$ and $c_2=2/3$, while its constant coefficient is positive. Jordan multiplication has HS operator norm at most the coefficient norm.

For nonzero Fourier indices, preconditioning by $\sqrt3|n|$ gives the absolute comparison kernel $c_{|n-m|}/(3|nm|)$, zero unless $|n-m|=1,2$. Use Schur weights $w_n=a_n/|n|$, with $a_n=1$ for odd $n$ and $a_n=4/3$ for nonzero even $n$. Its weighted row sums at $n=1,2,3,4$ are
$$
\frac{67}{162},\quad\frac{31}{72},\quad\frac{791}{1800},\quad\frac{959}{8100},
$$
all below $4/9$. Reflection handles negative indices. For $n\ge5$ the row $\sum$ is bounded by
$$
\frac49\left(\frac{3/2}{16}+\frac{3/2}{36}+\frac{2/3}{9}+\frac{2/3}{49}\right)
=\frac{9445}{95256}<\frac1{10}.
$$
Dropping only the positive constant coefficient, the weighted Schur inequality and $H^1$ density yield
$$
A:=QL_BQ\ge\frac59QL_0Q,\qquad A^{-1}\le\frac95R_0.

$$
This covers the complete Fourier tail. Also $W_0=(3/4)Z\le6I/7$ gives the optional upper bound $A\le(109/63)QL_0Q$; this upper bound is not needed for (M.6.13cn.1).

**Proof: a finite exact lower polynomial.** For the given $H$, choose the Hermitian Fourier polynomial
$$
G_0=H,\qquad G_1=\frac{bH+Hb}{4},\qquad
G_2=\frac{-b^2H+bHb-Hb^2}{32},\qquad G_{-n}=G_n^*.

$$
Unlisted coefficients vanish. Write $W_k$ for the coefficients in (M.6.13cn.2), and for $n\ne0$ put
$$
E_n=3n^2G_n+\sum_{k=-2}^{2}\mathcal J_{W_k}(G_{n-k}).
$$
The full residual $E=QL_BG$ is supported on $0<|n|\le4$. Define the real ordered tracial polynomial
$$
\begin{split}
\mathcal T(b,H)={}&3\sum_n n^2\operatorname{Tr}G_n^*G_n
 +\sum_{n,m}\operatorname{Tr}\bigl(G_n^*\mathcal J_{W_{n-m}}(G_m)\bigr)\\
&-\frac95\sum_{n\ne0}\frac{\operatorname{Tr}E_n^*E_n}{3n^2}.
\end{split}                                               
$$
Its degree in $b,b^*$ is at most eight, and every word has exactly two $H$'s. Exact Schur completion and (M.6.13cn.3) give
$$
\langle H,\mathfrak F_BH\rangle
=\mathcal Q_B(G)-\langle E,A^{-1}E\rangle
\ge\mathcal T(b,H).                                      
$$
Thus a finite polynomial lower bound controls the full inverse; no finite-section positivity assumption is used.

**Proof: rational $\sum$-of-squares certificate.** Grouping even and odd spin indices gives $B=\left(\begin{smallmatrix}0&C\\ C^*&0\end{smallmatrix}\right)$, where
$$
C=\begin{pmatrix}(\sqrt3/2)b&0\\b^*&(\sqrt3/2)b\end{pmatrix}.
$$
Congruences of $I-CC^*$ and $I-C^*C$ give the positive rational localizers
$$
\Lambda_1=\begin{pmatrix}\frac43I-bb^*&-b^2\\-(b^*)^2&I-b^*b-\frac34bb^*\end{pmatrix},\qquad
\Lambda_2=\begin{pmatrix}I-bb^*-\frac34b^*b&-b^2\\-(b^*)^2&\frac43I-b^*b\end{pmatrix}.

$$
Here the congruence factors are respectively $\operatorname{diag}(2I/\sqrt3,I)$ and $\operatorname{diag}(I,2I/\sqrt3)$.

For $k\ge2$, let $\mathcal V_k$ contain every word with $k$ letters independently chosen from $b,b^*$ and one $H$ inserted in every position. Set $\mathcal V_1=(bH-Hb,b^*H-Hb^*)$. Let
$$
v_0=\mathcal V_1\cup\mathcal V_3,\quad v_1=\mathcal V_2\cup\mathcal V_4,
\qquad v'_0=v_0,\quad v'_1=\mathcal V_2.
$$
The complete rational data below contain the exact ordered bases, all six rational symmetric Gram matrices of sizes $34,92,68,24,68,24$, and a rational positive-definiteness witness for each matrix.
They satisfy the exact real-trace identity
$$
\begin{split}
\mathcal T(b,H)-\frac{\|[H,b]\|_{\rm HS}^2+\operatorname{Tr}H^2Z^2}{100}
={}&\sum_{s=0}^{1}\sum_{i,j}(Q_s)_{ij}\operatorname{Tr}(v_{s,i}^*v_{s,j})\\
&+\sum_{r=1}^{2}\sum_{s=0}^{1}\sum_{a,i,c,j}
(Q_{r,s})_{(a,i),(c,j)}
\operatorname{Tr}\bigl((v'_{s,i})^*(\Lambda_r)_{ac}v'_{s,j}\bigr).
\end{split}                                               
$$
For each Gram matrix $Q$ the data also specify a rational matrix $R$. Exact integer arithmetic verifies strict diagonal dominance of the symmetric residual $Q-RR^{\mathsf T}$ with positive diagonal. Every row margin is positive, so all six Grams are positive definite. This is an exact PSD proof, not a numerical eigenvalue test.

The finite identity has the following exact interpretation. Code $b,b^*,H$ by $0,1,2$. An adjoint reverses a word, interchanges $0,1$ and fixes $2$. Reduce a real-trace word to the lexicographically least cyclic rotation of the word or of its adjoint. Expanding (M.6.13cn.2), (M.6.13cn.4) and all eight residual modes in (M.6.13cn.5), then subtracting the displayed coercive polynomial divided by $100$, gives exactly $129$ nonzero real cyclic coefficients. Expanding the six Gram expressions in (M.6.13cn.8) gives the same coefficients. No multiplication order of $b,b^*$ is changed.

Every basis polynomial and localizer entry is printed as an ordered noncommutative polynomial. If a local block has $k$ basis vectors, matrix index $ak+i$ means localizer component $a=0,1$ and basis index $0\le i<k$; free blocks have only the basis index. Each matrix table states its denominator and integer numerators, defining the exact Gram $Q$ or rational factor $R$. There are $20,020$ entries in the six Gram matrices and the same number in their factors. For each block form the exact symmetric matrix $Q-RR^{\mathsf T}$. All its strict diagonal-dominance row margins are positive; the minimum over all six blocks is
$$
\frac{1562480313427853}{15625000000000000000000}>0.
$$
Thus all six $Q$ are positive definite and every term on the right of (M.6.13cn.8) is nonnegative under (M.6.13cn.7). Equations (M.6.13cn.6)–(M.6.13cn.8) prove (M.6.13cn.1). Full mean-zero coercivity and exact Schur completion give positivity on the complete Hermitian $H^1$ domain. $\square$

**Part II. Actual optimizers and Gibbs stationary points.**

Let $F$ be smooth, normalized and uniformly positive, and suppose its actual Sylvester optimizer $B_F$ is a neutral contraction as in Part I. With $H_0=\int\sqrt F\,d\mu$ and $Z=bb^*+b^*b$,
$$
\frac34I_{\rm WY}(F)-E(F)
\ge\frac1{100}\left(\|[H_0,b]\|_{\rm HS}^2+\operatorname{Tr}H_0^2Z^2\right).

$$
The right side is strictly positive when $b\ne0$. No faithful Gibbs/Sylvester stationary point at $c=2/3$ has a nonzero neutral optimizer.

**Proof.** Theorem M.6.13ci, Equation (M.6.13ci.S6), identifies the left side with $\mathcal Q_{B_F}(\sqrt F)$. Schur completion bounds it below by $\langle H_0,\mathfrak F_{B_F}H_0\rangle$, to which Part I applies. Uniform positivity makes $H_0$ positive definite, so $\operatorname{Tr}H_0^2Z^2=\|ZH_0\|_{\rm HS}^2>0$ for nonzero $b$. At a Gibbs/Sylvester point with coefficient $c=2/3$, the derivative identity and actual-optimizer normal equation of Theorem M.6.13ci give $I_{\rm BKM}=2cE=4E/3$, whereas its metric ordering gives $I_{\rm WY}\le I_{\rm BKM}$. These contradict the strict gap. The Ward identity does not require the fixed Gibbs parameter to equal the actual mean. $\square$

**Scope.** The bound includes arbitrary nonnormal neutral ladders and inactive directions, with explicit coefficient $1/100$. Part II is a pointwise Fisher statement and stationary exclusion. Neutrality of the actual optimizer has not been shown to be heat invariant, so this neutral theorem alone does not give unrestricted entropy integration. Theorems M.6.13cj–M.6.13ck supply the separate general full-corner results. Their operational distinction $u\le q$, complete source inventories and attainment scopes remain in force.

## Complete finite inputs

**Complete rational neutral certificate.**

The following indexed polynomial and rational matrix tables specify every input of the tracial identity (M.6.13cn.8). All indices start at zero. Products in each basis polynomial retain their printed order. A scalar constant $c$ in an operator polynomial means $cI$. The target polynomial is defined by the displayed finite potential, corrector and residual formulas above, so its coefficients require no additional input. A matrix row lists exact rational numerators, with its denominator stated explicitly.

The localizer used by the tables with index $r=1$ is
$$
\Lambda^{\mathrm{tab}}_1=\begin{pmatrix}\frac{4}{3}-b\,b^*&-b\,b\\-b^*\,b^*&1-\frac{3}{4}b\,b^*-b^*\,b\end{pmatrix}.
$$

The localizer used by the tables with index $r=2$ is
$$
\Lambda^{\mathrm{tab}}_2=\begin{pmatrix}1-b\,b^*-\frac{3}{4}b^*\,b&-b\,b\\-b^*\,b^*&\frac{4}{3}-b^*\,b\end{pmatrix}.
$$

**Neutral block 0: free; dimension $34$.**

<a id="neutral-block-00-basis"></a>

| Index $i$ | Basis polynomial $v_i$ |
|:--|:--|
| $0$ | $b\,H-H\,b$ |
| $1$ | $b^*\,H-H\,b^*$ |
| $2$ | $H\,b\,b\,b$ |
| $3$ | $b\,H\,b\,b$ |
| $4$ | $b\,b\,H\,b$ |
| $5$ | $b\,b\,b\,H$ |
| $6$ | $H\,b\,b\,b^*$ |
| $7$ | $b\,H\,b\,b^*$ |
| $8$ | $b\,b\,H\,b^*$ |
| $9$ | $b\,b\,b^*\,H$ |
| $10$ | $H\,b\,b^*\,b$ |
| $11$ | $b\,H\,b^*\,b$ |
| $12$ | $b\,b^*\,H\,b$ |
| $13$ | $b\,b^*\,b\,H$ |
| $14$ | $H\,b\,b^*\,b^*$ |
| $15$ | $b\,H\,b^*\,b^*$ |
| $16$ | $b\,b^*\,H\,b^*$ |
| $17$ | $b\,b^*\,b^*\,H$ |
| $18$ | $H\,b^*\,b\,b$ |
| $19$ | $b^*\,H\,b\,b$ |
| $20$ | $b^*\,b\,H\,b$ |
| $21$ | $b^*\,b\,b\,H$ |
| $22$ | $H\,b^*\,b\,b^*$ |
| $23$ | $b^*\,H\,b\,b^*$ |
| $24$ | $b^*\,b\,H\,b^*$ |
| $25$ | $b^*\,b\,b^*\,H$ |
| $26$ | $H\,b^*\,b^*\,b$ |
| $27$ | $b^*\,H\,b^*\,b$ |
| $28$ | $b^*\,b^*\,H\,b$ |
| $29$ | $b^*\,b^*\,b\,H$ |
| $30$ | $H\,b^*\,b^*\,b^*$ |
| $31$ | $b^*\,H\,b^*\,b^*$ |
| $32$ | $b^*\,b^*\,H\,b^*$ |
| $33$ | $b^*\,b^*\,b^*\,H$ |

**Gram $Q^{(0)}$.** The denominator is $24000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/24000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="neutral-block-00-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:807401745504\quad 6:-40137926664\quad 7:76661873568\quad 8:34285281384\quad 9:37590956928$ |
| $0$ | $10:-93029522568\quad 11:88827363072\quad 12:-88827363072\quad 13:93029522568\quad 18:-37590956928$ |
| $0$ | $19:-34285281384\quad 20:-76661873568\quad 21:40137926664$ |
| $1$ | $1:807401745456\quad 14:-37590956928\quad 15:-34285281384\quad 16:-76661873568\quad 17:40137926664$ |
| $1$ | $22:-93029522568\quad 23:88827363072\quad 24:-88827363072\quad 25:93029522568\quad 26:-40137926664$ |
| $1$ | $27:76661873568\quad 28:34285281384\quad 29:37590956928$ |
| $2$ | $2:35188379960\quad 3:-911798874\quad 4:-6894237512\quad 5:-16389481904$ |
| $3$ | $3:29089250400\quad 4:-9831727576\quad 5:-6894237512$ |
| $4$ | $4:29089250400\quad 5:-911798874$ |
| $5$ | $5:35188379960$ |
| $6$ | $6:35052342946\quad 7:1240874674\quad 8:6513177736\quad 9:-6370923012\quad 10:8724582538$ |
| $6$ | $11:-30228387960\quad 12:-1265080310\quad 13:-14056136900\quad 18:-1292097762\quad 19:15876830448$ |
| $6$ | $20:21675470568\quad 21:7409852952$ |
| $7$ | $7:49743164148\quad 8:-570240692\quad 9:1980803314\quad 10:-28577616216\quad 11:7377476986$ |
| $7$ | $12:-19468969896\quad 13:33812388702\quad 18:-5031530044\quad 19:-4946273952\quad 20:-19429385640$ |
| $7$ | $21:21675470568$ |
| $8$ | $8:47459219468\quad 9:-4372238256\quad 10:-11158156208\quad 11:-8318111436\quad 12:-9434790744$ |
| $8$ | $13:4317517138\quad 18:4205896416\quad 19:1512908832\quad 20:-4946273952\quad 21:15876830448$ |
| $9$ | $9:14274469998\quad 10:2675096808\quad 11:19579358040\quad 12:1142952792\quad 13:7372552096$ |
| $9$ | $18:-1485103200\quad 19:4205896416\quad 20:-5031530016\quad 21:-1292097762$ |
| $10$ | $10:46304961328\quad 11:-7470352324\quad 12:28073410425\quad 13:-31126306344\quad 18:7372552096$ |
| $10$ | $19:4317517128\quad 20:33812388768\quad 21:-14056137000$ |
| $11$ | $11:61293733122\quad 12:-7538432520\quad 13:28073410440\quad 18:1142952840\quad 19:-9434790744$ |
| $11$ | $20:-19468969896\quad 21:-1265080272$ |
| $12$ | $12:61293733152\quad 13:-7470352344\quad 18:19579358040\quad 19:-8318111520\quad 20:7377476976$ |
| $12$ | $21:-30228388008$ |
| $13$ | $13:46304961328\quad 18:2675096808\quad 19:-11158156200\quad 20:-28577616264\quad 21:8724582538$ |
| $14$ | $14:14274469944\quad 15:-4372238304\quad 16:1980803304\quad 17:-6370923096\quad 22:7372552104$ |
| $14$ | $23:1142952792\quad 24:19579358040\quad 25:2675096808\quad 26:-1292097744\quad 27:-5031530016$ |
| $14$ | $28:4205896416\quad 29:-1485103200$ |
| $15$ | $15:47459219544\quad 16:-570240792\quad 17:6513177744\quad 22:4317517128\quad 23:-9434790744$ |
| $15$ | $24:-8318111520\quad 25:-11158156200\quad 26:15876830448\quad 27:-4946273952\quad 28:1512908832$ |
| $15$ | $29:4205896416$ |
| $16$ | $16:49743164280\quad 17:1240874664\quad 22:33812388768\quad 23:-19468969896\quad 24:7377476976$ |
| $16$ | $25:-28577616264\quad 26:21675470568\quad 27:-19429385640\quad 28:-4946273952\quad 29:-5031530016$ |
| $17$ | $17:35052342936\quad 22:-14056137000\quad 23:-1265080272\quad 24:-30228388008\quad 25:8724582504$ |
| $17$ | $26:7409852952\quad 27:21675470568\quad 28:15876830448\quad 29:-1292097744$ |
| $18$ | $18:14274469998\quad 19:-4372238304\quad 20:1980803304\quad 21:-6370923096$ |
| $19$ | $19:47459219544\quad 20:-570240792\quad 21:6513177744$ |
| $20$ | $20:49743164280\quad 21:1240874664$ |
| $21$ | $21:35052342946$ |
| $22$ | $22:46304961360\quad 23:-7470352344\quad 24:28073410440\quad 25:-31126306440\quad 26:8724582504$ |
| $22$ | $27:-28577616264\quad 28:-11158156200\quad 29:2675096808$ |
| $23$ | $23:61293733152\quad 24:-7538432520\quad 25:28073410440\quad 26:-30228388008\quad 27:7377476976$ |
| $23$ | $28:-8318111520\quad 29:19579358040$ |
| $24$ | $24:61293733152\quad 25:-7470352344\quad 26:-1265080272\quad 27:-19468969896\quad 28:-9434790744$ |
| $24$ | $29:1142952792$ |
| $25$ | $25:46304961360\quad 26:-14056137000\quad 27:33812388768\quad 28:4317517128\quad 29:7372552104$ |
| $26$ | $26:35052342936\quad 27:1240874664\quad 28:6513177744\quad 29:-6370923096$ |
| $27$ | $27:49743164280\quad 28:-570240792\quad 29:1980803304$ |
| $28$ | $28:47459219544\quad 29:-4372238304$ |
| $29$ | $29:14274469944$ |
| $30$ | $30:35188379976\quad 31:-911798808\quad 32:-6894237552\quad 33:-16389481896$ |
| $31$ | $31:29089250328\quad 32:-9831727704\quad 33:-6894237552$ |
| $32$ | $32:29089250328\quad 33:-911798808$ |
| $33$ | $33:35188379976$ |

**Lower-triangular rational factor $R^{(0)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="neutral-block-00-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:183416573395$ |
| $1$ | $1:183416573390$ |
| $2$ | $2:38289456752$ |
| $3$ | $2:-992221436\quad 3:34798959706$ |
| $4$ | $2:-7502323634\quad 3:-11985969854\quad 4:31812006644$ |
| $5$ | $2:-17835068378\quad 3:-8763372126\quad 4:-8702173113\quad 5:31551043190$ |
| $6$ | $0:-9118116101\quad 6:37111645722$ |
| $7$ | $0:17415245923\quad 6:5672002455\quad 7:41678164992$ |
| $8$ | $0:7788573107\quad 6:9226201449\quad 7:-5080141657\quad 8:42494411096$ |
| $9$ | $0:8539522045\quad 6:-5054768346\quad 7:-900081532\quad 8:-4862369217\quad 9:21719638171$ |
| $10$ | $0:-21133477936\quad 6:4603050166\quad 7:-20365527262\quad 8:-10501427304\quad 9:11317272702$ |
| $10$ | $10:28431427869$ |
| $11$ | $0:20178875112\quad 6:-28980736856\quad 7:2887689814\quad 8:-5217171509\quad 9:21834114511$ |
| $11$ | $10:193583930\quad 11:28185311335$ |
| $12$ | $0:-20178875112\quad 6:-6378186713\quad 7:-10163833169\quad 8:-5382799946\quad 9:7015737789$ |
| $12$ | $10:15114148196\quad 11:-8749244367\quad 12:40242414342$ |
| $13$ | $0:21133477936\quad 6:-10588990538\quad 7:26413485199\quad 8:5816701760\quad 9:5766772750$ |
| $13$ | $10:-9419850602\quad 11:9451121727\quad 12:13220479084\quad 13:15903538482$ |
| $14$ | $1:-8539522046\quad 14:22841763159$ |
| $15$ | $1:-7788573108\quad 14:-10887394551\quad 15:42404837576$ |
| $16$ | $1:-17415245923\quad 14:-2897517369\quad 15:-4502938221\quad 16:41720126976$ |
| $17$ | $1:9118116101\quad 14:-8212622390\quad 15:5965957520\quad 16:5119003293\quad 17:35327471427$ |
| $18$ | $0:-8539522045\quad 6:-3548798703\quad 7:-978939781\quad 8:6342602422\quad 9:1061929779$ |
| $18$ | $10:6250363990\quad 11:4563200797\quad 12:14488452908\quad 13:3860781618\quad 18:13495436151$ |
| $19$ | $0:-7788573107\quad 6:15911918662\quad 7:-3855910492\quad 8:-1004729760\quad 9:14449201924$ |
| $19$ | $10:-10922798442\quad 11:-2919631915\quad 12:-10155705702\quad 13:-3049600242\quad 18:2633735189$ |
| $19$ | $19:34520323482$ |
| $20$ | $0:-17415245923\quad 6:20057056438\quad 7:-14876629476\quad 8:-7791157747\quad 9:-498125175$ |
| $20$ | $10:20024668504\quad 11:4640439127\quad 12:-9139613841\quad 13:6063546032\quad 18:225856439$ |
| $20$ | $19:-10984501327\quad 20:20522200980$ |
| $21$ | $0:9118116101\quad 6:10559594074\quad 7:16422419974\quad 8:13566978597\quad 9:111591071$ |
| $21$ | $10:1198665220\quad 11:3193495960\quad 12:-18865362408\quad 13:-10781842\quad 18:2304341174$ |
| $21$ | $19:2156465382\quad 20:7833452317\quad 21:19316765940$ |
| $22$ | $1:-21133477937\quad 14:5547727177\quad 15:1785107739\quad 16:25525274236\quad 17:-13834200445$ |
| $22$ | $22:24612210121$ |
| $23$ | $1:20178875113\quad 14:9628896874\quad 15:-3092053763\quad 16:-10685740191\quad 17:-2391314916$ |
| $23$ | $22:12471891171\quad 23:42058181081$ |
| $24$ | $1:-20178875113\quad 14:28171583412\quad 15:-4646580239\quad 16:399787612\quad 17:-23168527069$ |
| $24$ | $22:10749106773\quad 23:-8981273073\quad 24:24459000148$ |
| $25$ | $1:21133477937\quad 14:12780631937\quad 15:-3800881309\quad 16:-19241847626\quad 17:11236701392$ |
| $25$ | $22:-10881582906\quad 23:13444012963\quad 24:9943804394\quad 25:20256270972$ |
| $26$ | $1:-9118116101\quad 14:-5765831584\quad 15:12445339611\quad 16:18784323726\quad 17:4928910199$ |
| $26$ | $22:-9372979003\quad 23:-15505017424\quad 24:2115298098\quad 25:5899529090\quad 26:21082237833$ |
| $27$ | $1:17415245923\quad 14:-2667447652\quad 15:-2346345197\quad 16:-12573340635\quad 17:22668047499$ |
| $27$ | $22:-6873428405\quad 23:-476007411\quad 24:8351802457\quad 25:20630001317\quad 26:6526462582$ |
| $27$ | $27:22344491401$ |
| $28$ | $1:7788573108\quad 14:10583962983\quad 15:5634534492\quad 16:-345532377\quad 17:18274530879$ |
| $28$ | $22:-4366344788\quad 23:-11740349910\quad 24:-5843010538\quad 25:-7016312632\quad 26:3818897465$ |
| $28$ | $27:-18058929003\quad 28:29289595330$ |
| $29$ | $1:8539522046\quad 14:483506317\quad 15:5825290554\quad 16:-798111571\quad 17:-4483728908$ |
| $29$ | $22:9637259168\quad 23:12302002457\quad 24:5589800019\quad 25:3041193999\quad 26:1475084815$ |
| $29$ | $27:-294437506\quad 28:839649092\quad 29:13385037007$ |
| $30$ | $30:38289456760$ |
| $31$ | $30:-992221364\quad 31:34798959665$ |
| $32$ | $30:-7502323676\quad 31:-11985970007\quad 32:31812006530$ |
| $33$ | $30:-17835068366\quad 31:-8763372146\quad 32:-8702173128\quad 33:31551043198$ |

**Neutral block 1: free; dimension $92$.**

<a id="neutral-block-01-basis"></a>

| Index $i$ | Basis polynomial $v_i$ |
|:--|:--|
| $0$ | $H\,b\,b$ |
| $1$ | $b\,H\,b$ |
| $2$ | $b\,b\,H$ |
| $3$ | $H\,b\,b^*$ |
| $4$ | $b\,H\,b^*$ |
| $5$ | $b\,b^*\,H$ |
| $6$ | $H\,b^*\,b$ |
| $7$ | $b^*\,H\,b$ |
| $8$ | $b^*\,b\,H$ |
| $9$ | $H\,b^*\,b^*$ |
| $10$ | $b^*\,H\,b^*$ |
| $11$ | $b^*\,b^*\,H$ |
| $12$ | $H\,b\,b\,b\,b$ |
| $13$ | $b\,H\,b\,b\,b$ |
| $14$ | $b\,b\,H\,b\,b$ |
| $15$ | $b\,b\,b\,H\,b$ |
| $16$ | $b\,b\,b\,b\,H$ |
| $17$ | $H\,b\,b\,b\,b^*$ |
| $18$ | $b\,H\,b\,b\,b^*$ |
| $19$ | $b\,b\,H\,b\,b^*$ |
| $20$ | $b\,b\,b\,H\,b^*$ |
| $21$ | $b\,b\,b\,b^*\,H$ |
| $22$ | $H\,b\,b\,b^*\,b$ |
| $23$ | $b\,H\,b\,b^*\,b$ |
| $24$ | $b\,b\,H\,b^*\,b$ |
| $25$ | $b\,b\,b^*\,H\,b$ |
| $26$ | $b\,b\,b^*\,b\,H$ |
| $27$ | $H\,b\,b\,b^*\,b^*$ |
| $28$ | $b\,H\,b\,b^*\,b^*$ |
| $29$ | $b\,b\,H\,b^*\,b^*$ |
| $30$ | $b\,b\,b^*\,H\,b^*$ |
| $31$ | $b\,b\,b^*\,b^*\,H$ |
| $32$ | $H\,b\,b^*\,b\,b$ |
| $33$ | $b\,H\,b^*\,b\,b$ |
| $34$ | $b\,b^*\,H\,b\,b$ |
| $35$ | $b\,b^*\,b\,H\,b$ |
| $36$ | $b\,b^*\,b\,b\,H$ |
| $37$ | $H\,b\,b^*\,b\,b^*$ |
| $38$ | $b\,H\,b^*\,b\,b^*$ |
| $39$ | $b\,b^*\,H\,b\,b^*$ |
| $40$ | $b\,b^*\,b\,H\,b^*$ |
| $41$ | $b\,b^*\,b\,b^*\,H$ |
| $42$ | $H\,b\,b^*\,b^*\,b$ |
| $43$ | $b\,H\,b^*\,b^*\,b$ |
| $44$ | $b\,b^*\,H\,b^*\,b$ |
| $45$ | $b\,b^*\,b^*\,H\,b$ |
| $46$ | $b\,b^*\,b^*\,b\,H$ |
| $47$ | $H\,b\,b^*\,b^*\,b^*$ |
| $48$ | $b\,H\,b^*\,b^*\,b^*$ |
| $49$ | $b\,b^*\,H\,b^*\,b^*$ |
| $50$ | $b\,b^*\,b^*\,H\,b^*$ |
| $51$ | $b\,b^*\,b^*\,b^*\,H$ |
| $52$ | $H\,b^*\,b\,b\,b$ |
| $53$ | $b^*\,H\,b\,b\,b$ |
| $54$ | $b^*\,b\,H\,b\,b$ |
| $55$ | $b^*\,b\,b\,H\,b$ |
| $56$ | $b^*\,b\,b\,b\,H$ |
| $57$ | $H\,b^*\,b\,b\,b^*$ |
| $58$ | $b^*\,H\,b\,b\,b^*$ |
| $59$ | $b^*\,b\,H\,b\,b^*$ |
| $60$ | $b^*\,b\,b\,H\,b^*$ |
| $61$ | $b^*\,b\,b\,b^*\,H$ |
| $62$ | $H\,b^*\,b\,b^*\,b$ |
| $63$ | $b^*\,H\,b\,b^*\,b$ |
| $64$ | $b^*\,b\,H\,b^*\,b$ |
| $65$ | $b^*\,b\,b^*\,H\,b$ |
| $66$ | $b^*\,b\,b^*\,b\,H$ |
| $67$ | $H\,b^*\,b\,b^*\,b^*$ |
| $68$ | $b^*\,H\,b\,b^*\,b^*$ |
| $69$ | $b^*\,b\,H\,b^*\,b^*$ |
| $70$ | $b^*\,b\,b^*\,H\,b^*$ |
| $71$ | $b^*\,b\,b^*\,b^*\,H$ |
| $72$ | $H\,b^*\,b^*\,b\,b$ |
| $73$ | $b^*\,H\,b^*\,b\,b$ |
| $74$ | $b^*\,b^*\,H\,b\,b$ |
| $75$ | $b^*\,b^*\,b\,H\,b$ |
| $76$ | $b^*\,b^*\,b\,b\,H$ |
| $77$ | $H\,b^*\,b^*\,b\,b^*$ |
| $78$ | $b^*\,H\,b^*\,b\,b^*$ |
| $79$ | $b^*\,b^*\,H\,b\,b^*$ |
| $80$ | $b^*\,b^*\,b\,H\,b^*$ |
| $81$ | $b^*\,b^*\,b\,b^*\,H$ |
| $82$ | $H\,b^*\,b^*\,b^*\,b$ |
| $83$ | $b^*\,H\,b^*\,b^*\,b$ |
| $84$ | $b^*\,b^*\,H\,b^*\,b$ |
| $85$ | $b^*\,b^*\,b^*\,H\,b$ |
| $86$ | $b^*\,b^*\,b^*\,b\,H$ |
| $87$ | $H\,b^*\,b^*\,b^*\,b^*$ |
| $88$ | $b^*\,H\,b^*\,b^*\,b^*$ |
| $89$ | $b^*\,b^*\,H\,b^*\,b^*$ |
| $90$ | $b^*\,b^*\,b^*\,H\,b^*$ |
| $91$ | $b^*\,b^*\,b^*\,b^*\,H$ |

**Gram $Q^{(1)}$.** The denominator is $1536000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1536000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="neutral-block-01-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:10905861946752\quad 1:5981631762560\quad 2:5637476819456\quad 17:30053242368\quad 18:-1669406550528$ |
| $0$ | $19:-2015996792832\quad 20:-2512933985280\quad 21:-1685413791744\quad 22:-948257342976\quad 23:-2000918031360$ |
| $0$ | $24:-2559605291520\quad 25:-2394571788288\quad 26:-2405436887040\quad 32:-1201644155904\quad 33:-3498211398144$ |
| $0$ | $34:-1158618975744\quad 35:-2392322376192\quad 36:-2567318957568\quad 52:-1977639533568\quad 53:-959314741248$ |
| $0$ | $54:680952900096\quad 55:-1517068921344\quad 56:-1486859380224$ |
| $1$ | $1:10696041635072\quad 2:5981631762560\quad 17:-2051541765120\quad 18:-233204158464\quad 19:-2087132187648$ |
| $1$ | $20:-2167974661632\quad 21:-2377679204352\quad 22:-2224055150592\quad 23:584318622720\quad 24:-2378096345088$ |
| $1$ | $25:-1438729996800\quad 26:-3063439664640\quad 32:-3063439664640\quad 33:-1438729996800\quad 34:-2378096345088$ |
| $1$ | $35:584318622720\quad 36:-2224055150592\quad 52:-2377679204352\quad 53:-2167974661632\quad 54:-2087132187648$ |
| $1$ | $55:-233204158464\quad 56:-2051541765120$ |
| $2$ | $2:10905861946752\quad 17:-1486859380224\quad 18:-1517068921344\quad 19:680952900096\quad 20:-959314741248$ |
| $2$ | $21:-1977639533568\quad 22:-2567318957568\quad 23:-2392322376192\quad 24:-1158618975744\quad 25:-3498211398144$ |
| $2$ | $26:-1201644155904\quad 32:-2405436887040\quad 33:-2394571788288\quad 34:-2559605291520\quad 35:-2000918031360$ |
| $2$ | $36:-948257342976\quad 52:-1685413791744\quad 53:-2512933985280\quad 54:-2015996792832\quad 55:-1669406550528$ |
| $2$ | $56:30053242368$ |
| $3$ | $3:9408545675520\quad 4:1699570150912\quad 5:4266356041600\quad 6:4585239697408\quad 7:3570037301760$ |
| $3$ | $8:6170951579136\quad 27:-865019684352\quad 28:-2669597554176\quad 29:-2244147483648\quad 30:-1902129810432$ |
| $3$ | $31:-1307439043584\quad 37:604842387456\quad 38:-2977368637440\quad 39:-463342751232\quad 40:-3162906103296$ |
| $3$ | $41:-878085055488\quad 42:-2379735140352\quad 43:-3430891507200\quad 44:-1560889763328\quad 45:-2938702437888$ |
| $3$ | $46:-2081843324928\quad 57:-1844183040000\quad 58:-1450994158080\quad 59:787100780544\quad 60:-2037043666944$ |
| $3$ | $61:-954531397632\quad 62:-1007726642688\quad 63:-1878988193280\quad 64:-522300470784\quad 65:-1105809856512$ |
| $3$ | $66:509908563456\quad 72:-2310178444800\quad 73:-1722416110080\quad 74:-2118114505728\quad 75:-1912241633280$ |
| $3$ | $76:-897078461952$ |
| $4$ | $4:9526156005632\quad 5:1699570154496\quad 6:3570037301760\quad 7:3934146544128\quad 8:3570037301760$ |
| $4$ | $27:-2684263105536\quad 28:42857805312\quad 29:-1070647844352\quad 30:42857805312\quad 31:-2684263105536$ |
| $4$ | $37:-2379848222208\quad 38:1598012101632\quad 39:-2439807959040\quad 40:1598012101632\quad 41:-2379848222208$ |
| $4$ | $42:-1633323345408\quad 43:231498729984\quad 44:-1686601731072\quad 45:-1311468870144\quad 46:-1718000535552$ |
| $4$ | $57:-1718000535552\quad 58:-1311468870144\quad 59:-1686601731072\quad 60:231498729984\quad 61:-1633323345408$ |
| $4$ | $62:-1563129661440\quad 63:-1366017400320\quad 64:-1773974373888\quad 65:-1366017400320\quad 66:-1563129661440$ |
| $4$ | $72:-1113444807168\quad 73:-688953311232\quad 74:-1699553958912\quad 75:-688953311232\quad 76:-1113444807168$ |
| $5$ | $5:9408545679360\quad 6:6170951579136\quad 7:3570037301760\quad 8:4585239699456\quad 27:-1307439043584$ |
| $5$ | $28:-1902129810432\quad 29:-2244147483648\quad 30:-2669597554176\quad 31:-865019684352\quad 37:-878085055488$ |
| $5$ | $38:-3162906103296\quad 39:-463342751232\quad 40:-2977368637440\quad 41:604842387456\quad 42:-954531397632$ |
| $5$ | $43:-2037043666944\quad 44:787100780544\quad 45:-1450994158080\quad 46:-1844183040000\quad 57:-2081843324928$ |
| $5$ | $58:-2938702437888\quad 59:-1560889763328\quad 60:-3430891507200\quad 61:-2379735140352\quad 62:509908563456$ |
| $5$ | $63:-1105809856512\quad 64:-522300470784\quad 65:-1878988193280\quad 66:-1007726642688\quad 72:-897078461952$ |
| $5$ | $73:-1912241633280\quad 74:-2118114505728\quad 75:-1722416110080\quad 76:-2310178444800$ |
| $6$ | $6:9408545675520\quad 7:1699570154496\quad 8:4266356038656\quad 27:-2310178444800\quad 28:-1722416110080$ |
| $6$ | $29:-2118114505728\quad 30:-1912241633280\quad 31:-897078461952\quad 37:-1007726642688\quad 38:-1878988193280$ |
| $6$ | $39:-522300470784\quad 40:-1105809856512\quad 41:509908563456\quad 42:-1844183040000\quad 43:-1450994158080$ |
| $6$ | $44:787100780544\quad 45:-2037043666944\quad 46:-954531397632\quad 57:-2379735140352\quad 58:-3430891507200$ |
| $6$ | $59:-1560889763328\quad 60:-2938702437888\quad 61:-2081843324928\quad 62:604842387456\quad 63:-2977368637440$ |
| $6$ | $64:-463342751232\quad 65:-3162906103296\quad 66:-878085055488\quad 72:-865019684352\quad 73:-2669597554176$ |
| $6$ | $74:-2244147483648\quad 75:-1902129810432\quad 76:-1307439043584$ |
| $7$ | $7:9526155999744\quad 8:1699570154496\quad 27:-1113444807168\quad 28:-688953311232\quad 29:-1699553958912$ |
| $7$ | $30:-688953311232\quad 31:-1113444807168\quad 37:-1563129661440\quad 38:-1366017400320\quad 39:-1773974373888$ |
| $7$ | $40:-1366017400320\quad 41:-1563129661440\quad 42:-1718000535552\quad 43:-1311468870144\quad 44:-1686601731072$ |
| $7$ | $45:231498729984\quad 46:-1633323345408\quad 57:-1633323345408\quad 58:231498729984\quad 59:-1686601731072$ |
| $7$ | $60:-1311468870144\quad 61:-1718000535552\quad 62:-2379848222208\quad 63:1598012101632\quad 64:-2439807959040$ |
| $7$ | $65:1598012101632\quad 66:-2379848222208\quad 72:-2684263105536\quad 73:42857805312\quad 74:-1070647844352$ |
| $7$ | $75:42857805312\quad 76:-2684263105536$ |
| $8$ | $8:9408545679360\quad 27:-897078461952\quad 28:-1912241633280\quad 29:-2118114505728\quad 30:-1722416110080$ |
| $8$ | $31:-2310178444800\quad 37:509908563456\quad 38:-1105809856512\quad 39:-522300470784\quad 40:-1878988193280$ |
| $8$ | $41:-1007726642688\quad 42:-2081843324928\quad 43:-2938702437888\quad 44:-1560889763328\quad 45:-3430891507200$ |
| $8$ | $46:-2379735140352\quad 57:-954531397632\quad 58:-2037043666944\quad 59:787100780544\quad 60:-1450994158080$ |
| $8$ | $61:-1844183040000\quad 62:-878085055488\quad 63:-3162906103296\quad 64:-463342751232\quad 65:-2977368637440$ |
| $8$ | $66:604842387456\quad 72:-1307439043584\quad 73:-1902129810432\quad 74:-2244147483648\quad 75:-2669597554176$ |
| $8$ | $76:-865019684352$ |
| $9$ | $9:10905861947904\quad 10:5981631763968\quad 11:5637476812800\quad 47:-1977639533568\quad 48:-959314741248$ |
| $9$ | $49:680952900096\quad 50:-1517068921344\quad 51:-1486859380224\quad 67:-1201644155904\quad 68:-3498211398144$ |
| $9$ | $69:-1158618975744\quad 70:-2392322376192\quad 71:-2567318957568\quad 77:-948257342976\quad 78:-2000918031360$ |
| $9$ | $79:-2559605291520\quad 80:-2394571788288\quad 81:-2405436887040\quad 82:30053242368\quad 83:-1669406550528$ |
| $9$ | $84:-2015996792832\quad 85:-2512933985280\quad 86:-1685413791744$ |
| $10$ | $10:10696041635328\quad 11:5981631763968\quad 47:-2377679204352\quad 48:-2167974661632\quad 49:-2087132187648$ |
| $10$ | $50:-233204158464\quad 51:-2051541765120\quad 67:-3063439664640\quad 68:-1438729996800\quad 69:-2378096345088$ |
| $10$ | $70:584318622720\quad 71:-2224055150592\quad 77:-2224055150592\quad 78:584318622720\quad 79:-2378096345088$ |
| $10$ | $80:-1438729996800\quad 81:-3063439664640\quad 82:-2051541765120\quad 83:-233204158464\quad 84:-2087132187648$ |
| $10$ | $85:-2167974661632\quad 86:-2377679204352$ |
| $11$ | $11:10905861947904\quad 47:-1685413791744\quad 48:-2512933985280\quad 49:-2015996792832\quad 50:-1669406550528$ |
| $11$ | $51:30053242368\quad 67:-2405436887040\quad 68:-2394571788288\quad 69:-2559605291520\quad 70:-2000918031360$ |
| $11$ | $71:-948257342976\quad 77:-2567318957568\quad 78:-2392322376192\quad 79:-1158618975744\quad 80:-3498211398144$ |
| $11$ | $81:-1201644155904\quad 82:-1486859380224\quad 83:-1517068921344\quad 84:680952900096\quad 85:-959314741248$ |
| $11$ | $86:-1977639533568$ |
| $12$ | $12:1531612637355\quad 13:-59478232491\quad 14:-214192635306\quad 15:-362266772523\quad 16:-546265710933$ |
| $13$ | $13:910775712267\quad 14:53262102090\quad 15:-188951865333\quad 16:-362266772523$ |
| $14$ | $14:669273923340\quad 15:53262102090\quad 16:-214192635306$ |
| $15$ | $15:910775712267\quad 16:-59478232491$ |
| $16$ | $16:1531612637355$ |
| $17$ | $17:2139899003952\quad 18:509028047568\quad 19:426909869232\quad 20:183439122048\quad 21:148544739456$ |
| $17$ | $22:344627049264\quad 23:-198947717040\quad 24:36506105904\quad 25:302366479104\quad 26:610129449216$ |
| $17$ | $32:376255113216\quad 33:474511093248\quad 34:1180633375344\quad 35:-140529302880\quad 36:447740577888$ |
| $17$ | $52:243147620352\quad 53:685613581824\quad 54:876866585088\quad 55:60410770944\quad 56:105610911744$ |
| $18$ | $18:2133141079056\quad 19:346833647472\quad 20:209892162144\quad 21:22574208\quad 22:131115679440$ |
| $18$ | $23:711849909936\quad 24:-77963505456\quad 25:404971483056\quad 26:235823670864\quad 32:253332183552$ |
| $18$ | $33:634157326080\quad 34:531822420480\quad 35:1059725599944\quad 36:663571230576\quad 52:130070555136$ |
| $18$ | $53:227275689984\quad 54:-117115327488\quad 55:495625156608\quad 56:60410770944$ |
| $19$ | $19:2415618446736\quad 20:944479057056\quad 21:94990143744\quad 22:-158973142608\quad 23:-629282408880$ |
| $19$ | $24:647210574768\quad 25:-479974148400\quad 26:1185113834160\quad 32:319041436800\quad 33:675974130816$ |
| $19$ | $34:283082505216\quad 35:-72066605568\quad 36:1538140927752\quad 52:509581463040\quad 53:78078242304$ |
| $19$ | $54:-179420719104\quad 55:-117115327488\quad 56:876866585088$ |
| $20$ | $20:2098587878112\quad 21:457538237952\quad 22:379230111744\quad 23:-102731645184\quad 24:650450787072$ |
| $20$ | $25:469065687600\quad 26:1094356667472\quad 32:742535819904\quad 33:896859595392\quad 34:565263267840$ |
| $20$ | $35:315151086768\quad 36:1249575409872\quad 52:827791088640\quad 53:555550937088\quad 54:78078242304$ |
| $20$ | $55:227275689984\quad 56:685613581824$ |
| $21$ | $21:1734733907712\quad 22:665943140352\quad 23:478332902400\quad 24:1028371433856\quad 25:826273295616$ |
| $21$ | $26:1089019453056\quad 32:1124540599296\quad 33:888727041024\quad 34:781639317504\quad 35:380693422848$ |
| $21$ | $36:776294029056\quad 52:1014864818688\quad 53:827791088640\quad 54:509581463040\quad 55:130070555136$ |
| $21$ | $56:243147620352$ |
| $22$ | $22:2423496909744\quad 23:712947330768\quad 24:873325739184\quad 25:1054057440768\quad 26:585185701248$ |
| $22$ | $32:988501597824\quad 33:-373845726720\quad 34:894771855600\quad 35:71527846944\quad 36:49010277984$ |
| $22$ | $52:776294029056\quad 53:1249575407616\quad 54:1538140927488\quad 55:663571233792\quad 56:447740579328$ |
| $23$ | $23:2666604602544\quad 24:535710420048\quad 25:1260669580416\quad 26:-190526411136\quad 32:33181102080$ |
| $23$ | $33:752252284416\quad 34:105217128960\quad 35:1949099025456\quad 36:71527846944\quad 52:380693422848$ |
| $23$ | $53:315151091712\quad 54:-72066605568\quad 55:1059725600256\quad 56:-140529303552$ |
| $24$ | $24:2359153018032\quad 25:877011264384\quad 26:1094275376640\quad 32:428816879616\quad 33:814169016192$ |
| $24$ | $34:387042264576\quad 35:105217128960\quad 36:894771855600\quad 52:781639315584\quad 53:565263267840$ |
| $24$ | $54:283082505216\quad 55:531822420480\quad 56:1180633374720$ |
| $25$ | $25:3404058558720\quad 26:685947656832\quad 32:959154897792\quad 33:1487248485888\quad 34:814169017344$ |
| $25$ | $35:752252284416\quad 36:-373845726720\quad 52:888727041024\quad 53:896859594240\quad 54:675974132736$ |
| $25$ | $55:634157325312\quad 56:474511091712$ |
| $26$ | $26:2849026960896\quad 32:511508238336\quad 33:959154898944\quad 34:428816882688\quad 35:33181102080$ |
| $26$ | $36:988501597824\quad 52:1124540599296\quad 53:742535818752\quad 54:319041438720\quad 55:253332183552$ |
| $26$ | $56:376255113216$ |
| $27$ | $27:2894998636800\quad 28:830919322752\quad 29:1137350105856\quad 30:684869144832\quad 31:941792319360$ |
| $27$ | $37:984391865088\quad 38:273941618304\quad 39:53221413888\quad 40:-232336440960\quad 41:279190459992$ |
| $27$ | $42:543749713920\quad 43:397627198464\quad 44:-139377312384\quad 45:563033892864\quad 46:450612616704$ |
| $27$ | $57:942294714240\quad 58:1420414213632\quad 59:999495869952\quad 60:753158054400\quad 61:841452458496$ |
| $27$ | $62:247089116160\quad 63:773576934912\quad 64:767497324032\quad 65:1403990845440\quad 66:914844794880$ |
| $27$ | $72:368972391936\quad 73:678918766080\quad 74:984620038656\quad 75:728767497216\quad 76:869318227968$ |
| $28$ | $28:2705491228800\quad 29:1276681303296\quad 30:777554320128\quad 31:684869145600\quad 37:-490996908288$ |
| $28$ | $38:1465121529600\quad 39:-274204313472\quad 40:1396054483584\quad 41:67994890320\quad 42:720936474624$ |
| $28$ | $43:1135246817280\quad 44:292332791808\quad 45:1016338816512\quad 46:716589047808\quad 57:734404221696$ |
| $28$ | $58:1115329886208\quad 59:-284882772480\quad 60:934768167936\quad 61:651049892352\quad 62:297458517504$ |
| $28$ | $63:826035210240\quad 64:297806684160\quad 65:940517167104\quad 66:148780832256\quad 72:678918766080$ |
| $28$ | $73:434294696448\quad 74:851674960896\quad 75:723607640064\quad 76:728767497216$ |
| $29$ | $29:2690211555072\quad 30:1276681304064\quad 31:1137350109696\quad 37:-59443192656\quad 38:698295198720$ |
| $29$ | $39:-171735645312\quad 40:698295197184\quad 41:-59443189248\quad 42:1041454015488\quad 43:1141313895936$ |
| $29$ | $44:327651995136\quad 45:1149325036032\quad 46:1033125671856\quad 57:1033125671424\quad 58:1149325036032$ |
| $29$ | $59:327651995136\quad 60:1141313895936\quad 61:1041454015488\quad 62:346440955392\quad 63:1061276851200$ |
| $29$ | $64:911971150848\quad 65:1061276851200\quad 66:346440955392\quad 72:984620038656\quad 73:851674960896$ |
| $29$ | $74:1385720816640\quad 75:851674960896\quad 76:984620038656$ |
| $30$ | $30:2705491230720\quad 31:830919324672\quad 37:67994887680\quad 38:1396054483968\quad 39:-274204311552$ |
| $30$ | $40:1465121527296\quad 41:-490996909056\quad 42:651049892352\quad 43:934768167936\quad 44:-284882772480$ |
| $30$ | $45:1115329886208\quad 46:734404220928\quad 57:716589047808\quad 58:1016338816512\quad 59:292332791808$ |
| $30$ | $60:1135246817280\quad 61:720936474624\quad 62:148780832256\quad 63:940517167104\quad 64:297806684160$ |
| $30$ | $65:826035210240\quad 66:297458517504\quad 72:728767497216\quad 73:723607640064\quad 74:851674960896$ |
| $30$ | $75:434294696448\quad 76:678918766080$ |
| $31$ | $31:2894998637568\quad 37:279190462464\quad 38:-232336441344\quad 39:53221413888\quad 40:273941621760$ |
| $31$ | $41:984391864320\quad 42:841452458496\quad 43:753158054400\quad 44:999495869952\quad 45:1420414213632$ |
| $31$ | $46:942294713856\quad 57:450612616704\quad 58:563033892864\quad 59:-139377312768\quad 60:397627198464$ |
| $31$ | $61:543749715456\quad 62:914844794880\quad 63:1403990845440\quad 64:767497324032\quad 65:773576934912$ |
| $31$ | $66:247089114624\quad 72:869318227968\quad 73:728767497216\quad 74:984620038656\quad 75:678918766080$ |
| $31$ | $76:368972391936$ |
| $32$ | $32:2849026960896\quad 33:685947656832\quad 34:1094275376640\quad 35:-190526409216\quad 36:585185702400$ |
| $32$ | $52:1089019453056\quad 53:1094356667904\quad 54:1185113836032\quad 55:235823672832\quad 56:610129451520$ |
| $33$ | $33:3404058558720\quad 34:877011264000\quad 35:1260669580800\quad 36:1054057439232\quad 52:826273295616$ |
| $33$ | $53:469065687552\quad 54:-479974147584\quad 55:404971479552\quad 56:302366481408$ |
| $34$ | $34:2359153022976\quad 35:535710417408\quad 36:873325742592\quad 52:1028371433472\quad 53:650450789376$ |
| $34$ | $54:647210571264\quad 55:-77963504640\quad 56:36506105856$ |
| $35$ | $35:2666604602544\quad 36:712947330768\quad 52:478332902400\quad 53:-102731642880\quad 54:-629282406912$ |
| $35$ | $55:711849911808\quad 56:-198947716608$ |
| $36$ | $36:2423496909744\quad 52:665943140352\quad 53:379230105600\quad 54:-158973143040\quad 55:131115679440$ |
| $36$ | $56:344627049264$ |
| $37$ | $37:2612595108480\quad 38:460351707648\quad 39:1902713412480\quad 40:-83577304320\quad 41:965274449856$ |
| $37$ | $42:260076799488\quad 43:-353884597632\quad 44:17184162048\quad 45:-188965071360\quad 46:718766994432$ |
| $37$ | $57:1067697676416\quad 58:745574863872\quad 59:1906948005888\quad 60:453212250624\quad 61:583798937088$ |
| $37$ | $62:-132458153472\quad 63:-310387286016\quad 64:164542267392\quad 65:156099855360\quad 66:1307178929664$ |
| $37$ | $72:247089116160\quad 73:297458517504\quad 74:346440955392\quad 75:148780832256\quad 76:914844794880$ |
| $38$ | $38:3834999803136\quad 39:586362117120\quad 40:2907536737728\quad 41:-83577303552\quad 42:327516051456$ |
| $38$ | $43:1402844404224\quad 44:-353322123264\quad 45:309746817024\quad 46:947075547648\quad 57:1072909499136$ |
| $38$ | $58:926695002624\quad 59:230225963520\quad 60:1830110094336\quad 61:437757912576\quad 62:-310387286016$ |
| $38$ | $63:-25634370048\quad 64:-360550963200\quad 65:189634853376\quad 66:156099855360\quad 72:773576934912$ |
| $38$ | $73:826035210240\quad 74:1061276851200\quad 75:940517167104\quad 76:1403990845440$ |
| $39$ | $39:3420239864832\quad 40:586362117120\quad 41:1902713412096\quad 42:732170201088\quad 43:175407748608$ |
| $39$ | $44:1001411395584\quad 45:450292902912\quad 46:1382541189120\quad 57:1382541189120\quad 58:450292902912$ |
| $39$ | $59:1001411395584\quad 60:175407748608\quad 61:732170201088\quad 62:164542267392\quad 63:-360550963200$ |
| $39$ | $64:29424087552\quad 65:-360550963200\quad 66:164542267392\quad 72:767497324032\quad 73:297806684160$ |
| $39$ | $74:911971150848\quad 75:297806684160\quad 76:767497324032$ |
| $40$ | $40:3834999802368\quad 41:460351709184\quad 42:437757912576\quad 43:1830110094336\quad 44:230225963520$ |
| $40$ | $45:926695002624\quad 46:1072909498368\quad 57:947075547648\quad 58:309746817024\quad 59:-353322123264$ |
| $40$ | $60:1402844404224\quad 61:327516051456\quad 62:156099855360\quad 63:189634853376\quad 64:-360550963200$ |
| $40$ | $65:-25634370048\quad 66:-310387286016\quad 72:1403990845440\quad 73:940517167104\quad 74:1061276851200$ |
| $40$ | $75:826035210240\quad 76:773576934912$ |
| $41$ | $41:2612595108864\quad 42:583798937088\quad 43:453212250624\quad 44:1906948005888\quad 45:745574863872$ |
| $41$ | $46:1067697675264\quad 57:718766994432\quad 58:-188965071360\quad 59:17184159744\quad 60:-353884594176$ |
| $41$ | $61:260076799488\quad 62:1307178929664\quad 63:156099855360\quad 64:164542267392\quad 65:-310387286016$ |
| $41$ | $66:-132458153472\quad 72:914844794880\quad 73:148780832256\quad 74:346440955392\quad 75:297458517504$ |
| $41$ | $76:247089114624$ |
| $42$ | $42:2302674802560\quad 43:931660927488\quad 44:862486517760\quad 45:1148261514240\quad 46:1042404057600$ |
| $42$ | $57:905393023488\quad 58:825747846144\quad 59:628004860416\quad 60:857475429888\quad 61:974597236224$ |
| $42$ | $62:1067697676416\quad 63:1072909498368\quad 64:1382541189120\quad 65:947075547648\quad 66:718766994432$ |
| $42$ | $72:942294714240\quad 73:734404220928\quad 74:1033125671424\quad 75:716589047808\quad 76:450612616704$ |
| $43$ | $43:3327471943680\quad 44:887872719360\quad 45:1353547243008\quad 46:1148261514240\quad 57:825747844224$ |
| $43$ | $58:877379105280\quad 59:-292506685440\quad 60:1185760730112\quad 61:857475429888\quad 62:745574863872$ |
| $43$ | $63:926695002624\quad 64:450292902912\quad 65:309746817024\quad 66:-188965071360\quad 72:1420414213632$ |
| $43$ | $73:1115329886208\quad 74:1149325036032\quad 75:1016338816512\quad 76:563033892864$ |
| $44$ | $44:3147323599872\quad 45:887872719360\quad 46:862486517760\quad 57:628004859456\quad 58:-292506685440$ |
| $44$ | $59:-870306740736\quad 60:-292506685440\quad 61:628004860416\quad 62:1906948005888\quad 63:230225963520$ |
| $44$ | $64:1001411395584\quad 65:-353322123264\quad 66:17184159744\quad 72:999495869952\quad 73:-284882772480$ |
| $44$ | $74:327651995136\quad 75:292332791808\quad 76:-139377312768$ |
| $45$ | $45:3327471943680\quad 46:931660927488\quad 57:857475429888\quad 58:1185760730112\quad 59:-292506685440$ |
| $45$ | $60:877379105280\quad 61:825747846144\quad 62:453212250624\quad 63:1830110094336\quad 64:175407748608$ |
| $45$ | $65:1402844404224\quad 66:-353884594176\quad 72:753158054400\quad 73:934768167936\quad 74:1141313895936$ |
| $45$ | $75:1135246817280\quad 76:397627198464$ |
| $46$ | $46:2302674802560\quad 57:974597236224\quad 58:857475429888\quad 59:628004860416\quad 60:825747846144$ |
| $46$ | $61:905393023488\quad 62:583798937088\quad 63:437757912576\quad 64:732170201088\quad 65:327516051456$ |
| $46$ | $66:260076799488\quad 72:841452458496\quad 73:651049892352\quad 74:1041454015488\quad 75:720936474624$ |
| $46$ | $76:543749713920$ |
| $47$ | $47:1734733908480\quad 48:457538236416\quad 49:94990142976\quad 50:22576128\quad 51:148544738304$ |
| $47$ | $67:1089019450368\quad 68:826273297920\quad 69:1028371433472\quad 70:478332902400\quad 71:665943140352$ |
| $47$ | $77:776294029824\quad 78:380693419008\quad 79:781639317504\quad 80:888727041024\quad 81:1124540599296$ |
| $47$ | $82:243147620352\quad 83:130070558208\quad 84:509581463040\quad 85:827791088640\quad 86:1014864818688$ |
| $48$ | $48:2098587876864\quad 49:944479056384\quad 50:209892163584\quad 51:183439120896\quad 67:1094356667904$ |
| $48$ | $68:469065687552\quad 69:650450789376\quad 70:-102731642880\quad 71:379230105600\quad 77:1249575407616$ |
| $48$ | $78:315151091712\quad 79:565263267840\quad 80:896859594240\quad 81:742535818752\quad 82:685613581824$ |
| $48$ | $83:227275689984\quad 84:78078242304\quad 85:555550937088\quad 86:827791088640$ |
| $49$ | $49:2415618447360\quad 50:346833650688\quad 51:426909874176\quad 67:1185113836032\quad 68:-479974147584$ |
| $49$ | $69:647210571264\quad 70:-629282406912\quad 71:-158973143040\quad 77:1538140927488\quad 78:-72066605568$ |
| $49$ | $79:283082505216\quad 80:675974132736\quad 81:319041438720\quad 82:876866585088\quad 83:-117115327488$ |
| $49$ | $84:-179420719104\quad 85:78078242304\quad 86:509581463040$ |
| $50$ | $50:2133141078528\quad 51:509028045312\quad 67:235823672832\quad 68:404971479552\quad 69:-77963504640$ |
| $50$ | $70:711849911808\quad 71:131115677184\quad 77:663571233792\quad 78:1059725600256\quad 79:531822420480$ |
| $50$ | $80:634157325312\quad 81:253332183552\quad 82:60410770944\quad 83:495625156608\quad 84:-117115327488$ |
| $50$ | $85:227275689984\quad 86:130070558208$ |
| $51$ | $51:2139899003904\quad 67:610129451520\quad 68:302366481408\quad 69:36506105856\quad 70:-198947716608$ |
| $51$ | $71:344627049984\quad 77:447740579328\quad 78:-140529303552\quad 79:1180633374720\quad 80:474511091712$ |
| $51$ | $81:376255113216\quad 82:105610911744\quad 83:60410770944\quad 84:876866585088\quad 85:685613581824$ |
| $51$ | $86:243147620352$ |
| $52$ | $52:1734733907712\quad 53:457538236416\quad 54:94990142976\quad 55:22576128\quad 56:148544738304$ |
| $53$ | $53:2098587876864\quad 54:944479056384\quad 55:209892163584\quad 56:183439120896$ |
| $54$ | $54:2415618447360\quad 55:346833650688\quad 56:426909874176$ |
| $55$ | $55:2133141078528\quad 56:509028045312$ |
| $56$ | $56:2139899003952$ |
| $57$ | $57:2302674803712\quad 58:931660927488\quad 59:862486517760\quad 60:1148261514240\quad 61:1042404057600$ |
| $57$ | $62:260076799488\quad 63:327516051456\quad 64:732170201088\quad 65:437757912576\quad 66:583798937088$ |
| $57$ | $72:543749715456\quad 73:720936474624\quad 74:1041454015488\quad 75:651049892352\quad 76:841452458496$ |
| $58$ | $58:3327471943680\quad 59:887872719360\quad 60:1353547243008\quad 61:1148261514240\quad 62:-353884594176$ |
| $58$ | $63:1402844404224\quad 64:175407748608\quad 65:1830110094336\quad 66:453212250624\quad 72:397627198464$ |
| $58$ | $73:1135246817280\quad 74:1141313895936\quad 75:934768167936\quad 76:753158054400$ |
| $59$ | $59:3147323599872\quad 60:887872719360\quad 61:862486517760\quad 62:17184159744\quad 63:-353322123264$ |
| $59$ | $64:1001411395584\quad 65:230225963520\quad 66:1906948005888\quad 72:-139377312768\quad 73:292332791808$ |
| $59$ | $74:327651995136\quad 75:-284882772480\quad 76:999495869952$ |
| $60$ | $60:3327471943680\quad 61:931660927488\quad 62:-188965071360\quad 63:309746817024\quad 64:450292902912$ |
| $60$ | $65:926695002624\quad 66:745574863872\quad 72:563033892864\quad 73:1016338816512\quad 74:1149325036032$ |
| $60$ | $75:1115329886208\quad 76:1420414213632$ |
| $61$ | $61:2302674803712\quad 62:718766994432\quad 63:947075547648\quad 64:1382541189120\quad 65:1072909498368$ |
| $61$ | $66:1067697675264\quad 72:450612616704\quad 73:716589047808\quad 74:1033125671424\quad 75:734404220928$ |
| $61$ | $76:942294713856$ |
| $62$ | $62:2612595108480\quad 63:460351709184\quad 64:1902713412096\quad 65:-83577303552\quad 66:965274448896$ |
| $62$ | $72:984391865088\quad 73:-490996909056\quad 74:-59443189248\quad 75:67994887680\quad 76:279190462464$ |
| $63$ | $63:3834999802368\quad 64:586362117120\quad 65:2907536736768\quad 66:-83577303552\quad 72:273941621760$ |
| $63$ | $73:1465121527296\quad 74:698295197184\quad 75:1396054483968\quad 76:-232336441344$ |
| $64$ | $64:3420239864832\quad 65:586362117120\quad 66:1902713412096\quad 72:53221413888\quad 73:-274204311552$ |
| $64$ | $74:-171735644160\quad 75:-274204311552\quad 76:53221413888$ |
| $65$ | $65:3834999802368\quad 66:460351709184\quad 72:-232336441344\quad 73:1396054483968\quad 74:698295197184$ |
| $65$ | $75:1465121527296\quad 76:273941621760$ |
| $66$ | $66:2612595108864\quad 72:279190462464\quad 73:67994887680\quad 74:-59443189248\quad 75:-490996909056$ |
| $66$ | $76:984391864320$ |
| $67$ | $67:2849026960896\quad 68:685947655680\quad 69:1094275376640\quad 70:-190526409216\quad 71:585185702400$ |
| $67$ | $77:988501598208\quad 78:33181100544\quad 79:428816882688\quad 80:959154898944\quad 81:511508238336$ |
| $67$ | $82:376255113216\quad 83:253332183552\quad 84:319041438720\quad 85:742535818752\quad 86:1124540599296$ |
| $68$ | $68:3404058556416\quad 69:877011264000\quad 70:1260669580800\quad 71:1054057439232\quad 77:-373845726720$ |
| $68$ | $78:752252282880\quad 79:814169017344\quad 80:1487248482816\quad 81:959154898944\quad 82:474511091712$ |
| $68$ | $83:634157325312\quad 84:675974132736\quad 85:896859594240\quad 86:888727041024$ |
| $69$ | $69:2359153022976\quad 70:535710417408\quad 71:873325742592\quad 77:894771853824\quad 78:105217128960$ |
| $69$ | $79:387042264576\quad 80:814169017344\quad 81:428816882688\quad 82:1180633374720\quad 83:531822420480$ |
| $69$ | $84:283082505216\quad 85:565263267840\quad 86:781639317504$ |
| $70$ | $70:2666604601344\quad 71:712947331584\quad 77:71527850496\quad 78:1949099028480\quad 79:105217128960$ |
| $70$ | $80:752252282880\quad 81:33181100544\quad 82:-140529303552\quad 83:1059725600256\quad 84:-72066605568$ |
| $70$ | $85:315151091712\quad 86:380693419008$ |
| $71$ | $71:2423496907776\quad 77:49010277888\quad 78:71527850496\quad 79:894771853824\quad 80:-373845726720$ |
| $71$ | $81:988501598208\quad 82:447740579328\quad 83:663571233792\quad 84:1538140927488\quad 85:1249575407616$ |
| $71$ | $86:776294029824$ |
| $72$ | $72:2894998636800\quad 73:830919324672\quad 74:1137350109696\quad 75:684869145600\quad 76:941792317440$ |
| $73$ | $73:2705491230720\quad 74:1276681304064\quad 75:777554319360\quad 76:684869145600$ |
| $74$ | $74:2690211551232\quad 75:1276681304064\quad 76:1137350109696$ |
| $75$ | $75:2705491230720\quad 76:830919324672$ |
| $76$ | $76:2894998637568$ |
| $77$ | $77:2423496907776\quad 78:712947331584\quad 79:873325742592\quad 80:1054057439232\quad 81:585185702400$ |
| $77$ | $82:344627049984\quad 83:131115677184\quad 84:-158973143040\quad 85:379230105600\quad 86:665943140352$ |
| $78$ | $78:2666604601344\quad 79:535710417408\quad 80:1260669580800\quad 81:-190526409216\quad 82:-198947716608$ |
| $78$ | $83:711849911808\quad 84:-629282406912\quad 85:-102731642880\quad 86:478332902400$ |
| $79$ | $79:2359153022976\quad 80:877011264000\quad 81:1094275376640\quad 82:36506105856\quad 83:-77963504640$ |
| $79$ | $84:647210571264\quad 85:650450789376\quad 86:1028371433472$ |
| $80$ | $80:3404058556416\quad 81:685947655680\quad 82:302366481408\quad 83:404971479552\quad 84:-479974147584$ |
| $80$ | $85:469065687552\quad 86:826273297920$ |
| $81$ | $81:2849026960896\quad 82:610129451520\quad 83:235823672832\quad 84:1185113836032\quad 85:1094356667904$ |
| $81$ | $86:1089019450368$ |
| $82$ | $82:2139899003904\quad 83:509028045312\quad 84:426909874176\quad 85:183439120896\quad 86:148544738304$ |
| $83$ | $83:2133141078528\quad 84:346833650688\quad 85:209892163584\quad 86:22576128$ |
| $84$ | $84:2415618447360\quad 85:944479056384\quad 86:94990142976$ |
| $85$ | $85:2098587876864\quad 86:457538236416$ |
| $86$ | $86:1734733908480$ |
| $87$ | $87:1531612638720\quad 88:-59478231552\quad 89:-214192636416\quad 90:-362266773504\quad 91:-546265708032$ |
| $88$ | $88:910775711232\quad 89:53262097920\quad 90:-188951864832\quad 91:-362266773504$ |
| $89$ | $89:669273928704\quad 90:53262097920\quad 91:-214192636416$ |
| $90$ | $90:910775711232\quad 91:-59478231552$ |
| $91$ | $91:1531612638720$ |

**Lower-triangular rational factor $R^{(1)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="neutral-block-01-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:84261916298$ |
| $1$ | $0:46216507803\quad 1:69480235890$ |
| $2$ | $0:43557427431\quad 1:27075603634\quad 2:66856059873$ |
| $3$ | $3:78264009976$ |
| $4$ | $3:14137928583\quad 4:77472210877$ |
| $5$ | $3:35489818996\quad 4:7805875846\quad 5:69316638046$ |
| $6$ | $3:38142462871\quad 4:23040359875\quad 5:35835946160\quad 6:53435330664$ |
| $7$ | $3:29697469318\quad 4:27641300002\quad 5:15213095989\quad 6:-22612095931\quad 7:61750288722$ |
| $8$ | $3:51333257806\quad 4:20633167482\quad 5:14459935632\quad 6:-3255943412\quad 7:-20759555220$ |
| $8$ | $8:49130176713$ |
| $9$ | $9:84261916303$ |
| $10$ | $9:46216507811\quad 10:69480235886$ |
| $11$ | $9:43557427377\quad 10:27075603679\quad 11:66856059895$ |
| $12$ | $12:31575997912$ |
| $13$ | $12:-1226336780\quad 13:24317669209$ |
| $14$ | $12:-4416276270\quad 13:1203240551\quad 14:20363544058$ |
| $15$ | $12:-7469305136\quad 13:-5435365528\quad 14:404123412\quad 15:22524562245$ |
| $16$ | $12:-11263040360\quad 13:-10266734113\quad 14:-8683934233\quad 15:-7775687823\quad 16:25078072130$ |
| $17$ | $0:232203513\quad 1:-19377752367\quad 2:-6782590167\quad 17:31169033982$ |
| $18$ | $0:-12898510629\quad 1:6394602543\quad 2:-8959350331\quad 17:12754292330\quad 18:30634282658$ |
| $19$ | $0:-15576407108\quad 1:-9195749973\quad 2:20503413113\quad 17:7777792912\quad 18:5490283153$ |
| $19$ | $19:27098980842$ |
| $20$ | $0:-19415944971\quad 1:-7399293600\quad 2:6304515814\quad 17:747993354\quad 18:-637470383$ |
| $20$ | $19:4164015104\quad 20:29603849090$ |
| $21$ | $0:-13022189053\quad 1:-13617226797\quad 2:-5259329501\quad 17:-6410545565\quad 18:-1509211035$ |
| $21$ | $19:-3698917422\quad 20:-112372751\quad 21:26259280345$ |
| $22$ | $0:-7326619998\quad 1:-15966292680\quad 2:-13760994647\quad 17:-5667747593\quad 18:1369574033$ |
| $22$ | $19:-1687591699\quad 20:2884696916\quad 21:311257147\quad 22:32163103274$ |
| $23$ | $0:-15459902495\quad 1:15758704044\quad 2:-19606067019\quad 17:1490419550\quad 18:-1025102623$ |
| $23$ | $19:-4042900399\quad 20:-3775683286\quad 21:8156987629\quad 22:10697971969\quad 23:25482767460$ |
| $24$ | $0:-19776546371\quad 1:-9128306636\quad 2:5298856489\quad 17:-3612139987\quad 18:-5024729713$ |
| $24$ | $19:-870552652\quad 20:-1970547210\quad 21:10714849369\quad 22:10513220206\quad 23:3145982328$ |
| $24$ | $24:27479481094$ |
| $25$ | $0:-18501430735\quad 1:-1174458550\quad 2:-21535930789\quad 17:1036975172\quad 18:-5668526048$ |
| $25$ | $19:-5419114990\quad 20:3088048010\quad 21:5565518795\quad 22:7133326578\quad 23:-326677380$ |
| $25$ | $24:5513265007\quad 25:34987609820$ |
| $26$ | $0:-18585378885\quad 1:-16342425183\quad 2:7025420069\quad 17:4251218073\quad 18:882428491$ |
| $26$ | $19:5528962027\quad 20:5430536357\quad 21:12606249032\quad 22:2897380981\quad 23:-4414437633$ |
| $26$ | $24:1532638693\quad 25:4227085822\quad 26:30115760933$ |
| $27$ | $3:-7195693872\quad 4:-21244197129\quad 5:-6203328202\quad 6:-9689934536\quad 7:-789077132$ |
| $27$ | $8:5402931650\quad 27:34919627580$ |
| $28$ | $3:-22207132519\quad 4:4412744476\quad 5:-6992318117\quad 6:-2347226284\quad 7:2304174353$ |
| $28$ | $8:-1114055599\quad 27:11931106948\quad 28:32331947575$ |
| $29$ | $3:-18668012519\quad 4:-5590512060\quad 5:-10890174580\quad 6:-2767264693\quad 7:-4768545727$ |
| $29$ | $8:-5208054729\quad 27:11952393722\quad 28:6842038987\quad 29:31714374755$ |
| $30$ | $3:-15822927580\quad 4:3247688871\quad 5:-17338080657\quad 6:-1776445406\quad 7:2513186359$ |
| $30$ | $8:-1608709604\quad 27:8216678426\quad 28:-2799490672\quad 29:8979113889\quad 30:32120565215$ |
| $31$ | $3:-10875973442\quad 4:-20572581732\quad 5:-239343825\quad 6:5864617125\quad 7:4906783109$ |
| $31$ | $8:-8077059474\quad 27:5747270411\quad 28:6753445724\quad 29:9537383747\quad 30:9423099852$ |
| $31$ | $31:30999737821$ |
| $32$ | $0:-9284389062\quad 1:-22529210004\quad 2:-8251212800\quad 17:-7873725687\quad 18:7042392832$ |
| $32$ | $19:1759194000\quad 20:6469757808\quad 21:8698876048\quad 22:920503109\quad 23:1609481543$ |
| $32$ | $24:-5571047087\quad 25:7500306029\quad 26:-9820272714\quad 32:27811995045$ |
| $33$ | $0:-27028597011\quad 1:4497598283\quad 2:-7530282887\quad 17:11270196937\quad 18:-5736579098$ |
| $33$ | $19:5855289207\quad 20:3492539318\quad 21:12715828707\quad 22:-12612271398\quad 23:-3973014589$ |
| $33$ | $24:3973646630\quad 25:8118179860\quad 26:-908932918\quad 32:6859786760\quad 33:27130671747$ |
| $34$ | $0:-8951959107\quad 1:-16328550206\quad 2:-12480245383\quad 17:11859886481\quad 18:2353796072$ |
| $34$ | $19:1676327260\quad 20:4651775805\quad 21:7259239785\quad 22:4217404095\quad 23:-5985263773$ |
| $34$ | $24:-1673145417\quad 25:258095189\quad 26:-9366274811\quad 32:1495277786\quad 33:3137995637$ |
| $34$ | $34:25566823545$ |
| $35$ | $0:-18484050867\quad 1:17770291584\quad 2:-14638982300\quad 17:5064633139\quad 18:4639353287$ |
| $35$ | $19:2356685115\quad 20:2007385604\quad 21:8398818086\quad 22:352704363\quad 23:14055209051$ |
| $35$ | $24:-5370263669\quad 25:-3831908904\quad 26:44584819\quad 32:-4414155428\quad 33:4274725610$ |
| $35$ | $34:8361111920\quad 35:19699362954$ |
| $36$ | $0:-19836145277\quad 1:-7645270662\quad 2:6785573909\quad 17:6223465251\quad 18:6739596205$ |
| $36$ | $19:14671379091\quad 20:9038964137\quad 21:10816029188\quad 22:-3754421142\quad 23:1429812556$ |
| $36$ | $24:3293676249\quad 25:-12604336505\quad 26:-4358412666\quad 32:-900238839\quad 33:-41737077$ |
| $36$ | $34:4295743085\quad 35:1900988284\quad 36:18812375921$ |
| $37$ | $3:5031400718\quad 4:-20917357575\quad 5:-8467738469\quad 6:-1171307097\quad 7:-7879552515$ |
| $37$ | $8:9369762980\quad 27:3207143553\quad 28:-5791560356\quad 29:-4561076178\quad 30:2371748910$ |
| $37$ | $31:-1058715879\quad 37:30718490233$ |
| $38$ | $3:-24767336105\quad 4:17948775120\quad 5:-19047393714\quad 6:-179231035\quad 7:-5898231193$ |
| $38$ | $8:6788405038\quad 27:6306228097\quad 28:4235658516\quad 29:-6698757674\quad 30:5419470803$ |
| $38$ | $31:-746506083\quad 37:15895723219\quad 38:27058707845$ |
| $39$ | $3:-3854331475\quad 4:-19799672160\quad 5:-148768438\quad 6:5024712162\quad 7:-6110030739$ |
| $39$ | $8:3216267976\quad 27:-11115400875\quad 28:-485791176\quad 29:-4993681680\quad 30:-420760556$ |
| $39$ | $31:-8690078426\quad 37:25137420179\quad 38:8011387899\quad 39:28745388071$ |
| $40$ | $3:-26310735441\quad 4:18230430559\quad 5:-16546276788\quad 6:8543855823\quad 7:-2703958243$ |
| $40$ | $8:-771255696\quad 27:827242138\quad 28:4454300322\quad 29:-4681027822\quad 30:8091122908$ |
| $40$ | $31:4960563850\quad 37:9862915490\quad 38:12467568974\quad 39:9342176772\quad 40:25393976468$ |
| $41$ | $3:-7304378579\quad 4:-18666197259\quad 5:11522698020\quad 6:11747430369\quad 7:-3148890726$ |
| $41$ | $8:-1825960948\quad 27:-2137826083\quad 28:3194970317\quad 29:-4485432545\quad 30:-2559180520$ |
| $41$ | $31:5470903327\quad 37:12862913341\quad 38:3640549452\quad 39:14599812789\quad 40:7074274431$ |
| $41$ | $41:22399053781$ |
| $42$ | $3:-19795902772\quad 4:-10113155214\quad 5:2309046323\quad 6:-5526524005\quad 7:-6658349336$ |
| $42$ | $8:-6515735236\quad 27:-359830927\quad 28:2781338463\quad 29:5719189200\quad 30:4337848876$ |
| $42$ | $31:817304538\quad 37:3677644131\quad 38:-3701373125\quad 39:6281637147\quad 40:-2455915367$ |
| $42$ | $41:-1490287351\quad 42:27335415569$ |
| $43$ | $3:-28539980582\quad 4:7153681558\quad 5:-5325738805\quad 6:3180610733\quad 7:-826740891$ |
| $43$ | $8:-10697451977\quad 27:7457381234\quad 28:-1701925952\quad 29:2015178168\quad 30:-1625100386$ |
| $43$ | $31:6114892746\quad 37:3285684647\quad 38:-748532805\quad 39:7876139691\quad 40:3204687209$ |
| $43$ | $41:1678575832\quad 42:460085331\quad 43:30945543451$ |
| $44$ | $3:-12984311350\quad 4:-11803932340\quad 5:15369849490\quad 6:13640090905\quad 7:-5045526702$ |
| $44$ | $8:-7911702023\quad 27:-4829826671\quad 28:4762731191\quad 29:2205204119\quad 30:-893508979$ |
| $44$ | $31:4328393825\quad 37:2276873013\quad 38:-874463577\quad 39:8461077782\quad 40:1171271562$ |
| $44$ | $41:16032636801\quad 42:2729147932\quad 43:4738644008\quad 44:28185294388$ |
| $45$ | $3:-24445690089\quad 4:-6559893575\quad 5:-373342165\quad 6:-4290421639\quad 7:15654642612$ |
| $45$ | $8:-10726859021\quad 27:2225524514\quad 28:1871274216\quad 29:6895122990\quad 30:6692729877$ |
| $45$ | $31:7460875585\quad 37:3437796003\quad 38:-7018125057\quad 39:11071175122\quad 40:998656834$ |
| $45$ | $41:3904072799\quad 42:1094910105\quad 43:-1155046022\quad 44:1170091895\quad 45:28047802256$ |
| $46$ | $3:-17317880191\quad 4:-11276959425\quad 5:-7184494740\quad 6:10412497751\quad 7:1739138222$ |
| $46$ | $8:-5164861539\quad 27:423539064\quad 28:2817674780\quad 29:6113963985\quad 30:2225819308$ |
| $46$ | $31:-666319958\quad 37:12029085453\quad 38:4545449132\quad 39:9631824636\quad 40:-903925420$ |
| $46$ | $41:1687339649\quad 42:4918731325\quad 43:2960633109\quad 44:-1365598184\quad 45:-3987777343$ |
| $46$ | $46:22777198182$ |
| $47$ | $9:-15280043399\quad 10:-12115358795\quad 11:-1550862709\quad 47:27324297518$ |
| $48$ | $9:-7412053931\quad 10:-15383980422\quad 11:-13411561699\quad 47:-825711371\quad 48:29900016144$ |
| $49$ | $9:5261317692\quad 10:-23056481139\quad 11:-13722005622\quad 47:-5796408291\quad 48:3691377598$ |
| $49$ | $49:27888481811$ |
| $50$ | $9:-11721488453\quad 10:5611676957\quad 11:-10892578524\quad 47:-4684313229\quad 48:-463418204$ |
| $50$ | $49:8675610021\quad 50:31681342935$ |
| $51$ | $9:-11488077313\quad 10:-11581715935\quad 11:12467664983\quad 47:-7312558103\quad 48:577797915$ |
| $51$ | $49:7096365196\quad 50:9532017715\quad 51:27865454641$ |
| $52$ | $0:-15280043400\quad 1:-12115358795\quad 2:-1550862705\quad 17:-2677015174\quad 18:-479424813$ |
| $52$ | $19:1387218383\quad 20:5347369577\quad 21:10527821135\quad 22:4595095426\quad 23:2605627589$ |
| $52$ | $24:-2377264838\quad 25:4627836190\quad 26:2845244687\quad 32:3833963363\quad 33:1878801354$ |
| $52$ | $34:9812060593\quad 35:1440395281\quad 36:-3379557624\quad 52:20169221614$ |
| $53$ | $0:-7412053932\quad 1:-15383980422\quad 2:-13411561708\quad 17:1893290129\quad 18:209878337$ |
| $53$ | $19:1956407968\quad 20:6048831747\quad 21:6959537206\quad 22:10047799192\quad 23:-2591871926$ |
| $53$ | $24:55543350\quad 25:555904625\quad 26:194394268\quad 32:3224839414\quad 33:802788531$ |
| $53$ | $34:-8988434122\quad 35:-4637043588\quad 36:46378801\quad 52:-4312170374\quad 53:23711853475$ |
| $54$ | $0:5261317692\quad 1:-23056481137\quad 2:-13722005647\quad 17:956124084\quad 18:127905564$ |
| $54$ | $19:971608648\quad 20:2169148355\quad 21:925338519\quad 22:15027304759\quad 23:-1128552454$ |
| $54$ | $24:-165204063\quad 25:2896226686\quad 26:-2271518133\quad 32:4084853422\quad 33:-2686223302$ |
| $54$ | $34:-7801471076\quad 35:-397426157\quad 36:-529578233\quad 52:-9280384863\quad 53:-7852292154$ |
| $54$ | $54:18544543061$ |
| $55$ | $0:-11721488454\quad 1:5611676955\quad 2:-10892578513\quad 17:2467625090\quad 18:213329695$ |
| $55$ | $19:-156867011\quad 20:997183467\quad 21:-1262702868\quad 22:9227468536\quad 23:4629617378$ |
| $55$ | $24:4990620028\quad 25:-3488915124\quad 26:3878600387\quad 32:6475768487\quad 33:-2622549178$ |
| $55$ | $34:-7512004077\quad 35:1554884885\quad 36:-1096710560\quad 52:-5093731542\quad 53:-8116335624$ |
| $55$ | $54:-2836733263\quad 55:26924881123$ |
| $56$ | $0:-11488077313\quad 1:-11581715935\quad 2:12467664989\quad 17:-2195765373\quad 18:3424885933$ |
| $56$ | $19:1036056634\quad 20:1976889896\quad 21:-3362343431\quad 22:5407935497\quad 23:5724206710$ |
| $56$ | $24:12551195839\quad 25:8154042410\quad 26:-8543210865\quad 32:590101627\quad 33:2564075454$ |
| $56$ | $34:-5465255389\quad 35:5965834774\quad 36:-7106061611\quad 52:-9424034897\quad 53:-3063136374$ |
| $56$ | $54:-1343487355\quad 55:6938507461\quad 56:17567834436$ |
| $57$ | $3:-15340895520\quad 4:-11637739991\quad 5:-10388247462\quad 6:-6058852746\quad 7:-4292440987$ |
| $57$ | $8:9109652015\quad 27:2293632758\quad 28:2926486428\quad 29:5385695172\quad 30:1156332749$ |
| $57$ | $31:-2594146106\quad 37:11175681046\quad 38:2390911229\quad 39:10978587601\quad 40:2819859232$ |
| $57$ | $41:1644065620\quad 42:2066736646\quad 43:3279502071\quad 44:6934702334\quad 45:1669378953$ |
| $57$ | $46:-917740051\quad 57:22422790788$ |
| $58$ | $3:-12070141247\quad 4:-8818311448\quad 5:-20428226187\quad 6:-15683004431\quad 7:11482837416$ |
| $58$ | $8:-853741614\quad 27:11040814284\quad 28:4893148771\quad 29:2920912601\quad 30:-504125381$ |
| $58$ | $31:-1351402172\quad 37:8946391318\quad 38:-2476573680\quad 39:4988251356\quad 40:-9420222787$ |
| $58$ | $41:-296573193\quad 42:4420513198\quad 43:3778415826\quad 44:2763425840\quad 45:653189095$ |
| $58$ | $46:1179260354\quad 57:-6786819135\quad 58:26481109777$ |
| $59$ | $3:6547522982\quad 4:-15368303045\quad 5:-16281972767\quad 6:-6145218695\quad 7:-12290631601$ |
| $59$ | $8:9234777243\quad 27:4329881638\quad 28:-3512868172\quad 29:538500390\quad 30:1435729829$ |
| $59$ | $31:-6080106105\quad 37:16831414284\quad 38:-5440215602\quad 39:-2994172292\quad 40:-2271317263$ |
| $59$ | $41:-2989915248\quad 42:10928962195\quad 43:3214277082\quad 44:-9438481371\quad 45:3944946197$ |
| $59$ | $46:6858039286\quad 57:936385443\quad 58:-309234780\quad 59:23278473841$ |
| $60$ | $3:-16945212805\quad 4:5037748672\quad 5:-24115347736\quad 6:-9708198968\quad 7:-5546443548$ |
| $60$ | $8:472335749\quad 27:6438552006\quad 28:-1388232237\quad 29:2331474595\quad 30:-1362871350$ |
| $60$ | $31:7206078112\quad 37:6992463371\quad 38:2471804087\quad 39:3737102785\quad 40:-4045137859$ |
| $60$ | $41:-1069486534\quad 42:6702962036\quad 43:484703678\quad 44:2976927958\quad 45:3875397373$ |
| $60$ | $46:3843811674\quad 57:2446287659\quad 58:-2469305469\quad 59:2426075516\quad 60:29258338498$ |
| $61$ | $3:-7940299918\quad 4:-12276687977\quad 5:-16903252322\quad 6:-3067274066\quad 7:-5757806256$ |
| $61$ | $8:-8646987121\quad 27:3936865711\quad 28:4112752463\quad 29:3812628002\quad 30:951556723$ |
| $61$ | $31:-3493440944\quad 37:2434561936\quad 38:-1931180426\quad 39:6875338639\quad 40:-4168742255$ |
| $61$ | $41:794624787\quad 42:6552609682\quad 43:5823568518\quad 44:8985851302\quad 45:3917393007$ |
| $61$ | $46:1532931396\quad 57:1532710921\quad 58:-1504316266\quad 59:1770571111\quad 60:-3204268403$ |
| $61$ | $61:23535473280$ |
| $62$ | $3:-8382806263\quad 4:-11606058657\quad 5:10388147365\quad 6:11390537751\quad 7:-14252526440$ |
| $62$ | $8:-6327771998\quad 27:1481706349\quad 28:5140432386\quad 29:-156946440\quad 30:7207995602$ |
| $62$ | $31:3565113080\quad 37:-7407667169\quad 38:243869662\quad 39:-1424564224\quad 40:4184721763$ |
| $62$ | $41:14901789975\quad 42:12334305144\quad 43:8026162249\quad 44:8738731896\quad 45:3617038928$ |
| $62$ | $46:2046901553\quad 57:327006206\quad 58:3355206047\quad 59:4436330767\quad 60:415734507$ |
| $62$ | $61:5115879668\quad 62:16049083216$ |
| $63$ | $3:-15630423299\quad 4:-8626995785\quad 5:-1411870844\quad 6:-20451700607\quad 7:21085585096$ |
| $63$ | $8:-13988704284\quad 27:2668118508\quad 28:2315527112\quad 29:8163702131\quad 30:5229197893$ |
| $63$ | $31:10052555279\quad 37:-73299383\quad 38:-1914921619\quad 39:-386875579\quad 40:1134735126$ |
| $63$ | $41:5475468207\quad 42:6029372991\quad 43:1458414341\quad 44:-859250284\quad 45:-980864644$ |
| $63$ | $46:-3756074745\quad 57:-4463349076\quad 58:-1825640597\quad 59:-500205913\quad 60:-7609972464$ |
| $63$ | $61:9723209594\quad 62:15515211791\quad 63:20094159836$ |
| $64$ | $3:-4344773148\quad 4:-14114804885\quad 5:-1091595669\quad 6:4274203161\quad 7:-15481402511$ |
| $64$ | $8:-1609540462\quad 27:5718183009\quad 28:3950855474\quad 29:8074253556\quad 30:2725337314$ |
| $64$ | $31:1207836305\quad 37:-7852531049\quad 38:-2851765929\quad 39:-1754411667\quad 40:-2858681802$ |
| $64$ | $41:-3749814471\quad 42:19488583348\quad 43:6771062212\quad 44:10402402161\quad 45:2623476575$ |
| $64$ | $46:7778204645\quad 57:6089422740\quad 58:-406560093\quad 59:7404952334\quad 60:-694165378$ |
| $64$ | $61:9544758619\quad 62:14559973285\quad 63:5061472089\quad 64:22511681764$ |
| $65$ | $3:-9198714610\quad 4:-9800720364\quad 5:-11834614391\quad 6:-19807219100\quad 7:21321585247$ |
| $65$ | $8:-14547229228\quad 27:13451872477\quad 28:2975776481\quad 29:3957119905\quad 30:-966090522$ |
| $65$ | $31:-1060511946\quad 37:3812368785\quad 38:-2217273081\quad 39:-3700569517\quad 40:-1117042165$ |
| $65$ | $41:835399665\quad 42:10203772880\quad 43:-6936349924\quad 44:1377533314\quad 45:-503784207$ |
| $65$ | $46:-5126494254\quad 57:-2597830370\quad 58:-2173628330\quad 59:-1639550384\quad 60:184364828$ |
| $65$ | $61:5948797007\quad 62:13831967094\quad 63:8173683418\quad 64:3768850206\quad 65:19291459503$ |
| $66$ | $3:4241690671\quad 4:-13909907147\quad 5:-10070163219\quad 6:-974924134\quad 7:-18780586415$ |
| $66$ | $8:4388468491\quad 27:6305158108\quad 28:4722024520\quad 29:-1884523668\quad 30:5050090055$ |
| $66$ | $31:-1483910271\quad 37:8079665742\quad 38:-3898732683\quad 39:-13813459431\quad 40:-519217248$ |
| $66$ | $41:-4997526072\quad 42:12649382936\quad 43:4656190182\quad 44:5406346320\quad 45:6617556557$ |
| $66$ | $46:3585788220\quad 57:804363495\quad 58:920189264\quad 59:7073048039\quad 60:3234130903$ |
| $66$ | $61:6167344475\quad 62:5705913584\quad 63:6641827021\quad 64:5196362215\quad 65:4987098771$ |
| $66$ | $66:11359067819$ |
| $67$ | $9:-9284389061\quad 10:-22529210004\quad 11:-8251212789\quad 47:10297985126\quad 48:6518658184$ |
| $67$ | $49:8009314121\quad 50:1989436191\quad 51:4602262983\quad 67:30904018655$ |
| $68$ | $9:-27028597010\quad 10:4497598286\quad 11:-7530282911\quad 47:6139290189\quad 48:2619104943$ |
| $68$ | $49:-5163106457\quad 50:-2703804262\quad 51:4956463834\quad 67:5774508965\quad 68:35667562863$ |
| $69$ | $9:-8951959107\quad 10:-16328550206\quad 11:-12480245375\quad 47:11548144527\quad 48:-1736590400$ |
| $69$ | $49:-212438442\quad 50:-4572593017\quad 51:644401485\quad 67:1899079189\quad 68:6013921458$ |
| $69$ | $69:28909741198$ |
| $70$ | $9:-18484050866\quad 10:17770291587\quad 11:-14638982324\quad 47:8108825382\quad 48:-4018245635$ |
| $70$ | $49:-1497373855\quad 50:1159002175\quad 51:3863249772\quad 67:-2637067588\quad 68:2333079328$ |
| $70$ | $69:6351337180\quad 70:26666105304$ |
| $71$ | $9:-19836145276\quad 10:-7645270661\quad 11:6785573895\quad 47:1769775331\quad 48:2498988411$ |
| $71$ | $49:-2913805189\quad 50:138728433\quad 51:-5232481579\quad 67:3015425480\quad 68:5944261413$ |
| $71$ | $69:10261694606\quad 70:10237263330\quad 71:27927302792$ |
| $72$ | $3:-19217293178\quad 4:-5849920111\quad 5:2072324245\quad 6:4310848201\quad 7:-15371780908$ |
| $72$ | $8:-1608986265\quad 27:826144335\quad 28:2766194783\quad 29:5473594892\quad 30:6874801199$ |
| $72$ | $31:4317364410\quad 37:2550343361\quad 38:1416737337\quad 39:7044216097\quad 40:11683271307$ |
| $72$ | $41:364746579\quad 42:-406304911\quad 43:8310176616\quad 44:-162262757\quad 45:790886514$ |
| $72$ | $46:-1372198169\quad 57:-9785644201\quad 58:7262503277\quad 59:-6086571087\quad 60:3409246824$ |
| $72$ | $61:-565175734\quad 62:-2884598964\quad 63:5299137579\quad 64:-13693568437\quad 65:6117966954$ |
| $72$ | $66:423382055\quad 72:19739409093$ |
| $73$ | $3:-14327973424\quad 4:-3174937751\quad 5:-10266923595\quad 6:-14043862137\quad 7:6150525272$ |
| $73$ | $8:-4212074878\quad 27:2843480528\quad 28:-5535485568\quad 29:4094668476\quad 30:-1435774145$ |
| $73$ | $31:8533398828\quad 37:5658346895\quad 38:2359718902\quad 39:5487448375\quad 40:5157687342$ |
| $73$ | $41:968558062\quad 42:2992613874\quad 43:3779740423\quad 44:-6172215378\quad 45:-3942928456$ |
| $73$ | $46:-21737959\quad 57:-776859063\quad 58:-298852904\quad 59:-935897781\quad 60:-1389680529$ |
| $73$ | $61:5283199974\quad 62:-9413844137\quad 63:7387193011\quad 64:-2326702573\quad 65:9216475589$ |
| $73$ | $66:10100117321\quad 72:3689721407\quad 73:22463820623$ |
| $74$ | $3:-17619603167\quad 4:-11066881157\quad 5:-9626513768\quad 6:-3537328250\quad 7:3215967503$ |
| $74$ | $8:-2722839585\quad 27:5795951121\quad 28:1757398883\quad 29:9982900729\quad 30:-198284369$ |
| $74$ | $31:2060364412\quad 37:2854227017\quad 38:10597749526\quad 39:11401758563\quad 40:2572854006$ |
| $74$ | $41:-7691502471\quad 42:4005245986\quad 43:3114623811\quad 44:1214049476\quad 45:210948355$ |
| $74$ | $46:-3247186829\quad 57:-3468901432\quad 58:-1682512649\quad 59:1793406799\quad 60:2662491640$ |
| $74$ | $61:2824922112\quad 62:-7796431289\quad 63:-5385987648\quad 64:-14671804774\quad 65:-1142008304$ |
| $74$ | $66:3263322931\quad 72:-1040552511\quad 73:3302815022\quad 74:18402660347$ |
| $75$ | $3:-15907043102\quad 4:-2886772820\quad 5:-7708001995\quad 6:-5406462884\quad 7:9313420613$ |
| $75$ | $8:-11697476437\quad 27:7703826659\quad 28:-1930166959\quad 29:1485110455\quad 30:-7069784854$ |
| $75$ | $31:3887381402\quad 37:7151096804\quad 38:5683745335\quad 39:3255648741\quad 40:-709362576$ |
| $75$ | $41:831568313\quad 42:3551304787\quad 43:-1860476202\quad 44:2274615893\quad 45:-124345252$ |
| $75$ | $46:-2526776187\quad 57:1357731994\quad 58:-4591224049\quad 59:-6191235248\quad 60:3391352358$ |
| $75$ | $61:2809840476\quad 62:8969414463\quad 63:-1988811603\quad 64:-12108440381\quad 65:-3099411935$ |
| $75$ | $66:-9743406331\quad 72:8861384849\quad 73:691293690\quad 74:4200045758\quad 75:20532775507$ |
| $76$ | $3:-7462375838\quad 4:-7995078743\quad 5:-16976811028\quad 6:4229891983\quad 7:-15401425954$ |
| $76$ | $8:-1538827449\quad 27:7853815127\quad 28:5422192692\quad 29:2252029585\quad 30:925237630$ |
| $76$ | $31:-2680826142\quad 37:7540325994\quad 38:10549328028\quad 39:135281151\quad 40:-5051720005$ |
| $76$ | $41:-1039822466\quad 42:-572773755\quad 43:1356774087\quad 44:-4983076351\quad 45:10511009594$ |
| $76$ | $46:-6921065256\quad 57:-186883998\quad 58:874315107\quad 59:-214459338\quad 60:9022974867$ |
| $76$ | $61:1268288168\quad 62:-1065476745\quad 63:4297785912\quad 64:-14644988141\quad 65:5003779887$ |
| $76$ | $66:-1550698090\quad 72:-6567511003\quad 73:8865401575\quad 74:-3078604587\quad 75:6712772087$ |
| $76$ | $76:14607450506$ |
| $77$ | $9:-7326619997\quad 10:-15966292681\quad 11:-13760994637\quad 47:6538865619\quad 48:11185211570$ |
| $77$ | $49:17197050572\quad 50:5443494419\quad 51:2203746822\quad 67:-6364166406\quad 68:-11588550744$ |
| $77$ | $69:4749759308\quad 70:-886599756\quad 71:-2590368777\quad 77:19410945966$ |
| $78$ | $9:-15459902494\quad 10:15758704046\quad 11:-19606067037\quad 47:6299716662\quad 48:2517464373$ |
| $78$ | $49:5591900462\quad 50:5961944509\quad 51:3802581133\quad 67:-2721642835\quad 68:-4206523316$ |
| $78$ | $69:-2392973465\quad 70:14241840747\quad 71:-2745909876\quad 77:3975119269\quad 78:21907294801$ |
| $79$ | $9:-19776546370\quad 10:-9128306635\quad 11:5298856477\quad 47:3817787665\quad 48:5191092596$ |
| $79$ | $49:5506240251\quad 50:6183155831\quad 51:10642832046\quad 67:-7924692025\quad 68:2175820505$ |
| $79$ | $69:-640054160\quad 70:-4849321787\quad 71:7262402003\quad 77:5581975593\quad 78:9055966899$ |
| $79$ | $79:23506942602$ |
| $80$ | $9:-18501430734\quad 10:-1174458548\quad 11:-21535930797\quad 47:9085957675\quad 48:4928540122$ |
| $80$ | $49:8939425442\quad 50:-2042278390\quad 51:13310554395\quad 67:-193202351\quad 68:6122918024$ |
| $80$ | $69:-2502848874\quad 70:-8815214525\quad 71:-11656560077\quad 77:-376478425\quad 78:3980069778$ |
| $80$ | $79:2614177909\quad 80:27573781118$ |
| $81$ | $9:-18585378884\quad 10:-16342425182\quad 11:7025420062\quad 47:9553347427\quad 48:6567372358$ |
| $81$ | $49:2016220881\quad 50:4596308286\quad 51:-8522077390\quad 67:-8963781085\quad 68:8116759397$ |
| $81$ | $69:-5885187679\quad 70:1712482184\quad 71:1835070903\quad 77:-1289861834\quad 78:-5369860268$ |
| $81$ | $79:4144133661\quad 80:7283646220\quad 81:25938052755$ |
| $82$ | $9:232203513\quad 10:-19377752368\quad 11:-6782590150\quad 47:-3053691569\quad 48:1889315260$ |
| $82$ | $49:183833787\quad 50:1953506693\quad 51:-4011678214\quad 67:-6898174541\quad 68:12084613058$ |
| $82$ | $69:12459042167\quad 70:2932774731\quad 71:-1252238815\quad 77:-7545047060\quad 78:5029188362$ |
| $82$ | $79:-5710172241\quad 80:2382096234\quad 81:1542106628\quad 82:21372222407$ |
| $83$ | $9:-12898510628\quad 10:6394602545\quad 11:-8959350344\quad 47:-1787063961\quad 48:973292083$ |
| $83$ | $49:77510150\quad 50:928478312\quad 51:1933677519\quad 67:3753758064\quad 68:-1455668435$ |
| $83$ | $69:8659376815\quad 70:6562156018\quad 71:4944241164\quad 77:-2867754951\quad 78:-2765039084$ |
| $83$ | $79:-6362236090\quad 80:-6227436\quad 81:7246822846\quad 82:12328832589\quad 83:25938719562$ |
| $84$ | $9:-15576407108\quad 10:-9195749973\quad 11:20503413099\quad 47:517442648\quad 48:2318454601$ |
| $84$ | $49:1036606939\quad 50:335151869\quad 51:778558287\quad 67:-255544282\quad 68:5872568982$ |
| $84$ | $69:3980089791\quad 70:3463164010\quad 71:13352218799\quad 77:-2462346331\quad 78:-4235298870$ |
| $84$ | $79:-6367511066\quad 80:-445432088\quad 81:4523125149\quad 82:4051845986\quad 83:325504698$ |
| $84$ | $84:21798181207$ |
| $85$ | $9:-19415944970\quad 10:-7399293599\quad 11:6304515801\quad 47:5942782236\quad 48:6468378260$ |
| $85$ | $49:2849353288\quad 50:1158176528\quad 51:2421339961\quad 67:1580482960\quad 68:2331261736$ |
| $85$ | $69:2835914592\quad 70:831016593\quad 71:9558256423\quad 77:-2549649364\quad 78:-7630708935$ |
| $85$ | $79:-5918634600\quad 80:3219911426\quad 81:1792717384\quad 82:-1497017768\quad 83:-5861193035$ |
| $85$ | $84:-6339990853\quad 85:22451206588$ |
| $86$ | $9:-13022189052\quad 10:-13617226797\quad 11:-5259329501\quad 47:10562232479\quad 48:5722528862$ |
| $86$ | $49:1944808409\quad 50:-428452081\quad 51:-689978384\quad 67:3346388202\quad 68:4525506944$ |
| $86$ | $69:-1466308312\quad 70:4617701139\quad 71:2813559746\quad 77:-1144670732\quad 78:4841878563$ |
| $86$ | $79:9573059650\quad 80:1180312437\quad 81:3195494148\quad 82:-8893574374\quad 83:266427535$ |
| $86$ | $84:-6937710439\quad 85:-6356468920\quad 86:15462675393$ |
| $87$ | $87:31575997926$ |
| $88$ | $87:-1226336760\quad 88:24317669196$ |
| $89$ | $87:-4416276291\quad 88:1203240442\quad 89:20363544145$ |
| $90$ | $87:-7469305152\quad 88:-5435365512\quad 89:404123236\quad 90:22524562231$ |
| $91$ | $87:-11263040295\quad 88:-10266734132\quad 89:-8683934282\quad 90:-7775687852\quad 91:25078072143$ |

**Neutral block 2: localizer 1; dimension $68$.**

Use $\Lambda^{\mathrm{tab}}_1$. If there are $k$ listed basis polynomials, matrix index $ak+i$ denotes localizer component $a\in\{0,1\}$ and basis index $i<k$.

<a id="neutral-block-02-basis"></a>

| Index $i$ | Basis polynomial $v_i$ |
|:--|:--|
| $0$ | $b\,H-H\,b$ |
| $1$ | $b^*\,H-H\,b^*$ |
| $2$ | $H\,b\,b\,b$ |
| $3$ | $b\,H\,b\,b$ |
| $4$ | $b\,b\,H\,b$ |
| $5$ | $b\,b\,b\,H$ |
| $6$ | $H\,b\,b\,b^*$ |
| $7$ | $b\,H\,b\,b^*$ |
| $8$ | $b\,b\,H\,b^*$ |
| $9$ | $b\,b\,b^*\,H$ |
| $10$ | $H\,b\,b^*\,b$ |
| $11$ | $b\,H\,b^*\,b$ |
| $12$ | $b\,b^*\,H\,b$ |
| $13$ | $b\,b^*\,b\,H$ |
| $14$ | $H\,b\,b^*\,b^*$ |
| $15$ | $b\,H\,b^*\,b^*$ |
| $16$ | $b\,b^*\,H\,b^*$ |
| $17$ | $b\,b^*\,b^*\,H$ |
| $18$ | $H\,b^*\,b\,b$ |
| $19$ | $b^*\,H\,b\,b$ |
| $20$ | $b^*\,b\,H\,b$ |
| $21$ | $b^*\,b\,b\,H$ |
| $22$ | $H\,b^*\,b\,b^*$ |
| $23$ | $b^*\,H\,b\,b^*$ |
| $24$ | $b^*\,b\,H\,b^*$ |
| $25$ | $b^*\,b\,b^*\,H$ |
| $26$ | $H\,b^*\,b^*\,b$ |
| $27$ | $b^*\,H\,b^*\,b$ |
| $28$ | $b^*\,b^*\,H\,b$ |
| $29$ | $b^*\,b^*\,b\,H$ |
| $30$ | $H\,b^*\,b^*\,b^*$ |
| $31$ | $b^*\,H\,b^*\,b^*$ |
| $32$ | $b^*\,b^*\,H\,b^*$ |
| $33$ | $b^*\,b^*\,b^*\,H$ |

**Gram $Q^{(2)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="neutral-block-02-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:37317695354\quad 6:-2165529363\quad 7:1726002155\quad 8:802073668\quad 9:1259679488$ |
| $0$ | $10:-2642613508\quad 11:2902744548\quad 12:-2524255139\quad 13:3167127068\quad 18:-1330626456$ |
| $0$ | $19:-1937004620\quad 20:-2995369321\quad 21:390601726\quad 35:-214118513\quad 48:-436049824$ |
| $0$ | $49:-1068271017\quad 50:179595659\quad 51:684613924\quad 56:-1227241776\quad 57:-2042917013$ |
| $0$ | $58:-704970332\quad 59:-457399969\quad 60:163655740\quad 61:-548430288\quad 62:1981805446$ |
| $0$ | $63:1449228709$ |
| $1$ | $1:40094620189\quad 14:-835197974\quad 15:-1424418909\quad 16:-2297549568\quad 17:2104445091$ |
| $1$ | $22:-2977481504\quad 23:4557928632\quad 24:-2698031609\quad 25:4244648990\quad 26:-1208163296$ |
| $1$ | $27:2218368462\quad 28:1080009932\quad 29:1772733084\quad 64:1249328326\quad 65:627030154$ |
| $1$ | $66:1971391673\quad 67:-653356890$ |
| $2$ | $2:1961377630\quad 3:644681284\quad 4:360716652\quad 5:-94938799\quad 34:1110481759$ |
| $2$ | $40:159377997\quad 41:415187139\quad 42:252168423\quad 43:403802390\quad 44:121301546$ |
| $2$ | $45:555404304\quad 46:420183879\quad 47:345621497\quad 52:485127452\quad 53:428743282$ |
| $2$ | $54:398321391\quad 55:482169876$ |
| $3$ | $3:1638864664\quad 4:131575474\quad 5:225402587\quad 34:495183429\quad 40:126767180$ |
| $3$ | $41:348587048\quad 42:264370360\quad 43:451218536\quad 44:116809143\quad 45:376014528$ |
| $3$ | $46:326522796\quad 47:320366386\quad 52:373338668\quad 53:278004042\quad 54:535566757$ |
| $3$ | $55:502939125$ |
| $4$ | $4:1442818368\quad 5:364709718\quad 34:1828216628\quad 40:80461898\quad 41:198257493$ |
| $4$ | $42:335584188\quad 43:420863634\quad 44:-118781686\quad 45:337150835\quad 46:430213355$ |
| $4$ | $47:487419081\quad 52:334589274\quad 53:501701357\quad 54:-39692882\quad 55:327617282$ |
| $5$ | $5:1767254347\quad 34:-790183879\quad 40:247475250\quad 41:-183662228\quad 42:204935999$ |
| $5$ | $43:246602440\quad 44:258760411\quad 45:-104872536\quad 46:429932024\quad 47:400598199$ |
| $5$ | $52:360963747\quad 53:550437469\quad 54:334839764\quad 55:420730207$ |
| $6$ | $6:1842864509\quad 7:298374772\quad 8:326958099\quad 9:-40175167\quad 10:672310089$ |
| $6$ | $11:-1075153353\quad 12:-78914419\quad 13:-427789064\quad 18:-102931029\quad 19:761512269$ |
| $6$ | $20:1161860757\quad 21:504602546\quad 35:500359227\quad 48:285573771\quad 49:371898360$ |
| $6$ | $50:344407818\quad 51:405576628\quad 56:196145996\quad 57:268954559\quad 58:224283046$ |
| $6$ | $59:304000914\quad 60:272197852\quad 61:399673476\quad 62:195173606\quad 63:454139168$ |
| $7$ | $7:1721545936\quad 8:15467944\quad 9:159350810\quad 10:-770010857\quad 11:216637115$ |
| $7$ | $12:-592522667\quad 13:938549924\quad 18:-192886574\quad 19:37328779\quad 20:-496343734$ |
| $7$ | $21:825045515\quad 35:-290975611\quad 48:111028296\quad 49:166447675\quad 50:107191838$ |
| $7$ | $51:264890730\quad 56:57878492\quad 57:-190242353\quad 58:256400154\quad 59:54022597$ |
| $7$ | $60:292667782\quad 61:212890468\quad 62:203908410\quad 63:-213428986$ |
| $8$ | $8:1726163235\quad 9:157011370\quad 10:-162241642\quad 11:-331324890\quad 12:-25572172$ |
| $8$ | $13:212108981\quad 18:143559756\quad 19:54168665\quad 20:-126287335\quad 21:656522095$ |
| $8$ | $35:2261874255\quad 48:158315590\quad 49:194025103\quad 50:29802726\quad 51:220109313$ |
| $8$ | $56:-295348891\quad 57:380204264\quad 58:-171171030\quad 59:286369774\quad 60:10164643$ |
| $8$ | $61:216519736\quad 62:360705427\quad 63:451563359$ |
| $9$ | $9:1107697962\quad 10:204127952\quad 11:787427375\quad 12:262427157\quad 13:375974259$ |
| $9$ | $18:35799539\quad 19:176707057\quad 20:108896247\quad 21:203086958\quad 35:1635046462$ |
| $9$ | $48:209149530\quad 49:241560608\quad 50:496505306\quad 51:487625584\quad 56:448887322$ |
| $9$ | $57:166827226\quad 58:472835095\quad 59:329987766\quad 60:315558753\quad 61:-119491030$ |
| $9$ | $62:432936164\quad 63:589448583$ |
| $10$ | $10:1754305708\quad 11:-15143164\quad 12:801000604\quad 13:-883189172\quad 18:212358181$ |
| $10$ | $19:417879986\quad 20:1489125593\quad 21:-220389752\quad 35:-913259847\quad 48:263324415$ |
| $10$ | $49:358330354\quad 50:361301281\quad 51:81080862\quad 56:321609913\quad 57:445435497$ |
| $10$ | $58:275387865\quad 59:19907191\quad 60:166219949\quad 61:239620382\quad 62:-131952445$ |
| $10$ | $63:542847406$ |
| $11$ | $11:2289223175\quad 12:183095777\quad 13:639360975\quad 18:143501304\quad 19:-197966591$ |
| $11$ | $20:-499656947\quad 21:-54838699\quad 35:-1718236885\quad 48:85932969\quad 49:233669136$ |
| $11$ | $50:241311310\quad 51:82982827\quad 56:293348750\quad 57:12641578\quad 58:128670825$ |
| $11$ | $59:-155049877\quad 60:146942849\quad 61:-277048099\quad 62:451256047\quad 63:54616252$ |
| $12$ | $12:2615278608\quad 13:-144857811\quad 18:836509838\quad 19:-73718885\quad 20:388640431$ |
| $12$ | $21:-1167459742\quad 35:-428443450\quad 48:60900188\quad 49:229871222\quad 50:253883098$ |
| $12$ | $51:207587766\quad 56:236357502\quad 57:214973706\quad 58:253898834\quad 59:280650529$ |
| $12$ | $60:123429808\quad 61:310838758\quad 62:-142758953\quad 63:433739153$ |
| $13$ | $13:1736187844\quad 18:228574145\quad 19:-462507127\quad 20:-805398931\quad 21:334973029$ |
| $13$ | $35:-191052277\quad 48:-17825605\quad 49:20244650\quad 50:52142952\quad 51:88788623$ |
| $13$ | $56:-109318883\quad 57:-238113752\quad 58:143422088\quad 59:-86235777\quad 60:71959885$ |
| $13$ | $61:-9502111\quad 62:307779236\quad 63:8653900$ |
| $14$ | $14:669225482\quad 15:-239961571\quad 16:-71980802\quad 17:-172293828\quad 22:154879643$ |
| $14$ | $23:152743448\quad 24:674986741\quad 25:209558738\quad 26:-137658471\quad 27:-44918552$ |
| $14$ | $28:146329277\quad 29:-91920423\quad 64:108709622\quad 65:110377240\quad 66:90919011$ |
| $14$ | $67:177863699$ |
| $15$ | $15:1751108978\quad 16:160496658\quad 17:268053955\quad 22:270368758\quad 23:-438676005$ |
| $15$ | $24:-493209849\quad 25:-410492365\quad 26:567407305\quad 27:-123854329\quad 28:98388315$ |
| $15$ | $29:152583873\quad 64:-34811431\quad 65:-131975618\quad 66:207950826\quad 67:191758006$ |
| $16$ | $16:1665657425\quad 17:153484913\quad 22:935626533\quad 23:-782387960\quad 24:434425343$ |
| $16$ | $25:-1060410904\quad 26:723090687\quad 27:-774676636\quad 28:32390766\quad 29:-159094663$ |
| $16$ | $64:102265071\quad 65:265325919\quad 66:-347233963\quad 67:102019898$ |
| $17$ | $17:1269535418\quad 22:-400520389\quad 23:-202603408\quad 24:-723869223\quad 25:359257908$ |
| $17$ | $26:422434287\quad 27:490214129\quad 28:582422702\quad 29:79545136\quad 64:145066696$ |
| $17$ | $65:212238893\quad 66:206359409\quad 67:69201661$ |
| $18$ | $18:710291204\quad 19:-187310386\quad 20:119451702\quad 21:-322515486\quad 35:-106201290$ |
| $18$ | $48:-5106225\quad 49:123785133\quad 50:-11516357\quad 51:-34340000\quad 56:109450991$ |
| $18$ | $57:98337673\quad 58:-47037041\quad 59:-31577371\quad 60:-736720\quad 61:57169297$ |
| $18$ | $62:-75730181\quad 63:-34546505$ |
| $19$ | $19:1979008117\quad 20:83785900\quad 21:331433184\quad 35:-770736494\quad 48:236148560$ |
| $19$ | $49:277447564\quad 50:167958650\quad 51:246971467\quad 56:176553787\quad 57:195427815$ |
| $19$ | $58:173175182\quad 59:80052332\quad 60:152297512\quad 61:76640989\quad 62:203018448$ |
| $19$ | $63:169271383$ |
| $20$ | $20:2283590701\quad 21:234964452\quad 35:380041372\quad 48:252159515\quad 49:360616290$ |
| $20$ | $50:469831683\quad 51:282898309\quad 56:372107757\quad 57:425155688\quad 58:380691431$ |
| $20$ | $59:268726988\quad 60:346390972\quad 61:247702735\quad 62:60173285\quad 63:619641922$ |
| $21$ | $21:1769434811\quad 35:909874446\quad 48:206298753\quad 49:275924457\quad 50:195528650$ |
| $21$ | $51:240216401\quad 56:-50522664\quad 57:97341394\quad 58:246181193\quad 59:232941996$ |
| $21$ | $60:211058564\quad 61:249010943\quad 62:297634435\quad 63:220381857$ |
| $22$ | $22:1517653266\quad 23:-394546478\quad 24:1007277876\quad 25:-1166172318\quad 26:401174535$ |
| $22$ | $27:-990733670\quad 28:-269373815\quad 29:40810680\quad 64:-181802237\quad 65:-96433870$ |
| $22$ | $66:-361371120\quad 67:48797524$ |
| $23$ | $23:2744794764\quad 24:-354286659\quad 25:1228919711\quad 26:-1182713644\quad 27:539654870$ |
| $23$ | $28:-375735970\quad 29:763225360\quad 64:267600432\quad 65:118501539\quad 66:102417982$ |
| $23$ | $67:-299601517$ |
| $24$ | $24:2227695502\quad 25:-314664026\quad 26:-42587737\quad 27:-552155353\quad 28:-367476004$ |
| $24$ | $29:15570571\quad 64:259341097\quad 65:117489140\quad 66:181839556\quad 67:304117143$ |
| $25$ | $25:2009523965\quad 26:-596030683\quad 27:1358020368\quad 28:193757234\quad 29:438093229$ |
| $25$ | $64:141374271\quad 65:170317846\quad 66:395933208\quad 67:89317313$ |
| $26$ | $26:1321063681\quad 27:-75140958\quad 28:456467475\quad 29:-189449342\quad 64:-116200327$ |
| $26$ | $65:-86933000\quad 66:-125246248\quad 67:36449821$ |
| $27$ | $27:1974534090\quad 28:-243156783\quad 29:199808721\quad 64:206465319\quad 65:140861338$ |
| $27$ | $66:65378406\quad 67:-272816816$ |
| $28$ | $28:1903739392\quad 29:-219265161\quad 64:-60902779\quad 65:-19578327\quad 66:178439912$ |
| $28$ | $67:30589243$ |
| $29$ | $29:606632435\quad 64:59374180\quad 65:30317479\quad 66:154080921\quad 67:69996024$ |
| $30$ | $30:1341057594\quad 31:-76287479\quad 32:-228596818\quad 33:-608490662$ |
| $31$ | $31:1221945064\quad 32:-516176393\quad 33:-175130741$ |
| $32$ | $32:1117983128\quad 33:79113387$ |
| $33$ | $33:1138619922$ |
| $34$ | $34:23153059130\quad 40:-308103023\quad 41:-509193916\quad 42:99875524\quad 43:936021081$ |
| $34$ | $44:461103438\quad 45:2073712716\quad 46:572946270\quad 47:1706514582\quad 52:448282070$ |
| $34$ | $53:-687447718\quad 54:-18287587\quad 55:472665235$ |
| $35$ | $35:22488780751\quad 48:115312481\quad 49:-1022176280\quad 50:-363878063\quad 51:-174098479$ |
| $35$ | $56:331420945\quad 57:1433024552\quad 58:376887895\quad 59:1237452950\quad 60:-757372854$ |
| $35$ | $61:-827516254\quad 62:-180312049\quad 63:595312647$ |
| $36$ | $36:322483565\quad 37:-32372982\quad 38:16660165\quad 39:-175329769$ |
| $37$ | $37:385471119\quad 38:-189621972\quad 39:4533014$ |
| $38$ | $38:182065203\quad 39:62090412$ |
| $39$ | $39:191173130$ |
| $40$ | $40:679816245\quad 41:14505267\quad 42:307972454\quad 43:46001959\quad 44:302682276$ |
| $40$ | $45:-314747217\quad 46:117409820\quad 47:-39600991\quad 52:77507540\quad 53:318820143$ |
| $40$ | $54:323772435\quad 55:317862622$ |
| $41$ | $41:628169322\quad 42:42868735\quad 43:343258340\quad 44:-89025037\quad 45:326155930$ |
| $41$ | $46:155126957\quad 47:256912891\quad 52:196146963\quad 53:266749449\quad 54:18949770$ |
| $41$ | $55:104586051$ |
| $42$ | $42:623722852\quad 43:169757404\quad 44:177705599\quad 45:35701427\quad 46:276002028$ |
| $42$ | $47:219226897\quad 52:331842343\quad 53:311153996\quad 54:199511831\quad 55:250789516$ |
| $43$ | $43:535321791\quad 44:50871971\quad 45:492289408\quad 46:357094146\quad 47:501046929$ |
| $43$ | $52:275684804\quad 53:368429806\quad 54:195921423\quad 55:373394099$ |
| $44$ | $44:347465847\quad 45:-5410614\quad 46:124889783\quad 47:-11384420\quad 52:66141848$ |
| $44$ | $53:213832816\quad 54:278173135\quad 55:223231595$ |
| $45$ | $45:1117418721\quad 46:378641751\quad 47:401178005\quad 52:356879981\quad 53:141960564$ |
| $45$ | $54:29589156\quad 55:59376105$ |
| $46$ | $46:850071561\quad 47:387424930\quad 52:522907798\quad 53:234711193\quad 54:347445794$ |
| $46$ | $55:248065421$ |
| $47$ | $47:1030685781\quad 52:439890133\quad 53:213228949\quad 54:60661620\quad 55:497744318$ |
| $48$ | $48:711176001\quad 49:313723006\quad 50:339748969\quad 51:247923968\quad 56:266722344$ |
| $48$ | $57:425511129\quad 58:594601658\quad 59:380181978\quad 60:257236981\quad 61:314816153$ |
| $48$ | $62:490854973\quad 63:456346475$ |
| $49$ | $49:1307234142\quad 50:651626158\quad 51:691771890\quad 56:622553938\quad 57:409411796$ |
| $49$ | $58:363214981\quad 59:217894588\quad 60:695130242\quad 61:501679963\quad 62:551339570$ |
| $49$ | $63:652929201$ |
| $50$ | $50:1076607919\quad 51:723613259\quad 56:592864220\quad 57:315976614\quad 58:599324328$ |
| $50$ | $59:286308152\quad 60:725264669\quad 61:267435111\quad 62:502350405\quad 63:700418182$ |
| $51$ | $51:1267773669\quad 56:520187403\quad 57:196672051\quad 58:283169252\quad 59:573478973$ |
| $51$ | $60:642740134\quad 61:286446112\quad 62:600431560\quad 63:743813710$ |
| $52$ | $52:755015289\quad 53:220779104\quad 54:247106073\quad 55:244430920$ |
| $53$ | $53:1099696562\quad 54:361507374\quad 55:528035497$ |
| $54$ | $54:634822804\quad 55:418721969$ |
| $55$ | $55:976427994$ |
| $56$ | $56:819551554\quad 57:303887238\quad 58:496915741\quad 59:207421382\quad 60:606533624$ |
| $56$ | $61:158258611\quad 62:416803618\quad 63:383805241$ |
| $57$ | $57:1358986981\quad 58:587210627\quad 59:416490907\quad 60:-22262340\quad 61:416579522$ |
| $57$ | $62:210252295\quad 63:751868439$ |
| $58$ | $58:1147712473\quad 59:453705401\quad 60:364807336\quad 61:290921286\quad 62:533552918$ |
| $58$ | $63:701045482$ |
| $59$ | $59:892614368\quad 60:202660782\quad 61:314581220\quad 62:366472731\quad 63:638471893$ |
| $60$ | $60:1065198434\quad 61:382317225\quad 62:582749912\quad 63:480670505$ |
| $61$ | $61:820614195\quad 62:209147326\quad 63:640713657$ |
| $62$ | $62:1124744288\quad 63:705419316$ |
| $63$ | $63:1489085178$ |
| $64$ | $64:1124187182\quad 65:722768230\quad 66:660506923\quad 67:479045405$ |
| $65$ | $65:1043593418\quad 66:438288486\quad 67:581254898$ |
| $66$ | $66:908283420\quad 67:553836102$ |
| $67$ | $67:916891364$ |

**Lower-triangular rational factor $R^{(2)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="neutral-block-02-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:193177626432$ |
| $1$ | $1:200236161042$ |
| $2$ | $2:44286314252$ |
| $3$ | $2:14557122102\quad 3:37773732409$ |
| $4$ | $2:8145104376\quad 3:344318505\quad 4:37097939127$ |
| $5$ | $2:-2143750290\quad 3:6793329792\quad 4:10238620464\quad 5:40144489074$ |
| $6$ | $0:-11210042296\quad 6:41437898845$ |
| $7$ | $0:8934793262\quad 6:9617625253\quad 7:39358819721$ |
| $8$ | $0:4152000844\quad 6:9013541094\quad 7:-2752068949\quad 8:40249302074$ |
| $9$ | $0:6520835312\quad 6:794530456\quad 7:2374232741\quad 8:3212711001\quad 9:32380347390$ |
| $10$ | $0:-13679707929\quad 6:12523800651\quad 7:-19518743743\quad 8:-6758979398\quad 9:10853411088$ |
| $10$ | $10:29423868273$ |
| $11$ | $0:15026297826\quad 6:-21881126797\quad 7:7439875742\quad 8:-4373059795\quad 9:21717307583$ |
| $11$ | $10:11704776830\quad 11:30023843632$ |
| $12$ | $0:-13067016018\quad 6:-5439373799\quad 7:-10758902948\quad 8:1195073296\quad 9:11539761283$ |
| $12$ | $10:12343744345\quad 11:-1645267907\quad 12:44826573579$ |
| $13$ | $0:16394895861\quad 6:-5888367769\quad 7:21563071238\quad 8:6371674786\quad 9:6240767859$ |
| $13$ | $10:-6421677052\quad 11:2372482082\quad 12:6087456839\quad 13:28358193813$ |
| $14$ | $1:-4171064655\quad 14:25528958099$ |
| $15$ | $1:-7113694657\quad 14:-10561858823\quad 15:39860399703$ |
| $16$ | $1:-11474199046\quad 14:-4694293736\quad 15:734870750\quad 16:38875747614$ |
| $17$ | $1:10509815410\quad 14:-5031803801\quad 15:7267171767\quad 16:6305098807\quad 17:32265989712$ |
| $18$ | $0:-6888098175\quad 6:-4347394677\quad 7:-2274743721\quad 8:5095350823\quad 9:2260652450$ |
| $18$ | $10:4692800889\quad 11:2899716581\quad 12:13676027792\quad 13:9111474901\quad 18:17524680057$ |
| $19$ | $0:-10027065017\quad 6:15664608104\quad 7:-603112560\quad 8:-1169022725\quad 9:7252348079$ |
| $19$ | $10:-470838128\quad 11:4757778839\quad 12:-4342947289\quad 13:-7706975577\quad 18:-4682449116$ |
| $19$ | $19:38152550165$ |
| $20$ | $0:-15505777643\quad 6:23843881117\quad 7:-14917223985\quad 8:-7897736059\quad 9:7777936467$ |
| $20$ | $10:18672997553\quad 11:-1864038984\quad 12:-3539188748\quad 13:2064303217\quad 18:2990099117$ |
| $20$ | $19:-12781154517\quad 20:24246556556$ |
| $21$ | $0:2021982220\quad 6:12724319208\quad 7:17393859699\quad 8:14442604474\quad 9:2844166532$ |
| $21$ | $10:1840960686\quad 11:1453357579\quad 12:-21306590578\quad 13:1057431776\quad 18:-1416419415$ |
| $21$ | $19:1626876561\quad 20:9490027453\quad 21:22995862589$ |
| $22$ | $1:-14869849125\quad 14:3637302413\quad 15:5092920990\quad 16:20021193145\quad 17:-12061789009$ |
| $22$ | $22:26663422716$ |
| $23$ | $1:22762764769\quad 14:9702253050\quad 15:-4372129261\quad 16:-12152699808\quad 17:-8821023167$ |
| $23$ | $22:2543691062\quad 23:43374337447$ |
| $24$ | $1:-13474247583\quad 14:24238544352\quad 15:-8355597309\quad 16:10282561745\quad 17:-14393011948$ |
| $24$ | $22:14320543333\quad 23:-8246881405\quad 24:28332635461$ |
| $25$ | $1:21198213988\quad 14:11672151208\quad 15:-3422322184\quad 16:-19546142599\quad 17:10640043383$ |
| $25$ | $22:-13363196121\quad 23:11723297486\quad 24:10646027620\quad 25:22079344498$ |
| $26$ | $1:-6033691865\quad 14:-6378066400\quad 15:11468054258\quad 16:15832257604\quad 17:8386224311$ |
| $26$ | $22:2266014038\quad 23:-15509931263\quad 24:-2679664663\quad 25:4820443231\quad 26:22699406202$ |
| $27$ | $1:11078760452\quad 14:50596430\quad 15:-1116622461\quad 16:-16629870430\quad 17:15093312208$ |
| $27$ | $22:-11457236614\quad 23:5585861431\quad 24:6527520522\quad 25:15626955221\quad 26:8648105313$ |
| $27$ | $27:28670803778$ |
| $28$ | $1:5393680774\quad 14:6613143693\quad 15:5183199484\quad 16:3125701692\quad 17:15546930368$ |
| $28$ | $22:-4300974759\quad 23:-8160261449\quad 24:-7971794305\quad 25:1752929907\quad 26:6398912765$ |
| $28$ | $27:-17945930013\quad 28:32214256336$ |
| $29$ | $1:8853211502\quad 14:-2154146096\quad 15:4837159959\quad 16:-1830911000\quad 17:-1486026654$ |
| $29$ | $22:6540401480\quad 23:12720770683\quad 24:8335768900\quad 25:5510643637\quad 26:636874538$ |
| $29$ | $27:-1497625972\quad 28:-2832355517\quad 29:13395382925$ |
| $30$ | $30:36619087837$ |
| $31$ | $30:-2083270871\quad 31:34892764959$ |
| $32$ | $30:-6242559045\quad 31:-15165932967\quad 32:29136026870$ |
| $33$ | $30:-16616761857\quad 31:-6011216285\quad 32:-3973892315\quad 33:28468870825$ |
| $34$ | $2:25075054851\quad 3:3445854712\quad 4:43743433076\quad 5:-30084090924\quad 34:140334551610$ |
| $35$ | $0:-1108402236\quad 6:11775065934\quad 7:-10018604228\quad 8:52988978736\quad 9:45906448355$ |
| $35$ | $10:-47972337957\quad 11:-52395949617\quad 12:-12800207270\quad 13:-21773815164\quad 18:16621967477$ |
| $35$ | $19:-30461846126\quad 20:14550643415\quad 21:-4763474651\quad 35:101044261856$ |
| $36$ | $36:17955042885$ |
| $37$ | $36:-1803002210\quad 37:19547897637$ |
| $38$ | $36:927882217\quad 37:-9614793458\quad 38:9415943094$ |
| $39$ | $36:-9764931787\quad 37:-668776757\quad 38:6873551329\quad 39:6930098627$ |
| $40$ | $2:3598809241\quad 3:1969063413\quad 4:1360486251\quad 5:5676599805\quad 34:-2094035003$ |
| $40$ | $40:24988555691$ |
| $41$ | $2:9375066451\quad 3:5615358807\quad 4:3233687075\quad 5:-5849368392\quad 34:-7703373292$ |
| $41$ | $40:-704994847\quad 41:20103093692$ |
| $42$ | $2:5694048540\quad 3:4804433890\quad 4:7751139810\quad 5:2619127484\quad 34:-2278311571$ |
| $42$ | $40:9918000291\quad 41:-2874932286\quad 42:19732090919$ |
| $43$ | $2:9117994957\quad 3:8431435015\quad 4:9264490761\quad 5:2840141289\quad 34:2554722200$ |
| $43$ | $40:-1072125822\quad 41:10745097549\quad 42:2302188660\quad 43:12596206480$ |
| $44$ | $2:2739030060\quad 3:2036779081\quad 4:-3822117233\quad 5:7222134591\quad 34:5485944399$ |
| $44$ | $40:10585046016\quad 41:-1085093376\quad 42:3417304518\quad 43:1964735742\quad 44:10492517079$ |
| $45$ | $2:12541217606\quad 3:5121296723\quad 4:6287086476\quad 5:-4412786190\quad 34:9504575526$ |
| $45$ | $40:-13348742064\quad 41:9823725765\quad 42:4297644673\quad 43:10717598896\quad 44:6650349624$ |
| $45$ | $45:18226724309$ |
| $46$ | $2:9487894536\quad 3:4987761196\quad 4:9467266740\quad 5:7957666178\quad 34:1019835071$ |
| $46$ | $40:701380161\quad 41:3106637715\quad 42:5477800789\quad 43:5586904437\quad 44:2679322986$ |
| $46$ | $45:4258283548\quad 46:22009209829$ |
| $47$ | $2:7804250655\quad 3:5473617329\quad 4:11374431762\quad 5:6568423019\quad 34:8494056566$ |
| $47$ | $40:-4539642726\quad 41:10788560076\quad 42:7019823685\quad 43:8022390143\quad 44:-7096716730$ |
| $47$ | $45:-4582524277\quad 46:1925726638\quad 47:19218186628$ |
| $48$ | $0:-2257248068\quad 6:6280963368\quad 7:1798539423\quad 8:2882625610\quad 9:6341718931$ |
| $48$ | $10:4742542380\quad 11:2107495993\quad 12:-1043592960\quad 13:-308627267\quad 18:-1687016920$ |
| $48$ | $19:1336322931\quad 20:86825820\quad 21:39069923\quad 35:-14592608\quad 48:24124883627$ |
| $49$ | $0:-5529993492\quad 6:7478827539\quad 7:3656828736\quad 8:3966249298\quad 9:7728578397$ |
| $49$ | $10:6910083098\quad 11:7388229194\quad 12:1574238576\quad 13:700072897\quad 18:404301527$ |
| $49$ | $19:992442250\quad 20:934107931\quad 21:2109428746\quad 35:-8617258754\quad 48:5795967241$ |
| $49$ | $49:30202010813$ |
| $50$ | $0:929691819\quad 6:8562926995\quad 7:419987464\quad 8:-1244339964\quad 9:15028868693$ |
| $50$ | $10:3515903188\quad 11:1285722168\quad 12:2317831153\quad 13:-76838852\quad 18:-2612985395$ |
| $50$ | $19:-1946738086\quad 20:3615170140\quad 21:2561162803\quad 35:-8666474651\quad 48:7305772323$ |
| $50$ | $49:10587661336\quad 50:22011545812$ |
| $51$ | $0:3543960740\quad 6:10746311715\quad 7:3299696877\quad 8:2922124112\quad 9:13550056576$ |
| $51$ | $10:-2308713287\quad 11:-471187414\quad 12:4812267182\quad 13:-4350474035\quad 18:-867260712$ |
| $51$ | $19:151259043\quad 20:5002622377\quad 21:925983615\quad 35:-12454484705\quad 48:4204860822$ |
| $51$ | $49:12562252908\quad 50:5908347145\quad 51:22288802901$ |
| $52$ | $2:10954342446\quad 3:5662002503\quad 4:6561428610\quad 5:6944995457\quad 34:541601159$ |
| $52$ | $40:-811589615\quad 41:4211357701\quad 42:9862479396\quad 43:-1798891491\quad 44:-1949325312$ |
| $52$ | $45:6166898145\quad 46:8872214040\quad 47:4785982523\quad 52:15777506923$ |
| $53$ | $2:9681168759\quad 3:3628820282\quad 4:11364452229\quad 5:10715876604\quad 34:-7962762411$ |
| $53$ | $40:7358122701\quad 41:6237351199\quad 42:2496099613\quad 43:5502003280\quad 44:9453867106$ |
| $53$ | $45:-2311801638\quad 46:-6561860314\quad 47:-2113562671\quad 52:982956777\quad 53:20311483468$ |
| $54$ | $2:8994232140\quad 3:10712116482\quad 4:-3144115933\quad 5:7810327860\quad 34:653938670$ |
| $54$ | $40:9269117705\quad 41:-2890069888\quad 42:101196964\quad 43:5527686558\quad 44:4503329418$ |
| $54$ | $45:-1511901012\quad 46:6408214726\quad 47:-2516712630\quad 52:3542558877\quad 53:4881011585$ |
| $54$ | $54:11687144548$ |
| $55$ | $2:10887559377\quad 3:9118706884\quad 4:6356073693\quad 5:7897637099\quad 34:910638857$ |
| $55$ | $40:8369947297\quad 41:-503999861\quad 42:-372698482\quad 43:10228648536\quad 44:2776403998$ |
| $55$ | $45:-8089333239\quad 46:-2592938380\quad 47:9500123511\quad 52:2555212203\quad 53:4024416265$ |
| $55$ | $54:2770278985\quad 55:17188413084$ |
| $56$ | $0:-6352918807\quad 6:3014861056\quad 7:2175997780\quad 8:-7209010589\quad 9:15624057294$ |
| $56$ | $10:717757179\quad 11:1976759698\quad 12:353897406\quad 13:-3108083213\quad 18:5679929225$ |
| $56$ | $19:-1564461856\quad 20:688275685\quad 21:-1892407248\quad 35:-1096575905\quad 48:6414161306$ |
| $56$ | $49:13336600565\quad 50:6302201822\quad 51:2598444241\quad 56:12228485589$ |
| $57$ | $0:-10575329300\quad 6:3629640364\quad 7:-3319776705\quad 8:9497329234\quad 9:6493849273$ |
| $57$ | $10:6261078693\quad 11:3426873384\quad 12:-2166638517\quad 13:-971494927\quad 18:-1722550881$ |
| $57$ | $19:-1147573262\quad 20:985888135\quad 21:-4214865648\quad 35:9245644106\quad 48:11424667073$ |
| $57$ | $49:6848417963\quad 50:5157343433\quad 51:2731557341\quad 56:-676535360\quad 57:26710632702$ |
| $58$ | $0:-3649337374\quad 6:4425268288\quad 7:6261510347\quad 8:-4439187720\quad 9:15210193733$ |
| $58$ | $10:3302583096\quad 11:-5150620827\quad 12:1744351748\quad 13:1779513605\quad 18:-5197862637$ |
| $58$ | $19:-562157038\quad 20:4050806295\quad 21:4391791074\quad 35:-976430336\quad 48:18762871139$ |
| $58$ | $49:2343687359\quad 50:4918334617\quad 51:-6236655585\quad 56:4623907164\quad 57:10390828975$ |
| $58$ | $58:12916869831$ |
| $59$ | $0:-2367768864\quad 6:6695757570\quad 7:273911547\quad 8:5878414720\quad 9:9900191380$ |
| $59$ | $10:-5393984253\quad 11:-3369378216\quad 12:5105141978\quad 13:-6024990704\quad 18:-2871748245$ |
| $59$ | $19:-3605450694\quad 20:5498546218\quad 21:4970316478\quad 35:-2244699806\quad 48:11937000518$ |
| $59$ | $49:424800201\quad 50:-2621567896\quad 51:8560997038\quad 56:-2030699700\quad 57:6556854430$ |
| $59$ | $58:838846173\quad 59:15960611322$ |
| $60$ | $0:847177507\quad 6:6797997860\quad 7:5582429346\quad 8:-975511110\quad 9:9095433006$ |
| $60$ | $10:3273682232\quad 11:43837671\quad 12:1949889538\quad 13:-2248835079\quad 18:575956948$ |
| $60$ | $19:-373928344\quad 20:6032070559\quad 21:-174885119\quad 35:-11090501401\quad 48:5722634710$ |
| $60$ | $49:13370914985\quad 50:9526028978\quad 51:17197231\quad 56:10173665736\quad 57:-7138575083$ |
| $60$ | $58:-3083669444\quad 59:1980528085\quad 60:15927672646$ |
| $61$ | $0:-2838994857\quad 6:8877096422\quad 7:3884255536\quad 8:3949954472\quad 9:-4013042937$ |
| $61$ | $10:8009736431\quad 11:-1944198954\quad 12:6766922430\quad 13:715484824\quad 18:-3254072111$ |
| $61$ | $19:-580062854\quad 20:-661232333\quad 21:7075769213\quad 35:-4523123833\quad 48:9455901617$ |
| $61$ | $49:8688075019\quad 50:-421049497\quad 51:472308691\quad 56:3718515762\quad 57:8593450381$ |
| $61$ | $58:-7998862211\quad 59:3343525770\quad 60:5524508189\quad 61:11492501674$ |
| $62$ | $0:10258980207\quad 6:7485350770\quad 7:1022775695\quad 8:6297136892\quad 9:10420904750$ |
| $62$ | $10:-4619871176\quad 11:10277780139\quad 12:-241580182\quad 13:136409256\quad 18:-1820444256$ |
| $62$ | $19:1610286030\quad 20:6393359909\quad 21:-1492707140\quad 35:-7550757172\quad 48:15549429164$ |
| $62$ | $49:7954197760\quad 50:-48170193\quad 51:1126196866\quad 56:9174154523\quad 57:-449490921$ |
| $62$ | $58:7209950854\quad 59:-964533328\quad 60:3519583893\quad 61:1172567532\quad 62:11118760444$ |
| $63$ | $0:7502052571\quad 6:12989015120\quad 7:-10299642049\quad 8:6832229868\quad 9:16451723833$ |
| $63$ | $10:5077067430\quad 11:-2801267542\quad 12:5048679750\quad 13:1641360911\quad 18:-6935386362$ |
| $63$ | $19:-1538338735\quad 20:4707684507\quad 21:5313245416\quad 35:-5417470856\quad 48:10920478918$ |
| $63$ | $49:11123548334\quad 50:1168577728\quad 51:3037567519\quad 56:1336416074\quad 57:15284441747$ |
| $63$ | $58:404758248\quad 59:1586641842\quad 60:4078962302\quad 61:8708773592\quad 62:1288050069$ |
| $63$ | $63:7921491985$ |
| $64$ | $1:6239274262\quad 14:5277694367\quad 15:1638596810\quad 16:5078401025\quad 17:1925296996$ |
| $64$ | $22:-7314143736\quad 23:4123180562\quad 24:12120870073\quad 25:-11015737378\quad 26:258675357$ |
| $64$ | $27:6217243280\quad 28:1374713437\quad 29:-908301771\quad 64:25395422854$ |
| $65$ | $1:3131453134\quad 14:4835243687\quad 15:-1470889801\quad 16:8360888820\quad 17:5009326424$ |
| $65$ | $22:-6260984782\quad 23:3587330813\quad 24:4784822040\quad 25:-1090281854\quad 26:-4705321936$ |
| $65$ | $27:3572965009\quad 28:-875537078\quad 29:760217664\quad 64:18835006802\quad 65:21118387434$ |
| $66$ | $1:9845332945\quad 14:5169992866\quad 15:8343926695\quad 16:-5559478825\quad 17:3202055247$ |
| $66$ | $22:-4738415570\quad 23:-3749523033\quad 24:14085915787\quad 25:-7093445341\quad 26:-1888555507$ |
| $66$ | $27:-6052597510\quad 28:-226391025\quad 29:1801445021\quad 64:13868068612\quad 65:3967770584$ |
| $66$ | $66:11702003086$ |
| $67$ | $1:-3262931563\quad 14:6434018962\quad 15:5933249763\quad 16:2325958484\quad 17:2420066701$ |
| $67$ | $22:-2652320817\quad 23:-4736692391\quad 24:5774653731\quad 25:3714568327\quad 26:-6046485752$ |
| $67$ | $27:-9612392851\quad 28:-6654145522\quad 29:5337813047\quad 64:19122794677\quad 65:7110257790$ |
| $67$ | $66:4180696806\quad 67:10306251704$ |

**Neutral block 3: localizer 1; dimension $24$.**

Use $\Lambda^{\mathrm{tab}}_1$. If there are $k$ listed basis polynomials, matrix index $ak+i$ denotes localizer component $a\in\{0,1\}$ and basis index $i<k$.

<a id="neutral-block-03-basis"></a>

| Index $i$ | Basis polynomial $v_i$ |
|:--|:--|
| $0$ | $H\,b\,b$ |
| $1$ | $b\,H\,b$ |
| $2$ | $b\,b\,H$ |
| $3$ | $H\,b\,b^*$ |
| $4$ | $b\,H\,b^*$ |
| $5$ | $b\,b^*\,H$ |
| $6$ | $H\,b^*\,b$ |
| $7$ | $b^*\,H\,b$ |
| $8$ | $b^*\,b\,H$ |
| $9$ | $H\,b^*\,b^*$ |
| $10$ | $b^*\,H\,b^*$ |
| $11$ | $b^*\,b^*\,H$ |

**Gram $Q^{(3)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="neutral-block-03-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:7397231194\quad 1:4473470647\quad 2:3848000656\quad 15:5083636171\quad 16:5648483419$ |
| $0$ | $17:5256447026\quad 18:5377805181\quad 19:5325694117\quad 20:5720714827$ |
| $1$ | $1:5813501731\quad 2:3842571449\quad 15:4177630645\quad 16:4557508108\quad 17:5317863027$ |
| $1$ | $18:4879606855\quad 19:4458325990\quad 20:5633819999$ |
| $2$ | $2:7008532259\quad 15:3670453803\quad 16:4780252084\quad 17:5895629601\quad 18:4433101309$ |
| $2$ | $19:6030560041\quad 20:4753161327$ |
| $3$ | $3:3633667791\quad 4:477877858\quad 5:2507919094\quad 6:1264944449\quad 7:1599119944$ |
| $3$ | $8:3264082586\quad 21:4745360759\quad 22:4205388403\quad 23:3964536677$ |
| $4$ | $4:4806359740\quad 5:751175345\quad 6:1225057978\quad 7:1739894107\quad 8:1312440795$ |
| $4$ | $21:3495558313\quad 22:2872513458\quad 23:4844571041$ |
| $5$ | $5:3013626389\quad 6:1799407457\quad 7:1334420586\quad 8:2235440054\quad 21:4159774581$ |
| $5$ | $22:4274242500\quad 23:3353650239$ |
| $6$ | $6:2688390083\quad 7:-258074699\quad 8:1746361601\quad 21:2954132141\quad 22:2791741033$ |
| $6$ | $23:2285853742$ |
| $7$ | $7:4875215642\quad 8:-362183667\quad 21:3530360370\quad 22:2868159095\quad 23:3302432417$ |
| $8$ | $8:5908572123\quad 21:4580762308\quad 22:4408311023\quad 23:4947271987$ |
| $9$ | $9:2777625220\quad 10:2267675785\quad 11:628444714$ |
| $10$ | $10:4936097362\quad 11:2396871643$ |
| $11$ | $11:3605247053$ |
| $12$ | $12:7313123082\quad 13:7012544916\quad 14:6874916670$ |
| $13$ | $13:6827158708\quad 14:7003962589$ |
| $14$ | $14:8145768805$ |
| $15$ | $15:4820566674\quad 16:4463069366\quad 17:4810466817\quad 18:4615766301\quad 19:5017009319$ |
| $15$ | $20:5136364656$ |
| $16$ | $16:6410829137\quad 17:5294474645\quad 18:5627709907\quad 19:5596756846\quad 20:5687691158$ |
| $17$ | $17:8519650012\quad 18:5605496326\quad 19:5939126842\quad 20:6642702163$ |
| $18$ | $18:5914556872\quad 19:5461451833\quad 20:5506624507$ |
| $19$ | $19:7251074204\quad 20:5609553336$ |
| $20$ | $20:7655648283$ |
| $21$ | $21:10659144806\quad 22:8981294606\quad 23:8990013465$ |
| $22$ | $22:8624871426\quad 23:8468243214$ |
| $23$ | $23:10447494498$ |

**Lower-triangular rational factor $R^{(3)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="neutral-block-03-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:86006576458$ |
| $1$ | $0:52013123080\quad 1:55749769134$ |
| $2$ | $0:44740772328\quad 1:27183326044\quad 2:65328112905$ |
| $3$ | $3:60279082533$ |
| $4$ | $3:7927755996\quad 4:68872421366$ |
| $5$ | $3:41605130480\quad 4:6117688532\quad 5:35286164339$ |
| $6$ | $3:20984799301\quad 4:15371836629\quad 5:23586922833\quad 6:38148289493$ |
| $7$ | $3:26528604564\quad 4:22208915742\quad 5:2687379155\quad 6:-31968693406\quad 7:51467402097$ |
| $8$ | $3:54149506742\quad 4:12823082167\quad 5:-2717916893\quad 6:12504834371\quad 7:-32572345067$ |
| $8$ | $8:39839126350$ |
| $9$ | $9:52702231642$ |
| $10$ | $9:43028078971\quad 10:55539011353$ |
| $11$ | $9:11924442181\quad 10:33918245163\quad 11:48088536854$ |
| $12$ | $12:85516215316$ |
| $13$ | $12:82002517184\quad 13:10131430473$ |
| $14$ | $12:80393135320\quad 13:40618462464\quad 14:5723032888$ |
| $15$ | $0:59107528521\quad 1:19789561575\quad 2:7469850273\quad 15:29653690085$ |
| $16$ | $0:65675017558\quad 1:20476234327\quad 2:19674361692\quad 15:977994859\quad 16:35919466193$ |
| $17$ | $0:61116803418\quad 1:38367642446\quad 2:32424883952\quad 15:6627025655\quad 16:-4159789591$ |
| $17$ | $17:46900063405$ |
| $18$ | $0:62527836853\quad 1:29190054168\quad 2:12889930523\quad 15:8294285628\quad 16:18423932224$ |
| $18$ | $17:5709160472\quad 18:23359921946$ |
| $19$ | $0:61921940581\quad 1:22198701312\quad 2:40666872832\quad 15:20701586569\quad 16:7103270681$ |
| $19$ | $17:-2629346734\quad 18:5559465858\quad 19:27445169467$ |
| $20$ | $0:66514853429\quad 1:38998811560\quad 2:10977173096\quad 15:11838959559\quad 16:8163564297$ |
| $20$ | $17:14516026030\quad 18:-11290825671\quad 19:-854079810\quad 20:32313851059$ |
| $21$ | $3:78723174932\quad 4:41692453001\quad 5:17837732900\quad 6:6304746878\quad 7:13010526226$ |
| $21$ | $8:4436354201\quad 21:46653577760$ |
| $22$ | $3:69765302096\quad 4:33677212445\quad 5:33033380895\quad 6:809833333\quad 7:4013505552$ |
| $22$ | $8:10268626397\quad 21:29857161920\quad 22:22771831177$ |
| $23$ | $3:65769691747\quad 4:62770625558\quad 5:6611160506\quad 6:-5639748889\quad 7:-669848457$ |
| $23$ | $8:16256302935\quad 21:22497279904\quad 22:31446438643\quad 23:18610596799$ |

**Neutral block 4: localizer 2; dimension $68$.**

Use $\Lambda^{\mathrm{tab}}_2$. If there are $k$ listed basis polynomials, matrix index $ak+i$ denotes localizer component $a\in\{0,1\}$ and basis index $i<k$.

<a id="neutral-block-04-basis"></a>

| Index $i$ | Basis polynomial $v_i$ |
|:--|:--|
| $0$ | $b\,H-H\,b$ |
| $1$ | $b^*\,H-H\,b^*$ |
| $2$ | $H\,b\,b\,b$ |
| $3$ | $b\,H\,b\,b$ |
| $4$ | $b\,b\,H\,b$ |
| $5$ | $b\,b\,b\,H$ |
| $6$ | $H\,b\,b\,b^*$ |
| $7$ | $b\,H\,b\,b^*$ |
| $8$ | $b\,b\,H\,b^*$ |
| $9$ | $b\,b\,b^*\,H$ |
| $10$ | $H\,b\,b^*\,b$ |
| $11$ | $b\,H\,b^*\,b$ |
| $12$ | $b\,b^*\,H\,b$ |
| $13$ | $b\,b^*\,b\,H$ |
| $14$ | $H\,b\,b^*\,b^*$ |
| $15$ | $b\,H\,b^*\,b^*$ |
| $16$ | $b\,b^*\,H\,b^*$ |
| $17$ | $b\,b^*\,b^*\,H$ |
| $18$ | $H\,b^*\,b\,b$ |
| $19$ | $b^*\,H\,b\,b$ |
| $20$ | $b^*\,b\,H\,b$ |
| $21$ | $b^*\,b\,b\,H$ |
| $22$ | $H\,b^*\,b\,b^*$ |
| $23$ | $b^*\,H\,b\,b^*$ |
| $24$ | $b^*\,b\,H\,b^*$ |
| $25$ | $b^*\,b\,b^*\,H$ |
| $26$ | $H\,b^*\,b^*\,b$ |
| $27$ | $b^*\,H\,b^*\,b$ |
| $28$ | $b^*\,b^*\,H\,b$ |
| $29$ | $b^*\,b^*\,b\,H$ |
| $30$ | $H\,b^*\,b^*\,b^*$ |
| $31$ | $b^*\,H\,b^*\,b^*$ |
| $32$ | $b^*\,b^*\,H\,b^*$ |
| $33$ | $b^*\,b^*\,b^*\,H$ |

**Gram $Q^{(4)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="neutral-block-04-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:22488780751\quad 6:-757372854\quad 7:-827516254\quad 8:-180312049\quad 9:595312647$ |
| $0$ | $10:331420945\quad 11:1433024552\quad 12:376887895\quad 13:1237452950\quad 18:115312481$ |
| $0$ | $19:-1022176280\quad 20:-363878063\quad 21:-174098479\quad 35:-214118513\quad 48:-106201290$ |
| $0$ | $49:-770736494\quad 50:380041372\quad 51:909874446\quad 56:-913259847\quad 57:-1718236885$ |
| $0$ | $58:-428443450\quad 59:-191052277\quad 60:500359227\quad 61:-290975611\quad 62:2261874255$ |
| $0$ | $63:1635046462$ |
| $1$ | $1:23153059130\quad 14:448282070\quad 15:-687447718\quad 16:-18287587\quad 17:472665235$ |
| $1$ | $22:461103438\quad 23:2073712716\quad 24:572946270\quad 25:1706514582\quad 26:-308103023$ |
| $1$ | $27:-509193916\quad 28:99875524\quad 29:936021081\quad 64:1110481759\quad 65:495183429$ |
| $1$ | $66:1828216628\quad 67:-790183879$ |
| $2$ | $2:1124187182\quad 3:722768230\quad 4:660506923\quad 5:479045405\quad 34:1249328326$ |
| $2$ | $40:-116200327\quad 41:206465319\quad 42:-60902779\quad 43:59374180\quad 44:-181802237$ |
| $2$ | $45:267600432\quad 46:259341097\quad 47:141374271\quad 52:108709622\quad 53:-34811431$ |
| $2$ | $54:102265071\quad 55:145066696$ |
| $3$ | $3:1043593418\quad 4:438288486\quad 5:581254898\quad 34:627030154\quad 40:-86933000$ |
| $3$ | $41:140861338\quad 42:-19578327\quad 43:30317479\quad 44:-96433870\quad 45:118501539$ |
| $3$ | $46:117489140\quad 47:170317846\quad 52:110377240\quad 53:-131975618\quad 54:265325919$ |
| $3$ | $55:212238893$ |
| $4$ | $4:908283420\quad 5:553836102\quad 34:1971391673\quad 40:-125246248\quad 41:65378406$ |
| $4$ | $42:178439912\quad 43:154080921\quad 44:-361371120\quad 45:102417982\quad 46:181839556$ |
| $4$ | $47:395933208\quad 52:90919011\quad 53:207950826\quad 54:-347233963\quad 55:206359409$ |
| $5$ | $5:916891364\quad 34:-653356890\quad 40:36449821\quad 41:-272816816\quad 42:30589243$ |
| $5$ | $43:69996024\quad 44:48797524\quad 45:-299601517\quad 46:304117143\quad 47:89317313$ |
| $5$ | $52:177863699\quad 53:191758006\quad 54:102019898\quad 55:69201661$ |
| $6$ | $6:1065198434\quad 7:382317225\quad 8:582749912\quad 9:480670505\quad 10:606533624$ |
| $6$ | $11:-22262340\quad 12:364807336\quad 13:202660782\quad 18:257236981\quad 19:695130242$ |
| $6$ | $20:725264669\quad 21:642740134\quad 35:163655740\quad 48:-736720\quad 49:152297512$ |
| $6$ | $50:346390972\quad 51:211058564\quad 56:166219949\quad 57:146942849\quad 58:123429808$ |
| $6$ | $59:71959885\quad 60:272197852\quad 61:292667782\quad 62:10164643\quad 63:315558753$ |
| $7$ | $7:820614195\quad 8:209147326\quad 9:640713657\quad 10:158258611\quad 11:416579522$ |
| $7$ | $12:290921286\quad 13:314581220\quad 18:314816153\quad 19:501679963\quad 20:267435111$ |
| $7$ | $21:286446112\quad 35:-548430288\quad 48:57169297\quad 49:76640989\quad 50:247702735$ |
| $7$ | $51:249010943\quad 56:239620382\quad 57:-277048099\quad 58:310838758\quad 59:-9502111$ |
| $7$ | $60:399673476\quad 61:212890468\quad 62:216519736\quad 63:-119491030$ |
| $8$ | $8:1124744288\quad 9:705419316\quad 10:416803618\quad 11:210252295\quad 12:533552918$ |
| $8$ | $13:366472731\quad 18:490854973\quad 19:551339570\quad 20:502350405\quad 21:600431560$ |
| $8$ | $35:1981805446\quad 48:-75730181\quad 49:203018448\quad 50:60173285\quad 51:297634435$ |
| $8$ | $56:-131952445\quad 57:451256047\quad 58:-142758953\quad 59:307779236\quad 60:195173606$ |
| $8$ | $61:203908410\quad 62:360705427\quad 63:432936164$ |
| $9$ | $9:1489085178\quad 10:383805241\quad 11:751868439\quad 12:701045482\quad 13:638471893$ |
| $9$ | $18:456346475\quad 19:652929201\quad 20:700418182\quad 21:743813710\quad 35:1449228709$ |
| $9$ | $48:-34546505\quad 49:169271383\quad 50:619641922\quad 51:220381857\quad 56:542847406$ |
| $9$ | $57:54616252\quad 58:433739153\quad 59:8653900\quad 60:454139168\quad 61:-213428986$ |
| $9$ | $62:451563359\quad 63:589448583$ |
| $10$ | $10:819551554\quad 11:303887238\quad 12:496915741\quad 13:207421382\quad 18:266722344$ |
| $10$ | $19:622553938\quad 20:592864220\quad 21:520187403\quad 35:-1227241776\quad 48:109450991$ |
| $10$ | $49:176553787\quad 50:372107757\quad 51:-50522664\quad 56:321609913\quad 57:293348750$ |
| $10$ | $58:236357502\quad 59:-109318883\quad 60:196145996\quad 61:57878492\quad 62:-295348891$ |
| $10$ | $63:448887322$ |
| $11$ | $11:1358986981\quad 12:587210627\quad 13:416490907\quad 18:425511129\quad 19:409411796$ |
| $11$ | $20:315976614\quad 21:196672051\quad 35:-2042917013\quad 48:98337673\quad 49:195427815$ |
| $11$ | $50:425155688\quad 51:97341394\quad 56:445435497\quad 57:12641578\quad 58:214973706$ |
| $11$ | $59:-238113752\quad 60:268954559\quad 61:-190242353\quad 62:380204264\quad 63:166827226$ |
| $12$ | $12:1147712473\quad 13:453705401\quad 18:594601658\quad 19:363214981\quad 20:599324328$ |
| $12$ | $21:283169252\quad 35:-704970332\quad 48:-47037041\quad 49:173175182\quad 50:380691431$ |
| $12$ | $51:246181193\quad 56:275387865\quad 57:128670825\quad 58:253898834\quad 59:143422088$ |
| $12$ | $60:224283046\quad 61:256400154\quad 62:-171171030\quad 63:472835095$ |
| $13$ | $13:892614368\quad 18:380181978\quad 19:217894588\quad 20:286308152\quad 21:573478973$ |
| $13$ | $35:-457399969\quad 48:-31577371\quad 49:80052332\quad 50:268726988\quad 51:232941996$ |
| $13$ | $56:19907191\quad 57:-155049877\quad 58:280650529\quad 59:-86235777\quad 60:304000914$ |
| $13$ | $61:54022597\quad 62:286369774\quad 63:329987766$ |
| $14$ | $14:755015289\quad 15:220779104\quad 16:247106073\quad 17:244430920\quad 22:66141848$ |
| $14$ | $23:356879981\quad 24:522907798\quad 25:439890133\quad 26:77507540\quad 27:196146963$ |
| $14$ | $28:331842343\quad 29:275684804\quad 64:485127452\quad 65:373338668\quad 66:334589274$ |
| $14$ | $67:360963747$ |
| $15$ | $15:1099696562\quad 16:361507374\quad 17:528035497\quad 22:213832816\quad 23:141960564$ |
| $15$ | $24:234711193\quad 25:213228949\quad 26:318820143\quad 27:266749449\quad 28:311153996$ |
| $15$ | $29:368429806\quad 64:428743282\quad 65:278004042\quad 66:501701357\quad 67:550437469$ |
| $16$ | $16:634822804\quad 17:418721969\quad 22:278173135\quad 23:29589156\quad 24:347445794$ |
| $16$ | $25:60661620\quad 26:323772435\quad 27:18949770\quad 28:199511831\quad 29:195921423$ |
| $16$ | $64:398321391\quad 65:535566757\quad 66:-39692882\quad 67:334839764$ |
| $17$ | $17:976427994\quad 22:223231595\quad 23:59376105\quad 24:248065421\quad 25:497744318$ |
| $17$ | $26:317862622\quad 27:104586051\quad 28:250789516\quad 29:373394099\quad 64:482169876$ |
| $17$ | $65:502939125\quad 66:327617282\quad 67:420730207$ |
| $18$ | $18:711176001\quad 19:313723006\quad 20:339748969\quad 21:247923968\quad 35:-436049824$ |
| $18$ | $48:-5106225\quad 49:236148560\quad 50:252159515\quad 51:206298753\quad 56:263324415$ |
| $18$ | $57:85932969\quad 58:60900188\quad 59:-17825605\quad 60:285573771\quad 61:111028296$ |
| $18$ | $62:158315590\quad 63:209149530$ |
| $19$ | $19:1307234142\quad 20:651626158\quad 21:691771890\quad 35:-1068271017\quad 48:123785133$ |
| $19$ | $49:277447564\quad 50:360616290\quad 51:275924457\quad 56:358330354\quad 57:233669136$ |
| $19$ | $58:229871222\quad 59:20244650\quad 60:371898360\quad 61:166447675\quad 62:194025103$ |
| $19$ | $63:241560608$ |
| $20$ | $20:1076607919\quad 21:723613259\quad 35:179595659\quad 48:-11516357\quad 49:167958650$ |
| $20$ | $50:469831683\quad 51:195528650\quad 56:361301281\quad 57:241311310\quad 58:253883098$ |
| $20$ | $59:52142952\quad 60:344407818\quad 61:107191838\quad 62:29802726\quad 63:496505306$ |
| $21$ | $21:1267773669\quad 35:684613924\quad 48:-34340000\quad 49:246971467\quad 50:282898309$ |
| $21$ | $51:240216401\quad 56:81080862\quad 57:82982827\quad 58:207587766\quad 59:88788623$ |
| $21$ | $60:405576628\quad 61:264890730\quad 62:220109313\quad 63:487625584$ |
| $22$ | $22:347465847\quad 23:-5410614\quad 24:124889783\quad 25:-11384420\quad 26:302682276$ |
| $22$ | $27:-89025037\quad 28:177705599\quad 29:50871971\quad 64:121301546\quad 65:116809143$ |
| $22$ | $66:-118781686\quad 67:258760411$ |
| $23$ | $23:1117418721\quad 24:378641751\quad 25:401178005\quad 26:-314747217\quad 27:326155930$ |
| $23$ | $28:35701427\quad 29:492289408\quad 64:555404304\quad 65:376014528\quad 66:337150835$ |
| $23$ | $67:-104872536$ |
| $24$ | $24:850071561\quad 25:387424930\quad 26:117409820\quad 27:155126957\quad 28:276002028$ |
| $24$ | $29:357094146\quad 64:420183879\quad 65:326522796\quad 66:430213355\quad 67:429932024$ |
| $25$ | $25:1030685781\quad 26:-39600991\quad 27:256912891\quad 28:219226897\quad 29:501046929$ |
| $25$ | $64:345621497\quad 65:320366386\quad 66:487419081\quad 67:400598199$ |
| $26$ | $26:679816245\quad 27:14505267\quad 28:307972454\quad 29:46001959\quad 64:159377997$ |
| $26$ | $65:126767180\quad 66:80461898\quad 67:247475250$ |
| $27$ | $27:628169322\quad 28:42868735\quad 29:343258340\quad 64:415187139\quad 65:348587048$ |
| $27$ | $66:198257493\quad 67:-183662228$ |
| $28$ | $28:623722852\quad 29:169757404\quad 64:252168423\quad 65:264370360\quad 66:335584188$ |
| $28$ | $67:204935999$ |
| $29$ | $29:535321791\quad 64:403802390\quad 65:451218536\quad 66:420863634\quad 67:246602440$ |
| $30$ | $30:322483565\quad 31:-32372982\quad 32:16660165\quad 33:-175329769$ |
| $31$ | $31:385471119\quad 32:-189621972\quad 33:4533014$ |
| $32$ | $32:182065203\quad 33:62090412$ |
| $33$ | $33:191173130$ |
| $34$ | $34:40094620189\quad 40:-1208163296\quad 41:2218368462\quad 42:1080009932\quad 43:1772733084$ |
| $34$ | $44:-2977481504\quad 45:4557928632\quad 46:-2698031609\quad 47:4244648990\quad 52:-835197974$ |
| $34$ | $53:-1424418909\quad 54:-2297549568\quad 55:2104445091$ |
| $35$ | $35:37317695354\quad 48:-1330626456\quad 49:-1937004620\quad 50:-2995369321\quad 51:390601726$ |
| $35$ | $56:-2642613508\quad 57:2902744548\quad 58:-2524255139\quad 59:3167127068\quad 60:-2165529363$ |
| $35$ | $61:1726002155\quad 62:802073668\quad 63:1259679488$ |
| $36$ | $36:1341057594\quad 37:-76287479\quad 38:-228596818\quad 39:-608490662$ |
| $37$ | $37:1221945064\quad 38:-516176393\quad 39:-175130741$ |
| $38$ | $38:1117983128\quad 39:79113387$ |
| $39$ | $39:1138619922$ |
| $40$ | $40:1321063681\quad 41:-75140958\quad 42:456467475\quad 43:-189449342\quad 44:401174535$ |
| $40$ | $45:-1182713644\quad 46:-42587737\quad 47:-596030683\quad 52:-137658471\quad 53:567407305$ |
| $40$ | $54:723090687\quad 55:422434287$ |
| $41$ | $41:1974534090\quad 42:-243156783\quad 43:199808721\quad 44:-990733670\quad 45:539654870$ |
| $41$ | $46:-552155353\quad 47:1358020368\quad 52:-44918552\quad 53:-123854329\quad 54:-774676636$ |
| $41$ | $55:490214129$ |
| $42$ | $42:1903739392\quad 43:-219265161\quad 44:-269373815\quad 45:-375735970\quad 46:-367476004$ |
| $42$ | $47:193757234\quad 52:146329277\quad 53:98388315\quad 54:32390766\quad 55:582422702$ |
| $43$ | $43:606632435\quad 44:40810680\quad 45:763225360\quad 46:15570571\quad 47:438093229$ |
| $43$ | $52:-91920423\quad 53:152583873\quad 54:-159094663\quad 55:79545136$ |
| $44$ | $44:1517653266\quad 45:-394546478\quad 46:1007277876\quad 47:-1166172318\quad 52:154879643$ |
| $44$ | $53:270368758\quad 54:935626533\quad 55:-400520389$ |
| $45$ | $45:2744794764\quad 46:-354286659\quad 47:1228919711\quad 52:152743448\quad 53:-438676005$ |
| $45$ | $54:-782387960\quad 55:-202603408$ |
| $46$ | $46:2227695502\quad 47:-314664026\quad 52:674986741\quad 53:-493209849\quad 54:434425343$ |
| $46$ | $55:-723869223$ |
| $47$ | $47:2009523965\quad 52:209558738\quad 53:-410492365\quad 54:-1060410904\quad 55:359257908$ |
| $48$ | $48:710291204\quad 49:-187310386\quad 50:119451702\quad 51:-322515486\quad 56:212358181$ |
| $48$ | $57:143501304\quad 58:836509838\quad 59:228574145\quad 60:-102931029\quad 61:-192886574$ |
| $48$ | $62:143559756\quad 63:35799539$ |
| $49$ | $49:1979008117\quad 50:83785900\quad 51:331433184\quad 56:417879986\quad 57:-197966591$ |
| $49$ | $58:-73718885\quad 59:-462507127\quad 60:761512269\quad 61:37328779\quad 62:54168665$ |
| $49$ | $63:176707057$ |
| $50$ | $50:2283590701\quad 51:234964452\quad 56:1489125593\quad 57:-499656947\quad 58:388640431$ |
| $50$ | $59:-805398931\quad 60:1161860757\quad 61:-496343734\quad 62:-126287335\quad 63:108896247$ |
| $51$ | $51:1769434811\quad 56:-220389752\quad 57:-54838699\quad 58:-1167459742\quad 59:334973029$ |
| $51$ | $60:504602546\quad 61:825045515\quad 62:656522095\quad 63:203086958$ |
| $52$ | $52:669225482\quad 53:-239961571\quad 54:-71980802\quad 55:-172293828$ |
| $53$ | $53:1751108978\quad 54:160496658\quad 55:268053955$ |
| $54$ | $54:1665657425\quad 55:153484913$ |
| $55$ | $55:1269535418$ |
| $56$ | $56:1754305708\quad 57:-15143164\quad 58:801000604\quad 59:-883189172\quad 60:672310089$ |
| $56$ | $61:-770010857\quad 62:-162241642\quad 63:204127952$ |
| $57$ | $57:2289223175\quad 58:183095777\quad 59:639360975\quad 60:-1075153353\quad 61:216637115$ |
| $57$ | $62:-331324890\quad 63:787427375$ |
| $58$ | $58:2615278608\quad 59:-144857811\quad 60:-78914419\quad 61:-592522667\quad 62:-25572172$ |
| $58$ | $63:262427157$ |
| $59$ | $59:1736187844\quad 60:-427789064\quad 61:938549924\quad 62:212108981\quad 63:375974259$ |
| $60$ | $60:1842864509\quad 61:298374772\quad 62:326958099\quad 63:-40175167$ |
| $61$ | $61:1721545936\quad 62:15467944\quad 63:159350810$ |
| $62$ | $62:1726163235\quad 63:157011370$ |
| $63$ | $63:1107697962$ |
| $64$ | $64:1961377630\quad 65:644681284\quad 66:360716652\quad 67:-94938799$ |
| $65$ | $65:1638864664\quad 66:131575474\quad 67:225402587$ |
| $66$ | $66:1442818368\quad 67:364709718$ |
| $67$ | $67:1767254347$ |

**Lower-triangular rational factor $R^{(4)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="neutral-block-04-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:149962264423$ |
| $1$ | $1:152160964541$ |
| $2$ | $2:33527409414$ |
| $3$ | $2:21557532856\quad 3:24057560042$ |
| $4$ | $2:19700505782\quad 3:565069164\quad 4:22798118097$ |
| $5$ | $2:14288172375\quad 3:11357641926\quad 4:11664735885\quad 5:21156025165$ |
| $6$ | $0:-5050422897\quad 6:32242699368$ |
| $7$ | $0:-5518163234\quad 6:10993129421\quad 7:25869193552$ |
| $8$ | $0:-1202382811\quad 6:17885517702\quad 7:227860621\quad 8:28341751880$ |
| $9$ | $0:3969749652\quad 6:15529699106\quad 7:19014871509\quad 8:15105030482\quad 9:25344179352$ |
| $10$ | $0:2210028945\quad 6:19157676525\quad 7:-1551996814\quad 8:2722823751\quad 9:2600270094$ |
| $10$ | $10:20759742011$ |
| $11$ | $0:9555900996\quad 6:806353119\quad 7:17799016363\quad 8:7171906982\quad 9:10047024873$ |
| $11$ | $10:12008423205\quad 11:25564337697$ |
| $12$ | $0:2513218218\quad 6:11708081464\quad 7:6806597167\quad 8:11489011548\quad 9:8139036958$ |
| $12$ | $10:10846926116\quad 11:5405079280\quad 12:24754298081$ |
| $13$ | $0:8251762233\quad 6:7578015356\quad 7:10700360135\quad 8:8412309534\quad 9:6214286810$ |
| $13$ | $10:1038088345\quad 11:228374499\quad 12:4511862065\quad 13:22839171842$ |
| $14$ | $1:2946104287\quad 14:27317316093$ |
| $15$ | $1:-4517898004\quad 14:8569264341\quad 15:31713606989$ |
| $16$ | $1:-120185798\quad 14:9058728612\quad 15:8934264300\quad 16:21744579019$ |
| $17$ | $1:3106350150\quad 14:8612825934\quad 15:14765399853\quad 16:9618768452\quad 17:24123848632$ |
| $18$ | $0:768943317\quad 6:8098592086\quad 7:8892060603\quad 8:12169532643\quad 9:-1001306324$ |
| $18$ | $10:4486634447\quad 11:4782713923\quad 12:9337453735\quad 13:3208819838\quad 18:16620464627$ |
| $19$ | $0:-6816223294\quad 6:20491628950\quad 7:9231049303\quad 8:6158302283\quad 9:3677787624$ |
| $19$ | $10:11225637389\quad 11:3043304543\quad 12:-6516180510\quad 13:-1643206247\quad 18:51956024$ |
| $19$ | $19:22883689234$ |
| $20$ | $0:-2426464180\quad 6:22113843218\quad 7:423095720\quad 8:3663108951\quad 9:11965383403$ |
| $20$ | $10:6461849836\quad 11:3509451471\quad 12:4649688375\quad 13:24725678\quad 18:2219675207$ |
| $20$ | $19:2555212017\quad 20:18376134491$ |
| $21$ | $0:-1160948587\quad 6:19752590979\quad 7:2431348276\quad 8:8651417607\quad 9:10446536279$ |
| $21$ | $10:4691422851\quad 11:-2925073766\quad 12:-7320968099\quad 13:13069214179\quad 18:-495244207$ |
| $21$ | $19:4150896772\quad 20:7098012819\quad 21:19064337934$ |
| $22$ | $1:3030366161\quad 14:2094425128\quad 15:6608394269\quad 16:9221763823\quad 17:393871766$ |
| $22$ | $22:14315347482$ |
| $23$ | $1:13628414635\quad 14:11594449804\quad 15:3284913194\quad 16:-4743810348\quad 17:-3552208671$ |
| $23$ | $22:-3322028738\quad 23:27206714550$ |
| $24$ | $1:3765395887\quad 14:18735901700\quad 15:2874790410\quad 16:7012817072\quad 17:-1446799438$ |
| $24$ | $22:-618924997\quad 23:4657729609\quad 24:20078460529$ |
| $25$ | $1:11215192984\quad 14:14893447200\quad 15:4296961902\quad 16:-5118349846\quad 17:13282175642$ |
| $25$ | $22:-4400245987\quad 23:2566243960\quad 24:4693321158\quad 25:20345462517$ |
| $26$ | $1:-2024849303\quad 14:3055679296\quad 15:8938975527\quad 16:9932836008\quad 17:2914347646$ |
| $26$ | $22:10520177582\quad 23:-9538976712\quad 24:1373914146\quad 25:-1197250161\quad 26:16559947355$ |
| $27$ | $1:-3346416195\quad 14:7541218669\quad 15:5896774397\quad 16:-4711501470\quad 17:343253588$ |
| $27$ | $22:-6310272441\quad 23:8191416728\quad 24:47939137\quad 25:3888014424\quad 26:7662150180$ |
| $27$ | $27:17948996581$ |
| $28$ | $1:656380724\quad 14:12076903010\quad 15:6641606012\quad 16:1418811939\quad 17:1368816093$ |
| $28$ | $22:6490161578\quad 23:-3746602626\quad 24:2075045582\quad 25:1030956350\quad 26:5393384798$ |
| $28$ | $27:-2938692372\quad 28:18168389820$ |
| $29$ | $1:6151519109\quad 14:9428517293\quad 15:9946086706\quad 16:1029654401\quad 17:4821668207$ |
| $29$ | $22:-4515344041\quad 23:10051761548\quad 24:3926033846\quad 25:6194660243\quad 26:3736024363$ |
| $29$ | $27:4098132647\quad 28:1214141913\quad 29:8820988772$ |
| $30$ | $30:17955042885$ |
| $31$ | $30:-1803002210\quad 31:19547897637$ |
| $32$ | $30:927882217\quad 31:-9614793458\quad 32:9415943094$ |
| $33$ | $30:-9764931787\quad 31:-668776757\quad 32:6873551329\quad 33:6930098627$ |
| $34$ | $2:37262894684\quad 3:-7326841214\quad 4:54453353017\quad 5:-82139432191\quad 34:170118371410$ |
| $35$ | $0:-1427815950\quad 6:4852095783\quad 7:-23566599599\quad 8:66992200330\quad 9:32186555234$ |
| $35$ | $10:-78022073718\quad 11:-57918262665\quad 12:-18989492466\quad 13:-35635832654\quad 18:-7761582995$ |
| $35$ | $19:-27119843489\quad 20:18034755713\quad 21:12203151646\quad 35:137369283565$ |
| $36$ | $36:36619087837$ |
| $37$ | $36:-2083270871\quad 37:34892764959$ |
| $38$ | $36:-6242559045\quad 37:-15165932967\quad 38:29136026870$ |
| $39$ | $36:-16616761857\quad 37:-6011216285\quad 38:-3973892315\quad 39:28468870825$ |
| $40$ | $2:-3465830764\quad 3:-507875254\quad 4:-2486198383\quad 5:5707089125\quad 34:-2813209580$ |
| $40$ | $40:35525027291$ |
| $41$ | $2:6158105342\quad 3:337015880\quad 4:-2462037477\quad 5:-15877915288\quad 34:4827415969$ |
| $41$ | $40:1251209508\quad 41:40661516896$ |
| $42$ | $2:-1816507152\quad 3:813926499\quad 4:9376479935\quad 5:-2934135165\quad 34:2363488348$ |
| $42$ | $40:13998336606\quad 41:-7001016350\quad 42:39402994270$ |
| $43$ | $2:1770914635\quad 3:-326677827\quad 4:5236291963\quad 5:-599204361\quad 34:8053205481$ |
| $43$ | $40:-4064290616\quad 41:3900500698\quad 42:-5113098815\quad 43:21278663413$ |
| $44$ | $2:-5422495808\quad 3:850533533\quad 4:-11186266303\quad 5:11679881430\quad 34:-7057928800$ |
| $44$ | $40:7557720098\quad 41:-19062288967\quad 42:-9220809680\quad 43:10857156651\quad 44:23508906387$ |
| $45$ | $2:7981542167\quad 3:-2226361211\quad 4:-2349509171\quad 5:-17061359453\quad 34:17462719173$ |
| $45$ | $40:-28586214251\quad 41:4083422317\quad 42:483877\quad 43:22449926833\quad 44:-126840608$ |
| $45$ | $45:27140652850$ |
| $46$ | $2:7735196412\quad 3:-2047697718\quad 4:1342626837\quad 5:9509865475\quad 34:-13480296914$ |
| $46$ | $40:-2974729422\quad 41:-9247071508\quad 42:-8316151813\quad 43:4224305119\quad 44:24817475728$ |
| $46$ | $45:-5848643063\quad 46:32529008146$ |
| $47$ | $2:4216677443\quad 3:3301111307\quad 4:13641352857\quad 5:-7919584054\quad 34:15979359185$ |
| $47$ | $40:-12826835243\quad 41:28963262289\quad 42:9952152204\quad 43:5292943407\quad 44:-4461714514$ |
| $47$ | $45:7964632039\quad 46:11659397562\quad 47:11263097333$ |
| $48$ | $0:-708186759\quad 6:-133777962\quad 7:2115722904\quad 8:-2634667565\quad 9:-1187298837$ |
| $48$ | $10:6123563934\quad 11:971868935\quad 12:-3629005440\quad 13:-351244421\quad 18:690282564$ |
| $48$ | $19:1171217829\quad 20:-976089741\quad 21:-2513658172\quad 35:-3846417396\quad 48:24923770374$ |
| $49$ | $0:-5139536249\quad 6:3918427518\quad 7:201181695\quad 8:4470782624\quad 9:2267396479$ |
| $49$ | $10:4580383558\quad 11:5005114289\quad 12:-311464769\quad 13:1507212536\quad 18:6499475788$ |
| $49$ | $19:2528063712\quad 20:-2252626460\quad 21:4229846171\quad 35:-11123533343\quad 48:-10098531983$ |
| $49$ | $49:39575957484$ |
| $50$ | $0:2534246688\quad 6:11140195968\quad 7:5381748973\quad 8:-4842821354\quad 9:16074515533$ |
| $50$ | $10:6398309375\quad 11:3620806022\quad 12:1740950943\quad 13:1371835220\quad 18:7249153123$ |
| $50$ | $19:44260249\quad 20:-1394807784\quad 21:-4438685917\quad 35:-15900745714\quad 48:122025472$ |
| $50$ | $49:-5531377836\quad 50:37756487528$ |
| $51$ | $0:6067356008\quad 6:7496310248\quad 7:7734438830\quad 8:5966178682\quad 9:-6206874532$ |
| $51$ | $10:-9424253034\quad 11:1110704594\quad 12:6815511298\quad 13:458337206\quad 18:-2094477754$ |
| $51$ | $19:9877972401\quad 20:5350780372\quad 21:5505384709\quad 35:-669778124\quad 48:-9522773616$ |
| $51$ | $49:5860051315\quad 50:8911695669\quad 51:32247203067$ |
| $52$ | $2:3242410431\quad 3:1682584208\quad 4:1144441353\quad 5:4683100158\quad 34:-3652415792$ |
| $52$ | $40:-4496065656\quad 41:860274372\quad 42:5873978316\quad 43:-2936284941\quad 44:10199425206$ |
| $52$ | $45:7816760234\quad 46:12495621563\quad 47:-1578075224\quad 52:15210486157$ |
| $53$ | $2:-1038297668\quad 3:-4555427970\quad 4:10131535686\quad 5:6624619359\quad 34:-8386275007$ |
| $53$ | $40:14786322693\quad 41:889968886\quad 42:-3966271198\quad 43:9762517397\quad 44:341625273$ |
| $53$ | $45:1572320930\quad 46:-21686782462\quad 47:4504032276\quad 52:5116320026\quad 53:25738723318$ |
| $54$ | $2:3050193045\quad 3:8295574525\quad 4:-18072188253\quad 5:8273168066\quad 34:-4037092837$ |
| $54$ | $40:17857025436\quad 41:-17516407095\quad 42:-3506132124\quad 43:4383992246\quad 44:2936708278$ |
| $54$ | $45:-4978855566\quad 46:1858368246\quad 47:4888789365\quad 52:-417697036\quad 53:698519636$ |
| $54$ | $54:21388083033$ |
| $55$ | $2:4326808976\quad 3:4944955603\quad 4:5190114435\quad 5:-5167552969\quad 34:7479307247$ |
| $55$ | $40:14169669439\quad 41:8332104073\quad 42:9256514485\quad 43:2604116155\quad 44:-4306600519$ |
| $55$ | $45:-4446772161\quad 46:-10395849497\quad 47:5805024445\quad 52:5160637283\quad 53:-5273567353$ |
| $55$ | $54:7819982633\quad 55:21408532216$ |
| $56$ | $0:-6089931027\quad 6:4201361069\quad 7:6178354273\quad 8:-7615132463\quad 9:19701692555$ |
| $56$ | $10:11256124865\quad 11:4372387128\quad 12:-773205871\quad 13:-4175048620\quad 18:14478933833$ |
| $56$ | $19:-182772922\quad 20:-3966798223\quad 21:-6239897819\quad 35:-10387723032\quad 48:2091250360$ |
| $56$ | $49:3038313363\quad 50:18628564304\quad 51:-2162795142\quad 56:17712868899$ |
| $57$ | $0:-11457795010\quad 6:2762676217\quad 7:-14327641819\quad 8:13807622191\quad 9:4777073735$ |
| $57$ | $10:9320467139\quad 11:4536589143\quad 12:-4059583527\quad 13:-2905660483\quad 18:1217656575$ |
| $57$ | $19:-922410051\quad 20:-370425663\quad 21:-7057869771\quad 35:17057149529\quad 48:7167055944$ |
| $57$ | $49:-2882873765\quad 50:-7560236902\quad 51:11793302965\quad 56:7734270506\quad 57:30661316452$ |
| $58$ | $0:-2857008406\quad 6:3380632189\quad 7:9969757718\quad 8:-7371818218\quad 9:12403575313$ |
| $58$ | $10:8728387051\quad 11:-4477568349\quad 12:2702781830\quad 13:5982230542\quad 18:-781011765$ |
| $58$ | $19:-349649667\quad 20:-229195512\quad 21:-3267537421\quad 35:-10923219344\quad 48:28986730176$ |
| $58$ | $49:1665638146\quad 50:-4243523727\quad 51:-23187507783\quad 56:11030904957\quad 57:13392308077$ |
| $58$ | $58:17837812622$ |
| $59$ | $0:-1274002348\quad 6:2032262672\quad 7:-1502682734\quad 8:9535110280\quad 9:-5259742992$ |
| $59$ | $10:-7709853180\quad 11:-4842250772\quad 12:7114699842\quad 13:-6373358084\quad 18:-7790321884$ |
| $59$ | $19:3582857529\quad 20:4069408339\quad 21:6978850040\quad 35:11317572664\quad 48:15716978812$ |
| $59$ | $49:-3290248747\quad 50:-9798863390\quad 51:8951375016\quad 56:-8885414236\quad 57:7590404832$ |
| $59$ | $58:-4797688906\quad 59:23977301766$ |
| $60$ | $0:3336567562\quad 6:8964786909\quad 7:12351917236\quad 8:1271306980\quad 9:1878148681$ |
| $60$ | $10:1341659010\quad 11:-1334234537\quad 12:-418960435\quad 13:2399358015\quad 18:5027297830$ |
| $60$ | $19:3152083763\quad 20:5473978793\quad 21:4073119363\quad 35:-14397415651\quad 48:-7000478753$ |
| $60$ | $49:11408578981\quad 50:20681812838\quad 51:-1805362800\quad 56:-1811437016\quad 57:-11889910826$ |
| $60$ | $58:207296555\quad 59:7438708353\quad 60:22018192732$ |
| $61$ | $0:-1940325535\quad 6:8773096640\quad 7:4087473696\quad 8:1543046688\quad 9:-17479377756$ |
| $61$ | $10:-2808901705\quad 11:-2082916592\quad 12:11998005211\quad 13:206360774\quad 18:-7297290028$ |
| $61$ | $19:4687540609\quad 20:4578275227\quad 21:14965904972\quad 35:14099969630\quad 48:-2395917790$ |
| $61$ | $49:4215752870\quad 50:1455320649\quad 51:9184998870\quad 56:-4938193421\quad 57:7373771235$ |
| $61$ | $58:-1208460120\quad 59:9324624603\quad 60:12817799138\quad 61:14122452238$ |
| $62$ | $0:15082956127\quad 6:2677813945\quad 7:10449200674\quad 8:11592997691\quad 9:-935151105$ |
| $62$ | $10:-18926067173\quad 11:7880199482\quad 12:-11086464998\quad 13:261015897\quad 18:2407024939$ |
| $62$ | $19:8481495327\quad 20:4933343548\quad 21:1417746741\quad 35:-5595970825\quad 48:8236317554$ |
| $62$ | $49:2570809760\quad 50:-3928144327\quad 51:8036489189\quad 56:7571537173\quad 57:-6453440606$ |
| $62$ | $58:6125876301\quad 59:1453994778\quad 60:1726195919\quad 61:3604766206\quad 62:16100443796$ |
| $63$ | $0:10903052633\quad 6:11494812374\quad 7:-7178042313\quad 8:8541840712\quad 9:14801031783$ |
| $63$ | $10:6343646129\quad 11:-4107787218\quad 12:3817502334\quad 13:1883276750\quad 18:1917368257$ |
| $63$ | $19:380782005\quad 20:751664934\quad 21:931431480\quad 35:2901662447\quad 48:3709383580$ |
| $63$ | $49:4076130063\quad 50:-4771555655\quad 51:7183972565\quad 56:5245913588\quad 57:11374358337$ |
| $63$ | $58:-1755761760\quad 59:5549224078\quad 60:3245777748\quad 61:3593115558\quad 62:3076578417$ |
| $63$ | $63:9782065991$ |
| $64$ | $1:7298072553\quad 14:16971893124\quad 15:9972961795\quad 16:7190466422\quad 17:4016993609$ |
| $64$ | $22:-4900815204\quad 23:9501398181\quad 24:-2283639810\quad 25:-4110605059\quad 26:5460482051$ |
| $64$ | $27:8402065929\quad 28:1766553727\quad 29:-7624905676\quad 64:33979309620$ |
| $65$ | $1:3254339446\quad 14:13315768041\quad 15:5631667174\quad 16:16786673595\quad 17:5534882632$ |
| $65$ | $22:-8043159749\quad 23:8503369433\quad 24:-5264466286\quad 25:2027508964\quad 26:2104239726$ |
| $65$ | $27:8851715934\quad 28:7715693857\quad 29:4362196865\quad 64:167854415\quad 65:27866226378$ |
| $66$ | $1:12015017344\quad 14:10952458831\quad 15:14571961654\quad 16:-12308996936\quad 17:4112086842$ |
| $66$ | $22:-11354033377\quad 23:-3048995423\quad 24:11819668151\quad 25:-4339811548\quad 26:7262775885$ |
| $66$ | $27:-4205046634\quad 28:5568235421\quad 29:3944957998\quad 64:359168262\quad 65:565991692$ |
| $66$ | $66:19581676552$ |
| $67$ | $1:-5193078799\quad 14:13773794520\quad 15:12894918657\quad 16:4333767587\quad 17:3571001368$ |
| $67$ | $22:8317154421\quad 23:-6442675121\quad 24:8181997297\quad 25:9229215402\quad 26:-7427288517$ |
| $67$ | $27:-13140883533\quad 28:-8688139412\quad 29:11780709078\quad 64:-1476606632\quad 65:6733704016$ |
| $67$ | $66:7274387226\quad 67:23394306435$ |

**Neutral block 5: localizer 2; dimension $24$.**

Use $\Lambda^{\mathrm{tab}}_2$. If there are $k$ listed basis polynomials, matrix index $ak+i$ denotes localizer component $a\in\{0,1\}$ and basis index $i<k$.

<a id="neutral-block-05-basis"></a>

| Index $i$ | Basis polynomial $v_i$ |
|:--|:--|
| $0$ | $H\,b\,b$ |
| $1$ | $b\,H\,b$ |
| $2$ | $b\,b\,H$ |
| $3$ | $H\,b\,b^*$ |
| $4$ | $b\,H\,b^*$ |
| $5$ | $b\,b^*\,H$ |
| $6$ | $H\,b^*\,b$ |
| $7$ | $b^*\,H\,b$ |
| $8$ | $b^*\,b\,H$ |
| $9$ | $H\,b^*\,b^*$ |
| $10$ | $b^*\,H\,b^*$ |
| $11$ | $b^*\,b^*\,H$ |

**Gram $Q^{(5)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Only $j\ge i$ is listed. The lower triangle is its transpose; every unlisted upper-triangle entry is zero.

<a id="neutral-block-05-gram"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:10659144806\quad 1:8981294606\quad 2:8990013465\quad 15:2954132141\quad 16:3530360370$ |
| $0$ | $17:4580762308\quad 18:4745360759\quad 19:3495558313\quad 20:4159774581$ |
| $1$ | $1:8624871426\quad 2:8468243214\quad 15:2791741033\quad 16:2868159095\quad 17:4408311023$ |
| $1$ | $18:4205388403\quad 19:2872513458\quad 20:4274242500$ |
| $2$ | $2:10447494498\quad 15:2285853742\quad 16:3302432417\quad 17:4947271987\quad 18:3964536677$ |
| $2$ | $19:4844571041\quad 20:3353650239$ |
| $3$ | $3:5914556872\quad 4:5461451833\quad 5:5506624507\quad 6:4615766301\quad 7:5627709907$ |
| $3$ | $8:5605496326\quad 21:5377805181\quad 22:4879606855\quad 23:4433101309$ |
| $4$ | $4:7251074204\quad 5:5609553336\quad 6:5017009319\quad 7:5596756846\quad 8:5939126842$ |
| $4$ | $21:5325694117\quad 22:4458325990\quad 23:6030560041$ |
| $5$ | $5:7655648283\quad 6:5136364656\quad 7:5687691158\quad 8:6642702163\quad 21:5720714827$ |
| $5$ | $22:5633819999\quad 23:4753161327$ |
| $6$ | $6:4820566674\quad 7:4463069366\quad 8:4810466817\quad 21:5083636171\quad 22:4177630645$ |
| $6$ | $23:3670453803$ |
| $7$ | $7:6410829137\quad 8:5294474645\quad 21:5648483419\quad 22:4557508108\quad 23:4780252084$ |
| $8$ | $8:8519650012\quad 21:5256447026\quad 22:5317863027\quad 23:5895629601$ |
| $9$ | $9:7313123082\quad 10:7012544916\quad 11:6874916670$ |
| $10$ | $10:6827158708\quad 11:7003962589$ |
| $11$ | $11:8145768805$ |
| $12$ | $12:2777625220\quad 13:2267675785\quad 14:628444714$ |
| $13$ | $13:4936097362\quad 14:2396871643$ |
| $14$ | $14:3605247053$ |
| $15$ | $15:2688390083\quad 16:-258074699\quad 17:1746361601\quad 18:1264944449\quad 19:1225057978$ |
| $15$ | $20:1799407457$ |
| $16$ | $16:4875215642\quad 17:-362183667\quad 18:1599119944\quad 19:1739894107\quad 20:1334420586$ |
| $17$ | $17:5908572123\quad 18:3264082586\quad 19:1312440795\quad 20:2235440054$ |
| $18$ | $18:3633667791\quad 19:477877858\quad 20:2507919094$ |
| $19$ | $19:4806359740\quad 20:751175345$ |
| $20$ | $20:3013626389$ |
| $21$ | $21:7397231194\quad 22:4473470647\quad 23:3848000656$ |
| $22$ | $22:5813501731\quad 23:3842571449$ |
| $23$ | $23:7008532259$ |

**Lower-triangular rational factor $R^{(5)}$.** The denominator is $1000000000000$. In row $i$, each pair $j:n$ specifies the entry $n/1000000000000$ in column $j$. Every unlisted entry is zero.

<a id="neutral-block-05-factor"></a>

| Row $i$ | Column $j$: numerator |
|:--|:--|
| $0$ | $0:103242650131$ |
| $1$ | $0:86992096722\quad 1:32513789904$ |
| $2$ | $0:87076546889\quad 1:27473629727\quad 2:45937665913$ |
| $3$ | $3:76905506123$ |
| $4$ | $3:71015095126\quad 4:46987556526$ |
| $5$ | $3:71602474057\quad 4:11166718774\quad 5:49029974340$ |
| $6$ | $3:60018671402\quad 4:16063351999\quad 5:13451044357\quad 6:27915298411$ |
| $7$ | $3:73176943898\quad 4:8514790801\quad 5:7198834212\quad 6:-5821951167\quad 7:29960708052$ |
| $8$ | $3:72888101368\quad 4:16237732844\quad 5:25339837442\quad 6:-5941540779\quad 7:-13168026809$ |
| $8$ | $8:45742808447$ |
| $9$ | $9:85516215316$ |
| $10$ | $9:82002517184\quad 10:10131430473$ |
| $11$ | $9:80393135320\quad 10:40618462464\quad 11:5723032888$ |
| $12$ | $12:52702231642$ |
| $13$ | $12:43028078971\quad 13:55539011353$ |
| $14$ | $12:11924442181\quad 13:33918245163\quad 14:48088536854$ |
| $15$ | $0:28613486164\quad 1:9306631986\quad 2:-10043975452\quad 15:41012969300$ |
| $16$ | $0:34194786414\quad 1:-3276058325\quad 2:9031231771\quad 15:-27194037071\quad 16:53609895229$ |
| $17$ | $0:44368895047\quad 1:16871850844\quad 2:13502010209\quad 15:11103965322\quad 16:-30667352008$ |
| $17$ | $17:49082839360$ |
| $18$ | $0:45963182396\quad 1:6365139068\quad 2:-4629142551\quad 15:-3802588259\quad 16:-248639935$ |
| $18$ | $17:24743000178\quad 18:28849127228$ |
| $19$ | $0:33857696491\quad 1:-2240235608\quad 2:42620954062\quad 15:17194661218\quad 16:12263982272$ |
| $19$ | $17:-11048351941\quad 18:-18197043790\quad 19:30644601952$ |
| $20$ | $0:40291241805\quad 1:23658358442\quad 2:-17518368228\quad 15:6105407034\quad 16:6685695759$ |
| $20$ | $17:8605317656\quad 18:8190158907\quad 19:7955533967\quad 20:15399215397$ |
| $21$ | $3:69927440207\quad 4:7657140005\quad 5:12813222587\quad 6:21183135710\quad 7:16598239950$ |
| $21$ | $8:1201842208\quad 21:39481674247$ |
| $22$ | $3:63449382249\quad 4:-1011713091\quad 5:22475736180\quad 6:2988053329\quad 7:-7386742978$ |
| $22$ | $8:1323470526\quad 21:-4708564951\quad 22:34554026544$ |
| $23$ | $3:57643483965\quad 4:41223734262\quad 5:3373679402\quad 6:-17796778587\quad 7:2775905156$ |
| $23$ | $8:19020474792\quad 21:-5918882871\quad 22:4967548519\quad 23:35056581188$ |
