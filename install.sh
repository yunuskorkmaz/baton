#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== 🎻 Installing Orkestre Global Skills & Commands ==="

# 1. Claude Code global slash commands
CLAUDE_CMD_DIR="$HOME/.claude/commands"
mkdir -p "$CLAUDE_CMD_DIR"
cp "$SCRIPT_DIR/commands/team-init.md" "$CLAUDE_CMD_DIR/team-init.md"
cp "$SCRIPT_DIR/commands/team.md" "$CLAUDE_CMD_DIR/team.md"
echo "✅ Installed Claude Code commands: $CLAUDE_CMD_DIR/{team-init.md,team.md}"

# 2. Antigravity global skill
AGY_SKILL_DIR="$HOME/.gemini/config/skills/orkestre"
mkdir -p "$AGY_SKILL_DIR"
cp "$SCRIPT_DIR/skills/orkestre/SKILL.md" "$AGY_SKILL_DIR/SKILL.md"
echo "✅ Installed Antigravity skill: $AGY_SKILL_DIR/SKILL.md"

# 3. Verify Prerequisites
echo ""
echo "=== 🔍 Checking Prerequisites ==="
check_tool() {
    local cmd="$1"
    local name="$2"
    local install_hint="$3"
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "  🟢 $name ($cmd): Installed ($(which "$cmd"))"
    else
        echo "  🔴 $name ($cmd): NOT FOUND. $install_hint"
    fi
}

check_tool "bd" "Beads" "Install via: brew install beads"
check_tool "hc" "Herdr Core" "Installed via Herdr app"
check_tool "herdr-app" "Herdr GUI" "Installed via Herdr app"
check_tool "gh" "GitHub CLI" "Install via: brew install gh"
check_tool "agy" "Antigravity CLI" "Installed via Antigravity"
check_tool "opencode" "OpenCode CLI" "Installed via OpenCode"

echo ""
echo "🎉 Orkestre installation complete!"
echo "In any project, you can now run:"
echo "  /team-init       -> Initialize project with Beads and AGENTS.md"
echo "  /team <task>     -> Orchestrate multi-agent execution"
