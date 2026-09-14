#!/usr/bin/env python3
"""Exact replay for the focused cyclic-tag construction primitives.

The verifier checks open-term identities.  It also contracts selected
subterms under explicit binary-tree paths, so a successful check never
silently substitutes a useful descendant for its parent.
"""

from __future__ import annotations

from strict_occurrence import contract_at
from verification_runtime import require_assertions_enabled
from verify_macros import Ap, S, T, V, ap, spine, steps


require_assertions_enabled()


def at(t: T, path: str) -> T:
    for direction in path:
        assert isinstance(t, Ap)
        t = t.f if direction == "L" else t.x
    return t


def step_at(t: T, path: str) -> T:
    """Contract the first head redex under a declared focus subtree.

    ``path`` identifies the whole focused head spine used by the schematic
    macro.  The literal redex occurrence is computed explicitly: every
    trailing argument contributes one ``L`` move.  ``contract_at`` then
    requires the cursor itself to be exactly ``(((S X)Y)Z)``.
    """
    root, arguments = spine(at(t, path))
    assert root == S and len(arguments) >= 3
    redex_path = path + "L" * (len(arguments) - 3)
    return contract_at(t, redex_path)


def steps_at(t: T, path: str, count: int) -> T:
    for _ in range(count):
        t = step_at(t, path)
    return t


def carrier(n: int) -> T:
    b = ap(S, S)
    out = ap(S, b, b)
    for _ in range(n):
        out = ap(b, out)
    return out


def push(c: T, r: T) -> T:
    return ap(S, ap(S, r), c)


def spine_arg_path(t: T, index: int) -> str:
    _, args = spine(t)
    assert 0 <= index < len(args)
    return "L" * (len(args) - 1 - index) + "R"


def main() -> None:
    b = ap(S, S)
    p = ap(S, b)
    W, B = V("W"), V("B")
    c0_carrier = carrier(0)
    # Reserved normal-form tags.  Unlike S and b, these do not collide with
    # the carrier family or with short control prefixes on the data path.
    v0, v1 = ap(S, c0_carrier), ap(S, ap(S, c0_carrier))

    # Live cells contract in place and retain a canonical raw predecessor.
    for v in (v0, v1):
        live = ap(b, v)
        assert steps(ap(live, W), 1) == ap(S, W, ap(v, W))

    # A common empty-production emitter creates the same p-headed marker as
    # a nonempty Push chain.
    empty_emit = ap(S, p, S)
    assert steps(ap(empty_emit, W), 1) == ap(p, W, ap(S, W))

    # Fixed constructors append outside the whole retained predecessor.
    C0, C1 = ap(b, v0), ap(b, v1)
    R = V("R")
    for c in (C0, C1):
        assert steps(ap(push(c, R), W), 2) == ap(
            R, ap(c, W), ap(W, ap(c, W))
        )

    # One concrete two-bit block checks constructor order and the common
    # marker interface.  Logical front is innermost.
    block = push(C0, push(C1, empty_emit))
    w1 = ap(C0, W)
    w2 = ap(C1, w1)
    block_endpoint = steps(ap(block, W), 5)
    root, args = spine(block_endpoint)
    assert root == S and args[0] == b and args[1] == w2

    # A split node copies the complete current state into both branches.
    L, Rleaf = V("L"), V("Rleaf")
    split = ap(S, L, Rleaf)
    assert steps(ap(split, W), 1) == ap(ap(L, W), ap(Rleaf, W))

    # The dispatcher frame retains the literal whole V in D V and B V.
    D, State = V("D"), V("State")
    E = ap(S, D)
    assert steps(ap(E, B, State), 1) == ap(
        ap(D, State), ap(B, State)
    )

    # Selected contextual work changes only its actual subtree.  The B V
    # sibling remains syntactically present at the outer right edge.
    table = ap(S, empty_emit, block)
    whole = steps(ap(ap(S, table), B, State), 1)
    # D V is the left child and B V is the right child.
    assert at(whole, "R") == ap(B, State)
    whole = step_at(whole, "L")  # split table on State
    assert at(whole, "R") == ap(B, State)
    # Select the right leaf and execute its fixed five-step block.
    whole = steps_at(whole, "LR", 5)
    assert at(whole, "R") == ap(B, State)
    selected_root, selected_args = spine(at(whole, "LR"))
    assert selected_root == S and selected_args[0] == b
    assert selected_args[1] == ap(C1, ap(C0, State))

    # Generalized Zachos right-fold and finite base callback.
    Cprev = V("Cprev")
    Csucc = ap(b, Cprev)
    assert steps(ap(Csucc, E, B), 2) == ap(E, B, ap(Cprev, E, B))

    c0 = carrier(0)
    base_baggage = ap(E, ap(b, E), B)
    assert steps(ap(c0, E, B), 5) == ap(
        B, base_baggage, ap(ap(E, B), base_baggage)
    )

    # Two frames are literal parents of the finite base result.  Reducing an
    # inner local response under the outer frame never replaces the edge.
    base = steps(ap(c0, E, B), 5)
    nested = ap(E, B, ap(E, B, base))
    inner_path = "R"
    nested_after_inner_frame = step_at(nested, inner_path)
    assert at(nested_after_inner_frame, "R") == ap(
        ap(D, base), ap(B, base)
    )
    # The untouched outer parent still receives the entire inner response.
    outer_after = step_at(nested_after_inner_frame, "")
    assert outer_after == ap(
        ap(D, at(nested_after_inner_frame, "R")),
        ap(B, at(nested_after_inner_frame, "R")),
    )

    # Carrier growth and wrapper saturation used by the unbounded scheduler.
    Ck = V("Ck")
    assert steps(ap(c0, Ck), 1) == ap(ap(b, Ck), ap(b, Ck))
    Cm = V("Cm")
    wrapper = ap(S, Ck, Cm)
    assert steps(ap(wrapper, E), 1) == ap(Ck, E, ap(Cm, E))

    # A concrete pointed-term replay checks the semantic path invariant for
    # several complete cyclic-tag steps.  Omega is inert here only to make
    # the chosen residual mechanically visible; all surrounding identities
    # remain uniform and specialize to a reserved closed normal S-term.
    Omega = V("Omega")

    def word(bits: tuple[int, ...]) -> tuple[T, str]:
        out: T = Omega
        bottom = ""
        for bit in bits:
            out = ap(C0 if bit == 0 else C1, out)
            bottom = "R" + bottom
        return out, bottom

    def path_bits(term: T, bottom: str) -> tuple[int, ...]:
        found: list[int] = []
        for length in range(len(bottom) - 1, -1, -1):
            node = at(term, bottom[:length])
            if (
                isinstance(node, Ap)
                and isinstance(node.f, Ap)
                and node.f.f == b
                and node.f.x in (v0, v1)
            ):
                found.append(0 if node.f.x == v0 else 1)
        return tuple(found)

    def delete_front(term: T, bottom: str) -> tuple[T, str, int] | None:
        for length in range(len(bottom) - 1, -1, -1):
            prefix = bottom[:length]
            node = at(term, prefix)
            if not (
                isinstance(node, Ap)
                and isinstance(node.f, Ap)
                and node.f.f == b
                and node.f.x in (v0, v1)
            ):
                continue
            assert bottom[length] == "R"
            suffix = bottom[length + 1 :]
            bit = 0 if node.f.x == v0 else 1
            term = step_at(term, prefix)
            # In S W (v_i W), the canonical old W is at LR.
            return term, prefix + "LR" + suffix, bit
        return None

    def split_tree(leaves: list[T]) -> tuple[T, list[str]]:
        assert leaves
        if len(leaves) == 1:
            return leaves[0], [""]
        cut = len(leaves) // 2
        left_tree, left_routes = split_tree(leaves[:cut])
        right_tree, right_routes = split_tree(leaves[cut:])
        return (
            ap(S, left_tree, right_tree),
            ["L" + route for route in left_routes]
            + ["R" + route for route in right_routes],
        )

    def block_leaf(bits: tuple[int, ...]) -> tuple[T, int]:
        out: T = empty_emit
        # The first appendant bit must become the innermost new live cell.
        for bit in reversed(bits):
            out = push(C0 if bit == 0 else C1, out)
        return out, 2 * len(bits) + 1

    appendants = ((1, 1), (1, 0))
    leaves: list[T] = []
    costs: list[int] = []
    emitted: list[tuple[int, ...]] = []
    for appendant in appendants:
        leaves.append(empty_emit)
        costs.append(1)
        emitted.append(())
        leaf, cost = block_leaf(appendant)
        leaves.append(leaf)
        costs.append(cost)
        emitted.append(appendant)
    action_tree, routes = split_tree(leaves)
    local_e = ap(S, action_tree)

    def focused_local(
        state: T, bottom: str, phase: int
    ) -> tuple[T, str, int]:
        deleted = delete_front(state, bottom)
        assert deleted is not None
        state_minus, bottom_minus, bit = deleted
        whole = ap(local_e, B, state_minus)
        whole = step_at(whole, "")
        # action_tree state_minus is the left child; B state_minus stays right.
        assert at(whole, "R") == ap(B, state_minus)
        selected = 2 * phase + bit
        focus = "L"
        suffix = bottom_minus
        for direction in routes[selected]:
            # Current focus is Split(L,R) state_minus.
            assert at(whole, focus + "R") == state_minus
            whole = step_at(whole, focus)
            if direction == "L":
                focus += "L"
                suffix = "LR" + suffix
            else:
                focus += "R"
                suffix = "RR" + suffix
        assert at(whole, focus + "R") == state_minus
        whole = steps_at(whole, focus, costs[selected])
        endpoint = at(whole, focus)
        endpoint_root, endpoint_args = spine(endpoint)
        assert endpoint_root == S and endpoint_args[0] == b
        block_bits = emitted[selected]
        expected_state: T = state_minus
        for new_bit in block_bits:
            expected_state = ap(C0 if new_bit == 0 else C1, expected_state)
        assert endpoint_args[1] == expected_state
        state_path = spine_arg_path(endpoint, 1)
        new_bottom = focus + state_path + "R" * len(block_bits) + bottom_minus
        assert at(whole, new_bottom) == Omega
        return whole, new_bottom, bit

    logical = (1, 0, 1)
    concrete, concrete_bottom = word(logical)
    assert path_bits(concrete, concrete_bottom) == logical
    phase = 0
    for _ in range(6):
        concrete, concrete_bottom, front = focused_local(
            concrete, concrete_bottom, phase
        )
        if front:
            logical = logical[1:] + appendants[phase]
        else:
            logical = logical[1:]
        phase = (phase + 1) % len(appendants)
        assert path_bits(concrete, concrete_bottom) == logical

    print("PASS focused CTS local symbolic identities")
    print("PASS explicit contextual whole-parent preservation")
    print("PASS right-fold frames, base callback, and clock wrapper")
    print("PASS six exact pointed cyclic-tag transitions")


if __name__ == "__main__":
    main()
