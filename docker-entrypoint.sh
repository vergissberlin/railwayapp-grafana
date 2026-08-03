#!/bin/sh
#
# Entrypoint wrapper for Railway deployments.
#
# Railway mounts volumes as root:root, while the upstream Grafana image runs as
# UID 472. Without this wrapper, Grafana cannot write to a mounted
# /var/lib/grafana and aborts with "GF_PATHS_DATA is not writable".
#
# The container therefore starts as root, fixes ownership of the mount, and then
# hands over to UID 472 via exec. Because it is an exec (not a fork), no root
# process survives into runtime -- Grafana itself never runs privileged.
#
set -eu

GF_UID=472
GF_GID=0

GF_PATHS_DATA="${GF_PATHS_DATA:-/var/lib/grafana}"
GF_PATHS_PLUGINS="${GF_PATHS_PLUGINS:-${GF_PATHS_DATA}/plugins}"

# Railway injects PORT; Grafana expects GF_SERVER_HTTP_PORT. An explicitly
# configured GF_SERVER_HTTP_PORT always wins.
GF_SERVER_HTTP_PORT="${GF_SERVER_HTTP_PORT:-${PORT:-3000}}"
export GF_SERVER_HTTP_PORT

# Pick whichever privilege-dropping helper the base image variant provides:
# su-exec on Alpine (default), gosu on the -ubuntu variant.
drop_privileges() {
    if command -v su-exec >/dev/null 2>&1; then
        exec su-exec "${GF_UID}:${GF_GID}" "$@"
    elif command -v gosu >/dev/null 2>&1; then
        exec gosu "${GF_UID}:${GF_GID}" "$@"
    fi

    echo "entrypoint: neither su-exec nor gosu found, cannot drop privileges" >&2
    exit 1
}

if [ "$(id -u)" -ne 0 ]; then
    # Already unprivileged (e.g. a runtime that ignores the image USER).
    # Nothing to fix up -- if the volume is misowned, Grafana will report it.
    exec "$@"
fi

mkdir -p "${GF_PATHS_DATA}" "${GF_PATHS_PLUGINS}"

# chown -R on every boot would rewrite the whole volume, which grows expensive
# as dashboards and plugins accumulate. The recursive pass only runs when the
# mount root is still misowned, i.e. on the first boot after a volume is added.
if [ "$(stat -c %u "${GF_PATHS_DATA}")" != "${GF_UID}" ]; then
    echo "entrypoint: taking ownership of ${GF_PATHS_DATA} for uid ${GF_UID}"
    chown -R "${GF_UID}:${GF_GID}" "${GF_PATHS_DATA}"
fi

# Plugins may live outside GF_PATHS_DATA when GF_PATHS_PLUGINS is overridden.
case "${GF_PATHS_PLUGINS}" in
    "${GF_PATHS_DATA}"/*) ;;
    *)
        if [ "$(stat -c %u "${GF_PATHS_PLUGINS}")" != "${GF_UID}" ]; then
            chown -R "${GF_UID}:${GF_GID}" "${GF_PATHS_PLUGINS}"
        fi
        ;;
esac

drop_privileges "$@"
