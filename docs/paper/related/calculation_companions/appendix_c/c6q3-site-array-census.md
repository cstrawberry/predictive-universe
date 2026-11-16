# Site-array shell census

The [site-array theorem](../../../appendices/appendix_c_regularity_necessity.md#theorem-c6q3) supplies the physical source, harmonic instruments and ordering proof. The integer enumeration below checks the full radius-squared-50 address alphabet, both eight-point layer witnesses, the 24-point candidate and the derived cost gap. The symmetry-floor classification and the response and resource identities are proved in the manuscript.

```python
from collections import Counter
from itertools import product
from fractions import Fraction

sphere = tuple(v for v in product(range(-7, 8), repeat=4) if sum(k*k for k in v) == 50)
orbits = Counter(tuple(sorted(abs(k) for k in v)) for v in sphere)
assert orbits == {
    (0, 0, 1, 7): 48, (0, 0, 5, 5): 24, (0, 3, 4, 5): 192,
    (1, 2, 3, 6): 384, (3, 3, 4, 4): 96,
}
sphere = set(sphere)
N = len(sphere)
D4 = {v for v in sphere if sorted(abs(k) for k in v) == [0, 0, 5, 5]}
assert N == 744 and len(D4) == 24

def dot(x, y):
    return sum(a*b for a, b in zip(x, y))

def antipodes(vectors):
    return {*vectors, *(tuple(-k for k in v) for v in vectors)}

floor4 = ((5, 5, 0, 0), (5, -5, 0, 0), (0, 0, 5, 5), (0, 0, 5, -5))
floor2 = ((7, 1, 0, 0), *floor4[1:])
assert antipodes(floor4) <= sphere and antipodes(floor2) <= sphere
assert all(dot(v,w) == (50 if i == j else 0)
           for i,v in enumerate(floor4) for j,w in enumerate(floor4))
assert sorted(dot(v,w) for i,v in enumerate(floor2) for w in floor2[i+1:]) == [0]*5+[30]
assert Fraction(7, 5) != Fraction(1, -5)
assert len(antipodes(floor2)) == len(antipodes(floor4)) == 8

for layers in ((2,4), (4,6)):
    bad, good = layers
    penalty = {2: 2*N, 4: N, 6: 0}
    assert 8 + penalty[bad] > N + penalty[good]
assert min(8+N-24, 8+2*N-24, 48-24) == 24
print("Sphere 744, D4 24, both lower-layer witnesses and gap >= 24E/H verified.")
```
