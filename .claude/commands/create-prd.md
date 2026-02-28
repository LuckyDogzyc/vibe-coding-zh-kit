---
description: 根据对话创建产品需求文档
argument-hint: [output-filename]
---

# Create PRD：生成产品需求文档

## 概述

基于当前对话中的需求，生成一份完整、专业的 PRD。使用下面定义的结构与章节。

## 输出文件

写入：`$ARGUMENTS`（默认：`PRD.md`）

## PRD 结构

请创建结构完整的 PRD，并包含以下章节（可按已有信息调整深度）：

### 必需章节

1. Executive Summary
2. Mission
3. Target Users
4. MVP Scope
5. User Stories
6. Core Architecture & Patterns
7. Tools/Features
8. Technology Stack
9. Security & Configuration
10. API Specification（如适用）
11. Success Criteria
12. Implementation Phases
13. Future Considerations
14. Risks & Mitigations
15. Appendix（如适用）

## 执行说明

1. 提取需求：回顾对话，提取显式需求、隐式需求、约束与偏好
2. 结构化整理：放入对应章节，信息缺失时补合理假设
3. 撰写 PRD：语言清晰专业，尽量具体，使用 markdown 结构化表达
4. 质量检查：章节完整、范围合理、阶段可执行、成功标准可衡量

## 输出确认

PRD 生成后请说明：
1. 文件写入路径
2. PRD 简要摘要
3. 由于信息缺失而做的假设
4. 建议下一步（评审/细化/执行）

## 备注

- 若存在关键缺失信息，先提问再生成
- 技术型产品可强化架构与技术栈章节
- 用户型产品可强化用户故事与体验章节
