---
name: agent-browser
description: 浏览器自动化技能。用于网站导航、页面交互、表单填写、截图、UI 测试与网页信息提取等场景。
---

# 使用 agent-browser 进行浏览器自动化

## 快速开始

```bash
agent-browser open <url>
agent-browser snapshot -i
agent-browser click @e1
agent-browser fill @e2 "text"
agent-browser close
```

## 核心工作流

1. `open` 打开页面
2. `snapshot -i` 获取可交互元素引用（如 `@e1`）
3. 基于引用执行 `click/fill/select/...`
4. 页面跳转或 DOM 明显变化后重新 `snapshot`

## 常用命令（精选）

```bash
# 导航
agent-browser open <url>
agent-browser back
agent-browser forward
agent-browser reload

# 页面分析
agent-browser snapshot -i
agent-browser snapshot -c
agent-browser snapshot -d 3

# 交互
agent-browser click @e1
agent-browser fill @e2 "xxx"
agent-browser type @e2 "xxx"
agent-browser select @e3 "value"
agent-browser press Enter
agent-browser hover @e1
agent-browser check @e1

# 信息读取
agent-browser get text @e1
agent-browser get value @e1
agent-browser get attr @e1 href
agent-browser get title
agent-browser get url

# 截图
agent-browser screenshot
agent-browser screenshot page.png
agent-browser screenshot --full

# 等待
agent-browser wait @e1
agent-browser wait --text "Success"
agent-browser wait --load networkidle
```

## 注意事项

- 元素引用在导航或动态更新后会失效，需重新 snapshot。
- 自动化脚本应优先使用稳定定位（可访问性名称、角色、标签）
- 对关键流程建议加截图与日志，便于回溯问题。
