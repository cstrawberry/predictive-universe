# Weyl-factor qualification census

This record accompanies [Theorem P.1f](../../../appendices/appendix_p_philosophical_foundations.md#theorem-p1f). It fixes the command language, the finite proof rules and the value and minimizer records for the two marked factor ports of the same Weyl apparatus. The controlled free-field service and its background, mass, clock, state preparations and complete retained provider inventory are those of Theorem P.1e. The new bank logic selects its four admitted task implementations using the same supplies and interpreter at each bank.

| Owner | Rank | Physical constraint and dependency |
|:--|--:|:--|
| `W0` | 0 | Prescribed field/background, the finite rotor, the neutral ready excitation, and the two installed command sockets and invariant ready operation. |
| `W1` | 1 | Dressed local factor pulses, neutral input and pointer suppliers, slot clock, stock and the physical protected access boundary. Uses `W0`. |
| `W2` | 2 | Four leaf semantics, independent three-bit source, causal release and captured-comparison-controlled update. Uses `W0` and `W1`. |
| `W3` | 3 | All prefix, invalid, raw transcript, provider, complement and resource rules, with chronological recomposition. Uses `W0`–`W2`. |

The eligible owner types are preparation, control, clock, input, carrier, verification, feedback, continuation, failure and resource ownership in the displayed physical source. `W0` owns the field, charge and ready cut. `W1` owns the primitive operations and access cut. `W2` owns their execution in the scoring task. `W3` owns the prefix responses and full retained compositions, without a second debit for the earlier primitives. These types partition the constraints by the step that supplies each physical law. The mathematical interpreter fallback has no physical input socket. Hypotheses of other source branches have no operation or state in this factory. The after-release experimental ports of Theorem P.1e remain physical ports with their stated continuations and cannot act at the protected scoring cut.

The binary prefix evaluator has the eight literal leaves and the separate prefix `111` for its fixed universal component. Length is binary word length. Canonical initialized state codes use sorted ASCII keys in UTF-8 with no insignificant whitespace, and carry the complete initialized source fields specified in Theorem P.1f. The literal bank and leaf are included in the code. The reference names the complete common ready apparatus and frozen factory before selecting either bank or leaf. All eight admissible code evaluations therefore use one reference. The decoder rule and carrier law are fixed on every evaluation, including the four shorter physical commands. Neither a score outcome nor a separate output-specific interpreter participates in membership.

For clarity the family of all proof rows can be specified by a finite generator. At any $n\ge0$, $\mathsf G_{\mathcal L}(n,P)$ prints the predicate that $P$ is one of the eight fully completed physical leaves. The same predicate holds at every stage because the initialized source supplies the entire finite inventory and each prefix, one-step transition, verification, feedback and release rule has a normalized realization. A finite word in the continuation menu is covered by chronological composition of the primitive response identity of Theorem P.1e. Stage independence proves both nestedness and the realizer step. The trust root uses finite equality, rational arithmetic, elementary induction and propositional inference. Source assumptions and the four ranked owner rules are separate. Their soundness follows from exact physical leaf decoding, preparation independence, the dressed-pulse identity and chronological composition. No owner rule takes a qualifying minimum as an input.

| Marked bank | Realizing word | Other qualifying word at length four | Exact minimum length |
|:--|:--|:--|--:|
| `0` | `0100` | `0101` | 4 |
| `1` | `1100` | `1101` | 4 |

For each canonical descriptor in the two rightmost program columns, the word printed in its cell gives literal output equality and stage-zero membership. For every word of length less than four, assign exclusion stage zero. Its proof is either absence from the physical leaf set or a different literal bank and payload field. The same rule excludes every other length-four word from that descriptor's minimizer set, including the other qualifying word from the same bank because their retained orders differ. Both stabilization cutoffs are zero. The minimum-length image of the complete qualifying class is the singleton $\{4\}$. The fixed physical branch and prefix evaluator determine this result. Comparing with a different presentation requires the matching conditions of Proposition 2.4.1j.

The source bindings below hash the exact UTF-8 owning theorem bodies, including each title and excluding the anchor, the resolution and surrounding blank lines. The checker exercises the arithmetic and all 31 candidates through length four. Its finite decisions correspond to the proof rows just described. The source and scope arguments are in Theorems P.1e–P.1f.

| Source | SHA-256 |
|:--|:--|
| Theorem P.1e | `a58e038b0e25b767d1edbeac5918ae96efc1b4a801c981a69dcada079f19240d` |
| Theorem P.1f | `13c0bdee3a1add64609954b6ae28afacb6801006bcdaa94fd9833a3d9560cd91` |
| Arithmetic verifier below | `f9cef70d4689e659edf7799adf3116f18d5d23162d4edce934ad342c19230fb7` |

```python
from itertools import product
from fractions import Fraction

WORDS = ('00', '01', '100', '101')
MODES = dict(zip(WORDS, ('fair', 'freeze', 'feedback-s-first', 'feedback-x-first')))
BANKS = ('0', '1')


def admitted(word):
    return len(word) in (3, 4) and word[0] in BANKS and word[1:] in MODES


def verify(condition, label):
    if not condition:
        raise ValueError(label)


def score(mode):
    total = Fraction(0)
    mass = Fraction(0)
    for start, z1, z2, fair1, fair2 in product((0, 1), repeat=5):
        weight = Fraction(1, 8) * Fraction(3 if z1 == 0 else 1, 4) * Fraction(3 if z2 == 0 else 1, 4)
        model, current = start, start
        correct = 0
        for innovation, fair_bit in zip((z1, z2), (fair1, fair2)):
            prediction = fair_bit if mode == 'fair' else model
            current ^= innovation
            match = int(prediction == current)
            correct += match
            if mode.startswith('feedback-'):
                model = prediction ^ (1 - match)
                verify(model == current, 'feedback assignment')
        total += weight * Fraction(correct, 2)
        mass += weight
    verify(mass == 1, 'normalized task law')
    return total


def main():
    candidates = [''.join(bits) for length in range(5) for bits in product('01', repeat=length)]
    verify(len(candidates) == 31, 'complete bounded candidate set')
    admitted_words = tuple(word for word in candidates if admitted(word))
    expected = ('000', '001', '100', '101', '0100', '0101', '1100', '1101')
    verify(admitted_words == expected, 'physical command leaves')
    for first in admitted_words:
        verify(not any(second.startswith(first) for second in admitted_words if second != first), 'prefix tree')
        verify(not first.startswith('111') and not '111'.startswith(first), 'separate namespace')
    scores = {mode: score(mode) for mode in MODES.values()}
    verify(tuple(scores.values()) == (Fraction(1, 2), Fraction(11, 16), Fraction(3, 4), Fraction(3, 4)), 'score table')
    for bank in BANKS:
        qualifiers = tuple(word for word in admitted_words if word[0] == bank
                           and MODES[word[1:]].startswith('feedback-')
                           and scores[MODES[word[1:]]] > Fraction(5, 8))
        verify(qualifiers == (bank + '100', bank + '101'), 'complete qualifying class')
        verify(all(len(word) == 4 for word in qualifiers), 'attained minimum')
    print('31 words, 8 leaves, 4 qualifying commands; both minima equal 4.')


if __name__ == '__main__':
    main()
```
