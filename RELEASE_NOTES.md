# Nextcloud v35.0.3 — ReadyStack release `v35.0.3-CE-ubuntu24.04-r6`

Generated 2026-11-27 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r6` (linux/amd64). Index digest `sha256:ee0e52ba60b5e563515fe1205671d0dd2f53c9ef3e66b1f5409f98c6c1a2b851` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:6d9415310fe98936feabe51f1120306851ecaa56f07b13b94af843bd7801d403` [`TARGET_DIGEST.txt`].
- **Upstream:** Nextcloud v35.0.3 built from source at `v35.0.3` of https://github.com/nextcloud/server — upstream notes: https://github.com/nextcloud/server/releases/tag/v35.0.3 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** `ubuntu:24.04`; runtime user `www-data`.
- **Build:** `source-rebuild-php`, built offline with `--network=none`.
- **Supersedes:** ReadyStack release `v35.0.3-CE-ubuntu24.04-r5`.

## What changed in this release

- Upstream version unchanged (v35.0.3); ReadyStack rebuild.
- Minimum dependency versions ReadyStack enforces on top of upstream (raised only where upstream's own version was lower); shipped versions from the SBOM [`docs/sbom/SBOM.json`]:
  - `symfony/http-foundation` at least `7.4.23` (shipped: `v7.4.23`)
- Nextcloud v35.0.3 is unchanged from the release this supersedes (v35.0.3-CE-ubuntu24.04-r5); this release rebuilds it. Changes: libgssapi-krb5-2 moves from 1.20.1-6ubuntu2.10 to 1.20.1-6ubuntu2.12 (USN-9202-1); libk5crypto3 moves from 1.20.1-6ubuntu2.10 to 1.20.1-6ubuntu2.12 (USN-9202-1); libkrb5-3 moves from 1.20.1-6ubuntu2.10 to 1.20.1-6ubuntu2.12 (USN-9202-1); libkrb5support0 moves from 1.20.1-6ubuntu2.10 to 1.20.1-6ubuntu2.12 (USN-9202-1). Settings, ports and data volumes are those of v35.0.3-CE-ubuntu24.04-r5: replace the container with this image on the same volumes.

## Security status at release (measured 2026-11-27)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `www-data` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r6` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.
- **Before exposing this service:** Without NEXTCLOUD_ADMIN_USER/NEXTCLOUD_ADMIN_PASSWORD, the web installer lets whoever reaches it first create the administrator. Set them, or install before exposing the port.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:6d9415310fe98936feabe51f1120306851ecaa56f07b13b94af843bd7801d403`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 3 of 3 use cases passed (3 authored) against the running image [`docs/validation/test-results.json`].
- The cases are `GET /status.php` (200), `GET /robots.txt` (200), `GET /index.php/login` (200); the suite checks nothing else.

## Known issues

- **high** (upstream): First visitor can claim the administrator account until setup is completed [`RSD-nextcloud-b8d70b7e24`]

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r6
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

