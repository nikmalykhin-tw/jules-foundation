# Jules Foundation Project

This repository is an experiment in using a GenAI assistant, "Jules," to develop a project from a predefined set of user stories. The goal is to collaborate with Jules to build out the application, with varying levels of human intervention across different parts of the stack.

- **Repository:** `https://github.com/nikmalykhin-tw/jules-foundation` 
- **Project Board:** `https://github.com/users/nikmalykhin-tw/projects/1` 

## Project Starting Point

The project was initiated as a starting point for Jules to begin work. The initial setup is as follows:
- A set of user stories has been created and added as issues to the project board.
- These stories are grouped into three distinct categories: Backend (BE), Frontend (FE), and CI/CD.
- The repository has been populated with a basic structure, including folders for BE and FE, initial documentation, and a specific set of rules for Jules to follow.

## The Plan & Workflow

The original idea is to follow a collaborative workflow with Jules:

1.  **Backend (BE)**: Jules will start and complete all backend tasks. The only human intervention will be to review the completed work.
2.  **Frontend (FE)**: Jules will begin the frontend development. A human developer will  implement next task using Copilot. And then let Jules continue with the rest of the tasks, followed by another review.
3.  **CI/CD**: A human developer will start the CI/CD tasks, and Jules will be responsible for continuing and completing them.

## Core Assumption

The fundamental assumptions for this project are:

1.  **Jules will follow the provided rules.** These rules were created based on the principles of the "clean architect book".
2.  **The user stories were created with AI support.** Early experiments in the project involved using GenAI to help write better user stories. More details on this process can be found here: [How GenAI helps engineers write better stories](https://nik1379616.substack.com/p/how-genai-helps-engineers-write-better).