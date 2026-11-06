---
description: Orchestrate a task or GitHub issue using Beads (bd), Herdr (hc), Antigravity, and OpenCode
---

You are executing the **`/team`** command.

Input received: `$ARGUMENTS`

---

### Step 1: Herdr Safety Check
Run:
```bash
command -v hc >/dev/null 2>&1 && hc ls >/dev/null 2>&1
```

- **IF HERDR IS NOT RUNNING:**
  - Print notice to the user:
    > "⚠️ **Herdr Core (`hc`) is not active.** To prevent unmonitored background runaway processes, Herdr Team Mode is disabled."
  - If your harness has direct native subagent capability, you may use it under direct supervision.
  - Otherwise, switch to **Solo Mode** and complete the task yourself directly step-by-step.
  - Do NOT continue to Step 2.

- **IF HERDR IS ACTIVE:**
  - Proceed with Herdr Team Mode below.

---

### Step 2: Task Ingestion & Planning
1. **GitHub Issue Check:**
   - If `$ARGUMENTS` contains an issue number (e.g. `#12`, `12`), fetch details:
     ```bash
     gh issue view 12
     ```
   - Otherwise, treat `$ARGUMENTS` as the feature/bug specification.
2. **Decompose into Beads DAG:**
   - Create granular, file-scoped tasks:
     ```bash
     bd create "<task 1 description>" -t task
     bd create "<task 2 description>" -t task
     ```
   - Link dependencies (e.g. task 2 depends on task 1):
     ```bash
     bd dep add <task_2_id> <task_1_id>
     ```
   - View unblocked work:
     ```bash
     bd ready
     ```

---

### Step 3: Worker Dispatch Loop
While there are unblocked tasks in `bd ready`:

1. **Pick Task & Role:**
   - **Antigravity (`agy`):** Core logic, auth, API design, heavy refactors, test suites.
   - **OpenCode (`opencode`):** UI components, Tailwind styling, CRUD boilerplate, data types, documentation.
2. **Launch Worker in Herdr:**
   ```bash
   hc run --bg --name <worker_name> --cwd "$PWD" -- <agy|opencode run> "<scoped task instructions. Specify exact files. Instruct to report when done.>"
   ```
3. **Claim in Beads:**
   ```bash
   bd update <task_id> --claim
   ```
4. **Monitor & Supervise:**
   - Wait: `hc wait <worker_name>` or `hc wait --children all`
   - Review terminal output: `hc read --lines 100 <worker_name>`
   - Inspect changes: `git diff`
5. **Quality Gate:**
   - If tests fail or code needs adjustment:
     `hc send <worker_name> "Correction: please fix <details>"`
   - If approved:
     ```bash
     bd close <task_id>
     hc kill <worker_name> && hc rm <worker_name>
     ```

---

### Step 4: Verification & Report
1. Run project build and test suite (`npm test`, `cargo test`, `pytest`, etc.).
2. If linked to a GitHub issue:
   ```bash
   gh issue comment <number> -b "Implemented via Orkestre team orchestration. All sub-tasks completed."
   ```
3. Present an executive summary to the user:
   - What was implemented.
   - Tasks completed in Beads.
   - Changed files and test verification results.
