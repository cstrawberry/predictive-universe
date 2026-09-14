#!/usr/bin/env python3
"""Check the fixed endpoint against Rogozhin's printed UTM(4,6) source.

The publication is Yurii Rogozhin, "Small Universal Turing Machines",
Theoretical Computer Science 168(2), 1996, Section 8, pp. 231--233,
doi:10.1016/S0304-3975(96)00077-1.  Page 232 prints the complete program;
pp. 232--233 print a symbolic three-stage macrotrace using its commands.

This offline verifier contains independent, human-readable transcriptions of
both objects.  It does not download or parse the copyrighted PDF.  The scan
used for the transcription has SHA-256
e7b21e9cf14df62da7412c09272d9d094c2e8fe23c70c883c3fd8075c541fe0b.
"""

from __future__ import annotations

import json
import re
from pathlib import Path

from verification_runtime import require_assertions_enabled


require_assertions_enabled()


ROOT = Path(__file__).resolve().parents[1]
ARTIFACT = ROOT / "artifacts" / "rogozhin46_cook_cts.json"
LEAN_TABLE = ROOT / "formalization" / "PureSFormal" / "Rogozhin" / "Table.lean"

SOURCE_STATES = ("q1", "q2", "q3", "q4")
SOURCE_SYMBOLS = ("1", "b", "b_right", "b_left", "0", "c")

# Rogozhin, Section 8, p. 232.  Rows follow the printed source-symbol order;
# columns follow q1,...,q4.  A running action is (written, move, next_state).
PUBLISHED_ROWS = (
    ("1", (
        ("b_left", "L", "q1"), ("0", "R", "q2"),
        ("1", "R", "q3"), ("0", "R", "q4"),
    )),
    ("b", (
        ("b_right", "R", "q1"), ("b_right", "L", "q3"),
        ("b_left", "R", "q4"), ("c", "L", "q2"),
    )),
    ("b_right", (
        ("b", "L", "q1"), ("b_left", "R", "q2"),
        ("b", "R", "q3"), ("b_left", "R", "q4"),
    )),
    ("b_left", (
        ("0", "R", "q1"), ("b_right", "L", "q2"), None, None,
    )),
    ("0", (
        ("b_left", "L", "q1"), ("1", "L", "q2"),
        ("c", "R", "q1"), ("c", "L", "q2"),
    )),
    ("c", (
        ("0", "R", "q4"), ("b", "R", "q2"),
        ("1", "R", "q1"), ("b", "R", "q4"),
    )),
)

# Every printed primitive-command occurrence in the symbolic three-stage
# derivation on pp. 232--233, in publication order.  Tuple order is
# (state, scanned, written, move, next_state); the dash is a halt.
PUBLISHED_MACROTRACE = (
    # p. 232, stage (i)
    ("q1", "1", "b_left", "L", "q1"),
    ("q1", "0", "b_left", "L", "q1"),
    ("q1", "b_right", "b", "L", "q1"),
    ("q1", "b", "b_right", "R", "q1"),
    ("q1", "b_left", "0", "R", "q1"),
    ("q1", "b", "b_right", "R", "q1"),
    ("q1", "1", "b_left", "L", "q1"),
    ("q1", "c", "0", "R", "q4"),
    # p. 232, stage (ii)
    ("q2", "0", "1", "L", "q2"),
    ("q2", "b_left", "b_right", "L", "q2"),
    ("q2", "b", "b_right", "L", "q3"),
    ("q3", "0", "c", "R", "q1"),
    ("q1", "b_right", "b", "L", "q1"),
    ("q1", "c", "0", "R", "q4"),
    ("q4", "b", "c", "L", "q2"),
    ("q2", "0", "1", "L", "q2"),
    ("q2", "b_right", "b_left", "R", "q2"),
    # p. 233, continuation of stage (ii)
    ("q2", "1", "0", "R", "q2"),
    ("q2", "1", "0", "R", "q2"),
    ("q2", "b_right", "b_left", "R", "q2"),
    ("q2", "c", "b", "R", "q2"),
    ("q2", "0", "1", "L", "q2"),
    ("q2", "b", "b_right", "L", "q3"),
    ("q3", "b", "b_left", "R", "q4"),
    ("q4", "b_right", "b_left", "R", "q4"),
    ("q4", "1", "0", "R", "q4"),
    ("q4", "b_right", "b_left", "R", "q4"),
    ("q4", "c", "b", "R", "q4"),
    ("q4", "0", "c", "L", "q2"),
    ("q2", "b", "b_right", "L", "q3"),
    ("q3", "b_left", None, None, None),
    ("q2", "b", "b_right", "L", "q3"),
    ("q3", "1", "1", "R", "q3"),
    ("q3", "b_right", "b", "R", "q3"),
    # p. 233, stage (iii) and the next-cycle handoff
    ("q3", "b_right", "b", "R", "q3"),
    ("q3", "1", "1", "R", "q3"),
    ("q3", "c", "1", "R", "q1"),
)

STATE_RENAMING = {"q1": "A", "q2": "B", "q3": "C", "q4": "D"}
SYMBOL_RENAMING = {
    "1": 0,
    "b": 1,
    "b_right": 2,
    "b_left": 3,
    "0": 4,
    "c": 5,
}

def source_table() -> dict[tuple[str, str], tuple[str, str, str] | None]:
    table: dict[tuple[str, str], tuple[str, str, str] | None] = {}
    for symbol, row in PUBLISHED_ROWS:
        assert symbol in SOURCE_SYMBOLS
        assert len(row) == len(SOURCE_STATES)
        for state, action in zip(SOURCE_STATES, row):
            key = (state, symbol)
            assert key not in table
            table[key] = action
    return table


def normalize(
    table: dict[tuple[str, str], tuple[str, str, str] | None],
    state_map: dict[str, str] = STATE_RENAMING,
    symbol_map: dict[str, int] = SYMBOL_RENAMING,
) -> dict[tuple[str, int], tuple[str, int, str] | None]:
    normalized: dict[tuple[str, int], tuple[str, int, str] | None] = {}
    for (state, read), action in table.items():
        key = (state_map[state], symbol_map[read])
        assert key not in normalized
        if action is None:
            normalized[key] = None
        else:
            written, move, next_state = action
            normalized[key] = (state_map[next_state], symbol_map[written], move)
    return normalized


def artifact_table() -> dict[tuple[str, int], tuple[str, int, str] | None]:
    data = json.loads(ARTIFACT.read_bytes())
    assert data["schema"] == "ROGOZHIN46_COOK_DELETION1_CTS_V1"
    table: dict[tuple[str, int], tuple[str, int, str] | None] = {}
    for row in data["machine"]["transitions"]:
        read = row["read"]
        for state in ("A", "B", "C", "D"):
            entry = row["entries"][state]
            key = (state, read)
            assert key not in table
            table[key] = None if entry is None else (
                entry["next_state"], entry["write"], entry["move"]
            )
    return table


def lean_table() -> dict[tuple[str, int], tuple[str, int, str] | None]:
    text = LEAN_TABLE.read_text(encoding="utf-8")
    block = text.split("def transition :", 1)[1].split(
        "/-- A fully reflected cell", 1
    )[0]
    step_pattern = re.compile(
        r"^\s*\| \.(?P<state>[ABCD]), \.s(?P<read>[0-5]) => "
        r"\.step \.(?P<next>[ABCD]) \.s(?P<write>[0-5]) "
        r"\.(?P<move>left|right)\s*$"
    )
    halt_pattern = re.compile(
        r"^\s*\| \.(?P<state>[ABCD]), \.s(?P<read>[0-5]) => \.halt\s*$"
    )
    table: dict[tuple[str, int], tuple[str, int, str] | None] = {}
    for line in block.splitlines():
        if match := step_pattern.fullmatch(line):
            key = (match["state"], int(match["read"]))
            assert key not in table
            table[key] = (
                match["next"],
                int(match["write"]),
                "L" if match["move"] == "left" else "R",
            )
        elif match := halt_pattern.fullmatch(line):
            key = (match["state"], int(match["read"]))
            assert key not in table
            table[key] = None
    return table


def macrotrace_matches(
    trace: tuple[tuple[str, str, str | None, str | None, str | None], ...],
    table: dict[tuple[str, str], tuple[str, str, str] | None],
) -> bool:
    for state, read, written, move, next_state in trace:
        expected = table[(state, read)]
        got = None if written is None else (written, move, next_state)
        if got != expected:
            return False
    return True


def mutated_source_tables(
    table: dict[tuple[str, str], tuple[str, str, str] | None],
):
    for key, action in table.items():
        if action is None:
            mutated = dict(table)
            mutated[key] = ("1", "R", "q1")
            yield mutated
            continue
        written, move, next_state = action
        replacements = (
            (SOURCE_SYMBOLS[(SOURCE_SYMBOLS.index(written) + 1) % 6], move, next_state),
            (written, "R" if move == "L" else "L", next_state),
            (written, move, SOURCE_STATES[(SOURCE_STATES.index(next_state) + 1) % 4]),
        )
        for replacement in replacements:
            mutated = dict(table)
            mutated[key] = replacement
            yield mutated


def main() -> None:
    published = source_table()
    expected_keys = {
        (state, symbol) for symbol in SOURCE_SYMBOLS for state in SOURCE_STATES
    }
    assert len(published) == 24
    assert set(published) == expected_keys
    assert {key for key, action in published.items() if action is None} == {
        ("q3", "b_left"),
        ("q4", "b_left"),
    }

    assert len(PUBLISHED_MACROTRACE) == 37
    assert macrotrace_matches(PUBLISHED_MACROTRACE, published)
    covered = {(state, read) for state, read, _, _, _ in PUBLISHED_MACROTRACE}
    assert len(covered) == 23
    assert set(published) - covered == {("q4", "b_left")}

    normalized = normalize(published)
    artifact = artifact_table()
    lean = lean_table()
    assert len(normalized) == len(artifact) == len(lean) == 24
    assert normalized == artifact == lean

    mutations = 0
    for mutated in mutated_source_tables(published):
        assert normalize(mutated) != artifact
        mutations += 1
    assert mutations == 68

    for index, command in enumerate(PUBLISHED_MACROTRACE):
        state, read, written, move, next_state = command
        replacement = (
            state,
            read,
            "1" if written is None or written != "1" else "b",
            "R" if move is None or move == "L" else "L",
            "q1" if next_state is None or next_state != "q1" else "q2",
        )
        mutated_trace = list(PUBLISHED_MACROTRACE)
        mutated_trace[index] = replacement
        assert not macrotrace_matches(tuple(mutated_trace), published)
        mutations += 1

    for first, second in (("b_right", "b_left"), ("0", "c")):
        mutated_map = dict(SYMBOL_RENAMING)
        mutated_map[first], mutated_map[second] = (
            mutated_map[second], mutated_map[first]
        )
        assert normalize(published, symbol_map=mutated_map) != artifact
        mutations += 1
    mutated_states = dict(STATE_RENAMING)
    mutated_states["q1"], mutated_states["q2"] = (
        mutated_states["q2"], mutated_states["q1"]
    )
    assert normalize(published, state_map=mutated_states) != artifact
    mutations += 1

    assert mutations == 108
    print(
        "PASS Rogozhin primary-source concordance "
        "table_cells=24 macrotrace_commands=37 covered_cells=23 "
        f"artifact_cells=24 lean_cells=24 mutations_killed={mutations}"
    )


if __name__ == "__main__":
    main()
