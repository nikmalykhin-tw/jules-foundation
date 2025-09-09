## Local CI Flow

CI automates checks (such as linting, formatting, and tests) before committing code. 
Using [pre-commit](https://pre-commit.com/) hooks, it ensures consistent code quality and adherence to best practices across the team, catching potential issues early in the development process.

### Pre-commit Hook:
1. **Testing:**
    - **Unit/Integration Testing:**
        - **Kotest**: Runs unit tests for backend code.
2. **Formatting & Linting:**
    - **Prettier**: Formats JavaScript, HTML, CSS, etc.
    - **Ktlint**: Ensures Kotlin code style and formatting.

### Pre-push Hook:
1. **Testing:**
    - **Unit/Integration Testing:**
        - **Testcontainers**: Performs integration testing with a real PostgreSQL database.
    - **End-to-End (E2E) Testing:**
        - **Playwright**: Runs E2E tests for frontend features (e.g., form behavior, API interaction).
2. **Formatting & Linting:**
    - **ESLint**: Checks JavaScript/TypeScript for errors and best practices.
    - **Detekt**: Static analysis for Kotlin code (e.g., bug detection, code smells).
3. **Security:**
    - **Gitleaks**: Scans for secret leaks (API keys, passwords, etc.) in your codebase.
    - **Dependency Checks**: Gradle’s `dependencyCheckAnalyze`: Scans dependencies for vulnerabilities.

---

## Local CD Flow

CD is managed by a shell script that builds Docker images with Podman, then launches services using Podman Compose. 
It checks container health after starting the backend, frontend, and PostgreSQL. If any service fails, the script exits, ensuring a production-like environment locally.
### 1. **Pre-commit Hooks in a Podman Container**
- The shell script starts by running pre-commit hooks inside a Podman container.
- The container mounts the project directory.
- It installs `pre-commit` and runs the hooks defined in `.pre-commit-config.yaml`.
- If any check fails, the script exits, preventing further steps.

### 2. **Build Images with Podman**
- The script builds **backend** and **frontend** images using `podman build`.

### 3. **Run Podman Compose**
- The script launches all services using `podman-compose up`:
    - **Backend**
    - **Frontend**
    - **PostgreSQL** (with persistent storage)

### 4. **Check Container Health**
- After launching services, the script inspects the health status of containers:
    - Each service must define a `HEALTHCHECK` in its Dockerfile.
    - The script polls `podman inspect` until containers report as healthy.
    - If any container becomes unhealthy or fails inspection, the script exits with an error.

### 5. **Networking & Isolation**
- Podman Compose ensures containers are networked and isolated, replicating a production-like setup locally.