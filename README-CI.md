# IoT-Telemetry CI Pipeline with GitHub Actions

# Overview
The CI configuration file is located at `.github/workflows/ci.yaml`.

## Trigger
- Pull requests to the `develop` branch

## Workflow Job: `sonarqube`
- **Runner**: `ubuntu-latest`
- **Steps**:
  - Checkout code using `actions/checkout@v4` (with `fetch-depth: 0` for full history)
  - Run SonarQube scan using `SonarSource/sonarqube-scan-action@v8.1.0`
  - Requires `SONAR_TOKEN` secret to be set in the repository