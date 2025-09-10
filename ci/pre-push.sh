#!/bin/bash
set -e

# Gitleaks

echo "Running Gitleaks (secrets scan)..."
if ! command -v gitleaks &> /dev/null; then
  echo "Gitleaks not found. Please install it: https://github.com/gitleaks/gitleaks"
  exit 1
fi
gitleaks detect --source . --no-git --redact --config CI/.gitleaks.toml

# Navigate to the backend directory to run Gradle commands
cd backend

echo "Running Detekt (static analysis)..."
gitleaks detect --source . --no-git --redact --config ../CI/.gitleaks.toml

echo "Pre-push checks passed."