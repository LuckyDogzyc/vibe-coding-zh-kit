---
description: 从对话内容生成产品需求文档（PRD）
argument-hint: [output-filename]
---

# Create PRD: 生成产品需求文档

## 输出文件

写入：`$ARGUMENTS`（默认：`PRD.md`）

## PRD 结构

至少包含以下章节：

1. Executive Summary（2-3 段，价值主张与 MVP 目标）
2. Mission（使命与核心原则）
3. Target Users（用户画像、技术水平、痛点）
4. MVP Scope（✅ In Scope / ❌ Out of Scope）
5. User Stories（5-8 条，As a / I want / So that）
6. Core Architecture & Patterns
7. Tools / Features（功能细则）
8. Technology Stack（含版本与关键依赖）
9. Security & Configuration
10. API Specification（如适用）
11. Success Criteria
12. Implementation Phases（3-4 阶段）
13. Future Considerations
14. Risks & Mitigations
15. Appendix（可选）

## 生成步骤

1. 回顾对话，提取显式与隐式需求
2. 补齐合理假设并保持一致性
3. 使用 markdown 高质量排版
4. 做完整性检查（章节齐全、成功标准可衡量、阶段可执行）

## 输出确认

完成后请补充：
- 文件写入路径
- PRD 摘要
- 关键假设
- 下一步建议（评审/细化/实施）
