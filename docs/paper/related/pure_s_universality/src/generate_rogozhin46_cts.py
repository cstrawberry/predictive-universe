#!/usr/bin/env python3
"""Generate the fixed Rogozhin(4,6) -> Cook deletion-one CTS artifact.

The output is deterministic UTF-8 JSON.  It contains the complete ordered
tag alphabet, every tag production, and all 912 binary appendants.  No
search, simulation heuristic, or numerical arithmetic is used.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from verification_runtime import require_assertions_enabled


require_assertions_enabled()


STATES = ("A", "B", "C", "D")
SYMBOLS = tuple(range(6))
S = 8

# (next state, written symbol, direction); None is a halting entry.
TRANSITION = {
    ("A", 0): ("A", 3, "L"),
    ("B", 0): ("B", 4, "R"),
    ("C", 0): ("C", 0, "R"),
    ("D", 0): ("D", 4, "R"),
    ("A", 1): ("A", 2, "R"),
    ("B", 1): ("C", 2, "L"),
    ("C", 1): ("D", 3, "R"),
    ("D", 1): ("B", 5, "L"),
    ("A", 2): ("A", 1, "L"),
    ("B", 2): ("B", 3, "R"),
    ("C", 2): ("C", 1, "R"),
    ("D", 2): ("D", 3, "R"),
    ("A", 3): ("A", 4, "R"),
    ("B", 3): ("B", 2, "L"),
    ("C", 3): None,
    ("D", 3): None,
    ("A", 4): ("A", 3, "L"),
    ("B", 4): ("B", 0, "L"),
    ("C", 4): ("A", 5, "R"),
    ("D", 4): ("B", 5, "L"),
    ("A", 5): ("D", 4, "R"),
    ("B", 5): ("B", 1, "R"),
    ("C", 5): ("A", 0, "R"),
    ("D", 5): ("D", 1, "R"),
}


def h(state: str) -> str:
    return f"H_{state}"


def l(state: str) -> str:
    return f"L_{state}"


def r(state: str) -> str:
    return f"R_{state}"


def rs(state: str) -> str:
    return f"Rstar_{state}"


def indexed(kind: str, state: str, j: int) -> str:
    return f"{kind}_{state}_{j}"


def alphabet() -> list[str]:
    out = [h(q) for q in STATES]
    out += [l(q) for q in STATES]
    out += [r(q) for q in STATES]
    out += [rs(q) for q in STATES]
    for kind in ("H", "L", "R"):
        out += [indexed(kind, q, j) for q in STATES for j in range(1, 9)]
    out += ["dummy_1", "dummy_2"]
    assert len(out) == 114 and len(set(out)) == 114
    return out


def tag_productions(alpha: list[str]) -> dict[str, list[str]]:
    prod: dict[str, list[str]] = {name: [] for name in alpha}

    for q in STATES:
        prod[h(q)] = [indexed("H", q, j) for j in range(1, 9)]
        prod[l(q)] = [indexed("L", q, j) for j in range(1, 9)]
        prod[r(q)] = [indexed("R", q, j) for j in range(1, 9)]
        prod[rs(q)] = [r(q)] * 8

        for j in range(1, 7):
            step = TRANSITION[(q, j - 1)]
            if step is None:
                continue
            q_next, written, direction = step
            written_bar = written + 1
            shift = 8 * (8 - written_bar)
            if direction == "L":
                prod[indexed("H", q, j)] = (
                    [rs(q_next)] * shift + [h(q_next)] * j
                )
                prod[indexed("L", q, j)] = [l(q_next)]
                prod[indexed("R", q, j)] = [r(q_next)] * 64
            else:
                prod[indexed("H", q, j)] = (
                    [h(q_next)] * j + [l(q_next)] * shift
                )
                prod[indexed("L", q, j)] = [l(q_next)] * 64
                prod[indexed("R", q, j)] = [r(q_next)]

        # Cook's period-one blank-tail rules; Rogozhin blank index is 5
        # in Cook's one-based indexing.
        prod[indexed("H", q, 7)] = [h(q)] * 10 + [l(q)] * 8
        prod[indexed("H", q, 8)] = [h(q)] * 11
        prod[indexed("L", q, 7)] = [l(q)] * 8
        prod[indexed("L", q, 8)] = [l(q)] * 8
        prod[indexed("R", q, 7)] = [r(q)] * 8
        prod[indexed("R", q, 8)] = [r(q)] * 8

    alpha_set = set(alpha)
    assert set(prod) == alpha_set
    assert all(set(rhs) <= alpha_set for rhs in prod.values())
    return prod


def unary_symbol(index: int, n: int = 114) -> str:
    assert 0 <= index < n
    return "0" * index + "1" + "0" * (n - index - 1)


def encode_tag_word(word: list[str], index: dict[str, int]) -> str:
    return "".join(unary_symbol(index[symbol]) for symbol in word)


def encode_configuration(
    state: str,
    current: int,
    left_nearest_first: tuple[int, ...],
    right_nearest_first: tuple[int, ...],
    prod_index: dict[str, int],
) -> str:
    """Cook's period-one-tail initial map, followed by unary encoding."""
    x = len(left_nearest_first)
    h_count = 1 + S - (current + 1)
    l_count = S ** (x + 1) + sum(
        (S - (symbol + 1)) * S**k
        for k, symbol in enumerate(left_nearest_first, start=1)
    )
    r_count = sum(
        (S - (symbol + 1)) * S**k
        for k, symbol in enumerate(right_nearest_first, start=1)
    )
    tag_word = [h(state)] * h_count + [l(state)] * l_count + [r(state)] * r_count
    return encode_tag_word(tag_word, prod_index)


def build() -> dict[str, object]:
    alpha = alphabet()
    index = {name: i for i, name in enumerate(alpha)}
    prod = tag_productions(alpha)
    encoded = [encode_tag_word(prod[name], index) for name in alpha]
    appendants = encoded + [""] * 798
    assert len(appendants) == 912
    assert all(set(bits) <= {"0", "1"} for bits in appendants)
    assert all(len(bits) % 114 == 0 for bits in appendants)

    # The x=0 case checks Cook's typeset s^(x+1) exponent.  PDF text
    # extraction can flatten that superscript to the misleading "sx+1".
    blank_config = encode_configuration("A", 4, (), (), index)
    expected_blank = encode_tag_word([h("A")] * 4 + [l("A")] * 8, index)
    assert blank_config == expected_blank

    transition_rows = []
    for read in SYMBOLS:
        transition_rows.append(
            {
                "read": read,
                "entries": {
                    q: (
                        None
                        if TRANSITION[(q, read)] is None
                        else {
                            "next_state": TRANSITION[(q, read)][0],
                            "write": TRANSITION[(q, read)][1],
                            "move": TRANSITION[(q, read)][2],
                        }
                    )
                    for q in STATES
                },
            }
        )

    return {
        "schema": "ROGOZHIN46_COOK_DELETION1_CTS_V1",
        "sources": {
            "rogozhin_doi": "10.1016/S0304-3975(96)00077-1",
            "cocke_minsky_doi": "10.1145/321203.321206",
            "cook_doi": "10.4204/EPTCS.1.4",
        },
        "machine": {
            "states": list(STATES),
            "symbols": list(SYMBOLS),
            "blank": 4,
            "transitions": transition_rows,
        },
        "compiler": {
            "deletion_number": 8,
            "tag_alphabet_size": 114,
            "cts_period": 912,
            "phase_convention": "first 114 encoded productions, then 798 empties",
        },
        "tag_alphabet": alpha,
        "tag_productions": [prod[name] for name in alpha],
        "cts_appendants": appendants,
        "blank_configuration_A_sha256": hashlib.sha256(
            blank_config.encode("ascii")
        ).hexdigest(),
    }


def canonical_bytes(data: dict[str, object]) -> bytes:
    return (json.dumps(data, sort_keys=True, separators=(",", ":")) + "\n").encode(
        "utf-8"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output",
        type=Path,
        default=Path(__file__).resolve().parents[1]
        / "artifacts"
        / "rogozhin46_cook_cts.json",
    )
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    payload = canonical_bytes(build())
    digest = hashlib.sha256(payload).hexdigest()
    if args.check:
        if not args.output.exists() or args.output.read_bytes() != payload:
            raise SystemExit(f"artifact mismatch: {args.output}")
        print(f"PASS universal endpoint artifact sha256={digest}")
        return

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(payload)
    print(f"wrote {args.output} bytes={len(payload)} sha256={digest}")


if __name__ == "__main__":
    main()
