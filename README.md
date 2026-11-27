[![ReadyStack](https://readystack.dev/logo.svg)](https://readystack.dev)

**Stable, Open-source Releases, Automated** · [readystack.dev](https://readystack.dev)

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-readystack%2Fnextcloud-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/readystack/nextcloud) [![Docker pulls](https://img.shields.io/docker/pulls/readystack/nextcloud)](https://hub.docker.com/r/readystack/nextcloud) [![Grade at release](https://img.shields.io/badge/grade%20at%20release-A%20%2894%25%29-2ea44f)](https://readystack.dev/products/nextcloud) [![Signed: cosign](https://img.shields.io/badge/signed-cosign-2ea44f)](https://readystack.dev/keys/cosign.pub) ![SBOM: SPDX](https://img.shields.io/badge/SBOM-SPDX-2ea44f) ![Provenance: SLSA v1](https://img.shields.io/badge/provenance-SLSA%20v1-2ea44f) ![Offline rebuild: verified](https://img.shields.io/badge/offline%20rebuild-verified-2ea44f)

# Nextcloud: ReadyStack build kit

The offline build kit for the Docker image `readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r6`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v35.0.3-CE-ubuntu24.04-r6](https://github.com/readystack-dev/nextcloud/releases/tag/v35.0.3-CE-ubuntu24.04-r6)
- Image: [`docker.io/readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r6`](https://hub.docker.com/r/readystack/nextcloud/tags), manifest digest `sha256:6d9415310fe98936feabe51f1120306851ecaa56f07b13b94af843bd7801d403`
- Product page: https://readystack.dev/products/nextcloud
- Source and build recipe: https://readystack.dev/products/nextcloud/recipe
- Build trail: https://readystack.dev/products/nextcloud/trail/v35.0.3-CE-ubuntu24.04-r6
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=nextcloud

## The image

Single container (Apache + mod_php, one foreground process) running Nextcloud Server. SELF-CONTAINED: the database is a self-managed EMBEDDED SQLite file (owncloud.db) under /var/www/html/data — the image IS the complete running instance, no external DB and no sidecar required. (The image contains only the SQLite database driver; it cannot be pointed at an external MySQL/MariaDB or PostgreSQL database.) NOT a multi-service cluster, NOT docker-compose/Kubernetes-only.

## Who uses Nextcloud and why

Households, companies and public organisations that want file sync and sharing, calendars and contacts on a server they choose.

Nextcloud stores files, contacts and calendars on your own server, keeps them in sync across devices, and lets you share them, with apps such as calendar, mail and video chat.

A typical use: A small firm wants its documents off personal laptops and in one place it controls. With Nextcloud each person's files sync between the server and their devices, projects get shared folders, and a client gets access to just the files meant for them.

From the upstream project's own description: https://github.com/nextcloud/server.

## This release

- Docker Scout policy grade at release: **A** (94%), graded 2026-11-27 with `docker scout policy` (CLI 1.26.0, docker-default configuration).
  - Docker Scout counts 140 packages with copyleft licences (AGPL, GPL, LGPL, MPL), 135 of them operating-system packages (it counts only packages whose licence it can read; the SBOM lists every component). AGPL: icewind/searchdav, nextcloud/lognormalizer.
- Signed with ReadyStack's release key (fingerprint `04daa92344a52dbc`): https://readystack.dev/keys/cosign.pub.
- Runs as a non-root user (`www-data`).
- Attestations on the image: an SPDX SBOM and SLSA provenance v1.
- Rebuilt from this kit with network egress blocked on 2026-11-27; the rebuilt image digest is the published one.
- Base: Ubuntu 24.04.

The current grade, measured again every day, is on https://readystack.dev/products/nextcloud.

Nextcloud is distributed under its upstream licence (AGPL-3.0-or-later); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v35.0.3-CE-ubuntu24.04-r6 release](https://github.com/readystack-dev/nextcloud/releases/tag/v35.0.3-CE-ubuntu24.04-r6): `ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r6.tar.gz` (371.0 MB), SHA-256 `ce69ad1348db74fa28a3219b7141d28394ae6b746338a407b8ce42c5bd3839d2`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r6.rebuild.json.sigstore ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r6.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r6.tar.gz
cd v35.0.3-CE-ubuntu24.04-r6
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r6.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/nextcloud/recipe. The complete kit is the release download. Each release is a tag here. How to report a vulnerability: [SECURITY.md](SECURITY.md).

## About ReadyStack

**Stable, Open-source Releases, Automated.** ReadyStack releases popular open-source apps every week with every available critical and high security fix applied, plus full documentation, reference data, tests and a build recipe that recreates each release bit-for-bit. Each release is rebuilt from its pinned inputs with the network off, checked against its published digest, signed, and scanned and graded again every day. The images and build kits are free, and ReadyStack is soon to be a nonprofit.

[readystack.dev](https://readystack.dev) · [All products](https://readystack.dev/products.html) · [Build kits on GitHub](https://github.com/readystack-dev) · [Defect log](https://readystack.dev/defects.html) · contact@readystack.dev

— ReadyStack · https://readystack.dev
