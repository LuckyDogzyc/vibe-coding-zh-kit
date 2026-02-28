# vibe-coding-zh-kit

面向任意 Vibe Coding 工作流的**中文命令与技能模板**。

本项目参考并对齐以下仓库的工作方式（commands + skills），做了中文化与通用化：
- https://github.com/coleam00/link-in-bio-page-builder/

## 目录结构

- `.claude/commands/`：可复用命令模板（中文）
- `.claude/skills/`：可复用技能模板（中文）
- `.agents/plans/`：计划文档输出目录

## 建议用法

1. 将本仓库中的 `.claude/commands` 与 `.claude/skills` 拷贝到你的项目
2. 在项目中根据技术栈微调命令细节（例如启动命令、测试命令、数据库连接）
3. 使用 `/plan-feature` → `/execute` → `/commit` 完成一轮闭环

## 说明

- 这些模板强调“上下文完整、步骤可执行、验证可落地”
- 已尽量保持和原版同等流程效果，但改为中文表达与更通用描述
