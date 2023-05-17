FROM grafana/grafana-oss:latest

ENV \
    PORT 3000 \
    GF_INSTALL_PLUGINS=grafana-piechart-panel,grafana-worldmap-panel,grafana-clock-panel,grafana-simple-json-datasource
