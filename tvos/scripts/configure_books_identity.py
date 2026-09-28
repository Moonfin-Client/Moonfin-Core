#!/usr/bin/env python3
"""Opt in to a separate Moonfin Books tvOS app and Top Shelf identity.

Run only in an isolated source checkout before building a custom tvOS app.
Without this step the upstream tvOS project remains unchanged.
"""

import os
from pathlib import Path


if os.environ.get("MOONFIN_CUSTOM_BUILD") != "true":
    raise SystemExit("MOONFIN_CUSTOM_BUILD=true is required for the Books identity")

root = Path(__file__).resolve().parents[2]
replacements = {
    "tvos/Runner.xcodeproj/project.pbxproj": [
        ("PRODUCT_BUNDLE_IDENTIFIER = org.moonfin.app;", "PRODUCT_BUNDLE_IDENTIFIER = art.tiedemann.moonfin.tvos;", 3),
        ("PRODUCT_BUNDLE_IDENTIFIER = org.moonfin.app.topshelf;", "PRODUCT_BUNDLE_IDENTIFIER = art.tiedemann.moonfin.tvos.topshelf;", 3),
    ],
    "tvos/Runner/Info.plist": [
        ("<string>Moonfin</string>", "<string>Moonfin Books</string>", 1),
        ("<key>CFBundleName</key>\n  <string>moonfin</string>", "<key>CFBundleName</key>\n  <string>Moonfin Books</string>", 1),
        ("<string>org.moonfin.app</string>", "<string>art.tiedemann.moonfin.tvos</string>", 1),
    ],
    "tvos/MoonfinTopShelf/Info.plist": [
        ("<string>Moonfin Top Shelf</string>", "<string>Moonfin Books Top Shelf</string>", 1),
    ],
    "tvos/Runner/Runner.entitlements": [
        ("group.org.moonfin.app", "group.art.tiedemann.moonfin.tvos", 1),
    ],
    "tvos/MoonfinTopShelf/MoonfinTopShelf.entitlements": [
        ("group.org.moonfin.app", "group.art.tiedemann.moonfin.tvos", 1),
    ],
    "tvos/Runner/TopShelfChannel.swift": [
        ('"group.org.moonfin.app"', '"group.art.tiedemann.moonfin.tvos"', 1),
    ],
    "tvos/MoonfinTopShelf/ServiceProvider.swift": [
        ('"group.org.moonfin.app"', '"group.art.tiedemann.moonfin.tvos"', 1),
    ],
}

# Validate the complete source shape before writing any file. This fails on
# upstream identity changes rather than silently shipping a mixed identity.
updated = {}
for relative, rules in replacements.items():
    path = root / relative
    content = path.read_text(encoding="utf-8")
    for old, new, expected_count in rules:
        count = content.count(old)
        if count != expected_count:
            raise SystemExit(f"{relative}: expected {expected_count} instances of {old!r}, found {count}")
        content = content.replace(old, new)
    updated[path] = content

for path, content in updated.items():
    path.write_text(content, encoding="utf-8")

print("Configured separate Moonfin Books tvOS app and Top Shelf identities")
