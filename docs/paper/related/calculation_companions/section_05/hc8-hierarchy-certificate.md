# HC8 hierarchy registration and finite certificate

This record accompanies [Theorem 5.2.3f](../../../05_horizon_constant.md#theorem-523f). Its source scope is the sealed HC8 construction in parts 1–5 of Construction 5.2.3d. The installed command grammar supplies one initialized apparatus, with ideal finite primitives and counted ready stock. Program length is relative to the installed command and interpreter.

The pinned values below use SHA-256 of the UTF-8 byte records. The initialized descriptor is the literal canonical ASCII encoding of the displayed $D_0$. Its checksum is the same as the canonicalized initialized descriptor in the source record.

| Record | SHA-256 |
|:--|:--|
| HC8 source and adoption specification | `995ea450d822e246a23abf3a3795862c554c2b4f98ccaece2df867bec63bb1e3` |
| HC8 presentation registration | `a6c919be6936aca67c4eed7a4490c23e3548e7aef093d70a8f293f64f71b4063` |
| HC8 canonical initialized descriptor $s_H$ | `0d06ed0254016e6809f8597e921467a94c0135f5348f0a2cfd34d0b198a33090` |
| Universal interpreter specification used for $V$ | `f83a4233b5dff4ca8101094795ebb6ca88b48d62099e2ffac4bdaf1d1255f80f` |
| Fixed HC8 baseline and owner inventory | `9607f285dd977e57a9b173816e8c640966f26652a975287935dd216e32d13b87` |
| Canonical hierarchy registration and terminal proof record below | `73983c1f60e82d1282fcd7d58b2391a1b7cf4efbdd3fc8f2d3725d562fec43b0` |

## Canonical record

Serialize the following JSON as UTF-8 with keys in ASCII lexicographic order, no insignificant whitespace and no terminal newline. The hierarchy registration consists of the `source`, `presentation`, `owners` and `rules` fields. Serialize their containing record by the same convention to obtain $h_H$. The proof rows reference those fields and the displayed parts of the construction.

```json
{
  "source": {"id":"HC8-role-carrier-presentation-v1","baseline_sha256":"9607f285dd977e57a9b173816e8c640966f26652a975287935dd216e32d13b87","descriptor_sha256":"0d06ed0254016e6809f8597e921467a94c0135f5348f0a2cfd34d0b198a33090"},
  "presentation": {"alphabet":["0","1"],"code":"Construction 5.2.3d part 5","evaluator":"U_H of Construction 5.2.3d","reference":"blank ready HC8 initialization","length":"binary word length","membership":"P=101 at every stage"},
  "owners": [["H1",1,[]],["H2",2,["H1"]],["H3",3,["H1"]],["H4",4,["H1","H2","H3"]],["H5",5,["H1","H2","H3","H4"]]],
  "rules": ["literal finite equality","registered command grammar","registered constructor","stage generalization"],
  "identity": ["alphabet","evaluator","code","reference","length","membership"],
  "realizer": {"word":"101","output":"s_H","length":3,"base_stage":0,"persistence":"membership is independent of stage"},
  "short_exclusions": [["",0],["0",0],["1",0],["00",0],["01",0],["10",0],["11",0]],
  "equal_length_exclusions": [["000",0],["001",0],["010",0],["011",0],["100",0],["110",0],["111",0]],
  "cutoffs": {"value":0,"argmin":0}
}
```

The fixed baseline hash binds the UTF-8 text beginning with the Construction 5.2.3d heading and ending after its final proof paragraph, with no trailing line break. The hierarchy registration has hash `ced9760fce655d879bd91df5d4f2e9f50c386300c7ee11e81e44027e0c7284c6`. The baseline identity uses the same literal presentation-field records on both sides. The code and reference fields point to their exact definitions in the bound source. The trust root is finite string and record equality, elementary natural-number arithmetic and propositional inference. The registered command and constructor are the two source rules used in the proof. Their mathematical interpretations are respectively the immutable command interface and its literal byte output.

Check the owner list against parts 1–5. For each listed dependency check that it points to a lower-ranked owner using the ranks in Theorem 5.2.3f. Read the command grammar from the controller interface and check that it is the only admission rule at every stage. For the constructor, reproduce the canonical $D_0$ bytes, compare the hash, and check that $U_H$ returns those bytes at the same command. For each shorter and equal-length row check the literal mismatch with that command and the stage zero exclusion. The persistence proof substitutes the same command test at $n$ and $n+1$ for arbitrary $n$. Syntax, the logical proof rules, the source interpretation and the output-equality claim are separate fields.

For the qualifying image, verify the cycle from $000$ on the installed diagnostic map. On each of the eight atoms $(B_0,F_1,F_2)$ of the supplied law, verify the forecast, acquisition, phase, comparison and feedback in the two task cycles. Sum the exact probabilities of correct forecasts for each cycle. Both give $3/4$ and the comparison threshold is $5/8$. This checks qualification of the only admitted state. The role encoding assigns its eight visited contexts to eight orthogonal basis states, with the additional source and control resources in their own physical inventory.
