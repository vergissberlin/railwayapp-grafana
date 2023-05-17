ARG GRAFANA_VERSION=latest

FROM grafana/grafana-oss:${GRAFANA_VERSION}

ENV \
    PORT=3000 \
    GF_INSTALL_PLUGINS=grafana-piechart-panel,grafana-worldmap-panel,grafana-clock-panel,grafana-simple-json-datasource
