# ZC-GURA Coding Agent 沙箱镜像
# 基础镜像 tag 与 package.json 中 @cloudflare/sandbox 版本保持一致；
# 最新稳定版可用 `npm view @cloudflare/sandbox version` 查询。
FROM docker.io/cloudflare/sandbox:0.4.2

# Node.js / npm 已包含在基础镜像中；补齐 Python、Git 与常用构建工具
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      python3 python3-pip python3-venv \
      git ca-certificates curl \
      build-essential \
 && rm -rf /var/lib/apt/lists/*

# Agent 工作目录（Worker 端固定使用 /workspace）
RUN mkdir -p /workspace
WORKDIR /workspace
