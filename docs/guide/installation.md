# Installation Guide

Install and configure `vibe-coding-zh-kit` in any project.

## For Humans

Copy this to your AI Agent:

```text
Install and configure vibe-coding-zh-kit by following the instructions here: https://raw.githubusercontent.com/LuckyDogzyc/vibe-coding-zh-kit/main/docs/guide/installation.md
```

---

## For AI Agents

### Goal

Install the Chinese workflow kit into the target project, including:

- `.claude/commands/`
- `.claude/skills/`
- `.agents/plans/`

### Step 1: Clone the kit repo

```bash
git clone https://github.com/LuckyDogzyc/vibe-coding-zh-kit.git /tmp/vibe-coding-zh-kit
```

### Step 2: Move to the kit directory

```bash
cd /tmp/vibe-coding-zh-kit
```

### Step 3: Install into target project

If target is current directory:

```bash
bash scripts/install.sh .
```

If target is a specific path:

```bash
bash scripts/install.sh /path/to/your/project
```

### Optional flags

Force overwrite existing files:

```bash
bash scripts/install.sh --force /path/to/your/project
```

Skip backup creation:

```bash
bash scripts/install.sh --no-backup /path/to/your/project
```

### Step 4: Verify installation

Check these paths exist in target project:

```bash
ls -la .claude/commands
ls -la .claude/skills
ls -la .agents/plans
```

### Step 5: Recommended workflow after install

1. Run `prime`
2. Run `create-rules`
3. Run `plan-feature`
4. Run `execute`
5. Run `commit`

---

## One-line prompt format

Use this style in any AI IDE/chat:

```text
Install and configure vibe-coding-zh-kit by following the instructions here: https://raw.githubusercontent.com/LuckyDogzyc/vibe-coding-zh-kit/main/docs/guide/installation.md
```
