# 初始化项目（通用模板）

按你项目的技术栈执行以下步骤（示例以常见 Node/Python 项目为主）：

## 1) 环境文件
```bash
cp .env.example .env
```

## 2) 安装依赖

Node：
```bash
npm install
# 或 pnpm install / yarn
```

Python（uv）：
```bash
uv sync
```

## 3) 启动依赖服务（如数据库）
```bash
docker compose up -d
```

## 4) 迁移 / 初始化数据
```bash
# 例如：
# npm run db:migrate
# uv run alembic upgrade head
```

## 5) 启动开发服务
```bash
# 例如：
# npm run dev
# uv run uvicorn app.main:app --reload
```

## 6) 健康检查
```bash
# 根据项目实际端点替换
curl -s http://localhost:3000
```

> 注意：具体命令以项目 README/脚本为准；本模板用于统一流程，而非硬编码特定框架。
