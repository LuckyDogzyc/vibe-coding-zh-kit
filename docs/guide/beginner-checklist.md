# 0 基础也能用的 Vibe Coding 实操清单（新手版）

## 你要先知道的 3 件事

1. 你不是在“手写代码”，你是在“指挥 AI 按流程干活”
2. 每次都要在**正确项目文件夹**里操作（非常重要）
3. 不要一上来就让 AI 写代码，先让它理解项目（prime）

## 一、先准备好（一次性）

### 1) 打开终端（Terminal）
- Mac：Terminal
- Windows：建议 WSL 或 PowerShell
- Linux：任意终端

### 2) 进入你的项目文件夹
```bash
cd /你的项目路径
```

### 3) 安装流程工具（只需一次）
```bash
git clone https://github.com/LuckyDogzyc/vibe-coding-zh-kit.git /tmp/vibe-coding-zh-kit
bash /tmp/vibe-coding-zh-kit/scripts/install.sh .
```

安装成功后会出现：
- `.claude/commands/`
- `.claude/skills/`
- `.agents/plans/`

## 二、做项目的正确顺序（最关键）

### 场景 A：新建项目（从零开始）

1. 先说目标（你要做什么）
2. `create-prd`（先把需求写清）
3. `create-rules`（固化规则）
4. `init-project`（初始化环境）
5. `prime`（预热上下文）
6. `plan-feature`（拆功能计划）
7. `execute`（按计划实现）
8. `commit`（原子提交）

### 场景 B：已有项目（Brownfield）

1. 先进入项目目录
2. `prime`（先理解现场）
3. `create-rules`（补齐约定）
4. `create-prd`（本次需求）
5. `plan-feature`
6. `execute`
7. `commit`

## 三、可直接复制给 AI 的模板

### 模板 1：新项目

这是一个新项目。请按顺序执行：
1) create-prd
2) create-rules
3) init-project
4) prime
5) plan-feature（功能：XXX）
6) execute
7) commit
每一步做完先给我简短确认，再进行下一步。

### 模板 2：已有项目

这是一个已有项目。请按顺序执行：
1) prime
2) create-rules
3) create-prd（需求：XXX）
4) plan-feature
5) execute
6) commit
不要跳步骤。

## 四、常见坑（小白必看）

1. 没先 `cd` 到项目目录 → prime 分析错项目
2. 一上来就写代码 → 后面返工
3. 没有 PRD 就开工 → 方向漂移
4. 没有 plan 就 execute → 改动失控
5. 不验证就 commit → bug 溢出

## 五、一句话记忆法

- 新项目：**PRD → Rules → Init → Prime → Plan → Execute → Commit**
- 老项目：**Prime → Rules → PRD → Plan → Execute → Commit**
