# HarmonyOS 壁纸画廊应用 / HarmonyOS Wallpaper Gallery App

基于 HarmonyOS 开发的一款壁纸浏览与选择应用，使用 ArkTS 与 ArkUI 在 DevEco Studio 中开发。

A wallpaper selection and browsing application built with HarmonyOS, developed using ArkTS and ArkUI on DevEco Studio.

## 技术栈 / Tech Stack

- **语言 / Language**：ArkTS（基于 TypeScript）
- **UI 框架 / UI Framework**：ArkUI 声明式框架
- **开发工具 / IDE**：DevEco Studio
- **目标平台 / Target Platform**：HarmonyOS

## 功能特性 / Features

- 用户注册与登录 / User registration and login
- 首页壁纸展示与横幅轮播 / Wallpaper home feed with banner display
- 壁纸分类浏览与筛选 / Wallpaper categories for browsing and filtering
- 壁纸详情预览页面 / Wallpaper detail page with preview
- 个人中心页面 / Personal center with user profile
- 基于 Column、Row、Stack、Grid 组件的响应式界面 / Responsive UI built with Column, Row, Stack and Grid components

## 项目结构 / Project Structure

```
entry/src/main/ets/
├── common/
│   ├── DataModel.ets       # 壁纸与分类数据模型 / Data models
│   └── ProfileData.ets     # 用户资料数据 / User profile data
├── entryability/
│   └── EntryAbility.ets    # 应用入口 / Application entry
├── entrybackupability/
│   └── EntryBackupAbility.ets
└── pages/
    ├── Index.ets           # 主入口页面 / Main entry page
    ├── HomePage.ets        # 首页（横幅与分类）/ Home feed
    ├── CategoryPage.ets    # 分类浏览 / Category browsing
    ├── DetailPage.ets      # 壁纸详情 / Wallpaper detail view
    ├── login.ets           # 登录页面 / Login page
    ├── register.ets        # 注册页面 / Registration page
    └── ProfilePage.ets     # 个人中心 / Personal center
```

## 关键设计 / Key Design Points

- **页面路由 / Page routing**：实现登录、首页、分类、详情、个人中心等页面间的导航跳转。
- **底部导航 / Bottom navigation**：Tab 切换不同主功能模块，还原原生应用体验。
- **组件组合 / Component composition**：复用 Column、Row、Stack、Grid 布局，实现多尺寸屏幕的响应式适配。
- **交互动画 / Interactive animation**：通过状态变量与 `animateTo` API 实现按钮交互动画。

## 运行方法 / Getting Started

1. 使用 DevEco Studio 打开项目 / Open the project in DevEco Studio.
2. 等待依赖同步（ohpm install）/ Wait for dependency sync.
3. 在 `File > Project Structure > Signing Configs` 配置签名证书 / Configure the signing certificate.
4. 在 HarmonyOS 模拟器或真机上运行 / Run the app on an emulator or real device.

## 作者 / Author

张婉茹（Wanru Zhang）- 上海建桥学院 网络工程专业 / Shanghai Jianqiao University, Network Engineering
