# R14 hierarchy registration and terminal certificate

This record accompanies [Theorem 2.4.1k](../../../02_foundations.md#theorem-241k). The source is the finite classical collision family of Definition 2.4.1g under the byte-exact response semantics of Definition 2.4.1i. The registered proof rules are interpreted by the source and induction proofs of Theorems 2.4.1h and 2.4.1k.

The JSON record below binds the source, registration and proof data. SHA-256 values in its source fields use the UTF-8 owner text without a terminal line break. The source span runs from the Definition 2.4.1g heading through Corollary 2.4.1h.1. The semantics span is Definition 2.4.1i. The hashes of the baseline and registration objects use sorted-key compact UTF-8 JSON. The two sides of the stage identity use the same evaluator and generated assertion list on every finite program.

```json
{
  "baseline": {
    "source_definition_sha256": "4d05a2e4a563cada38a9a16cd3e5e001ec2cd0a403eaebcb7c18c4f1991832b6",
    "semantics_sha256": "0b7fbef23c80b245d524a9fc7ae4b44641ed588f30786c5b6ac7f4c5802e1b45",
    "source_manifest_sha256": "ca40dea552962d3ff8df733905a0a316ebd57835b6dd9f43c9243b42591e3926",
    "runtime_sha256": "52596da3fcad958d15ba5129249015fb14a721ff3ff0b4f696b1baec664b7c22",
    "presentation": "R14-ByteExact-StackSemantics-v2"
  },
  "registration": {
    "source": {
      "source_definition_sha256": "4d05a2e4a563cada38a9a16cd3e5e001ec2cd0a403eaebcb7c18c4f1991832b6",
      "semantics_sha256": "0b7fbef23c80b245d524a9fc7ae4b44641ed588f30786c5b6ac7f4c5802e1b45",
      "source_manifest_sha256": "ca40dea552962d3ff8df733905a0a316ebd57835b6dd9f43c9243b42591e3926",
      "runtime_sha256": "52596da3fcad958d15ba5129249015fb14a721ff3ff0b4f696b1baec664b7c22",
      "presentation": "R14-ByteExact-StackSemantics-v2"
    },
    "alphabet": [
      "0",
      "1"
    ],
    "evaluator": "(2.4.1g.4) in Definition 2.4.1i",
    "code": "canonical typed UTF-8 JSON",
    "reference": "empty auxiliary string",
    "length": "binary word length",
    "membership": "Definition 2.4.1i, cumulative L*_n",
    "owners": [
      {
        "id": "S01",
        "rank": 0,
        "status": "include",
        "dependencies": []
      },
      {
        "id": "S02",
        "rank": 0,
        "status": "include",
        "dependencies": []
      },
      {
        "id": "S03",
        "rank": 1,
        "status": "include",
        "dependencies": [
          "S01"
        ]
      },
      {
        "id": "S04",
        "rank": 1,
        "status": "include",
        "dependencies": [
          "S01"
        ]
      },
      {
        "id": "S05",
        "rank": 1,
        "status": "include",
        "dependencies": [
          "S01",
          "S02"
        ]
      },
      {
        "id": "S06",
        "rank": 2,
        "status": "include",
        "dependencies": [
          "S04",
          "S05"
        ]
      },
      {
        "id": "S07",
        "rank": 1,
        "status": "include",
        "dependencies": [
          "S02"
        ]
      },
      {
        "id": "S08",
        "rank": 2,
        "status": "include",
        "dependencies": [
          "S03",
          "S05"
        ]
      },
      {
        "id": "S09",
        "rank": 3,
        "status": "include",
        "dependencies": [
          "S01",
          "S03",
          "S05",
          "S06"
        ]
      },
      {
        "id": "S10",
        "rank": 3,
        "status": "include",
        "dependencies": [
          "S01",
          "S02",
          "S05",
          "S08"
        ]
      },
      {
        "id": "S11",
        "rank": 4,
        "status": "include",
        "dependencies": [
          "S03",
          "S04",
          "S05",
          "S09"
        ]
      },
      {
        "id": "S12",
        "rank": 4,
        "status": "include",
        "dependencies": [
          "S02",
          "S03",
          "S05",
          "S10"
        ]
      },
      {
        "id": "M01",
        "rank": 0,
        "status": "exclude",
        "dependencies": []
      },
      {
        "id": "D01",
        "rank": 5,
        "status": "exclude",
        "dependencies": [
          "S01",
          "S02",
          "S03",
          "S04",
          "S05",
          "S06",
          "S07",
          "S08",
          "S09",
          "S10",
          "S11",
          "S12"
        ]
      },
      {
        "id": "X01",
        "rank": 0,
        "status": "exclude",
        "dependencies": []
      }
    ],
    "logical_root": [
      "standard integer and rational arithmetic",
      "finite set and matrix semantics",
      "equality and substitution",
      "propositional reasoning",
      "natural-number and finite-word induction"
    ],
    "rules": [
      "LOCAL_PRIMITIVES",
      "COMPOSE_STOCHASTIC",
      "TREE_WORD_INDUCTION",
      "PROTECTED_PREFIX_INDUCTION",
      "SEMIGROUP_COEFFICIENT_INDUCTION",
      "HIERARCHY_PERSISTENCE",
      "EXHAUSTIVE_STRING_EXCLUSION"
    ],
    "checker_sha256": "8de8be083a1c0ce7606bbc4137b95759ffb6a0e5c9320317fbcec8e398bf7fdb",
    "soundness_proof": "Theorem 2.4.1h and Definition 2.4.1i, applied in Theorem 2.4.1k"
  },
  "h_base": "dcc9a7a74f4774533b5b4eafbb4de1c1fbe0ff3ca4f85baa129892d459bff3d5",
  "h_H": "8b64cf1e89aa891b97e0ddd6c39ef63603840c7688fd9bd133a7cea239c425a0",
  "identity_proof": "literal presentation-field equality and substitution in each stage sentence",
  "terminal_packet_sha256": "477209fa0fabd03f71b2bbec11f8affda6a58fe356fe6d6015e0dec90a42e339",
  "target_code_sha256": "e304d99fa88644448f56616d8c9bb4be00e28610beae096ade313aa3e7b62efa",
  "program": "00001111",
  "length": 8,
  "N_val": 0,
  "N_arg": 0,
  "base_rule": "registered constructor and local source rules",
  "persistence_rule": "same byte output and every generated source assertion",
  "exclusion_level": 0,
  "strictly_shorter": 255,
  "equal_length": 256
}
```

The [fixed terminal packet](r14-terminal-census.json) contains the canonical initialized descriptor, seven rule names and both exhaustive lists. Recompute the word parser by checking the literal initial zero and the complete Elias gamma field. The other namespace starts with sixteen ones and a zero, so it never enters either census. Check each shorter constructor by its distinct capacity field and every other shorter word by definite undefined syntax. At length eight the only output with capacity fourteen is `00001111`. Use byte equality for complete finite codes, including integer and Boolean field types. The cumulative assertion and response inductions establish every later stage without bounding the universal interpreter.

The fixed checker is bound by its digest in the registration. Its negative controls reject Boolean and floating-point substitutions for rational integers, zero denominators, incomplete censuses, false equal-length survivors, malformed packets and drift in the claim or artifact bindings. The domain of this verifier is the fixed finite packet. The unbounded finite-string generator and its source soundness use the separate stack and induction proofs in Definition 2.4.1i.
