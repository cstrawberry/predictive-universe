# Emitter height bound

This note gives height rules for the exact rational arithmetic in the source's literal output emitters, and proves from them that the emitted words of a fixed member have polynomial bit height in k and d, with an affine common cutoff exponent d. It concerns a proof inequality only; the physical source, boundary, output emitters, paid native census and supplied-stock scope are those of work_ledger/INDEXED_SUPPLIED_LEDGER.md.

## Arithmetic rules, including signs and unreduced representations

Write h(a,b)=2+ell(a)+ell(b), where ell(z)=bit_length(|z|), ell(0)=0, and b is a positive integer. The pair (a,b) need not be coprime. Let x=(a,b), y=(c,d), with b,d>=1; set A=ell(a), B=ell(b), C=ell(c), D=ell(d). Bounds below refer to the specified arithmetic output representation, before optional reduction.

The elementary integer inequalities are

    ell(uv)<=ell(u)+ell(v),
    ell(u+v), ell(u-v)<=max(ell(u),ell(v))+1.

They hold for positive, negative and zero u,v. A sign has no effect on ell; its serialization overhead is already covered by the constant in h and the output-record overhead.

**Addition and subtraction.** Emit `(ad +/- bc, bd)`. Then

    h(ad +/- bc,bd)
      <=3+max(A+D,C+B)+B+D.

Let S=A+B+C+D=h(x)+h(y)-4. Both max(A+D,C+B) and B+D are at most S, so the right side is at most 3+2S. In particular the safe rule is

    h(x +/- y) <= 2[h(x)+h(y)]+2.

This remains valid with either input zero, cancellation to zero, arbitrary numerator signs and unreduced denominators. Optional gcd reduction cannot increase numerator or denominator absolute magnitude, including reducing zero to 0/1.

*Remark (the bound h(x)+h(y)+2 fails for addition).* With the same height written b(a/b)=2+bit_length(|a|)+bit_length(b), b>0, the bound b(x+y)<=b(x)+b(y)+2 is false. Take x=1/1 and y=1/1048576=1/2^20. Then

    b(x)=2+1+1=4,
    b(y)=2+1+21=24,
    b(x+y)=b(1048577/1048576)=2+21+21=44,
    b(x)+b(y)+2=30.

All three representations are reduced, so reducing fractions does not rescue that bound. Constant-plus-H^2 rational expressions occur among the actual emitted expressions, so the case is not irrelevant, and the rule above is the one used for addition.

**Multiplication.** Emit `(ac,bd)`. Directly,

    h(ac,bd)<=2+A+C+B+D=h(x)+h(y)-2
             <=h(x)+h(y)+2.

This includes zero products and unreduced inputs/outputs.

**Division.** Require c!=0. Emit `(ad*sign(c),b*|c|)`, keeping the denominator positive. Then

    h(ad*sign(c),b*|c|)<=2+A+D+B+C=h(x)+h(y)-2
                       <=h(x)+h(y)+2.

A zero dividend is permitted; division by zero is excluded as required by the actual rational expression. Optional reduction only helps.

**Positive fixed integer powers.** For r>=1 emit `(a^r,b^r)`. Then

    h(a^r,b^r)<=2+r(A+B)=r h(x)-2r+2<=r h(x)+2.

This includes negative a and a=0. Exponent r is fixed for the expression at fixed j; it is not a hidden H- or D-dependent output loop.

**Integer floor and ceil.** Emit the resulting integer as `(q,1)`. Since a is an integer and b>=1, both |floor(a/b)| and |ceil(a/b)| are at most |a|, including a=0 and negative a. Therefore

    h(q,1)<=3+A<=2+A+B=h(x)<=h(x)+2.

The floor/ceil bound h(x)+2 is therefore conservative. The output representation here is the natural integer q, not a gratuitous rescaling of q/1 by an unbounded new denominator.

These derivations hold for every valid input representation. They do not infer a bound from numerical samples.

## Why the actual growth and common cutoff hold

The literal emitter graph is fixed at j. Its H,d-dependent leaves have linear heights: H at most 6k+4, D at most 3d+4, m at most 6k+4, N at most 12k+4, cw at most 2k+4. The actual selected bank/root/alpha/clock/bath outputs provide the fixed-j leaf heights, possibly enormous but finite and fully paid.

Bound each addition/subtraction step by `2[B(x)+B(y)]+2`, where B is an already derived upper bound for its inputs, and each other step by the corresponding rule above. Repeatedly applying these operations through a **fixed finite** expression graph introduces only fixed coefficient factors. It preserves a polynomial majorant in (1+k+d). Fixed lists and records add child bounds and their actual key/separator lengths. Decimal rationals cost at most numerator/denominator bit heights plus signs and separators. Byte-to-native8 conversion remains ceil(8 bytes/3). Serialized other-word widths and digit sums are bounded from previously bounded actual payloads. There is no output-size cycle or H-dependent number of record elements in these emitters.

Thus the actual emitted words admit a computable source-derived bound C_j(1+k+d)^p_j. This is a bound on heights only: it changes neither source-owned leaf values nor the actual word lengths. It does not replace full causal ROM, N lane factors, or D^4 geometry Hilbert-space dimension with a program word.

The physical cutoff proof is separate from these arithmetic height rules. For the actual fixed-j coefficients Omega=C*8^(4k), J=8^(a+bk) with b>=20, and u=256*C*Rw^2, choose e by exact rational comparisons `8^(e-1)<u<=8^e`. The **same smallest admissible power of eight** is

    D=8^[e+2a+(4+2b)k].

Hence d(k) is affine, and at b=20 its slope is 44. Substitution into the polynomial height bound gives polynomial growth in k. There is no independent later max(D). If a final all-error selection uses a numerical emitted-word majorant, its constants must come from this recursion, with the addition rule h(x +/- y) <= 2[h(x)+h(y)]+2.

These rules prove only the actual-emitter size and affine-cutoff statements above. The source-response, forecast and all-error schedule are not proved here.
