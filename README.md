# google_map_prac

本專案為練習 Flutter、Google Map、Clean Architecture 以及 Riverpod 狀態管理的練習專案。

## 專案簡介

- 使用 Flutter 開發跨平台 App
- 整合 Google Map，實作地圖相關功能
- 採用 Clean Architecture 架構，分離 UI、業務邏輯、資料層
- 狀態管理採用 Riverpod，提升可維護性與可測試性

## 專案資料夾結構

架構參考 DDD 架構，採用偏向Android MVVM 方式實現， 把 screen 和 provider 分再一起管理

<img width="1697" height="1503" alt="mad-arch-overview-ui" src="https://github.com/user-attachments/assets/7a018d15-ed8b-4059-9a0e-10097b07f1fb" />

```
google_map_prac/
│
├── android/                    # 原生 Android 專案目錄
├── ios/                        # 原生 iOS 專案目錄
├── lib/
│   ├── main.dart               # Flutter 進入點
│   └── feature/
│       └── trtip/
│           ├── ui/                # UI 相關
│           │   ├── pages/             # 各個頁面 (main_screen.dart, trip_provider.dart)
│           │   ├── theme/             # 主題設定（目前為空）
│           │   └── widgets/           # 可重用元件（目前為空）
│           └── model/
│               ├── domain/            # 業務邏輯層
│               │   ├── use_cases/         # 用例 (get_trips.dart, add_trip.dart, delete_trip.dart)
│               │   ├── repositories_impl/ # repository 實作 (trip_repository_impl.dart)
│               │   └── entities/          # 實體 (trip.dart)
│               ├── data/              # 資料層
│               │   ├── repositories/      # repository 介面 (trip_repository.dart)
│               │   ├── data_sources/      # 資料來源 (trip_local_datasource.dart)
│               │   └── models/            # 資料模型 (trip_model.dart, trip_model.g.dart)
│               └── core/              # 共用核心
│                   ├── utils/             # 工具類（目前為空）
│                   └── network/           # 網路相關（目前為空）
│
├── test/                        # 測試程式碼 (widget_test.dart)
├── pubspec.yaml                 # Flutter 專案設定與依賴
├── README.md                    # 專案說明文件
└── 其他設定檔（.gitignore, analysis_options.yaml, ...）
```
