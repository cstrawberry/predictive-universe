#!/usr/bin/env python3
"""Independently verify checkpoint and contraction JSON from ``pure-s-demo``.

Human-readable term previews are ignored.  Every input line beginning with a
JSON object delimiter is treated as a checkpoint record and checked against a
small, independent implementation of the totalized empty-word cyclic-tag step.  In
contraction mode, lossless pure-S prefix terms are parsed independently and
checked against the rule, size balance, and printed Appendix E.3 schedule.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import NoReturn

from verification_runtime import require_assertions_enabled


require_assertions_enabled()


ARTIFACT = (
    Path(__file__).resolve().parent.parent
    / "artifacts"
    / "rogozhin46_cook_cts.json"
)
PAPER_TEMPLATE = Path(__file__).resolve().parent.parent / "paper" / "unified_template.md"
REQUIRED_FIELDS = {
    "program",
    "word",
    "contraction",
    "horizon",
    "phase",
    "data",
    "expected",
    "match",
    "term_size",
}
CONTRACTION_FIELDS = {
    "trace",
    "index",
    "microtick",
    "address",
    "after_address",
    "operation",
    "control",
    "x",
    "y",
    "z",
    "before_focus",
    "after_focus",
    "before_size",
    "after_size",
    "saturated",
    "contractum_match",
    "address_preserved",
}

# Exact schedule printed in paper Appendix E.3.  The verifier deliberately
# carries its own copy rather than importing output from Lean.
TINY_FIRST_CHECKPOINT = (
    (49, "L", "enter-stage", 179),
    (152, "L", "expand-stage-one", 191),
    (201, "LR", "expand-stage-one", 203),
    (285, "ε", "launch-one-step-job", 353),
    (311, "L", "launch-one-step-job", 503),
    (313, "ε", "launch-one-step-job", 689),
    (371, "RL", "launch-one-step-job", 839),
    (374, "RL", "launch-one-step-job", 993),
    (376, "R", "launch-one-step-job", 1179),
    (378, "RL", "launch-one-step-job", 1365),
    (380, "R", "launch-one-step-job", 1859),
    (812, "RLRLLRRRRR", "consume-front-cell", 1859),
    (1270, "ε", "expose-branch-table", 3377),
    (1272, "L", "expose-branch-table", 4895),
    (1276, "LL", "expose-branch-table", 6413),
    (1278, "LLR", "select-route-0-1", 7931),
    (1280, "LLRR", "select-route-0-1", 9449),
    (1282, "LLRRL", "select-route-0-1", 10967),
    (1284, "LLRRLR", "select-route-0-1", 12485),
    (1286, "LLRRLRR", "select-route-0-1", 14003),
    (1288, "LLRRLRRR", "append-one", 15521),
    (1289, "LLRRLRRR", "append-one", 17057),
)

TINY_INITIAL_SIZE = 171


class TraceError(ValueError):
    """A malformed or semantically incorrect demo trace."""


def fail(message: str) -> NoReturn:
    print(f"FAIL demo trace: {message}", file=sys.stderr)
    raise SystemExit(1)


def bit_word(value: object, field: str) -> tuple[int, ...]:
    if not isinstance(value, str) or any(bit not in "01" for bit in value):
        raise TraceError(f"{field} must be a bit string")
    return tuple(int(bit) for bit in value)


def bit_list(value: object, field: str) -> tuple[int, ...]:
    if not isinstance(value, list):
        raise TraceError(f"{field} must be a JSON list")
    if any(type(bit) is not int or bit not in (0, 1) for bit in value):
        raise TraceError(f"{field} must contain only the integers 0 and 1")
    return tuple(value)


def natural(value: object, field: str, *, positive: bool = False) -> int:
    lower = 1 if positive else 0
    if type(value) is not int or value < lower:
        qualifier = "a positive integer" if positive else "a nonnegative integer"
        raise TraceError(f"{field} must be {qualifier}")
    return value


def parse_term_prefix(value: object, field: str) -> tuple[str, int]:
    """Parse lossless ``S``/``A(left,right)`` notation and return its size.

    This parser is independent of Lean's ``Term`` implementation.  It also
    rejects prefixes containing the human-preview ellipsis, trailing data, or
    noncanonical syntax.
    """
    if not isinstance(value, str) or not value:
        raise TraceError(f"{field} must be a nonempty term string")

    def parse_at(offset: int) -> tuple[int, int]:
        if offset >= len(value):
            raise TraceError(f"{field} ends inside a term")
        if value[offset] == "S":
            return offset + 1, 1
        if not value.startswith("A(", offset):
            raise TraceError(f"{field} has invalid term syntax at byte {offset}")
        after_left, left_size = parse_at(offset + 2)
        if after_left >= len(value) or value[after_left] != ",":
            raise TraceError(f"{field} is missing an application comma")
        after_right, right_size = parse_at(after_left + 1)
        if after_right >= len(value) or value[after_right] != ")":
            raise TraceError(f"{field} is missing an application close parenthesis")
        return after_right + 1, 1 + left_size + right_size

    try:
        end, size = parse_at(0)
    except RecursionError as exc:
        raise TraceError(f"{field} exceeds the independent parser depth") from exc
    if end != len(value):
        raise TraceError(f"{field} contains trailing data")
    return value, size


def redex_prefix(x: str, y: str, z: str) -> str:
    return f"A(A(A(S,{x}),{y}),{z})"


def contractum_prefix(x: str, y: str, z: str) -> str:
    return f"A(A({x},{z}),A({y},{z}))"


def load_paper_contraction_schedule() -> tuple[tuple[int, str, int], ...]:
    """Read the 22 address rows actually printed in paper Appendix E.3."""
    try:
        source = PAPER_TEMPLATE.read_text(encoding="utf-8")
    except (OSError, UnicodeError) as exc:
        raise TraceError(f"cannot read paper schedule {PAPER_TEMPLATE}: {exc}") from exc
    marker = "### E.3 The persistent 22-contraction response"
    if source.count(marker) != 1:
        raise TraceError("paper must contain exactly one Appendix E.3 schedule")
    section = source.split(marker, 1)[1]
    rows: list[tuple[int, str, int]] = []
    pattern = re.compile(
        r"^\|\s*(\d+)\s*\|\s*([\d,]+)\s*\|\s*\$([^$]+)\$\s*\|[^|]*\|\s*([\d,]+)\s*\|$"
    )
    for line in section.splitlines():
        match = pattern.match(line)
        if match is None:
            continue
        index = int(match.group(1))
        if index != len(rows) + 1:
            if rows:
                break
            continue
        address = "ε" if match.group(3).strip() == r"\epsilon" else match.group(3).strip()
        rows.append(
            (int(match.group(2).replace(",", "")), address,
             int(match.group(4).replace(",", "")))
        )
        if len(rows) == len(TINY_FIRST_CHECKPOINT):
            break
    if len(rows) != len(TINY_FIRST_CHECKPOINT):
        raise TraceError(
            f"paper Appendix E.3 has {len(rows)} parsed schedule rows, expected "
            f"{len(TINY_FIRST_CHECKPOINT)}"
        )
    expected = tuple((tick, address, size) for tick, address, _, size in TINY_FIRST_CHECKPOINT)
    result = tuple(rows)
    if result != expected:
        raise TraceError("paper Appendix E.3 schedule differs from the independent fixture")
    return result


def load_fixed_appendants() -> tuple[tuple[int, ...], ...]:
    try:
        raw = json.loads(ARTIFACT.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise TraceError(f"cannot read fixed912 artifact {ARTIFACT}: {exc}") from exc
    if (
        not isinstance(raw, dict)
        or raw.get("schema") != "ROGOZHIN46_COOK_DELETION1_CTS_V1"
    ):
        raise TraceError("fixed912 artifact has an unexpected schema")
    values = raw.get("cts_appendants")
    if not isinstance(values, list) or len(values) != 912:
        raise TraceError("fixed912 artifact must contain exactly 912 appendants")
    return tuple(bit_word(value, f"cts_appendants[{index}]") for index, value in enumerate(values))


def program_appendants(name: object) -> tuple[tuple[int, ...], ...]:
    if name == "tiny":
        return ((1,), ())
    if name == "fixed912":
        return load_fixed_appendants()
    raise TraceError("program must be 'tiny' or 'fixed912'")


def iterate(
    appendants: tuple[tuple[int, ...], ...],
    word: tuple[int, ...],
    horizon: int,
) -> tuple[int, tuple[int, ...]]:
    phase = 0
    data = word
    for _ in range(horizon):
        if data:
            front, tail = data[0], data[1:]
            data = tail + (appendants[phase] if front == 1 else ())
        phase = (phase + 1) % len(appendants)
    return phase, data


def verify(lines: list[str]) -> int:
    count = 0
    stream_program: str | None = None
    stream_word: tuple[int, ...] | None = None
    appendants: tuple[tuple[int, ...], ...] | None = None
    previous_contraction = -1
    previous_horizon = -1

    for line_number, raw_line in enumerate(lines, start=1):
        line = raw_line.strip()
        if not line or not line.startswith("{"):
            continue
        try:
            record = json.loads(line)
        except json.JSONDecodeError as exc:
            raise TraceError(f"line {line_number} is malformed JSON: {exc.msg}") from exc
        if not isinstance(record, dict):
            raise TraceError(f"line {line_number} must contain one JSON object")
        missing = REQUIRED_FIELDS.difference(record)
        if missing:
            raise TraceError(
                f"line {line_number} is missing fields: {', '.join(sorted(missing))}"
            )

        name = record["program"]
        if not isinstance(name, str):
            raise TraceError(f"line {line_number}: program must be a string")
        word = bit_word(record["word"], f"line {line_number}: word")
        if stream_program is None:
            stream_program = name
            stream_word = word
            appendants = program_appendants(name)
        elif name != stream_program or word != stream_word:
            raise TraceError(f"line {line_number}: program and word changed within the stream")

        contraction = natural(record["contraction"], f"line {line_number}: contraction")
        horizon = natural(record["horizon"], f"line {line_number}: horizon")
        phase = natural(record["phase"], f"line {line_number}: phase")
        term_size = natural(
            record["term_size"], f"line {line_number}: term_size", positive=True
        )
        del term_size
        if contraction <= previous_contraction:
            raise TraceError(f"line {line_number}: contractions are not strictly increasing")
        if horizon <= previous_horizon:
            raise TraceError(f"line {line_number}: horizons are not strictly increasing")
        if type(record["match"]) is not bool:
            raise TraceError(f"line {line_number}: match must be Boolean")

        data = bit_list(record["data"], f"line {line_number}: data")
        claimed = bit_list(record["expected"], f"line {line_number}: expected")
        assert appendants is not None and stream_word is not None
        expected_phase, expected_data = iterate(appendants, stream_word, horizon)
        if phase != expected_phase:
            raise TraceError(
                f"line {line_number}: phase {phase} != independent phase {expected_phase}"
            )
        if claimed != expected_data:
            raise TraceError(f"line {line_number}: expected field disagrees with CTS iterate")
        if data != expected_data:
            raise TraceError(f"line {line_number}: decoder data disagrees with CTS iterate")
        if record["match"] is not True:
            raise TraceError(f"line {line_number}: demo reported match=false")

        previous_contraction = contraction
        previous_horizon = horizon
        count += 1

    if count == 0:
        raise TraceError("stream contains no checkpoint JSON objects")
    return count


def verify_contractions(lines: list[str], expected_count: int) -> int:
    """Check the machine-readable contraction trace emitted for the tiny CTS."""
    paper_schedule = load_paper_contraction_schedule()
    count = 0
    previous_microtick = -1
    summary_seen = False
    for line_number, raw_line in enumerate(lines, start=1):
        line = raw_line.strip()
        if not line.startswith("{"):
            continue
        try:
            record = json.loads(line)
        except json.JSONDecodeError as exc:
            raise TraceError(f"line {line_number} is malformed JSON: {exc.msg}") from exc
        if not isinstance(record, dict):
            raise TraceError(f"line {line_number} must contain one JSON object")
        if record.get("trace") == "summary":
            if summary_seen:
                raise TraceError("contraction trace contains more than one summary")
            if record.get("requested") != expected_count or record.get("verified") is not True:
                raise TraceError("contraction summary does not certify the requested count")
            summary_seen = True
            continue
        if record.get("trace") != "contraction":
            raise TraceError(f"line {line_number}: unexpected JSON record in contraction trace")
        if summary_seen:
            raise TraceError("contraction trace contains a row after its summary")
        missing = CONTRACTION_FIELDS.difference(record)
        if missing:
            raise TraceError(
                f"line {line_number} is missing fields: {', '.join(sorted(missing))}"
            )
        index = natural(record["index"], f"line {line_number}: index", positive=True)
        if index != count + 1:
            raise TraceError(f"line {line_number}: contraction indices are not consecutive")
        if index > len(TINY_FIRST_CHECKPOINT):
            raise TraceError(
                "the independent schedule currently covers exactly the first "
                f"{len(TINY_FIRST_CHECKPOINT)} tiny-program contractions"
            )
        expected_microtick, expected_address, expected_operation, expected_after_size = (
            TINY_FIRST_CHECKPOINT[index - 1]
        )
        paper_microtick, paper_address, paper_after_size = paper_schedule[index - 1]
        assert (
            expected_microtick,
            expected_address,
            expected_after_size,
        ) == (paper_microtick, paper_address, paper_after_size)
        microtick = natural(record["microtick"], f"line {line_number}: microtick")
        if microtick <= previous_microtick:
            raise TraceError(f"line {line_number}: microticks are not strictly increasing")
        if microtick != expected_microtick:
            raise TraceError(
                f"line {line_number}: microtick {microtick} != Appendix E.3 "
                f"microtick {expected_microtick}"
            )
        if record["operation"] != expected_operation:
            raise TraceError(
                f"line {line_number}: operation {record['operation']!r} "
                f"!= {expected_operation!r}"
            )
        for field in ("address", "after_address", "control"):
            if not isinstance(record[field], str) or not record[field]:
                raise TraceError(f"line {line_number}: {field} must be nonempty text")
        if record["address"] != expected_address:
            raise TraceError(
                f"line {line_number}: address {record['address']!r} != Appendix E.3 "
                f"address {expected_address!r}"
            )

        x, x_size = parse_term_prefix(record["x"], f"line {line_number}: x")
        y, y_size = parse_term_prefix(record["y"], f"line {line_number}: y")
        z, z_size = parse_term_prefix(record["z"], f"line {line_number}: z")
        before_focus, _ = parse_term_prefix(
            record["before_focus"], f"line {line_number}: before_focus"
        )
        after_focus, _ = parse_term_prefix(
            record["after_focus"], f"line {line_number}: after_focus"
        )
        independently_saturated = before_focus == redex_prefix(x, y, z)
        independently_matches = after_focus == contractum_prefix(x, y, z)
        independently_address_preserved = record["after_address"] == record["address"]

        before_size = natural(
            record["before_size"], f"line {line_number}: before_size", positive=True
        )
        after_size = natural(
            record["after_size"], f"line {line_number}: after_size", positive=True
        )
        expected_before_size = (
            TINY_INITIAL_SIZE if index == 1 else TINY_FIRST_CHECKPOINT[index - 2][3]
        )
        redex_size = x_size + y_size + z_size + 4
        contractum_size = x_size + y_size + 2 * z_size + 3
        if before_size < redex_size:
            raise TraceError(
                f"line {line_number}: focused redex is larger than the whole before term"
            )
        independently_after_size = before_size - redex_size + contractum_size
        if before_size != expected_before_size:
            raise TraceError(
                f"line {line_number}: before_size {before_size} != preceding schedule "
                f"size {expected_before_size}"
            )
        if after_size != independently_after_size:
            raise TraceError(
                f"line {line_number}: after_size {after_size} != independently "
                f"recomputed size {independently_after_size}"
            )
        if after_size != expected_after_size:
            raise TraceError(
                f"line {line_number}: after_size {after_size} != Appendix E.3 size "
                f"{expected_after_size}"
            )

        independent_checks = {
            "saturated": independently_saturated,
            "contractum_match": independently_matches,
            "address_preserved": independently_address_preserved,
        }
        for field, independently_computed in independent_checks.items():
            if type(record[field]) is not bool:
                raise TraceError(f"line {line_number}: {field} must be Boolean")
            if record[field] is not independently_computed:
                raise TraceError(
                    f"line {line_number}: {field} disagrees with independent reconstruction"
                )
            if not independently_computed:
                raise TraceError(f"line {line_number}: independent {field} check failed")
        count += 1
        previous_microtick = microtick
    if count != expected_count:
        raise TraceError(f"trace contains {count} contractions, expected {expected_count}")
    if not summary_seen:
        raise TraceError("contraction trace has no verified summary")
    return count


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--contractions",
        type=int,
        help="verify a contraction trace with exactly this many rows",
    )
    args = parser.parse_args()
    try:
        lines = list(sys.stdin)
        if args.contractions is None:
            count = verify(lines)
            label = "checkpoints"
        else:
            if args.contractions < 0:
                raise TraceError("--contractions must be nonnegative")
            count = verify_contractions(lines, args.contractions)
            label = "contractions"
    except TraceError as exc:
        fail(str(exc))
    qualifier = (
        "independently checked CTS checkpoints"
        if args.contractions is None
        else "independently checked contraction-trace records"
    )
    print(f"PASS demo trace: {count} {qualifier}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
