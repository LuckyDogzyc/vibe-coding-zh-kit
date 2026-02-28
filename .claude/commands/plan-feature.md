---
description: "通过深度代码库分析与外部资料研究，创建高质量功能实现计划"
---

# Plan a new task

## Feature: $ARGUMENTS

## Mission

把一个需求转化为**可一遍落地的实施计划**，通过系统化代码库分析、外部资料研究、以及策略设计来提升执行成功率。

**核心原则**：本阶段不写代码。目标是产出上下文充分、依赖清晰、验证可执行的计划文档。

**关键哲学**：Context is King。计划里要有执行所需的全部关键信息（必读文件、模式示例、文档链接、验证命令），让执行阶段尽量一次成功。

## Planning Process

### Phase 1: Feature Understanding

- 明确问题本质、用户价值、业务影响
- 判定功能类型：新能力 / 增强 / 重构 / 修复
- 评估复杂度：Low / Medium / High
- 标出受影响系统与组件

若用户未提供用户故事，生成：

```text
As a <type of user>
I want to <action/goal>
So that <benefit/value>
```

### Phase 2: Codebase Intelligence Gathering

#### 1) 项目结构分析

- 主语言、框架、运行时版本
- 目录结构与架构边界
- 配置文件位置（package.json、pyproject.toml、tsconfig 等）
- 环境搭建与构建流程

#### 2) 模式识别（必要时并行子代理）

- 查找代码库中相似实现
- 命名规范（CamelCase / snake_case / kebab-case）
- 文件组织与模块组织模式
- 错误处理模式
- 日志模式
- 反模式（anti-pattern）
- 读取 CLAUDE.md 里的项目规则

#### 3) 依赖分析

- 与该功能相关的外部依赖
- 依赖在本项目中的接入方式
- docs / ai_docs / .agents/reference 等资料
- 版本兼容约束

#### 4) 测试模式分析

- 测试框架与结构（jest / vitest / pytest / playwright 等）
- 相似功能测试样例
- 单测、集成测试组织方式
- 覆盖率与质量要求

#### 5) 集成点分析

- 需要修改的已有文件
- 需要新增的文件与路径
- 路由/API 注册模式
- 数据模型与数据库模式
- 认证授权模式（如相关）

> 若此时需求仍有歧义，先向用户提问澄清，再继续。

### Phase 3: External Research & Documentation

- 查官方文档与关键章节锚点
- 查最佳实践、常见坑、已知问题
- 查 breaking changes / migration 指南
- 汇总为“实现前必读文档”

示例格式：

```markdown
## Relevant Documentation

- [Library Official Docs](https://example.com/docs#section)
  - Why: ...
- [Framework Guide](https://example.com/guide#integration)
  - Why: ...
```

### Phase 4: Deep Strategic Thinking

重点思考：
- 功能如何契合现有架构？
- 关键依赖与执行顺序？
- 风险与失败点（边界条件、并发、异常）？
- 测试如何覆盖完整？
- 性能、安全、可维护性影响？

### Phase 5: 生成计划文档

输出到：`.agents/plans/{kebab-case-descriptive-name}.md`

计划必须包含：
- Feature 描述 / User Story / Problem Statement / Solution Statement
- Feature metadata（类型、复杂度、受影响系统、依赖）
- 必读文件（含路径与用途说明）
- 新增文件列表
- 必读文档链接（含 why）
- 需遵循的代码模式（含示例）
- 分阶段实施计划（Foundation / Core / Integration / Testing）
- 原子化步骤任务（每条都有 VALIDATE 命令）
- 测试策略（单测、集成、边界）
- 分层验证命令（lint、unit、integration、manual）
- 验收标准与完成清单
- 风险与注意事项

## Report

计划完成后请输出：
- 方案摘要
- 计划文件路径
- 复杂度评估
- 关键风险
- 一次成功置信度（#/10）
