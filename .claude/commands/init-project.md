# Initialize Project

> 这是通用初始化模板。请根据目标项目的技术栈与 README 做等价替换。

## 1. 创建环境文件

```bash
cp .env.example .env
```

## 2. 安装依赖

Node：
```bash
npm install
# 或 pnpm install / yarn
```

Python（uv）：
```bash
uv sync
```

## 3. 启动数据库/依赖服务

```bash
docker-compose up -d
# 或 docker compose up -d
```

## 4. 执行迁移

```bash
# 按项目替换
# npm run db:migrate
# uv run alembic upgrade head
```

## 5. 启动开发服务

```bash
# 按项目替换
# npm run dev
# uv run uvicorn app.main:app --reload
```

## 6. 验证启动结果

```bash
# 按项目替换
curl -s http://localhost:3000
```

## Access Points

- 文档页面（如有）
- 健康检查接口（如有）
- 数据库端口（如有）

## Cleanup

```bash
# 停止服务
# Ctrl+C 停掉 dev server
# docker-compose down
```
