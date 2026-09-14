"""Check declaration links and actual PDF heading destinations."""
from pathlib import Path
import re

CONTRACT_LINKS = {
    'Finite selector': 'selectorContract', 'normal-form criterion': 'none_iff_normal',
    'exact CTS trajectories': 'finiteCTSUniversality', 'Period': 'programPeriod',
    'finite control cover': 'controllerCoverComplete', 'root initialization': 'freshRootInitialization',
    'no carried state': 'noInterInvocationState', 'selector projection': 'selectorProjection',
    'one-contraction return': 'successfulInvocation', 'normal-term return': 'normalInvocation',
    'Seed form': 'paddedEncoderShape', 'source rows': 'literalRows',
    'terminal rows': 'terminalRows', 'returned bit': 'returnedOutput',
    'Complete encoder': 'completeEncoder', 'primitive recursion': 'encoderPrimitiveRecursive',
    'decoder': 'decoderOperations', 'detector': 'detectorOperations',
    'seed reader': 'seedReadbackOperations', 'output-reader costs': 'completeOutputOperations',
}


def check_lean_line_links(source: str, source_directory: Path) -> int:
    links = re.findall(r"\[([^\]]+)\]\(([^)]+\.lean)#L(\d+)\)", source)
    for label, relative, number in links:
        name = label[1:-1] if label.startswith('`') and label.endswith('`') else CONTRACT_LINKS.get(label)
        if name is None:
            raise ValueError(f"Lean line link has no declared target: {label}")
        path = (source_directory / relative).resolve()
        lines = path.read_text(encoding="utf-8").splitlines()
        line = int(number)
        if not 1 <= line <= len(lines):
            raise ValueError(f"invalid Lean line link: {relative}#L{line}")
        declaration = re.search(
            r"(?:\b(?:theorem|lemma|def|abbrev|structure|inductive|class)\s+|^\s*)([^\s(:{]+)\s*(?=[:({]|$)",
            lines[line - 1],
        )
        if declaration is None or declaration[1].split(".")[-1] != name.split(".")[-1]:
            raise ValueError(f"Lean line link misses {name}: {relative}#L{line}")
    return len(links)


def check_heading_destinations(reader, source: str) -> list[dict]:
    """Compare every explicit heading target with its independent PDF bookmark.

    The two unnumbered outline entries, Abstract and References, have automatic
    destinations. Every intervening heading has an explicit manuscript ID.
    Exact ordered inventories prevent silently ignoring new or missing headings.
    """
    identifiers = re.findall(r"(?m)^#+ .*?\{#([\w-]+)[^}]*\}", source)

    def flatten(items):
        return [entry for item in items for entry in
                (flatten(item) if isinstance(item, list) else [item])]

    outline = flatten(reader.outline)
    if (not outline or outline[0].title != "Abstract"
            or outline[-1].title != "References"
            or len(outline) != len(identifiers) + 2
            or len(set(identifiers)) != len(identifiers)):
        raise ValueError("PDF heading/bookmark inventory differs")
    destinations = reader.named_destinations
    checked = []
    for identifier, bookmark in zip(identifiers, outline[1:-1], strict=True):
        if identifier not in destinations:
            raise ValueError(f"PDF heading destination missing: {identifier}")
        target = destinations[identifier]
        page = reader.get_destination_page_number(target)
        heading_page = reader.get_destination_page_number(bookmark)
        if page != heading_page:
            raise ValueError(f"PDF heading destination {identifier} lands on page "
                             f"{page + 1}, heading is on page {heading_page + 1}")
        # Both coordinates must locate the heading, not just any point on its page.
        if target.top is None or bookmark.top is None or not -20 <= float(bookmark.top) - float(target.top) <= 7:
            raise ValueError(f"PDF heading destination displaced from heading: {identifier}")
        checked.append({"id": identifier, "heading": str(bookmark.title),
                        "page": page + 1, "target_top": float(target.top),
                        "bookmark_top": float(bookmark.top)})
    return checked
