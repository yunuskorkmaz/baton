---
name: orkestre
description: Multi-agent orchestration protocol using Herdr (hc), Beads (bd), Antigravity, and OpenCode. Provides /team and /team-init commands.
---

# Orkestre Multi-Agent Orchestration Skill

Use this skill when the user asks to coordinate a team of coding agents, run `/team`, or run `/team-init`.

## Available Slash Commands

- **/team-init**: Inspects project dependencies (`bd`, `hc`, `gh`, `agy`, `opencode`), initializes Beads (`bd init`), writes `AGENTS.md`, and confirms Herdr connection.
- **/team [task or issue]**: Decomposes a feature or GitHub issue into a Beads DAG (`bd create`, `bd dep add`), delegates subtasks to Antigravity (`agy`) and OpenCode (`opencode`) inside Herdr (`hc run`), monitors execution, and closes tasks (`bd close`).

## Safety Protocol
- **Herdr Gate:** Always verify `hc ls` before launching child agents. If Herdr is inactive, do NOT start background processes; report the status to the user and fallback to harness-supervised subagents or Solo Mode.
- **Scope Restriction:** Always restrict child agents to explicit files or directories so they do not overlap.
- **Beads Tracking:** Every task must be tracked with Beads (`bd ready`, `bd update --claim`, `bd close`).
