# Nextcloud v35.0.3 — ReadyStack release `v35.0.3-CE-ubuntu24.04-r4`

Generated 2026-11-25 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r4` (linux/amd64). Index digest `sha256:6362a3e3cf62f7b9e41829d7a204ff21a50f88df5f3adf462de2808bf16fb50c` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:605031a111886b3ea686ffe9311ed67605436fb17128739db38590b9035188d1` [`TARGET_DIGEST.txt`].
- **Upstream:** Nextcloud v35.0.3 built from source at `v35.0.3` of https://github.com/nextcloud/server — upstream notes: https://github.com/nextcloud/server/releases/tag/v35.0.3 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** `ubuntu:24.04`; runtime user `www-data`.
- **Build:** `source-rebuild-php`, built offline with `--network=none`.
- **Supersedes:** ReadyStack release `v35.0.3-CE-ubuntu24.04-r3`.

## What changed in this release

- Upstream version unchanged (v35.0.3); ReadyStack rebuild.
- Minimum dependency versions ReadyStack enforces on top of upstream (raised only where upstream's own version was lower); shipped versions from the SBOM [`docs/sbom/SBOM.json`]:
  - `symfony/http-foundation` at least `7.4.23` (shipped: `v7.4.23`)
- Nextcloud v35.0.3 is unchanged from the release this supersedes (v35.0.3-CE-ubuntu24.04-r3); this release rebuilds it. Changes: libheif-plugin-aomdec moves from 1.17.6-1ubuntu4.9 to 1.17.6-1ubuntu4.10 (USN-8846-2); libheif1 moves from 1.17.6-1ubuntu4.9 to 1.17.6-1ubuntu4.10 (USN-8846-2). Settings, ports and data volumes are those of v35.0.3-CE-ubuntu24.04-r3: replace the container with this image on the same volumes.

## Security status at release (measured 2026-11-25)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `www-data` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r4` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.
- **Before exposing this service:** Without NEXTCLOUD_ADMIN_USER/NEXTCLOUD_ADMIN_PASSWORD, the web installer lets whoever reaches it first create the administrator. Set them, or install before exposing the port.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:605031a111886b3ea686ffe9311ed67605436fb17128739db38590b9035188d1`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 3 of 3 use cases passed (3 authored) against the running image [`docs/validation/test-results.json`].
- The cases are `GET /status.php` (200), `GET /robots.txt` (200), `GET /index.php/login` (200); the suite checks nothing else.

## Known issues

- **high** (upstream): First visitor can claim the administrator account until setup is completed [`RSD-nextcloud-871faad7bf`]

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r4
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

