#!/usr/bin/env python3
"""Independent structural verifier for the fixed 912-appendant endpoint."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

from verification_runtime import require_assertions_enabled


require_assertions_enabled()


ROOT = Path(__file__).resolve().parents[1]
ARTIFACT = ROOT / "artifacts" / "rogozhin46_cook_cts.json"
STATES = ("A", "B", "C", "D")

# An independently transcribed row-major table.  H denotes halt.
ROWS = (
    (("A", 3, "L"), ("B", 4, "R"), ("C", 0, "R"), ("D", 4, "R")),
    (("A", 2, "R"), ("C", 2, "L"), ("D", 3, "R"), ("B", 5, "L")),
    (("A", 1, "L"), ("B", 3, "R"), ("C", 1, "R"), ("D", 3, "R")),
    (("A", 4, "R"), ("B", 2, "L"), None, None),
    (("A", 3, "L"), ("B", 0, "L"), ("A", 5, "R"), ("B", 5, "L")),
    (("D", 4, "R"), ("B", 1, "R"), ("A", 0, "R"), ("D", 1, "R")),
)


def names() -> list[str]:
    alpha = [f"H_{q}" for q in STATES]
    alpha += [f"L_{q}" for q in STATES]
    alpha += [f"R_{q}" for q in STATES]
    alpha += [f"Rstar_{q}" for q in STATES]
    for kind in ("H", "L", "R"):
        alpha += [f"{kind}_{q}_{j}" for q in STATES for j in range(1, 9)]
    alpha += ["dummy_1", "dummy_2"]
    return alpha


def expected_productions(alpha: list[str]) -> list[list[str]]:
    out = {name: [] for name in alpha}
    for q_index, q in enumerate(STATES):
        out[f"H_{q}"] = [f"H_{q}_{j}" for j in range(1, 9)]
        out[f"L_{q}"] = [f"L_{q}_{j}" for j in range(1, 9)]
        out[f"R_{q}"] = [f"R_{q}_{j}" for j in range(1, 9)]
        out[f"Rstar_{q}"] = [f"R_{q}"] * 8
        for j in range(1, 7):
            step = ROWS[j - 1][q_index]
            if step is None:
                continue
            target, written, direction = step
            shift = 8 * (7 - written)
            if direction == "L":
                out[f"H_{q}_{j}"] = [f"Rstar_{target}"] * shift + [
                    f"H_{target}"
                ] * j
                out[f"L_{q}_{j}"] = [f"L_{target}"]
                out[f"R_{q}_{j}"] = [f"R_{target}"] * 64
            else:
                out[f"H_{q}_{j}"] = [f"H_{target}"] * j + [
                    f"L_{target}"
                ] * shift
                out[f"L_{q}_{j}"] = [f"L_{target}"] * 64
                out[f"R_{q}_{j}"] = [f"R_{target}"]
        out[f"H_{q}_7"] = [f"H_{q}"] * 10 + [f"L_{q}"] * 8
        out[f"H_{q}_8"] = [f"H_{q}"] * 11
        out[f"L_{q}_7"] = [f"L_{q}"] * 8
        out[f"L_{q}_8"] = [f"L_{q}"] * 8
        out[f"R_{q}_7"] = [f"R_{q}"] * 8
        out[f"R_{q}_8"] = [f"R_{q}"] * 8
    return [out[name] for name in alpha]


def code_symbol(index: int) -> str:
    return "0" * index + "1" + "0" * (113 - index)


def main() -> None:
    raw = ARTIFACT.read_bytes()
    data = json.loads(raw)
    assert data["schema"] == "ROGOZHIN46_COOK_DELETION1_CTS_V1"
    assert data["machine"]["states"] == list(STATES)
    assert data["machine"]["symbols"] == list(range(6))
    assert data["machine"]["blank"] == 4

    for read, row in enumerate(ROWS):
        got = data["machine"]["transitions"][read]
        assert got["read"] == read
        for q, step in zip(STATES, row):
            entry = got["entries"][q]
            if step is None:
                assert entry is None
            else:
                assert entry == {
                    "next_state": step[0],
                    "write": step[1],
                    "move": step[2],
                }

    alpha = names()
    assert len(alpha) == len(set(alpha)) == 114
    assert data["tag_alphabet"] == alpha
    expected = expected_productions(alpha)
    assert data["tag_productions"] == expected

    index = {name: i for i, name in enumerate(alpha)}
    encoded = ["".join(code_symbol(index[s]) for s in rhs) for rhs in expected]
    appendants = data["cts_appendants"]
    assert len(appendants) == 912
    assert appendants[:114] == encoded
    assert appendants[114:] == [""] * 798
    assert all(len(bits) % 114 == 0 for bits in appendants)
    assert all(block.count("1") == 1 for bits in encoded for block in (
        bits[i : i + 114] for i in range(0, len(bits), 114)
    ))

    # For x=0, Cook's typeset exponent 8^(x+1) gives eight L symbols.
    # This fixture rejects the misleading "8x+1" PDF-text extraction.
    blank_word = ["H_A"] * 4 + ["L_A"] * 8
    blank_bits = "".join(code_symbol(index[s]) for s in blank_word)
    assert hashlib.sha256(blank_bits.encode("ascii")).hexdigest() == data[
        "blank_configuration_A_sha256"
    ]

    digest = hashlib.sha256(raw).hexdigest()
    print(
        "PASS universal endpoint "
        f"states=4 symbols=6 tag_symbols=114 appendants=912 sha256={digest}"
    )


if __name__ == "__main__":
    main()
