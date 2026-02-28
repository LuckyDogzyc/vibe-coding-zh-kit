---
description: "通过深度代码库分析与研究，创建完整功能计划"
---

# 规划一个新任务

## Feature: $ARGUMENTS

## 使命

通过系统化代码分析、外部研究与策略规划，把功能请求转化为**完整的实现计划**。

**核心原则**：在这个阶段我们不写代码。我们的目标是产出“上下文充分”的实现计划，让 AI 代理可以一次性落地成功。

**关键理念**：上下文为王。计划必须包含实现所需的全部信息——模式、必读文件、文档、验证命令——让执行代理第一次就成功。

## 规划流程

### Phase 1：理解功能

**深度分析需求：**

- 提炼要解决的核心问题
- 识别用户价值与业务影响
- 判断功能类型：新能力 / 增强 / 重构 / 修复
- 评估复杂度：Low / Medium / High
- 映射受影响系统和组件

**创建用户故事（若用户未给出则补全）：**

```text
As a <type of user>
I want to <action/goal>
So that <benefit/value>
```

### Phase 2：代码库情报收集

**必要时使用并行子代理：**

**1. 项目结构分析**

- 识别主要语言、框架、运行时版本
- 梳理目录结构与架构模式
- 识别服务/组件边界和集成点
- 找到配置文件（pyproject.toml、package.json 等）
- 找到环境搭建和构建流程

**2. 模式识别**

- 搜索代码库里的类似实现
- 识别编码规范：
  - 命名模式（CamelCase、snake_case、kebab-case）
  - 文件组织和模块结构
  - 错误处理方式
  - 日志模式与标准
- 提炼本领域常见模式
- 记录要避免的反模式
- 检查 CLAUDE.md 中项目特定规则

**3. 依赖分析**

- 列出与该功能相关的外部库
- 理解这些库在项目中的接入方式
- 查找 docs/、ai_docs/、.agents/reference 等资料
- 记录库版本与兼容性要求

**4. 测试模式**

- 识别测试框架与结构（pytest、jest 等）
- 找到可参考的同类测试
- 理解测试组织方式（单测/集成）
- 记录覆盖率与测试标准

**5. 集成点**

- 识别需要更新的已有文件
- 确定要新增的文件及位置
- 映射路由/API 注册模式
- 理解数据库/模型模式（如适用）
- 理解认证授权模式（如适用）

**澄清歧义：**

- 若此时需求不清晰，先向用户提问
- 确认实现偏好（库、方案、模式）
- 在继续前把架构决策定下来

### Phase 3：外部研究与文档

**必要时使用子代理做外部调研：**

**文档收集：**

- 研究最新版本与最佳实践
- 找官方文档并尽量给出章节锚点
- 找实现示例与教程
- 识别常见坑与已知问题
- 检查 breaking changes 与迁移指南

**技术趋势：**

- 研究当前技术栈最佳实践
- 搜索相关文章与案例
- 识别性能优化模式
- 记录安全注意事项

**整理为参考列表：**

```markdown
## Relevant Documentation

- [Library Official Docs](https://example.com/docs#section)
  - Specific feature implementation guide
  - Why: Needed for X functionality
- [Framework Guide](https://example.com/guide#integration)
  - Integration patterns section
  - Why: Shows how to connect components
```

### Phase 4：深度策略思考

重点思考：

- 这个功能如何融入现有架构？
- 关键依赖与执行顺序是什么？
- 可能出什么问题（边界、并发、错误）？
- 如何实现全面测试？
- 有哪些性能影响？
- 有哪些安全风险？
- 这个方案的可维护性如何？

### Phase 5：生成计划结构

按下述模板生成完整计划（原模板不删减，按项目填充）。

输出文件名：`.agents/plans/{kebab-case-descriptive-name}.md`

目录不存在时请创建 `.agents/plans/`。

## 质量标准

### Context Completeness ✓
- [ ] 关键模式完整识别并记录
- [ ] 外部依赖有文档链接
- [ ] 集成点映射清晰
- [ ] gotcha 与反模式已记录
- [ ] 每个任务都有可执行验证命令

### Implementation Ready ✓
- [ ] 他人无需额外上下文即可执行
- [ ] 任务按依赖顺序排列
- [ ] 每个任务原子且可独立验证
- [ ] 模式引用包含具体 file:line

### Pattern Consistency ✓
- [ ] 与现有约定一致
- [ ] 新模式有合理说明
- [ ] 不重复造轮子
- [ ] 测试方式与项目标准一致

### Information Density ✓
- [ ] 无泛泛描述，均可执行
- [ ] URL 尽量带锚点
- [ ] 任务描述信息密度高
- [ ] 验证命令可非交互运行

## 成功指标

- **One-Pass Implementation**：执行代理无需二次调研即可实现
- **Validation Complete**：每个任务至少一个有效验证命令
- **Context Rich**：陌生开发者仅靠计划即可实现
- **Confidence Score**：首轮成功置信度（#/10）

## 报告

计划完成后输出：

- 功能与方案摘要
- 计划文件完整路径
- 复杂度评估
- 关键风险与注意事项
- 一次成功置信度
