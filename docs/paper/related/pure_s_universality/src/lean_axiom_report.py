"""Join only Lean's wrapped axiom lists; never hide unrelated output."""
import re

START = re.compile(r"^'[^']+' depends on axioms: \[[^\]]*$")
CONTINUATION = re.compile(r"[A-Za-z_][A-Za-z_0-9.']*(?:\s*,\s*[A-Za-z_][A-Za-z_0-9.']*)*\s*(?:,|\])")

def axiom_report_lines(output: str):
    pending = None
    for raw in output.splitlines():
        line = raw.strip()
        if pending is not None:
            if not raw[:1].isspace() or not CONTINUATION.fullmatch(line):
                raise ValueError(f"invalid axiom-list continuation: {raw!r}")
            pending += ' ' + line
            if line.endswith(']'):
                yield pending
                pending = None
        elif START.fullmatch(line):
            pending = line
        else:
            yield raw
    if pending is not None:
        raise ValueError("truncated axiom list: " + pending)
