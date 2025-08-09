import 'package:firework_distance/domain/model/app_theme_mode.dart';

/// テーマ設定を操作するための抽象リポジトリ
abstract class ThemeRepository {
  /// 保存されているテーマモードを取得する
  Future<AppThemeMode> getThemeMode();

  /// テーマモードを保存する
  /// [mode] 保存するテーマモード
  Future<void> saveThemeMode(AppThemeMode mode);
}
