#!/usr/bin/env python3
"""Exact symbolic replay of the pure-S carrier and appender identities.

Variables are inert leaves. Every transition is the literal rule
    (((S x) y) z) -> ((x z) (y z)).
The checks correspond exactly to equations (C1)--(C6) in the paper.
"""

from __future__ import annotations

from dataclasses import dataclass

from verification_runtime import require_assertions_enabled


require_assertions_enabled()


@dataclass(frozen=True, slots=True)
class V:
    name: str


@dataclass(frozen=True, slots=True)
class Ap:
    f: "T"
    x: "T"


T = V | Ap
S = V("S")


def ap(f: T, *xs: T) -> T:
    for x in xs:
        f = Ap(f, x)
    return f


def spine(t: T) -> tuple[T, list[T]]:
    xs: list[T] = []
    while isinstance(t, Ap):
        xs.append(t.x)
        t = t.f
    xs.reverse()
    return t, xs


def head_step(t: T) -> T | None:
    h, xs = spine(t)
    if h != S or len(xs) < 3:
        return None
    x, y, z, *rest = xs
    return ap(ap(x, z), ap(y, z), *rest)


def steps(t: T, n: int) -> T:
    for _ in range(n):
        q = head_step(t)
        assert q is not None
        t = q
    return t


def main() -> None:
    b = ap(S, S)
    p = ap(S, b)
    c0 = ap(S, b, b)

    def carrier(index: int) -> T:
        result = c0
        for _ in range(index):
            result = ap(b, result)
        return result

    def contract_at(term: T, path: str) -> T:
        if not path:
            result = head_step(term)
            assert result is not None
            return result
        assert isinstance(term, Ap)
        if path[0] == "L":
            return Ap(contract_at(term.f, path[1:]), term.x)
        assert path[0] == "R"
        return Ap(term.f, contract_at(term.x, path[1:]))

    def contract_many_at(term: T, path: str, count: int) -> T:
        for _ in range(count):
            term = contract_at(term, path)
        return term

    # (C1): the schematic successor law and the exact five-step zero base.
    cn, x, y = V("C_n"), V("X"), V("Y")
    assert steps(ap(b, cn, x, y), 2) == ap(x, y, ap(cn, x, y))
    alpha = ap(ap(x, ap(b, x)), y)
    beta = ap(ap(x, y), alpha)
    base = ap(y, alpha, beta)
    assert steps(ap(c0, x, y), 5) == base

    # (C2): reduce each carrier layer at its exact nested occurrence.
    e, base_argument = V("E"), V("B")
    carrier_depth = 4
    expanded = ap(carrier(carrier_depth), e, base_argument)
    for depth in range(carrier_depth):
        expanded = contract_many_at(expanded, "R" * depth, 2)
    expanded = contract_many_at(expanded, "R" * carrier_depth, 5)
    base_alpha = ap(ap(e, ap(b, e)), base_argument)
    base_beta = ap(ap(e, base_argument), base_alpha)
    expected = ap(base_argument, base_alpha, base_beta)
    for _ in range(carrier_depth):
        expected = ap(e, base_argument, expected)
    assert expanded == expected

    # (C3)--(C4): reserved word constructors and their deletion law.
    v0 = ap(S, c0)
    v1 = ap(S, ap(S, c0))
    live = (ap(b, v0), ap(b, v1))
    omega = S
    bits = (0, 1, 1)
    word = omega
    for bit in bits:
        word = ap(live[bit], word)
    expected_word = ap(live[1], ap(live[1], ap(live[0], omega)))
    assert word == expected_word

    w = V("W")
    for tag, constructor in zip((v0, v1), live, strict=True):
        assert steps(ap(constructor, w), 1) == ap(S, w, ap(tag, w))

    # (C5): the exact two-step push identity, schematic in N, J, and X.
    n, j, value = V("N"), V("J"), V("V")
    push = ap(S, ap(S, n), j)
    assert steps(ap(push, value), 2) == ap(n, ap(j, value), ap(value, ap(j, value)))

    # (C6): appender nesting preserves bit order and one history per cell.
    appender: T = p
    for bit in reversed(bits):
        appender = ap(S, ap(S, appender), live[bit])

    accumulated = value
    histories: list[T] = []
    for bit in bits:
        next_accumulated = ap(live[bit], accumulated)
        histories.insert(0, ap(accumulated, next_accumulated))
        accumulated = next_accumulated

    endpoint = steps(ap(appender, value), 2 * len(bits))
    assert endpoint == ap(p, accumulated, *histories)
    root, arguments = spine(endpoint)
    assert root == S
    assert arguments[:2] == [b, accumulated]
    assert len(arguments) == len(bits) + 2

    print("PASS exact carrier identities (C1)--(C2)")
    print("PASS exact word-cell identities (C3)--(C4)")
    print("PASS exact push and appender identities (C5)--(C6)")


if __name__ == "__main__":
    main()
