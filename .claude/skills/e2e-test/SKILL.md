---
name: e2e测试
description: 全面的端到端测试命令。启动并行子代理来研究代码库（结构、数据库架构、潜在错误），然后使用 Vercel Agent 浏览器 CLI 测试每个用户旅程 - 截取屏幕截图、验证 UI/UX 以及查询数据库以验证记录。实施后运行以在代码审查之前验证所有内容。
disable-model-invocation: 真的
---

# 端到端应用程序测试

## 飞行前检查

### 1. 平台检查

代理浏览器需要 **Linux、WSL 或 macOS**。检查平台：
```bash
uname -s
```
- `Linux` 或 `Darwin` → 继续
- 其他任何内容（例如“MINGW”、“CYGWIN”或本机 Windows）→ 停止：

> “agent-browser 仅支持 Linux、WSL 和 macOS。它无法在本机 Windows 上运行。请从 WSL 或 Linux/macOS 环境运行此命令。”

如果平台不支持，则停止执行。

### 2. 前端检查

验证应用程序具有可通过浏览器访问的前端。检查：
- 带有服务 UI 的 dev/start 脚本的 `package.json`
- 前端框架文件（pages/、app/、src/components/、index.html等）
- 网络服务器配置

如果没有检测到前端：
>“此应用程序似乎没有浏览器可访问的前端。E2E 浏览器测试需要 UI 才能访问。对于仅后端或 API 测试，需要不同的方法。”

如果没有找到前端则停止执行。

### 3.代理浏览器安装

检查是否安装了代理浏览器：
```bash
agent-browser --version
```

如果没有找到该命令，则自动安装：
```bash
npm install -g agent-browser
```

安装后（或者如果已经安装），请确保浏览器引擎已设置：
```bash
agent-browser install --with-deps
```

`--with-deps` 标志在 Linux/WSL 上安装系统级 Chromium 依赖项。在 macOS 上它是无害的。

验证安装是否成功：
```bash
agent-browser --version
```

如果安装失败，请停止：
> “无法安装代理浏览器。请使用 `npm install -g agent-browser && agent-browser install --with-deps` 手动安装它，然后重新运行此命令。”

## 第一阶段：并行研究

使用任务工具同时启动**三个子代理**。三者并行运行。

### 子代理 1：应用程序结构和用户旅程

> 彻底研究这个代码库。返回结构化摘要，涵盖：
>
> 1. **如何启动应用程序** — 安装依赖项并运行开发服务器的确切命令，包括它所服务的 URL 和端口
> 2. **身份验证/登录** — 如果应用程序具有受保护的路由，如何创建测试帐户或登录（来自 .env.example 的凭据、种子数据或注册流程）
> 3. **每个面向用户的路由/页面** - 每个 URL 路径及其呈现的内容
> 4. **每个用户旅程** - 用户可以采取的完整流程（例如，“注册→创建个人资料→查看公共页面”）。对于每个旅程，列出具体步骤、交互（点击、表单填写、导航）和预期结果
> 5. **关键 UI 组件** — 表单、模式、下拉菜单、选择器、切换开关和其他需要测试的交互元素
>
> 详尽无遗。测试将仅涵盖您在此处确定的内容。

### 子代理 2：数据库架构和数据流

> 研究此代码库的数据库层。阅读 `.env.example` 以了解数据库连接的环境变量。不要直接读取`.env`。返回结构化摘要，涵盖：
>
> 1. **数据库类型和连接** — 使用什么数据库（Postgres、MySQL、SQLite 等）以及连接字符串的环境变量名称（来自 .env.example）
> 2. **完整架构** — 每个表、其列、类型和关系
> 3. **每个用户操作的数据流** - 对于每个面向用户的操作（表单提交、按钮单击等），准确记录创建、更新或删除的记录以及在哪些表中
> 4. **验证查询** — 对于每个数据流，提供准确的查询以验证操作后记录是否正确

### 子代理 3：漏洞搜寻

> 分析此代码库是否存在潜在的错误、问题和代码质量问题。重点关注：
>
> 1. **逻辑错误** — 不正确的条件、相差一错误、缺少空检查、竞争条件
> 2. **UI/UX 问题** — 表单中缺少错误处理、无加载状态、响应式布局损坏、可访问性问题
> 3. **数据完整性风险** - 缺少验证、潜在的孤立记录、不正确的级联行为
> 4. **安全问题** — SQL 注入、XSS、缺少身份验证检查、泄露秘密
>
> 返回包含文件路径和行号的优先列表。

**等待所有三个子代理完成后再继续。**

## 第 2 阶段：启动应用程序

使用子代理 1 的启动指令：

1. 如果需要安装依赖项
2. **在后台**启动开发服务器（例如，`npm run dev &`）
3.等待服务器就绪
4. 使用“agent-browser open <url>”打开应用程序并确认其加载
5. 获取初始屏幕截图：`agent-browser snapshot e2e-screenshots/00-initial-load.png`

## 第 3 阶段：创建任务列表

使用来自子代理 1 的用户旅程和来自子代理 3 的结果，为每个用户旅程创建一个任务（使用 TaskCreate）。每项任务应包括：

- **主题：** 旅程名称（例如，“测试配置文件创建流程”）
- **描述：** 执行步骤、预期结果、要验证的数据库记录以及来自子代理 3 的任何相关错误发现
- **activeForm：** 现在连续（例如，“测试配置文件创建流程”）

还创建一个最终任务：“跨视口的响应式测试”。

## 第 4 阶段：用户旅程测试

对于每个任务，用 TaskUpdate 将其标记为“in_progress”并执行以下命令。

### 4a。浏览器测试

使用 Vercel Agent 浏览器 CLI 进行所有浏览器交互：

```
agent-browser open <url>              # Navigate to a page
agent-browser snapshot -i             # Get interactive elements with refs (@e1, @e2...)
agent-browser click @eN               # Click element by ref
agent-browser fill @eN "text"         # Clear field and type
agent-browser select @eN "option"     # Select dropdown option
agent-browser press Enter             # Press a key
agent-browser screenshot <path>       # Save screenshot
agent-browser screenshot --annotate   # Screenshot with numbered element labels
agent-browser set viewport W H        # Set viewport (e.g., 375 812 for mobile)
agent-browser wait --load networkidle # Wait for page to settle
agent-browser console                 # Check for JS errors
agent-browser errors                  # Check for uncaught exceptions
agent-browser get text @eN            # Get element text
agent-browser get url                 # Get current URL
agent-browser close                   # End session
```

**导航或 DOM 更改后引用将无效。** 在页面导航、表单提交或动态内容更新（模态、选项卡、主题更改）后始终重新快照。

对于用户旅程中的每一步：

1. 快照获取当前refs
2. 进行交互
3.等待页面稳定
4. **截取屏幕截图** — 保存到按旅程组织的 `e2e-screenshots/` 下的描述性路径（例如，`e2e-screenshots/profile-creation/03-form-subscribed.png`）
5. **分析屏幕截图** — 使用读取工具查看屏幕截图图像。检查视觉正确性、用户体验问题、布局损坏、内容缺失、错误状态
6. 定期检查“代理浏览器控制台”和“代理浏览器错误”是否存在 JavaScript 问题

要彻底。仔细检查每个交互、每个表单字段、每个按钮。我们的目标是，当此操作完成时，UI 的每个部分都已被使用并截屏。

### 4b。数据库验证

在任何应该修改数据的交互之后（表单提交、删除、更新）：

1.查询数据库验证记录。使用 Sub-agent 2 研究中的环境变量作为连接字符串和架构文档来了解要检查的内容。
   - **Postgres：**直接使用 `psql` — 例如，`psql "$DATABASE_URL" -c "从配置文件中选择主题，其中 username = 'testuser'"`
   - **SQLite:** 直接使用 `sqlite3` — 例如，`sqlite3 db.sqlite "SELECT theme FROMprofiles WHERE username = 'testuser'"`
   - **其他数据库：** 用应用程序的语言编写一个小的临时脚本，运行它，然后删除它
2. 验证：
   - 按预期创建/更新/删除记录
   - 值与 UI 中输入的内容匹配
   - 记录之间的关系正确
   - 没有孤立或重复的记录

### 4c。问题处理

当发现问题时（UI 错误、数据库不匹配、JS 错误）：

1. **记录下来：**预期的结果与发生的情况、屏幕截图路径、相关数据库查询结果
2. **修复代码** — 直接进行更正
3. **重新运行失败的步骤**以验证修复是否有效
4. **拍摄新的屏幕截图** 确认修复

### 4d。响应式测试

对于响应式测试任务，请重新访问这些视口中的关键页面：

- **移动设备：** `代理浏览器设置视口 375 812`
- **平板电脑：** `代理浏览器设置视口 768 1024`
- **桌面：** `代理浏览器设置视口 1440 900`

在每个视口中，对每个主要页面进行屏幕截图。分析移动设备上的布局问题、溢出、对齐损坏和触摸目标尺寸。

完成每个旅程后，使用 TaskUpdate 将其任务标记为“已完成”。

## 第 5 阶段：清理

全部测试完成后：
1.停止开发服务器后台进程
2. 关闭浏览器会话：`agent-browser close`

## 第 6 阶段：报告

### 文本摘要（始终输出）

给出一个简洁的总结：

```
## E2E Testing Complete

**Journeys Tested:** [count]
**Screenshots Captured:** [count]
**Issues Found:** [count] ([count] fixed, [count] remaining)

### Issues Fixed During Testing
- [Description] — [file:line]

### Remaining Issues
- [Description] — [severity: high/medium/low] — [file:line]

### Bug Hunt Findings (from code analysis)
- [Description] — [severity] — [file:line]

### Screenshots
All saved to: `e2e-screenshots/`
```

### Markdown 导出（先询问）

文本摘要后，询问用户：

>“您希望我将完整的测试报告导出到 Markdown 文件中吗？它包括每次旅程的故障、所有屏幕截图参考、数据库验证结果和详细的发现结果 - 作为后续修复或 GitHub 问题的上下文很有用。”

如果是，请将详细报告写入项目根目录中的“e2e-test-report.md”，其中包含：
- 包含统计数据的完整摘要
- 每次旅程细分：采取的步骤、屏幕截图、数据库检查、发现的问题
- 所有问题均包含完整详细信息、修复状态和文件参考
- 代码分析子代理的错误搜寻结果
- 针对任何未解决问题的建议
