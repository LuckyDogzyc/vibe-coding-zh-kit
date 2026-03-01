# 初始化项目

运行以下命令完成本地初始化并启动项目：

## 1. 创建环境文件
```bash
cp .env.example .env
```
从模板创建本地环境配置。

## 2. 安装依赖
```bash
uv sync
```
安装 pyproject.toml 中定义的 Python 依赖。

## 3. 启动数据库
```bash
docker-compose up -d db
```
在 Docker 中启动 PostgreSQL 18（端口 5433）。

## 4. 执行数据库迁移
```bash
uv run alembic upgrade head
```
执行全部待迁移。

## 5. 启动开发服务
```bash
uv run uvicorn app.main:app --reload --port 8123
```
以热重载模式启动 FastAPI（端口 8123）。

## 6. 验证环境

```bash
curl -s http://localhost:8123/health
curl -s http://localhost:8123/health/db
```
两个接口都应返回 `{"status":"healthy"}`。

## 访问地址

- Swagger UI: http://localhost:8123/docs
- Health: http://localhost:8123/health
- Database: localhost:5433

## 输出后必须附加

在回复末尾给出「下一步可选流程」（2-3 项），示例：
1. prime（预热上下文）
2. create-rules（生成规则）
3. plan-feature（输出实施计划）

## 清理

```bash
# 停止 dev server: Ctrl+C
# 停止数据库: docker-compose down
```
