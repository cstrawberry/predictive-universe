"""Reject local computer paths in public files, including compressed metadata."""
from pathlib import Path
import argparse
import gzip
import json
import re
import struct
from urllib.parse import unquote
import zlib

ROOT = Path(__file__).resolve().parents[1]
USER_PATH = re.compile(
    r"(?i)(?:[a-z]:/+users/+|/mnt/[a-z]/+users/+|/users/+|/home/+)[\w.-]+(?:/|\b)"
    r"|(?i:/root/\.(?:cache|config|local|ssh)/)"
)
RECORD_PATH = re.compile(r"(?i)(?<![\w])(?:[a-z]:/+|/mnt/[a-z]/|/(?:var/)?tmp/)")
PRIVATE_FIELDS = re.compile(
    r'''(?i)["'](?:hostname|computername|userprofile|machine_id|mac_address|cpu_model)["']\s*:'''
)
STACK_ADDRESS = re.compile(r"\[0x[0-9a-fA-F]+\]")
ENVIRONMENT_FIELD = re.compile(
    r'''["'](?:PATH|PWD|HOME|USER|USERNAME|USERPROFILE|APPDATA|LOCALAPPDATA|COMPUTERNAME)["']\s*[:,]'''
)


def check_text(text, name, *, record=False):
    # Catch escaped backslashes, URL-encoded paths, UTF-16 bytes and TeX wrapping.
    # JSON Unicode escapes are decoded separately in check_json.
    normalized = unquote(text).replace("\\", "/").replace("\x00", "")
    joined = normalized.replace("\r", "").replace("\n", "")
    for candidate in (normalized, joined):
        if USER_PATH.search(candidate):
            raise ValueError(f"personal computer path in {name}")
        if record and (RECORD_PATH.search(candidate) or PRIVATE_FIELDS.search(candidate)
                       or ENVIRONMENT_FIELD.search(candidate)
                       or STACK_ADDRESS.search(candidate)):
            raise ValueError(f"local execution detail in {name}")


def check_json(raw, name, *, record=False):
    def object_pairs(pairs):
        # Keep duplicate keys: a later safe value must not hide an earlier leak.
        for key, _ in pairs:
            check_text(json.dumps(key, ensure_ascii=False) + ":", name, record=record)
        return pairs

    try:
        pending = [json.loads(raw, object_pairs_hook=object_pairs)]
    except (json.JSONDecodeError, UnicodeDecodeError, RecursionError) as error:
        raise ValueError(f"invalid JSON in {name}") from error
    while pending:
        value = pending.pop()
        if isinstance(value, str):
            check_text(value, name, record=record)
        elif isinstance(value, (list, tuple)):
            pending.extend(value)


def png_metadata(raw):
    if not raw.startswith(b"\x89PNG\r\n\x1a\n"):
        raise ValueError("invalid PNG")
    offset = 8
    while offset < len(raw):
        if offset + 12 > len(raw):
            raise ValueError("truncated PNG chunk")
        size = struct.unpack(">I", raw[offset:offset + 4])[0]
        kind = raw[offset + 4:offset + 8]
        end = offset + 12 + size
        if end > len(raw):
            raise ValueError("truncated PNG data")
        data = raw[offset + 8:end - 4]
        if kind == b"tEXt":
            yield data
        elif kind == b"zTXt":
            _, payload = data.split(b"\0", 1)
            if payload[0] != 0:
                raise ValueError("unsupported PNG text compression")
            yield zlib.decompress(payload[1:])
        elif kind == b"iTXt":
            _, payload = data.split(b"\0", 1)
            compressed, method = payload[:2]
            _, _, content = payload[2:].split(b"\0", 2)
            if compressed not in (0, 1) or method != 0:
                raise ValueError("unsupported PNG international text compression")
            yield zlib.decompress(content) if compressed else content
        offset = end
        if kind == b"IEND":
            break


def check_pdf(path, name):
    from pypdf import PdfReader
    from pypdf.generic import IndirectObject, StreamObject
    reader = PdfReader(path)
    if reader.is_encrypted:
        raise ValueError(f"cannot inspect encrypted PDF: {name}")
    for page in reader.pages:
        check_text(page.extract_text() or "", name, record=True)
    objects = {(number, generation) for generation, entries in reader.xref.items()
               for number in entries if number}
    objects.update((number, 0) for number in reader.xref_objStm)
    for number, generation in sorted(objects):
        obj = reader.get_object(IndirectObject(number, generation, reader))
        check_text(str(obj), name, record=True)
        if isinstance(obj, StreamObject):
            check_text(obj.get_data().decode("utf-8", errors="ignore"), name, record=True)


def check_file(path, name):
    raw = path.read_bytes()
    if path.suffix.lower() == ".gz":
        raw = gzip.decompress(raw)
    record = name.startswith("evidence/") and path.suffix not in {".py", ".lean", ".md"}
    check_text(raw.decode("utf-8", errors="ignore"), name, record=record)
    if path.name.lower().endswith((".json", ".json.gz")):
        check_json(raw, name, record=record)
    elif path.suffix == ".pdf":
        check_pdf(path, name)
    elif path.suffix == ".png":
        for value in png_metadata(raw):
            check_text(value.decode("utf-8", errors="ignore"), name, record=True)


def check_files(root, paths):
    count = 0
    for path in paths:
        path = Path(path)
        check_file(path, path.relative_to(root).as_posix())
        count += 1
    return count


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    args = parser.parse_args()
    root = args.root.resolve()
    count = check_files(root, (p for p in root.rglob("*") if p.is_file()))
    print(f"PASS public privacy scan: {count} files, including gzip, PDF objects and PNG text")


if __name__ == "__main__":
    main()
