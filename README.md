# vibe-coding-zh-kit

面向任意 Vibe Coding 工作流的**中文命令与技能模板**。

本项目参考并对齐以下仓库的工作方式（commands + skills），做了中文化与通用化：
- https://github.com/coleam00/link-in-bio-page-builder/

---

## 使用逻辑（先看这个）

推荐固定流程：

1. **prime**：先快速理解项目现状（结构、文档、关键文件、当前分支状态）
2. **create-rules**：生成/更新项目级 `CLAUDE.md` 规则，统一协作约定
3. **create-prd**（可选）：把需求沉淀为 PRD，避免边做边改方向
4. **plan-feature**：把功能拆成可执行、可验证的计划文件
5. **execute**：按计划逐步实现，严格跑验证命令
6. **commit**：做原子提交（一件事一个提交）

一句话：**先建上下文 → 再定规则 → 再规划 → 再执行 → 最后提交**。

---


## 零基础教程（新手必看）

- 新手实操清单：`docs/guide/beginner-checklist.md`
- 安装指引：`docs/guide/installation.md`

如果你从没做过 vibecoding，先看 `beginner-checklist.md`，再开始。

---

## Agent 一句话安装指令（推荐）

直接把下面这句话发给任何 AI Agent：

```text
Install and configure vibe-coding-zh-kit by following the instructions here: https://raw.githubusercontent.com/LuckyDogzyc/vibe-coding-zh-kit/main/docs/guide/installation.md
```

安装指南文件：`docs/guide/installation.md`

---

## 一键安装

### 方式一：在本仓库本地执行（推荐）

```bash
bash scripts/install.sh /path/to/your/project
```

例如安装到当前目录项目：

```bash
bash scripts/install.sh .
```

### 可选参数

- `--force`：覆盖目标项目已有同名文件
- `--no-backup`：不生成备份（默认会备份冲突文件）

示例：

```bash
bash scripts/install.sh --force /path/to/your/project
```

安装完成后，目标项目会得到：

- `.claude/commands/`
- `.claude/skills/`
- `.agents/plans/`

---

## 每个 command 是做什么的

- `prime.md`
  - 作用：预热上下文，快速掌握项目全貌
  - 适用：刚接手项目、隔了几天重新开发、多人协作切换上下文

- `create-rules.md`
  - 作用：自动生成项目级 `CLAUDE.md` 规则
  - 适用：新项目初始化、规则缺失、规范漂移时

- `create-prd.md`
  - 作用：从对话/需求生成结构化 PRD
  - 适用：需求尚不稳定、需要对齐范围和优先级时

- `plan-feature.md`
  - 作用：做深度调研并产出可落地实施计划（输出到 `.agents/plans/*.md`）
  - 适用：中大型功能、跨模块改动、对一次成功率有要求的任务

- `execute.md`
  - 作用：按计划逐条实现并完成测试与验证
  - 适用：计划已经确定，需要稳定落地时

- `commit.md`
  - 作用：整理变更并生成原子化提交
  - 适用：每轮实现完成后，准备进入 PR / Code Review

- `init-project.md`
  - 作用：通用初始化流程模板（环境、依赖、服务、迁移、启动、健康检查）
  - 适用：接入新项目时快速拉起本地环境

---

## Skills 说明

- `.claude/skills/agent-browser/SKILL.md`
  - 浏览器自动化：页面交互、表单、截图、抓取、可视化验证

- `.claude/skills/e2e-test/SKILL.md`
  - 全链路 E2E：并行调研 + 用户旅程覆盖 + 数据库校验 + 报告输出

---

## 目录结构

- `.claude/commands/`：可复用命令模板（中文）
- `.claude/skills/`：可复用技能模板（中文）
- `.agents/plans/`：计划文档输出目录
- `scripts/install.sh`：一键安装脚本

---

## 说明

- 模板强调“上下文完整、步骤可执行、验证可落地”
- 尽量保持和原版同等流程效果，但改为中文表达与更通用描述
- 适合 Cursor / Cline / OpenCode / OpenClaw 等多种工作流
