#!/bin/bash
set -e

echo "Running Testcontainers integration tests..."
./backend/gradlew --project-dir backend integrationTest

echo "Running Detekt (static analysis)..."
./backend/gradlew --project-dir backend detekt

echo "Running Gitleaks (secrets scan)..."
if ! command -v gitleaks &> /dev/null; then
  echo "Gitleaks not found. Please install it: https://github.com/gitleaks/gitleaks"
  exit 1
fi
gitleaks detect --source . --no-git --redact

echo "Running Gradle dependency check..."
./backend/gradlew --project-dir backend dependencyCheckAnalyze

echo "Pre-push checks passed."echo "Running Testcontainers integration tests..."
./backend/gradlew integrationTest

echo "Running Detekt (static analysis)..."
./backend/gradlew detekt

echo "Running Gitleaks (secrets scan)..."
if ! command -v gitleaks &> /dev/null; then
  echo "Gitleaks not found. Please install it: https://github.com/gitleaks/gitleaks"
  exit 1
fi
gitleaks detect --source . --no-git --redact

echo "Running Gradle dependency check..."
./backend/gradlew dependencyCheckAnalyze

echo "Pre-push checks passed."