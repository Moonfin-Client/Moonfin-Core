# Server fixtures for Silo support

Captured 2026-10-07 from the maintainer's test servers. Signed query parameters
(`sig`, `st`), tokens and server file paths are scrubbed; long lists are trimmed.

- `openapi-4e371f4c.json.gz`: Silo's `/api/v2` OpenAPI document for server build
  `4e371f4c` (contract digest `da012530…bc7e`, upstream commit 4e371f4c in
  Silo-Server/silo-server). The reference every Silo mapper is written against.
- `silo/`: native `/api/v2` responses from that build. These are the public
  system and branding endpoints the server probe reads.

Later steps add the catalog, playback and Emby target-shape samples next to the
tests that use them. `scripts/silo_probe.sh` refreshes these files after a
Silo upgrade.
