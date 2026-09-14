"""Compile and inspect import-only groups for complete ``--fresh`` replay.

This changes the number of checker invocations, never the requested root set.
Only a diagnosed Lean import declaration collision permits splitting a group.
The caller must replay every returned module, and check artifact stability both
before and after replay; preparing a group is not itself a checker result.
"""

from __future__ import annotations

from dataclasses import dataclass
import os
from pathlib import Path
import re
import subprocess

from checker_provenance import sha256_file
from local_workspace import LocalWorkspace, absolute_lake
from replay_scope import MODULE, dependency_closure, project_import_graph


SCHEMA = "PURE_S_GROUPED_FRESH_REPLAY_V2"
ARTIFACT_SUFFIXES = (".lean", ".olean", ".ilean", ".olean.server", ".olean.private", ".ir", ".ir.sig")
METADATA_SOURCE = '''import Lean
unsafe def main (args : List String) : IO Unit := do
  Lean.initSearchPath (← Lean.findSysroot)
  let target := (args.headD "").toName
  let path ← Lean.findOLean target
  let (data, region) ← Lean.readModuleData path
  IO.println s!"OWN_DECLARATIONS {data.constNames.size}"
  for entry in data.imports do
    IO.println s!"DIRECT {entry.module}"
  Lean.withImportModules #[{ module := target }] {} fun env => do
    for name in env.allImportedModuleNames do
      IO.println s!"COVERED {name}"
  region.free
'''
# Exact pinned Lean Environment.lean import-collision diagnostic. Merely seeing
# "already declared" elsewhere must not convert a build failure into a split.
COLLISION = re.compile(
    r"(?:^|: )error: import [A-Za-z_][A-Za-z_0-9.]* failed, "
    r"environment already contains '[^'\r\n]+' from [A-Za-z_][A-Za-z_0-9.]*\s*$"
)


@dataclass(frozen=True)
class ReplayGroup:
    module: str
    roots: tuple[str, ...]
    source_sha256: str
    olean_sha256: str
    direct_compiled_imports: tuple[str, ...]
    actual_imported_modules: tuple[str, ...]
    coverage_log_sha256: str

    def receipt(self) -> dict:
        return {"module": self.module, "roots": list(self.roots),
                "source_sha256": self.source_sha256, "olean_sha256": self.olean_sha256,
                "own_declarations": 0,
                "direct_compiled_imports": list(self.direct_compiled_imports),
                "actual_imported_modules": list(self.actual_imported_modules),
                "coverage_log_sha256": self.coverage_log_sha256}


@dataclass(frozen=True)
class PreparedReplay:
    output: Path
    environment: dict[str, str]
    roots: tuple[str, ...]
    expected_project_closure: tuple[str, ...]
    groups: tuple[ReplayGroup, ...]
    attempts: tuple[dict, ...]
    bindings: tuple[tuple[Path, str], ...]
    absent_project_artifacts: tuple[Path, ...]

    def verify_unchanged(self) -> None:
        for path, digest in self.bindings:
            if path.is_symlink() or not path.is_file() or sha256_file(path) != digest:
                raise ValueError(f"grouped replay artifact changed: {path}")
        for path in self.absent_project_artifacts:
            if path.exists() or path.is_symlink():
                raise ValueError(f"new project artifact shadows a pinned import: {path}")
        expected = {path for path, _ in self.bindings if path.is_relative_to(self.output)
                    and path.name.endswith(ARTIFACT_SUFFIXES)}
        actual = set()
        for path in self.output.rglob("*"):
            if path.is_symlink():
                raise ValueError(f"new link in grouped replay search path: {path}")
            if path.is_file() and path.name.endswith(ARTIFACT_SUFFIXES):
                actual.add(path)
        if actual != expected:
            raise ValueError("grouped replay search path artifact inventory changed")

    def receipt(self) -> dict:
        """Metadata only: success of each actual invocation is caller evidence."""
        self.verify_unchanged()
        return {"schema": SCHEMA, "original_ordered_roots": list(self.roots),
                "expected_project_closure": list(self.expected_project_closure),
                "actual_invocation_modules": [group.module for group in self.groups],
                "actual_invocation_count": len(self.groups),
                "groups": [group.receipt() for group in self.groups],
                "attempts": list(self.attempts),
                "absent_project_artifacts": [str(path) for path in self.absent_project_artifacts],
                "artifact_bindings": [{"path": str(path), "sha256": digest}
                                      for path, digest in self.bindings]}


def collision_only(output: str) -> bool:
    errors = [line for line in output.splitlines() if "error:" in line]
    return bool(errors) and all(COLLISION.search(line) is not None for line in errors)


def parse_metadata(output: str, roots: tuple[str, ...],
                   expected: tuple[str, ...]) -> tuple[tuple[str, ...], tuple[str, ...]]:
    own: list[str] = []
    direct: list[str] = []
    covered: list[str] = []
    for line in output.splitlines():
        if line.startswith("OWN_DECLARATIONS "):
            own.append(line[len("OWN_DECLARATIONS "):])
        elif line.startswith("DIRECT "):
            direct.append(line[len("DIRECT "):])
        elif line.startswith("COVERED "):
            covered.append(line[len("COVERED "):])
        elif line.strip():
            raise ValueError("unexpected grouped replay metadata output: " + line)
    if own != ["0"]:
        raise ValueError("group must have exactly zero own declarations")
    # Lean 4.33 inserts ordinary and meta imports of Init (Lean.Elab.Import).
    if direct != ["Init", "Init", *roots]:
        raise ValueError("compiled group direct imports differ from assigned ordered roots")
    if (not covered or len(covered) != len(set(covered))
            or any(MODULE.fullmatch(name) is None for name in covered)):
        raise ValueError("invalid or duplicate compiled import coverage")
    if not set(expected).issubset(covered):
        raise ValueError("compiled group omits requested roots or their project dependencies")
    return tuple(direct), tuple(sorted(covered))


def prepare_groups(formalization: Path, entries: tuple[str, ...],
                   roots: tuple[str, ...], lake: str, output: Path,
                   workspace: LocalWorkspace, *, timeout: float = 600) -> PreparedReplay:
    """Prepare groups outside a read-only, already-built formalization snapshot.

    Use ``subprocess.run([checker, '--fresh', group.module],
    cwd=result.output, env=result.environment)`` for EVERY group. A timeout,
    missing import, noncollision compilation error, or coverage mismatch fails.
    The supplied installed Lake selects its sibling Lean and complete sysroot;
    inherited Lean import paths and compiler settings are not used.
    """
    if not roots or len(roots) != len(set(roots)):
        raise ValueError("requested grouped replay roots must be nonempty and unique")
    formalization = formalization.resolve(strict=True)
    graph = project_import_graph(formalization, entries)
    expected = dependency_closure(graph, roots)
    output = workspace.output(output)
    if output.exists() or output.resolve().is_relative_to(formalization):
        raise ValueError("grouped replay output must be new and outside the formalization snapshot")
    output.mkdir(parents=True)
    lake_path = Path(absolute_lake(lake))
    lean = lake_path.with_name("lean.exe" if lake_path.suffix == ".exe" else "lean")
    if not lean.is_file() or lean.is_symlink():
        raise ValueError("installed Lake has no regular sibling Lean executable")
    library = formalization / ".lake" / "build" / "lib" / "lean"
    if not library.is_dir():
        raise ValueError("grouped replay requires a completed formalization build")
    environment = workspace.environment()
    for name in ("LEAN_PATH", "LEAN_SRC_PATH", "LEAN_SYSROOT", "LAKE_PACKAGES_DIR",
                 "LEAN_CC", "LEAN_AR", "LEAN_OPTS", "LEAN_ABORT_ON_PANIC"):
        environment.pop(name, None)
    environment.update({"LEAN_SYSROOT": str(lean.parent.parent),
                        "LEAN_PATH": os.pathsep.join((str(output), str(library))),
                        "PATH": str(lean.parent) + os.pathsep + environment.get("PATH", "")})
    metadata = workspace.output(output / "ReadGroupCoverage.lean")
    metadata.write_text(METADATA_SOURCE, encoding="utf-8", newline="\n")
    bindings: dict[Path, str] = {}

    def bind(path: Path) -> str:
        if path.is_symlink() or not path.is_file():
            raise ValueError(f"missing or linked grouped replay artifact: {path}")
        digest = sha256_file(path)
        if path in bindings and bindings[path] != digest:
            raise ValueError(f"grouped replay artifact changed during preparation: {path}")
        bindings[path] = digest
        return digest

    bind(metadata)
    # Bind project artifacts before the first compiler or metadata invocation,
    # including imported .ilean files where supplied by the completed build.
    for name in expected:
        compiled = library.joinpath(*name.split(".")).with_suffix(".olean")
        bind(compiled)
        if compiled.with_suffix(".ilean").exists():
            bind(compiled.with_suffix(".ilean"))
    for name in expected:
        base = library.joinpath(*name.split("."))
        for suffix in (".olean.server", ".olean.private", ".ir", ".ir.sig"):
            part = base.with_suffix(suffix)
            if part.exists(): bind(part)
    groups: list[ReplayGroup] = []
    attempts: list[dict] = []
    absent_project_artifacts: set[Path] = set()

    def run(arguments: list[str], logfile: Path) -> subprocess.CompletedProcess:
        result = subprocess.run(arguments, cwd=output, env=environment,
                                capture_output=True, text=True, encoding="utf-8",
                                errors="strict", timeout=timeout)
        workspace.output(logfile).write_text(result.stdout + result.stderr,
                                             encoding="utf-8", newline="\n")
        bind(logfile)
        return result

    def prepare(members: tuple[str, ...]) -> None:
        module = f"PureSNativeReplayGroup{len(attempts):03d}"
        if module in graph:
            raise ValueError("generated group module collides with project inventory")
        source = workspace.output(output / (module + ".lean"))
        compiled = workspace.output(output / (module + ".olean"))
        source.write_text("".join(f"import {name}\n" for name in members),
                          encoding="utf-8", newline="\n")
        source_digest = bind(source)
        result = run([str(lean), "-o", str(compiled), str(source)],
                     output / (module + ".build.log"))
        attempts.append({"module": module, "roots": list(members),
                         "returncode": result.returncode, "source_sha256": source_digest,
                         "build_log_sha256": bindings[output / (module + ".build.log")]})
        if result.returncode:
            if len(members) <= 1 or not collision_only(result.stdout + result.stderr):
                raise ValueError(f"group compilation failed without a splittable import collision: {module}\n"
                                 + result.stdout + result.stderr)
            middle = len(members) // 2
            prepare(members[:middle])
            prepare(members[middle:])
            return
        compiled_digest = bind(compiled)
        for suffix in (".olean.server", ".olean.private", ".ir", ".ir.sig"):
            part = compiled.with_suffix(suffix)
            if part.exists(): bind(part)
        coverage_log = output / (module + ".coverage.log")
        check = run([str(lean), "--run", str(metadata), module], coverage_log)
        if check.returncode or check.stderr.strip():
            raise ValueError(f"group metadata inspection failed: {module}\n" + check.stdout + check.stderr)
        group_expected = dependency_closure(graph, members)
        direct, covered = parse_metadata(check.stdout, members, group_expected)
        if {name for name in covered if name in graph} != set(group_expected):
            raise ValueError("compiled project imports differ from the source dependency closure")
        for name in covered:
            artifact = library.joinpath(*name.split(".")).with_suffix(".olean")
            if artifact.exists() and name not in graph:
                raise ValueError("compiled group imports uninventoried project module: " + name)
            if name in graph:
                bind(artifact)
                if artifact.with_suffix(".ilean").exists():
                    bind(artifact.with_suffix(".ilean"))
            else:
                absent_project_artifacts.add(artifact)
        groups.append(ReplayGroup(module, members, source_digest, compiled_digest,
                                  direct, covered, bindings[coverage_log]))

    prepare(roots)
    if tuple(root for group in groups for root in group.roots) != roots:
        raise ValueError("group partition lost or reordered a requested root")
    if not set(expected).issubset({name for group in groups for name in group.actual_imported_modules}):
        raise ValueError("group union omits requested project dependencies")
    prepared = PreparedReplay(output, environment, roots, expected, tuple(groups),
                              tuple(attempts), tuple(sorted(bindings.items())),
                              tuple(sorted(absent_project_artifacts)))
    prepared.verify_unchanged()
    return prepared
