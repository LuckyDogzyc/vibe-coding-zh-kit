---
description: 预热代理，建立代码库全局认知
---

# Prime: Load Project Context

## Objective

通过项目结构、文档、关键文件和当前 git 状态，建立可执行级理解。

## Process

### 1) 分析结构

- 运行：`git ls-files`
- 运行：`tree -L 3 -I 'node_modules|__pycache__|.git|dist|build'`

### 2) 阅读核心文档

- PRD / 规格文档
- CLAUDE.md / 全局规则
- 根目录与关键子目录 README
- 架构文档
- 数据库配置（如 drizzle、prisma、alembic）

### 3) 阅读关键文件

- 入口文件（main/index/app 等）
- 核心配置（package.json / tsconfig / pyproject）
- 模型/Schema 文件
- 核心 service/controller

### 4) 理解当前状态

- `git log -10 --oneline`
- `git status`

## Output Report

请输出可扫描摘要：
- 项目概览（用途、类型、主技术）
- 架构与目录分层
- 技术栈（语言/框架/构建/测试）
- 代码与协作原则
- 当前分支与近期改动重点
