#!/bin/bash
set -e

echo "Running Testcontainers integration tests..."
./gradlew integrationTest

echo "Running Detekt (static analysis)..."
./gradlew detekt

echo "Running Gitleaks (secrets scan)..."
if ! command -v gitleaks &> /dev/null; then
  echo "Gitleaks not found. Please install it: https://github.com/gitleaks/gitleaks"
  exit 1
fi
gitleaks detect --source . --no-git --redact

echo "Running Gradle dependency check..."
./gradlew dependencyCheckAnalyze

echo "Pre-push checks passed."