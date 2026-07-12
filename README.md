# 热身教练 · iOS & Android 原生 App

基于 [Capacitor](https://capacitorjs.com/) 将 Web App 包装为原生 iOS/Android 应用。

## 功能完整度

| 功能 | iOS | Android |
|------|:---:|:---:|
| 计时器 + 进度环 | ✅ | ✅ |
| 运动选择 + 适配 | ✅ | ✅ |
| 语音 TTS 播报 | ✅ | ✅ |
| 语音命令控制 (需麦克风权限) | ✅ | ✅ |
| 音频 Beep 音效 | ✅ | ✅ |
| 滑动手势 | ✅ | ✅ |
| 呼吸引导 | ✅ | ✅ |
| 震动反馈 | ✅ | ✅ |
| 屏幕常亮 | ✅ | ✅ |
| 完全离线可用 | ✅ | ✅ |
| 手表模式 | ✅ | ✅ |

## 一键构建

```bash
./build.sh
```

脚本会：
1. 安装 Capacitor 依赖
2. 初始化 iOS / Android 平台
3. 将 `warmup-coach.html` 同步到原生项目

## 构建 IPA (iOS)

**前提**：macOS + Xcode 16+ + Apple Developer 账号

```bash
# 1. 构建
./build.sh

# 2. 打开 Xcode
open ios/App/App.xcworkspace

# 3. Xcode 中:
#    - 选择 Product → Archive
#    - 选择 Distribute App → App Store Connect (上架) 或 Development (测试)
```

**麦克风权限**：iOS 需要配置 `NSMicrophoneUsageDescription`。
Capacitor 已自动添加，如需修改在 Xcode 的 Info.plist 中编辑。

## 构建 APK (Android)

**前提**：Android Studio + Android SDK

```bash
# 1. 构建
./build.sh

# 2. 打开 Android Studio
#    用 Android Studio 打开 android/ 目录

# 3. Build → Build Bundle(s) / APK(s) → Build APK(s)

# 4. APK 输出路径:
#    android/app/build/outputs/apk/debug/app-debug.apk
```

### 命令行构建 APK（不需要 Android Studio）

```bash
cd android
./gradlew assembleDebug
# APK: app/build/outputs/apk/debug/app-debug.apk
```

## 项目结构

```
warmup-coach-native/
├── www/index.html          ← 热身教练 Web App
├── capacitor.config.ts     ← Capacitor 配置
├── package.json
├── build.sh                ← 一键构建脚本
├── scripts/build-web.js    ← Web 资源准备
├── ios/                    ← iOS 原生项目 (自动生成)
├── android/                ← Android 原生项目 (自动生成)
└── resources/              ← App 图标和启动屏
```

## App 图标

将图标文件放入 `resources/` 目录，然后运行：

```bash
npx capacitor-assets generate
```

支持的图标格式：
- `resources/icon.png` (≥ 1024×1024，用于 iOS)
- `resources/icon-foreground.png` (Android 自适应图标)
- `resources/icon-background.png` (Android 自适应图标背景)
- `resources/splash.png` (启动屏，≥ 2732×2732)

## 发布前检查

- [ ] `capacitor.config.ts` 中 `appId` 改为你自己的包名
- [ ] 添加 App 图标
- [ ] iOS: 在 Xcode 中设置签名团队
- [ ] Android: 生成签名密钥 (`keytool -genkey ...`)
- [ ] 测试麦克风权限在真机上正常工作
