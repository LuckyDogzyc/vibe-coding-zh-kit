---
name: agent-browser
description: 用于浏览器自动化交互（导航、点击、输入、截图、抓取、测试）。当需要操作网页、测试用户流程、填表、提取页面信息时使用。
---

# Browser Automation with agent-browser

## Quick start

```bash
agent-browser open <url>
agent-browser snapshot -i
agent-browser click @e1
agent-browser fill @e2 "text"
agent-browser close
```

## Core workflow

1. `open` 打开页面
2. `snapshot -i` 获取可交互元素及 ref
3. 用 ref 执行交互
4. 导航或 DOM 大变化后重新 snapshot

## 常用命令

### 导航
```bash
agent-browser open <url>
agent-browser back
agent-browser forward
agent-browser reload
agent-browser close
```

### 页面快照
```bash
agent-browser snapshot
agent-browser snapshot -i
agent-browser snapshot -c
agent-browser snapshot -d 3
agent-browser snapshot -s "#main"
```

### 交互
```bash
agent-browser click @e1
agent-browser dblclick @e1
agent-browser fill @e2 "text"
agent-browser type @e2 "text"
agent-browser press Enter
agent-browser hover @e1
agent-browser check @e1
agent-browser uncheck @e1
agent-browser select @e1 "value"
agent-browser upload @e1 file.pdf
agent-browser drag @e1 @e2
```

### 获取信息
```bash
agent-browser get text @e1
agent-browser get html @e1
agent-browser get value @e1
agent-browser get attr @e1 href
agent-browser get title
agent-browser get url
```

### 截图与录屏
```bash
agent-browser screenshot
agent-browser screenshot path.png
agent-browser screenshot --full
agent-browser record start ./demo.webm
agent-browser record stop
```

### 等待与状态
```bash
agent-browser wait @e1
agent-browser wait 2000
agent-browser wait --text "Success"
agent-browser wait --url "**/dashboard"
agent-browser wait --load networkidle
agent-browser is visible @e1
agent-browser is enabled @e1
agent-browser is checked @e1
```

### 调试
```bash
agent-browser open example.com --headed
agent-browser console
agent-browser errors
agent-browser trace start
agent-browser trace stop trace.zip
```

## 注意事项

- 引用（@eN）可能失效，导航后请重取 snapshot。
- 对关键步骤建议保存截图证据，方便问题复现。
- 如需机器可解析输出，加 `--json`。
