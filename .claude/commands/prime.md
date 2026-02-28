---
description: 预热代理，快速建立代码库全局认知
---

# Prime：加载项目上下文

## 目标

通过结构、文档、关键文件与近期变更，建立可执行级别的项目认知。

## 流程

1. 结构扫描
   - `git ls-files`
   - `tree -L 3 -I 'node_modules|__pycache__|.git|dist|build'`
2. 核心文档
   - 读取 PRD / CLAUDE.md / README / 架构文档
3. 关键文件
   - 入口文件、配置文件、模型/Schema、核心服务
4. 当前状态
   - `git log -10 --oneline`
   - `git status`

## 输出摘要（简洁可扫描）

- 项目概览（用途、类型、技术）
- 架构与目录分层
- 技术栈（语言、框架、构建、测试）
- 代码与协作原则
- 当前分支与近期改动重点
