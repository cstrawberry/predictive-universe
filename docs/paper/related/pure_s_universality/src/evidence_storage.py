"""Read losslessly compressed or shared verification records.

STORAGE.json maps logical record names to physical files. MANIFEST.json and
the public execution receipts authenticate the uncompressed public copies.
"""
from pathlib import Path, PurePosixPath
import argparse
import gzip
import json
import sys

INDEX = "STORAGE.json"


def safe_file(root, name):
    relative = PurePosixPath(name)
    if (relative.is_absolute() or ".." in relative.parts or "\\" in name
            or ":" in name or str(relative) != name or name in {"", "."}):
        raise ValueError("invalid evidence storage path: " + name)
    root = Path(root).resolve()
    path = root / name
    if not path.resolve().is_relative_to(root):
        raise ValueError("evidence storage path escapes directory: " + name)
    for part in [path, *path.parents]:
        if part == root:
            break
        if part.is_symlink() or (hasattr(part, "is_junction") and part.is_junction()):
            raise ValueError("redirected evidence storage path: " + name)
    return path


def layout(root):
    root = Path(root)
    index = root / INDEX
    if not index.is_file():
        return {}
    safe_file(root, INDEX)
    data = json.loads(index.read_bytes())
    if data.get("version") != 1 or not isinstance(data.get("files"), dict):
        raise ValueError("invalid evidence storage index")
    records = data["files"]
    if len({name.casefold() for name in records}) != len(records):
        raise ValueError("duplicate evidence storage name")
    for name, record in records.items():
        logical = safe_file(root, name)
        if name in {INDEX, "MANIFEST.json"} or logical.exists():
            raise ValueError("evidence storage shadows a physical record: " + name)
        if not isinstance(record, dict) or set(record) != {"file", "encoding"}:
            raise ValueError("invalid evidence storage record: " + name)
        if record["encoding"] not in {"identity", "gzip"}:
            raise ValueError("unknown evidence storage encoding: " + name)
        if record["file"] in records or record["file"] in {INDEX, "MANIFEST.json"}:
            raise ValueError("recursive evidence storage mapping: " + name)
        stored = safe_file(root, record["file"])
        if not stored.is_file():
            raise ValueError("missing stored evidence: " + record["file"])
        if (stored.suffix == ".gz") != (record["encoding"] == "gzip"):
            raise ValueError("evidence encoding differs from storage suffix")
    return records


def storage_root(path):
    for parent in Path(path).absolute().parents:
        if (parent / INDEX).is_file():
            return parent
    return None


def read_bytes(path):
    path = Path(path)
    root = storage_root(path)
    if root is None:
        return path.read_bytes()
    records = layout(root)
    name = path.absolute().relative_to(root).as_posix()
    if name not in records:
        return safe_file(root, name).read_bytes()
    record = records[name]
    raw = safe_file(root, record["file"]).read_bytes()
    try:
        return gzip.decompress(raw) if record["encoding"] == "gzip" else raw
    except (OSError, EOFError) as error:
        raise ValueError("invalid compressed evidence: " + name) from error


def read_text(path):
    return read_bytes(path).decode("utf-8")


def exists(path):
    path = Path(path)
    root = storage_root(path)
    if root is None:
        return path.is_file()
    records = layout(root)
    return path.is_file() or path.absolute().relative_to(root).as_posix() in records


def logical_files(root):
    root = Path(root)
    records = layout(root)
    files = {p.relative_to(root).as_posix() for p in root.rglob("*") if p.is_file()}
    compressed = {r["file"] for r in records.values() if r["encoding"] == "gzip"}
    return (files - {INDEX, "MANIFEST.json"} - compressed) | set(records)


def stored_gzip(path):
    path = Path(path)
    root = storage_root(path)
    if root is None:
        return False
    name = path.absolute().relative_to(root).as_posix()
    return any(r == {"file": name, "encoding": "gzip"} for r in layout(root).values())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("record", type=Path, help="original record path from MANIFEST.json")
    args = parser.parse_args()
    sys.stdout.buffer.write(read_bytes(args.record))


if __name__ == "__main__":
    main()
