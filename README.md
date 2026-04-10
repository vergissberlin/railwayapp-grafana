# Grafana for railway.app

![Template Header](./template-header.svg)


Deploy Grafana  Community Edition on railway with one click.
Grafana is a multi-platform, feature rich metrics dashboard and graph editor for Graphite, InfluxDB & Prometheus. It is most commonly used for visualizing time series data.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/anURAt?referralCode=2_sIT9&utm_medium=integration&utm_source=template&utm_campaign=generic)

Long-form template copy for Railway (description / **Deploy and Host** sections): [RAILWAY.md](RAILWAY.md).

## ✨ Features

* Grafana with automated setup
* Grafana UI
* Password Authentication (Set username & password in environment variables)
* Railway config as code via `railway.toml`

## Production recommendations (Railway)

* Set strong `GF_SECURITY_ADMIN_PASSWORD` in Railway Variables
* Persist `/var/lib/grafana` with a Railway volume
* Keep healthcheck path at `/api/health`
* Restrict plugin list in `GF_INSTALL_PLUGINS` to required plugins only

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

<!-- footer -->
<!-- footer -->

---
[![Airbyte](https://img.shields.io/badge/Airbyte-615EFF?style=for-the-badge&logo=airbyte&logoColor=white)](https://github.com/vergissberlin/railwayapp-airbyte) [![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-017CEE?style=for-the-badge&logo=apacheairflow&logoColor=white)](https://github.com/vergissberlin/railwayapp-airflow) [![CodiMD](https://img.shields.io/badge/CodiMD-0F766E?style=for-the-badge&logo=markdown&logoColor=white)](https://github.com/vergissberlin/railwayapp-codimd) [![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white)](https://github.com/vergissberlin/railwayapp-django) [![Email Service](https://img.shields.io/badge/Email%20Service-2563EB?style=for-the-badge&logo=maildotru&logoColor=white)](https://github.com/vergissberlin/railwayapp-email) [![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)](https://github.com/vergissberlin/railwayapp-fastapi) [![Flask](https://img.shields.io/badge/Flask-3fad48?style=for-the-badge&logo=flask&logoColor=white)](https://github.com/vergissberlin/railwayapp-flask) [![Flowise](https://img.shields.io/badge/Flowise-4F46E5?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://github.com/vergissberlin/railwayapp-flowise) [![GitLab CE](https://img.shields.io/badge/GitLab%20CE-FC6D26?style=for-the-badge&logo=gitlab&logoColor=white)](https://github.com/vergissberlin/railwayapp-gitlab) [![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)](https://github.com/vergissberlin/railwayapp-grafana) [![Home Assistant](https://img.shields.io/badge/Home%20Assistant-18BCF2?style=for-the-badge&logo=homeassistant&logoColor=white)](https://github.com/vergissberlin/railwayapp-homeassistant) [![InfluxDB](https://img.shields.io/badge/InfluxDB-22ADF6?style=for-the-badge&logo=influxdb&logoColor=white)](https://github.com/vergissberlin/railwayapp-influxdb) [![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)](https://github.com/vergissberlin/railwayapp-mongodb) [![Mosquitto MQTT](https://img.shields.io/badge/Mosquitto%20MQTT-3C5280?style=for-the-badge&logo=eclipsemosquitto&logoColor=white)](https://github.com/vergissberlin/railwayapp-mqtt) [![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://github.com/vergissberlin/railwayapp-mysql) [![n8n](https://img.shields.io/badge/n8n-EA4B71?style=for-the-badge&logo=n8n&logoColor=white)](https://github.com/vergissberlin/railwayapp-n8n) [![Node-RED](https://img.shields.io/badge/Node-RED-8F0000?style=for-the-badge&logo=nodered&logoColor=white)](https://github.com/vergissberlin/railwayapp-nodered) [![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://github.com/vergissberlin/railwayapp-nodejs) [![OpenSearch](https://img.shields.io/badge/OpenSearch-005EB8?style=for-the-badge&logo=opensearch&logoColor=white)](https://github.com/vergissberlin/railwayapp-opensearch) [![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://github.com/vergissberlin/railwayapp-postgresql) [![Redis](https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=redis&logoColor=white)](https://github.com/vergissberlin/railwayapp-redis) [![TYPO3 CMS](https://img.shields.io/badge/TYPO3%20CMS-FF8700?style=for-the-badge&logo=typo3&logoColor=white)](https://github.com/vergissberlin/railwayapp-typo3)
