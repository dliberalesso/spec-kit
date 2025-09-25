# Feature Specification: Jujutsu Version Control Support

**Feature Branch**: `001-feat-support-jujutsu`
**Created**: 2025-09-25
**Status**: Draft
**Input**: User description: "Support jujutsu: we need to include support for the usage of the SDD framework in conjunction with `jj`, without losing the support we already have for `git`."

---

## ⚡ Quick Guidelines
- ✅ Focus on WHAT users need and WHY
- ❌ Avoid HOW to implement (no tech stack, APIs, code structure)
- 👥 Written for business stakeholders, not developers

---
## Clarifications

### Session 2025-09-25
- Q: If both `.git` and `.jj` directories exist in a project, what should be the tool's default behavior? → A: Prefer `jj` and ignore `git`.
- Q: When a user runs `specify init` in a directory that is not a repository, what should be the default version control system? → A: Default to `git` as it is the most common system.
- Q: Which specific scripts (beyond `create-new-feature.sh`) are expected to be updated for `jj` support? → A: All scripts that interact with the version control system.

---

## User Scenarios & Testing *(mandatory)*

### Primary User Story
As a developer using Jujutsu (`jj`) for version control, I want to use the Spec-Driven Development (SDD) workflow seamlessly, so that I can manage my features and specifications without being forced to use Git.

### Acceptance Scenarios
1. **Given** a developer is in a `jj` repository, **When** they run the `/specify` command, **Then** the system correctly creates a new feature branch (or `jj` equivalent) and the corresponding specification file.
2. **Given** a developer is in a `git` repository, **When** they run the `/specify` command, **Then** the system continues to function as it currently does, creating a Git branch and spec file.
3. **Given** a developer is in a `jj` repository, **When** they execute the SDD workflow commands (`/plan`, `/tasks`, etc.), **Then** all scripts that interact with the version control system must use the appropriate `jj` commands instead of `git` commands.
4. **Given** a developer has `jj` installed but is not in a `jj` or `git` repository, **When** they run `specify init`, **Then** the tool should always initialize a `git`.

### Edge Cases
- What happens if a user has both `git` and `jj` repositories nested or in the same directory? The system should identify the primary repository type and act on it, preferring `jj`.
- How does the system handle `jj` commands that have no direct `git` equivalent? The scripts must be adapted to follow Jujutsu's operational model.

## Requirements *(mandatory)*

### Functional Requirements
- **FR-001**: The system MUST detect whether the current project is a `git` or `jj` repository.
- **FR-002**: The `.specify/scripts/bash/create-new-feature.sh` script MUST be updated to accept an argument or automatically detect the version control system to use the correct commands (`git checkout -b` vs. `jj new`).
- **FR-003**: All scripts within `.specify/scripts/{bash,powershell}/` that interact with the version control system MUST be updated to support `jj` as an alternative to `git` where applicable.
- **FR-004**: The existing functionality for `git`-based repositories MUST remain unchanged and fully supported.

### Out of Scope
- The `specify check` command will not be updated to verify if `jj` is installed.
- The `specify init` command will not be updated to handle `jj` repository initialization; it will continue to default to `git`.

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Content Quality
- [x] No implementation details (languages, frameworks, APIs)
- [x] Focused on user value and business needs
- [x] Written for non-technical stakeholders
- [x] All mandatory sections completed

### Requirement Completeness
- [x] No [NEEDS CLARIFICATION] markers remain
- [x] Requirements are testable and unambiguous
- [x] Success criteria are measurable
- [x] Scope is clearly bounded
- [x] Dependencies and assumptions identified

---
