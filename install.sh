#!/usr/bin/env bash
set -e

REPO_RAW_URL="https://raw.githubusercontent.com/yunuskorkmaz/orkestre/main"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"

echo "=== 🎻 Installing Orkestre Global Skills & Commands ==="

CLAUDE_CMD_DIR="$HOME/.claude/commands"
AGY_SKILL_DIR="$HOME/.gemini/config/skills/orkestre"

mkdir -p "$CLAUDE_CMD_DIR"
mkdir -p "$AGY_SKILL_DIR"

# Helper to fetch or copy file
install_file() {
    local src_rel="$1"
    local dest="$2"

    if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$src_rel" ]; then
        cp "$SCRIPT_DIR/$src_rel" "$dest"
    else
        curl -fsSL "$REPO_RAW_URL/$src_rel" -o "$dest"
    fi
}

# 1. Claude Code global slash commands
install_file "commands/team-init.md" "$CLAUDE_CMD_DIR/team-init.md"
install_file "commands/team.md" "$CLAUDE_CMD_DIR/team.md"
echo "✅ Installed Claude Code commands: $CLAUDE_CMD_DIR/{team-init.md,team.md}"

# 2. Antigravity global skill
install_file "skills/orkestre/SKILL.md" "$AGY_SKILL_DIR/SKILL.md"
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
