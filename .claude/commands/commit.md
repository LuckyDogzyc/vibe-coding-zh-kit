创建一个新的 commit，包含当前所有未提交改动。

请按以下顺序执行：
1. 运行 `git status && git diff HEAD && git status --porcelain` 查看改动。
2. 将所有新增与修改文件加入暂存区（包含 untracked 文件）。
3. 生成一个**原子化**提交信息，准确描述本次改动。
4. 提交信息必须包含类型标签（例如：`feat`、`fix`、`docs`、`refactor`、`test`、`chore`）。
