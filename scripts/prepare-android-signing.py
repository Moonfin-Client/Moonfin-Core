#!/usr/bin/env python3
"""Load the owner's private CI key; never silently publish a debug-signed build."""
import base64
import os
from pathlib import Path

names = ("ANDROID_KEYSTORE_BASE64", "ANDROID_KEYSTORE_PASSWORD", "ANDROID_KEY_ALIAS")
values = {name: os.environ.get(name, "") for name in names}
if not all(values.values()):
    raise SystemExit("Configure all three Android signing secrets before building release packages.")
password = values["ANDROID_KEYSTORE_PASSWORD"]
alias = values["ANDROID_KEY_ALIAS"]
if any(c in password + alias for c in "\r\n\\"):
    raise SystemExit("Signing password and alias must not contain line breaks or backslashes.")
root = Path(__file__).resolve().parent.parent
os.umask(0o077)
(root / "android/app/release.keystore").write_bytes(
    base64.b64decode(values["ANDROID_KEYSTORE_BASE64"], validate=True)
)
(root / "android/keystore.properties").write_text(
    f"storeType=PKCS12\nstorePassword={password}\nkeyPassword={password}\nkeyAlias={alias}\n"
)
print("Private Android release signing files prepared.")
