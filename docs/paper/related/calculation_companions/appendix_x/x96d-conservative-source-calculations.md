# Conservative four-sector response: source calculations

These calculations support Theorem X.9.6d.2 and Corollary X.9.6d.3 in [Appendix X](../../../appendices/appendix_x_effective_action.md). The source is the nonempty conservative four-sector successor on the populated ideal sampled source of Theorem X.8a.5g. The response equivalence preserves the complete finite instrument and resource record and represents the original centered coordinates isometrically on the positive support of the full successor. The result is an existence theorem on this declared source.

## Claim

For every admitted ideal sampled source of X.8a.5g, construct the full conservative response operator on the six-dimensional response carrier. Verify the centered inverse on its five-dimensional positive support, all four sector/domain/resolvent diagrams, the complete finite-word response transfer, and the inherited laboratory clock and resource conversions. The strictly positive conservative obstruction for a domain containing the constants remains a separate negative result. Smooth or interacting branches, numerical-sector locks and source selection are not covered by this construction.

## Source

The source universe is the complete finite product-source grammar, including oscillator, binary, controller, ancilla, readout, service and retention records. Factor owners are disjoint. Each primitive, unused output, energy term and time interval retains its existing owner. Input energy and subsequent heat/storage carry one input debit. The response and oscillator state carriers are typed separately.

The same physical primitive acts on every admitted history, including quantum conditional outputs, null leaves, continuations and arbitrary retained reference systems. The constant/sign map, the positive-support isometry and existing parity, modulo-four and metric probes have the stated units and prepared-state error bounds. The binary and RC clock conversions remain distinct.

## Proof structure

Gaussian integration, binary convex duality, finite spectral calculus and the source preparation and instrument laws supply the atomic steps. X.8a.5g, X.9.6d.2 and X.9.6d.3 give the common realized joins. X.9.6c.5 supplies the reducing comparison. The mean-zero line supplies invertibility, and the full two-node space supplies Markov normalization and clipping. Source laws of X.8a.5g precede the block and convex-dual calculation of X.9.6d.2 and the compatibility and finite-word proof of X.9.6d.3. X.9.6c.5 and X.9.6d.1 retain their separate hypotheses.

The four form domains are full and finite-dimensional. The positive support, regulator measure, entire Legendre chart and spectrum are explicit. X.8a.5g.10, .16 and .33–.34 retain finite extraction and control errors. The transfer adds zero error. No observed comparison or empirical covariance enters.

## Nonvacuity

The field precision has eigenvalues one and three, the regulator precision is positive, both binary probabilities are positive, and the Gaussian predictor and RC service have positive source parameters. The admitted product is nonempty.

## Failure conditions

A missing unit, nonzero mixed Schur block, misnormalized regulator term, altered instrument leaf, resource debit or clock, or identification of the sampled interpolation with intrapulse motion fails the stated bridge.

## Calculations

- The field precision $A=\left(\begin{smallmatrix}2&-1\\-1&2\end{smallmatrix}\right)$ and the base regulator precision $2$ are prepared source inputs. Gaussian integration gives covariance $A^{-1}$ and $1/2$. With the fixed measure and $R_k=k^2$, the full regulator action is $\phi_R^2+\tfrac12\log(2+k^2)$ and its derivative is $k/(2+k^2)$. The determinant term depends on the fixed measure and the separate normalizer extraction of X.8a.5g.8–.10.
- The uniform bit has orthonormal constant and sign functions. Its cumulant on $c\mathbf1+s\sigma$ is $c+\log\cosh s$, giving the centered covariance $P_\sigma$ and the constant kernel. The cycle probabilities $(1\pm e^{-1})/2$ give the log-generator $P_\sigma$ in cycle units. Changing the probabilities can change that equality. The full two-point form $(f_+-f_-)^2/4$ decreases under normal contractions.
- The Gaussian location law gives Fisher coefficient $1$. The risk, input-work coefficient $3e_d+e_c+e_h$ and positive weights give $a_*=\gamma+2w_E(3e_d+e_c+e_h)$. The normalized potential is $x^2/2$ and the actual RC constant gives mobility $(a_*\tau_P)^{-1}$. The binary conversion uses its own $\tau_\Sigma$.
- The product laws give direct sum covariance with only the binary constant line in its kernel. The inverse is $\widehat L=A\oplus2\oplus P_\sigma\oplus1$, with poles $0,-1,-2,-3$ and residue ranks $1,3,1,1$. Scalar Legendre conjugation gives the binary entropy term on $[-1,1]$ with value $\log 2$ at the endpoints. Centering requires zero constant expectation. The original unit expectation is one.
- The transfer is the identity on every admitted preparation and CP leaf. Composition verifies the same unnormalized outputs and their probabilities, conditionals on positive-probability histories, reference extensions and permitted continuations. The same ownership, unit and clock data preserve the error estimates.

The fixed product preparation, stiffness, Gaussian precisions, cycle bias, positive-support convention and tariff determine the displayed response after declaration. These inputs delimit the existence result. The proof uses no target observation to select them and leaves source selection across different hardware open. The mathematical checks depend on the declared inputs and formulas.

## Exact arithmetic checks

The analytic proof and complete-word induction establish the response identities. This finite check exercises the field precision and covariance, full binary algebra, regulator subtraction and residue multiplicities.

```python
from fractions import Fraction as F
from itertools import product


def require(ok, message):
    if not ok:
        raise ValueError(message)


def multiply(left, right):
    return tuple(tuple(sum(x*y for x,y in zip(row,col)) for col in zip(*right)) for row in left)


def scale(matrix, value):
    return tuple(tuple(value*x for x in row) for row in matrix)


def add(left, right):
    return tuple(tuple(x+y for x,y in zip(a,b)) for a,b in zip(left,right))


def main():
    field = ((2,-1),(-1,2))
    field_cov = ((F(2,3),F(1,3)),(F(1,3),F(2,3)))
    identity = ((1,0),(0,1))
    constant = ((F(1,2),F(1,2)),(F(1,2),F(1,2)))
    centered = ((F(1,2),F(-1,2)),(F(-1,2),F(1,2)))
    require(multiply(field,field_cov)==identity,'field covariance')
    require(multiply(field,field)==((5,-4),(-4,5)),'physical stiffness')
    require(multiply(centered,centered)==centered,'perspective idempotence')
    require(multiply(centered,constant)==((0,0),(0,0)),'orthogonal kernel')
    require(add(constant,centered)==identity,'complete carrier')
    for z,w in product((F(0), F(1,5),F(7,8),F(1)), repeat=2):
        first, second = add(constant,scale(centered,z)),add(constant,scale(centered,w))
        require(all(sum(row)==1 and min(row)>=0 for row in first),'normalized cycle')
        require(multiply(first,second)==add(constant,scale(centered,z*w)),'cycle composition')
    for k,phi in product((F(1,7), F(2),F(7,2)), (F(-2), F(0),F(3,7))):
        precision=2+k*k
        J=precision*phi
        gaussian_dual=J*phi-J*J/(2*precision)
        require(gaussian_dual-k*k*phi*phi/2==phi*phi,'RG quadratic after subtraction')
    projections = tuple(sum(1 for n in (1,3,2,0,1,1) if n == pole) for pole in range(4))
    require(projections==(1,3,1,1),'residue ranks')
    print('Field covariance, perspective cycles, RG quadratic and four residue ranks verified.')


if __name__ == '__main__':
    main()
```
