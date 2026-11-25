# Nextcloud: ReadyStack build kit

The offline build kit for the Docker image `readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r3`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v35.0.3-CE-ubuntu24.04-r3](https://github.com/readystack-dev/nextcloud/releases/tag/v35.0.3-CE-ubuntu24.04-r3)
- Image: [`docker.io/readystack/nextcloud:v35.0.3-CE-ubuntu24.04-r3`](https://hub.docker.com/r/readystack/nextcloud/tags), manifest digest `sha256:81b3e2e48294362cd549f58b5b960db9496caaaca1f17d6c1e127e5b9208fadc`
- Product page: https://readystack.dev/products/nextcloud
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=nextcloud

Nextcloud is distributed under its upstream licence (AGPL-3.0-or-later); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v35.0.3-CE-ubuntu24.04-r3 release](https://github.com/readystack-dev/nextcloud/releases/tag/v35.0.3-CE-ubuntu24.04-r3): `ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r3.tar.gz` (371.0 MB), SHA-256 `cc86320d653782f5385e82812b8436fb357d930c941182ea08c155e69f4a47ec`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r3.rebuild.json.sigstore ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r3.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r3.tar.gz
cd v35.0.3-CE-ubuntu24.04-r3
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-nextcloud-v35.0.3-CE-ubuntu24.04-r3.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/nextcloud/recipe. The complete kit is the release download. Each release is a tag here.
