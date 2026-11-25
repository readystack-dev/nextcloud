#!/bin/sh
set -e
cd /var/www/html
# config/ and data/ are writable by the non-root www-data user (chowned at build).
# NOTHING is baked into the shipped image. If the operator supplies an admin user+pass
# (the upstream-image semantics, used by the build self-test), auto-install with the
# default embedded SQLite database; otherwise serve the web setup wizard (/status.php is
# 200 either way). Customers may instead point at external MySQL/PostgreSQL via occ env.
if [ -n "$NEXTCLOUD_ADMIN_USER" ] && [ -n "$NEXTCLOUD_ADMIN_PASSWORD" ]; then
  if ! php occ status 2>/dev/null | grep -q 'installed: true'; then
    php occ maintenance:install \
      --database sqlite \
      --data-dir "${NEXTCLOUD_DATA_DIR:-/var/www/html/data}" \
      --admin-user "$NEXTCLOUD_ADMIN_USER" \
      --admin-pass "$NEXTCLOUD_ADMIN_PASSWORD"
  fi
fi
if [ -n "$NEXTCLOUD_TRUSTED_DOMAINS" ]; then
  i=1
  for d in $NEXTCLOUD_TRUSTED_DOMAINS; do
    php occ config:system:set trusted_domains "$i" --value="$d" || true
    i=$((i+1))
  done
fi
exec apache2-foreground
