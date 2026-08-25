# IoT and Telemetry

Project designed to retrieve sensor data via MQTT and expose them through an API and a customized web interface.

## Architecture & Infrastructure

- **Eclipse Mosquitto (MQTT Broker)**: Containerized broker running `eclipse-mosquitto:2.1.2-alpine`.
  - Port `1883`: MQTT (unencrypted)
  - Port `8883`: MQTTS (encrypted / TLS)
  - Port `9001`: WebSockets
- **InfluxDB 2 (Time-Series Database)**: Containerized time-series database running `influxdb:2` for storing telemetry metrics.
  - Port `8086`: HTTP API & Web UI (`http://localhost:8086`)
  - Initialized with Organization `iot-telemetry` and Bucket `init-bucket` using Docker secrets.
- **Node-RED (Optional / Prepared)**: Included in `docker-compose.yaml` (commented by default) for testing, flow creation, and visualization of MQTT messages.

## Getting Started

### Prerequisites

- [Docker Engine](https://docs.docker.com/get-docker/) & Docker Compose
- `make` utility

### Running the Services

To automatically start the Docker containers:

```bash
make create-containers
```

Alternatively, standard Docker Compose commands can be used:

```bash
docker compose -f docker-compose.yaml up -d
```

To display available Make commands:

```bash
make help
```

## Repository Structure

```text
.
├── .github/workflows/ci.yaml     # GitHub Actions CI workflow (SonarQube analysis)
├── docker-compose.yaml           # Docker Compose definition for Mosquitto & InfluxDB 2
├── influxdb2-volume/             # Credentials and token secrets for InfluxDB 2
│   ├── influxdb2-admin-username  # Secret: Admin username
│   ├── influxdb2-admin-password  # Secret: Admin password
│   └── influxdb2-admin-token     # Secret: Admin token
├── Makefile                      # Command shortcuts (e.g., container management)
├── mosquitto-volume/             # Persistent volume directory for Mosquitto
│   ├── config/                   # Mosquitto configuration file (mosquitto.conf)
│   ├── data/                     # MQTT persistent data
│   └── log/                      # Mosquitto log files
├── sonar-project.properties      # SonarQube configuration file
├── README-CI.md                  # Detailed documentation for CI pipeline
└── README.md                     # Main project documentation
```

## CI/CD Pipeline

Continuous Integration is managed via GitHub Actions (`.github/workflows/ci.yaml`). Triggers on pull requests to the `develop` branch and performs code quality scans using SonarQube. For more details, see [README-CI.md](./README-CI.md).
