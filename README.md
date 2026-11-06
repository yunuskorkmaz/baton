# 🎻 Orkestre

**Native Multi-Agent Orchestration Protocol for Coding Teams**  
Powered by **Herdr Core (`hc`)**, **Beads (`bd`)**, and native AI developer agents (**Claude Code**, **Antigravity**, **OpenCode**).

---

## 🌟 Why Orkestre?

Orkestre lets any AI coding agent act as a **Team Lead** without complex Python/Node wrappers. It relies strictly on battle-tested native command-line tools:

- **Herdr Core (`hc`)**: Persistent, inspectable, and visible terminal daemon. Watch agents code live in Herdr tabs or split panes.
- **Beads (`bd`)**: Git-backed, zero-latency DAG task tracker and agent memory. Handles dependency management (`bd ready`) and concurrency (`bd update --claim`).
- **GitHub Issues (`gh`)**: Human-facing macro-level issue tracking.

---

## 🛡️ Core Safety Rule

> **If Herdr (`hc`) is active → Visual Team Mode is enabled.**  
> **If Herdr is inactive → Team Mode is disabled.**  

No uncontrolled, headless runaway background swarms. If Herdr is not running, the Lead agent falls back to native supervised subagents or Solo Mode.

---

## 🚀 Quick Start (Global Installation)

Run the installer once to make Orkestre available globally across all your projects:

```bash
cd /Users/yunuskorkmaz/Projects/orkestre
./install.sh
```

This installs:
- Claude Code commands: `~/.claude/commands/team-init.md` and `~/.claude/commands/team.md`
- Antigravity global skill: `~/.gemini/config/skills/orkestre/SKILL.md`

---

## 💻 Daily Workflow

### 1. In any new project, initialize Orkestre:
Type in Claude Code or Antigravity:
```text
/team-init
```
*Checks dependencies (`bd`, `hc`, `gh`), runs `bd init`, and writes `AGENTS.md`.*

### 2. Run a task or GitHub issue with your team:
```text
/team #42
```
or
```text
/team Build a user authentication service with JWT and a responsive login page
```

---

## 👥 Roles & Responsibilities

| Agent | Role | Scope |
| :--- | :--- | :--- |
| **Claude Code / Lead** | Architect & Orchestrator | Breaks tasks into Beads, manages dependencies, code review |
| **Antigravity (`agy`)** | Senior Developer | Backend logic, refactoring, security, test suites |
| **OpenCode (`opencode`)** | Fast / UI Developer | Boilerplate, Tailwind UI, CRUD operations, documentation |

---

## 📁 Repository Structure

```text
orkestre/
├── README.md                  # This documentation
├── install.sh                 # Global installer script
├── commands/
│   ├── team-init.md           # /team-init slash command definition
│   └── team.md                # /team slash command definition
├── skills/
│   └── orkestre/
│       └── SKILL.md           # Antigravity skill definition
└── templates/
    └── AGENTS.md.template     # Canonical project-level protocol
```
