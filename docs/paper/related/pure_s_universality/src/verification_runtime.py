#!/usr/bin/env python3
"""Runtime preconditions shared by executable proof checks."""

from __future__ import annotations

import os


def require_assertions_enabled() -> None:
    """Reject execution modes that erase proof-critical assertions."""
    if not __debug__ or os.environ.get("PYTHONOPTIMIZE"):
        raise SystemExit(
            "FAIL verification requires assertions enabled; "
            "remove -O and unset PYTHONOPTIMIZE"
        )
