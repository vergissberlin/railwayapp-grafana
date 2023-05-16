# Grafana for railway.app

Deploy Grafana  Community Edition on railway with one click.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/anURAt?referralCode=2_sIT9)

## ✨ Features

* Grafana with automated setup
* Grafana UI
* Password Authentication (Set username & password in environment variables)

## 🐍 How to Deploy

1. Click Deploy on Railway and setup your credentials in the environment variables

```bash
GF_DEFAULT_INSTANCE_NAME=my-instance
GF_SECURITY_ADMIN_USER=owner
GF_LOG_MODE=console
PORT=3000 # Don't change this
```

2. Wait for Build & Deployment to Finish
3. Open the custom URL an enter your credentials

## 👩‍💻 How to Use

1. When you configure your Grafana connection, use your custom URL as the host but be aware that **the port is 443**! Example: `https://demo-grafana.up.railway.app:443`.
2. Use the token in the environment variables to authenticate
3. Setup bucket name and organization name in the environment variables
4. Use grafana version 2.0 or above

## 🐳  Local Development

```bash
docker compose build
docker compose up -d
```

Connect to http://localhost:3000 use setup username & password from docker-compose file to login to grafana.
