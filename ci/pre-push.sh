#!/bin/bash
set -e

# Navigate to the backend directory to run Gradle commands
cd backend

echo "Running Detekt (static analysis)..."
./gradlew detekt

# Navigate back to the root for Gitleaks
cd ..

echo "Running Gitleaks (secrets scan)..."
if ! command -v gitleaks &> /dev/null; then
  echo "Gitleaks not found. Please install it: https://github.com/gitleaks/gitleaks"
  exit 1
fi
gitleaks detect --source . --no-git --redact

# Navigate back to the backend directory for the final Gradle command
cd backend

echo "Running Gradle dependency check..."
./gradlew dependencyCheckAnalyze

echo "Pre-push checks passed."
