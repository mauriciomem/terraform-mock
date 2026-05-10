#!/usr/bin/env bash
# Bootstrap script — runs on first instance startup
# Referenced as a data source in data.tf

set -euo pipefail

echo "Bootstrapping environment: ${ENVIRONMENT:-unknown}"
echo "Region: ${REGION:-us-east-1}"

# Install dependencies (mock)
echo "Installing application dependencies..."
# apt-get install -y my-app || yum install -y my-app

echo "Bootstrap complete."
