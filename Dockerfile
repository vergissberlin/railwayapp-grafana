ARG VERSION=latest

FROM grafana/grafana-oss:${VERSION}

# grafana-piechart-panel, grafana-worldmap-panel and grafana-simple-json-datasource are Angular plugins; Grafana 11+ refuses to
# load them ("angular plugins are not supported"), so only Angular-free plugins are preinstalled.
# GF_INSTALL_PLUGINS is deprecated in favour of GF_PLUGINS_PREINSTALL.
ENV \
    GF_PLUGINS_PREINSTALL=grafana-clock-panel

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

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/run.sh"]
