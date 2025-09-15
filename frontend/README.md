# Jules Foundation – Frontend

This is the frontend for the Jules Foundation project, built with Vite, Tailwind CSS, and Alpine.js.

---

## Overview

- **Stack:** HTML, Tailwind CSS (via CDN), Alpine.js (via CDN), Vite (for development server and proxy).
- **Entry point:** `frontend/index.html`
- **Vite Configuration:** `frontend/vite.config.js`

---

## Prerequisites

- Node.js (LTS version recommended)
- npm (usually comes with Node.js)

---

## Running the App (Development)

This project uses [Vite](https://vitejs.dev/) for a fast development experience.

1.  **Install dependencies:**
    Navigate to the `frontend` directory and run:
    ```sh
    npm install
    ```

2.  **Start the development server:**
    ```sh
    npm run dev
    ```

The app will start at [http://localhost:3000](http://localhost:3000).

### Backend Connection

The Vite development server is configured to proxy API requests to the backend. Any request made from the frontend to `/api` will be forwarded to `http://localhost:8080`.

**Important:** The backend service must be running for the frontend to function correctly.

---

## Building for Production

To create a production-ready build, run:

```sh
npm run build
```

The output will be in the `frontend/dist` directory. This is for information only, as the current setup is focused on development.
