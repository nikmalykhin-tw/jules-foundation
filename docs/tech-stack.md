## Backend Stack

### Core Technologies
- **Language**: Kotlin 1.8+
- **Framework**: Micronaut 3.x
- **Database**: PostgreSQL 14+
- **ORM**: Micronaut Data JDBC

### Security & Authentication
- **Authentication**: Micronaut Security with JWT (stateless)
- **Password Hashing**: BCrypt
- **Session Management**: Stateless (JWT-based)

### Additional Libraries & Tools
- **Validation**: Micronaut Validation
- **API Documentation**: Micronaut OpenAPI (Swagger)
- **Database Migration**: Flyway

### Testing
- **Unit & Integration**: Kotest + Micronaut Test
- **Real DB Testing**: Testcontainers (PostgreSQL)

---

## Frontend Stack

### Core Technologies
- **Markup**: HTML5
- **Styling**: Tailwind CSS (utility-first, mobile-first responsive design)
- **Interactivity**: Alpine.js (lightweight, declarative reactive behavior)
- **Build Tool**: Vite (optional, for fast development and modular structure)

### Authentication Support
- **Form Handling**: Native HTML forms
- **API Communication**: fetch for POST/GET requests to backend
- **Token Storage**: localStorage (stateless JWT-based auth)

### Additional Tools & Practices
- **Validation**: Native input constraints + Alpine.js logic
- **Responsiveness**: Mobile-first layout using Tailwind utilities
- **Error Feedback**: Alpine.js for showing/hiding client-side messages
- **Form UX**: Tailwind classes for states (hover, focus, disabled)

### Testing
- **E2E Testing Framework**: Playwright
- **Browser Coverage**:
  - Chromium (Chrome, Edge)
  - Firefox
  - WebKit (Safari)
  - Emulated Mobile (iOS Safari, Android Chrome)
- **Test Types**:
  - Form behavior and validation
  - API interaction (e.g., login/register flow)
  - Mobile vs desktop layout rendering

---

## Linters

### Backend
- **Ktlint**  
  **Purpose**: Ensures consistent Kotlin code style and formatting.
  
- **Detekt**  
  **Purpose**: Static analysis to detect bugs, code smells, and complexity in Kotlin.

### Frontend Linters
- **Prettier**  
  **Purpose**: Automatically formats JavaScript, HTML, CSS, etc., to a consistent style.
  
- **ESLint**  
  **Purpose**: Analyzes code for potential bugs, quality issues, and best practices violations.