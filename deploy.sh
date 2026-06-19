#!/bin/bash
set -e

echo "=============================="
echo "  阅读3 服务器版 - 一键部署"
echo "=============================="

# 检查 Docker
if ! command -v docker &>/dev/null; then
    echo "[!] 未检测到 Docker，正在安装..."
    curl -fsSL https://get.docker.com | sh
    systemctl enable docker
    systemctl start docker
fi

# 检查 Docker Compose
if ! docker compose version &>/dev/null 2>&1; then
    echo "[!] 未检测到 Docker Compose 插件，正在安装..."
    mkdir -p /usr/local/lib/docker/cli-plugins
    curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) \
        -o /usr/local/lib/docker/cli-plugins/docker-compose
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
fi

# 创建数据目录
mkdir -p data/logs data/storage

echo ""
echo "[*] 开始构建镜像（首次约 5-10 分钟）..."
docker compose build --no-cache

echo ""
echo "[*] 启动服务..."
docker compose up -d

echo ""
echo "=============================="
echo "  部署完成！"
echo "  访问地址: http://$(hostname -I | awk '{print $1}'):4396"
echo "  数据目录: $(pwd)/data"
echo "  查看日志: docker compose logs -f"
echo "=============================="
