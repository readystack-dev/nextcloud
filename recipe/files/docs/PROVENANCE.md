# Provenance — Nextcloud (`v35.0.3-CE-ubuntu24.04-r4`)

Every item below is copied from a record in this archive; the record is named in brackets.

## Source

- Upstream repository: https://github.com/nextcloud/server
- Revision built: `v35.0.3` (commit `7764ef4927e5f85071e495ce7602ccd247bb6b30`)
- Source tree: `a3a9467ca3149a46784379c14831cbffae9abc83950a88981e7fbdeb4b434b2b` over 18897 files [`docs/provenance/SOURCE_TREE_HASH.json`]
- Community Edition only: enterprise code is removed or refused before the build (CE audit at acquire).

## Build

- Method: `source-rebuild-php`; base image `ubuntu:24.04`
- Built with `--network=none` from vendored source, dependencies and base images; BuildKit pinned to `moby/buildkit:v0.31.2` (shipped in `toolchain/`).
- SOURCE_DATE_EPOCH: `1795600835` [`SOURCE_DATE_EPOCH.txt`]
- Frozen inputs: [`docs/provenance/FREEZE_MANIFEST.json`], build recipe: [`docs/provenance/BUILD_RECIPE.json`].

## Output

- Published image: `readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r4` — index digest `sha256:6362a3e3cf62f7b9e41829d7a204ff21a50f88df5f3adf462de2808bf16fb50c` [`docs/provenance/LOCKED_DIGEST.txt`]
- linux/amd64 image digest `sha256:605031a111886b3ea686ffe9311ed67605436fb17128739db38590b9035188d1` — reproduced from this archive before publishing [`docs/provenance/REPRO_VERIFICATION.json`].

## Attestations and signature

- SBOM + SLSA provenance attached to the image: attached: an SPDX SBOM and SLSA v1 provenance [`docs/provenance/SCOUT_VERDICT.json`]
- cosign signature by the ReadyStack release key: verified before publishing. Check it: `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r4`

## Pinned inputs, and why

- 29 pinned inputs, each with where it came from, why this one, how it was checked and when it was decided: `docs/PINS.md` [`docs/provenance/PINS.json`] (upstream source 2, base and build images 1, image digests 2, language runtimes and toolchains 1, dependency versions readystack sets 16, pins in the kit's dockerfiles 3, readystack's build engine 2, dependencies upstream chose 2).

## Build trail

- How this release passed through the ReadyStack harness, record by record (every chain, drive, stage, review round, defect and check, each naming the record it is copied from): `ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r4.trail.json`, published beside this archive and signed with the release key (`ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r4.trail.json.sigstore`), and readable at https://readystack.dev/products/nextcloud/trail/v35.0.3-CE-ubuntu24.04-r4.

