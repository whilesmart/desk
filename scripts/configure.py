import os
import base64
from pathlib import Path
import secrets
import sys


destination = Path(__file__).resolve().parent.parent / ".env"
if not destination.exists():
    values = {
        "DESK_RELEASE": "v2026.10.21",
        "POSTGRES_PASSWORD": secrets.token_hex(24),
        "JWT_SECRET": secrets.token_hex(32),
        "CREDENTIAL_ENCRYPTION_KEY": base64.b64encode(secrets.token_bytes(32)).decode(),
        "ORG_ACCESS_API_KEY": secrets.token_hex(32),
        "NOTIFICATION_API_KEY": secrets.token_hex(32),
        "BOOTSTRAP_EMAIL": "admin@example.test",
        "BOOTSTRAP_PASSWORD": secrets.token_urlsafe(24),
    }
    with open(destination, "x", opener=lambda path, flags: os.open(path, flags, 0o600)) as output:
        output.write("".join(f"{key}={value}\n" for key, value in values.items()))
    print("Created local credentials in .env")

existing = dict(line.split("=", 1) for line in destination.read_text().splitlines() if "=" in line)
if "CREDENTIAL_ENCRYPTION_KEY" not in existing:
    with destination.open("a") as output:
        output.write("CREDENTIAL_ENCRYPTION_KEY=" + base64.b64encode(secrets.token_bytes(32)).decode() + "\n")

required = ("DESK_RELEASE", "POSTGRES_PASSWORD", "JWT_SECRET", "ORG_ACCESS_API_KEY", "BOOTSTRAP_EMAIL", "BOOTSTRAP_PASSWORD")
for key in required:
    value = existing.get(key, "")
    if not value or value.startswith("generate-"):
        raise SystemExit(f"Set {key} in .env before starting Desk")

if "--credentials" in sys.argv:
    values = dict(line.split("=", 1) for line in destination.read_text().splitlines() if "=" in line)
    print("Email:", values.get("BOOTSTRAP_EMAIL", ""))
    print("Password:", values.get("BOOTSTRAP_PASSWORD", ""))
