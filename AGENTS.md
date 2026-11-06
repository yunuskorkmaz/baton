# Agent Team Protocol (Baton)

This project uses **Baton** multi-agent orchestration backed by **Herdr Core (`hc`)** and **Beads (`bd`)**.

---

## 🛡️ Core Safety Rule: Herdr Gated Execution

1. **Herdr Present (`hc ls` works):**
   - **Team Mode is ENABLED.**
   - Child agents are launched visibly in Herdr tabs or tracked background terminals (`hc run --bg ...` or `herdr-app do tab.new ...`).
   - Every agent is observable, steerable, and can be interrupted (`hc interrupt`) or attached to.
2. **Herdr Absent:**
   - **Herdr Team Mode is DISABLED.**
   - Do **NOT** spawn headless or uncontrolled background process swarms.
   - If the lead agent harness supports native subagents (e.g. Claude Task subagent, Antigravity `invoke_subagent`), use them under direct harness supervision.
   - Otherwise, proceed in **Solo Mode** (the lead agent executes tasks directly step-by-step).

---

## 👥 Team Roles

| Role | Tool / Agent | Focus Areas | Typical Command |
| :--- | :--- | :--- | :--- |
| **Lead / Architect** | Any (Claude Code / Antigravity / OpenCode) | Requirements, planning, task graph, code review | - |
| **Senior Dev** | **Antigravity (`agy`)** | Core logic, complex refactors, auth, test suites | `agy "<task>"` |
| **Fast / UI Dev** | **OpenCode (`opencode`)** | Boilerplate, UI components, CRUD, formatting, docs | `opencode run "<task>"` |

---

## 📋 Task Management Workflow (Hybrid Model)

1. **Macro Level (GitHub Issues):**
   - High-level feature / bug / epic is referenced via `gh issue view <number>`.
2. **Micro Level (Beads DAG):**
   - The Lead decomposes the epic into granular, file-scoped tasks:
     ```bash
     bd create "Implement auth service" -t task
     bd create "Build login form component" -t task
     bd dep add <ui_task_id> <auth_task_id> # UI depends on auth
     ```
   - Check unblocked tasks ready to run:
     ```bash
     bd ready
     ```
3. **Execution Loop (with Herdr):**
   - Lead spawns worker:
     ```bash
     hc run --bg --name dev-auth --cwd "$PWD" -- agy "Task details... touch only src/auth.ts. Report when done."
     ```
   - Claim task in Beads:
     ```bash
     bd update <task_id> --claim
     ```
   - Wait for completion:
     ```bash
     hc wait dev-auth
     ```
   - Inspect output:
     ```bash
     hc read --lines 80 dev-auth
     git diff
     ```
   - Close completed task:
     ```bash
     bd close <task_id>
     ```
   - Clean up terminal:
     ```bash
     hc kill dev-auth && hc rm dev-auth
     ```
4. **Epilogue:**
   - When all Beads in the epic are closed, summarize changes and update the GitHub issue:
     ```bash
     gh issue comment <number> -b "All subtasks completed via Baton."
     ```
