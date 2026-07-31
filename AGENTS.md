# AGENTS.md

## Purpose
This file defines template-specific agent conventions for this Railway app.

## Scope
These rules apply to `railwayapp-grafana`.
The workspace root `AGENTS.md` also applies.

## Conventions
- Use `pnpm` as the default package manager when package management is needed.
- Store credentials and local secrets in `.env` files.
- Use Conventional Commits in English.
- Keep all documentation in English.
- When adding new props, always update matching Type definitions and related documentation.

## Railway Checks
- Keep `railway.toml` consistent with runtime behavior.
- Validate `startCommand`, `healthcheckPath`, and `healthcheckTimeout` after changes.
- Keep Docker and entrypoint changes minimal and reproducible.
