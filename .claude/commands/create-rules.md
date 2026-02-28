---
description: 通过代码库分析生成全局规则（CLAUDE.md）
---

# Create Global Rules

目标：为项目生成 `CLAUDE.md`，内容包含项目背景、技术栈、结构、约定与验证方式。

## Phase 1: DISCOVER

- 识别项目类型（全栈/前端/API/库/CLI/Monorepo/脚本）
- 分析配置文件（package.json、tsconfig、vite.config、其他 *.config）
- 绘制目录结构（源码、测试、共享、配置）

## Phase 2: ANALYZE

- 技术栈：运行时、框架、数据库、测试、构建、Lint
- 代码模式：命名、文件结构、错误处理、类型风格、测试风格
- 关键文件：入口、核心服务、共享工具、类型定义

## Phase 3: GENERATE

在项目根目录输出 `CLAUDE.md`，建议包含：
1. 项目概览
2. 技术栈
3. 常用命令
4. 目录结构
5. 代码约定
6. 关键文件

可选章节：
- 架构说明
- API 概览
- 组件模式
- 数据库模式
- 按需加载的参考文档

## Phase 4: OUTPUT

汇报：
- 已生成文件路径
- 识别到的项目类型
- 技术栈摘要
- 目录结构摘要
- 建议下一步（补充项目特有规则、删减无关章节）
