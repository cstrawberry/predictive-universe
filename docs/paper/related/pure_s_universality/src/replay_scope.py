"""Require supplemental replay coverage of every public project dependency."""

from __future__ import annotations

from pathlib import Path, PurePosixPath
import re

MODULE = re.compile(r"[A-Za-z_][A-Za-z_0-9]*(?:\.[A-Za-z_][A-Za-z_0-9]*)*\Z")


def header_imports(source: str) -> tuple[str, ...]:
    """Read ordinary Lean import headers, rejecting unsupported header syntax.

    Only the header is scanned: strings or quotations in declarations cannot
    create dependencies. Nested block comments and line comments are ignored.
    """
    index = 0
    imports: list[str] = []
    while index < len(source):
        if source[index].isspace():
            index += 1
            continue
        if source.startswith("--", index):
            end = source.find("\n", index)
            index = len(source) if end < 0 else end + 1
            continue
        if source.startswith("/-", index):
            index += 2
            depth = 1
            while depth and index < len(source):
                if source.startswith("/-", index):
                    depth += 1
                    index += 2
                elif source.startswith("-/", index):
                    depth -= 1
                    index += 2
                else:
                    index += 1
            if depth:
                raise ValueError("unterminated comment in Lean import header")
            continue
        match = re.match(r"\w+", source[index:])
        if match is None or match.group() not in {"import", "prelude"}:
            break
        keyword = match.group()
        index += len(keyword)
        end = source.find("\n", index)
        end = len(source) if end < 0 else end
        tail = source[index:end].split("--", 1)[0].strip()
        if keyword == "prelude":
            if tail:
                raise ValueError("unsupported prelude header")
        else:
            names = tail.split()
            if not names or any(MODULE.fullmatch(name) is None for name in names):
                raise ValueError("unsupported Lean import header: " + tail)
            imports.extend(names)
        index = end
    return tuple(imports)


def project_import_graph(formalization: Path, entries: tuple[str, ...]) -> dict[str, tuple[str, ...]]:
    paths: dict[str, Path] = {}
    for entry in entries:
        if not entry.endswith(".lean"):
            continue
        relative = PurePosixPath(entry)
        if relative.is_absolute() or ".." in relative.parts or "\\" in entry:
            raise ValueError("invalid inventoried Lean path: " + entry)
        module = entry[:-5].replace("/", ".")
        if MODULE.fullmatch(module) is None or module in paths:
            raise ValueError("invalid or duplicate inventoried Lean module: " + module)
        paths[module] = formalization / entry
    graph: dict[str, tuple[str, ...]] = {}
    for module, path in paths.items():
        imports = header_imports(path.read_text(encoding="utf-8"))
        missing = [name for name in imports
                   if (name == "PureSFormal" or name.startswith("PureSFormal."))
                   and name not in paths]
        if missing:
            raise ValueError(f"{module} imports unlisted project modules: {missing}")
        graph[module] = tuple(name for name in imports if name in paths)
    return graph


def dependency_closure(graph: dict[str, tuple[str, ...]], roots: tuple[str, ...]) -> tuple[str, ...]:
    complete: set[str] = set()
    active: set[str] = set()

    def visit(module: str) -> None:
        if module in active:
            raise ValueError("cyclic Lean project imports at " + module)
        if module in complete:
            return
        if module not in graph:
            raise ValueError("replay root is absent from inventory: " + module)
        active.add(module)
        for dependency in graph[module]:
            visit(dependency)
        active.remove(module)
        complete.add(module)

    for root in roots:
        visit(root)
    return tuple(sorted(complete))


def complete_public_replay_scope(
    formalization: Path,
    entries: tuple[str, ...],
    fresh_roots: tuple[str, ...],
    scoped_modules: tuple[str, ...],
) -> tuple[tuple[str, ...], tuple[str, ...]]:
    """Retain named roots; extend scoped rechecks to every public dependency.

    lean4checker --fresh checks each named root's transitive imports.
    lean4lean's scoped mode checks declarations defined in a named module,
    so naming only Public or the aggregate would omit its dependencies.
    """
    graph = project_import_graph(formalization, entries)
    public = set(dependency_closure(graph, ("PureSFormal.Public",)))
    coverage = set(dependency_closure(graph, fresh_roots))
    missing = public - coverage
    if missing:
        raise ValueError("fresh replay roots omit public dependencies: " + repr(sorted(missing)))
    dependency_closure(graph, scoped_modules)  # Reject absent legacy roots too.
    return fresh_roots, tuple(sorted(public | set(scoped_modules)))
