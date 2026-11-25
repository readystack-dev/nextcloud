# Nextcloud: ReadyStack build kit

The offline build kit for the Docker image `readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r4`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v35.0.3-CE-ubuntu24.04-r4](https://github.com/readystack-dev/nextcloud/releases/tag/v35.0.3-CE-ubuntu24.04-r4)
- Image: [`docker.io/readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r4`](https://hub.docker.com/r/readystack/nextcloud/tags), manifest digest `sha256:605031a111886b3ea686ffe9311ed67605436fb17128739db38590b9035188d1`
- Product page: https://readystack.dev/products/nextcloud
- Source and build recipe: https://readystack.dev/products/nextcloud/recipe
- Build trail: https://readystack.dev/products/nextcloud/trail/v35.0.3-CE-ubuntu24.04-r4
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=nextcloud

## The image

Single container (Apache + mod_php, one foreground process) running Nextcloud Server. SELF-CONTAINED: the database is a self-managed EMBEDDED SQLite file (owncloud.db) under /var/www/html/data — the image IS the complete running instance, no external DB and no sidecar required. (The image contains only the SQLite database driver; it cannot be pointed at an external MySQL/MariaDB or PostgreSQL database.) NOT a multi-service cluster, NOT docker-compose/Kubernetes-only.

## Who uses Nextcloud and why

Households, companies and public organisations that want file sync and sharing, calendars and contacts on a server they choose.

Nextcloud stores files, contacts and calendars on your own server, keeps them in sync across devices, and lets you share them, with apps such as calendar, mail and video chat.

A typical use: A small firm wants its documents off personal laptops and in one place it controls. With Nextcloud each person's files sync between the server and their devices, projects get shared folders, and a client gets access to just the files meant for them.

From the upstream project's own description: https://github.com/nextcloud/server.

## This release

- Docker Scout policy grade at release: **A** (94%), graded 2026-11-25 with `docker scout policy` (CLI 1.26.0, docker-default configuration).
  - Docker Scout counts 140 packages with copyleft licences (AGPL, GPL, LGPL, MPL), 135 of them operating-system packages (it counts only packages whose licence it can read; the SBOM lists every component). AGPL: icewind/searchdav, nextcloud/lognormalizer.
- Signed with ReadyStack's release key (fingerprint `04daa92344a52dbc`): https://readystack.dev/keys/cosign.pub.
- Runs as a non-root user (`www-data`).
- Attestations on the image: an SPDX SBOM and SLSA provenance v1.
- Rebuilt from this kit with network egress blocked on 2026-11-25; the rebuilt image digest is the published one.
- Base: Ubuntu 24.04.

The current grade, measured again every day, is on https://readystack.dev/products/nextcloud.

Nextcloud is distributed under its upstream licence (AGPL-3.0-or-later); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v35.0.3-CE-ubuntu24.04-r4 release](https://github.com/readystack-dev/nextcloud/releases/tag/v35.0.3-CE-ubuntu24.04-r4): `ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r4.tar.gz` (370.9 MB), SHA-256 `8b29f6350623f486ea8dd97167dce709b8869e088b11f33ecb084246cb8b5093`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r4.rebuild.json.sigstore ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r4.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r4.tar.gz
cd v35.0.3-CE-ubuntu24.04-r4
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r4.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/nextcloud/recipe. The complete kit is the release download. Each release is a tag here.

— ReadyStack · https://readystack.dev
