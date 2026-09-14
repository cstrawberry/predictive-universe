#!/usr/bin/env python3
"""Keep build temporaries and descendant-process caches inside the project."""

from __future__ import annotations

from contextlib import contextmanager
import os
from pathlib import Path
import shlex
import shutil
import sys
import tempfile
from typing import Iterator, Mapping


PACKAGE_ROOT = Path(__file__).resolve().parents[1]
ROOT_VARIABLE = "PURE_S_CONTAINMENT_ROOT"


def checked_output_path(path: Path, root: Path) -> Path:
    """Reject destinations outside root and symbolic links in their local path."""
    root = Path(os.path.abspath(root))
    path = Path(os.path.abspath(path))
    if not path.is_relative_to(root):
        raise ValueError(f"write destination is outside the project: {path}")
    current = root
    for part in (None, *path.relative_to(root).parts):
        if part is not None:
            current = current / part
        if current.is_symlink():
            raise ValueError(f"write destination traverses a symbolic link: {current}")
    if not path.resolve().is_relative_to(root.resolve(strict=True)):
        raise ValueError(f"write destination resolves outside the project: {path}")
    return path


class LocalWorkspace:
    """One project-owned .work tree, also shared by its private source copies."""

    def __init__(
        self,
        package_root: Path = PACKAGE_ROOT,
        environment: Mapping[str, str] | None = None,
    ) -> None:
        self.package_root = Path(os.path.abspath(package_root))
        inherited = os.environ if environment is None else environment
        configured = inherited.get(ROOT_VARIABLE)
        self.root = Path(configured) if configured else self.package_root
        if not self.root.is_absolute():
            raise ValueError(f"{ROOT_VARIABLE} must be absolute")
        self.root = Path(os.path.abspath(self.root))
        if not (
            self.package_root == self.root
            or self.package_root.is_relative_to(self.root / ".work")
        ):
            raise ValueError("containment root does not own this package or private copy")
        checked_output_path(self.package_root, self.root)
        self.path = checked_output_path(self.root / ".work", self.root)

    def directory(self, relative: str) -> Path:
        local = Path(relative)
        if local.is_absolute() or ".." in local.parts:
            raise ValueError(f"workspace path must be relative: {relative}")
        path = checked_output_path(self.path / local, self.root)
        path.mkdir(parents=True, exist_ok=True)
        return path

    def environment(self, inherited: Mapping[str, str] | None = None) -> dict[str, str]:
        result = dict(os.environ if inherited is None else inherited)
        directories = {
            "TMPDIR": "tmp",
            "TMP": "tmp",
            "TEMP": "tmp",
            "XDG_CACHE_HOME": "cache",
            "XDG_CONFIG_HOME": "config",
            "XDG_DATA_HOME": "data",
            "XDG_STATE_HOME": "state",
            "PIP_CACHE_DIR": "cache/pip",
            "CCACHE_DIR": "cache/ccache",
            "ELAN_HOME": "cache/elan",
            "TEXMFVAR": "cache/texmf-var",
            "TEXMFCONFIG": "config/texmf",
            "TEXMFOUTPUT": "tmp/tex-output",
        }
        for variable, relative in directories.items():
            result[variable] = str(self.directory(relative))
        result[ROOT_VARIABLE] = str(self.root)
        result["PYTHONDONTWRITEBYTECODE"] = "1"
        result["PIP_DISABLE_PIP_VERSION_CHECK"] = "1"
        return result

    def activate(self) -> None:
        os.environ.update(self.environment())
        tempfile.tempdir = str(self.directory("tmp"))
        sys.dont_write_bytecode = True

    def output(self, path: Path) -> Path:
        return checked_output_path(path, self.root)

    @contextmanager
    def temporary_directory(self, *, prefix: str) -> Iterator[str]:
        self.activate()
        with tempfile.TemporaryDirectory(prefix=prefix, dir=self.directory("tmp")) as temporary:
            yield temporary


def temporary_directory(*, prefix: str = "pure-s-", package_root: Path = PACKAGE_ROOT):
    return LocalWorkspace(package_root).temporary_directory(prefix=prefix)


def absolute_lake(command: str) -> str:
    """Resolve an installed Lake executable without invoking an elan proxy."""
    found = command if Path(command).is_absolute() else shutil.which(command)
    if found is None:
        raise ValueError("provide --lake with an installed absolute pinned Lake executable")
    executable = Path(found).resolve(strict=True)
    if not executable.is_file() or not os.access(executable, os.X_OK):
        raise ValueError(f"Lake is not an executable file: {executable}")
    if executable.name in {"elan", "elan.exe"}:
        raise ValueError("an elan proxy is not a pinned Lake executable; supply --lake")
    return str(executable)


def lake_command(command: str) -> list[str]:
    """Accept one executable path, including spaces, or legacy quoted arguments."""
    if Path(command).is_file():
        return [absolute_lake(command)]
    arguments = shlex.split(command)
    if not arguments:
        raise ValueError("provide an installed pinned Lake executable")
    return [absolute_lake(arguments[0]), *arguments[1:]]
