# Architecture

## 基本方針
- 層状アーキテクチャ（レイヤードアーキテクチャ）とする
- UIとUI以外の実装を明確に分離する
- UI以外の構造はできるだけ分類するが、極度に（ドメイン）ロジック的な実装がない限りUIから直接repositoryを参照する形とする

## ディレクトリ構造

```
lib/
├── data/
│   ├── api/             外部への接続（API）
│   └── repository/      外部への接続を抽象化し、上位層に機能を提供する
├── model/               内部で利用する構造体など
├── UI/
│   ├── provider/        UI(screen)へのプロバイダー
│   └── screen/          画面実装
│       └── mixin/       画面へ提供するMixIn
└── main.dart
```

## 依存関係

### 依存の方向

下記のような依存関係を目指している（が、実現できていない）

```
UI層 → モデル層 ← データ層
```

現状現状を図でまとめる

**クラス図**


```mermaid

graph TD
    subgraph "UI層"
        UI_Screen[screen]
        UI_Provider[provider]
        UI_Mixin[mixin]
    end
    
    subgraph "モデル層"
        Model_WeatherInfo[WeatherInfo]
    end
    
    subgraph "データ層"
        Data_Repository[repository]
        Data_API[api]
    end
    
    %% 依存関係
    UI_Screen -->|invoke| Model_WeatherInfo
    UI_Provider -->|invoke| Model_WeatherInfo
    UI_Provider -->|invoke| Data_Repository
    Data_Repository -->|invoke| Data_API
    Data_Repository -->|invoke| Model_WeatherInfo
    
    %% 内部依存関係
    UI_Screen -->|invoke| UI_Provider
    UI_Screen -->|invoke| UI_Mixin
    Data_API -->|throw| Data_Repository

```

**コンポーネント図**

```mermaid

flowchart TD
    %% UI層のコンポーネント
    WeatherScreen -->|invoke| WeatherInfoNotifier
    WeatherScreen -->|render| WeatherIcon
    WeatherScreen -->|render| WeatherScreenTemperature
    WeatherScreen -->|render| WeatherScreenButtons
    SplashScreen -->|navigate to| WeatherScreen
    SplashScreen -->|implement| AfterLayoutMixin
    
    %% プロバイダー
    WeatherInfoNotifier -->|invoke| WeatherRepository
    WeatherInfoNotifier -->|manage state| WeatherInfo
    
    %% リポジトリ
    WeatherRepository -->|invoke| WeatherAPI
    WeatherRepository -->|deserialize| WeatherInfo
    
    %% モデル
    WeatherInfo -->|contains| WeatherCondition
    
    %% スタイル定義
    classDef ui fill:#C2E0FF,stroke:#6A9BC3
    classDef provider fill:#FFD700,stroke:#B8860B
    classDef repository fill:#90EE90,stroke:#2E8B57
    classDef api fill:#98FB98,stroke:#3CB371
    classDef model fill:#FFC0CB,stroke:#DB7093
    
    %% クラスの適用
    class WeatherScreen,WeatherIcon,WeatherScreenTemperature,WeatherScreenButtons,SplashScreen,AfterLayoutMixin ui
    class WeatherInfoNotifier provider
    class WeatherRepository repository
    class WeatherAPI api
    class WeatherInfo,WeatherCondition model
```