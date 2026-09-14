"""Check the measured formal inputs and their relation to the delivered files."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath

ROOT = Path(__file__).resolve().parents[1]
REPORT = "evidence/formal/delivery-comparison.json"
SUMMARY_SHA = "39b8e9f284472c9df3aeb993afdd4e232b14834da269e189ed08b35138a6f51f"
MANIFEST_SHA = "67c3c915c22092505924b9466dfd0e234fbb7d3a9b2d28d98ef8a30dab8a0892"
FORMAL_SHA = "6778aba875d811c3984ab57931405ef6a6a16758bd59054caa688bb4a5c5d398"
TRUST_INPUTS = (
    "TOOLCHAIN.lock", "Dockerfile", "requirements.txt",
    "src/replay_receipt.py", "src/run_formalization.py", "src/toolchain_lock.py",
    "src/verification_runtime.py", "src/check_environment.py", "src/local_workspace.py",
)
TRANSCRIPTS = {"BUILD_LOG.txt", "KERNEL_REPLAY_LOG.txt", "LEAN4LEAN_REPLAY_LOG.txt"}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha(path: Path) -> str:
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def safe_file(root: Path, name: str) -> Path:
    relative = PurePosixPath(name)
    require(not relative.is_absolute() and relative.as_posix() == name
            and ".." not in relative.parts and "\\" not in name and ":" not in name,
            "unsafe evidence path: " + name)
    path = root.joinpath(*relative.parts)
    require(path.is_file() and path.resolve().is_relative_to(root.resolve()),
            "missing or redirected evidence file: " + name)
    return path


def current_files(root: Path) -> dict[str, str]:
    result = {}
    for directory, dirs, names in os.walk(root, followlinks=False):
        parent = Path(directory)
        for name in dirs + names:
            path = parent / name
            require(not path.is_symlink()
                    and not getattr(path, "is_junction", lambda: False)(),
                    "redirected delivery path: " + str(path))
        if parent == root:
            dirs[:] = [name for name in dirs if name not in {".git", ".work"}]
            names[:] = [name for name in names
                        if name not in {".git", "pure_s_universality_submission.zip"}]
        if parent == root / "formalization":
            dirs[:] = [name for name in dirs if name != ".lake"]
        for name in names:
            path = parent / name
            relative = path.relative_to(root).as_posix()
            if relative not in {REPORT, "SHA256SUMS"}:
                result[relative] = sha(path)
    return dict(sorted(result.items()))


def comparison(root: Path = ROOT) -> dict:
    root = root.resolve()
    summary_file = safe_file(root, "evidence/formal/summary.json")
    manifest_file = safe_file(root, "evidence/formal/input-manifest.json")
    require(sha(summary_file) == SUMMARY_SHA, "formal execution summary identity differs")
    require(sha(manifest_file) == MANIFEST_SHA, "formal execution input manifest identity differs")
    summary = json.loads(summary_file.read_text(encoding="utf-8"))
    measured = json.loads(manifest_file.read_text(encoding="utf-8"))
    require(len(measured) == summary["input_manifest"]["files"] == 1353,
            "formal measurement inventory differs")

    inventory = safe_file(root, "formalization/FILES")
    raw = inventory.read_bytes()
    entries = [line for line in raw.decode("utf-8").splitlines()
               if line and not line.startswith("#")]
    require(len(entries) == len(set(entries)), "duplicate formal inventory entry")
    digest = hashlib.sha256(b"formalization-source-tree-v1\0" + raw + b"\0")
    formal_files = {"formalization/FILES"}
    for entry in entries:
        path = safe_file(root, "formalization/" + entry)
        if entry in TRANSCRIPTS:
            continue
        formal_files.add("formalization/" + entry)
        digest.update(entry.encode("utf-8") + b"\0" + path.read_bytes() + b"\0")
    require(digest.hexdigest() == FORMAL_SHA == summary["formal_source_sha256"],
            "delivered formal sources differ from the completed execution")
    require(sum(name.endswith(".lean") for name in formal_files) == 1193,
            "formal module count differs")
    for name in sorted(formal_files | set(TRUST_INPUTS)):
        require(name in measured and sha(safe_file(root, name)) == measured[name],
                "measured formal or execution input differs: " + name)
    for name, identity in summary["canonical_transcripts"].items():
        path = safe_file(root, name)
        require(path.stat().st_size == identity["bytes"] and sha(path) == identity["sha256"],
                "canonical formal transcript differs: " + name)
    for name, identity in summary["raw_process_records"].items():
        path = safe_file(root, "evidence/formal/" + name)
        require(path.stat().st_size == identity["bytes"] and sha(path) == identity["sha256"],
                "raw formal process record differs: " + name)

    current = current_files(root)
    common = measured.keys() & current.keys()
    changed = {name: {"measured_sha256": measured[name], "delivered_sha256": current[name]}
               for name in sorted(common) if measured[name] != current[name]}
    missing = {name: measured[name] for name in sorted(measured.keys() - current.keys())}
    extra = {name: current[name] for name in sorted(current.keys() - measured.keys())}
    return {
        "schema": "PURE_S_FORMAL_DELIVERY_COMPARISON_V1",
        "status": "PASS_UNCHANGED_FORMAL_INPUTS",
        "formal_source_sha256": FORMAL_SHA,
        "measured_summary_sha256": SUMMARY_SHA,
        "measured_input_manifest_sha256": MANIFEST_SHA,
        "measured_input_files": len(measured),
        "delivered_files_compared": len(current),
        "formal_input_files_matched": len(formal_files),
        "formal_modules_matched": 1193,
        "execution_inputs_matched": {name: measured[name] for name in TRUST_INPUTS},
        "all_measured_input_files_match_delivery": not changed and not missing,
        "matching_measured_input_files": len(common) - len(changed),
        "different_bytes": changed,
        "present_only_in_measurement": missing,
        "present_only_in_delivery": extra,
        "excluded_from_comparison": [REPORT, "SHA256SUMS", ".git", ".work/",
                                     "formalization/.lake/", "pure_s_universality_submission.zip"],
        "scope": (
            "The formal execution summary and its 1353-file manifest describe their recorded "
            "measurement. Inventoried formal inputs, execution helpers, toolchain lock and "
            "formal transcripts match that measurement. This comparison describes the current "
            "delivery; SHA256SUMS separately binds its complete file inventory. Manuscript "
            "corollaries have their displayed proofs and are not additional checked Lean exports."
        ),
    }


def encoded(report: dict) -> bytes:
    return (json.dumps(report, indent=2, sort_keys=True) + "\n").encode("utf-8")


def check_formal_continuity(root: Path = ROOT) -> dict:
    report = comparison(root)
    require(safe_file(root, REPORT).read_bytes() == encoded(report),
            "formal delivery comparison does not describe the current files")
    return report


def main() -> None:
    if (ROOT / "TOOLCHAIN.lock").read_text().startswith("verification-profile: "):
        from release_verification import check_proof_evidence
        check_proof_evidence()
        print("PASS current release formal source and proof evidence bindings")
        return
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true",
                        help="write the comparison after verifying the unchanged formal inputs")
    args = parser.parse_args()
    if args.write:
        (ROOT / REPORT).write_bytes(encoded(comparison()))
    report = check_formal_continuity()
    print("PASS formal delivery comparison: "
          f"{report['formal_modules_matched']} modules, "
          f"{len(report['different_bytes'])} other measured paths with different bytes, "
          f"{len(report['present_only_in_measurement'])} measurement-only paths")


if __name__ == "__main__":
    main()
