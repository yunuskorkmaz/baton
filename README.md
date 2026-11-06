# 🪄 Baton

**The Lightweight Conductor for AI Coding Teams**  
Powered by **Herdr Core (`hc`)**, **Beads (`bd`)**, and native AI developer agents (**Claude Code**, **Antigravity**, **OpenCode**).

---

## 🌟 Why Baton?

Like a conductor's baton, this system doesn't make sound itself; it directs and guides. **Baton** lets any AI coding agent act as a **Team Lead** without complex wrappers or heavy frameworks. It relies strictly on battle-tested native command-line tools:

- **Herdr Core (`hc`)**: Persistent, inspectable, and visible terminal daemon. Watch agents code live in Herdr tabs or split panes.
- **Beads (`bd`)**: Git-backed, zero-latency DAG task tracker and agent memory. Handles dependency management (`bd ready`) and concurrency (`bd update --claim`).
- **GitHub Issues (`gh`)**: Human-facing macro-level issue tracking.

---

## 🛡️ Core Safety Rule: Herdr Gated Execution

> **If Herdr (`hc`) is active → Visual Team Mode is enabled.**  
> **If Herdr is inactive → Team Mode is disabled.**  

No uncontrolled, headless runaway background swarms. If Herdr is not running, the Lead agent falls back to native supervised subagents or Solo Mode.

---

## 🚀 Quick Start (Global Installation)

Run the one-liner installer from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/yunuskorkmaz/baton/main/install.sh | bash
```

Or clone and install locally:

```bash
git clone https://github.com/yunuskorkmaz/baton.git
cd baton
./install.sh
```

This installs:
- Claude Code commands: `/team-init`, `/team` (and `/baton-init`, `/baton`)
- Antigravity global skill: `baton`

---

## 💻 Daily Workflow

### 1. In any new project, initialize Baton:
Type in Claude Code or Antigravity:
```text
/baton-init
```
*(or `/team-init`)*  
*Checks dependencies (`bd`, `hc`, `gh`), runs `bd init`, and writes `AGENTS.md`.*

### 2. Run a task or GitHub issue with your team:
```text
/baton #42
```
or
```text
/baton Build a user authentication service with JWT and a responsive login page
```
*(or `/team ...`)*

---

## 👥 Roles & Responsibilities

| Agent | Role | Scope |
| :--- | :--- | :--- |
| **Claude Code / Lead** | Architect & Conductor | Breaks tasks into Beads DAG, manages dependencies, code review |
| **Antigravity (`agy`)** | Senior Developer | Backend logic, refactoring, security, test suites |
| **OpenCode (`opencode`)** | Fast / UI Developer | Boilerplate, Tailwind UI, CRUD operations, documentation |

---

## 📁 Repository Structure

```text
baton/
├── README.md                  # Documentation
├── install.sh                 # Global installer script
├── commands/
│   ├── team-init.md           # /team-init slash command definition
│   ├── team.md                # /team slash command definition
│   ├── baton-init.md          # /baton-init alias
│   └── baton.md               # /baton alias
├── skills/
│   └── baton/
│       └── SKILL.md           # Antigravity skill definition
└── templates/
    └── AGENTS.md.template     # Canonical project-level protocol
```
