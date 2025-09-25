<!--
---
Sync Impact Report
---
Version: 0.0.0 → 1.0.0
Modified Sections:
  - None.
Added Sections:
  - I. Spec-Driven Development
  - II. AI Agent Agnosticism
  - III. Convention over Configuration
  - IV. Structured & Automated Workflow
  - V. Automated Release Process
  - VI. Strict Versioning Discipline
  - VII. Template-Driven Quality
  - VIII. Ambiguity Resolution
Removed Sections:
  - None. Principles were re-ordered and expanded.
Templates Requiring Updates:
  - None. All artifacts are in sync with this constitution.
Follow-up TODOs:
  - TODO(RATIFICATION_DATE): Specify the date when these principles were formally adopted.
-->
# spec-kit Constitution

This constitution defines the core principles for the development and maintenance of the `spec-kit` repository itself. All contributions and automated processes MUST adhere to these articles to ensure consistency, quality, and architectural integrity.

## Core Principles

### I. Spec-Driven Development
The development of `spec-kit` itself, where applicable, should follow the Spec-Driven Development (SDD) methodology it promotes. Plans must be derived from clear specifications, and every technical decision should trace back to a specific requirement.

### II. AI Agent Agnosticism
The framework MUST be designed to support multiple AI coding assistants and avoid vendor lock-in. New agent integrations must follow the established conventions for directory structure, command formats, and argument passing, as documented in `AGENTS.md` and `GEMINI.md`.

### III. Convention over Configuration
The toolkit MUST favor strong, documented conventions for directory structures, file formats, and release packaging. This minimizes complexity and ensures a predictable development experience.

### IV. Structured & Automated Workflow
The SDD workflow (`/specify`, `/plan`, `/tasks`, etc.) is a core feature. The tool's development must protect and enhance this structured process, ensuring it remains consistent and automated.

### V. Automated Release Process
The release process MUST be automated through the GitHub Actions workflows defined in `.github/workflows/`. Manual releases are prohibited. This ensures that all templates for all supported agents are packaged and published consistently.

### VI. Strict Versioning Discipline
Any functional change to the `specify-cli` tool, particularly to `src/specify_cli/__init__.py`, MUST be accompanied by a corresponding version increment in `pyproject.toml` and a new entry in `CHANGELOG.md`.

### VII. Template-Driven Quality
The `specify-cli`'s primary function is to generate project structures from master templates. All generated artifacts for end-users MUST originate from these templates. Quality is enforced by embedding constraints and checklists within them.

### VIII. Ambiguity Resolution
The process must enforce clarity. All ambiguities or `[NEEDS CLARIFICATION]` markers in a specification MUST be resolved before a development plan can be finalized.

## Governance

This constitution is the highest authority for the `spec-kit` project. All development practices and agent integrations must comply with its principles. Amendments require a formal proposal, review by project maintainers, and a clear plan for propagating changes across all relevant templates and scripts.

**Version**: 1.0.0 | **Ratified**: TODO(RATIFICATION_DATE): Specify the date when these principles were formally adopted. | **Last Amended**: 2025-09-25
