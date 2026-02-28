# 通用调用映射（Cursor / Cline / OpenCode）

这个文档告诉你：同一套 `.claude/commands` 与 `.claude/skills`，在不同 Vibe Coding 工具里怎么用。

## 一、统一流程（推荐）

无论你用哪款工具，都建议遵循：

1. `prime`：先建立项目上下文
2. `create-rules`：生成/更新项目规则（CLAUDE.md）
3. `create-prd`：沉淀需求
4. `plan-feature`：拆成可执行计划
5. `execute`：按计划落地 + 测试 + 验证
6. `commit`：原子提交

---

## 二、Cursor 映射

Cursor 没有完全一致的 slash command 系统时，可用“复制命令模板内容 + 直接发给 AI”的方式。

### 建议操作

- 在 Cursor 中打开对应模板文件，例如：
  - `.claude/commands/plan-feature.md`
- 复制内容到对话，补充参数（比如功能名）
- 让模型按模板执行

### 常用映射

- `/prime` → 发送 `prime.md` 内容
- `/plan-feature X` → 发送 `plan-feature.md` + `Feature: X`
- `/execute path/to/plan.md` → 发送 `execute.md` + 参数
- `/commit` → 发送 `commit.md`

---

## 三、Cline 映射

Cline 可直接把 `.claude` 目录作为约定上下文使用。

### 建议操作

- 将本仓库的 `.claude/commands`、`.claude/skills` 拷到你的项目
- 在提示词里明确：
  - “按 `.claude/commands/plan-feature.md` 生成计划”
  - “按 `.claude/commands/execute.md` 执行”

### 技巧

- 在 Cline 里先执行 `prime`，再开始功能开发
- `execute` 阶段强制要求“验证命令全部通过后再提交”

---

## 四、OpenCode / OpenClaw 映射

OpenCode/OpenClaw 最接近这套结构，可直接按文件语义调用。

### 建议操作

- 保留 `.claude/commands`、`.claude/skills` 在项目根目录
- 对话中直接说：
  - “按 `.claude/commands/plan-feature.md` 为 XXX 写计划”
  - “按 `.claude/commands/execute.md` 执行这个计划”

### 技能触发建议

- 浏览器自动化：`agent-browser`
- 全链路回归：`e2e-test`

---

## 五、跨工具一致性规则（重点）

为了“放到任何 vibecoding 程序都能用”，请固定这些约束：

1. **路径约定不变**：`.claude/commands`、`.claude/skills`、`.agents/plans`
2. **输出结构不变**：计划固定落到 `.agents/plans/{name}.md`
3. **验证优先**：`execute` 阶段必须先过验证命令，再允许 `commit`
4. **命令语义不变**：prime / plan-feature / execute / commit 的职责不要混
5. **可移植性优先**：模板写法避免绑定某单一 IDE 插件语法

---

## 六、最小落地清单（拷到新项目）

至少复制这几项：

- `.claude/commands/prime.md`
- `.claude/commands/plan-feature.md`
- `.claude/commands/execute.md`
- `.claude/commands/commit.md`
- `.claude/skills/agent-browser/SKILL.md`（需要浏览器自动化时）
- `.claude/skills/e2e-test/SKILL.md`（需要端到端测试时）

如果你赶时间，这就是最快可用组合。
