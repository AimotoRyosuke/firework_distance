# アプリケーションアーキテクチャ

## 概要

このアプリケーションは、保守性、拡張性、テストの容易性を高めるために、クリーンアーキテクチャの原則に基づいたレイヤードアーキテクチャを採用します。状態管理には `Riverpod` を使用し、UI、ビジネスロジック、データ層を明確に分離します。

## レイヤー構造

アプリケーションは以下の4つのレイヤーに分割されます。依存関係は常に上位のレイヤーから下位のレイヤーへ向かいます（例：Presentation -> Application）。

```
┌───────────────────┐
│  Presentation (UI)│
└───────────────────┘
        ↓
┌───────────────────┐
│   Application     │
└───────────────────┘
        ↓
┌───────────────────┐
│      Domain       │
└───────────────────┘
        ↓
┌───────────────────┐
│  Infrastructure   │
└───────────────────┘
```

### 1. Presentation (UI) レイヤー

- **責務:** UIの表示とユーザーからの入力を担当します。
- **構成要素:**
    - **Widget:** FlutterのWidgetで画面を構築します。状態の変更は `Riverpod` を通じて `Application` レイヤーの `StateNotifier` を監視し、UIに反映します。ユーザーの操作は `StateNotifier` のメソッドを呼び出すことで `Application` レイヤーに伝えます。
- **原則:** ビジネスロジックを含めず、UIの構築と状態の反映に専念します。

### 2. Application (ビジネスロジック) レイヤー

- **責務:** アプリケーション固有のビジネスロジックを担当します。
- **構成要素:**
    - **StateNotifier / Notifier:** UIの状態を管理し、`Presentation` レイヤーに公開します。`Domain` レイヤーの `Usecase` や `Service` を呼び出し、その結果に基づいて状態を更新します。
    - **Usecase / Service:** アプリケーションのユースケースを実現するロジックを記述します。複数の `Repository` を組み合わせて複雑な処理を行うこともあります。
- **原則:** UIに依存せず、状態管理とビジネスロジックに特化します。

### 3. Domain (ドメイン) レイヤー

- **責務:** アプリケーションの核となるドメインモデルとビジネスルールを定義します。
- **構成要素:**
    - **Model:** アプリケーションで扱うデータ構造を定義します（例: `Fireworks`, `Distance`）。
    - **Repository (Abstract):** データへのアクセス方法を定義するインターフェース（抽象クラス）です。具体的な実装は `Infrastructure` レイヤーで行います。
- **原則:** アプリケーションの他のどのレイヤーにも依存しません。最も安定したレイヤーです。

### 4. Infrastructure (インフラ) レイヤー

- **責務:** データ永続化、外部APIとの通信、デバイス機能（カメラ、マイク）へのアクセスなど、フレームワークや外部ライブラリに依存する処理を担当します。
- **構成要素:**
    - **Repository (Implementation):** `Domain` レイヤーで定義された `Repository` インターフェースの具象クラスです。`DataSource` を利用して具体的なデータ操作を行います。
    - **DataSource:** データベース、API、デバイスのセンサーなど、具体的なデータソースへのアクセスを実装します。
- **原則:** `Domain` レイヤーのインターフェースを実装し、具体的な技術詳細を隠蔽します。

## 状態管理

- `Riverpod` を全面的に採用します。
- `Provider` を介して `StateNotifier` や `Repository` のインスタンスをDI（依存性注入）することで、各コンポーネントを疎結合に保ち、テストを容易にします。

## ディレクトリ構成案

```
lib/
├── main.dart
├── presentation/
│   ├── tutorial/
│   │   ├── tutorial_page_1.dart
│   │   └── tutorial_page_2.dart
│   ├── measurement/
│   │   └── measurement_page.dart
│   └── widgets/
│       └── common_button.dart
├── application/
│   ├── tutorial/
│   │   └── tutorial_view_model.dart (StateNotifier)
│   ├── measurement/
│   │   └── measurement_view_model.dart (StateNotifier)
│   └── permission/
│       └── permission_service.dart
├── domain/
│   ├── model/
│   │   └── distance.dart
│   ├── repository/
│   │   ├── permission_repository.dart (abstract)
│   │   └── fireworks_repository.dart (abstract)
│   └── usecase/
│       └── calculate_distance_usecase.dart
└── infrastructure/
    ├── repository/
    │   ├── permission_repository_impl.dart
    │   └── fireworks_repository_impl.dart
    └── datasource/
        ├── camera/
        │   └── camera_datasource.dart
        └── microphone/
            └── microphone_datasource.dart
```

## テスト戦略

- **単体テスト:** `Domain` レイヤーのモデルや `Application` レイヤーの `Usecase`, `StateNotifier` をテストします。依存する `Repository` はモックに差し替えます。
- **Widgetテスト:** `Presentation` レイヤーの `Widget` をテストします。`Riverpod` の `ProviderScope` を利用して、テスト用の `Provider` を上書きし、`StateNotifier` の状態をコントロールします。
- **E2Eテスト (インテグレーションテスト):** `flutter_driver` や `integration_test` を使用して、アプリケーション全体の振る舞いをユーザー操作の観点からテストします。

## 原則の遵守

- **SOLID原則:**
    - **単一責任の原則:** 各クラスは単一の責務を持つように設計します（例: Widgetは表示、StateNotifierは状態管理）。
    - **オープン・クローズドの原則:** `Repository` のようにインターフェースと実装を分離することで、実装の変更が他のレイヤーに影響を与えにくくし、拡張性を高めます。
    - **リスコフの置換原則:** 具象クラスがインターフェース（抽象クラス）を正しく実装することで担保します。
    - **インターフェース分離の原則:** 各レイヤーが必要とする最小限のインターフェースを定義します。
    - **依存性逆転の原則:** 上位レイヤーが下位レイヤーの実装に直接依存せず、抽象（インターフェース）に依存するようにします。`Riverpod` のDIがこれを支援します。
- **DRY原則 (Don't Repeat Yourself):**
    - ビジネスロジックを `Usecase` や `Service` に集約し、再利用性を高めます。
    - 共通のUI部品は `widgets` ディレクトリにまとめて再利用します。
