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

## 🔌 Native Plugin Installation (No Curl / Script Needed)

You can install Baton directly from its GitHub repository using your AI agent's native plugin manager:

### 1. In Claude Code (Native Plugin Marketplace)
Directly in your Claude Code prompt:
```text
/plugin marketplace add yunuskorkmaz/baton
/plugin install baton@baton
```
*Or via full Git URL:*
```text
/plugin marketplace add https://github.com/yunuskorkmaz/baton.git
```

### 2. In OpenCode (Native Plugin Add)
In your terminal:
```bash
opencode plugin add --global github:yunuskorkmaz/baton
```

### 3. In Antigravity (Skill)
Baton is automatically loaded from your global skills directory (`~/.gemini/config/skills/baton/`) or project-level `.agents/skills/baton/`.

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
├── .claude-plugin/
│   ├── marketplace.json       # Claude Code marketplace registry
│   └── plugin.json            # Claude Code plugin manifest
├── package.json               # OpenCode / npm plugin metadata
├── README.md                  # Documentation
├── commands/
│   ├── baton-init.md          # /baton-init slash command
│   ├── baton.md               # /baton slash command
│   ├── team-init.md           # /team-init alias
│   └── team.md                # /team alias
├── skills/
│   └── baton/
│       └── SKILL.md           # Antigravity skill definition
└── templates/
    └── AGENTS.md.template     # Canonical project-level protocol
```
