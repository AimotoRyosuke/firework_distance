# プロジェクトルール

## Reference

Please also reference the following documents as needed:

| Document | Description | File Patterns |
|----------|-------------|---------------|
| @.gemini/memories/requirement.md | プロジェクトの要件定義 | **/* |
| @.gemini/memories/architecture.md | アプリケーションアーキテクチャ | **/* |

## 開発ルール

実装に関するリクエストを受けた場合、以下のルールを遵守します。

1. **ドキュメントの同期:**
    * **アーキテクチャの変更:** 提案された実装が既存のアーキテクチャ (`architecture.md`) に変更や追加を加える場合、まず `architecture.md` を更新し、合意を得てから実装に着手します。
    * **要件の変更:** 新しい要件や変更された要件が発生した場合、まず `requirement.md` を更新し、合意を得てから実装に着手します。

2. **実装後の品質と整合性の確認:**
    * すべての実装作業が完了した後、以下の項目をチェックします。
    * **静的解析:** `flutter analyze` を実行し、新たなエラー、警告、Lint違反がないことを確認します。
    * **テスト:** `flutter test` を実行し、すべてのテストが成功することを確認します。
    * **アーキテクCHA遵守:** 実装が `architecture.md` に記載されたレイヤー構造や原則を遵守していることを確認します。
    * **ドキュメント同期:** 変更内容が `architecture.md` または `requirement.md` に影響を与えていないか最終確認します。もしドキュメントの更新が必要な場合は、速やかに編集します。
