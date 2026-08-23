# IoT-Telemetry CI Pipeline with GitHub Actions

# Overview
The CI configuration file is located at `.github/workflows/ci.yaml`.

## Trigger
- Pull requests to the `develop` branch

## Workflow Job: `scan`
- **Runner**: `ubuntu-latest`
- **Steps**:
  - Checkout code using `actions/checkout@v4`