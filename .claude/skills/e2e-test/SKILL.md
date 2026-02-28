---
name: e2e-test
description: 完整端到端测试流程。并行调研代码库（结构/数据库/潜在问题）后，使用 agent-browser 覆盖用户旅程，执行截图、UI/UX 验证与数据库校验。
disable-model-invocation: true
---

# End-to-End Application Testing

## Pre-flight Check

### 1. 平台检查

```bash
uname -s
```

- Linux / Darwin：继续
- 其他平台：停止并提示需 Linux/WSL/macOS

### 2. 前端检查

确认存在可浏览器访问的 UI（前端框架、页面目录、开发服务器脚本等）。
若为纯后端项目，停止并说明该技能不适用。

### 3. agent-browser 安装

```bash
agent-browser --version
```

未安装则：
```bash
npm install -g agent-browser
agent-browser install --with-deps
agent-browser --version
```

若仍失败，停止并提示手动安装。

## Phase 1: Parallel Research（并行调研）

并行启动 3 个子任务：

1. **应用结构与用户旅程**
   - 启动方式、登录方式、页面路由、完整用户流程、关键 UI 组件

2. **数据库与数据流**
   - 数据库类型与连接变量（从 `.env.example`）
   - 全表结构与关系
   - 每个用户动作对应的数据写入/更新/删除
   - 验证查询语句

3. **Bug 预检**
   - 逻辑错误、UI/UX 问题、数据一致性风险、安全问题
   - 输出优先级 + 文件路径 + 行号

## Phase 2: 启动应用

按调研结果启动应用并验证页面可访问：

```bash
agent-browser open <url>
agent-browser screenshot e2e-screenshots/00-initial-load.png
```

## Phase 3: 创建测试任务清单

按用户旅程拆任务；每个任务包含：
- 步骤
- 期望结果
- 数据库验证点
- 关联风险

额外增加：响应式测试任务。

## Phase 4: 执行用户旅程测试

### 4a 浏览器测试

对每个关键步骤：
1. snapshot
2. 交互
3. wait
4. 截图（按旅程分目录）
5. 检查 console/errors

### 4b 数据库验证

涉及数据变更的动作必须校验：
- 记录是否正确创建/更新/删除
- 字段值是否与输入一致
- 关系完整性
- 无脏数据/孤儿数据/异常重复

### 4c 发现问题即闭环

- 记录证据（预期 vs 实际 + 截图 + 查询结果）
- 直接修复
- 重测
- 生成修复后截图

### 4d 响应式测试

至少覆盖：
- Mobile: 375x812
- Tablet: 768x1024
- Desktop: 1440x900

## Phase 5: Cleanup

- 停止 dev server
- `agent-browser close`

## Phase 6: 报告

输出摘要：
- 测试旅程数
- 截图数
- 问题数（已修复/未修复）

并询问是否导出完整报告到 `e2e-test-report.md`（包含逐旅程详情、数据库验证、截图引用、修复状态）。
