ARG VERSION=13.0.2

FROM grafana/grafana-oss:${VERSION}

# grafana-piechart-panel, grafana-worldmap-panel and grafana-simple-json-datasource are Angular plugins; Grafana 11+ refuses to
# load them ("angular plugins are not supported"), so only Angular-free plugins are preinstalled.
# GF_INSTALL_PLUGINS is deprecated in favour of GF_PLUGINS_PREINSTALL.
#
# GF_LOG_FILTERS=migrator:warn: the first boot runs ~700 SQLite migrations and
# logs each one at info level. On Railway that burst hits the log rate limit
# ("Messages dropped"), which can hide real errors. Migration warnings/errors
# still show up. Override via a Railway variable (e.g. migrator:info).
ENV \
    GF_PLUGINS_PREINSTALL=grafana-clock-panel \
    GF_LOG_FILTERS=migrator:warn

# The entrypoint needs root to fix ownership of the Railway volume before
# handing over to UID 472. Installing packages requires root as well.
USER root

# su-exec on the Alpine variant (default), gosu on the -ubuntu variant. Both
# replace the process instead of forking, so no root process reaches runtime.
RUN if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache su-exec; \
    else \
        apt-get update && \
        apt-get install -y --no-install-recommends gosu && \
        rm -rf /var/lib/apt/lists/*; \
    fi

# Grafana 13 ships some data sources (e.g. Elasticsearch) as bundled plugins in
# /usr/share/grafana/data/plugins-bundled and auto-updates them on startup. The
# upstream image leaves that tree owned by root, so the update fails with
# "unlinkat .../plugin.json: permission denied" after the old plugin process has
# already been stopped, leaving the data source unregistered. Hand the tree to
# UID 472 / GID 0 (same fix as grafana/grafana#127770). This only touches the
# image, never the /var/lib/grafana volume.
RUN if [ -d /usr/share/grafana/data/plugins-bundled ]; then \
        chown -R 472:0 /usr/share/grafana/data/plugins-bundled && \
        chmod -R ug+rwX /usr/share/grafana/data/plugins-bundled; \
    fi

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/run.sh"]
