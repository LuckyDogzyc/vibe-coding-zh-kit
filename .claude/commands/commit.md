创建一个新提交，包含当前所有未提交改动。
先运行 `git status && git diff HEAD && git status --porcelain` 查看改动范围；
将未跟踪与已修改文件加入暂存区；

提交信息要求：
- 原子化（一个提交只做一件逻辑完整的事）
- 使用合适的类型前缀：`feat` / `fix` / `docs` / `refactor` / `test` / `chore` 等
- 标题清晰说明改动目的
