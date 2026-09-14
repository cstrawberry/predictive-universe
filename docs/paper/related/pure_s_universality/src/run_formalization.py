#!/usr/bin/env python3
"""Build and audit the allowlisted Lean project in temporary storage."""

from __future__ import annotations

import argparse
import datetime
import hashlib
import json
import platform
import shlex
import shutil
import subprocess
import sys
from pathlib import Path

sys.dont_write_bytecode = True
from check_package import (
    FORMALIZATION_INVENTORY,
    FORMALIZATION_ROOT,
    LEAN4CHECKER_FRESH_ROOTS,
    LEAN4LEAN_SCOPED_MODULES,
    check_formalization_inventory,
    formalization_source_tree_digest,
)
from checker_provenance import (
    BuiltChecker,
    build_locked_checker,
    require_negative_canary,
)
from check_environment import fingerprint
from replay_receipt import (
    RECEIPT_SCHEMA, INVALID_PROOF_CANARY_SCHEMA, canonical_receipt_line,
    canonical_invalid_proof_canary_line,
)
from toolchain_lock import LockError, parse_lock, verify_git_source
from local_workspace import LocalWorkspace, absolute_lake
import windows_verification
import checker_canary
import grouped_replay


PACKAGE_ROOT = Path(__file__).resolve().parents[1]
VERIFICATION_BUILD_BATCH_SIZE = 50
VERIFICATION_BUILD_COMMAND_UTF16_LIMIT = 30_000


def verification_build_commands(lake: str, roots: tuple[str, ...]) -> tuple[list[str], ...]:
    """Keep the exact ordered targets within Windows' serialized argv budget.

    Match the inventory builder's 50-target batches, with an additional bound
    on UTF-16 units including quoting and the terminating NUL. Prepare all
    commands before execution so a single oversized target fails immediately.
    """
    prefix = [lake, "build"]

    def units(command: list[str]) -> int:
        return len(subprocess.list2cmdline(command).encode("utf-16-le")) // 2 + 1

    commands: list[list[str]] = []
    pending: list[str] = []
    for index, root in enumerate(roots):
        if units([*prefix, root]) > VERIFICATION_BUILD_COMMAND_UTF16_LIMIT:
            raise LockError(f"verification build target {index} exceeds the Windows command-line budget")
        candidate = [*prefix, *pending, root]
        if (len(pending) == VERIFICATION_BUILD_BATCH_SIZE
                or units(candidate) > VERIFICATION_BUILD_COMMAND_UTF16_LIMIT):
            commands.append([*prefix, *pending])
            pending = []
        pending.append(root)
    if pending:
        commands.append([*prefix, *pending])
    return tuple(commands)


def copy_formalization(destination: Path) -> None:
    """Copy the formal tree and its toolchain and workspace support inputs."""
    destination = LocalWorkspace(PACKAGE_ROOT).output(destination)
    entries = check_formalization_inventory()
    destination.mkdir()
    for entry in (*entries, FORMALIZATION_INVENTORY.name):
        source = FORMALIZATION_ROOT / entry
        target = destination / entry
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target, follow_symlinks=False)
    ancillary_inputs = (
        (PACKAGE_ROOT / "TOOLCHAIN.lock", destination.parent / "TOOLCHAIN.lock"),
        (
            PACKAGE_ROOT / "src" / "toolchain_lock.py",
            destination.parent / "src" / "toolchain_lock.py",
        ),
        (
            PACKAGE_ROOT / "src" / "local_workspace.py",
            destination.parent / "src" / "local_workspace.py",
        ),
    )
    for source, target in ancillary_inputs:
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target, follow_symlinks=False)


def copied_formalization_digest(
    root: Path, entries: tuple[str, ...]
) -> str:
    digest = hashlib.sha256()
    digest.update(b"formalization-source-tree-v1\0")
    digest.update((root / FORMALIZATION_INVENTORY.name).read_bytes())
    digest.update(b"\0")
    for entry in entries:
        if entry in {"BUILD_LOG.txt", "KERNEL_REPLAY_LOG.txt", "LEAN4LEAN_REPLAY_LOG.txt"}:
            continue
        digest.update(entry.encode("utf-8"))
        digest.update(b"\0")
        digest.update((root / entry).read_bytes())
        digest.update(b"\0")
    return digest.hexdigest()


def compiled_input_snapshot(root: Path) -> dict[str, str]:
    """Bind the complete built project library across both checker passes."""
    library = root / ".lake/build/lib/lean"
    if not library.is_dir():
        raise LockError("compiled project library is missing before replay")
    result: dict[str, str] = {}
    for path in library.rglob("*"):
        if path.is_symlink() or getattr(path, "is_junction", lambda: False)():
            raise LockError(f"compiled project library contains a link: {path}")
        if path.is_file() and path.suffix in {".olean", ".ilean"}:
            result[str(path)] = hashlib.sha256(path.read_bytes()).hexdigest()
    if not result:
        raise LockError("compiled project library is empty before replay")
    return result


def stream_command(
    command: list[str],
    *,
    cwd: Path,
    transcript: list[str],
    normalized_root: Path,
    environment: dict[str, str] | None = None,
) -> int:
    """Run one command, stream its output, and normalize the temporary path."""
    process = subprocess.Popen(
        command,
        cwd=cwd,
        env=environment,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1,
    )
    assert process.stdout is not None
    for line in process.stdout:
        print(line, end="", flush=True)
        transcript.append(line.replace(str(normalized_root), "<cache-free-copy>"))
    return process.wait()


def runtime_record() -> tuple[str, str, str]:
    """Return a UTC timestamp, normalized invocation, and host description."""
    timestamp = datetime.datetime.now(datetime.timezone.utc).isoformat(
        timespec="seconds"
    )
    invocation = [sys.executable]
    if sys.flags.dont_write_bytecode:
        invocation.append("-B")
    normalized: list[str] = []
    redact_next = False
    path_options = {
        "--lean4checker-source",
        "--invalid-proof-canary-source",
        "--lean4lean-source",
        "--batteries-source",
        "--write-build-log",
        "--write-kernel-replay-log",
        "--write-alternate-kernel-replay-log",
    }
    for argument in sys.argv[1:]:
        if redact_next:
            normalized.append("<locked-path>")
            redact_next = False
        else:
            normalized.append(argument)
            redact_next = argument in path_options
    invocation.extend([f"src/{Path(__file__).name}", *normalized])
    command = shlex.join(invocation)
    container = "container" if Path("/.dockerenv").exists() else "native/non-container"
    host = (
        f"Python {platform.python_version()}; platform {platform.platform()}; "
        f"machine {platform.machine()}; execution context {container}"
    )
    return timestamp, command, host


def main() -> int:
    if (PACKAGE_ROOT / "TOOLCHAIN.lock").read_text().startswith("verification-profile: "):
        from run_current_verification import main as current_main
        current_main()
        return 0
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--lake", default="lake")
    parser.add_argument("--python", default=f"{sys.executable} -B")
    parser.add_argument("--windows-profile", type=Path,
                        help="explicit strict native Windows profile; default remains locked Linux")
    parser.add_argument("--canonical-environment", action="store_true",
                        help="require the canonical Linux environment even without writing evidence logs")
    parser.add_argument(
        "--write-build-log",
        type=Path,
        help="atomically write a normalized transcript after a successful audit",
    )
    parser.add_argument(
        "--lean4checker-source",
        type=Path,
        help="pristine checkout of the locked lean4checker source object",
    )
    parser.add_argument(
        "--invalid-proof-canary-source",
        type=Path,
        help="locked lean4checker source for AddFalse; defaults to --lean4checker-source without requesting that checker",
    )
    parser.add_argument(
        "--write-kernel-replay-log",
        type=Path,
        help="atomically record a successful lean4checker replay",
    )
    parser.add_argument(
        "--lean4lean-source",
        type=Path,
        help="pristine checkout of the locked lean4lean source object",
    )
    parser.add_argument(
        "--batteries-source",
        type=Path,
        help="pristine checkout of lean4lean's locked Batteries source object",
    )
    parser.add_argument(
        "--write-alternate-kernel-replay-log",
        type=Path,
        help="atomically record a successful scoped lean4lean replay",
    )
    args = parser.parse_args()
    if args.canonical_environment and args.windows_profile is not None:
        parser.error("--canonical-environment cannot be combined with --windows-profile")
    canary_source = args.invalid_proof_canary_source or args.lean4checker_source
    if (args.lean4checker_source is not None or args.lean4lean_source is not None) and canary_source is None:
        parser.error("checker replay requires --invalid-proof-canary-source or --lean4checker-source")
    workspace = LocalWorkspace(PACKAGE_ROOT)
    args.lake = absolute_lake(args.lake)
    for option in (
        args.write_build_log,
        args.write_kernel_replay_log,
        args.write_alternate_kernel_replay_log,
    ):
        if option is not None:
            workspace.output(option)
            workspace.output(option.with_name(option.name + ".tmp"))

    formalization_entries = check_formalization_inventory()
    source_tree_digest = formalization_source_tree_digest(formalization_entries)
    lock = parse_lock()
    writing_evidence = any(
        option is not None
        for option in (
            args.write_build_log,
            args.write_kernel_replay_log,
            args.write_alternate_kernel_replay_log,
        )
    )
    windows_profile = (windows_verification.parse_profile(args.windows_profile, lock)
                       if args.windows_profile is not None else None)
    if windows_profile is not None:
        windows_verification.activate_native_environment(args.lake)
    canonical_environment = args.canonical_environment or writing_evidence
    environment = (windows_verification.fingerprint(windows_profile, lock, args.lake)
                   if windows_profile is not None else fingerprint(canonical=canonical_environment))
    environment_payload = json.dumps(
        environment, sort_keys=True, separators=(",", ":")
    ).encode()
    environment_digest = hashlib.sha256(environment_payload).hexdigest()
    timestamp, literal_command, host_description = runtime_record()

    if args.write_kernel_replay_log is not None and args.lean4checker_source is None:
        parser.error("--write-kernel-replay-log requires --lean4checker-source")
    if (
        args.write_alternate_kernel_replay_log is not None
        and args.lean4lean_source is None
    ):
        parser.error(
            "--write-alternate-kernel-replay-log requires --lean4lean-source"
        )
    if args.lean4lean_source is not None and args.batteries_source is None:
        parser.error("--lean4lean-source requires --batteries-source")
    if args.batteries_source is not None and args.lean4lean_source is None:
        parser.error("--batteries-source requires --lean4lean-source")

    transcript: list[str] = []
    replay_transcript: list[str] = []
    alternate_replay_transcript: list[str] = []
    checker_record: BuiltChecker | None = None
    alternate_record: BuiltChecker | None = None
    checker_digest_after: str | None = None
    alternate_digest_after: str | None = None
    invalid_proof_canaries: dict[str, dict] = {}
    grouped_receipt: dict | None = None
    prepared: grouped_replay.PreparedReplay | None = None
    compiled_before: dict[str, str] | None = None
    group_replays: list[dict] = []
    def build_checker(name: str, source: Path, private_root: Path,
                      *, batteries_source: Path | None = None) -> BuiltChecker:
        if windows_profile is not None:
            return windows_verification.build_checker(
                lock, name, source, private_root, args.lake,
                batteries_source=batteries_source,
                expected_sha256=windows_profile.values["checkers"][name]["binary_sha256"],
            )
        return build_locked_checker(lock, name, source, private_root, args.lake,
                                    batteries_source=batteries_source)
    with workspace.temporary_directory(prefix="pure-s-formalization-") as temporary:
        private_root = Path(temporary)
        working_copy = private_root / "formalization"
        copy_formalization(working_copy)
        try:
            if args.lean4checker_source is not None:
                checker_record = build_checker(
                    "lean4checker",
                    args.lean4checker_source,
                    private_root / "checkers",
                )
                require_negative_canary(
                    [args.lake, "env", str(checker_record.binary), "--fresh",
                     "PureSFormal.ProvenanceNegativeCanary"],
                    cwd=working_copy,
                    name="lean4checker",
                )
            if args.lean4lean_source is not None:
                assert args.batteries_source is not None
                alternate_record = build_checker(
                    "lean4lean",
                    args.lean4lean_source,
                    private_root / "checkers",
                    batteries_source=args.batteries_source,
                )
                require_negative_canary(
                    [args.lake, "env", str(alternate_record.binary),
                     "PureSFormal.ProvenanceNegativeCanary"],
                    cwd=working_copy,
                    name="lean4lean",
                )
            invalid_proof_canaries = checker_canary.check_all(
                lock, canary_source, private_root / "invalid-proof-canary", args.lake,
                tuple(checked for checked in (checker_record, alternate_record) if checked is not None),
            )
            for name in invalid_proof_canaries:
                print(f"PASS invalid-proof canary {name}: compiled upstream AddFalse rejected for kernel type mismatch", flush=True)
        except (LockError, OSError, subprocess.CalledProcessError) as exc:
            parser.error(str(exc))
        print(f"TOOLCHAIN_LOCK_SHA256 {lock.sha256}", flush=True)
        if windows_profile is not None:
            print(f"WINDOWS_PROFILE_SHA256 {windows_profile.sha256}", flush=True)
        print(
            f"ENVIRONMENT_FINGERPRINT_SHA256 {environment_digest}", flush=True
        )
        print(
            f"FORMAL_SOURCE_TREE_SHA256 {source_tree_digest}", flush=True
        )
        if checker_record is not None:
            print(
                "CHECKER_RECEIPT lean4checker "
                f"commit={checker_record.source_commit} "
                f"tree={checker_record.source_tree} "
                f"source_sha256={checker_record.source_sha256} "
                f"binary_sha256={checker_record.binary_sha256_before} "
                "canary=rejected",
                flush=True,
            )
        if alternate_record is not None:
            print(
                "CHECKER_RECEIPT lean4lean "
                f"commit={alternate_record.source_commit} "
                f"tree={alternate_record.source_tree} "
                f"source_sha256={alternate_record.source_sha256} "
                f"binary_sha256={alternate_record.binary_sha256_before} "
                "canary=rejected",
                flush=True,
            )
        returncode = stream_command(
            [
                sys.executable,
                "-B",
                str(working_copy / "scripts" / "run_audit.py"),
                "--lake", args.lake,
                "--python", args.python,
            ],
            cwd=working_copy,
            transcript=transcript,
            normalized_root=private_root,
        )
        verification_roots = tuple(
            dict.fromkeys(
                (
                    LEAN4CHECKER_FRESH_ROOTS if checker_record is not None else ()
                )
                + (
                    LEAN4LEAN_SCOPED_MODULES
                    if alternate_record is not None
                    else ()
                )
            )
        )
        if returncode == 0 and verification_roots:
            commands = verification_build_commands(args.lake, verification_roots)
            for index, command in enumerate(commands, 1):
                description = "BUILD_VERIFICATION_BATCH " + json.dumps({
                    "batch": index, "batches": len(commands), "command": command}) + "\n"
                print(description, end="", flush=True)
                transcript.append(description)
                returncode = stream_command(
                    command, cwd=working_copy, transcript=transcript,
                    normalized_root=private_root,
                )
                if returncode:
                    break
        if returncode == 0 and verification_roots:
            compiled_before = compiled_input_snapshot(working_copy)
        if returncode == 0 and checker_record is not None:
            if windows_profile is not None:
                prepared = grouped_replay.prepare_groups(
                    working_copy, formalization_entries, LEAN4CHECKER_FRESH_ROOTS,
                    args.lake, private_root / "grouped-replay", workspace,
                )
                for group in prepared.groups:
                    prepared.verify_unchanged()
                    display = f"lean4checker --fresh {group.module}"
                    print(f"REPLAY_GROUP {display}", flush=True)
                    replay_transcript.append(f"REPLAY_GROUP {display}\n")
                    group_transcript: list[str] = []
                    returncode = stream_command(
                        [str(checker_record.binary), "--fresh", group.module],
                        cwd=prepared.output, environment=prepared.environment,
                        transcript=group_transcript, normalized_root=private_root,
                    )
                    replay_transcript.extend(group_transcript)
                    prepared.verify_unchanged()
                    group_replays.append({"module": group.module, "returncode": returncode,
                        "output_sha256": hashlib.sha256("".join(group_transcript).encode()).hexdigest()})
                    if returncode != 0:
                        break
                    print(f"PASS_GROUP {display}", flush=True)
                    replay_transcript.append(f"PASS_GROUP {display}\n")
                if returncode == 0:
                    grouped_receipt = prepared.receipt()
                    for root in LEAN4CHECKER_FRESH_ROOTS:
                        print(f"COVERED lean4checker {root}", flush=True)
                        replay_transcript.append(f"COVERED lean4checker {root}\n")
            else:
                checks = [
                    [str(checker_record.binary), "--fresh", root]
                    for root in LEAN4CHECKER_FRESH_ROOTS
                ]
                for check in checks:
                    display = " ".join(check[1:])
                    print(f"REPLAY lean4checker {display}", flush=True)
                    replay_transcript.append(f"REPLAY lean4checker {display}\n")
                    returncode = stream_command(
                        [args.lake, "env", *check],
                        cwd=working_copy,
                        transcript=replay_transcript,
                        normalized_root=private_root,
                    )
                    if returncode != 0:
                        break
                    print(f"PASS lean4checker {display}", flush=True)
                    replay_transcript.append(f"PASS lean4checker {display}\n")
        if returncode == 0 and alternate_record is not None:
            for module in LEAN4LEAN_SCOPED_MODULES:
                print(f"RECHECK lean4lean {module}", flush=True)
                alternate_replay_transcript.append(
                    f"RECHECK lean4lean {module}\n"
                )
                returncode = stream_command(
                    [args.lake, "env", str(alternate_record.binary), module],
                    cwd=working_copy,
                    transcript=alternate_replay_transcript,
                    normalized_root=private_root,
                )
                if returncode != 0:
                    break
                print(f"PASS lean4lean {module}", flush=True)
                alternate_replay_transcript.append(
                    f"PASS lean4lean {module}\n"
                )
        if compiled_before is not None and compiled_input_snapshot(working_copy) != compiled_before:
            raise LockError("compiled project input inventory or hashes changed during checker replay")
        if prepared is not None:
            prepared.verify_unchanged()
            if grouped_receipt is not None:
                bindings = {item["path"]: item["sha256"] for item in grouped_receipt["artifact_bindings"]}
                for path, digest in (compiled_before or {}).items():
                    if path in bindings and bindings[path] != digest:
                        raise LockError("grouped and full compiled input bindings disagree")
                    bindings[path] = digest
                grouped_receipt["artifact_bindings"] = [{"path": path, "sha256": digest}
                    for path, digest in sorted(bindings.items())]
        if checker_record is not None:
            checker_digest_after = checker_record.verify_unchanged()
            assert args.lean4checker_source is not None
            verify_git_source(
                lock, "lean4checker", args.lean4checker_source.resolve(strict=True)
            )
        if alternate_record is not None:
            alternate_digest_after = alternate_record.verify_unchanged()
            assert args.lean4lean_source is not None
            assert args.batteries_source is not None
            verify_git_source(
                lock, "lean4lean", args.lean4lean_source.resolve(strict=True)
            )
            verify_git_source(
                lock,
                "lean4lean-batteries",
                args.batteries_source.resolve(strict=True),
            )
        if invalid_proof_canaries:
            assert canary_source is not None
            verify_git_source(lock, "lean4checker", canary_source.resolve(strict=True))
        copied_digest_after = copied_formalization_digest(
            working_copy, formalization_entries
        )
        if copied_digest_after != source_tree_digest:
            raise LockError(
                "formal source snapshot changed during build or replay"
            )
    if returncode == 0:
        after_environment = (windows_verification.fingerprint(windows_profile, lock, args.lake)
                             if windows_profile is not None else fingerprint(canonical=canonical_environment))
        if after_environment != environment:
            raise LockError("runtime changed during the formalization replay")
        print("PASS cache-free formalization replay in temporary storage")
        receipt_line: str | None = None
        summary_line: str | None = None
        if checker_record is not None and alternate_record is not None:
            assert checker_digest_after is not None
            assert alternate_digest_after is not None
            serialize_receipt = (canonical_receipt_line if windows_profile is None else
                                 lambda receipt: windows_verification.receipt_line(receipt, windows_profile))
            receipt_line = serialize_receipt(
                {
                    "schema": RECEIPT_SCHEMA,
                    "result": "success",
                    "toolchain_lock_sha256": lock.sha256,
                    "environment_fingerprint_sha256": environment_digest,
                    "formal_source_tree_sha256": source_tree_digest,
                    "checkers": {
                        "lean4checker": {
                            "commit": checker_record.source_commit,
                            "tree": checker_record.source_tree,
                            "source_sha256": checker_record.source_sha256,
                            "build_recipe_sha256": checker_record.build_recipe_sha256,
                            "binary_sha256_before": checker_record.binary_sha256_before,
                            "binary_sha256_after": checker_digest_after,
                            "negative_canary_rejected": True,
                            "ordered_roots": list(LEAN4CHECKER_FRESH_ROOTS),
                            "passed": len(LEAN4CHECKER_FRESH_ROOTS),
                            "total": len(LEAN4CHECKER_FRESH_ROOTS),
                            **({"invalid_proof_canary": invalid_proof_canaries["lean4checker"],
                                "grouped_replay": grouped_receipt, "group_replays": group_replays}
                               if windows_profile is not None else {}),
                        },
                        "lean4lean": {
                            "commit": alternate_record.source_commit,
                            "tree": alternate_record.source_tree,
                            "source_sha256": alternate_record.source_sha256,
                            "build_recipe_sha256": alternate_record.build_recipe_sha256,
                            "binary_sha256_before": alternate_record.binary_sha256_before,
                            "binary_sha256_after": alternate_digest_after,
                            "negative_canary_rejected": True,
                            "ordered_roots": list(LEAN4LEAN_SCOPED_MODULES),
                            "passed": len(LEAN4LEAN_SCOPED_MODULES),
                            "total": len(LEAN4LEAN_SCOPED_MODULES),
                            **({"invalid_proof_canary": invalid_proof_canaries["lean4lean"]}
                               if windows_profile is not None else {}),
                            "dependency": {
                                "commit": lock["lean4lean-batteries-commit"],
                                "tree": lock["lean4lean-batteries-tree"],
                                "source_sha256": lock[
                                    "lean4lean-batteries-source-sha256"
                                ],
                            },
                        },
                    },
                }
            )
            summary_line = (
                "ACTIVE_REPLAY_SUMMARY "
                f"lean4checker={len(LEAN4CHECKER_FRESH_ROOTS)}/"
                f"{len(LEAN4CHECKER_FRESH_ROOTS)} "
                f"lean4lean={len(LEAN4LEAN_SCOPED_MODULES)}/"
                f"{len(LEAN4LEAN_SCOPED_MODULES)}"
            )
            print(receipt_line)
            print(summary_line)
        evidence_footer = ""
        canary_lines = [canonical_invalid_proof_canary_line({
            "schema": INVALID_PROOF_CANARY_SCHEMA,
            "checker": checked.name,
            "binary_sha256_before": checked.binary_sha256_before,
            "binary_sha256_after": (checker_digest_after if checked.name == "lean4checker" else alternate_digest_after),
            "canary": invalid_proof_canaries[checked.name],
        }) for checked in (checker_record, alternate_record) if checked is not None]
        for line in canary_lines:
            print(line, flush=True)
        if receipt_line is not None and summary_line is not None:
            evidence_footer = receipt_line + "\n" + summary_line + "\n"
        evidence_footer += "".join(line + "\n" for line in canary_lines)
        profile_marker = (f"WINDOWS_PROFILE_SHA256 {windows_profile.sha256}\n"
                          if windows_profile is not None else "")
        if args.write_build_log is not None:
            destination = workspace.output(args.write_build_log)
            destination.parent.mkdir(parents=True, exist_ok=True)
            header = (
                "Cache-free formalization audit transcript\n"
                "Identifier: verification-cache-free\n"
                f"UTC timestamp: {timestamp}\n"
                f"Toolchain: Lean {lock['lean']} (commit {lock['lean-commit']}), "
                f"Lake {lock['lake']}\n"
                f"Runtime: {host_description}\n"
                f"TOOLCHAIN_LOCK_SHA256 {lock.sha256}\n"
                f"{profile_marker}"
                f"ENVIRONMENT_FINGERPRINT_SHA256 {environment_digest}\n"
                f"FORMAL_SOURCE_TREE_SHA256 {source_tree_digest}\n"
                f"Command: {literal_command}\n"
                "Exit status: 0\n"
                "Evidence digest: SHA256SUMS entry for formalization/BUILD_LOG.txt\n"
                "Precondition: the temporary source copy contained no .lake directory.\n\n"
            )
            temporary_log = workspace.output(destination.with_name(destination.name + ".tmp"))
            temporary_log.write_text(
                header
                + "".join(transcript)
                + "PASS cache-free formalization replay in temporary storage\n"
                + evidence_footer,
                encoding="utf-8",
            )
            temporary_log.replace(destination)
            print(f"WROTE normalized build transcript {destination}")
        if args.write_kernel_replay_log is not None:
            assert checker_record is not None
            assert checker_digest_after is not None
            destination = workspace.output(args.write_kernel_replay_log)
            destination.parent.mkdir(parents=True, exist_ok=True)
            header = (
                "Lean environment replay transcript\n"
                "Identifier: verification-lean4checker-fresh\n"
                f"UTC timestamp: {timestamp}\n"
                f"Toolchain: Lean {lock['lean']} (commit {lock['lean-commit']}), "
                f"Lake {lock['lake']}\n"
                f"Runtime: {host_description}\n"
                f"TOOLCHAIN_LOCK_SHA256 {lock.sha256}\n"
                f"{profile_marker}"
                f"ENVIRONMENT_FINGERPRINT_SHA256 {environment_digest}\n"
                f"Checker source: {lock['lean4checker-repository']}\n"
                f"Checker source tag: {lock['lean4checker-tag']}\n"
                f"Checker source commit: {checker_record.source_commit}\n"
                f"Checker source tree: {checker_record.source_tree}\n"
                f"Checker source SHA-256: {checker_record.source_sha256}\n"
                f"Checker build-recipe SHA-256: {checker_record.build_recipe_sha256}\n"
                "Checker build: clean private export of the locked Git object\n"
                "Negative canary: rejected\n"
                f"Checker binary SHA-256 before: {checker_record.binary_sha256_before}\n"
                f"Checker binary SHA-256 after: {checker_digest_after}\n"
                f"FORMAL_SOURCE_TREE_SHA256 {source_tree_digest}\n"
                f"Command: {literal_command}\n"
                "Exit status: 0\n"
                "Evidence digest: SHA256SUMS entry for formalization/KERNEL_REPLAY_LOG.txt\n"
                f"Method: fresh-replay {len(LEAN4CHECKER_FRESH_ROOTS)} named verification "
                "roots listed below: the executable demo; the complete public and core axiom "
                "audits; selected-path universality and checkpoint exclusion; the fixed "
                "deterministic-source compiler chain; controller trajectory, projection, and "
                "parent-linked implementation; root-reset local grammars, walkers, contracts, "
                "and their audit modules; protected-trie persistence, observation, fairness, "
                "and resource audits; definition agreement; and compatibility. "
                "Each --fresh "
                "invocation replays both imported and locally defined declarations "
                "into a fresh environment.\n"
                + (f"Native grouping: {len(group_replays)} actual import-only invocations; "
                   "COVERED lines enumerate original roots, not separate invocations. "
                   "Compiled group metadata and unchanged input hashes are in the receipt.\n"
                   if windows_profile is not None else "") +
                "Scope: lean4checker resubmits stored declarations to Lean's kernel; "
                "it detects unchecked environment injection but is not an independent "
                "kernel implementation.\n\n"
            )
            temporary_log = workspace.output(destination.with_name(destination.name + ".tmp"))
            temporary_log.write_text(
                header + "".join(replay_transcript) + evidence_footer,
                encoding="utf-8",
            )
            temporary_log.replace(destination)
            print(f"WROTE kernel replay transcript {destination}")
        if args.write_alternate_kernel_replay_log is not None:
            assert alternate_record is not None
            assert alternate_digest_after is not None
            destination = workspace.output(args.write_alternate_kernel_replay_log)
            destination.parent.mkdir(parents=True, exist_ok=True)
            header = (
                "Scoped alternate-kernel replay transcript\n"
                "Identifier: verification-lean4lean-scoped\n"
                f"UTC timestamp: {timestamp}\n"
                f"Toolchain: Lean {lock['lean']} (commit {lock['lean-commit']}), "
                f"Lake {lock['lake']}\n"
                f"Runtime: {host_description}\n"
                f"TOOLCHAIN_LOCK_SHA256 {lock.sha256}\n"
                f"{profile_marker}"
                f"ENVIRONMENT_FINGERPRINT_SHA256 {environment_digest}\n"
                f"Checker source: {lock['lean4lean-repository']}\n"
                f"Checker source commit: {alternate_record.source_commit}\n"
                f"Checker source tree: {alternate_record.source_tree}\n"
                f"Checker source SHA-256: {alternate_record.source_sha256}\n"
                f"Checker dependency source: {lock['lean4lean-batteries-repository']}\n"
                f"Checker dependency commit: {lock['lean4lean-batteries-commit']}\n"
                f"Checker dependency tree: {lock['lean4lean-batteries-tree']}\n"
                f"Checker dependency SHA-256: {lock['lean4lean-batteries-source-sha256']}\n"
                f"Checker build-recipe SHA-256: {alternate_record.build_recipe_sha256}\n"
                "Checker build: clean private export of the locked Git objects\n"
                "Negative canary: rejected\n"
                f"Checker binary SHA-256 before: {alternate_record.binary_sha256_before}\n"
                f"Checker binary SHA-256 after: {alternate_digest_after}\n"
                f"FORMAL_SOURCE_TREE_SHA256 {source_tree_digest}\n"
                f"Command: {literal_command}\n"
                "Exit status: 0\n"
                "Evidence digest: SHA256SUMS entry for formalization/LEAN4LEAN_REPLAY_LOG.txt\n"
                f"Method: recheck declarations defined in "
                f"{len(LEAN4LEAN_SCOPED_MODULES)} named modules listed below. "
                "Coverage includes public composition; deterministic-source compilation "
                "with the tape-boundary inverse and retained-route growth boundary, and "
                "the direct fixed-Cook/pure-S bridge; the parent-linked controller; "
                "the root-reset selector, carrier and stage grammars, local dispatcher-node "
                "and appender rows with whole-dispatcher and whole-appender placement and "
                "exact local and marked-prefix selected-child dispatcher handoffs, "
                "exact CLOSE/COMMIT response boundaries and clean marked handoff, marked-history and "
                "accumulator/whole-stage classifiers, bare-root clock/fuel placement, "
                "canonical grammar and exact five-step local transition, the "
                "priority-explicit 18-stage composite registry and its 27-stage union "
                "with the nine non-unregistered whole-stage tags, and "
                "progress-fragment behavior, "
                "completeness, bare totality, and guarded progress/abort/Euler composition "
                "with all-input endpoint totality, the complete coefficient-51 contract, "
                "and successful-edge traversal bounds dominated by issued L/R/U "
                "instructions; "
                "whole-reduct semantics; simple-path "
                "subdivision; source agreement; observer, shared-store, unified-resource, "
                "and pointer-word cost; the finite shared implementation; confluence; "
                "bounded terminal candidates; observer necessity, boundary, and fairness; "
                "the stable public theorem interface; and definition agreement.\n"
                "Scope: lean4lean is a separate Lean implementation derived "
                "from the C++ kernel algorithm. This scoped run assumes imported "
                "modules and does not claim a fresh replay of every dependency. "
                "The public dependency graph is fresh-replayed separately by "
                "lean4checker and built normally by Lean's kernel.\n\n"
            )
            temporary_log = workspace.output(destination.with_name(destination.name + ".tmp"))
            temporary_log.write_text(
                header + "".join(alternate_replay_transcript) + evidence_footer,
                encoding="utf-8",
            )
            temporary_log.replace(destination)
            print(f"WROTE alternate-kernel replay transcript {destination}")
    return returncode


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (LockError, OSError, ValueError, subprocess.CalledProcessError) as error:
        raise SystemExit(f"FAIL formalization replay: {error}") from None
