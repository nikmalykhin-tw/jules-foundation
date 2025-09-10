#!/bin/bash
set -e

echo "Running Testcontainers integration tests..."
(cd backend && ./gradlew integrationTest)

echo "Running Detekt (static analysis)..."
(cd backend && ./gradlew detekt)

echo "Running Gitleaks (secrets scan)..."
if ! command -v gitleaks &> /dev/null; then
  echo "Gitleaks not found. Please install it: https://github.com/gitleaks/gitleaks"
  exit 1
fi
gitleaks detect --source . --no-git --redact

echo "Running Gradle dependency check..."
(cd backend && ./gradlew dependencyCheckAnalyze)

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