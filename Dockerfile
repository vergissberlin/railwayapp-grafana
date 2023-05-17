ARG GF_VERSION=latest

FROM grafana/grafana-oss:${GF_VERSION}

ENV \
    GF_INSTALL_PLUGINS=grafana-piechart-panel,grafana-worldmap-panel,grafana-clock-panel,grafana-simple-json-datasource
