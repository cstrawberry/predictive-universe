#!/usr/bin/env python3
"""Strict occurrence-tree cursor operations for pure-S reduction.

The algebraic ``head_step`` helper used by the schematic verifiers contracts
the first redex on an applicative head spine.  That is useful for identities,
but it is not a cursor primitive: when a term has trailing arguments, the
redex is in a proper left descendant.  This module makes that distinction
explicit.  ``contract_root`` succeeds only when the *current occurrence* is
literally ``(((S X) Y) Z)``.
"""

from __future__ import annotations

from verification_runtime import require_assertions_enabled


require_assertions_enabled()

from dataclasses import dataclass
from typing import Literal

from verify_macros import Ap, S, T


class CursorError(AssertionError):
    """An undefined cursor move or contraction."""


def at(term: T, path: str) -> T:
    """Return the occurrence at an explicit L/R path."""
    current = term
    for direction in path:
        if not isinstance(current, Ap) or direction not in "LR":
            raise CursorError(f"undefined {direction!r} move at {path!r}")
        current = current.f if direction == "L" else current.x
    return current


def replace_at(term: T, path: str, replacement: T) -> T:
    """Replace one occurrence, rebuilding its ancestors iteratively."""
    current = term
    parents: list[tuple[Literal["L", "R"], T]] = []
    for direction in path:
        if not isinstance(current, Ap):
            raise CursorError(f"path {path!r} leaves the occurrence tree")
        if direction == "L":
            parents.append(("L", current.x))
            current = current.f
        elif direction == "R":
            parents.append(("R", current.f))
            current = current.x
        else:
            raise CursorError(f"invalid path symbol {direction!r}")

    current = replacement
    for side, sibling in reversed(parents):
        current = Ap(current, sibling) if side == "L" else Ap(sibling, current)
    return current


def contract_root(term: T) -> T:
    """Contract exactly one redex rooted at the current occurrence.

    In particular, this rejects ``((((S X) Y) Z) R)`` at its root.  Its
    redex is the left child and becomes available only after an ``L`` move.
    """
    if (
        not isinstance(term, Ap)
        or not isinstance(term.f, Ap)
        or not isinstance(term.f.f, Ap)
        or term.f.f.f != S
    ):
        raise CursorError("Rdx requested at a non-redex occurrence")
    x = term.f.f.x
    y = term.f.x
    z = term.x
    return Ap(Ap(x, z), Ap(y, z))


def contract_at(term: T, path: str) -> T:
    """Perform one literal S contraction at exactly ``path``."""
    return replace_at(term, path, contract_root(at(term, path)))


@dataclass(frozen=True, slots=True)
class _Parent:
    side: Literal["L", "R"]
    sibling: T


@dataclass(slots=True)
class OccurrenceCursor:
    """A zipper realization of one current occurrence.

    ``parents`` is representation data for the sole cursor, equivalent to
    parent links in an occurrence tree.  It is never inspected by a rewrite
    rule except for the immediately requested ``U`` move.
    """

    focus: T
    parents: list[_Parent]

    @classmethod
    def at_root(cls, term: T) -> "OccurrenceCursor":
        return cls(term, [])

    @property
    def depth(self) -> int:
        return len(self.parents)

    def move_left(self) -> None:
        if not isinstance(self.focus, Ap):
            raise CursorError("L requested at an S/variable leaf")
        self.parents.append(_Parent("L", self.focus.x))
        self.focus = self.focus.f

    def move_right(self) -> None:
        if not isinstance(self.focus, Ap):
            raise CursorError("R requested at an S/variable leaf")
        self.parents.append(_Parent("R", self.focus.f))
        self.focus = self.focus.x

    def move_up(self) -> None:
        if not self.parents:
            raise CursorError("U requested at the root")
        parent = self.parents.pop()
        self.focus = (
            Ap(self.focus, parent.sibling)
            if parent.side == "L"
            else Ap(parent.sibling, self.focus)
        )

    def contract(self) -> None:
        self.focus = contract_root(self.focus)

    def root_term(self) -> T:
        """Read the whole term without changing the current occurrence."""
        current = self.focus
        for parent in reversed(self.parents):
            current = (
                Ap(current, parent.sibling)
                if parent.side == "L"
                else Ap(parent.sibling, current)
            )
        return current


def run_appender_cursor(cursor: OccurrenceCursor, bit_count: int) -> int:
    """Run the exact linear cursor script for a compiled nonzero appender.

    At the entry, the cursor is on ``F_(q,1) V``.  Two contractions execute
    one ``Push`` layer.  The resulting next layer is the left child, so the
    cursor moves there once rather than returning to the action-field root
    after every contraction.  On exit it is ``bit_count-1`` levels below the
    completed action field (zero levels when ``bit_count`` is one).

    The return value is the number of literal S contractions.
    """
    if bit_count <= 0:
        raise ValueError("the nonzero appender script requires at least one bit")
    for index in range(bit_count):
        cursor.contract()
        cursor.contract()
        if index + 1 < bit_count:
            cursor.move_left()
    return 2 * bit_count
