# HarmonyOS Wallpaper Gallery App

A wallpaper selection and browsing application built with HarmonyOS, developed using ArkTS and ArkUI on DevEco Studio.

## Tech Stack

- **Language**: ArkTS (TypeScript-based)
- **UI Framework**: ArkUI declarative framework
- **IDE**: DevEco Studio
- **Target Platform**: HarmonyOS

## Features

- User registration and login
- Wallpaper home feed with banner display
- Wallpaper categories for browsing and filtering
- Wallpaper detail page with preview
- Personal center with user profile
- Responsive UI built with Column, Row, Stack and Grid components

## Project Structure

```
entry/src/main/ets/
├── common/
│   ├── DataModel.ets       # Data models for wallpapers and categories
│   └── ProfileData.ets     # User profile data
├── entryability/
│   └── EntryAbility.ets    # Application entry
├── entrybackupability/
│   └── EntryBackupAbility.ets
└── pages/
    ├── Index.ets           # Main entry page
    ├── HomePage.ets        # Home feed with banner & categories
    ├── CategoryPage.ets    # Category browsing
    ├── DetailPage.ets      # Wallpaper detail view
    ├── login.ets           # Login page
    ├── register.ets        # Registration page
    └── ProfilePage.ets     # Personal center
```

## Key Design Points

- **Page routing**: Implemented page navigation across login, home, category, detail and profile pages.
- **Bottom navigation**: Tab switching between main sections for a native app feel.
- **Component composition**: Reusable Column, Row, Stack and Grid layouts for responsive multi-screen adaptation.
- **Interactive animation**: Button animations driven by state variables and the `animateTo` API.

## Getting Started

1. Open the project in DevEco Studio.
2. Wait for dependency sync (ohpm install).
3. Configure the signing certificate under `File > Project Structure > Signing Configs`.
4. Run the app on a HarmonyOS emulator or real device.

## Author

Wanru Zhang - Shanghai Jianqiao University, Network Engineering
