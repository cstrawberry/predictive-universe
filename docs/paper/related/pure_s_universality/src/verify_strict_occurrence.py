#!/usr/bin/env python3
"""Regression replay for strict one-occurrence pure-S cursor semantics."""

from __future__ import annotations

from verification_runtime import require_assertions_enabled


require_assertions_enabled()

from strict_occurrence import (
    CursorError,
    OccurrenceCursor,
    contract_at,
    run_appender_cursor,
)
from verify_focused_cts_macros import carrier, push
from verify_macros import S, T, V, ap, spine, steps


def main() -> None:
    x, y, z, trailer = (V(name) for name in ("X", "Y", "Z", "R"))

    # Rdx is a strict occurrence operation.  A saturated head spine has its
    # redex in a proper left child, never at the displayed root.
    redex = ap(S, x, y, z)
    saturated = ap(redex, trailer)
    cursor = OccurrenceCursor.at_root(saturated)
    try:
        cursor.contract()
    except CursorError:
        pass
    else:
        raise AssertionError("Rdx accepted a saturated spine at the wrong cursor")
    cursor.move_left()
    cursor.contract()
    cursor.move_up()
    expected_saturated = ap(ap(x, z), ap(y, z), trailer)
    assert cursor.focus == expected_saturated
    assert contract_at(saturated, "L") == expected_saturated

    # The strict five-contraction C_0 base script is L,L,root,L,root.
    b = ap(S, S)
    c0 = carrier(0)
    e, k = V("E"), V("K")
    base_call = ap(c0, e, k)
    strict_base = base_call
    for path in ("L", "L", "", "L", ""):
        strict_base = contract_at(strict_base, path)
    assert strict_base == steps(base_call, 5)

    # The E/D/Act prefix contracts at root, then L, then LL.
    halt, actions, seed, continuation, state = (
        V(name) for name in ("Halt", "Actions", "Seed", "B", "State")
    )
    act = ap(S, halt, actions)
    d = ap(S, act, seed)
    envelope = ap(S, d)
    frame = ap(envelope, continuation, state)
    strict_prefix = frame
    for path in ("", "L", "LL"):
        strict_prefix = contract_at(strict_prefix, path)
    assert strict_prefix == steps(frame, 3)

    # A compiled appender admits a monotone linear cursor walk.  Every Rdx
    # is strict, and the cursor returns to the completed action root using
    # exactly k-1 U moves.
    p = ap(S, b)
    c0fuel = carrier(0)
    v0 = ap(S, c0fuel)
    v1 = ap(S, ap(S, c0fuel))
    lives = (ap(b, v0), ap(b, v1))
    predecessor = V("V")

    for bits in ((0,), (1, 0), (0, 1, 1), (1, 0, 1, 0, 1, 1, 0)):
        appender: T = p
        for bit in reversed(bits):
            appender = push(lives[bit], appender)
        call = ap(appender, predecessor)
        expected = steps(call, 2 * len(bits))

        cursor = OccurrenceCursor.at_root(call)
        contractions = run_appender_cursor(cursor, len(bits))
        assert contractions == 2 * len(bits)
        assert cursor.depth == len(bits) - 1
        for _ in range(len(bits) - 1):
            cursor.move_up()
        assert cursor.depth == 0
        assert cursor.focus == expected

        root, args = spine(cursor.focus)
        assert root == S and args[0] == b and len(args) == len(bits) + 2

    print("PASS strict Rdx rejects a saturated spine at the wrong cursor")
    print("PASS exact C_0 and E/D/Act cursor paths")
    print("PASS linear exact appender cursor scripts")


if __name__ == "__main__":
    main()
