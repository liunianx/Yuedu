# 阅读3 服务器版 - 部署指南

## 快速部署（推荐）

```bash
git clone https://github.com/liunianx/Yuedu.git
cd Yuedu
chmod +x deploy.sh
./deploy.sh
```

部署完成后访问 `http://你的IP:4396`

## 手动部署

```bash
git clone https://github.com/liunianx/Yuedu.git
cd Yuedu
docker compose up -d --build
```

## 配置说明

编辑 `docker-compose.yaml` 中的环境变量：

| 变量 | 说明 | 默认值 |
|------|------|--------|
| `READER_APP_SECUREKEY` | 管理员密码 | `adminpwd` |
| `READER_APP_INVITECODE` | 注册邀请码 | `registercode` |
| `READER_APP_USERLIMIT` | 最大用户数 | `50` |
| `READER_APP_USERBOOKLIMIT` | 每用户书架上限 | `200` |

## 内存优化

本部署已针对 2GB 内存服务器优化：
- Docker 内存限制：400MB
- JVM 堆内存：64MB ~ 200MB
- 使用 Serial GC（最省内存）
- 实际占用约 150MB

## 常用命令

```bash
docker compose up -d      # 启动
docker compose down        # 停止
docker compose logs -f     # 查看日志
docker compose restart     # 重启
```

## 数据备份

```bash
tar czf reader-backup.tar.gz data/
```
