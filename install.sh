#!/usr/bin/env bash
# ==============================================================================
# YuanQi Tech Logo Skill Installer (Multi-Agent Universal)
# Supports: Antigravity, Claude Code, OpenAI Codex, Tencent WorkBuddy, Cursor
# Installation via HTTPS or SSH
# ==============================================================================

set -e

SKILL_NAME="yuanqi-logo-assets"
DEFAULT_REPO_HTTPS="https://github.com/yuanqitech/yuanqi-logo-assets.git"
DEFAULT_REPO_SSH="git@github.com:yuanqitech/yuanqi-logo-assets.git"

PROTOCOL="https"
TARGET_AGENT="all"
PROJECT_PATH=""
REPO_URL="$DEFAULT_REPO_HTTPS"

# Parse CLI Arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --ssh)
      PROTOCOL="ssh"
      REPO_URL="$DEFAULT_REPO_SSH"
      shift
      ;;
    --https)
      PROTOCOL="https"
      REPO_URL="$DEFAULT_REPO_HTTPS"
      shift
      ;;
    --repo)
      REPO_URL="$2"
      shift 2
      ;;
    --agent)
      TARGET_AGENT="$2"
      shift 2
      ;;
    --project)
      PROJECT_PATH="$2"
      shift 2
      ;;
    *)
      if [ -z "$PROJECT_PATH" ] && [ -d "$1" ]; then
        PROJECT_PATH="$1"
      fi
      shift
      ;;
  esac
done

echo "============================================================"
echo "  YuanQi Tech Logo Skill Installer"
echo "  Protocol : $PROTOCOL"
echo "  Target   : $TARGET_AGENT"
echo "============================================================"

# Determine if running locally from cloned repo or via curl pipe
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" 2>/dev/null || pwd)" && pwd)"
TEMP_DIR=""

if [ -f "$SCRIPT_DIR/SKILL.md" ]; then
  WORK_DIR="$SCRIPT_DIR"
  echo ">> Running from local directory: $WORK_DIR"
else
  echo ">> Remote install detected. Cloning repository..."
  TEMP_DIR="$(mktemp -d)"
  git clone --depth 1 "$REPO_URL" "$TEMP_DIR/$SKILL_NAME"
  WORK_DIR="$TEMP_DIR/$SKILL_NAME"
fi

copy_skill() {
  local dest="$1"
  mkdir -p "$dest"
  cp -r "$WORK_DIR/"* "$dest/"
  echo " [OK] Installed to: $dest"
}

# 1. Google Antigravity
if [ "$TARGET_AGENT" = "all" ] || [ "$TARGET_AGENT" = "antigravity" ]; then
  echo ""
  echo ">> Installing for Antigravity..."
  copy_skill "$HOME/.gemini/config/skills/$SKILL_NAME"
fi

# 2. Anthropic Claude Code
if [ "$TARGET_AGENT" = "all" ] || [ "$TARGET_AGENT" = "claude" ]; then
  echo ""
  echo ">> Installing for Claude Code..."
  copy_skill "$HOME/.claude/skills/$SKILL_NAME"
fi

# 3. Tencent WorkBuddy
if [ "$TARGET_AGENT" = "all" ] || [ "$TARGET_AGENT" = "workbuddy" ]; then
  echo ""
  echo ">> Installing for Tencent WorkBuddy..."
  copy_skill "$HOME/.workbuddy/skills/$SKILL_NAME"
fi

# 4. Project Workspace (Codex, Cursor, Copilot)
if [ -n "$PROJECT_PATH" ]; then
  echo ""
  echo ">> Installing into project workspace: $PROJECT_PATH"
  copy_skill "$PROJECT_PATH/.agents/skills/$SKILL_NAME"
  copy_skill "$PROJECT_PATH/.claude/skills/$SKILL_NAME"
  copy_skill "$PROJECT_PATH/.workbuddy/skills/$SKILL_NAME"
  
  [ ! -f "$PROJECT_PATH/CLAUDE.md" ] && cp "$WORK_DIR/CLAUDE.md" "$PROJECT_PATH/CLAUDE.md"
  [ ! -f "$PROJECT_PATH/AGENTS.md" ] && cp "$WORK_DIR/AGENTS.md" "$PROJECT_PATH/AGENTS.md"
  echo " [OK] Injected CLAUDE.md & AGENTS.md to project root."
fi

# Cleanup temp dir if remote
if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
  rm -rf "$TEMP_DIR"
fi

echo ""
echo "============================================================"
echo "  Installation Completed! Skill is active across agents."
echo "============================================================"
