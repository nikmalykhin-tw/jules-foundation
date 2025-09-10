# Jules Foundation – Backend

This is the backend service for the Jules Foundation project.

---

## Overview

- **Stack:** Kotlin (Micronaut), Micronaut Data JDBC, JWT-based stateless auth, Flyway migrations.
- **Entry point:** `backend/src/main/kotlin/jules/foundation/Application.kt`
- **Controllers:** `backend/src/main/kotlin/jules/foundation/controller/`
- **Tests:** `backend/src/test/kotlin/jules/foundation/`

---

## Prerequisites

- Java 17+ (`brew install openjdk@17`)
- `pre-commit` for hooks (`brew install pre-commit`)
- No need to install Gradle (use `./gradlew`)

---

## Running the App (Mac OS Terminal)

Start the backend:

```sh
./gradlew run
```

The app will start at [http://localhost:8080](http://localhost:8080).

---

## Pre-commit & Pre-push Hooks

This repository uses [pre-commit](https://pre-commit.com/) to enforce code quality and run tests before commits and pushes.

### Setup

```sh
brew install pre-commit
pre-commit install
pre-commit install --hook-type pre-push
```

### What the Hooks Do

- **Pre-commit:** Runs Kotest, Prettier, Ktlint.
- **Pre-push:** Runs Testcontainers, Playwright, ESLint, Detekt, Gitleaks, and Gradle dependency checks.

### Run Hooks Manually

```sh
pre-commit run --all-files
ci/pre-push.sh
```

> **Note:**  
> Pre-commit hooks are enforced only if installed locally. If you skip installation, you can commit without running checks.  
> All checks are also enforced in CI/CD (see [`docs/local-ci-cd-flow.md`](../docs/local-ci-cd-flow.md)).

---

## Testing

- Run all backend tests:
  ```sh
  ./gradlew test
  ```

---

## References

- [docs/tech-stack.md](../docs/tech-stack.md)
