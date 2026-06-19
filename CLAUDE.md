# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Spec-Driven Development (SDD) sandbox using OpenSpec. It contains a legacy **Delphi 5** Windows Forms application (`HelloDelphi5`) integrated with the **VirtualUI SDK** to expose the Win32 GUI via browser. The objective is to practice the OpenSpec propose → apply → archive lifecycle against this codebase.

**Tech stack:**
- Delphi 5 (Object Pascal, Win32)
- VirtualUI SDK (COM-based, wraps Delphi/Win32 apps to run in a web browser)
- OpenSpec CLI v1.4.1 (spec-driven workflow)

## Delphi5 Application

Entry point: [Delphi5/HelloDelphi5.dpr](Delphi5/HelloDelphi5.dpr)

| File | Purpose |
|---|---|
| `HelloDelphi5.dpr` | Program entry — calls `VirtualUI.Start()` before `Application.Run` |
| `main.pas` | Main form unit (`TFrmMain`) with a single button that shows a message |
| `main.dfm` | Form layout — `TFrmMain` (416×297), one `TButton` ("Say Hello") |
| `VirtualUI_SDK.pas` | VirtualUI COM type-library wrapper (do not edit) |
| `VirtualUI_AutoRun.pas` | VirtualUI auto-run helper (do not edit) |

**Key pattern:** `VirtualUI.Start()` must be called before `Application.Initialize` so the SDK can intercept Win32 messages and stream the UI to the browser.

## OpenSpec CLI

Requires Node.js v20.19.0+. Install globally:

```bash
npm install -g @fission-ai/openspec@latest
openspec --version
```

Key commands:

```bash
openspec init                                    # initialize in a repo (select your copilot)
openspec new change "<kebab-case-name>"          # scaffold a new change
openspec list --json                             # list active changes
openspec status --change "<name>" --json         # get change status, paths, and artifact graph
openspec instructions <artifact-id> --change "<name>" --json  # get per-artifact instructions and template
```

## OPSX Workflow

This repo uses the **spec-driven** schema. The standard lifecycle is:

```
propose → apply → [sync-specs] → archive
```

**Propose** (`/opsx:propose <name>`): Creates a change under `openspec/changes/<name>/` with three artifacts in dependency order:
1. `proposal.md` — what & why
2. `design.md` — how (reads proposal for context)
3. `tasks.md` — implementation steps (reads proposal + design)

Always call `openspec instructions <artifact-id> --change "<name>" --json` before writing each artifact — the response includes `template`, `resolvedOutputPath`, `context`, and `rules`. Write only the filled template to `resolvedOutputPath`; never copy `context` or `rules` into the file.

**Apply** (`/opsx:apply [name]`): Reads `contextFiles` from `openspec instructions apply --change "<name>" --json`, then works through tasks in `tasks.md` sequentially, flipping `- [ ]` to `- [x]` after each one.

**Sync specs** (`/opsx:sync [name]`): Merges delta specs from the change into `openspec/specs/<capability>/spec.md`. Delta sections are `## ADDED`, `## MODIFIED`, `## REMOVED`, `## RENAMED Requirements`. Apply intelligently — partial updates are valid (e.g., adding one scenario without restating existing ones).

**Archive** (`/opsx:archive [name]`): Moves `changeRoot` to `openspec/changes/archive/YYYY-MM-DD-<name>/`. Prompts on incomplete tasks or unsynced delta specs before proceeding.

## Repository Structure

```
openspec/
  config.yaml          # schema and project context; edit to add tech-stack context
  changes/             # active changes (each has proposal.md, design.md, tasks.md)
    archive/           # completed changes (YYYY-MM-DD-<name>/)
  specs/               # canonical specs per capability (spec.md)

.github/
  skills/              # Claude Code skill definitions for each OPSX action
  prompts/             # equivalent prompts for other copilots (Cursor, Copilot)
```

## Skills Available

| Skill | Trigger | Purpose |
|---|---|---|
| `openspec-explore` | `/opsx:explore` | Thinking-partner mode — read-only, no implementation |
| `openspec-propose` | `/opsx:propose` | Generate all pre-implementation artifacts |
| `openspec-apply-change` | `/opsx:apply` | Implement tasks from a change |
| `openspec-sync-specs` | `/opsx:sync` | Merge delta specs into main specs |
| `openspec-archive-change` | `/opsx:archive` | Finalize and archive a completed change |

## Key Conventions

- Always derive artifact paths from `openspec status --change "<name>" --json` (`changeRoot`, `artifactPaths`, `planningHome`) — never hardcode paths.
- `openspec instructions` `context` and `rules` fields are constraints for the AI, not content to be written into artifact files.
- Changes are name-spaced by kebab-case; if a name already exists, ask the user before creating a new one.
- In explore mode, creating OpenSpec artifacts (proposals, designs, specs) is permitted; writing application code is not.
