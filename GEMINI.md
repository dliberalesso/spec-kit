# GEMINI.md - Project Context for `spec-kit`

This document provides essential context for the `spec-kit` repository, which contains the `specify-cli` tool. The goal is to help an AI assistant understand the project's purpose, architecture, and development conventions.

## 1. Project Overview

**`spec-kit`** is a toolkit that implements **Spec-Driven Development (SDD)**, a methodology that inverts the traditional software development process. Instead of specifications being static documents that guide manual coding, SDD makes specifications executable artifacts that directly generate code. The core philosophy is to close the gap between *intent* and *implementation*.

The primary component of this repository is the **`specify-cli`**, a Python-based command-line tool that bootstraps projects for SDD.

### Key Concepts:

*   **Spec-Driven Development (SDD):** A development workflow where the specification is the primary source of truth, and code is a generated output. The process is iterative and relies heavily on AI to translate high-level requirements into technical plans and then into functional code.
*   **`specify-cli`:** The main tool in this repo. Its `init` command sets up a new project with the necessary templates, scripts, and AI agent configurations.
*   **AI Agent Agnosticism:** A core architectural feature. The `specify-cli` is designed as a framework to support various AI coding assistants (e.g., Gemini, Claude, GitHub Copilot). It achieves this by generating agent-specific command files (e.g., TOML for Gemini, Markdown for Claude) and directory structures (`.gemini/`, `.claude/`). This is formalized in the project's constitution.
*   **Slash Commands:** Once a project is initialized, developers use a series of slash commands within their chosen AI agent to follow the SDD workflow:
    1.  `/constitution`: Establish project-wide principles and constraints.
    2.  `/specify`: Define the feature's requirements (the "what" and "why").
    3.  `/clarify`: Allow the AI to ask questions to resolve ambiguities.
    4.  `/plan`: Define the technical implementation strategy (the "how," including tech stack).
    5.  `/tasks`: Break the plan into a detailed, actionable list of tasks.
    6.  `/analyze`: Perform a non-destructive cross-artifact consistency and quality analysis.
    7.  `/implement`: Execute the tasks to generate the application code.
*   **Constitution & Workflow:** Development within a generated project is guided by a `/constitution` command that establishes project-wide principles. This ensures a structured, repeatable workflow from specification to implementation.

## 2. Building and Running

`specify-cli` is a Python application built with `Typer` and `Rich`.

### Installation (for users)

The tool is intended to be installed from the git repository using `uv`:

```bash
# Recommended installation
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# One-time execution
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME>
```

### CLI Commands

The tool exposes two main commands:

*   `specify init <name>`: Initializes a new project. It interactively prompts for the desired AI agent and script type (`sh` or `ps`), then downloads the corresponding template from the GitHub releases.
*   `specify check`: Verifies that necessary tools (like `git`, `gemini`, `claude`, etc.) are installed on the local machine.

### Development

This is a standard Python project using `hatchling` as the build backend. The main application logic is located in `src/specify_cli/__init__.py`. Dependencies are listed in `pyproject.toml`. There are no complex build scripts; standard Python tooling applies.

## 3. Development Conventions

*   **Adding New AI Agents:** This is a primary development workflow. The process is documented in detail in `AGENTS.md`. It involves:
    1.  Updating the `AI_CHOICES` dictionary in `src/specify_cli/__init__.py`.
    2.  Updating the release packaging script (`.github/workflows/scripts/create-release-packages.sh`) to create a new template zip for the agent.
    3.  Updating the agent context scripts (`scripts/bash/update-agent-context.sh` and its PowerShell equivalent).
    4.  Adding a tool check to the `check` command if the agent has an associated CLI.
*   **Versioning:** Any change to `src/specify_cli/__init__.py` requires a version increment in `pyproject.toml` and an entry in `CHANGELOG.md`.
*   **Release Process:** The release process is automated via GitHub Actions in `.github/workflows/release.yml`. This workflow uses several shell scripts located in `.github/workflows/scripts/` to package the agent-specific templates and create a GitHub release.
*   **Code Style:** The code is clean, well-commented, and follows standard Python conventions. It makes heavy use of the `Typer` and `Rich` libraries for its CLI interface.
