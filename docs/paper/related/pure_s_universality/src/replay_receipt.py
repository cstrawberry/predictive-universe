#!/usr/bin/env python3
"""Canonical, strictly validated receipts for active checker replays."""

from __future__ import annotations

import json
import re
from typing import Any, Iterable

from toolchain_lock import ToolchainLock


RECEIPT_PREFIX = "ACTIVE_REPLAY_RECEIPT "
RECEIPT_SCHEMA = "PURE_S_ACTIVE_REPLAY_RECEIPT_V1"
INVALID_PROOF_CANARY_PREFIX = "INVALID_PROOF_CANARY_RECEIPT "
INVALID_PROOF_CANARY_SCHEMA = "PURE_S_INVALID_PROOF_CANARY_V1"
HEX64 = re.compile(r"[0-9a-f]{64}")


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def _exact_keys(value: object, expected: set[str], label: str) -> dict[str, Any]:
    _require(isinstance(value, dict), f"{label} must be an object")
    assert isinstance(value, dict)
    actual = set(value)
    _require(
        actual == expected,
        f"{label} fields differ: missing={sorted(expected - actual)} "
        f"extra={sorted(actual - expected)}",
    )
    return value


def _pairs_without_duplicates(pairs: list[tuple[str, object]]) -> dict[str, object]:
    result: dict[str, object] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"active replay receipt has duplicate JSON key {key!r}")
        result[key] = value
    return result


def canonical_receipt_line(receipt: object) -> str:
    """Serialize one receipt without whitespace or platform-dependent ordering."""
    return RECEIPT_PREFIX + json.dumps(
        receipt, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    )


def canonical_invalid_proof_canary_line(receipt: object) -> str:
    """Keep genuine kernel-rejection evidence outside the closed active schema."""
    return INVALID_PROOF_CANARY_PREFIX + json.dumps(
        receipt, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    )


def parse_invalid_proof_canary_receipts(
    transcript: str, *, active_receipt: dict[str, Any]
) -> dict[str, dict[str, Any]]:
    """Bind both unique supplemental canaries to an already validated replay."""
    from checker_canary import CANARY_MODULE, CANARY_SOURCE_SHA256

    checkers = _exact_keys(
        active_receipt.get("checkers"), {"lean4checker", "lean4lean"}, "active checkers"
    )
    lines = [line for line in transcript.splitlines()
             if line.startswith(INVALID_PROOF_CANARY_PREFIX)]
    _require(len(lines) == len(checkers), "log must contain exactly two invalid-proof canary receipts")
    result: dict[str, dict[str, Any]] = {}
    for line in lines:
        try:
            parsed = json.loads(line[len(INVALID_PROOF_CANARY_PREFIX):],
                                object_pairs_hook=_pairs_without_duplicates)
        except json.JSONDecodeError as error:
            raise ValueError(f"invalid-proof canary receipt is not valid JSON: {error}") from None
        _require(line == canonical_invalid_proof_canary_line(parsed),
                 "invalid-proof canary receipt is not canonical JSON")
        record = _exact_keys(parsed, {"schema", "checker", "binary_sha256_before",
                                      "binary_sha256_after", "canary"}, "invalid-proof canary receipt")
        _require(record["schema"] == INVALID_PROOF_CANARY_SCHEMA, "unknown invalid-proof canary schema")
        name = record["checker"]
        _require(isinstance(name, str) and name in checkers, "unknown invalid-proof canary checker")
        _require(name not in result, f"duplicate invalid-proof canary checker {name}")
        for field in ("binary_sha256_before", "binary_sha256_after"):
            _require(_validate_hex64(record[field], f"{name}.{field}") == checkers[name][field],
                     f"{name}: invalid-proof canary binary differs from active replay")
        _require(record["binary_sha256_before"] == record["binary_sha256_after"],
                 f"{name}: invalid-proof canary binary changed")
        canary = _exact_keys(record["canary"], {"kind", "module", "source_sha256", "olean_sha256",
                    "positive_fresh_replay_passed", "kernel_type_mismatch_rejected", "mode", "diagnostic_sha256"},
                    f"{name} invalid-proof canary")
        _require(canary["kind"] == "compiled-ill-typed-declaration"
                 and canary["module"] == CANARY_MODULE and canary["source_sha256"] == CANARY_SOURCE_SHA256,
                 f"{name}: invalid-proof canary identity differs")
        _require(canary["positive_fresh_replay_passed"] is True
                 and canary["kernel_type_mismatch_rejected"] is True,
                 f"{name}: actual invalid-proof canary did not pass")
        _require(canary["mode"] == ("fresh" if name == "lean4checker" else "scoped"),
                 f"{name}: invalid-proof canary used wrong replay mode")
        _validate_hex64(canary["olean_sha256"], f"{name} invalid-proof canary object")
        _validate_hex64(canary["diagnostic_sha256"], f"{name} invalid-proof canary diagnostic")
        result[name] = record
    _require(set(result) == set(checkers), "invalid-proof canary checker coverage differs")
    return result


def _validate_count(value: object, expected: int, label: str) -> None:
    _require(type(value) is int, f"{label} must be an integer")
    _require(value == expected, f"{label} must equal {expected}, got {value!r}")


def _validate_hex64(value: object, label: str) -> str:
    _require(isinstance(value, str), f"{label} must be a string")
    assert isinstance(value, str)
    _require(HEX64.fullmatch(value) is not None, f"{label} must be 64 lowercase hex digits")
    _require(value != "0" * 64, f"{label} may not be the all-zero digest")
    return value


def _validate_checker(
    checker: object,
    *,
    lock: ToolchainLock,
    name: str,
    ordered_roots: tuple[str, ...],
) -> dict[str, Any]:
    fields = {
        "commit",
        "tree",
        "source_sha256",
        "build_recipe_sha256",
        "binary_sha256_before",
        "binary_sha256_after",
        "negative_canary_rejected",
        "ordered_roots",
        "passed",
        "total",
    }
    if name == "lean4lean":
        fields.add("dependency")
    record = _exact_keys(checker, fields, name)
    for field, lock_suffix in (
        ("commit", "commit"),
        ("tree", "tree"),
        ("source_sha256", "source-sha256"),
        ("build_recipe_sha256", "build-recipe-sha256"),
        ("binary_sha256_before", "binary-sha256"),
        ("binary_sha256_after", "binary-sha256"),
    ):
        expected = lock[f"{name}-{lock_suffix}"]
        _require(
            record[field] == expected,
            f"{name}.{field} differs from TOOLCHAIN.lock",
        )
    _require(
        record["binary_sha256_before"] == record["binary_sha256_after"],
        f"{name} binary changed during replay",
    )
    _require(
        record["negative_canary_rejected"] is True,
        f"{name} negative canary was not rejected",
    )
    _require(
        isinstance(record["ordered_roots"], list)
        and tuple(record["ordered_roots"]) == ordered_roots,
        f"{name} ordered replay set differs from the locked verification scope",
    )
    _validate_count(record["passed"], len(ordered_roots), f"{name}.passed")
    _validate_count(record["total"], len(ordered_roots), f"{name}.total")
    if name == "lean4lean":
        dependency = _exact_keys(
            record["dependency"],
            {"commit", "tree", "source_sha256"},
            "lean4lean.dependency",
        )
        for field, suffix in (
            ("commit", "commit"),
            ("tree", "tree"),
            ("source_sha256", "source-sha256"),
        ):
            _require(
                dependency[field] == lock[f"lean4lean-batteries-{suffix}"],
                f"lean4lean.dependency.{field} differs from TOOLCHAIN.lock",
            )
    return record


def parse_active_replay_receipt(
    transcript: str,
    *,
    lock: ToolchainLock,
    source_sha256: str,
    lean4checker_roots: Iterable[str],
    lean4lean_modules: Iterable[str],
) -> dict[str, Any]:
    """Read and validate the unique canonical active-replay receipt in a log."""
    lines = [
        line
        for line in transcript.splitlines()
        if line.startswith(RECEIPT_PREFIX)
    ]
    _require(len(lines) == 1, "log must contain exactly one active replay receipt")
    payload = lines[0][len(RECEIPT_PREFIX):]
    try:
        receipt = json.loads(payload, object_pairs_hook=_pairs_without_duplicates)
    except json.JSONDecodeError as error:
        raise ValueError(f"active replay receipt is not valid JSON: {error}") from None
    _require(
        lines[0] == canonical_receipt_line(receipt),
        "active replay receipt is not canonical JSON",
    )
    record = _exact_keys(
        receipt,
        {
            "schema",
            "result",
            "toolchain_lock_sha256",
            "environment_fingerprint_sha256",
            "formal_source_tree_sha256",
            "checkers",
        },
        "active replay receipt",
    )
    _require(record["schema"] == RECEIPT_SCHEMA, "unknown active replay receipt schema")
    _require(record["result"] == "success", "active replay receipt is not successful")
    _require(
        _validate_hex64(record["toolchain_lock_sha256"], "toolchain_lock_sha256")
        == lock.sha256,
        "active replay receipt is not bound to TOOLCHAIN.lock",
    )
    _validate_hex64(
        record["environment_fingerprint_sha256"],
        "environment_fingerprint_sha256",
    )
    _require(
        _validate_hex64(
            record["formal_source_tree_sha256"], "formal_source_tree_sha256"
        )
        == source_sha256,
        "active replay receipt is not bound to the formal source tree",
    )
    marker_expectations = {
        "TOOLCHAIN_LOCK_SHA256": str(record["toolchain_lock_sha256"]),
        "ENVIRONMENT_FINGERPRINT_SHA256": str(
            record["environment_fingerprint_sha256"]
        ),
        "FORMAL_SOURCE_TREE_SHA256": str(record["formal_source_tree_sha256"]),
    }
    for marker, expected in marker_expectations.items():
        observed = set(
            re.findall(rf"^{marker} ([0-9a-f]{{64}})$", transcript, re.MULTILINE)
        )
        _require(
            observed == {expected},
            f"{marker} markers differ from the active replay receipt",
        )
    checkers = _exact_keys(
        record["checkers"], {"lean4checker", "lean4lean"}, "checkers"
    )
    _validate_checker(
        checkers["lean4checker"],
        lock=lock,
        name="lean4checker",
        ordered_roots=tuple(lean4checker_roots),
    )
    _validate_checker(
        checkers["lean4lean"],
        lock=lock,
        name="lean4lean",
        ordered_roots=tuple(lean4lean_modules),
    )
    return record
