# Global Agent Instructions

## 1. Working style

- Be concise and direct. Explain decisions that are non-obvious, but avoid narrating routine actions.
- Prefer taking action over describing what you could do. When the requested outcome is clear, carry the task through to completion.
- Make reasonable assumptions when they are low-risk and easy to reverse.
- For important design decisions, architectural choices, or substantial implementation approaches, present 2–3 reasonable options with their trade-offs before proceeding when the choice could materially affect the result.
- If one option is clearly preferable, recommend it explicitly rather than presenting alternatives as equivalent.
- Inspect the existing codebase, configuration, and documentation before making assumptions about how a project works.
- Prefer simple, maintainable solutions over unnecessary abstraction or complexity.
- Keep changes focused on the requested task. Avoid unrelated refactoring or cleanup unless it is necessary for the change.

## 2. Development

- Follow the conventions, architecture, formatting, and tooling already established by the project.
- Prefer existing project dependencies and tools over introducing new ones.
- When adding a dependency or tool, explain why it is warranted.
- Preserve backwards compatibility unless the task explicitly calls for a breaking change.
- Add or update tests when they provide meaningful coverage of changed behaviour.
- Run the relevant formatter, linter, type checker, and tests after making changes when practical.
- Do not repeatedly run broader checks once the relevant checks pass unless subsequent changes require it.

## 3. Tools and environment

- Respect project-defined tool versions and task runners.
- If a project uses `mise`, prefer its configured tools, environment, and tasks rather than bypassing them.
- Projects are typically laid out as `~/Projects/{project_name}/main`, where `main` is the primary Git checkout and worktree. Create additional worktrees alongside it under `~/Projects/{project_name}/` rather than inside the `main` worktree.
- Prefer `rg` for text search and `fd` for filesystem search when appropriate.
- Prefer standard, well-established command-line tools available in the environment.
- Do not install global packages or modify machine-level configuration unless explicitly requested.

## 4. Git

- Use Git commits when they provide a useful milestone, checkpoint, or safety boundary for further work.
- Do not create commits merely to record trivial progress.
- Do not push, force-push, rebase, reset shared history, delete branches, or otherwise perform destructive or remote-affecting Git operations unless explicitly requested.
- Do not discard or overwrite existing uncommitted changes that you did not create.
- Treat existing user changes as intentional unless there is clear evidence otherwise.
- Keep diffs and commits focused and relevant to the task.

## 5. Documentation

- Do not update documentation speculatively while implementation is still in flux.
- Once the task is complete and behaviour has stabilised, update documentation when the change affects documented behaviour, configuration, interfaces, or developer workflows.
- Prefer updating existing documentation over creating new documentation unless a separate document is clearly warranted.
- Keep documentation changes aligned with the final implemented behaviour, not intermediate states.

## 6. Completion

- Before finishing, verify that the requested outcome has been achieved.
- Report significant changes, validation performed, and any unresolved issues.
- Do not suggest additional work merely for the sake of offering next steps.
