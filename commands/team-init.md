---
description: Initialize Orkestre multi-agent environment (Beads, AGENTS.md, tool checks)
---

You are executing the **`/team-init`** setup procedure for this repository. Follow these exact steps:

### 1. Prerequisite Tool Check
Run shell checks to verify the required tools:
```bash
which bd hc herdr-app gh agy opencode
```
- **Beads (`bd`):** If missing, notify the user: `brew install beads` or `npm install -g @beads/bd`.
- **Herdr (`hc`):** Check if installed and if Herdr daemon is responsive (`hc ls`).
- **GitHub (`gh`):** Check if installed and authenticated (`gh auth status`).
- **Workers (`agy`, `opencode`):** Check if installed.

### 2. Initialize Beads Database
If the repository does not have a `.beads` directory:
```bash
bd init
```

### 3. Create or Update `AGENTS.md`
Check if `AGENTS.md` exists in the repository root. If not (or if missing Orkestre directives), write the standard Orkestre `AGENTS.md` protocol:
- Detail the Lead, Senior Dev (`agy`), and Fast Dev (`opencode`) roles.
- State the Herdr-gated safety rule: Team mode runs only when Herdr (`hc`) is active.
- Detail the Beads DAG (`bd create`, `bd dep add`, `bd ready`, `bd update --claim`, `bd close`) and GitHub issue hybrid model.

### 4. Provide Setup Report
Present a concise summary to the user:
- Status of tools (`bd`, `hc`, `gh`, `agy`, `opencode`).
- Status of Beads database (`bd stats` or initialized).
- Herdr status:
  - 🟢 **Herdr Active:** Ready for `/team` orchestration with visual tabs and process tracking.
  - 🟡 **Herdr Inactive:** Team mode will stay disabled until Herdr is opened; fallback to native subagents or solo mode.
- Remind the user: *"You can now use `/team <task>` or `/team #<issue>` to begin work."*
