# Grafana for railway.app

Deploy Grafana  Community Edition on railway with one click.
Grafana is a multi-platform, feature rich metrics dashboard and graph editor for Graphite, InfluxDB & Prometheus. It is most commonly used for visualizing time series data.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/anURAt?referralCode=2_sIT9)

## ✨ Features

* Grafana with automated setup
* Grafana UI
* Password Authentication (Set username & password in environment variables)

## 🐍 How to Deploy

1. Click Deploy on Railway and setup your credentials in the environment variables

```bash
GF_DEFAULT_INSTANCE_NAME=my-instance
GF_SECURITY_ADMIN_USER=yourusername
GF_SECURITY_ADMIN_PASSWORD=yourpassword
GF_INSTALL_PLUGINS=grafana-piechart-panel,grafana-worldmap-panel,grafana-clock-panel,grafana-simple-json-datasource
GF_LOG_MODE=console
GF_VERSION=latest
PORT=3000
```

2. Wait for Build & Deployment to Finish
3. Open the custom URL an enter your credentials

## 👩‍💻 How to Use

1. When you configure your Grafana connection, use your custom URL as the host.
2. Use the token in the environment variables to authenticate
3. Setup bucket name and organization name in the environment variables
4. Use grafana version 2.0 or above

## 🪲 Bug Reporting

If you find a bug in the template for railway, you can [submit an issue](https://github.com/vergissberlin/railwayapp-grafana/issues/new) to the GitHub Repository. Even better you can submit a Pull Request with a fix.

## 🐳  Local Development

```bash
docker compose build
docker compose up -d
```

Connect to http://localhost:3000 use setup username & password from docker-compose file to login to grafana.
