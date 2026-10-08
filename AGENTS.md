# warmup-coach-native

热身教练 · iOS & Android 原生 App 基于 [Capacitor](https://capacitorjs.com/) 将 Web App 包装为原生 iOS/Android 应用。 功能完整度 一键构建 ./build.sh 脚本会： 1. 安装 Capacitor 依赖 2. 初始化 iOS / Android 平台 3. 将 `warmup-coach.html` 同步到原生项目 构建 IPA (iOS) **前提**：macOS + Xcode 16+ + Apple Developer 账号

## 用途与 Target 判定

热身教练原生版

- 移动端：需要
- 智能硬件：需要

## 目标平台

| 平台 | 方式 | 产出 |
|------|------|------|
| Android | Capacitor / 原生 | APK |
| iOS | Capacitor / 原生 | IPA |
| 手表 | 窄屏适配 | 同 App |
| 智能戒指 | DeviceOrientation / 专用 SDK | — |
| 智能手杖或其他硬件 | DeviceMotion / BLE / 固件 | — |

## 技术栈信号

- 检测到：capacitor, ios, node

## 命令

```bash
npm install
npm run build
```

## 状态

已归档。默认只做必要修复与知识库同步，不新开大范围需求。

## 同步说明

Web 变更后 `npm run build`（若有）→ `npx cap sync`。打 APK 使用 JDK 17。

## 智能硬件约定

- 戒指：DeviceOrientation；手杖：DeviceMotion；手表窄屏 CSS
- 复用 shared / 兄弟项目模块，避免复制漂移

## 助手约束

- Loop：先定可验证 Done 与停止条件；每切片过验证环；失败回灌；详见 docs/LOOP_ENGINEERING.md
- Harness：遵循根 AGENTS「Harness Engineering」；Guide=本文件，Sensor=测试/CI；同类失误二次须沉淀规则或测试（棘轮）。详见 docs/HARNESS_ENGINEERING.md
- 遵循仓库根 `/Users/skat/AGENTS.md` 与本文件的用途判定
- 可选 Target 可搁置；不适用形态不要硬加
- 改动聚焦；公共逻辑抽离复用
