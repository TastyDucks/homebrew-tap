#!/usr/bin/env python3
"""Update the Nebius Homebrew formula from the upstream RSS release feed."""

from __future__ import annotations

import hashlib
import re
import sys
import urllib.request
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path

RSS_URL = "https://docs.nebius.com/cli/release-notes/rss.xml"
STORAGE_URL = "https://storage.eu-north1.nebius.cloud/cli"
FORMULA_PATH = Path("Formula/nebius.rb")
VERSION_RE = re.compile(r"^\d+\.\d+\.\d+$")


@dataclass(frozen=True)
class Platform:
    os_name: str
    arch: str

    @property
    def url_path(self) -> str:
        return f"{self.os_name}/{self.arch}"


PLATFORMS = [
    Platform("darwin", "arm64"),
    Platform("darwin", "x86_64"),
    Platform("linux", "arm64"),
    Platform("linux", "x86_64"),
]


def fetch(url: str) -> bytes:
    with urllib.request.urlopen(url, timeout=120) as response:
        return response.read()


def latest_version() -> str:
    root = ET.fromstring(fetch(RSS_URL).decode("utf-8"))
    channel = root.find("channel")
    if channel is None:
        raise RuntimeError("RSS feed does not contain a channel")

    for item in channel.findall("item"):
        version = (item.findtext("title") or "").strip()
        if VERSION_RE.match(version):
            return version

    raise RuntimeError("RSS feed does not contain any CLI release items")


def artifact_url(version: str, platform: Platform) -> str:
    return f"{STORAGE_URL}/release/{version}/{platform.url_path}/nebius"


def sha256_url(url: str) -> str:
    digest = hashlib.sha256()
    with urllib.request.urlopen(url, timeout=120) as response:
        while chunk := response.read(1024 * 1024):
            digest.update(chunk)

    return digest.hexdigest()


def replace_once(text: str, pattern: str, replacement: str) -> str:
    text, count = re.subn(pattern, replacement, text, count=1, flags=re.MULTILINE)
    if count != 1:
        raise RuntimeError(f"Expected exactly one match for {pattern!r}, found {count}")

    return text


def update_formula(version: str) -> None:
    formula = FORMULA_PATH.read_text(encoding="utf-8")

    for platform in PLATFORMS:
        url = artifact_url(version, platform)
        checksum = sha256_url(url)
        path = re.escape(platform.url_path)
        pattern = (
            r'('
            r'url "https://storage\.eu-north1\.nebius\.cloud/cli/release/'
            r')\d+\.\d+\.\d+(/'
            + path
            + r'/nebius", using: :nounzip\s+sha256 "'
            r')[0-9a-f]{64}(")'
        )
        formula = replace_once(formula, pattern, rf"\g<1>{version}\g<2>{checksum}\3")

    FORMULA_PATH.write_text(formula, encoding="utf-8")


def main() -> int:
    version = latest_version()
    update_formula(version)
    print(version)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(1)
