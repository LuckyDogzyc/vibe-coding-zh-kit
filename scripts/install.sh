#!/usr/bin/env bash
set -euo pipefail

# 一键安装 .claude/commands + .claude/skills 到目标项目
# 用法：
#   bash scripts/install.sh /path/to/your/project
#   bash scripts/install.sh .
# 可选参数：
#   --force      覆盖目标中已存在的同名文件（默认不覆盖）
#   --no-backup  不创建备份目录（默认会备份冲突文件）

FORCE=0
BACKUP=1
TARGET=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)
      FORCE=1
      shift
      ;;
    --no-backup)
      BACKUP=0
      shift
      ;;
    -h|--help)
      echo "Usage: $0 [--force] [--no-backup] <target-project-path>"
      exit 0
      ;;
    *)
      TARGET="$1"
      shift
      ;;
  esac
done

if [[ -z "$TARGET" ]]; then
  echo "❌ 请提供目标项目路径，例如：bash scripts/install.sh ."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET_DIR="$(cd "$TARGET" && pwd)"

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "❌ 目标目录不存在：$TARGET"
  exit 1
fi

if [[ "$ROOT_DIR" == "$TARGET_DIR" ]]; then
  echo "ℹ️ 目标目录就是当前仓库，跳过安装。"
  exit 0
fi

echo "🚀 安装到：$TARGET_DIR"

mkdir -p "$TARGET_DIR/.claude/commands" "$TARGET_DIR/.claude/skills" "$TARGET_DIR/.agents/plans"

BACKUP_DIR=""
if [[ $BACKUP -eq 1 ]]; then
  BACKUP_DIR="$TARGET_DIR/.vibe-coding-zh-kit-backup-$(date +%Y%m%d-%H%M%S)"
  mkdir -p "$BACKUP_DIR"
fi

copy_tree() {
  local src="$1"
  local dst="$2"

  find "$src" -type f | while read -r file; do
    rel="${file#$src/}"
    out="$dst/$rel"
    mkdir -p "$(dirname "$out")"

    if [[ -e "$out" && $FORCE -ne 1 ]]; then
      if [[ $BACKUP -eq 1 ]]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
        cp -f "$out" "$BACKUP_DIR/$rel"
      fi
      echo "⚠️ 已存在，跳过：$out（可用 --force 覆盖）"
      continue
    fi

    cp -f "$file" "$out"
    echo "✅ $out"
  done
}

copy_tree "$ROOT_DIR/.claude/commands" "$TARGET_DIR/.claude/commands"
copy_tree "$ROOT_DIR/.claude/skills" "$TARGET_DIR/.claude/skills"

if [[ $BACKUP -eq 1 ]]; then
  echo "📦 备份目录：$BACKUP_DIR"
fi

echo "\n🎉 安装完成。建议下一步："
echo "1) 根据项目技术栈调整 .claude/commands/init-project.md"
echo "2) 先运行 prime，再 create-rules，再 plan-feature/execute/commit"
