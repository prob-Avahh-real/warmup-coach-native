#!/usr/bin/env bash
# =============================================
# 一键构建 iOS + Android 原生 App
# 前提: Node.js 已安装
# =============================================
set -euo pipefail
cd "$(dirname "$0")"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  🔥 热身教练 · Native App Builder${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# ---- Step 1: Install deps ----
if [[ ! -d "node_modules" ]]; then
  echo "📦 安装依赖..."
  npm install
fi

# ---- Step 2: Build web ----
echo "📄 准备 Web 资源..."
node scripts/build-web.js

# ---- Step 3: Add platforms if missing ----
if [[ ! -d "ios" ]]; then
  echo "🍎 初始化 iOS 平台..."
  npx cap add ios
fi

if [[ ! -d "android" ]]; then
  echo "🤖 初始化 Android 平台..."
  npx cap add android
fi

# ---- Step 4: Sync ----
echo "🔄 同步 Web 资源到原生项目..."
npx cap sync

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  ✅ 构建完成！${NC}"
echo ""
echo "  🍎 iOS:"
echo "     1. open ios/App/App.xcworkspace  (或运行 npm run cap:ios)"
echo "     2. 选择你的设备或 Simulator"
echo "     3. Product → Archive → Distribute App"
echo ""
echo "  🤖 Android:"
echo "     1. 用 Android Studio 打开 android/ 目录"
echo "     2. Build → Build Bundle(s) / APK(s)"
echo "     3. APK 输出在 android/app/build/outputs/apk/"
echo ""
echo "  💡 快速命令:"
echo "     npm run cap:ios      打开 Xcode"
echo "     npm run cap:android  打开 Android Studio"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
